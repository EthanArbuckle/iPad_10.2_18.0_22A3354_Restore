@implementation BRCDirectoryEnumerator

- (id)initForEnumeratingBelow:(id)a3 recursive:(BOOL)a4 error:(int *)a5
{
  id v8;
  BRCDirectoryEnumerator *v9;
  uint64_t v10;
  NSMutableArray *stack;
  BRCDirectoryBreadthEnumerator *v12;
  BRCDirectoryBreadthEnumerator *v13;
  BRCDirectoryEnumerator *v14;
  int *err;
  int v17;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BRCDirectoryEnumerator;
  v9 = -[BRCDirectoryEnumerator init](&v18, sel_init);
  if (!v9)
    goto LABEL_4;
  v10 = objc_opt_new();
  stack = v9->_stack;
  v9->_stack = (NSMutableArray *)v10;

  v9->_recursive = a4;
  v9->_err = a5;
  v17 = 0;
  v12 = -[BRCDirectoryBreadthEnumerator initWithParentPath:error:]([BRCDirectoryBreadthEnumerator alloc], "initWithParentPath:error:", v8, &v17);
  if (v12)
  {
    v13 = v12;
    -[NSMutableArray addObject:](v9->_stack, "addObject:", v12);

LABEL_4:
    v14 = v9;
    goto LABEL_8;
  }
  err = v9->_err;
  if (err)
    *err = v17;
  v14 = 0;
LABEL_8:

  return v14;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  BRCDirectoryBreadthEnumerator *v6;
  BRCDirectoryBreadthEnumerator *v7;
  int *err;
  id v9;
  void *v10;
  int *v11;
  int v13;
  char v14;

  v3 = (void *)MEMORY[0x1D17A6BE8](self, a2);
  if (-[NSMutableArray count](self->_stack, "count"))
  {
    -[NSMutableArray lastObject](self->_stack, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v13 = 0;
    objc_msgSend(v4, "nextObjectWithIsDir:error:", &v14, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (self->_recursive && v14)
      {
        v6 = -[BRCDirectoryBreadthEnumerator initWithParentPath:error:]([BRCDirectoryBreadthEnumerator alloc], "initWithParentPath:error:", v5, &v13);
        v7 = v6;
        if (v13)
        {
          if (v13 != 45)
          {
            err = self->_err;
            if (err)
              *err = v13;
          }
        }
        if (v6)
          -[NSMutableArray addObject:](self->_stack, "addObject:", v6);

      }
      v9 = v5;
    }
    else
    {
      if (v13)
      {
        v11 = self->_err;
        if (v11)
          *v11 = v13;
      }
      -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
      -[BRCDirectoryEnumerator nextObject](self, "nextObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
}

@end
