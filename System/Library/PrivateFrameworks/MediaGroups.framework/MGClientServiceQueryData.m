@implementation MGClientServiceQueryData

- (MGClientServiceQueryData)initWithPredicate:(id)a3 updateHandler:(id)a4
{
  id v7;
  id v8;
  MGClientServiceQueryData *v9;
  MGClientServiceQueryData *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MGClientServiceQueryData;
  v9 = -[MGClientServiceQueryData init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    v11 = MEMORY[0x219A09664](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

  }
  return v10;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
