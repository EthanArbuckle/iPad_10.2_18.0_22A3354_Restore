@implementation MTInMemorySyncChangeStore

- (MTInMemorySyncChangeStore)init
{
  MTInMemorySyncChangeStore *v2;
  uint64_t v3;
  NSMutableArray *changes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTInMemorySyncChangeStore;
  v2 = -[MTInMemorySyncChangeStore init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    changes = v2->_changes;
    v2->_changes = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)persistChanges:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *changes;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  changes = self->_changes;
  self->_changes = v4;

}

- (id)loadChanges
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = (void *)-[NSMutableArray copy](self->_changes, "copy");
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableArray)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
  objc_storeStrong((id *)&self->_changes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
