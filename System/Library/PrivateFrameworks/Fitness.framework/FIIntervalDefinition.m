@implementation FIIntervalDefinition

- (FIIntervalDefinition)initWithTypeIdentifier:(int64_t)a3 quantity:(id)a4
{
  id v7;
  FIIntervalDefinition *v8;
  FIIntervalDefinition *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FIIntervalDefinition;
  v8 = -[FIIntervalDefinition init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_quantity, a4);
  }

  return v9;
}

+ (id)intervalDefinitionWithTypeIdentifier:(int64_t)a3 quantity:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "intervalDefinitionWithTypeIdentifier:quantity:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)definitionFromDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FIIntervalDefinition *v18;
  void *v19;
  FIIntervalDefinition *v20;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'type' exists"), &__block_literal_global_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("Key 'quantity' exists"), &__block_literal_global_38, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'quantity' is number"), &__block_literal_global_41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'type' is number"), &__block_literal_global_44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v9;
  +[FIValidation validationWithName:test:](FIValidation, "validationWithName:test:", CFSTR("'type' is a valid identifier"), &__block_literal_global_47);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(a4) = +[FIValidation performValidations:withObject:error:](FIValidation, "performValidations:withObject:error:", v11, v5, a4);
  if ((_DWORD)a4)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    v14 = (void *)MEMORY[0x24BDD3E50];
    FICanonicalQuantityUnitForIntervalType(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("quantity"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = [FIIntervalDefinition alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FIIntervalDefinition initWithTypeIdentifier:quantity:](v18, "initWithTypeIdentifier:quantity:", objc_msgSend(v19, "integerValue"), v17);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  -[FIIntervalDefinition quantity](self, "quantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FICanonicalQuantityUnitForIntervalType(-[FIIntervalDefinition type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  v11[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIIntervalDefinition type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("quantity");
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)byChangingType:(int64_t)a3 quantity:(id)a4
{
  id v5;
  FIIntervalDefinition *v6;

  v5 = a4;
  v6 = -[FIIntervalDefinition initWithTypeIdentifier:quantity:]([FIIntervalDefinition alloc], "initWithTypeIdentifier:quantity:", a3, v5);

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end
