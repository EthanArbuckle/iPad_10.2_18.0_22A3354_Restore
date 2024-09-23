@implementation HKAccessibilityValue

- (HKAccessibilityValue)initWithValueTitle:(id)a3 valueType:(id)a4 valueDescription:(id)a5 valueAsNumber:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKAccessibilityValue *v15;
  HKAccessibilityValue *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKAccessibilityValue;
  v15 = -[HKAccessibilityValue init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_valueTitle, a3);
    objc_storeStrong((id *)&v16->_valueType, a4);
    objc_storeStrong((id *)&v16->_valueDescription, a5);
    objc_storeStrong((id *)&v16->_valueAsNumber, a6);
  }

  return v16;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKAccessibilityValue %p:"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityValue valueTitle](self, "valueTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("  valueTitle = '%@'"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityValue valueType](self, "valueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("  valueType = '%@'"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityValue valueDescription](self, "valueDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("  valueDescription = '%@'"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilityValue valueAsNumber](self, "valueAsNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("  valueAsNumber = %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)valueTitle
{
  return self->_valueTitle;
}

- (NSString)valueType
{
  return self->_valueType;
}

- (NSString)valueDescription
{
  return self->_valueDescription;
}

- (NSNumber)valueAsNumber
{
  return self->_valueAsNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueAsNumber, 0);
  objc_storeStrong((id *)&self->_valueDescription, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_valueTitle, 0);
}

@end
