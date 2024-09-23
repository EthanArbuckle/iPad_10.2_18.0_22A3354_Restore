@implementation VSKeyPathBasedTreeNode

- (VSKeyPathBasedTreeNode)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSKeyPathBasedTreeNode)initWithRepresentedObject:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (VSKeyPathBasedTreeNode)initWithRepresentedObject:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VSKeyPathBasedTreeNode *v9;
  uint64_t v10;
  NSString *keyPath;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  VSKeyPathBasedTreeNode *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The modelObject parameter must not be nil."));
  if (!v8)
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keyPath parameter must not be nil."));
LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)VSKeyPathBasedTreeNode;
  v9 = -[VSTreeNode initWithRepresentedObject:](&v21, sel_initWithRepresentedObject_, v6);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v10;

    objc_msgSend(v6, "valueForKeyPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "count");
      if (v14)
      {
        v15 = v14;
        -[VSTreeNode mutableChildNodes](v9, "mutableChildNodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != v15; ++i)
        {
          objc_msgSend(v13, "objectAtIndex:", i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[VSKeyPathBasedTreeNode initWithRepresentedObject:keyPath:]([VSKeyPathBasedTreeNode alloc], "initWithRepresentedObject:keyPath:", v18, v8);
          objc_msgSend(v16, "addObject:", v19);

        }
      }
    }

  }
  return v9;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
