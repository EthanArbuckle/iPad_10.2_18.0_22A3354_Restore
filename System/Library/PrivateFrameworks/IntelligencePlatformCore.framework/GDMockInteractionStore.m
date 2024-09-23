@implementation GDMockInteractionStore

- (GDMockInteractionStore)initWithInteractions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  GDMockInteractionStore *v8;
  uint64_t v9;
  NSArray *interactions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GDMockInteractionStore;
  v8 = -[GDMockInteractionStore init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    interactions = v8->_interactions;
    v8->_interactions = (NSArray *)v9;

  }
  return v8;
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;

  v13 = objc_msgSend_count(self->_interactions, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7);
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (a5 && v13 - 1 >= a6)
  {
    v15 = objc_msgSend_count(self->_interactions, v10, v11, v12);
    if (v15 - a6 >= a5)
      objc_msgSend_subarrayWithRange_(self->_interactions, v16, a6, a5);
    else
      objc_msgSend_subarrayWithRange_(self->_interactions, v16, a6, v15 - a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
}

@end
