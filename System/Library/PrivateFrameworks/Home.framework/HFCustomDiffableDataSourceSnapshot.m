@implementation HFCustomDiffableDataSourceSnapshot

uint64_t __53__HFCustomDiffableDataSourceSnapshot_itemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

id __77__HFCustomDiffableDataSourceSnapshot_itemIdentifiersInSectionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v3, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)itemIdentifiers
{
  void *v2;
  void *v3;

  -[HFCustomDiffableDataSourceSnapshot sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_224);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFCustomDiffableDataSourceSnapshot sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__HFCustomDiffableDataSourceSnapshot_itemIdentifiersInSectionWithIdentifier___block_invoke;
  v9[3] = &unk_1EA73F9B0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[HFCustomDiffableDataSourceSnapshot sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[HFCustomDiffableDataSourceSnapshot itemIdentifiers](self, "itemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
