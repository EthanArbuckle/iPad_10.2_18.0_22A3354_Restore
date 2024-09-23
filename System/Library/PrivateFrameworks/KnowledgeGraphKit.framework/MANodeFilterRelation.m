@implementation MANodeFilterRelation

- (MANodeFilterRelation)initWithNodeFilter:(id)a3
{
  id v5;
  id *v6;
  MANodeFilterRelation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MANodeFilterRelation;
  v6 = -[MARelation initForSubclassing](&v9, sel_initForSubclassing);
  v7 = (MANodeFilterRelation *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "graphReference");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "concreteGraph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeIdentifiersMatchingFilter:intersectingIdentifiers:", self->_nodeFilter, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unionWithIdentifierSet:", v11);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a4, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeIdentifiersMatchingFilter:intersectingIdentifiers:", self->_nodeFilter, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[KGDirectedBinaryAdjacency identityWith:](KGDirectedBinaryAdjacency, "identityWith:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  MANodeFilter *nodeFilter;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a4, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  nodeFilter = self->_nodeFilter;
  objc_msgSend(v6, "targets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeIdentifiersMatchingFilter:intersectingIdentifiers:", nodeFilter, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "intersectingTargetsWith:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)visualString
{
  return -[MAElementFilter visualString](self->_nodeFilter, "visualString");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MANodeFilterRelation *v5;
  MANodeFilterRelation *v6;
  MANodeFilterRelation *v7;
  MANodeFilter *nodeFilter;
  MANodeFilter *v9;
  void *v10;
  char v11;

  v5 = (MANodeFilterRelation *)a3;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = v6;
      nodeFilter = self->_nodeFilter;
      v9 = nodeFilter;
      if (!nodeFilter)
      {
        -[MANodeFilterRelation nodeFilter](v6, "nodeFilter");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v11 = 1;
          goto LABEL_11;
        }
        v9 = self->_nodeFilter;
      }
      -[MANodeFilterRelation nodeFilter](v7, "nodeFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MAElementFilter isEqual:](v9, "isEqual:", v10);

      if (nodeFilter)
      {
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  return -[MAElementFilter hash](self->_nodeFilter, "hash");
}

- (MANodeFilter)nodeFilter
{
  return self->_nodeFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeFilter, 0);
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  MANodeFilterRelation *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "scanLocation");
  +[MAElementFilter scanFilterWithScanner:](MANodeFilter, "scanFilterWithScanner:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MANodeFilterRelation initWithNodeFilter:]([MANodeFilterRelation alloc], "initWithNodeFilter:", v5);
  }
  else
  {
    objc_msgSend(v3, "setScanLocation:", v4);
    v6 = 0;
  }

  return v6;
}

@end
