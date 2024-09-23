@implementation ARSpatialMappingResultData

+ (id)emptyResultData
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setEmpty:", 1);
  return v2;
}

- (ARSpatialMappingResultData)initWithMeshChunks:(id)a3
{
  id v5;
  ARSpatialMappingResultData *v6;
  ARSpatialMappingResultData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSpatialMappingResultData;
  v6 = -[ARSpatialMappingResultData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_meshChunks, a3);

  return v7;
}

- (ARSpatialMappingResultData)initWithMeshList:(CV3DReconMeshList *)a3 sceneReconstruction:(unint64_t)a4 timestamp:(double)a5
{
  ARSpatialMappingResultData *v8;
  ARSpatialMappingResultData *v9;
  MTLDevice *v10;
  MTLDevice *mtlDevice;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ARSpatialMappingResultData;
  v8 = -[ARSpatialMappingResultData init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_meshList = a3;
    v8->_sceneReconstruction = a4;
    v8->_timestamp = a5;
    v10 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    mtlDevice = v9->_mtlDevice;
    v9->_mtlDevice = v10;

    v9->_meshConfidenceEnabled = 0;
  }
  return v9;
}

- (void)updateSemanticsFromSamplingData:(__CFData *)a3
{
  const UInt8 *BytePtr;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  size_t v11;
  uint64_t j;
  void *__p;
  void *v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  BytePtr = CFDataGetBytePtr(a3);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ARSpatialMappingResultData meshChunks](self, "meshChunks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "faceCount");
        std::vector<unsigned char>::vector(&v16, v11);
        if (v11)
        {
          for (j = 0; j != v11; ++j)
            *((_BYTE *)v16 + j) = ARMeshClassificationFromSemantic(BytePtr[v7 + j]);
          v7 += j;
        }
        __p = 0;
        v14 = 0;
        v15 = 0;
        std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v16, (uint64_t)v17, v17 - (_BYTE *)v16);
        objc_msgSend(v10, "setSemanticsVector:", &__p);
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
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(double)a6
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v14 = a11;
  v15 = a12;
  if (objc_msgSend(a1, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v17);

    v18 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (a1[3])
      objc_msgSend(a1, "anchorsFromMeshListForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v14, v15, a2, a3, a4, a5, a6, a7, a8, a9);
    else
      objc_msgSend(a1, "anchorsFromMeshChunksForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v14, v15, a2, a3, a4, a5, a6, a7, a8, a9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)anchorsFromMeshChunksForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(double)a6
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v30;
  void *v31;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = a11;
  v15 = a12;
  v30 = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ARDictionaryFromAnchors(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "meshChunks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "anchorForReferenceOriginTransform:", a6, a7, a8, a9);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v25)
          v28 = v26 == 0;
        else
          v28 = 0;
        if (v28)
        {
          objc_msgSend(v15, "addObject:", v25);
        }
        else if (v26)
        {
          objc_msgSend(v18, "addObject:", v26);
        }

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v20);
  }

  return v18;
}

- (id)anchorsFromMeshListForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  void *v14;
  uint64_t Count;
  uint64_t v17;
  uint64_t i;
  uint64_t MeshUUIDAtIndex;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  const void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v39;
  id v40;
  id v41;
  void *v42;
  _QWORD v43[2];
  uint64_t (*v44)();
  void *v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v41 = a11;
  v40 = a12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("class == %@"), objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "filteredArrayUsingPredicate:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ARDictionaryFromAnchors(v14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (id)objc_opt_new();
  v47 = 0;
  Count = CV3DReconMeshListGetCount();
  v17 = Count;
  if (Count)
  {
    for (i = 0; v17 != i; ++i)
    {
      MeshUUIDAtIndex = CV3DReconMeshListGetMeshUUIDAtIndex();
      if (v47)
      {
        _ARLogGeneral();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v47;
          *(_DWORD *)buf = 138544130;
          v49 = v22;
          v50 = 2048;
          v51 = a1;
          v52 = 2048;
          v53 = i;
          v54 = 2112;
          v55 = v47;
          _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting mesh at index %ld: %@", buf, 0x2Au);

        }
      }
      else
      {
        v24 = (const void *)MeshUUIDAtIndex;
        v25 = CV3DReconMeshListCopyMeshAtIndex();
        if (!v47)
        {
          v29 = v25;
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v44 = __129__ARSpatialMappingResultData_anchorsFromMeshListForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke;
          v45 = &__block_descriptor_40_e5_v8__0l;
          v46 = v25;
          objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCFUUIDRef:", v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v24);
          objc_msgSend(v42, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          ARMeshAnchorFromMesh(*(void **)(a1 + 48), v29, v30, v31, *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 9), a6, a7, a8, a9, *(double *)(a1 + 40));
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (!v31 || v32)
          {
            if (v32)
              objc_msgSend(v39, "addObject:", v32);
          }
          else
          {
            objc_msgSend(v40, "addObject:", v31);
          }

          ((void (*)(_QWORD *))v44)(v43);
          continue;
        }
        _ARLogGeneral();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v47;
          *(_DWORD *)buf = 138544130;
          v49 = v27;
          v50 = 2048;
          v51 = a1;
          v52 = 2048;
          v53 = i;
          v54 = 2112;
          v55 = v47;
          _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error copying mesh at index %ld: %@", buf, 0x2Au);

        }
      }

    }
  }

  return v39;
}

uint64_t __129__ARSpatialMappingResultData_anchorsFromMeshListForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke()
{
  return CV3DReconMeshRelease();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_meshList)
    CV3DReconMeshListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARSpatialMappingResultData;
  -[ARSpatialMappingResultData dealloc](&v3, sel_dealloc);
}

- (NSArray)meshChunks
{
  return self->_meshChunks;
}

- (void)setMeshChunks:(id)a3
{
  objc_storeStrong((id *)&self->_meshChunks, a3);
}

- (CV3DReconMeshList)meshList
{
  return self->_meshList;
}

- (void)setMeshList:(CV3DReconMeshList *)a3
{
  self->_meshList = a3;
}

- (unint64_t)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (void)setSceneReconstruction:(unint64_t)a3
{
  self->_sceneReconstruction = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (MTLDevice)mtlDevice
{
  return self->_mtlDevice;
}

- (void)setMtlDevice:(id)a3
{
  objc_storeStrong((id *)&self->_mtlDevice, a3);
}

- (BOOL)meshConfidenceEnabled
{
  return self->_meshConfidenceEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlDevice, 0);
  objc_storeStrong((id *)&self->_meshChunks, 0);
}

@end
