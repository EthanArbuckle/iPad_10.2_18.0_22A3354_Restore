@implementation MANodeKGImplementation

- (MANodeKGImplementation)initWithNode:(id)a3
{
  MANodeKGImplementation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MANodeKGImplementation;
  result = -[MANodeKGImplementation init](&v5, sel_init);
  if (result)
    result->_node = (MANode *)a3;
  return result;
}

- (unint64_t)countOfEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  void *v4;
  unint64_t v5;

  -[MANodeKGImplementation edgeIdentifiersOfType:matchingFilter:](self, "edgeIdentifiersOfType:matchingFilter:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4B20C]();
  -[MANodeKGImplementation edgeIdentifiersOfType:matchingFilter:](self, "edgeIdentifiersOfType:matchingFilter:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "isEmpty") ^ 1;

  objc_autoreleasePoolPop(v7);
  return (char)self;
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1CAA4B20C]();
  -[MANode graphReference](self->_node, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "edgeIdentifiersOfType:sourceNodeIdentifier:targetNodeIdentifier:", a3, -[MANode identifier](self->_node, "identifier"), objc_msgSend(v13, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateEdgesWithIdentifiers:usingBlock:", v12, v8);

  objc_autoreleasePoolPop(v9);
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 withNode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4B20C]();
  -[MANode graphReference](self->_node, "graphReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "concreteGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "edgeIdentifiersOfType:sourceNodeIdentifier:targetNodeIdentifier:", a3, -[MANode identifier](self->_node, "identifier"), objc_msgSend(v6, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v10, "isEmpty") ^ 1;

  objc_autoreleasePoolPop(v7);
  return (char)self;
}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__MANodeKGImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke;
  v10[3] = &unk_1E83E43F8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[MANodeKGImplementation enumerateEdgesOfType:matchingFilter:usingBlock:](self, "enumerateEdgesOfType:matchingFilter:usingBlock:", a3, a4, v10);

}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a4, "relationWithType:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeKGImplementation enumerateNodesRelatedWithRelation:usingBlock:](self, "enumerateNodesRelatedWithRelation:usingBlock:", v9, v8);

}

- (void)enumerateEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1CAA4B20C]();
  -[MANode graphReference](self->_node, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MANodeKGImplementation edgeIdentifiersOfType:matchingFilter:](self, "edgeIdentifiersOfType:matchingFilter:", a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateEdgesWithIdentifiers:usingBlock:", v12, v8);

  objc_autoreleasePoolPop(v9);
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  MANode *node;
  id v7;
  void *v8;
  void *v9;
  KGElementIdentifierSet *v10;
  void *v11;

  node = self->_node;
  v7 = a4;
  -[MANode graphReference](node, "graphReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "concreteGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", -[MANode identifier](self->_node, "identifier"));
  objc_msgSend(v9, "edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:", a3, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)enumerateNeighborEdgesAndNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__MANodeKGImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke;
  v8[3] = &unk_1E83E43F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[MANodeKGImplementation enumerateEdgesOfType:matchingFilter:usingBlock:](self, "enumerateEdgesOfType:matchingFilter:usingBlock:", 3, v6, v8);

}

- (void)enumerateNodesRelatedWithRelation:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  MANode *v8;
  MANodeCollection *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4B20C]();
  v8 = self->_node;
  v9 = -[MANodeCollection initWithNode:]([MANodeCollection alloc], "initWithNode:", v8);

  +[MANodeCollection nodesRelatedToNodes:withRelation:](MANodeCollection, "nodesRelatedToNodes:withRelation:", v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateNodesUsingBlock:", v6);

  objc_autoreleasePoolPop(v7);
}

- (void)enumerateNeighborNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyDirectionRelation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "excludeSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(v7, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MARelation chain:](MARelation, "chain:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MANodeKGImplementation enumerateNodesRelatedWithRelation:usingBlock:](self, "enumerateNodesRelatedWithRelation:usingBlock:", v13, v6);
}

void __82__MANodeKGImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "oppositeNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isSameNodeAsNode:", v3) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __101__MANodeKGImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v4, "oppositeNode:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
