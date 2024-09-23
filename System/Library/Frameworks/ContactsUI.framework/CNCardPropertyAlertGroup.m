@implementation CNCardPropertyAlertGroup

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (id)_loadPropertyItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CNCardGroup contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardPropertyAlertGroup setLabeledValue:](self, "setLabeledValue:", v6);

  }
  -[CNCardPropertyAlertGroup labeledValue](self, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroup contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupAlertItem, "propertyGroupItemWithLabeledValue:group:contact:", v7, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setLabeledValue:(id)a3
{
  objc_storeStrong((id *)&self->_labeledValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

@end
