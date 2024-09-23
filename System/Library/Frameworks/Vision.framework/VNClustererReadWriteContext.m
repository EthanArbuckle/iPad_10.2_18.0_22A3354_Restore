@implementation VNClustererReadWriteContext

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8
{
  return -[VNClustererReadWriteContext initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a7, 1, a8);
}

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  double v19;
  VNClustererReadWriteContext *v20;
  uint64_t v21;
  VNClusteringReadOnly *clusterer;
  VNClustererReadWriteContext *v23;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v25.receiver = self;
  v25.super_class = (Class)VNClustererReadWriteContext;
  *(float *)&v19 = a6;
  v20 = -[VNClustererContextBase initWithType:cachePath:state:readOnly:threshold:requestRevision:torsoprintRequestRevision:error:](&v25, sel_initWithType_cachePath_state_readOnly_threshold_requestRevision_torsoprintRequestRevision_error_, v16, v17, v18, 0, a7, a8, v19, a9);
  if (v20
    && (-[VNClustererContextBase _createGreedyClusterer:state:error:](v20, "_createGreedyClusterer:state:error:", objc_opt_class(), v18, a9), v21 = objc_claimAutoreleasedReturnValue(), clusterer = v20->_clusterer, v20->_clusterer = (VNClusteringReadOnly *)v21, clusterer, v20->_clusterer))
  {
    v23 = v20;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9
{
  return -[VNClustererReadWriteContext initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a8, 1, a9);
}

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  VNClustererReadWriteContext *v23;
  uint64_t v24;
  VNClusteringReadOnly *clusterer;
  VNClustererReadWriteContext *v26;
  objc_super v28;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VNClustererReadWriteContext;
  *(float *)&v21 = a6;
  *(float *)&v22 = a7;
  v23 = -[VNClustererContextBase initWithType:cachePath:state:readOnly:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](&v28, sel_initWithType_cachePath_state_readOnly_threshold_torsoThreshold_requestRevision_torsoprintRequestRevision_error_, v18, v19, v20, 0, a8, a9, v21, v22, a10);
  if (v23
    && (-[VNClustererContextBase _createGreedyClusterer:state:error:](v23, "_createGreedyClusterer:state:error:", objc_opt_class(), v20, a10), v24 = objc_claimAutoreleasedReturnValue(), clusterer = v23->_clusterer, v23->_clusterer = (VNClusteringReadOnly *)v24, clusterer, v23->_clusterer))
  {
    v26 = v23;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)resetModelState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[VNClustererContextBase _createGreedyClusterer:state:error:](self, "_createGreedyClusterer:state:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v7 != 0;

  return (char)a4;
}

- (id)saveAndReturnCurrentModelState:(id *)a3
{
  return (id)-[VNClusteringReadOnly getClusterState:](self->_clusterer, "getClusterState:", a3);
}

- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingFaces:(id)a5 canceller:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  VNCanceller *v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (VNCanceller *)a6;
  if (!v15)
    v15 = objc_alloc_init(VNCanceller);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;
  if (v12)
    objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("VNClusterOptionAddObjectsToClustering"));
  if (v14)
    objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("VNClusterOptionRemoveObjectsFromClustering"));
  if (v13)
    objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("VNClusterOptionAddObjectGroupIdsToClustering"));
  -[VNClustererReadWriteContext _updateClustererWithOptions:canceller:error:](self, "_updateClustererWithOptions:canceller:error:", v17, v15, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)updateModelByAddingPersons:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingPersons:(id)a5 canceller:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;
  if (v12)
    objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("VNClusterOptionAddObjectsToClustering"));
  if (v14)
    objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("VNClusterOptionRemoveObjectsFromClustering"));
  if (v13)
    objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("VNClusterOptionAddObjectGroupIdsToClustering"));
  -[VNClustererReadWriteContext _updateClustererWithOptions:canceller:error:](self, "_updateClustererWithOptions:canceller:error:", v17, v15, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_updateClustererWithOptions:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8;
  VNCanceller *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v9 = (VNCanceller *)a4;
  if (!v9)
    v9 = objc_alloc_init(VNCanceller);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__447;
  v38 = __Block_byref_object_dispose__448;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__447;
  v32 = __Block_byref_object_dispose__448;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__447;
  v26 = __Block_byref_object_dispose__448;
  v27 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke;
  v18[3] = &unk_1E4542078;
  v20 = &v34;
  v18[4] = self;
  v11 = v8;
  v19 = v11;
  v21 = &v28;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke_2;
  v17[3] = &unk_1E4543D38;
  v17[4] = self;
  v17[5] = &v22;
  if (-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v9, "tryToPerformBlock:usingSignallingBlock:", v18, v17))
  {
    v12 = (void *)v35[5];
    if (v12)
    {
      v13 = (void *)v23[5];
      if (!v13)
      {
        v15 = v12;
        goto LABEL_16;
      }
      if (!a5)
        goto LABEL_14;
      goto LABEL_12;
    }
    if (a5)
    {
      v13 = (void *)v29[5];
LABEL_12:
      v14 = objc_retainAutorelease(v13);
      goto LABEL_13;
    }
LABEL_14:
    v15 = 0;
    goto LABEL_16;
  }
  if (!a5)
    goto LABEL_14;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 1, CFSTR("Clustering request has been cancelled"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v15 = 0;
  *a5 = v14;
LABEL_16:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v15;
}

- (id)updateModelByAddingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  -[VNClustererReadWriteContext updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", a3, 0, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateModelByRemovingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  -[VNClustererReadWriteContext updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", 0, 0, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateModelByAddingFaces:(id)a3 andRemovingFaces:(id)a4 canceller:(id)a5 error:(id *)a6
{
  -[VNClustererReadWriteContext updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:](self, "updateModelByAddingFaces:withGroupingIdentifiers:andRemovingFaces:canceller:error:", a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)cancelClustering:(id *)a3
{
  return 0;
}

- (id)allClusteredFaceIdsAndReturnError:(id *)a3
{
  return (id)-[VNClusteringReadOnly getClusteredIds:](self->_clusterer, "getClusteredIds:", a3);
}

- (id)clusteredFaceIdsForClusterContainingFaceId:(id)a3 error:(id *)a4
{
  -[VNClusteringReadOnly getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId:error:](self->_clusterer, "getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getAllClustersAndReturnError:(id *)a3
{
  return (id)-[VNClusteringReadOnly getAllClustersFromStateAndReturnError:](self->_clusterer, "getAllClustersFromStateAndReturnError:", a3);
}

- (id)l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:(id)a3 error:(id *)a4
{
  -[VNClusteringReadOnly getClustersForClusterIds:options:error:](self->_clusterer, "getClustersForClusterIds:options:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)distanceBetweenClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5
{
  -[VNClusteringReadOnly getDistanceBetweenLevel0ClustersWithFaceId:andFaceId:error:](self->_clusterer, "getDistanceBetweenLevel0ClustersWithFaceId:andFaceId:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)distanceBetweenLevel1Clusters:(id)a3 error:(id *)a4
{
  -[VNClusteringReadOnly getDistanceBetweenLevel1Clusters:error:](self->_clusterer, "getDistanceBetweenLevel1Clusters:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5
{
  -[VNClusteringReadOnly getDistances:to:error:](self->_clusterer, "getDistances:to:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)maximumFaceIdInModelAndReturnError:(id *)a3
{
  return (id)-[VNClusteringReadOnly maximumFaceIdInModelAndReturnError:](self->_clusterer, "maximumFaceIdInModelAndReturnError:", a3);
}

- (id)suggestionsForClustersWithFaceIds:(id)a3 affinityThreshold:(float)a4 canceller:(id)a5 error:(id *)a6
{
  id v10;
  VNCanceller *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  float v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = (VNCanceller *)a5;
  if (!v11)
    v11 = objc_alloc_init(VNCanceller);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__447;
  v34 = __Block_byref_object_dispose__448;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__447;
  v28 = __Block_byref_object_dispose__448;
  v29 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke;
  v19[3] = &unk_1E4542050;
  v21 = &v30;
  v19[4] = self;
  v13 = v10;
  v23 = a4;
  v20 = v13;
  v22 = &v24;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke_2;
  v18[3] = &unk_1E45455C8;
  v18[4] = self;
  if (!-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v11, "tryToPerformBlock:usingSignallingBlock:", v19, v18))
  {
    if (a6)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 1, CFSTR("Suggestions request has been cancelled"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v15 = 0;
      *a6 = v16;
      goto LABEL_12;
    }
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v14 = (void *)v31[5];
  if (!v14)
  {
    if (a6)
    {
      v16 = objc_retainAutorelease((id)v25[5]);
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v15 = v14;
LABEL_12:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterer, 0);
}

void __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  LODWORD(a2) = *(_DWORD *)(a1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "suggestionsForClusterIdsWithFlags:affinityThreshold:error:", v3, &obj, a2);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "cancelClustering:", 0);
}

void __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 64);
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "getClustersWithOptions:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3 = *(_QWORD *)(v1 + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "cancelClustering:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

+ (id)representativenessForFaces:(id)a3 error:(id *)a4
{
  +[VNClustererReadOnlyContext representativenessForFaces:error:](VNClustererReadOnlyContext, "representativenessForFaces:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  objc_msgSend(a3, "faceprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNClustererReadWriteContext distanceBetweenFacesWithFaceprint:andFaceprint:error:](VNClustererReadWriteContext, "distanceBetweenFacesWithFaceprint:andFaceprint:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5
{
  +[VNClustererReadOnlyContext distanceBetweenFacesWithFaceprint:andFaceprint:error:](VNClustererReadOnlyContext, "distanceBetweenFacesWithFaceprint:andFaceprint:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
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
