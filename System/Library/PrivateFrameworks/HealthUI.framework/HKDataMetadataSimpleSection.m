@implementation HKDataMetadataSimpleSection

- (HKDataMetadataSimpleSection)initWithTitle:(id)a3
{
  id v5;
  HKDataMetadataSimpleSection *v6;
  HKDataMetadataSimpleSection *v7;
  NSMutableArray *v8;
  NSMutableArray *rows;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKDataMetadataSimpleSection;
  v6 = -[HKDataMetadataSimpleSection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_title, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rows = v7->_rows;
    v7->_rows = v8;

  }
  return v7;
}

- (void)addText:(id)a3 detail:(id)a4 baseIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  _HKDataMetadataSimpleRow *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(_HKDataMetadataSimpleRow);
  -[_HKDataMetadataSimpleRow setText:](v11, "setText:", v10);

  -[_HKDataMetadataSimpleRow setDetail:](v11, "setDetail:", v9);
  -[_HKDataMetadataSimpleRow setBaseIdentifier:](v11, "setBaseIdentifier:", v8);

  -[NSMutableArray addObject:](self->_rows, "addObject:", v11);
}

- (id)_rowTitles
{
  return (id)-[NSMutableArray hk_map:](self->_rows, "hk_map:", &__block_literal_global_54);
}

uint64_t __41__HKDataMetadataSimpleSection__rowTitles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "detail");
}

- (id)_valueForRowWithTitle:(id)a3
{
  id v4;
  NSMutableArray *rows;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  rows = self->_rows;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HKDataMetadataSimpleSection__valueForRowWithTitle___block_invoke;
  v11[3] = &unk_1E9C43660;
  v12 = v4;
  v6 = v4;
  -[NSMutableArray hk_filter:](rows, "hk_filter:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __53__HKDataMetadataSimpleSection__valueForRowWithTitle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "detail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)sectionTitle
{
  return self->_title;
}

- (unint64_t)numberOfRowsInSection
{
  return -[NSMutableArray count](self->_rows, "count");
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  HKDataMetadataSimpleTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("SimpleCellReuseIdentifier"));
  v6 = (HKDataMetadataSimpleTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = -[HKDataMetadataSimpleTableViewCell initWithReuseIdentifier:]([HKDataMetadataSimpleTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("SimpleCellReuseIdentifier"));
  -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell titleTextLabel](v6, "titleTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v7, "detail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "detail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](v6, "subtitleTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  objc_msgSend(v7, "baseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell updateAutomationIdentifiersWith:](v6, "updateAutomationIdentifiersWith:", v13);

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
