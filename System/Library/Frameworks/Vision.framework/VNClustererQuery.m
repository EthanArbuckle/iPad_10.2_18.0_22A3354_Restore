@implementation VNClustererQuery

- (VNClustererQuery)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  VNClustererQuery *v17;
  VNClustererReadOnlyContext *v18;
  double v19;
  uint64_t v20;
  VNClustererModelQuerying *context;
  VNClustererQuery *v22;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VNClustererQuery;
  v17 = -[VNClustererQuery init](&v24, sel_init);
  if (v17
    && objc_msgSend(v14, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy"))
    && (v18 = [VNClustererReadOnlyContext alloc],
        *(float *)&v19 = a6,
        v20 = -[VNClustererReadOnlyContext initWithType:cachePath:state:threshold:requestRevision:error:](v18, "initWithType:cachePath:state:threshold:requestRevision:error:", v14, v15, v16, a7, a8, v19), context = v17->_context, v17->_context = (VNClustererModelQuerying *)v20, context, v17->_context))
  {
    v22 = v17;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (VNClustererQuery)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v18;
  id v19;
  id v20;
  VNClustererQuery *v21;
  VNClustererReadOnlyContext *v22;
  double v23;
  double v24;
  uint64_t v25;
  VNClustererModelQuerying *context;
  VNClustererQuery *v27;
  objc_super v29;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VNClustererQuery;
  v21 = -[VNClustererQuery init](&v29, sel_init);
  if (v21
    && objc_msgSend(v18, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso"))
    && (v22 = [VNClustererReadOnlyContext alloc],
        *(float *)&v23 = a6,
        *(float *)&v24 = a7,
        v25 = -[VNClustererReadOnlyContext initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](v22, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", v18, v19, v20, a8, a9, a10, v23, v24), context = v21->_context, v21->_context = (VNClustererModelQuerying *)v25, context, v21->_context))
  {
    v27 = v21;
  }
  else
  {
    v27 = 0;
  }

  return v27;
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

+ (id)clustererQueryWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  VNClustererQuery *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  VNClustererQuery *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy"));

    if (v8)
    {
      v9 = [VNClustererQuery alloc];
      objc_msgSend(v6, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "threshold");
      v14 = v13;
      v15 = objc_msgSend(v6, "requestRevision");
      LODWORD(v16) = v14;
      v17 = -[VNClustererQuery initWithType:cachePath:state:threshold:requestRevision:error:](v9, "initWithType:cachePath:state:threshold:requestRevision:error:", v10, v11, v12, v15, a4, v16);
LABEL_8:
      v18 = (void *)v17;

      goto LABEL_10;
    }
    objc_msgSend(v6, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso"));

    if (v20)
    {
      v21 = [VNClustererQuery alloc];
      objc_msgSend(v6, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "threshold");
      v23 = v22;
      objc_msgSend(v6, "torsoThreshold");
      v25 = v24;
      v26 = objc_msgSend(v6, "requestRevision");
      v27 = objc_msgSend(v6, "torsoprintRequestRevision");
      LODWORD(v28) = v23;
      LODWORD(v29) = v25;
      v17 = -[VNClustererQuery initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](v21, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", v10, v11, v12, v26, v27, a4, v28, v29);
      goto LABEL_8;
    }
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("options parameter cannot be nil"));
  v18 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v18;
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
  +[VNClustererReadOnlyContext clustererModelFileNamesFromState:storedInPath:error:](VNClustererReadOnlyContext, "clustererModelFileNamesFromState:storedInPath:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)nonGroupedGroupID
{
  return +[VNClustererReadOnlyContext nonGroupedGroupID](VNClustererReadOnlyContext, "nonGroupedGroupID");
}

@end
