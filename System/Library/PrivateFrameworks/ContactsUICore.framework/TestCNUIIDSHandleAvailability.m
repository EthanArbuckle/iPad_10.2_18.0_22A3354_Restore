@implementation TestCNUIIDSHandleAvailability

- (TestCNUIIDSHandleAvailability)initWithHandle:(id)a3 availability:(BOOL)a4
{
  id v7;
  TestCNUIIDSHandleAvailability *v8;
  TestCNUIIDSHandleAvailability *v9;
  TestCNUIIDSHandleAvailability *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TestCNUIIDSHandleAvailability;
  v8 = -[TestCNUIIDSHandleAvailability init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_available = a4;
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  TestCNUIIDSHandleAvailability *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke;
  v16[3] = &unk_1EA603108;
  v16[4] = self;
  v17 = v4;
  v10 = v5;
  v11 = 3221225472;
  v12 = __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke_2;
  v13 = &unk_1EA603108;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = (void *)MEMORY[0x1DF0D6388](&v10);
  LOBYTE(self) = objc_msgSend(v6, "isObject:equalToOther:withBlocks:", self, v7, v16, v8, 0, v10, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "handle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

uint64_t __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke_2(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "available");
  return v2 ^ objc_msgSend(*(id *)(a1 + 40), "available") ^ 1;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__TestCNUIIDSHandleAvailability_hash__block_invoke;
  v7[3] = &unk_1EA603130;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__TestCNUIIDSHandleAvailability_hash__block_invoke_2;
  v6[3] = &unk_1EA603130;
  v3 = (void *)MEMORY[0x1DF0D6388](v6, a2);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __37__TestCNUIIDSHandleAvailability_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __37__TestCNUIIDSHandleAvailability_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "available"));
}

- (CNUIIDSHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
