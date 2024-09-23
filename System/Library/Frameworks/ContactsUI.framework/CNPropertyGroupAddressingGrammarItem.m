@implementation CNPropertyGroupAddressingGrammarItem

+ (id)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D137F0] + 16))();
  v15 = 0;
  if ((v14 & 1) == 0)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___CNPropertyGroupAddressingGrammarItem;
    objc_msgSendSuper2(&v17, sel_propertyGroupItemWithLabeledValue_group_contact_, v8, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)emptyValueForLabel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3960], "empty", a3);
}

- (BOOL)shouldShowLanguageLabel
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[CNPropertyGroupItem group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "shouldShowLanguageLabel");
  else
    v6 = 0;

  return v6;
}

- (BOOL)modified
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPropertyGroupAddressingGrammarItem;
  if (-[CNPropertyGroupItem modified](&v9, sel_modified))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    objc_opt_class();
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (-[CNPropertyGroupAddressingGrammarItem wasAdded](self, "wasAdded"))
      v3 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D137F0] + 16))() ^ 1;
    else
      LOBYTE(v3) = 0;

  }
  return v3;
}

- (BOOL)canReorder
{
  return 1;
}

- (BOOL)shouldDisableLabelButton
{
  return 1;
}

- (BOOL)showValueWithLabelStyle
{
  return 1;
}

- (id)displayStringForValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;

  objc_opt_class();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "localizedShortDescription");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E20507A8;
  }

  return v8;
}

- (id)displayLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  objc_opt_class();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F0] + 16))())
  {
    v10.receiver = self;
    v10.super_class = (Class)CNPropertyGroupAddressingGrammarItem;
    -[CNPropertyGroupItem displayLabel](&v10, sel_displayLabel);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "localizedLanguageDescription");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (BOOL)wasAdded
{
  return self->_wasAdded;
}

- (void)setWasAdded:(BOOL)a3
{
  self->_wasAdded = a3;
}

@end
