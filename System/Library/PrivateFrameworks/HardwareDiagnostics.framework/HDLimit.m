@implementation HDLimit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDLimit)initWithName:(id)a3
{
  id v4;
  HDLimit *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDLimit;
  v5 = -[HDLimit init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (HDLimit)initWithCoder:(id)a3
{
  id v4;
  HDLimit *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  HDBound *upperBound;
  uint64_t v10;
  HDBound *lowerBound;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDLimit;
  v5 = -[HDLimit init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDLimit.name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDLimit.upperBound"));
    v8 = objc_claimAutoreleasedReturnValue();
    upperBound = v5->_upperBound;
    v5->_upperBound = (HDBound *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDLimit.lowerBound"));
    v10 = objc_claimAutoreleasedReturnValue();
    lowerBound = v5->_lowerBound;
    v5->_lowerBound = (HDBound *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:", self->_name);
  v6 = -[HDBound copyWithZone:](self->_upperBound, "copyWithZone:", a3);
  objc_msgSend(v5, "setUpperBound:", v6);

  v7 = -[HDBound copyWithZone:](self->_lowerBound, "copyWithZone:", a3);
  objc_msgSend(v5, "setLowerBound:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("HDLimit.name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_upperBound, CFSTR("HDLimit.upperBound"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowerBound, CFSTR("HDLimit.lowerBound"));

}

- (BOOL)measurementWithinBounds:(id)a3
{
  id v4;
  HDBound *upperBound;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  HDBound *lowerBound;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  BOOL v30;

  v4 = a3;
  upperBound = self->_upperBound;
  if (upperBound)
  {
    -[HDBound value](upperBound, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "canBeConvertedToUnit:", v7);

    if (!v8)
      goto LABEL_12;
    -[HDBound value](self->_upperBound, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "measurementByConvertingToUnit:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDBound value](self->_upperBound, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    objc_msgSend(v11, "doubleValue");
    v16 = v14 - v15;

    if (-[HDBound open](self->_upperBound, "open") && v16 <= 0.0)
      goto LABEL_11;
    v17 = -[HDBound open](self->_upperBound, "open");

    if (!v17 && v16 < 0.0)
      goto LABEL_12;
  }
  lowerBound = self->_lowerBound;
  if (!lowerBound)
    goto LABEL_15;
  -[HDBound value](lowerBound, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unit");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v4, "canBeConvertedToUnit:", v20);

  if (v21)
  {
    -[HDBound value](self->_lowerBound, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "measurementByConvertingToUnit:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDBound value](self->_lowerBound, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;
    objc_msgSend(v11, "doubleValue");
    v28 = v26 - v27;

    if (-[HDBound open](self->_lowerBound, "open") && v28 >= 0.0)
    {
LABEL_11:

      goto LABEL_12;
    }
    v30 = -[HDBound open](self->_lowerBound, "open");

    if (!v30 && v28 > 0.0)
      goto LABEL_12;
LABEL_15:
    v29 = 1;
    goto LABEL_16;
  }
LABEL_12:
  v29 = 0;
LABEL_16:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  HDLimit *v4;
  BOOL v5;

  v4 = (HDLimit *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[HDLimit isEqualToLimit:](self, "isEqualToLimit:", v4);
  }

  return v5;
}

- (BOOL)isEqualToLimit:(id)a3
{
  id v4;
  void *v5;
  HDBound *upperBound;
  void *v7;
  void *v8;
  char v9;
  HDBound *lowerBound;
  void *v11;
  void *v12;
  char v13;
  NSString *name;
  void *v15;
  char v16;

  v4 = a3;
  v5 = v4;
  upperBound = self->_upperBound;
  if (upperBound)
    goto LABEL_4;
  objc_msgSend(v4, "upperBound");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    upperBound = self->_upperBound;
LABEL_4:
    objc_msgSend(v5, "upperBound");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDBound isEqualToBound:](upperBound, "isEqualToBound:", v8);

    goto LABEL_5;
  }
  v9 = 1;
LABEL_5:
  lowerBound = self->_lowerBound;
  if (lowerBound)
  {
LABEL_8:
    objc_msgSend(v5, "lowerBound");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDBound isEqualToBound:](lowerBound, "isEqualToBound:", v12);

    goto LABEL_9;
  }
  objc_msgSend(v5, "lowerBound");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    lowerBound = self->_lowerBound;
    goto LABEL_8;
  }
  v13 = 1;
LABEL_9:
  name = self->_name;
  objc_msgSend(v5, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](name, "isEqualToString:", v15))
    v16 = v9 & v13;
  else
    v16 = 0;

  return v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDBound *upperBound;
  void *v5;
  HDBound *lowerBound;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  upperBound = self->_upperBound;
  if (upperBound)
  {
    -[HDBound dictionaryRepresentation](upperBound, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("upper-bound"));

  }
  lowerBound = self->_lowerBound;
  if (lowerBound)
  {
    -[HDBound dictionaryRepresentation](lowerBound, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("lower-bound"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HDBound)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HDBound)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerBound, 0);
  objc_storeStrong((id *)&self->_upperBound, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
