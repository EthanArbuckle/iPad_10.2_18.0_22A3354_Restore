@implementation MockBrowserSavedState

- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3
{
  -[MockBrowserSavedState savedTabsStateForBrowserControllerWithUUID:initialURLString:](self, "savedTabsStateForBrowserControllerWithUUID:initialURLString:", a3, self->_initalURLString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3 initialURLString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t tabsCount;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v21 = objc_alloc_init(MEMORY[0x1E0D4EF38]);
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUUIDString:", v8);

  objc_msgSend(v21, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  tabsCount = self->_tabsCount;
  if (tabsCount <= 1)
    v12 = 1;
  else
    v12 = self->_tabsCount;
  if (tabsCount)
    v13 = v12;
  else
    v13 = 32;
  do
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D4EDC8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUUIDString:", v16);

    objc_msgSend(v14, "setTitle:", CFSTR("[Untitled]"));
    objc_msgSend(v6, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOwningBrowserWindowUUIDString:", v17);

    objc_msgSend(v14, "setUrl:", v7);
    objc_msgSend(v14, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

    --v13;
  }
  while (v13);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D4F260]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E9D622A8, *MEMORY[0x1E0D4F250]);

  return v20;
}

- (BOOL)activeDocumentIsValidForBrowserControllerWithUUID:(id)a3
{
  return 1;
}

- (unint64_t)tabsCount
{
  return self->_tabsCount;
}

- (void)setTabsCount:(unint64_t)a3
{
  self->_tabsCount = a3;
}

- (NSString)initalURLString
{
  return self->_initalURLString;
}

- (void)setInitalURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initalURLString, 0);
}

@end
