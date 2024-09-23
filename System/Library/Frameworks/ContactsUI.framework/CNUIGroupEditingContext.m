@implementation CNUIGroupEditingContext

- (CNUIGroupEditingContext)init
{
  CNUIGroupEditingContext *v2;
  NSArray *v3;
  NSArray *originalGroups;
  NSArray *v5;
  NSArray *addedGroups;
  NSArray *v7;
  NSArray *removedGroups;
  CNUIGroupEditingContext *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNUIGroupEditingContext;
  v2 = -[CNUIGroupEditingContext init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    originalGroups = v2->_originalGroups;
    v2->_originalGroups = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    addedGroups = v2->_addedGroups;
    v2->_addedGroups = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    removedGroups = v2->_removedGroups;
    v2->_removedGroups = v7;

    v9 = v2;
  }

  return v2;
}

- (CNUIGroupEditingContext)initWithOriginalGroups:(id)a3
{
  id v5;
  CNUIGroupEditingContext *v6;
  CNUIGroupEditingContext *v7;
  CNUIGroupEditingContext *v8;

  v5 = a3;
  v6 = -[CNUIGroupEditingContext init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalGroups, a3);
    v8 = v7;
  }

  return v7;
}

- (void)addGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[CNUIGroupEditingContext originalGroups](self, "originalGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNUIGroupEditingContext group:isInGroupArray:](self, "group:isInGroupArray:", v4, v5))
    goto LABEL_4;
  -[CNUIGroupEditingContext addedGroups](self, "addedGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNUIGroupEditingContext group:isInGroupArray:](self, "group:isInGroupArray:", v4, v6);

  if (!v7)
  {
    -[CNUIGroupEditingContext addedGroups](self, "addedGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGroupEditingContext setAddedGroups:](self, "setAddedGroups:", v8);

LABEL_4:
  }
  -[CNUIGroupEditingContext removedGroups](self, "removedGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__CNUIGroupEditingContext_addGroup___block_invoke;
  v12[3] = &unk_1E204CA68;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v9, "_cn_filter:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupEditingContext setRemovedGroups:](self, "setRemovedGroups:", v10);

}

- (void)removeGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[CNUIGroupEditingContext originalGroups](self, "originalGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNUIGroupEditingContext group:isInGroupArray:](self, "group:isInGroupArray:", v4, v5))
    goto LABEL_4;
  -[CNUIGroupEditingContext removedGroups](self, "removedGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNUIGroupEditingContext group:isInGroupArray:](self, "group:isInGroupArray:", v4, v6);

  if (!v7)
  {
    -[CNUIGroupEditingContext removedGroups](self, "removedGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIGroupEditingContext setRemovedGroups:](self, "setRemovedGroups:", v8);

LABEL_4:
  }
  -[CNUIGroupEditingContext addedGroups](self, "addedGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__CNUIGroupEditingContext_removeGroup___block_invoke;
  v12[3] = &unk_1E204CA68;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v9, "_cn_filter:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIGroupEditingContext setAddedGroups:](self, "setAddedGroups:", v10);

}

- (BOOL)group:(id)a3 isInGroupArray:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CNUIGroupEditingContext_group_isInGroupArray___block_invoke;
  v8[3] = &unk_1E204CA68;
  v9 = v5;
  v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "_cn_any:", v8);

  return (char)a4;
}

- (NSArray)groupsToDisplayForEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[CNUIGroupEditingContext originalGroups](self, "originalGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CNUIGroupEditingContext_groupsToDisplayForEditing__block_invoke;
  v8[3] = &unk_1E204CA68;
  v8[4] = self;
  objc_msgSend(v3, "_cn_filter:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIGroupEditingContext addedGroups](self, "addedGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)originalGroups
{
  return self->_originalGroups;
}

- (NSArray)addedGroups
{
  return self->_addedGroups;
}

- (void)setAddedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_addedGroups, a3);
}

- (NSArray)removedGroups
{
  return self->_removedGroups;
}

- (void)setRemovedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_removedGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedGroups, 0);
  objc_storeStrong((id *)&self->_addedGroups, 0);
  objc_storeStrong((id *)&self->_originalGroups, 0);
}

uint64_t __52__CNUIGroupEditingContext_groupsToDisplayForEditing__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "removedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "group:isInGroupArray:", v3, v4);

  return v2 ^ 1;
}

uint64_t __48__CNUIGroupEditingContext_group_isInGroupArray___block_invoke(uint64_t a1, void *a2)
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

uint64_t __39__CNUIGroupEditingContext_removeGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  return v5;
}

uint64_t __36__CNUIGroupEditingContext_addGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  return v5;
}

@end
