@implementation AXMCategoricalDataAxisDescriptor

- (AXMCategoricalDataAxisDescriptor)initWithTitle:(id)a3 categoryOrder:(id)a4
{
  id v6;
  id v7;
  AXMCategoricalDataAxisDescriptor *v8;
  AXMCategoricalDataAxisDescriptor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXMCategoricalDataAxisDescriptor;
  v8 = -[AXMCategoricalDataAxisDescriptor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXMCategoricalDataAxisDescriptor setTitle:](v8, "setTitle:", v6);
    objc_storeStrong((id *)&v9->_categoryOrder, a4);
  }

  return v9;
}

- (AXMCategoricalDataAxisDescriptor)initWithAttributedTitle:(id)a3 categoryOrder:(id)a4
{
  id v7;
  id v8;
  AXMCategoricalDataAxisDescriptor *v9;
  AXMCategoricalDataAxisDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMCategoricalDataAxisDescriptor;
  v9 = -[AXMCategoricalDataAxisDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributedTitle, a3);
    objc_storeStrong((id *)&v10->_categoryOrder, a4);
  }

  return v10;
}

- (AXMCategoricalDataAxisDescriptor)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  AXMCategoricalDataAxisDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartAxisTitleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartAxisTitleKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartAxisTitleKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithString:", v8);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAXMChartCategoryAxisCategoriesKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AXMCategoricalDataAxisDescriptor initWithAttributedTitle:categoryOrder:](self, "initWithAttributedTitle:categoryOrder:", v6, v9);

  return v10;
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
  -[AXMCategoricalDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithTitle:categoryOrder:", v5, v6);

  -[AXMCategoricalDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[AXMCategoricalDataAxisDescriptor attributedTitle](self, "attributedTitle");
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

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (NSAttributedString *)objc_msgSend([v4 alloc], "initWithString:", v5);

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = v6;

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[AXMCategoricalDataAxisDescriptor attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isCategoricalAxis
{
  return 1;
}

- (double)lowerBound
{
  return 0.0;
}

- (double)upperBound
{
  void *v2;
  double v3;

  -[AXMCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(unint64_t)objc_msgSend(v2, "count");

  return v3;
}

- (double)normalizedAxisValueForValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;

  v4 = a3;
  -[AXMCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = 0.0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AXMCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double)v6 / (double)(unint64_t)objc_msgSend(v8, "count");

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMCategoricalDataAxisDescriptor title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kAXMChartAxisTitleKey"));

  -[AXMCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kAXMChartCategoryAxisCategoriesKey"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("categorical"), CFSTR("kAXMChartAxisType"));
  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMCategoricalDataAxisDescriptor title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMCategoricalDataAxisDescriptor categoryOrder](self, "categoryOrder");
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

- (void)setCategoryOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryOrder, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end
