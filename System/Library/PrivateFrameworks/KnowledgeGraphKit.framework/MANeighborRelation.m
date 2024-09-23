@implementation MANeighborRelation

- (MANeighborRelation)initWithEdgeType:(unint64_t)a3 edgeFilter:(id)a4
{
  id v7;
  MANeighborRelation *v8;
  MANeighborRelation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MANeighborRelation;
  v8 = -[MARelation initForSubclassing](&v11, sel_initForSubclassing);
  v9 = v8;
  if (v8)
  {
    v8->_edgeType = a3;
    objc_storeStrong((id *)&v8->_edgeFilter, a4);
  }

  return v9;
}

- (id)inverse
{
  unint64_t v2;
  uint64_t v3;

  v2 = self->_edgeType - 1;
  if (v2 > 2)
    v3 = 0;
  else
    v3 = qword_1CA1FE818[v2];
  return -[MANeighborRelation initWithEdgeType:edgeFilter:]([MANeighborRelation alloc], "initWithEdgeType:edgeFilter:", v3, self->_edgeFilter);
}

- (id)transitiveClosure
{
  MATransitiveClosureRelation *v3;
  MATransitiveNeighborRelation *v4;
  MATransitiveClosureRelation *v5;

  v3 = [MATransitiveClosureRelation alloc];
  v4 = -[MATransitiveNeighborRelation initWithNeighborRelation:]([MATransitiveNeighborRelation alloc], "initWithNeighborRelation:", self);
  v5 = -[MATransitiveClosureRelation initWithBase:](v3, "initWithBase:", v4);

  return v5;
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
  objc_msgSend(v10, "neighborNodeIdentifiersWithStartNodeIdentifiers:edgeType:edgeFilter:", v9, self->_edgeType, self->_edgeFilter);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unionWithIdentifierSet:", v11);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjacencyWithStartNodeIdentifiers:edgeFilter:edgeType:", v6, self->_edgeFilter, self->_edgeType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)adjacencyWithEndNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjacencyWithEndNodeIdentifiers:edgeFilter:edgeType:", v6, self->_edgeFilter, self->_edgeType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[MANeighborRelation inverse](self, "inverse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjacencyWithEndNodeIdentifiers:graph:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "joinOnTargetsOfAdjacency:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)visualString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_edgeType == 1)
    objc_msgSend(v3, "appendString:", CFSTR("<"));
  objc_msgSend(v4, "appendString:", CFSTR("-"));
  -[MAEdgeFilter appendVisualStringToString:](self->_edgeFilter, "appendVisualStringToString:", v4);
  objc_msgSend(v4, "appendString:", CFSTR("-"));
  if (self->_edgeType == 2)
    objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MANeighborRelation *v4;
  MANeighborRelation *v5;
  void *edgeType;
  MAEdgeFilter *edgeFilter;
  MAEdgeFilter *v8;
  void *v9;
  char v10;

  v4 = (MANeighborRelation *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      edgeType = (void *)self->_edgeType;
      if (edgeType == (void *)-[MANeighborRelation edgeType](v5, "edgeType"))
      {
        edgeFilter = self->_edgeFilter;
        v8 = edgeFilter;
        if (!edgeFilter)
        {
          -[MANeighborRelation edgeFilter](v5, "edgeFilter");
          edgeType = (void *)objc_claimAutoreleasedReturnValue();
          if (!edgeType)
          {
            v10 = 1;
LABEL_14:

            goto LABEL_15;
          }
          v8 = self->_edgeFilter;
        }
        -[MANeighborRelation edgeFilter](v5, "edgeFilter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MAElementFilter isEqual:](v8, "isEqual:", v9);

        if (!edgeFilter)
          goto LABEL_14;
      }
      else
      {
        v10 = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_edgeType + 2654435769u;
  return ((v2 << 6) + (v2 >> 2) + -[MAElementFilter hash](self->_edgeFilter, "hash") + 2654435769u) ^ v2;
}

- (unint64_t)edgeType
{
  return self->_edgeType;
}

- (MAEdgeFilter)edgeFilter
{
  return self->_edgeFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeFilter, 0);
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  MANeighborRelation *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "scanLocation");
  v5 = objc_msgSend(v3, "scanString:intoString:", CFSTR("<"), 0);
  if ((objc_msgSend(v3, "scanString:intoString:", CFSTR("-"), 0) & 1) != 0)
  {
    +[MAElementFilter scanFilterWithScanner:](MAEdgeFilter, "scanFilterWithScanner:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (objc_msgSend(v3, "scanString:intoString:", CFSTR("-"), 0) & 1) != 0
      && (v7 = objc_msgSend(v3, "scanString:intoString:", CFSTR(">"), 0), (v5 & v7) != 1))
    {
      v10 = 2;
      if (!v7)
        v10 = 3;
      if (v5)
        v11 = 1;
      else
        v11 = v10;
      v8 = -[MANeighborRelation initWithEdgeType:edgeFilter:]([MANeighborRelation alloc], "initWithEdgeType:edgeFilter:", v11, v6);
    }
    else
    {
      objc_msgSend(v3, "setScanLocation:", v4);
      v8 = 0;
    }

  }
  else
  {
    objc_msgSend(v3, "setScanLocation:", v4);
    v8 = 0;
  }

  return v8;
}

@end
