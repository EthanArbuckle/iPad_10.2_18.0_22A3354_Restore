@implementation CNUIContainerContext

- (CNUIContainerContext)initWithContainers:(id)a3
{
  id v5;
  CNUIContainerContext *v6;
  uint64_t v7;
  NSArray *selectedContainers;
  CNUIContainerContext *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNUIContainerContext;
  v6 = -[CNUIContainerContext init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "allValues");
    v7 = objc_claimAutoreleasedReturnValue();
    selectedContainers = v6->_selectedContainers;
    v6->_selectedContainers = (NSArray *)v7;

    objc_storeStrong((id *)&v6->_originalContainers, a3);
    v9 = v6;
  }

  return v6;
}

- (void)addContainer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  -[CNUIContainerContext selectedContainers](self, "selectedContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v11);

  if ((v5 & 1) == 0)
  {
    -[CNUIContainerContext selectedContainers](self, "selectedContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__CNUIContainerContext_addContainer___block_invoke;
    v12[3] = &unk_1E2050200;
    v7 = v11;
    v13 = v7;
    v8 = objc_msgSend(v6, "_cn_any:", v12);

    if ((v8 & 1) == 0)
    {
      -[CNUIContainerContext selectedContainers](self, "selectedContainers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIContainerContext setSelectedContainers:](self, "setSelectedContainers:", v10);

    }
  }

}

- (void)removeContainer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNUIContainerContext selectedContainers](self, "selectedContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    -[CNUIContainerContext selectedContainers](self, "selectedContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", v9);
    v8 = (void *)objc_msgSend(v7, "copy");
    -[CNUIContainerContext setSelectedContainers:](self, "setSelectedContainers:", v8);

  }
}

- (NSArray)addedContainers
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[CNUIContainerContext selectedContainers](self, "selectedContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CNUIContainerContext_addedContainers__block_invoke;
  v6[3] = &unk_1E2050200;
  v6[4] = self;
  objc_msgSend(v3, "_cn_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSDictionary)removedContainers
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[CNUIContainerContext originalContainers](self, "originalContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CNUIContainerContext_removedContainers__block_invoke;
  v6[3] = &unk_1E204BD40;
  v6[4] = self;
  objc_msgSend(v3, "_cn_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)resetToInitialState
{
  void *v3;
  void *v4;
  id v5;

  -[CNUIContainerContext originalContainers](self, "originalContainers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  -[CNUIContainerContext setSelectedContainers:](self, "setSelectedContainers:", v4);

}

- (NSDictionary)originalContainers
{
  return self->_originalContainers;
}

- (void)setOriginalContainers:(id)a3
{
  objc_storeStrong((id *)&self->_originalContainers, a3);
}

- (NSArray)selectedContainers
{
  return self->_selectedContainers;
}

- (void)setSelectedContainers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContainers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedContainers, 0);
  objc_storeStrong((id *)&self->_originalContainers, 0);
}

uint64_t __41__CNUIContainerContext_removedContainers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  int v6;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "selectedContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1u;
}

uint64_t __39__CNUIContainerContext_addedContainers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "originalContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6 ^ 1u;
}

uint64_t __37__CNUIContainerContext_addContainer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
