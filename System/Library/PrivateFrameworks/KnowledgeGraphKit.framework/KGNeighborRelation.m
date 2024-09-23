@implementation KGNeighborRelation

- (KGNeighborRelation)initWithEdgeFilter:(id)a3 edgeDirection:(unint64_t)a4
{
  id v7;
  KGNeighborRelation *v8;
  KGNeighborRelation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KGNeighborRelation;
  v8 = -[KGNeighborRelation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_edgeFilter, a3);
    v9->_edgeDirection = a4;
  }

  return v9;
}

- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  return (id)objc_msgSend(a4, "neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:", a3, self->_edgeDirection, self->_edgeFilter);
}

- (id)inverse
{
  KGNeighborRelation *v3;
  unint64_t v4;
  uint64_t v5;

  v3 = [KGNeighborRelation alloc];
  v4 = self->_edgeDirection - 1;
  if (v4 > 2)
    v5 = 0;
  else
    v5 = qword_1CA1FE818[v4];
  return -[KGNeighborRelation initWithEdgeFilter:edgeDirection:](v3, "initWithEdgeFilter:edgeDirection:", self->_edgeFilter, v5);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  return (id)objc_msgSend(a4, "adjacencyWithSourceNodeIdentifiers:edgeFilter:edgeDirection:", a3, self->_edgeFilter, self->_edgeDirection);
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "targets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_edgeDirection - 1;
  if (v9 > 2)
    v10 = 0;
  else
    v10 = qword_1CA1FE818[v9];
  objc_msgSend(v6, "adjacencyWithTargetNodeIdentifiers:edgeFilter:edgeDirection:", v8, self->_edgeFilter, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "joinOnTargetsOfAdjacency:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (KGEdgeFilter)edgeFilter
{
  return self->_edgeFilter;
}

- (unint64_t)edgeDirection
{
  return self->_edgeDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeFilter, 0);
}

@end
