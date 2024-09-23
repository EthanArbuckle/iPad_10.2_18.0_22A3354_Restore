@implementation AXCategoricalDataAxisDescriptor

- (AXCategoricalDataAxisDescriptor)initWithTitle:(NSString *)title categoryOrder:(NSArray *)categoryOrder
{
  NSString *v6;
  NSArray *v7;
  AXCategoricalDataAxisDescriptor *v8;
  AXCategoricalDataAxisDescriptor *v9;
  const __CFString *v10;
  objc_super v12;

  v6 = title;
  v7 = categoryOrder;
  v12.receiver = self;
  v12.super_class = (Class)AXCategoricalDataAxisDescriptor;
  v8 = -[AXCategoricalDataAxisDescriptor init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
      v10 = (const __CFString *)v6;
    else
      v10 = &stru_24C1B9220;
    -[AXCategoricalDataAxisDescriptor setTitle:](v8, "setTitle:", v10);
    objc_storeStrong((id *)&v9->_categoryOrder, categoryOrder);
  }

  return v9;
}

- (AXCategoricalDataAxisDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle categoryOrder:(NSArray *)categoryOrder
{
  NSAttributedString *v6;
  NSArray *v7;
  AXCategoricalDataAxisDescriptor *v8;
  NSAttributedString *v9;
  NSAttributedString *v10;
  objc_super v12;

  v6 = attributedTitle;
  v7 = categoryOrder;
  v12.receiver = self;
  v12.super_class = (Class)AXCategoricalDataAxisDescriptor;
  v8 = -[AXCategoricalDataAxisDescriptor init](&v12, sel_init);
  if (v8)
  {
    if (v6)
      v9 = v6;
    else
      v9 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24C1B9220);
    v10 = v8->_attributedTitle;
    v8->_attributedTitle = v9;

    objc_storeStrong((id *)&v8->_categoryOrder, categoryOrder);
  }

  return v8;
}

- (AXCategoricalDataAxisDescriptor)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  AXCategoricalDataAxisDescriptor *v13;

  v4 = a3;
  getkAXMChartAxisTitleKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    getkAXMChartAxisTitleKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    getkAXMChartAxisTitleKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithString:", v10);

  }
  getkAXMChartCategoryAxisCategoriesKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AXCategoricalDataAxisDescriptor initWithAttributedTitle:categoryOrder:](self, "initWithAttributedTitle:categoryOrder:", v8, v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AXCategoricalDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithTitle:categoryOrder:", v5, v6);

  -[AXCategoricalDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[AXCategoricalDataAxisDescriptor attributedTitle](self, "attributedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v7, "setAttributedTitle:", v11);

  }
  return v7;
}

- (void)setTitle:(id)a3
{
  objc_class *v4;
  id v5;
  NSAttributedString *v6;
  NSAttributedString *attributedTitle;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = (NSAttributedString *)objc_msgSend([v4 alloc], "initWithString:", v5);

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = v6;

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[AXCategoricalDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCategoricalDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartAxisTitleKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  -[AXCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartCategoryAxisCategoriesKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  getkAXMChartAxisTypeCategorical();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getkAXMChartAxisTypeKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXCategoricalDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p title=%@ order=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)categoryOrder
{
  return self->_categoryOrder;
}

- (void)setCategoryOrder:(NSArray *)categoryOrder
{
  objc_setProperty_nonatomic_copy(self, a2, categoryOrder, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryOrder, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end
