@implementation NLSessionActivityGoal

- (NLSessionActivityGoal)initWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4
{
  return -[NLSessionActivityGoal initWithGoalTypeIdentifier:value:requiredDistance:](self, "initWithGoalTypeIdentifier:value:requiredDistance:", a3, a4, 0);
}

- (NLSessionActivityGoal)initWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4 requiredDistance:(id)a5
{
  id v9;
  id v10;
  NLSessionActivityGoal *v11;
  NLSessionActivityGoal *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NLSessionActivityGoal;
  v11 = -[NLSessionActivityGoal init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_goalTypeIdentifier = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    if (v10)
      -[NLSessionActivityGoal setRequiredDistance:](v12, "setRequiredDistance:", v10);
  }

  return v12;
}

- (double)doubleValue
{
  unint64_t v3;
  double v4;
  HKQuantity *value;
  uint64_t v6;
  void *v7;
  double v8;

  v3 = -[NLSessionActivityGoal goalTypeIdentifier](self, "goalTypeIdentifier");
  if (v3 == 1)
  {
    value = self->_value;
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v3 == 2)
  {
    value = self->_value;
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v4 = 0.0;
  if (v3 == 3)
  {
    value = self->_value;
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;
    -[HKQuantity doubleValueForUnit:](value, "doubleValueForUnit:", v6);
    v4 = v8;

  }
  return v4;
}

- (id)_quantityForDoubleValue:(double)a3
{
  unint64_t goalTypeIdentifier;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  goalTypeIdentifier = self->_goalTypeIdentifier;
  switch(goalTypeIdentifier)
  {
    case 1uLL:
      v5 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      v5 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      v5 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      return v8;
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  HKQuantity *requiredDistance;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_goalTypeIdentifier, CFSTR("NLSessionActivityGoalGoalTypeIdentifier"));
  -[NLSessionActivityGoal doubleValue](self, "doubleValue");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("NLSessionActivityGoalValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("NLSessionActivityGoalQuantity"));
  requiredDistance = self->_requiredDistance;
  if (requiredDistance)
    objc_msgSend(v5, "encodeObject:forKey:", requiredDistance, CFSTR("NLSessionActivityGoalRequiredDistance"));

}

- (NLSessionActivityGoal)initWithCoder:(id)a3
{
  id v4;
  NLSessionActivityGoal *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLSessionActivityGoal;
  v5 = -[NLSessionActivityGoal init](&v10, sel_init);
  if (v5)
  {
    -[NLSessionActivityGoal setGoalTypeIdentifier:](v5, "setGoalTypeIdentifier:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NLSessionActivityGoalGoalTypeIdentifier")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NLSessionActivityGoalQuantity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NLSessionActivityGoal setValue:](v5, "setValue:", v6);
    }
    else
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NLSessionActivityGoalValue"));
      -[NLSessionActivityGoal _quantityForDoubleValue:](v5, "_quantityForDoubleValue:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLSessionActivityGoal setValue:](v5, "setValue:", v7);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NLSessionActivityGoalRequiredDistance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[NLSessionActivityGoal setRequiredDistance:](v5, "setRequiredDistance:", v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)goalWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4
{
  return +[NLSessionActivityGoal goalWithGoalTypeIdentifier:value:requiredDistance:](NLSessionActivityGoal, "goalWithGoalTypeIdentifier:value:requiredDistance:", a3, a4, 0);
}

+ (id)goalWithGoalTypeIdentifier:(unint64_t)a3 value:(id)a4 requiredDistance:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGoalTypeIdentifier:value:requiredDistance:", a3, v9, v8);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NLSessionActivityGoal *v4;
  BOOL v5;

  v4 = (NLSessionActivityGoal *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NLSessionActivityGoal isEqualToNLSessionActivityGoal:](self, "isEqualToNLSessionActivityGoal:", v4);
  }

  return v5;
}

- (BOOL)isEqualToNLSessionActivityGoal:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = objc_msgSend(v6, "goalTypeIdentifier");
  if (v7 == -[NLSessionActivityGoal goalTypeIdentifier](self, "goalTypeIdentifier"))
  {
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLSessionActivityGoal value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (objc_msgSend(v6, "value"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NLSessionActivityGoal value](self, "value"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      objc_msgSend(v6, "requiredDistance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLSessionActivityGoal requiredDistance](self, "requiredDistance");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v11 == (void *)v12)
      {

        v10 = 1;
      }
      else
      {
        v13 = (void *)v12;
        objc_msgSend(v6, "requiredDistance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLSessionActivityGoal requiredDistance](self, "requiredDistance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v14, "isEqual:", v15);

      }
      if (v8 == v9)
        goto LABEL_11;
    }
    else
    {
      v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[NLSessionActivityGoal value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[NLSessionActivityGoal requiredDistance](self, "requiredDistance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6 ^ v4 ^ self->_goalTypeIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NLSessionActivityGoal *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NLSessionActivityGoal *v8;

  v4 = [NLSessionActivityGoal alloc];
  v5 = -[NLSessionActivityGoal goalTypeIdentifier](self, "goalTypeIdentifier");
  -[NLSessionActivityGoal value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLSessionActivityGoal requiredDistance](self, "requiredDistance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NLSessionActivityGoal initWithGoalTypeIdentifier:value:requiredDistance:](v4, "initWithGoalTypeIdentifier:value:requiredDistance:", v5, v6, v7);

  return v8;
}

- (void)setRequiredDistance:(id)a3
{
  HKQuantity *v4;
  void *v5;
  double v6;
  double v7;
  HKQuantity *requiredDistance;
  id v9;

  v4 = (HKQuantity *)a3;
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](v4, "doubleValueForUnit:", v5);
  v7 = v6;

  if (v7 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid unit type. Expected HKQuantity of unit distance."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  requiredDistance = self->_requiredDistance;
  self->_requiredDistance = v4;

}

- (unint64_t)goalTypeIdentifier
{
  return self->_goalTypeIdentifier;
}

- (void)setGoalTypeIdentifier:(unint64_t)a3
{
  self->_goalTypeIdentifier = a3;
}

- (HKQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKQuantity)requiredDistance
{
  return self->_requiredDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredDistance, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
