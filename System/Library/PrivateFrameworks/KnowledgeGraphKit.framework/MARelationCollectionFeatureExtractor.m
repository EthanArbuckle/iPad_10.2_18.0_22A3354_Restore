@implementation MARelationCollectionFeatureExtractor

- (MARelationCollectionFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MARelationCollectionFeatureExtractor *v15;
  MARelationCollectionFeatureExtractor *v16;
  MAIndexCache *v17;
  MAIndexCache *featureNameIndexCache;
  void *v19;
  id labelForTargetBlock;
  NSString *labelForEmptyRelation;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MARelationCollectionFeatureExtractor;
  v15 = -[MARelationCollectionFeatureExtractor init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v17 = -[MAIndexCache initWithLabels:]([MAIndexCache alloc], "initWithLabels:", v12);
    featureNameIndexCache = v16->_featureNameIndexCache;
    v16->_featureNameIndexCache = v17;

    objc_storeStrong((id *)&v16->_relation, a5);
    v19 = _Block_copy(v14);
    labelForTargetBlock = v16->_labelForTargetBlock;
    v16->_labelForTargetBlock = v19;

    labelForEmptyRelation = v16->_labelForEmptyRelation;
    v16->_labelForEmptyRelation = 0;

  }
  return v16;
}

- (MARelationCollectionFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForEmptyRelation:(id)a6 labelForTargetBlock:(id)a7
{
  id v13;
  MARelationCollectionFeatureExtractor *v14;
  MARelationCollectionFeatureExtractor *v15;

  v13 = a6;
  v14 = -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](self, "initWithName:featureNames:relation:labelForTargetBlock:", a3, a4, a5, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_labelForEmptyRelation, a6);

  return v15;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  int v26;
  void *v27;
  uint64_t v28;
  double v29;
  __int128 v31;
  void *v32;
  void *v33;
  id obj;
  id v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];
  id v42;
  uint8_t *v43;
  id *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[4];
  int v55;
  __int16 v56;
  const char *v57;
  uint8_t v58[128];
  uint8_t buf[8];
  __int128 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v33 = v8;
  if (!objc_msgSend(v35, "isCancelledWithProgress:", 0.0))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v51 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      }
      while (v12);
    }

    v38 = objc_msgSend(v10, "count");
    -[MARelationCollectionFeatureExtractor featureNames](self, "featureNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v15, "count");

    +[MAFloatMatrix zerosWithRows:columns:](MAMutableFloatMatrix, "zerosWithRows:columns:", v38, v36);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "graph");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      v16 = v16;
      v9 = v16;
LABEL_46:

      goto LABEL_47;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v60 = buf;
    *((_QWORD *)&v60 + 1) = 0x2020000000;
    v61 = 0;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v10;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v18)
    {
      v20 = 0;
      v37 = 0;
      v40 = *(_QWORD *)v47;
      v21 = MEMORY[0x1E0C81028];
      *(_QWORD *)&v19 = 67109378;
      v31 = v19;
LABEL_15:
      v39 = v18;
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(obj);
        +[MANodeCollection nodesRelatedToNodes:withRelation:](MANodeCollection, "nodesRelatedToNodes:withRelation:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v22), self->_relation, v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __87__MARelationCollectionFeatureExtractor_floatMatrixWithEntities_progressReporter_error___block_invoke;
        v41[3] = &unk_1E83E26E0;
        v41[4] = self;
        v43 = buf;
        v44 = a5;
        v16 = v16;
        v42 = v16;
        v45 = v20;
        objc_msgSend(v23, "enumerateNodesUsingBlock:", v41);
        if (*a5)
        {
          +[MAFloatMatrix zerosWithRows:columns:](MAMutableFloatMatrix, "zerosWithRows:columns:", v38, v36);
          v24 = objc_claimAutoreleasedReturnValue();

          v25 = 0;
          v26 = 6;
          v16 = (id)v24;
        }
        else
        {
          if (!objc_msgSend(v23, "count"))
          {
            if (self->_labelForEmptyRelation)
            {
              -[MARelationCollectionFeatureExtractor featureNameIndexCache](self, "featureNameIndexCache");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "indexOfLabel:", self->_labelForEmptyRelation);
              *(_QWORD *)(v60 + 24) = v28;

              v21 = MEMORY[0x1E0C81028];
              if (*(_QWORD *)(v60 + 24) != 0x7FFFFFFFFFFFFFFFLL)
              {
                LODWORD(v29) = 1.0;
                objc_msgSend(v16, "setFloat:atRow:column:", v20, v29);
              }
            }
          }
          ++v20;
          if ((v37 & 1) != 0 || objc_msgSend(v35, "isCancelledWithProgress:", (double)v20 / (double)v38))
          {
            v26 = 1;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v54 = v31;
              v55 = 122;
              v56 = 2080;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/photoanalysis/PhotosGraph/Modules/Matisse/Fr"
                    "amework/Learning/Feature Extraction/MARelationFeatureExtractor.m";
              _os_log_impl(&dword_1CA0A5000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v54, 0x12u);
            }
            v25 = 0;
            v37 = 1;
          }
          else
          {
            v26 = 0;
            v37 = 0;
            v25 = 1;
          }
        }

        if (!v25)
          break;
        ++v22;
        v21 = MEMORY[0x1E0C81028];
        if (v39 == v22)
        {
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          if (v18)
            goto LABEL_15;

          goto LABEL_36;
        }
      }

      if (v26 != 6 && v26)
        goto LABEL_43;
LABEL_36:
      if ((v37 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

LABEL_40:
      if (!objc_msgSend(v35, "isCancelledWithProgress:", 1.0))
      {
        v16 = v16;
        v9 = v16;
LABEL_45:
        _Block_object_dispose(buf, 8);
        goto LABEL_46;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v54 = 67109378;
      v55 = 125;
      v56 = 2080;
      v57 = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/photoanalysis/PhotosGraph/Modules/Matisse/Framework/"
            "Learning/Feature Extraction/MARelationFeatureExtractor.m";
      _os_log_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v54, 0x12u);
    }
LABEL_43:
    v9 = 0;
    goto LABEL_45;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 66;
    LOWORD(v60) = 2080;
    *(_QWORD *)((char *)&v60 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/photoanalysis/PhotosGraph/Mo"
                                    "dules/Matisse/Framework/Learning/Feature Extraction/MARelationFeatureExtractor.m";
    _os_log_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v9 = 0;
LABEL_47:

  return v9;
}

- (id)featureNames
{
  return -[MAIndexCache labels](self->_featureNameIndexCache, "labels");
}

- (id)name
{
  return self->_name;
}

- (MAIndexCache)featureNameIndexCache
{
  return self->_featureNameIndexCache;
}

- (MARelation)relation
{
  return self->_relation;
}

- (id)labelForTargetBlock
{
  return self->_labelForTargetBlock;
}

- (NSString)labelForEmptyRelation
{
  return self->_labelForEmptyRelation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelForEmptyRelation, 0);
  objc_storeStrong(&self->_labelForTargetBlock, 0);
  objc_storeStrong((id *)&self->_relation, 0);
  objc_storeStrong((id *)&self->_featureNameIndexCache, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __87__MARelationCollectionFeatureExtractor_floatMatrixWithEntities_progressReporter_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  double v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "labelForTargetBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))v7)[2](v7, v6, *(_QWORD *)(a1 + 56));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (**(_QWORD **)(a1 + 56))
  {
    *a3 = 1;
LABEL_3:
    v8 = v11;
    goto LABEL_4;
  }
  v8 = v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "featureNameIndexCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "indexOfLabel:", v11);

    v8 = v11;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      LODWORD(v10) = 1.0;
      objc_msgSend(*(id *)(a1 + 40), "setFloat:atRow:column:", *(_QWORD *)(a1 + 64), v10);
      goto LABEL_3;
    }
  }
LABEL_4:

}

@end
