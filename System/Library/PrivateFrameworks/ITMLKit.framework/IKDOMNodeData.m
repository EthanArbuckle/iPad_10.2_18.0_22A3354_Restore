@implementation IKDOMNodeData

+ (id)jsNodeDataForNode:(id)a3
{
  id v3;
  IKDOMNodeData *v4;

  v3 = a3;
  v4 = objc_alloc_init(IKDOMNodeData);
  -[IKDOMNodeData setOwnerJSNode:](v4, "setOwnerJSNode:", v3);

  return v4;
}

- (BOOL)containsUpdates
{
  return -[IKDOMNodeData isUpdated](self, "isUpdated")
      || -[IKDOMNodeData isChildrenUpdated](self, "isChildrenUpdated")
      || -[IKDOMNodeData isSubtreeUpdated](self, "isSubtreeUpdated");
}

- (void)setFeature:(id)a3 forName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[IKDOMNodeData featuresMap](self, "featuresMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMNodeData setFeaturesMap:](self, "setFeaturesMap:", v8);

  }
  -[IKDOMNodeData featuresMap](self, "featuresMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, v6);
  else
    objc_msgSend(v9, "removeObjectForKey:", v6);

}

- (id)featureForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IKDOMNodeData featuresMap](self, "featuresMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IKDOMNode)ownerJSNode
{
  return (IKDOMNode *)objc_loadWeakRetained((id *)&self->_ownerJSNode);
}

- (void)setOwnerJSNode:(id)a3
{
  objc_storeWeak((id *)&self->_ownerJSNode, a3);
}

- (BOOL)isUpdated
{
  return self->_updated;
}

- (void)setUpdated:(BOOL)a3
{
  self->_updated = a3;
}

- (BOOL)isChildrenUpdated
{
  return self->_childrenUpdated;
}

- (void)setChildrenUpdated:(BOOL)a3
{
  self->_childrenUpdated = a3;
}

- (BOOL)isSubtreeUpdated
{
  return self->_subtreeUpdated;
}

- (void)setSubtreeUpdated:(BOOL)a3
{
  self->_subtreeUpdated = a3;
}

- (BOOL)isAutoHighlightRead
{
  return self->_autoHighlightRead;
}

- (void)setAutoHighlightRead:(BOOL)a3
{
  self->_autoHighlightRead = a3;
}

- (BOOL)isBindingParsed
{
  return self->_bindingParsed;
}

- (void)setBindingParsed:(BOOL)a3
{
  self->_bindingParsed = a3;
}

- (BOOL)areRulesParsed
{
  return self->_rulesParsed;
}

- (void)setRulesParsed:(BOOL)a3
{
  self->_rulesParsed = a3;
}

- (BOOL)arePrototypesResolved
{
  return self->_prototypesResolved;
}

- (void)setPrototypesResolved:(BOOL)a3
{
  self->_prototypesResolved = a3;
}

- (BOOL)isDataResolved
{
  return self->_dataResolved;
}

- (void)setDataResolved:(BOOL)a3
{
  self->_dataResolved = a3;
}

- (NSMutableDictionary)featuresMap
{
  return self->_featuresMap;
}

- (void)setFeaturesMap:(id)a3
{
  objc_storeStrong((id *)&self->_featuresMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresMap, 0);
  objc_destroyWeak((id *)&self->_ownerJSNode);
}

@end
