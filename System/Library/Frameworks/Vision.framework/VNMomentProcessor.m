@implementation VNMomentProcessor

- (VNMomentProcessor)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNMomentProcessor *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  double v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  void *v45;
  double v46;
  objc_super v48;

  v6 = a3;
  if (!a4)
    __assert_rtn("-[VNMomentProcessor initWithOptions:error:]", "MomentProcessor.mm", 35, "error != nil");
  v48.receiver = self;
  v48.super_class = (Class)VNMomentProcessor;
  v7 = -[VNMomentProcessor init](&v48, sel_init);
  if (v7)
  {
    *a4 = 0;
    v8 = (void *)objc_opt_new();
    -[VNMomentProcessor setContext:](v7, "setContext:", v8);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C6A0, v6, &unk_1E459C6A0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    -[VNMomentProcessor context](v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDebugMode:", v10);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C6B8, v6, &unk_1E459C6A0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");
    -[VNMomentProcessor context](v7, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimerMode:", v13);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C6D0, v6, &unk_1E459DFD0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNMomentProcessor context](v7, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setQualityCriteriaList:", v15);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C700, v6, &unk_1E459C6A0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");
    -[VNMomentProcessor context](v7, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClusterSplitDistanceType:", v18);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C6E8, v6, MEMORY[0x1E0C9AAB0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");
    -[VNMomentProcessor context](v7, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUseTimestampAdjustedDistances:", v21);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C718, v6, MEMORY[0x1E0C9AAB0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");
    -[VNMomentProcessor context](v7, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPerformClustersPostprocessing:", v24);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C730, v6, MEMORY[0x1E0C9AAA0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");
    -[VNMomentProcessor context](v7, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPerformSceneClassification:", v27);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C748, v6, &unk_1E459E5D8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    v31 = v30;
    -[VNMomentProcessor context](v7, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = v31;
    objc_msgSend(v32, "setRoiAreaThreshold:", v33);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C760, v6, &unk_1E459E5E8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "floatValue");
    v36 = v35;
    -[VNMomentProcessor context](v7, "context");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = v36;
    objc_msgSend(v37, "setInliersRatioThreshold:", v38);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C778, v6, &unk_1E459C790);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "intValue");
    -[VNMomentProcessor context](v7, "context");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setNumberOfKeypointsToConsider:", v40);

    -[VNMomentProcessor getKey:fromDictionary:withDefault:](v7, "getKey:fromDictionary:withDefault:", &unk_1E459C7A8, v6, &unk_1E459E5F8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "floatValue");
    v44 = v43;
    -[VNMomentProcessor context](v7, "context");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = v44;
    objc_msgSend(v45, "setNaturalClusteringDistanceThreshold:", v46);

  }
  return v7;
}

- (id)computeClusteringOfImageDescriptors:(id)a3 intoKGroups:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (!a5)
    __assert_rtn("-[VNMomentProcessor computeClusteringOfImageDescriptors:intoKGroups:error:]", "MomentProcessor.mm", 103, "error != nil");
  -[VNMomentProcessor computeClusteringTreeForImageDescriptors:error:](self, "computeClusteringTreeForImageDescriptors:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a5)
  {
    v10 = 0;
  }
  else
  {
    -[VNMomentProcessor computeClusteringForClusteringTree:intoKGroups:error:](self, "computeClusteringForClusteringTree:intoKGroups:error:", v9, v6, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)computeNaturalClusteringOfImageDescriptors:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (!a4)
    __assert_rtn("-[VNMomentProcessor computeNaturalClusteringOfImageDescriptors:error:]", "MomentProcessor.mm", 112, "error != nil");
  -[VNMomentProcessor computeClusteringTreeForImageDescriptors:error:](self, "computeClusteringTreeForImageDescriptors:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a4)
  {
    v8 = 0;
  }
  else
  {
    -[VNMomentProcessor computeNaturalClusteringForClusteringTree:error:](self, "computeNaturalClusteringForClusteringTree:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)computeClusteringTreeForImageDescriptors:(id)a3 error:(id *)a4
{
  -[VNMomentProcessor computeClusteringTreeForImageDescriptors:assumeDescriptorsAreSorted:error:](self, "computeClusteringTreeForImageDescriptors:assumeDescriptorsAreSorted:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)computeClusteringTreeForImageDescriptors:(id)a3 assumeDescriptorsAreSorted:(BOOL)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  VNMPClusteringTreeNodeWrapper *v19;
  VNMPClusteringTreeNodeWrapper *v20;
  uint64_t v22;

  v8 = a3;
  if (!a5)
    __assert_rtn("-[VNMomentProcessor computeClusteringTreeForImageDescriptors:assumeDescriptorsAreSorted:error:]", "MomentProcessor.mm", 130, "error != nil");
  v9 = v8;
  v10 = v9;
  if (!a4)
  {
    +[VNMPUtils getHostTime](VNMPUtils, "getHostTime");
    v12 = v11;
    +[VNMomentProcessor sortImageDescriptorsChronologically:](VNMomentProcessor, "sortImageDescriptorsChronologically:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    +[VNMPUtils getHostTime](VNMPUtils, "getHostTime");
    v10 = (void *)v13;
    syslog(5, "Sorting of the image list took: %3.3f ms", (v14 - v12) * 1000.0);
  }
  +[VNMPUtils getHostTime](VNMPUtils, "getHostTime");
  v16 = v15;
  v22 = 0;
  -[VNMomentProcessor context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNMPImageGrouping computeHierarchicalClusteringOfImageDescriptors:results:context:](VNMPImageGrouping, "computeHierarchicalClusteringOfImageDescriptors:results:context:", v10, &v22, v17);

  +[VNMPUtils getHostTime](VNMPUtils, "getHostTime");
  syslog(5, "Computation of the hierarchical clustering took: %3.3f ms", (v18 - v16) * 1000.0);
  v19 = [VNMPClusteringTreeNodeWrapper alloc];
  v20 = -[VNMPClusteringTreeNodeWrapper initWithNode:freeNodeOnDealloc:](v19, "initWithNode:freeNodeOnDealloc:", v22, 1);

  return v20;
}

- (id)convertClusterNodesListToDescriptorsList:(vector<MPClusteringTreeNode *)
{
  void *v4;
  MPClusteringTreeNode **var1;
  MPClusteringTreeNode **var0;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD **v10;
  _QWORD **i;
  MPClusteringTreeNode v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = a3->var0;
  var1 = a3->var1;
  while (var0 != var1)
  {
    v7 = (uint64_t)*var0;
    if (*var0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MPClusteringTreeNode::getLeafNodes(&v13, v7);
      v9 = v13.var0;
      v10 = *(_QWORD ***)&v13.var1;
      for (i = (_QWORD **)v13.var0; i != v10; ++i)
        objc_msgSend(v8, "addObject:", **i);
      objc_msgSend(v4, "addObject:", v8);
      if (v9)
        operator delete(v9);

      var1 = a3->var1;
    }
    ++var0;
  }
  return v4;
}

- (id)performClustersPostprocessing:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)computeClusteringForClusteringTree:(id)a3 intoKGroups:(int)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *__p;
  void *v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;

  v6 = *(_QWORD *)&a4;
  v8 = objc_msgSend(a3, "node");
  -[VNMomentProcessor context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNMPImageGrouping computeClusteringIntoKGroups:forHierarchicalTree:context:](VNMPImageGrouping, "computeClusteringIntoKGroups:forHierarchicalTree:context:", v6, v8, v9);

  __p = 0;
  v14 = 0;
  v15 = 0;
  std::vector<MPClusteringTreeNode *>::__init_with_size[abi:ne180100]<MPClusteringTreeNode **,MPClusteringTreeNode **>(&__p, v16, (uint64_t)v17, (v17 - (_BYTE *)v16) >> 3);
  -[VNMomentProcessor convertClusterNodesListToDescriptorsList:](self, "convertClusterNodesListToDescriptorsList:", &__p);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNMomentProcessor performClustersPostprocessing:error:](self, "performClustersPostprocessing:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  if (v16)
  {
    v17 = v16;
    operator delete(v16);
  }
  return v11;
}

- (id)computeClusteringForClusteringTree:(id)a3 usingThreshold:(float)a4 error:(id *)a5
{
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *__p;
  void *v15;
  uint64_t v16;
  void *v17;
  _BYTE *v18;

  v8 = objc_msgSend(a3, "node");
  -[VNMomentProcessor context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  +[VNMPImageGrouping computeClusteringUsingDistanceThreshold:forHierarchicalTree:context:](VNMPImageGrouping, "computeClusteringUsingDistanceThreshold:forHierarchicalTree:context:", v8, v9, v10);

  __p = 0;
  v15 = 0;
  v16 = 0;
  std::vector<MPClusteringTreeNode *>::__init_with_size[abi:ne180100]<MPClusteringTreeNode **,MPClusteringTreeNode **>(&__p, v17, (uint64_t)v18, (v18 - (_BYTE *)v17) >> 3);
  -[VNMomentProcessor convertClusterNodesListToDescriptorsList:](self, "convertClusterNodesListToDescriptorsList:", &__p);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNMomentProcessor performClustersPostprocessing:error:](self, "performClustersPostprocessing:error:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
  return v12;
}

- (id)computeNaturalClusteringForClusteringTree:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *__p;
  void *v12;
  uint64_t v13;
  void *v14;
  _BYTE *v15;

  v6 = objc_msgSend(a3, "node");
  -[VNMomentProcessor context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNMPImageGrouping computeNaturalClusteringForHierarchicalTree:context:](VNMPImageGrouping, "computeNaturalClusteringForHierarchicalTree:context:", v6, v7);

  __p = 0;
  v12 = 0;
  v13 = 0;
  std::vector<MPClusteringTreeNode *>::__init_with_size[abi:ne180100]<MPClusteringTreeNode **,MPClusteringTreeNode **>(&__p, v14, (uint64_t)v15, (v15 - (_BYTE *)v14) >> 3);
  -[VNMomentProcessor convertClusterNodesListToDescriptorsList:](self, "convertClusterNodesListToDescriptorsList:", &__p);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNMomentProcessor performClustersPostprocessing:error:](self, "performClustersPostprocessing:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
  if (v14)
  {
    v15 = v14;
    operator delete(v14);
  }
  return v9;
}

- (id)getKey:(id)a3 fromDictionary:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (v10)
    v11 = v10;
  else
    v11 = v9;
  v12 = v11;

  return v12;
}

- (VNMPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

+ (id)sortImageDescriptorsChronologically:(id)a3
{
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_5992);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __57__VNMomentProcessor_sortImageDescriptorsChronologically___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "exifTimestamp");
  v7 = objc_msgSend(v5, "exifTimestamp");
  v8 = v6 - v7;
  if (v6 == v7)
  {
    v9 = objc_msgSend(v4, "descriptorId");
    v8 = v9 - objc_msgSend(v5, "descriptorId");
  }
  if (v8 < 1)
    v10 = -1;
  else
    v10 = 1;

  return v10;
}

@end
