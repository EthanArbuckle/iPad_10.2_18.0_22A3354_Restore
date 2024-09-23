@implementation ML3StatementCacheList

- (unint64_t)count
{
  ML3StatementCacheNode *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = self->_firstNode;
  if (!v2)
    return 0;
  v3 = v2;
  v4 = 0;
  do
  {
    objc_msgSend(v3, "next");
    v5 = objc_claimAutoreleasedReturnValue();

    ++v4;
    v3 = (void *)v5;
  }
  while (v5);
  return v4;
}

- (void)promoteNodeWithDictionaryKey:(id)a3
{
  ML3StatementCacheNode *v4;
  ML3StatementCacheNode *v5;
  void *v6;
  char v7;
  ML3StatementCacheNode *v8;
  ML3StatementCacheNode *v9;
  ML3StatementCacheNode *firstNode;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self->_firstNode;
  v5 = 0;
  if (v4)
  {
    while (1)
    {
      -[ML3StatementCacheNode dictionaryKey](v4, "dictionaryKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v12, "isEqual:", v6);

      if ((v7 & 1) != 0)
        break;
      v8 = v4;

      -[ML3StatementCacheNode next](v8, "next");
      v4 = (ML3StatementCacheNode *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
      if (!v4)
      {
        v5 = v8;
        goto LABEL_9;
      }
    }
    if (v4 != self->_lastNode)
    {
      if (v4 == self->_firstNode)
      {
        -[ML3StatementCacheNode next](v4, "next");
        v9 = (ML3StatementCacheNode *)objc_claimAutoreleasedReturnValue();
        firstNode = self->_firstNode;
        self->_firstNode = v9;

      }
      -[ML3StatementCacheNode next](v4, "next");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3StatementCacheNode setNext:](v5, "setNext:", v11);

      -[ML3StatementCacheNode setNext:](v4, "setNext:", 0);
      -[ML3StatementCacheList appendNode:](self, "appendNode:", v4);
    }
  }
LABEL_9:

}

- (void)appendNode:(id)a3
{
  ML3StatementCacheNode *v5;
  ML3StatementCacheNode **p_lastNode;
  ML3StatementCacheNode *lastNode;
  ML3StatementCacheNode *v8;

  v5 = (ML3StatementCacheNode *)a3;
  if (self->_firstNode)
  {
    lastNode = self->_lastNode;
    p_lastNode = &self->_lastNode;
    -[ML3StatementCacheNode setNext:](lastNode, "setNext:", v5);
  }
  else
  {
    objc_storeStrong((id *)&self->_firstNode, a3);
    p_lastNode = &self->_lastNode;
  }
  v8 = *p_lastNode;
  *p_lastNode = v5;

}

- (id)oldestNode
{
  return self->_firstNode;
}

- (void)deleteOldestNode
{
  ML3StatementCacheNode *v3;
  ML3StatementCacheNode *firstNode;
  ML3StatementCacheNode *v5;

  v5 = self->_firstNode;
  -[ML3StatementCacheNode next](v5, "next");
  v3 = (ML3StatementCacheNode *)objc_claimAutoreleasedReturnValue();
  firstNode = self->_firstNode;
  self->_firstNode = v3;

}

- (id)description
{
  id v3;
  ML3StatementCacheNode *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = self->_firstNode;
  if (v4)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      objc_msgSend(v5, "next");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",\n\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p = {\n\t%@\n}>"), objc_opt_class(), self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)deleteAllNodes
{
  ML3StatementCacheNode *lastNode;
  ML3StatementCacheNode *firstNode;

  lastNode = self->_lastNode;
  self->_lastNode = 0;

  firstNode = self->_firstNode;
  self->_firstNode = 0;

}

- (ML3StatementCacheNode)firstNode
{
  return self->_firstNode;
}

- (ML3StatementCacheNode)lastNode
{
  return self->_lastNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_firstNode, 0);
}

@end
