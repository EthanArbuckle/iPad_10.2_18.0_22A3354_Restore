@implementation MATransitiveNeighborRelation

- (MATransitiveNeighborRelation)initWithEdgeType:(unint64_t)a3 edgeFilter:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MATransitiveNeighborRelation;
  return -[MANeighborRelation initWithEdgeType:edgeFilter:](&v5, sel_initWithEdgeType_edgeFilter_, a3, a4);
}

- (MATransitiveNeighborRelation)initWithNeighborRelation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  MATransitiveNeighborRelation *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "edgeType");
  objc_msgSend(v4, "edgeFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MATransitiveNeighborRelation initWithEdgeType:edgeFilter:](self, "initWithEdgeType:edgeFilter:", v5, v6);
  return v7;
}

- (BOOL)isTransitive
{
  return 1;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "graphReference");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "concreteGraph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MANeighborRelation edgeType](self, "edgeType");
  -[MANeighborRelation edgeFilter](self, "edgeFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:edgeType:edgeFilter:", v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unionWithIdentifierSet:", v13);
}

@end
