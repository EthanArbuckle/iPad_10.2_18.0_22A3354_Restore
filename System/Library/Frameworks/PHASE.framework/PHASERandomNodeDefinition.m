@implementation PHASERandomNodeDefinition

- (PHASERandomNodeDefinition)initWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  PHASERandomNodeDefinition *v5;
  PHASERandomNodeDefinition *v6;
  PHASERandomNodeDefinition *v7;

  v4 = identifier;
  v5 = -[PHASERandomNodeDefinition init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[PHASEDefinition setIdentifier:](v5, "setIdentifier:", v4);
    v7 = v6;
  }

  return v6;
}

- (PHASERandomNodeDefinition)init
{
  PHASERandomNodeDefinition *v2;
  NSMutableArray *v3;
  NSMutableArray *subtrees;
  PHASERandomNodeDefinition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHASERandomNodeDefinition;
  v2 = -[PHASEDefinition initInternal](&v7, sel_initInternal);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    subtrees = v2->_subtrees;
    v2->_subtrees = v3;

    v2->_uniqueSelectionQueueLength = 0;
    v5 = v2;
  }

  return v2;
}

- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree weight:(NSNumber *)weight
{
  NSNumber *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  RandomSubtree *v13;
  const __CFString *v14;
  PHASESoundEventNodeDefinition *v15;

  v15 = subtree;
  v7 = weight;
  if (!v15)
  {
    v14 = CFSTR("Cannot add a nil subTree to a PHASERandomNodeDefinition");
LABEL_6:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), v14);
    goto LABEL_7;
  }
  if (!v7)
  {
    v14 = CFSTR("Cannot add a subTree to a PHASERandomNodeDefinition with a nil weight");
    goto LABEL_6;
  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumber doubleValue](v7, "doubleValue");
  v12 = PHASEGetPropertyBounded<double>(v9, v10, v11, 1.0, 8.98846567e307);

  v13 = objc_alloc_init(RandomSubtree);
  -[RandomSubtree setSubtree:](v13, "setSubtree:", v15);
  -[RandomSubtree setWeight:](v13, "setWeight:", v12);
  -[NSMutableArray addObject:](self->_subtrees, "addObject:", v13);

LABEL_7:
}

- (id)children
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_subtrees;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "subtree", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (int64_t)noRepeatLastX
{
  return self->_uniqueSelectionQueueLength;
}

- (void)setNoRepeatLastX:(int64_t)a3
{
  self->_uniqueSelectionQueueLength = a3;
}

- (NSInteger)uniqueSelectionQueueLength
{
  return self->_uniqueSelectionQueueLength;
}

- (void)setUniqueSelectionQueueLength:(NSInteger)uniqueSelectionQueueLength
{
  self->_uniqueSelectionQueueLength = uniqueSelectionQueueLength;
}

- (NSMutableArray)subtrees
{
  return self->_subtrees;
}

- (void)setSubtrees:(id)a3
{
  objc_storeStrong((id *)&self->_subtrees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtrees, 0);
}

@end
