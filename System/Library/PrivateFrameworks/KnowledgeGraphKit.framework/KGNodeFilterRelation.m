@implementation KGNodeFilterRelation

- (KGNodeFilterRelation)initWithNodeFilter:(id)a3
{
  id v5;
  KGNodeFilterRelation *v6;
  KGNodeFilterRelation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGNodeFilterRelation;
  v6 = -[KGNodeFilterRelation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nodeFilter, a3);

  return v7;
}

- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  return (id)objc_msgSend(a4, "nodeIdentifiersMatchingFilter:", self->_nodeFilter);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "nodeIdentifiersMatchingFilter:", self->_nodeFilter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[KGDirectedBinaryAdjacency identityWith:](KGDirectedBinaryAdjacency, "identityWith:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4
{
  KGNodeFilter *nodeFilter;
  id v6;
  void *v7;
  void *v8;

  nodeFilter = self->_nodeFilter;
  v6 = a3;
  objc_msgSend(a4, "nodeIdentifiersMatchingFilter:", nodeFilter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intersectingTargetsWith:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (KGNodeFilter)nodeFilter
{
  return self->_nodeFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeFilter, 0);
}

@end
