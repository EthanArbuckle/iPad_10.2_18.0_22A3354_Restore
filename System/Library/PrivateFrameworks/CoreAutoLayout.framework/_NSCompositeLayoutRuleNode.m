@implementation _NSCompositeLayoutRuleNode

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSCompositeLayoutRuleNode;
  -[_NSLayoutRuleNode dealloc](&v3, sel_dealloc);
}

- (uint64_t)childNodesCreatingIfNecessary
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 24);
    if (!result)
    {
      result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
      *(_QWORD *)(v1 + 24) = result;
    }
  }
  return result;
}

- (NSString)debugDescription
{
  id v3;
  NSMutableArray *childNodes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  objc_class *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[_NSLayoutRuleNode description](self, "description");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  childNodes = self->_childNodes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(childNodes);
        v3 = (id)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n    %@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n</%@>"), NSStringFromClass(v9));
}

- (NSArray)_childRuleNodes
{
  if (self->_childNodes)
    return &self->_childNodes->super;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_addChildRuleNode:(id)a3
{
  objc_msgSend((id)-[_NSCompositeLayoutRuleNode childNodesCreatingIfNecessary]((uint64_t)self), "addObject:", a3);
}

- (void)_removeChildRuleNode:(id)a3
{
  -[NSMutableArray removeObject:](self->_childNodes, "removeObject:", a3);
}

@end
