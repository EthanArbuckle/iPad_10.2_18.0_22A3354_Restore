@implementation KGGraph

- (KGGraph)initWithImplementation:(id)a3 entityFactory:(id)a4
{
  id v7;
  id v8;
  KGGraph *v9;
  KGGraph *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGGraph;
  v9 = -[KGGraph init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeStrong((id *)&v10->_entityFactory, a4);
  }

  return v10;
}

- (NSUUID)graphIdentifier
{
  return (NSUUID *)-[KGGraphImplementation graphIdentifier](self->_implementation, "graphIdentifier");
}

- (BOOL)noFatalError
{
  return -[KGGraphImplementation noFatalError](self->_implementation, "noFatalError");
}

- (id)nodeForIdentifier:(unint64_t)a3
{
  KGElementIdentifierSet *v4;
  void *v5;
  void *v6;

  v4 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a3);
  -[KGGraph nodesForIdentifiers:](self, "nodesForIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)edgeForIdentifier:(unint64_t)a3
{
  KGElementIdentifierSet *v4;
  void *v5;
  void *v6;

  v4 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a3);
  -[KGGraph edgesForIdentifiers:](self, "edgesForIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nodesForIdentifiers:(id)a3
{
  id v4;
  KGNodeCollection *v5;

  v4 = a3;
  v5 = -[KGElementCollection initWithIdentifiers:graph:]([KGNodeCollection alloc], "initWithIdentifiers:graph:", v4, self);

  return v5;
}

- (id)edgesForIdentifiers:(id)a3
{
  id v4;
  KGEdgeCollection *v5;

  v4 = a3;
  v5 = -[KGElementCollection initWithIdentifiers:graph:]([KGEdgeCollection alloc], "initWithIdentifiers:graph:", v4, self);

  return v5;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3
{
  return -[KGGraph _nodeIdentifiersMatchingFilter:intersectingIdentifiers:](self, "_nodeIdentifiersMatchingFilter:intersectingIdentifiers:", a3, 0);
}

- (id)_nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  KGGraphImplementation *implementation;
  KGElementIdentifierSet *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v9 = 0;
  -[KGGraphImplementation nodeIdentifiersMatchingFilter:intersectingIdentifiers:error:](implementation, "nodeIdentifiersMatchingFilter:intersectingIdentifiers:error:", a3, a4, &v9);
  v5 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    KGLoggingConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1CA0A5000, v7, OS_LOG_TYPE_ERROR, "Error fetching node identifiers with error(%@)", buf, 0xCu);
    }

    v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)nodeIdentifiersOfEdgesForIdentifiers:(id)a3 edgeDirection:(unint64_t)a4
{
  KGGraphImplementation *implementation;
  KGElementIdentifierSet *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v9 = 0;
  -[KGGraphImplementation nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:](implementation, "nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:", a3, a4, &v9);
  v5 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    KGLoggingConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1CA0A5000, v7, OS_LOG_TYPE_ERROR, "Error fetching nodes of edges with error(%@)", buf, 0xCu);
    }

    v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3
{
  KGGraphImplementation *implementation;
  KGDirectedBinaryAdjacency *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v8 = 0;
  -[KGGraphImplementation targetsBySourceWithEdgeIdentifiers:error:](implementation, "targetsBySourceWithEdgeIdentifiers:error:", a3, &v8);
  v4 = (KGDirectedBinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    KGLoggingConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1CA0A5000, v6, OS_LOG_TYPE_ERROR, "Error fetching targets by source adjacency with error(%@)", buf, 0xCu);
    }

    v4 = objc_alloc_init(KGDirectedBinaryAdjacency);
  }

  return v4;
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3
{
  KGGraphImplementation *implementation;
  KGDirectedBinaryAdjacency *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v8 = 0;
  -[KGGraphImplementation sourcesByTargetWithEdgeIdentifiers:error:](implementation, "sourcesByTargetWithEdgeIdentifiers:error:", a3, &v8);
  v4 = (KGDirectedBinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    KGLoggingConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1CA0A5000, v6, OS_LOG_TYPE_ERROR, "Error fetching sources by target adjacency with error(%@)", buf, 0xCu);
    }

    v4 = objc_alloc_init(KGDirectedBinaryAdjacency);
  }

  return v4;
}

- (id)adjacencyWithSourceNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeDirection:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  KGDirectedBinaryAdjacency *v10;
  KGDirectedBinaryAdjacency *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(KGDirectedBinaryAdjacency);
  v11 = objc_alloc_init(KGDirectedBinaryAdjacency);
  if ((v5 & 2) != 0)
  {
    -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v8, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGGraph edgeIdentifiersMatchingFilter:intersectingIdentifiers:](self, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[KGGraph targetsBySourceWithEdgeIdentifiers:](self, "targetsBySourceWithEdgeIdentifiers:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (KGDirectedBinaryAdjacency *)v14;
  }
  if ((v5 & 1) != 0)
  {
    -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v8, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGGraph edgeIdentifiersMatchingFilter:intersectingIdentifiers:](self, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[KGGraph sourcesByTargetWithEdgeIdentifiers:](self, "sourcesByTargetWithEdgeIdentifiers:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (KGDirectedBinaryAdjacency *)v17;
  }
  -[KGDirectedBinaryAdjacency unionWith:](v10, "unionWith:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)adjacencyWithTargetNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeDirection:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  KGDirectedBinaryAdjacency *v10;
  void *v11;
  void *v12;
  KGDirectedBinaryAdjacency *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if ((v5 & 2) != 0)
  {
    -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGGraph edgeIdentifiersMatchingFilter:intersectingIdentifiers:](self, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[KGGraph targetsBySourceWithEdgeIdentifiers:](self, "targetsBySourceWithEdgeIdentifiers:", v12);
    v13 = (KGDirectedBinaryAdjacency *)objc_claimAutoreleasedReturnValue();

    if ((v5 & 1) == 0)
      goto LABEL_9;
    v10 = v13;
  }
  else
  {
    if ((v5 & 1) == 0)
      goto LABEL_10;
    v10 = 0;
  }
  -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v8, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph edgeIdentifiersMatchingFilter:intersectingIdentifiers:](self, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[KGGraph sourcesByTargetWithEdgeIdentifiers:](self, "sourcesByTargetWithEdgeIdentifiers:", v15);
  v13 = (KGDirectedBinaryAdjacency *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_9:
    if (v13)
      goto LABEL_12;
LABEL_10:
    v13 = objc_alloc_init(KGDirectedBinaryAdjacency);
    goto LABEL_12;
  }
  if (v13)
  {
    -[KGDirectedBinaryAdjacency unionWith:](v10, "unionWith:", v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (KGDirectedBinaryAdjacency *)v16;
  }
  else
  {
    v13 = v10;
  }
LABEL_12:

  return v13;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3
{
  return -[KGGraph _edgeIdentifiersMatchingFilter:intersectingIdentifiers:](self, "_edgeIdentifiersMatchingFilter:intersectingIdentifiers:", a3, 0);
}

- (id)_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  KGGraphImplementation *implementation;
  KGElementIdentifierSet *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v9 = 0;
  -[KGGraphImplementation edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](implementation, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", a3, a4, &v9);
  v5 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    KGLoggingConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1CA0A5000, v7, OS_LOG_TYPE_ERROR, "Error fetching edge identifiers with error(%@)", buf, 0xCu);
    }

    v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4
{
  KGGraphImplementation *implementation;
  KGElementIdentifierSet *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v9 = 0;
  -[KGGraphImplementation edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:](implementation, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:", a3, a4, &v9);
  v5 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    KGLoggingConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1CA0A5000, v7, OS_LOG_TYPE_ERROR, "Error fetching edge identifiers for nodes with error(%@)", buf, 0xCu);
    }

    v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)edgeIdentifiersBetweenStartNodeIdentifiers:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6
{
  KGGraphImplementation *implementation;
  KGElementIdentifierSet *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v11 = 0;
  -[KGGraphImplementation edgeIdentifiersBetween:endNodeIdentifiers:edgeFilter:edgeDirection:error:](implementation, "edgeIdentifiersBetween:endNodeIdentifiers:edgeFilter:edgeDirection:error:", a3, a4, a5, a6, &v11);
  v7 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v7)
  {
    KGLoggingConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1CA0A5000, v9, OS_LOG_TYPE_ERROR, "Error fetching edge identifiers for nodes with error(%@)", buf, 0xCu);
    }

    v7 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v7;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5
{
  KGGraphImplementation *implementation;
  KGElementIdentifierSet *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v10 = 0;
  -[KGGraphImplementation neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:](implementation, "neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:", a3, a4, a5, &v10);
  v6 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
  {
    KGLoggingConnection();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_1CA0A5000, v8, OS_LOG_TYPE_ERROR, "Error fetching neighbor node identifiers with error(%@)", buf, 0xCu);
    }

    v6 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v6;
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5
{
  KGGraphImplementation *implementation;
  KGElementIdentifierSet *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  implementation = self->_implementation;
  v10 = 0;
  -[KGGraphImplementation transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:](implementation, "transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:", a3, a4, a5, &v10);
  v6 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
  {
    KGLoggingConnection();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_1CA0A5000, v8, OS_LOG_TYPE_ERROR, "Error fetching transitive closure neighbor node identifiers with error(%@)", buf, 0xCu);
    }

    v6 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v6;
}

- (id)nodeLabels
{
  return (id)-[KGGraphImplementation nodeLabels](self->_implementation, "nodeLabels");
}

- (id)edgeLabels
{
  return (id)-[KGGraphImplementation edgeLabels](self->_implementation, "edgeLabels");
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  return (id)-[KGGraphImplementation labelsOfNodesForIdentifiers:](self->_implementation, "labelsOfNodesForIdentifiers:", a3);
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  return (id)-[KGGraphImplementation labelsOfEdgesForIdentifiers:](self->_implementation, "labelsOfEdgesForIdentifiers:", a3);
}

- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5
{
  return (id)-[KGGraphImplementation changesAfterToken:transactionLimit:error:](self->_implementation, "changesAfterToken:transactionLimit:error:", a3, a4, a5);
}

- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6
{
  return (id)-[KGGraphImplementation nodeChangesAfterToken:transactionLimit:nodeFilter:error:](self->_implementation, "nodeChangesAfterToken:transactionLimit:nodeFilter:error:", a3, a4, a5, a6);
}

- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  return (id)-[KGGraphImplementation edgeChangesAfterToken:transactionLimit:edgeFilter:error:](self->_implementation, "edgeChangesAfterToken:transactionLimit:edgeFilter:error:", a3, a4, a5, a6);
}

- (KGGraphImplementation)implementation
{
  return self->_implementation;
}

- (KGEntityFactory)entityFactory
{
  return self->_entityFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityFactory, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
}

@end
