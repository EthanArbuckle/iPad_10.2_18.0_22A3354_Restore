@implementation PHASEContainerNodeDefinition

- (PHASEContainerNodeDefinition)initWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  PHASEContainerNodeDefinition *v5;
  PHASEContainerNodeDefinition *v6;
  NSMutableArray *v7;
  NSMutableArray *subtrees;
  PHASEContainerNodeDefinition *v9;
  objc_super v11;

  v4 = identifier;
  v11.receiver = self;
  v11.super_class = (Class)PHASEContainerNodeDefinition;
  v5 = -[PHASEDefinition initInternal](&v11, sel_initInternal);
  v6 = v5;
  if (v5)
  {
    -[PHASEDefinition setIdentifier:](v5, "setIdentifier:", v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    subtrees = v6->_subtrees;
    v6->_subtrees = v7;

    v9 = v6;
  }

  return v6;
}

- (PHASEContainerNodeDefinition)init
{
  PHASEContainerNodeDefinition *v2;
  PHASEContainerNodeDefinition *v3;
  PHASEContainerNodeDefinition *v4;

  v2 = -[PHASEContainerNodeDefinition initWithIdentifier:](self, "initWithIdentifier:", &stru_24D582B00);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (PHASEContainerNodeDefinition)new
{
  return -[PHASEContainerNodeDefinition initWithIdentifier:]([PHASEContainerNodeDefinition alloc], "initWithIdentifier:", &stru_24D582B00);
}

- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree
{
  PHASESoundEventNodeDefinition *v4;
  PHASESoundEventNodeDefinition *v5;

  v4 = subtree;
  v5 = v4;
  if (v4)
    -[NSMutableArray addObject:](self->_subtrees, "addObject:", v4);
  else
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot add a nil subtree to a PHASEContainerNodeDefinition"));

}

- (id)children
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_subtrees);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtrees, 0);
}

@end
