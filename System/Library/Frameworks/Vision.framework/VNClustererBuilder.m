@implementation VNClustererBuilder

- (VNClustererBuilder)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  VNClustererBuilder *v19;
  VNClustererReadWriteContext *v20;
  double v21;
  uint64_t v22;
  VNClustererModelQuerying *context;
  VNClustererBuilder *v24;
  void *v25;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VNClustererBuilder;
  v19 = -[VNClustererBuilder init](&v27, sel_init);
  if (!v19)
  {
    if (!a9)
      goto LABEL_10;
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v24 = 0;
    *a9 = v25;
    goto LABEL_11;
  }
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy")) & 1) == 0)
  {
    if (!a9)
      goto LABEL_10;
    +[VNError errorForInvalidOption:named:localizedDescription:](VNError, "errorForInvalidOption:named:localizedDescription:", v16, CFSTR("type"), CFSTR("unsupported cluster algorithm type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v20 = [VNClustererReadWriteContext alloc];
  *(float *)&v21 = a6;
  v22 = -[VNClustererReadWriteContext initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:](v20, "initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:", v16, v17, v18, a7, a8, a9, v21);
  context = v19->_context;
  v19->_context = (VNClustererModelQuerying *)v22;

  if (!v19->_context)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_11;
  }
  v24 = v19;
LABEL_11:

  return v24;
}

- (VNClustererBuilder)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v18;
  id v19;
  id v20;
  VNClustererBuilder *v21;
  VNClustererReadWriteContext *v22;
  double v23;
  double v24;
  uint64_t v25;
  VNClustererModelQuerying *context;
  VNClustererBuilder *v27;
  objc_super v29;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VNClustererBuilder;
  v21 = -[VNClustererBuilder init](&v29, sel_init);
  if (v21
    && objc_msgSend(v18, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso"))
    && (v22 = [VNClustererReadWriteContext alloc],
        *(float *)&v23 = a6,
        *(float *)&v24 = a7,
        v25 = -[VNClustererReadWriteContext initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](v22, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", v18, v19, v20, a8, a9, a10, v23, v24), context = v21->_context, v21->_context = (VNClustererModelQuerying *)v25, context, v21->_context))
  {
    v27 = v21;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)resetModelState:(id)a3 error:(id *)a4
{
  return -[VNClustererModelQuerying resetModelState:error:](self->_context, "resetModelState:error:", a3, a4);
}

- (id)saveAndReturnCurrentModelState:(id *)a3
{
  return (id)-[VNClustererModelQuerying saveAndReturnCurrentModelState:](self->_context, "saveAndReturnCurrentModelState:", a3);
}

- (id)updateModelByAddingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  -[VNClustererBuilder updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", a3, 0, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 canceller:(id)a5 error:(id *)a6
{
  -[VNClustererBuilder updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", a3, a4, 0, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateModelByRemovingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  -[VNClustererBuilder updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", 0, 0, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateModelByAddingFaces:(id)a3 andRemovingFaces:(id)a4 canceller:(id)a5 error:(id *)a6
{
  -[VNClustererBuilder updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingFaces:(id)a5 canceller:(id)a6 error:(id *)a7
{
  -[VNClustererModelQuerying updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self->_context, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateModelByAddingPersons:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingPersons:(id)a5 canceller:(id)a6 error:(id *)a7
{
  -[VNClustererModelQuerying updateModelByAddingPersons:withGroupingIdentifiers:andRemovingPersons:canceller:error:](self->_context, "updateModelByAddingPersons:withGroupingIdentifiers:andRemovingPersons:canceller:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allClusteredFaceIdsAndReturnError:(id *)a3
{
  return (id)-[VNClustererModelQuerying allClusteredFaceIdsAndReturnError:](self->_context, "allClusteredFaceIdsAndReturnError:", a3);
}

- (id)clusteredFaceIdsForClusterContainingFaceId:(id)a3 error:(id *)a4
{
  -[VNClustererModelQuerying clusteredFaceIdsForClusterContainingFaceId:error:](self->_context, "clusteredFaceIdsForClusterContainingFaceId:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getAllClustersAndReturnError:(id *)a3
{
  return (id)-[VNClustererModelQuerying getAllClustersAndReturnError:](self->_context, "getAllClustersAndReturnError:", a3);
}

- (id)l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:(id)a3 error:(id *)a4
{
  -[VNClustererModelQuerying l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:error:](self->_context, "l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5
{
  -[VNClustererModelQuerying getDistances:to:error:](self->_context, "getDistances:to:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)distanceBetweenClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5
{
  -[VNClustererModelQuerying distanceBetweenClustersWithFaceId:andFaceId:error:](self->_context, "distanceBetweenClustersWithFaceId:andFaceId:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)distanceBetweenLevel1Clusters:(id)a3 error:(id *)a4
{
  -[VNClustererModelQuerying distanceBetweenLevel1Clusters:error:](self->_context, "distanceBetweenLevel1Clusters:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)suggestionsForClustersWithFaceIds:(id)a3 affinityThreshold:(float)a4 canceller:(id)a5 error:(id *)a6
{
  -[VNClustererModelQuerying suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:](self->_context, "suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:", a3, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)maximumFaceIdInModelAndReturnError:(id *)a3
{
  return (id)-[VNClustererModelQuerying maximumFaceIdInModelAndReturnError:](self->_context, "maximumFaceIdInModelAndReturnError:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

+ (id)clustererBuilderWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  VNClustererBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  VNClustererBuilder *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy"));

    if (v8)
    {
      v9 = [VNClustererBuilder alloc];
      objc_msgSend(v6, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "threshold");
      v14 = v13;
      v15 = objc_msgSend(v6, "requestRevision");
      v16 = objc_msgSend(v6, "torsoprintRequestRevision");
      LODWORD(v17) = v14;
      v18 = -[VNClustererBuilder initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:](v9, "initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:", v10, v11, v12, v15, v16, a4, v17);
LABEL_8:
      v19 = (void *)v18;

      goto LABEL_10;
    }
    objc_msgSend(v6, "type");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso"));

    if (v21)
    {
      v22 = [VNClustererBuilder alloc];
      objc_msgSend(v6, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "threshold");
      v24 = v23;
      objc_msgSend(v6, "torsoThreshold");
      v26 = v25;
      v27 = objc_msgSend(v6, "requestRevision");
      v28 = objc_msgSend(v6, "torsoprintRequestRevision");
      LODWORD(v29) = v24;
      LODWORD(v30) = v26;
      v18 = -[VNClustererBuilder initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](v22, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", v10, v11, v12, v27, v28, a4, v29, v30);
      goto LABEL_8;
    }
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("options parameter cannot be nil"));
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v19;
}

+ (id)representativenessForFaces:(id)a3 error:(id *)a4
{
  +[VNClustererReadOnlyContext representativenessForFaces:error:](VNClustererReadOnlyContext, "representativenessForFaces:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5
{
  +[VNClustererReadOnlyContext distanceBetweenFacesWithFaceprint:andFaceprint:error:](VNClustererReadOnlyContext, "distanceBetweenFacesWithFaceprint:andFaceprint:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(a3, "faceprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "faceprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "distanceBetweenFacesWithFaceprint:andFaceprint:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5
{
  +[VNClustererReadWriteContext clustererModelFileNamesFromState:storedInPath:error:](VNClustererReadWriteContext, "clustererModelFileNamesFromState:storedInPath:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)nonGroupedGroupID
{
  return +[VNClustererQuery nonGroupedGroupID](VNClustererQuery, "nonGroupedGroupID");
}

@end
