@implementation WFNumberContentItem

- (NSNumber)number
{
  return (NSNumber *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)roundedName
{
  void *v3;
  void *v4;
  void *v5;

  -[WFNumberContentItem number](self, "number");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNumberContentItem maximumFractionDigitsForDisplay](self, "maximumFractionDigitsForDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfNameWithMaximumFractionDigits:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  unsigned int v9;
  void *v10;
  objc_super v12;

  v4 = (void (**)(id, void *))a3;
  -[WFContentItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNumberContentItem roundedName](self, "roundedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFNumberContentItem;
    v9 = -[WFContentItem getListSubtitle:](&v12, sel_getListSubtitle_, 0);
    v8 = v9;
    if (v4 && v9)
    {
      -[WFNumberContentItem roundedName](self, "roundedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10);

      v8 = 1;
    }
  }

  return v8;
}

- (void)copyStateToItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v7;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  -[WFNumberContentItem maximumFractionDigitsForDisplay](self, "maximumFractionDigitsForDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaximumFractionDigitsForDisplay:", v6);

}

- (WFNumberContentItem)initWithCoder:(id)a3
{
  id v4;
  WFNumberContentItem *v5;
  void *v6;
  uint64_t v7;
  NSNumber *maximumFractionDigitsForDisplay;
  WFNumberContentItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFNumberContentItem;
  v5 = -[WFContentItem initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(CFSTR("WFNumberContentItem"), "stringByAppendingString:", CFSTR("maximumFractionDigitsForDisplay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    maximumFractionDigitsForDisplay = v5->_maximumFractionDigitsForDisplay;
    v5->_maximumFractionDigitsForDisplay = (NSNumber *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFNumberContentItem;
  v4 = a3;
  -[WFContentItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(CFSTR("WFNumberContentItem"), "stringByAppendingString:", CFSTR("maximumFractionDigitsForDisplay"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNumberContentItem maximumFractionDigitsForDisplay](self, "maximumFractionDigitsForDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSNumber)maximumFractionDigitsForDisplay
{
  return self->_maximumFractionDigitsForDisplay;
}

- (void)setMaximumFractionDigitsForDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_maximumFractionDigitsForDisplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumFractionDigitsForDisplay, 0);
}

+ (id)coercions
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_opt_class();
  +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_19892);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v5 = objc_opt_class();
  +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_11_19894);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)itemWithNumber:(id)a3 maximumFractionDigitsForDisplay:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFNumberContentItem.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("number"));

  }
  objc_msgSend(v7, "wfNameWithMaximumFractionDigits:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithObject:named:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaximumFractionDigitsForDisplay:", v8);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Scripting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Number"), CFSTR("Number"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Numbers"), CFSTR("Numbers"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Numbers"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 3;
}

id __32__WFNumberContentItem_coercions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "roundedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__WFNumberContentItem_coercions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  int v11;

  v2 = (void *)MEMORY[0x24BDD1518];
  v3 = a2;
  objc_msgSend(v3, "number");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "decimalValue");
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    v11 = 0;
  }
  objc_msgSend(v2, "decimalNumberWithDecimal:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
