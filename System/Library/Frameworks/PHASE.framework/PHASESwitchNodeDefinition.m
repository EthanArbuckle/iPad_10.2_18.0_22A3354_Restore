@implementation PHASESwitchNodeDefinition

- (PHASESwitchNodeDefinition)init
{
  -[PHASESwitchNodeDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESwitchNodeDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESwitchNodeDefinition)initWithSwitchMetaParameterDefinition:(PHASEStringMetaParameterDefinition *)switchMetaParameterDefinition identifier:(NSString *)identifier
{
  PHASEStringMetaParameterDefinition *v6;
  NSString *v7;
  PHASESwitchNodeDefinition *v8;
  PHASESwitchNodeDefinition *v9;
  PHASESwitchNodeDefinition *v10;

  v6 = switchMetaParameterDefinition;
  v7 = identifier;
  v8 = -[PHASESwitchNodeDefinition initWithSwitchMetaParameterDefinition:](self, "initWithSwitchMetaParameterDefinition:", v6);
  v9 = v8;
  if (v8)
  {
    -[PHASEDefinition setIdentifier:](v8, "setIdentifier:", v7);
    v10 = v9;
  }

  return v9;
}

- (PHASESwitchNodeDefinition)initWithSwitchMetaParameterDefinition:(PHASEStringMetaParameterDefinition *)switchMetaParameterDefinition
{
  PHASEStringMetaParameterDefinition *v5;
  id v6;
  id v7;
  void *v8;
  PHASESwitchNodeDefinition *v9;
  objc_super v11;

  v5 = switchMetaParameterDefinition;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a PHASESwitchNodeDefinition with a nil switchMetaParameterDefinition"));
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)PHASESwitchNodeDefinition;
  v6 = -[PHASEDefinition initInternal](&v11, sel_initInternal);
  if (!v6)
  {
    self = 0;
    goto LABEL_6;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v7;

  objc_storeStrong((id *)v6 + 2, switchMetaParameterDefinition);
  self = (PHASESwitchNodeDefinition *)v6;
  v9 = self;
LABEL_7:

  return v9;
}

- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree switchValue:(NSString *)switchValue
{
  NSString *v6;
  SwitchSubtree *v7;
  PHASESoundEventNodeDefinition *v8;

  v8 = subtree;
  v6 = switchValue;
  v7 = objc_alloc_init(SwitchSubtree);
  -[SwitchSubtree setSwitchValue:](v7, "setSwitchValue:", v6);
  -[SwitchSubtree setSubtree:](v7, "setSubtree:", v8);
  -[NSMutableArray addObject:](self->_subtrees, "addObject:", v7);

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

- (PHASEStringMetaParameterDefinition)switchMetaParameterDefinition
{
  return self->_switchMetaParameterDefinition;
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
  objc_storeStrong((id *)&self->_switchMetaParameterDefinition, 0);
}

@end
