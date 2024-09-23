@implementation BLSHPresentationDifference

- (BLSHPresentationDifference)initWithHasChanges:(BOOL)a3 insertedEnvironments:(id)a4 removedEnvironments:(id)a5
{
  id v9;
  id v10;
  BLSHPresentationDifference *v11;
  BLSHPresentationDifference *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHPresentationDifference;
  v11 = -[BLSHPresentationDifference init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_hasChanges = a3;
    objc_storeStrong((id *)&v11->_insertions, a4);
    objc_storeStrong((id *)&v12->_removals, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_hasChanges, CFSTR("hasChanges"));
  -[NSArray bs_map:](self->_insertions, "bs_map:", &__block_literal_global_117);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("adds"), 1);

  -[NSArray bs_map:](self->_removals, "bs_map:", &__block_literal_global_120);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("removes"), 1);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __41__BLSHPresentationDifference_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%p:%@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__BLSHPresentationDifference_description__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%p:%@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (NSArray)insertions
{
  return self->_insertions;
}

- (NSArray)removals
{
  return self->_removals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_insertions, 0);
}

@end
