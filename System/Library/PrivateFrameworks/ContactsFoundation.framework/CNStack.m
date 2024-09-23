@implementation CNStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

- (void)push:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_objects, "addObject:");
}

- (void)popAllWithHandler:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[CNStack pop](self, "pop");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v7[2](v7, v5);
      -[CNStack pop](self, "pop");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }

}

- (id)pop
{
  void *v3;

  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, self->_objects))
  {
    v3 = 0;
  }
  else
  {
    -[NSMutableArray lastObject](self->_objects, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_objects, "removeLastObject");
  }
  return v3;
}

- (id)peek
{
  return (id)-[NSMutableArray lastObject](self->_objects, "lastObject");
}

- (CNStack)init
{
  CNStack *v2;
  NSMutableArray *v3;
  NSMutableArray *objects;
  CNStack *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNStack;
  v2 = -[CNStack init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objects = v2->_objects;
    v2->_objects = v3;

    v5 = v2;
  }

  return v2;
}

- (id)popAll
{
  void *v3;

  v3 = (void *)-[NSMutableArray copy](self->_objects, "copy");
  -[NSMutableArray removeAllObjects](self->_objects, "removeAllObjects");
  return v3;
}

- (void)popWithHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[CNStack pop](self, "pop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5[2](v5, v4);

}

- (void)removeObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_objects, "removeObject:", a3);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_objects, "count");
}

@end
