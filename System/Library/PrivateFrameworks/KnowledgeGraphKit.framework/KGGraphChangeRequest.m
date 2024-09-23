@implementation KGGraphChangeRequest

- (KGGraphChangeRequest)init
{
  KGGraphChangeRequest *v2;
  NSMutableArray *v3;
  NSMutableArray *nodesToInsert;
  NSMutableArray *v5;
  NSMutableArray *edgesToInsert;
  NSMutableArray *v7;
  NSMutableArray *nodeUpdates;
  NSMutableArray *v9;
  NSMutableArray *edgeUpdates;
  KGMutableElementIdentifierSet *v11;
  KGMutableElementIdentifierSet *nodeIdentifiersToRemove;
  KGMutableElementIdentifierSet *v13;
  KGMutableElementIdentifierSet *edgeIdentifiersToRemove;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)KGGraphChangeRequest;
  v2 = -[KGGraphChangeRequest init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nodesToInsert = v2->_nodesToInsert;
    v2->_nodesToInsert = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    edgesToInsert = v2->_edgesToInsert;
    v2->_edgesToInsert = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nodeUpdates = v2->_nodeUpdates;
    v2->_nodeUpdates = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    edgeUpdates = v2->_edgeUpdates;
    v2->_edgeUpdates = v9;

    v11 = objc_alloc_init(KGMutableElementIdentifierSet);
    nodeIdentifiersToRemove = v2->_nodeIdentifiersToRemove;
    v2->_nodeIdentifiersToRemove = v11;

    v13 = objc_alloc_init(KGMutableElementIdentifierSet);
    edgeIdentifiersToRemove = v2->_edgeIdentifiersToRemove;
    v2->_edgeIdentifiersToRemove = v13;

  }
  return v2;
}

- (unint64_t)count
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSMutableArray count](self->_nodesToInsert, "count");
  v4 = -[NSMutableArray count](self->_edgesToInsert, "count") + v3;
  v5 = -[NSMutableArray count](self->_nodeUpdates, "count");
  v6 = v4 + v5 + -[NSMutableArray count](self->_edgeUpdates, "count");
  v7 = -[KGElementIdentifierSet count](self->_nodeIdentifiersToRemove, "count");
  return v6 + v7 + -[KGElementIdentifierSet count](self->_edgeIdentifiersToRemove, "count");
}

- (void)setResolved
{
  -[NSMutableArray removeAllObjects](self->_nodesToInsert, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_edgesToInsert, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_nodeUpdates, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_edgeUpdates, "removeAllObjects");
  -[KGMutableElementIdentifierSet removeAllIdentifiers](self->_nodeIdentifiersToRemove, "removeAllIdentifiers");
  -[KGMutableElementIdentifierSet removeAllIdentifiers](self->_edgeIdentifiersToRemove, "removeAllIdentifiers");
}

- (void)insertNode:(id)a3
{
  -[NSMutableArray addObject:](self->_nodesToInsert, "addObject:", a3);
}

- (void)updateNode:(id)a3 newProperties:(id)a4
{
  id v6;
  id v7;
  KGNodeChangeRequest *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[KGNodeChangeRequest initWithNode:properties:]([KGNodeChangeRequest alloc], "initWithNode:properties:", v7, v6);

  -[NSMutableArray addObject:](self->_nodeUpdates, "addObject:", v8);
}

- (void)removeNode:(id)a3
{
  -[KGMutableElementIdentifierSet addIdentifier:](self->_nodeIdentifiersToRemove, "addIdentifier:", objc_msgSend(a3, "identifier"));
}

- (void)removeNodesForIdentifiers:(id)a3
{
  -[KGMutableElementIdentifierSet unionWithIdentifierSet:](self->_nodeIdentifiersToRemove, "unionWithIdentifierSet:", a3);
}

- (void)insertEdge:(id)a3
{
  -[NSMutableArray addObject:](self->_edgesToInsert, "addObject:", a3);
}

- (void)updateEdge:(id)a3 newProperties:(id)a4
{
  id v6;
  id v7;
  KGEdgeChangeRequest *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[KGEdgeChangeRequest initWithEdge:properties:]([KGEdgeChangeRequest alloc], "initWithEdge:properties:", v7, v6);

  -[NSMutableArray addObject:](self->_edgeUpdates, "addObject:", v8);
}

- (void)removeEdge:(id)a3
{
  -[KGMutableElementIdentifierSet addIdentifier:](self->_edgeIdentifiersToRemove, "addIdentifier:", objc_msgSend(a3, "identifier"));
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

- (NSMutableArray)nodeUpdates
{
  return self->_nodeUpdates;
}

- (void)setNodeUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_nodeUpdates, a3);
}

- (NSMutableArray)edgeUpdates
{
  return self->_edgeUpdates;
}

- (void)setEdgeUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_edgeUpdates, a3);
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
  objc_storeStrong((id *)&self->_edgeUpdates, 0);
  objc_storeStrong((id *)&self->_nodeUpdates, 0);
  objc_storeStrong((id *)&self->_edgesToInsert, 0);
  objc_storeStrong((id *)&self->_nodesToInsert, 0);
}

@end
