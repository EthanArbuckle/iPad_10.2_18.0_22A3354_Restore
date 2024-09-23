@implementation HKRatioValue

- (HKRatioValue)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)ratioValueWithNumerator:(id)a3 andDenominator:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNumerator:denominator:", v7, v6);

  return v8;
}

- (id)_initWithNumerator:(id)a3 denominator:(id)a4
{
  id v6;
  id v7;
  HKRatioValue *v8;
  uint64_t v9;
  HKCodedQuantity *numerator;
  uint64_t v11;
  HKCodedQuantity *denominator;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKRatioValue;
  v8 = -[HKRatioValue init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    numerator = v8->_numerator;
    v8->_numerator = (HKCodedQuantity *)v9;

    v11 = objc_msgSend(v7, "copy");
    denominator = v8->_denominator;
    v8->_denominator = (HKCodedQuantity *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRatioValue numerator](self, "numerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRatioValue denominator](self, "denominator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p numerator = %@, denominator = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKRatioValue *v4;
  HKRatioValue *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (HKRatioValue *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKRatioValue numerator](self, "numerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRatioValue numerator](v5, "numerator");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKRatioValue numerator](v5, "numerator");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        -[HKRatioValue numerator](self, "numerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKRatioValue numerator](v5, "numerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_15;
      }
      -[HKRatioValue denominator](self, "denominator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRatioValue denominator](v5, "denominator");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_17:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKRatioValue denominator](v5, "denominator");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HKRatioValue denominator](self, "denominator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKRatioValue denominator](v5, "denominator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRatioValue)initWithCoder:(id)a3
{
  id v4;
  HKRatioValue *v5;
  uint64_t v6;
  HKCodedQuantity *numerator;
  uint64_t v8;
  HKCodedQuantity *denominator;
  HKRatioValue *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKRatioValue;
  v5 = -[HKRatioValue init](&v12, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NumeratorKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  numerator = v5->_numerator;
  v5->_numerator = (HKCodedQuantity *)v6;

  if (!v5->_numerator)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DenominatorKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  denominator = v5->_denominator;
  v5->_denominator = (HKCodedQuantity *)v8;

  if (v5->_denominator)
LABEL_4:
    v10 = v5;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  HKCodedQuantity *numerator;
  id v5;

  numerator = self->_numerator;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", numerator, CFSTR("NumeratorKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_denominator, CFSTR("DenominatorKey"));

}

- (HKCodedQuantity)numerator
{
  return self->_numerator;
}

- (HKCodedQuantity)denominator
{
  return self->_denominator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denominator, 0);
  objc_storeStrong((id *)&self->_numerator, 0);
}

@end
