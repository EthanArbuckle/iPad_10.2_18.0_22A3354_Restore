@implementation MSVRandomDistribution

- (MSVRandomDistribution)init
{
  MSVARC4RandomSource *v3;
  MSVRandomDistribution *v4;

  v3 = objc_alloc_init(MSVARC4RandomSource);
  v4 = -[MSVRandomDistribution initWithRandomSource:lowestValue:highestValue:](self, "initWithRandomSource:lowestValue:highestValue:", v3, 0, 0);

  return v4;
}

- (MSVRandomDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5
{
  id v9;
  MSVRandomDistribution *v10;
  MSVRandomDistribution *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSVRandomDistribution;
  v10 = -[MSVRandomDistribution init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_source, a3);
    v11->_lowestValue = a4;
    v11->_highestValue = a5;
  }

  return v11;
}

- (MSVRandomDistribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  MSVRandomDistribution *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lowest"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("highest"));

  v8 = -[MSVRandomDistribution initWithRandomSource:lowestValue:highestValue:](self, "initWithRandomSource:lowestValue:highestValue:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  MSVRandom *source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_lowestValue, CFSTR("lowest"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_highestValue, CFSTR("highest"));

}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  int64_t lowestValue;
  unint64_t v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  lowestValue = self->_lowestValue;
  v4 = lowestValue & ~(lowestValue >> 63);
  if (v4 > a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v16[0] = CFSTR("lowestInclusive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", lowestValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v16[1] = CFSTR("highestInclusive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_highestValue);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v16[2] = CFSTR("upper");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, CFSTR("upper bound provided is less than lowestInclusive"), v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  v5 = self->_highestValue & ~(self->_highestValue >> 63);
  if (v5 >= a3 - 1)
    v5 = a3 - 1;
  return -[MSVRandom nextIntWithUpperBound:](self->_source, "nextIntWithUpperBound:", v5 - lowestValue + 1) + v4;
}

- (int64_t)lowestValue
{
  return self->_lowestValue;
}

- (int64_t)highestValue
{
  return self->_highestValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
