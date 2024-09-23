@implementation CalculateUnitsTrieNode

- (CalculateUnitsTrieNode)initWithTrieNode:(id)a3
{
  id v5;
  CalculateUnitsTrieNode *v6;
  CalculateUnitsTrieNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalculateUnitsTrieNode;
  v6 = -[CalculateUnitsTrieNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_node, a3);

  return v7;
}

- (id)objectForKey:(id)a3
{
  void *v3;
  void *v4;

  -[TrieNode objectForKeyedSubscript:]((id *)&self->_node->super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CalculateUnitsTrieNode nodeWithTrieNode:](CalculateUnitsTrieNode, "nodeWithTrieNode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isMatch
{
  void *v2;
  char v3;

  -[TrieNode object]((uint64_t)self->_node);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsUnit") & 1) != 0 || (objc_msgSend(v2, "containsFrom") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "containsTo");

  return v3;
}

- (BOOL)containsConversionVerb
{
  void *v2;
  char v3;

  -[TrieNode object]((uint64_t)self->_node);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsFrom") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "containsTo");

  return v3;
}

- (BOOL)containsCurrency
{
  void *v2;
  char v3;

  -[TrieNode object]((uint64_t)self->_node);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsCurrency");

  return v3;
}

- (TrieNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
}

+ (id)nodeWithTrieNode:(id)a3
{
  id v3;
  CalculateUnitsTrieNode *v4;

  v3 = a3;
  v4 = -[CalculateUnitsTrieNode initWithTrieNode:]([CalculateUnitsTrieNode alloc], "initWithTrieNode:", v3);

  return v4;
}

@end
