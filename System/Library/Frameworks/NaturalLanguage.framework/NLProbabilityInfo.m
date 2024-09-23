@implementation NLProbabilityInfo

- (NLProbabilityInfo)initWithProbability:(double)a3 flags:(unint64_t)a4
{
  NLProbabilityInfo *v6;
  NLProbabilityInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NLProbabilityInfo;
  v6 = -[NLProbabilityInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_probability = a3;
    v6->_log10Probability = log10(a3);
    v7->_isValid = 1;
    v7->_probabilityFlags = a4;
  }
  return v7;
}

- (NLProbabilityInfo)initWithLog10Probability:(double)a3 flags:(unint64_t)a4
{
  NLProbabilityInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NLProbabilityInfo;
  v6 = -[NLProbabilityInfo init](&v8, sel_init);
  if (v6)
  {
    v6->_probability = __exp10(a3);
    v6->_log10Probability = a3;
    v6->_isValid = 1;
    v6->_probabilityFlags = a4;
  }
  return v6;
}

- (NLProbabilityInfo)initWithInvalidProbability
{
  NLProbabilityInfo *result;

  result = -[NLProbabilityInfo initWithLog10Probability:flags:](self, "initWithLog10Probability:flags:", 0, -30.0);
  if (result)
  {
    *(_OWORD *)&result->_probability = xmmword_1A36F7530;
    result->_isValid = 0;
    result->_probabilityFlags = 0;
  }
  return result;
}

- (id)description
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NLProbabilityInfo log10Probability](self, "log10Probability");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("logprob %.2g"), v3);
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  uint64_t v5;

  -[NLProbabilityInfo log10Probability](self, "log10Probability");
  v4 = (unint64_t)(v3 * -10000000.0);
  if (-[NLProbabilityInfo isValid](self, "isValid"))
    v5 = 0x40000000;
  else
    v5 = 0;
  return v5 ^ -[NLProbabilityInfo probabilityFlags](self, "probabilityFlags") ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  NLProbabilityInfo *v4;
  NLProbabilityInfo *v5;
  _BOOL4 v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = (NLProbabilityInfo *)a3;
  v5 = v4;
  v11 = 1;
  if (v4 != self)
  {
    if (!v4
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v6 = -[NLProbabilityInfo isValid](self, "isValid"), v6 != -[NLProbabilityInfo isValid](v5, "isValid"))
      || (v7 = -[NLProbabilityInfo probabilityFlags](self, "probabilityFlags"),
          v7 != -[NLProbabilityInfo probabilityFlags](v5, "probabilityFlags"))
      || (-[NLProbabilityInfo log10Probability](self, "log10Probability"),
          v9 = v8,
          -[NLProbabilityInfo log10Probability](v5, "log10Probability"),
          v9 != v10))
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLProbabilityInfo requires keyed coding"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  -[NLProbabilityInfo log10Probability](self, "log10Probability");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("NLLog10Probability"));
  objc_msgSend(v5, "encodeBool:forKey:", -[NLProbabilityInfo isValid](self, "isValid"), CFSTR("NLIsValid"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NLProbabilityInfo probabilityFlags](self, "probabilityFlags"), CFSTR("NLProbabilityFlags"));

}

- (NLProbabilityInfo)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  NLProbabilityInfo *v9;
  NLProbabilityInfo *v10;
  id v12;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLProbabilityInfo requires keyed coding"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NLLog10Probability"));
  v6 = v5;
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NLIsValid"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NLProbabilityFlags"));
  if (v7)
    v9 = -[NLProbabilityInfo initWithLog10Probability:flags:](self, "initWithLog10Probability:flags:", v8, v6);
  else
    v9 = -[NLProbabilityInfo initWithInvalidProbability](self, "initWithInvalidProbability");
  v10 = v9;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)probability
{
  return self->_probability;
}

- (double)log10Probability
{
  return self->_log10Probability;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (unint64_t)probabilityFlags
{
  return self->_probabilityFlags;
}

@end
