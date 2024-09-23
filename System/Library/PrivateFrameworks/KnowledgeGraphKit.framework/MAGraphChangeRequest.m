@implementation MAGraphChangeRequest

- (MAGraphChangeRequest)init
{
  MAGraphChangeRequest *v2;
  NSMutableArray *v3;
  NSMutableArray *nodesToInsert;
  NSMutableArray *v5;
  NSMutableArray *edgesToInsert;
  KGMutableElementIdentifierSet *v7;
  KGMutableElementIdentifierSet *nodeIdentifiersToRemove;
  KGMutableElementIdentifierSet *v9;
  KGMutableElementIdentifierSet *edgeIdentifiersToRemove;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MAGraphChangeRequest;
  v2 = -[MAGraphChangeRequest init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nodesToInsert = v2->_nodesToInsert;
    v2->_nodesToInsert = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    edgesToInsert = v2->_edgesToInsert;
    v2->_edgesToInsert = v5;

    v7 = objc_alloc_init(KGMutableElementIdentifierSet);
    nodeIdentifiersToRemove = v2->_nodeIdentifiersToRemove;
    v2->_nodeIdentifiersToRemove = v7;

    v9 = objc_alloc_init(KGMutableElementIdentifierSet);
    edgeIdentifiersToRemove = v2->_edgeIdentifiersToRemove;
    v2->_edgeIdentifiersToRemove = v9;

  }
  return v2;
}

- (unint64_t)numberOfChanges
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSMutableArray count](self->_nodesToInsert, "count");
  v4 = -[NSMutableArray count](self->_edgesToInsert, "count") + v3;
  v5 = -[KGElementIdentifierSet count](self->_nodeIdentifiersToRemove, "count");
  return v4 + v5 + -[KGElementIdentifierSet count](self->_edgeIdentifiersToRemove, "count");
}

- (void)addNode:(id)a3
{
  -[NSMutableArray addObject:](self->_nodesToInsert, "addObject:", a3);
}

- (void)removeNode:(id)a3
{
  -[KGMutableElementIdentifierSet addIdentifier:](self->_nodeIdentifiersToRemove, "addIdentifier:", objc_msgSend(a3, "identifier"));
}

- (void)removeNodes:(id)a3
{
  KGMutableElementIdentifierSet *nodeIdentifiersToRemove;
  id v4;

  nodeIdentifiersToRemove = self->_nodeIdentifiersToRemove;
  objc_msgSend(a3, "elementIdentifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[KGMutableElementIdentifierSet unionWithIdentifierSet:](nodeIdentifiersToRemove, "unionWithIdentifierSet:", v4);

}

- (void)removeNodeForIdentifier:(unint64_t)a3
{
  -[KGMutableElementIdentifierSet addIdentifier:](self->_nodeIdentifiersToRemove, "addIdentifier:", a3);
}

- (void)removeNodesForIdentifiers:(id)a3
{
  -[KGMutableElementIdentifierSet unionWithIdentifierSet:](self->_nodeIdentifiersToRemove, "unionWithIdentifierSet:", a3);
}

- (void)addEdge:(id)a3
{
  -[NSMutableArray addObject:](self->_edgesToInsert, "addObject:", a3);
}

- (void)removeEdge:(id)a3
{
  -[KGMutableElementIdentifierSet addIdentifier:](self->_edgeIdentifiersToRemove, "addIdentifier:", objc_msgSend(a3, "identifier"));
}

- (void)removeEdges:(id)a3
{
  KGMutableElementIdentifierSet *edgeIdentifiersToRemove;
  id v4;

  edgeIdentifiersToRemove = self->_edgeIdentifiersToRemove;
  objc_msgSend(a3, "elementIdentifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[KGMutableElementIdentifierSet unionWithIdentifierSet:](edgeIdentifiersToRemove, "unionWithIdentifierSet:", v4);

}

- (void)removeEdgesForIdentifier:(unint64_t)a3
{
  -[KGMutableElementIdentifierSet addIdentifier:](self->_edgeIdentifiersToRemove, "addIdentifier:", a3);
}

- (void)removeEdgesForIdentifiers:(id)a3
{
  -[KGMutableElementIdentifierSet unionWithIdentifierSet:](self->_edgeIdentifiersToRemove, "unionWithIdentifierSet:", a3);
}

- (NSMutableArray)nodesToInsert
{
  return self->_nodesToInsert;
}

- (void)setNodesToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_nodesToInsert, a3);
}

- (NSMutableArray)edgesToInsert
{
  return self->_edgesToInsert;
}

- (void)setEdgesToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_edgesToInsert, a3);
}

- (KGMutableElementIdentifierSet)nodeIdentifiersToRemove
{
  return self->_nodeIdentifiersToRemove;
}

- (void)setNodeIdentifiersToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_nodeIdentifiersToRemove, a3);
}

- (KGMutableElementIdentifierSet)edgeIdentifiersToRemove
{
  return self->_edgeIdentifiersToRemove;
}

- (void)setEdgeIdentifiersToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_edgeIdentifiersToRemove, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_nodeIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_edgesToInsert, 0);
  objc_storeStrong((id *)&self->_nodesToInsert, 0);
}

@end
