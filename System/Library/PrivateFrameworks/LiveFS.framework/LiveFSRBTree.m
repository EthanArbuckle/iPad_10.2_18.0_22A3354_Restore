@implementation LiveFSRBTree

- (LiveFSRBTree)initWithComparitor:(id)a3
{
  id v4;
  LiveFSRBTree *v5;
  uint64_t v6;
  NSMutableArray *ourData;
  rb_tree *v8;
  BOOL v9;
  uint64_t v10;
  id ourComparitor;
  id v12;
  rb_tree_t *btree;
  const rb_tree_ops_t *btOps;
  LiveFSRBTree *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LiveFSRBTree;
  v5 = -[LiveFSRBTree init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    ourData = v5->_ourData;
    v5->_ourData = (NSMutableArray *)v6;

    v5->btOps = ($B0C332B1F6907B824932E005B4B1DDB9 *)malloc_type_malloc(0x20uLL, 0x108004072235B19uLL);
    v8 = (rb_tree *)malloc_type_malloc(0x40uLL, 0x80040A284212CuLL);
    v5->btree = v8;
    if (v5->_ourData)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9 || !v5->btOps)
    {
      v15 = 0;
      goto LABEL_10;
    }
    v10 = MEMORY[0x22E2FAC64](v4);
    ourComparitor = v5->ourComparitor;
    v5->ourComparitor = (id)v10;

    v5->btOps->var1 = liveFSFPCompareKey;
    v5->btOps->var0 = liveFSFPCompareNode;
    v12 = (id)MEMORY[0x22E2FAC64](v4);
    v5->btOps->var3 = v12;

    btree = v5->btree;
    btOps = (const rb_tree_ops_t *)v5->btOps;
    btOps->rbto_node_offset = 0;
    rb_tree_init(btree, btOps);
  }
  v15 = v5;
LABEL_10:

  return v15;
}

+ (id)newWithComparitor:(id)a3
{
  id v3;
  LiveFSRBTree *v4;

  v3 = a3;
  v4 = -[LiveFSRBTree initWithComparitor:]([LiveFSRBTree alloc], "initWithComparitor:", v3);

  return v4;
}

- (void)dealloc
{
  rb_tree *btree;
  void *v4;
  void *v5;
  $B0C332B1F6907B824932E005B4B1DDB9 *btOps;
  void *var3;
  objc_super v8;

  btree = self->btree;
  if (btree)
  {
    v4 = rb_tree_iterate(btree, 0, 1u);
    if (v4)
    {
      v5 = v4;
      do
      {
        rb_tree_remove_node(self->btree, v5);
        free(v5);
        v5 = rb_tree_iterate(self->btree, 0, 1u);
      }
      while (v5);
    }
    free(self->btree);
  }
  btOps = self->btOps;
  if (btOps)
  {
    var3 = btOps->var3;
    self->btOps->var3 = 0;
    free(self->btOps);

  }
  v8.receiver = self;
  v8.super_class = (Class)LiveFSRBTree;
  -[LiveFSRBTree dealloc](&v8, sel_dealloc);
}

- (unint64_t)count
{
  return rb_tree_count(self->btree);
}

- (void)addDataBuffer:(id)a3
{
  -[NSMutableArray addObject:](self->_ourData, "addObject:", a3);
}

- (void)addEntry:(int64_t)a3
{
  _QWORD *v5;
  NSObject *v6;

  v5 = malloc_type_malloc(0x20uLL, 0x10800409B94441AuLL);
  *v5 = 0;
  v5[1] = 0;
  v5[2] = 0;
  v5[3] = a3;
  if (rb_tree_insert_node(self->btree, v5) != v5)
  {
    livefs_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LiveFSRBTree addEntry:].cold.1(a3, v6);

    free(v5);
  }
}

- (id)extractItemsInRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void (**v7)(id, _QWORD);
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;

  length = a3.length;
  location = a3.location;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = rb_tree_iterate(self->btree, 0, 1u);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = location + length;
    do
    {
      if (v11 < location || v11 >= v12)
      {
        if (v11 > v12)
          break;
      }
      else
      {
        v7[2](v7, v10[3]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

      }
      ++v11;
      v10 = rb_tree_iterate(self->btree, v10, 1u);
    }
    while (v10);
  }

  return v8;
}

- (NSMutableArray)ourData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOurData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourData, 0);
  objc_storeStrong(&self->ourComparitor, 0);
}

- (void)addEntry:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_22BD61000, a2, OS_LOG_TYPE_ERROR, "Error inserting node %p, ignoring", (uint8_t *)&v2, 0xCu);
}

@end
