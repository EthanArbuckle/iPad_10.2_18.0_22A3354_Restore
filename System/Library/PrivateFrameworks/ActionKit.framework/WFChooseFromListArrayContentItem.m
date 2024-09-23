@implementation WFChooseFromListArrayContentItem

+ (id)itemWithObjects:(id)a3 named:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "if_compactMap:", &__block_literal_global_24427);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithItems:named:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __58__WFChooseFromListArrayContentItem_itemWithObjects_named___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", a2);
}

- (NSArray)items
{
  return (NSArray *)-[WFChooseFromListArrayContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedPluralString(CFSTR("%d items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFChooseFromListArrayContentItem items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v4[2](v4, v8);

  return 1;
}

- (id)allowedClassesForDecodingInternalRepresentations
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
