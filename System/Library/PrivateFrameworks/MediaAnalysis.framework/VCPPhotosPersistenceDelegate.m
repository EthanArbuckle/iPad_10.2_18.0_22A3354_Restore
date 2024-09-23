@implementation VCPPhotosPersistenceDelegate

- (VCPPhotosPersistenceDelegate)initWithPhotoLibrary:(id)a3
{
  id v4;
  VCPPhotosPersistenceDelegate *v5;
  VCPPhotosPersistenceDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VCPPhotosPersistenceDelegate;
  v5 = -[VCPPhotosPersistenceDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_photoLibrary, v4);

  return v6;
}

+ (id)newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend(v3, "setMinimumVerifiedFaceCount:", 1);
  if (_os_feature_enabled_impl())
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E6B76410);
  return v3;
}

+ (id)newAssetFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *MEMORY[0x1E0CD1990];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  return v3;
}

+ (id)newAllFacesFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v3, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v3, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  if (_os_feature_enabled_impl())
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E6B76428);
  return v3;
}

+ (id)newVisibleFacesFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeNonvisibleFaces:", 0);
  objc_msgSend(v3, "setIncludeTorsoOnlyDetectionData:", 0);
  if (_os_feature_enabled_impl())
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E6B76440);
  return v3;
}

+ (id)newFacesDeterministicSortDescriptors
{
  objc_msgSend(MEMORY[0x1E0CD16F0], "mediaProcessingDeviceIndependentFacesSortDescriptors");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newAllPersonsFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v3, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v3, "setIncludeTorsoOnlyPerson:", 1);
  if (_os_feature_enabled_impl())
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E6B76458);
  return v3;
}

+ (id)newVerifiedPersonsFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType = %d) OR (verifiedType = %d)"), 1, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(v3, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v3, "setIncludeTorsoOnlyPerson:", 1);
  if (_os_feature_enabled_impl())
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_1E6B76470);
  return v3;
}

- (unint64_t)countOfFaces
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v5 = (void *)objc_msgSend(v3, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  objc_msgSend(v5, "setShouldPrefetchCount:", 1);
  v10[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (unint64_t)countOfClusteringEligibleFaces
{
  void *v3;
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v6 = (void *)objc_msgSend(v3, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  objc_msgSend(v6, "setIncludeOnlyFacesWithFaceprints:", 1);
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = objc_loadWeakRetained((id *)p_photoLibrary);
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(faceAlgorithmVersion = %d) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))"), objc_msgSend(v8, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalPredicate:", v9);

  objc_msgSend(v6, "setShouldPrefetchCount:", 1);
  v14[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v10);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  return v12;
}

- (unint64_t)countOfUnclusteredClusteringEligibleFaces
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v3 = objc_msgSend(WeakRetained, "mad_countOfUnclusteredFaces");

  return v3;
}

- (unint64_t)countOfClusteredFaces
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v5 = (void *)objc_msgSend(v3, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  objc_msgSend(v5, "setShouldPrefetchCount:", 1);
  v11[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(clusterSequenceNumber > 0)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (id)unclusteredClusteringEligibleFaceLocalIdentifiers:(id *)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1BCCA1B2C](self, a2, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "mad_unclusteredFacesFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v8, "count"); ++i)
  {
    v11 = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

    objc_autoreleasePoolPop(v11);
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

- (id)deterministicallyOrderedFaceIdentifiersWithLocalIdentifiers:(id)a3 faceprintVersion:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t i;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v4 = *(_QWORD *)&a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v9 = (void *)objc_msgSend(v7, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  v10 = (void *)objc_msgSend((id)objc_opt_class(), "newFacesDeterministicSortDescriptors");
  objc_msgSend(v9, "setInternalSortDescriptors:", v10);

  v20[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchPropertySets:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(manual == 0) AND (faceAlgorithmVersion = %d)"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v12);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v13, "count"); ++i)
  {
    v16 = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

    objc_autoreleasePoolPop(v16);
  }

  return v14;
}

- (id)facesForClusteringWithLocalIdentifiers:(id)a3 faceprintVersion:(int)a4 groupingIdentifiers:(id)a5
{
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v36 = a5;
  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "mad_unclusteredFacesFetchOptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend((id)objc_opt_class(), "newFacesDeterministicSortDescriptors");
  objc_msgSend(v35, "setInternalSortDescriptors:", v9);

  v10 = *MEMORY[0x1E0CD1B68];
  v40[0] = *MEMORY[0x1E0CD1B70];
  v40[1] = v10;
  v11 = *MEMORY[0x1E0CD1B80];
  v40[2] = *MEMORY[0x1E0CD1B58];
  v40[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFetchPropertySets:", v12);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", v34, v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsGroupedByFaceUUIDForFaces:", v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_photoLibrary);
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CD1668];
    objc_msgSend(v39, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchMomentUUIDByAssetUUIDForAssets:options:", v16, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i < objc_msgSend(v13, "count", v33); ++i)
    {
      v18 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "faceClusteringProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "faceprint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (!v22)
      {
        +[VCPPhotosFace faceFromPHFace:copyOption:](VCPPhotosFace, "faceFromPHFace:copyOption:", v19, 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CD16A0];
        objc_msgSend(v19, "localIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "uuidFromLocalIdentifier:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "valueForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKey:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEDE00], "nonGroupedGroupID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v29);

          v30 = (void *)v31;
        }
        if (v23)
        {
          objc_msgSend(v37, "addObject:", v23);
          objc_msgSend(v36, "addObject:", v30);
        }

      }
      objc_autoreleasePoolPop(v18);
    }

  }
  else
  {
    v37 = (id)MEMORY[0x1E0C9AA60];
  }

  return v37;
}

- (id)invalidFaceClusterSequenceNumbersInClusterSequenceNumbers:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, uint64_t, _BYTE *);
  void *v23;
  VCPPhotosPersistenceDelegate *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 1;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__23;
    v33 = __Block_byref_object_dispose__23;
    v34 = 0;
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __123__VCPPhotosPersistenceDelegate_invalidFaceClusterSequenceNumbersInClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke;
    v23 = &unk_1E6B17A70;
    v27 = &v35;
    v28 = &v29;
    v26 = v9;
    v24 = self;
    v12 = v11;
    v25 = v12;
    v13 = _Block_copy(&v20);
    objc_msgSend(v8, "allObjects", v20, v21, v22, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "persistenceDelegate_enumerateInChunksOfSize:withOverageAllowance:usingBlock:", 200, 25, v13);

    if (*((_BYTE *)v36 + 24))
    {
      v15 = v12;
    }
    else
    {
      v15 = 0;
      if (a5)
        *a5 = objc_retainAutorelease((id)v30[5]);
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    if (a5)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not access the library"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v15 = 0;
  }

  return v15;
}

void __123__VCPPhotosPersistenceDelegate_invalidFaceClusterSequenceNumbersInClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  uint64_t v17;
  id obj;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(_QWORD *)(a1 + 48);
  if (!v8)
  {
LABEL_6:
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v17 + 40);
    objc_msgSend(WeakRetained, "faceClusterSequenceNumbersOfFacesWithClusterSequenceNumbers:error:", v7, &obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v17 + 40), obj);

    objc_msgSend(*(id *)(a1 + 40), "minusSet:", v10);
    goto LABEL_7;
  }
  if (!(*(unsigned int (**)(void))(v8 + 16))())
  {
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      (*(void (**)(void))(v15 + 16))();
    goto LABEL_6;
  }
  *a5 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to get CSNs of faces missing from the library"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

LABEL_7:
}

- (void)_categorizeGroupedFacesInFetchResult:(id)a3 intoFaceLocalIdentifiersByFaceGroup:(id)a4 ungroupedFaceLocalIdentifiers:(id *)a5 cancelOrExtendTimeoutBlock:(id)a6 photoLibrary:(id)a7
{
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v21 = a3;
  v11 = a4;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_class();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke;
  v22[3] = &unk_1E6B17AC0;
  v17 = v12;
  v26 = v17;
  v18 = v14;
  v23 = v18;
  v19 = v11;
  v24 = v19;
  v20 = v15;
  v25 = v20;
  objc_msgSend(v16, "enumerateFetchResult:withBatchSize:handler:", v21, 100, v22);
  if (a5)
    *a5 = objc_retainAutorelease(v20);

}

void __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 && (*(unsigned int (**)(void))(v8 + 16))())
  {
    *a5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces:options:", v7, *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke_2;
    aBlock[3] = &unk_1E6B17A98;
    v14 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v10 = _Block_copy(aBlock);
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __175__VCPPhotosPersistenceDelegate__categorizeGroupedFacesInFetchResult_intoFaceLocalIdentifiersByFaceGroup_ungroupedFaceLocalIdentifiers_cancelOrExtendTimeoutBlock_photoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 && (*(unsigned int (**)(void))(v8 + 16))())
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:");
      }
      objc_msgSend(v10, "addObject:", v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    }

  }
}

- (BOOL)ungroupFaceClusterSequenceNumbers:(id)a3 batchSizeForUnclusteringFaces:(unint64_t)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t *v19;
  id *v20;
  BOOL v21;
  char v22;
  id v23;
  BOOL v24;
  id v27;
  id obj;
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v27 = a5;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__23;
  v42 = __Block_byref_object_dispose__23;
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v12)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13);
      v15 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v10, "unionSet:", v14);
      if (objc_msgSend(v10, "count") <= a4)
        goto LABEL_11;
      objc_msgSend(v10, "removeObject:", &unk_1E6B72EF0);
      objc_msgSend(v10, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __129__VCPPhotosPersistenceDelegate_ungroupFaceClusterSequenceNumbers_batchSizeForUnclusteringFaces_cancelOrExtendTimeoutBlock_error___block_invoke;
      v30[3] = &unk_1E6B17AE8;
      v32 = &v44;
      v30[4] = self;
      v31 = v27;
      v33 = &v38;
      objc_msgSend(v16, "persistenceDelegate_enumerateInChunksOfSize:withOverageAllowance:usingBlock:", a4, 0, v30);
      v17 = *((unsigned __int8 *)v45 + 24);
      if (*((_BYTE *)v45 + 24))
      {
        objc_msgSend(v10, "removeAllObjects");
        v18 = 0;
      }
      else
      {
        v18 = 4;
      }

      if (v17)
LABEL_11:
        v18 = 0;
      objc_autoreleasePoolPop(v15);
      if (v18)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v19 = v45;
  if (*((_BYTE *)v45 + 24))
  {
    if (!objc_msgSend(v10, "count"))
    {
LABEL_25:
      v19 = v45;
      goto LABEL_26;
    }
    objc_msgSend(v10, "removeObject:", &unk_1E6B72EF0);
    v20 = (id *)(v39 + 5);
    v29 = (id)v39[5];
    v21 = -[VCPPhotosPersistenceDelegate _ungroupFaceClusterSequenceNumbers:cancelOrExtendTimeoutBlock:error:](self, "_ungroupFaceClusterSequenceNumbers:cancelOrExtendTimeoutBlock:error:", v10, v27, &v29);
    objc_storeStrong(v20, v29);
    v19 = v45;
    *((_BYTE *)v45 + 24) = v21;
    if (a6)
      v22 = v21;
    else
      v22 = 1;
    if ((v22 & 1) == 0)
    {
      v23 = objc_retainAutorelease((id)v39[5]);
LABEL_24:
      *a6 = v23;
      goto LABEL_25;
    }
  }
  else if (a6)
  {
    v23 = objc_retainAutorelease((id)v39[5]);
    goto LABEL_24;
  }
LABEL_26:
  v24 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v24;
}

void __129__VCPPhotosPersistenceDelegate_ungroupFaceClusterSequenceNumbers_batchSizeForUnclusteringFaces_cancelOrExtendTimeoutBlock_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id obj;

  v7 = a2;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v10 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "_ungroupFaceClusterSequenceNumbers:cancelOrExtendTimeoutBlock:error:", v7, v9, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v11;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *a5 = 1;

}

- (BOOL)_ungroupFaceClusterSequenceNumbers:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  unsigned int (**v7)(_QWORD);
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  id obj;
  id *location;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  id v66;
  unsigned int (**v67)(_QWORD);
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v7 = (unsigned int (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  location = (id *)&self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v10 = (void *)objc_msgSend(v8, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  v11 = *MEMORY[0x1E0CD1B70];
  v84[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchPropertySets:", v12);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(clusterSequenceNumber in %@)"), v53);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v10);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v14 = objc_loadWeakRetained((id *)&self->_photoLibrary);
  -[VCPPhotosPersistenceDelegate _categorizeGroupedFacesInFetchResult:intoFaceLocalIdentifiersByFaceGroup:ungroupedFaceLocalIdentifiers:cancelOrExtendTimeoutBlock:photoLibrary:](self, "_categorizeGroupedFacesInFetchResult:intoFaceLocalIdentifiersByFaceGroup:ungroupedFaceLocalIdentifiers:cancelOrExtendTimeoutBlock:photoLibrary:", v54, v61, &v73, v7, v14);
  v55 = v73;

  if (v7 && v7[2](v7))
  {
    if (a5)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v82 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to ungroup faces"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
    goto LABEL_40;
  }
  v19 = (void *)objc_opt_class();
  v20 = objc_loadWeakRetained(location);
  v60 = (void *)objc_msgSend(v19, "newAllFacesFetchOptionsWithPhotoLibrary:", v20);

  v81 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFetchPropertySets:", v21);

  if (objc_msgSend(v55, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", v55, v60);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained(location);
    v72 = 0;
    v24 = -[VCPPhotosPersistenceDelegate _resetFaceClusterSequenceNumberOfFacesInFetchResult:inPhotoLibrary:cancelOrExtendTimeoutBlock:error:](self, "_resetFaceClusterSequenceNumberOfFacesInFetchResult:inPhotoLibrary:cancelOrExtendTimeoutBlock:error:", v22, v23, v7, &v72);
    v18 = v72;

    if (v24)
      goto LABEL_10;
    v10 = v60;
    if (!a5)
    {
LABEL_40:
      v28 = 0;
      goto LABEL_50;
    }
    objc_msgSend(v18, "domain");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "isEqualToString:", *MEMORY[0x1E0CD1D78]))
    {
      v45 = objc_msgSend(v18, "code") == 3072;

      if (v45)
      {
        v46 = (void *)MEMORY[0x1E0CB35C8];
        v79 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to ungroup faces"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v48);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_35:
        v28 = 0;
LABEL_49:
        v10 = v60;
        goto LABEL_50;
      }
    }
    else
    {

    }
    v49 = objc_retainAutorelease(v18);
LABEL_48:
    v18 = v49;
    v28 = 0;
    *a5 = v49;
    goto LABEL_49;
  }
  v18 = 0;
LABEL_10:
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v61, "keyEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v25;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (!v26)
  {
    v28 = 1;
    goto LABEL_42;
  }
  v27 = *(_QWORD *)v69;
  v51 = *MEMORY[0x1E0CB2F90];
  v52 = *MEMORY[0x1E0CB2D50];
  v56 = *MEMORY[0x1E0CD1D78];
  v28 = 1;
  while (2)
  {
    v29 = 0;
    do
    {
      if (*(_QWORD *)v69 != v27)
        objc_enumerationMutation(obj);
      v30 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v29);
      v31 = (void *)MEMORY[0x1BCCA1B2C]();
      if (!v7 || !v7[2](v7))
      {
        v36 = objc_loadWeakRetained(location);
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __100__VCPPhotosPersistenceDelegate__ungroupFaceClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke;
        v63[3] = &unk_1E6B17B10;
        v64 = v61;
        v65 = v30;
        v66 = v60;
        v67 = v7;
        v62 = v18;
        v28 = objc_msgSend(v36, "performCancellableChangesAndWait:error:", v63, &v62);
        v37 = v62;

        if ((v28 & 1) != 0)
        {
          v35 = 0;
LABEL_26:

          v33 = v64;
          v18 = v37;
          goto LABEL_27;
        }
        objc_msgSend(v37, "domain");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "isEqualToString:", v56))
        {
          v39 = objc_msgSend(v37, "code") == 3072;

          if (!v39)
          {
LABEL_25:
            v35 = 2;
            goto LABEL_26;
          }
          v40 = (void *)MEMORY[0x1E0CB35C8];
          v74 = v52;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to uncluster faces"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "errorWithDomain:code:userInfo:", v51, -128, v41);
          v42 = objc_claimAutoreleasedReturnValue();

          v37 = (id)v42;
        }

        goto LABEL_25;
      }
      if (a5)
      {
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v76 = v52;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to ungroup faces"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", v51, -128, v34);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v35 = 1;
LABEL_27:

        goto LABEL_28;
      }
      v35 = 1;
LABEL_28:
      objc_autoreleasePoolPop(v31);
      if (v35)
      {

        if (v35 == 2)
          goto LABEL_43;
        goto LABEL_35;
      }
      ++v29;
    }
    while (v26 != v29);
    v25 = obj;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    v26 = v43;
    if (v43)
      continue;
    break;
  }
LABEL_42:

LABEL_43:
  v10 = v60;
  if (a5 && (v28 & 1) == 0)
  {
    v49 = objc_retainAutorelease(v18);
    goto LABEL_48;
  }
LABEL_50:

  return v28 & 1;
}

void __100__VCPPhotosPersistenceDelegate__ungroupFaceClusterSequenceNumbers_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  while (v5 < objc_msgSend(v4, "count"))
  {
    v6 = (void *)MEMORY[0x1BCCA1B2C]();
    v7 = *(_QWORD *)(a1 + 56);
    if (v7 && (*(unsigned int (**)(void))(v7 + 16))())
    {
      v8 = 0;
      *a2 = 1;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CD1530];
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changeRequestForFace:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setClusterSequenceNumber:", 0);
      v8 = 1;
    }
    objc_autoreleasePoolPop(v6);
    ++v5;
    if ((v8 & 1) == 0)
      goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFaces:", v4);

LABEL_10:
}

- (id)_fetchResultForGroupedFacesWithClusterSequenceNumberSetToZeroInPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "newAllFacesFetchOptionsWithPhotoLibrary:", v3);
  v9[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v5);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(clusterSequenceNumber = 0)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v6);

  objc_msgSend(v4, "setIncludeOnlyFacesInFaceGroups:", 1);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_fetchResultForUngroupedFacesWithNonZeroClusterSequenceNumberInPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "newAllFacesFetchOptionsWithPhotoLibrary:", v3);
  v9[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v5);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((clusterSequenceNumber > 0) AND (faceGroup = nil))"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_resetFaceClusterSequenceNumberOfFacesInFetchResult:(id)a3 inPhotoLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v12 = (void *)objc_opt_class();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke;
  v16[3] = &unk_1E6B17B60;
  v13 = v11;
  v18 = v13;
  v19 = &v21;
  v14 = v10;
  v17 = v14;
  v20 = a6;
  objc_msgSend(v12, "enumerateFetchResult:withBatchSize:handler:", v9, 100, v16);
  LOBYTE(v10) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)v10;
}

void __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();
  v9 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_2;
  v16[3] = &unk_1E6B17B38;
  v10 = v7;
  v17 = v10;
  v18 = *(id *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "performCancellableChangesAndWait:error:", v16, *(_QWORD *)(a1 + 56));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (v15 = *(_QWORD *)(a1 + 40)) != 0
    && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v11, v12, v13, v14))
  {
    *a5 = 1;
  }

}

void __132__VCPPhotosPersistenceDelegate__resetFaceClusterSequenceNumberOfFacesInFetchResult_inPhotoLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = *(_QWORD *)(a1 + 40);
        if (v9 && (*(unsigned int (**)(uint64_t))(v9 + 16))(v9))
        {
          *a2 = 1;
          goto LABEL_12;
        }
        objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v8, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setClusterSequenceNumber:", 0);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

}

- (BOOL)cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  _BYTE buf[24];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1BCCA1B2C]();
    v9 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    -[VCPPhotosPersistenceDelegate _fetchResultForUngroupedFacesWithNonZeroClusterSequenceNumberInPhotoLibrary:](self, "_fetchResultForUngroupedFacesWithNonZeroClusterSequenceNumberInPhotoLibrary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = objc_msgSend(v10, "count");
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Found %lu faces with CSN > 0 but not in any face groups", buf, 0xCu);
      }
      *(_QWORD *)buf = 0;
      v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      v12 = -[VCPPhotosPersistenceDelegate _resetFaceClusterSequenceNumberOfFacesInFetchResult:inPhotoLibrary:cancelOrExtendTimeoutBlock:error:](self, "_resetFaceClusterSequenceNumberOfFacesInFetchResult:inPhotoLibrary:cancelOrExtendTimeoutBlock:error:", v10, v11, v6, buf);

      v13 = *(id *)buf;
    }
    else
    {
      v13 = 0;
      v12 = 1;
    }

    objc_autoreleasePoolPop(v8);
    if (a4)
      v16 = v12;
    else
      v16 = 1;
    if ((v16 & 1) != 0)
      goto LABEL_19;
    objc_msgSend(v13, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CD1D78]))
    {
      v18 = objc_msgSend(v13, "code") == 3072;

      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to uncluster faces"), *MEMORY[0x1E0CB2D50]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
    }
    else
    {

    }
    v13 = objc_retainAutorelease(v13);
    *a4 = v13;
    goto LABEL_19;
  }
  if (!a4)
  {
    v12 = 0;
    goto LABEL_20;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not access the library"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v15);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v12 = 0;
LABEL_19:

LABEL_20:
  return v12;
}

- (BOOL)cleanupGroupedFacesWithClusterSequenceNumberSetToZero:(id)a3 error:(id *)a4
{
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  int v27;
  id v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  BOOL v37;
  id *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  id *location;
  void *v46;
  void *v47;
  unsigned int (**v48)(void);
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v48 = (unsigned int (**)(void))a3;
  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (!WeakRetained)
  {
    if (a4)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not access the library"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
      v39 = a4;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    v37 = 0;
    goto LABEL_33;
  }
  v8 = objc_loadWeakRetained((id *)&self->_photoLibrary);
  -[VCPPhotosPersistenceDelegate _fetchResultForGroupedFacesWithClusterSequenceNumberSetToZeroInPhotoLibrary:](self, "_fetchResultForGroupedFacesWithClusterSequenceNumberSetToZeroInPhotoLibrary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v9;
  if (!objc_msgSend(v9, "count"))
  {
    v16 = 0;
    v37 = 1;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v46 = v10;
  -[VCPPhotosPersistenceDelegate _categorizeGroupedFacesInFetchResult:intoFaceLocalIdentifiersByFaceGroup:ungroupedFaceLocalIdentifiers:cancelOrExtendTimeoutBlock:photoLibrary:](self, "_categorizeGroupedFacesInFetchResult:intoFaceLocalIdentifiersByFaceGroup:ungroupedFaceLocalIdentifiers:cancelOrExtendTimeoutBlock:photoLibrary:", v40, v10, 0, v48, v11);

  v12 = (void *)objc_opt_class();
  v13 = objc_loadWeakRetained((id *)p_photoLibrary);
  v47 = (void *)objc_msgSend(v12, "newAllFacesFetchOptionsWithPhotoLibrary:", v13);

  v63 = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)p_photoLibrary;
  v39 = a4;
  objc_msgSend(v47, "setFetchPropertySets:", v14);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v10, "keyEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v15;
  v16 = 0;
  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (!v17)
  {
    v26 = 1;
    goto LABEL_28;
  }
  v18 = *(_QWORD *)v55;
  v42 = *MEMORY[0x1E0CB2F90];
  v43 = *MEMORY[0x1E0CB2D50];
  v41 = *MEMORY[0x1E0CD1D78];
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v55 != v18)
        objc_enumerationMutation(obj);
      v20 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
      v21 = (void *)MEMORY[0x1BCCA1B2C]();
      if (v48 && v48[2]())
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v60 = v43;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to cleanup grouped faces with CSN=0"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v42, -128, v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v26 = 0;
        v27 = 2;
        v16 = (void *)v25;
        goto LABEL_19;
      }
      v28 = objc_loadWeakRetained(location);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __92__VCPPhotosPersistenceDelegate_cleanupGroupedFacesWithClusterSequenceNumberSetToZero_error___block_invoke;
      v50[3] = &unk_1E6B17B88;
      v51 = v46;
      v52 = v20;
      v53 = v47;
      v49 = v16;
      v26 = objc_msgSend(v28, "performChangesAndWait:error:", v50, &v49);
      v29 = v49;

      if ((v26 & 1) == 0)
      {
        objc_msgSend(v29, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToString:", v41))
        {
          v31 = objc_msgSend(v29, "code") == 3072;

          if (!v31)
          {
LABEL_17:
            v27 = 2;
            goto LABEL_18;
          }
          v32 = (void *)MEMORY[0x1E0CB35C8];
          v58 = v43;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to cleanup grouped faces with CSN=0"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", v42, -128, v33);
          v34 = objc_claimAutoreleasedReturnValue();

          v29 = (id)v34;
        }

        goto LABEL_17;
      }
      v27 = 0;
LABEL_18:

      v23 = v51;
      v16 = v29;
LABEL_19:

      objc_autoreleasePoolPop(v21);
      if (v27)
      {
        v15 = obj;
        goto LABEL_28;
      }
    }
    v15 = obj;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v17)
      continue;
    break;
  }
LABEL_28:

  v37 = v26 != 0;
  if (v39 && !v26)
  {
    v36 = objc_retainAutorelease(v16);
    v16 = v36;
LABEL_31:
    v37 = 0;
    *v39 = v36;
  }
LABEL_32:

LABEL_33:
  return v37;
}

void __92__VCPPhotosPersistenceDelegate_cleanupGroupedFacesWithClusterSequenceNumberSetToZero_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFaces:", v2);

}

- (id)_facesFromFaceGroupWithMostNumberOfFacesOnPerson:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v37;
  void *v38;
  id v39;
  id v40;
  unint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v40 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v9;
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", v7, v40);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fetchedObjects");
      v39 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = 0;
      v41 = 0;
      v17 = 0;
      v37 = v10;
      while (v17 < objc_msgSend(v10, "count"))
      {
        v18 = MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v43, v40);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)v18;
        v20 = v17;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i < objc_msgSend(v19, "count"); ++i)
        {
          v23 = (void *)MEMORY[0x1BCCA1B2C]();
          objc_msgSend(v19, "objectAtIndexedSubscript:", i);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "personLocalIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if (v27)
            objc_msgSend(v21, "addObject:", v24);

          objc_autoreleasePoolPop(v23);
        }
        v28 = objc_msgSend(v21, "count");
        if (v28 > v41)
        {
          v29 = v21;

          v39 = v29;
          v41 = v28;
        }

        v10 = v37;
        v9 = v38;
        objc_autoreleasePoolPop(v42);
        v17 = v20 + 1;
      }
      if (a5 && !v39)
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0CB2D50];
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("Failed to fetch faces from the faceGroup that contributed the most number of face to person with localIdentifier '%@'"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v34);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("No faceGroups found for person with localIdentifier '%@'"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v39 = 0;
  }

  return v39;
}

- (id)_localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  uint64_t (**v6)(_QWORD);
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = (uint64_t (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v6[2](v6))
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v11 = (void *)objc_msgSend(v9, "newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", WeakRetained);

    objc_msgSend(v11, "setMinimumUnverifiedFaceCount:", 0);
    objc_msgSend(v11, "setIncludeTorsoOnlyPerson:", 1);
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups:options:", v23, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v12, "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v25;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "localIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v19);

          }
          if (v6 && (v6[2](v6) & 1) != 0)
          {
            v21 = v7;

            goto LABEL_17;
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
          continue;
        break;
      }
    }

    v20 = v7;
LABEL_17:

  }
  return v7;
}

- (id)identifyConflictingL0Clusters:(id)a3 csnToRejectedPersonForNewlyClusteredFaces:(id)a4 csnToConfirmedPersonForNewlyClusteredFaces:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  VCPPhotosPersistenceDelegate *v48;
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = v9;
  v33 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v33, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke;
    v41[3] = &unk_1E6B17C50;
    v19 = v30;
    v42 = v19;
    v20 = v17;
    v43 = v20;
    v31 = v13;
    v44 = v31;
    v45 = v33;
    v21 = v16;
    v46 = v21;
    v47 = v9;
    v48 = self;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v41);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v39[0] = v18;
    v39[1] = 3221225472;
    v39[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_4;
    v39[3] = &unk_1E6B17C78;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v40 = v22;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v39);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v37[0] = v18;
    v37[1] = 3221225472;
    v37[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_5;
    v37[3] = &unk_1E6B17C78;
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v38 = v23;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v37);
    v24 = v22;
    objc_msgSend(v24, "intersectSet:", v23);
    if (objc_msgSend(v24, "count"))
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend(v24, "count");
        *(_DWORD *)buf = 134217984;
        v50 = v25;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VisionFgMapping] Vision Cluster contains %lu conflicting people", buf, 0xCu);
      }
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", &__block_literal_global_39);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v18;
      v34[1] = 3221225472;
      v34[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_329;
      v34[3] = &unk_1E6B17CA0;
      v35 = v24;
      v27 = v26;
      v36 = v27;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v34);
      v28 = v36;
      v10 = v27;

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Vision Cluster does not have conflicting l0clusters", buf, 2u);
      }
      v10 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Vision Cluster with single l0clusters; skip de-conflict",
        buf,
        2u);
    }
    v10 = 0;
  }

  return v10;
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *context;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v5 = a3;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v30);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v30);

  v27 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v27, "intersectSet:", *(_QWORD *)(a1 + 48));
  v8 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2;
  v42[3] = &unk_1E6B17BB0;
  v43 = *(id *)(a1 + 56);
  v44 = *(id *)(a1 + 32);
  v9 = v30;
  v45 = v9;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v42);
  v28 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v28, "intersectSet:", *(_QWORD *)(a1 + 64));
  v38[0] = v8;
  v38[1] = 3221225472;
  v38[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3;
  v38[3] = &unk_1E6B17BB0;
  v39 = *(id *)(a1 + 72);
  v40 = *(id *)(a1 + 40);
  v10 = v9;
  v41 = v10;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v38);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 80) + 8));
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B76488);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVerifiedPersonTypes:", v13);

  v14 = (void *)objc_opt_class();
  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 80) + 8));
  v16 = (void *)objc_msgSend(v14, "newAllFacesFetchOptionsWithPhotoLibrary:", v15);

  v17 = *MEMORY[0x1E0CD1B58];
  v46[0] = *MEMORY[0x1E0CD1B68];
  v46[1] = v17;
  v18 = *MEMORY[0x1E0CD1B70];
  v46[2] = *MEMORY[0x1E0CD1B80];
  v46[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFetchPropertySets:", v19);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(clusterSequenceNumber in %@) AND (trainingType = %d OR trainingType = %d OR trainingType = %d)"), v5, 3, 1, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v20);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v8;
  v35[1] = 3221225472;
  v35[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_318;
  v35[3] = &unk_1E6B17BD8;
  v36 = *(id *)(a1 + 32);
  v22 = v10;
  v37 = v22;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v35);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(clusterSequenceNumber in %@) AND (trainingType = %d OR trainingType = %d)"), v5, 4, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v23);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2_322;
  v31[3] = &unk_1E6B17C28;
  v25 = v12;
  v32 = v25;
  v33 = *(id *)(a1 + 40);
  v26 = v22;
  v34 = v26;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v31);

  objc_autoreleasePoolPop(context);
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    v3 = v5;
  }

}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_318(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "personLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_2_322(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchRejectedPersonsForFace:options:", a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3_323;
    v4[3] = &unk_1E6B17C00;
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_3_323(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:");

}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:");

}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_327(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Conflicting person %@", (uint8_t *)&v3, 0xCu);
  }

}

void __147__VCPPhotosPersistenceDelegate_identifyConflictingL0Clusters_csnToRejectedPersonForNewlyClusteredFaces_csnToConfirmedPersonForNewlyClusteredFaces___block_invoke_329(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "intersectsSet:", *(_QWORD *)(a1 + 32)))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Vision Cluster has conflicting l0cluster %@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

- (BOOL)persistChangesToAlgorithmicFaceGroups:(id)a3 l1ClustersByFaceCSNRepresentingFaceGroup:(id)a4 l0ClustersByFaceCSNRepresentingFaceGroup:(id)a5 faceCSNByLocalIdentifierForNewlyClusteredFaces:(id)a6 faceCSNsOfUnclusteredFaces:(id)a7 localIdentifiersOfUnclusteredFaces:(id)a8 persistenceCompletionBlock:(id)a9 cancelOrExtendTimeoutBlock:(id)a10 error:(id *)a11
{
  id v17;
  id WeakRetained;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  os_signpost_id_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  unint64_t i;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void (**v85)(void);
  id v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  BOOL v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  BOOL v97;
  void *v98;
  _BOOL4 v99;
  NSObject *v100;
  const char *v101;
  uint32_t v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  void *v108;
  void *v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  void *context;
  void *contexta;
  void *contextb;
  uint64_t v128;
  void *v129;
  void *v130;
  os_signpost_id_t spid;
  void *spida;
  void *v133;
  void *v134;
  void (**v135)(void);
  id v136;
  id v137;
  id v138;
  id v139;
  unint64_t v140;
  void *v141;
  id v142;
  void (**v143)(void);
  id v144;
  id *location;
  char locationa;
  void *v147;
  VCPPhotosPersistenceDelegate *v148;
  uint64_t v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  _QWORD aBlock[4];
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  VCPPhotosPersistenceDelegate *v164;
  id v165;
  id v166;
  void (**v167)(void);
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[5];
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  _QWORD v182[4];
  id v183;
  id v184;
  id v185;
  id v186;
  uint64_t v187;
  void *v188;
  _BYTE v189[128];
  _BYTE v190[128];
  _QWORD v191[3];
  _QWORD v192[2];
  void *v193;
  uint64_t v194;
  uint8_t buf[4];
  uint64_t v196;
  uint64_t v197;
  _QWORD v198[4];

  v198[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v138 = a4;
  v139 = a5;
  v142 = a6;
  v136 = a7;
  v137 = a8;
  v135 = (void (**)(void))a9;
  v143 = (void (**)(void))a10;
  v148 = self;
  location = (id *)&self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    v149 = mach_absolute_time();
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    spid = v20;
    v140 = v20 - 1;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VisionFgMapping_Process", ", buf, 2u);
    }

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v17, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 134217984;
      v196 = v24;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Persisting %ld Vision Clusters to Photos FaceGroup", buf, 0xCu);

    }
    v25 = objc_loadWeakRetained(location);
    objc_msgSend(v25, "librarySpecificFetchOptions");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B764A0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setVerifiedPersonTypes:", v26);

    v27 = (void *)objc_opt_class();
    v28 = objc_loadWeakRetained(location);
    v147 = (void *)objc_msgSend(v27, "newAllFacesFetchOptionsWithPhotoLibrary:", v28);

    v29 = *MEMORY[0x1E0CD1B58];
    v192[0] = *MEMORY[0x1E0CD1B68];
    v192[1] = v29;
    v31 = *MEMORY[0x1E0CD1B70];
    v193 = (void *)*MEMORY[0x1E0CD1B80];
    v30 = v193;
    v194 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    context = v30;
    v128 = v29;
    objc_msgSend(v147, "setFetchPropertySets:", v32);

    v33 = mach_absolute_time();
    VCPSignPostLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_signpost_id_generate(v34);

    VCPSignPostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "VisionFgMapping_LookingAfterNewClusteredFace", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trainingType != %d"), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setPredicate:", v38);

    v39 = (void *)MEMORY[0x1E0CD1520];
    objc_msgSend(v142, "allKeys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "fetchFacesWithLocalIdentifiers:options:", v40, v147);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v147, "setPredicate:", 0);
    v182[0] = MEMORY[0x1E0C809B0];
    v182[1] = 3221225472;
    v182[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke;
    v182[3] = &unk_1E6B17CC8;
    v41 = v142;
    v183 = v41;
    v124 = v134;
    v184 = v124;
    v42 = v121;
    v185 = v42;
    v43 = v120;
    v186 = v43;
    objc_msgSend(v133, "enumerateObjectsUsingBlock:", v182);
    VCPSignPostLog();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v45, OS_SIGNPOST_INTERVAL_END, v35, "VisionFgMapping_LookingAfterNewClusteredFace", ", buf, 2u);
    }

    if (v33)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    v46 = mach_absolute_time();
    VCPSignPostLog();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_signpost_id_generate(v47);

    VCPSignPostLog();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "VisionFgMapping_ResolveConflictL0Clusters", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v176[0] = MEMORY[0x1E0C809B0];
    v176[1] = 3221225472;
    v176[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_338;
    v176[3] = &unk_1E6B17D80;
    v176[4] = v148;
    v115 = v42;
    v177 = v115;
    v116 = v43;
    v178 = v116;
    v179 = v138;
    v119 = v51;
    v180 = v119;
    v52 = v17;
    v181 = v52;
    objc_msgSend(v139, "enumerateKeysAndObjectsUsingBlock:", v176);
    VCPSignPostLog();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v54, OS_SIGNPOST_INTERVAL_END, v48, "VisionFgMapping_ResolveConflictL0Clusters", ", buf, 2u);
    }

    if (v46)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    v144 = v119;

    VCPSignPostLog();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v140 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v56, OS_SIGNPOST_INTERVAL_END, spid, "VisionFgMapping_Process", ", buf, 2u);
    }

    if (v149)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if (v143)
      v143[2]();
    objc_msgSend(v144, "allKeys");
    spida = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_opt_class();
    v58 = objc_loadWeakRetained(location);
    v141 = (void *)objc_msgSend(v57, "newAllFacesFetchOptionsWithPhotoLibrary:", v58);

    v191[0] = v31;
    v191[1] = context;
    v191[2] = v128;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setFetchPropertySets:", v59);

    v60 = objc_msgSend(v41, "count");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v60);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v41, "allKeys");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", v61, v141);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i < objc_msgSend(v62, "count"); ++i)
      {
        v64 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v62, "objectAtIndexedSubscript:", i);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "localIdentifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
          objc_msgSend(v150, "setObject:forKeyedSubscript:", v65, v67);

        objc_autoreleasePoolPop(v64);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    contexta = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", spida);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    objc_msgSend(v144, "objectEnumerator");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v172, v190, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v173;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v173 != v72)
            objc_enumerationMutation(v70);
          objc_msgSend(v69, "unionSet:", *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * j));
        }
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v172, v190, 16);
      }
      while (v71);
    }

    v74 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v150, "allKeys");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setWithArray:", v75);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v69, "minusSet:", v129);
    if (objc_msgSend(v69, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clusterSequenceNumber IN %@"), v69);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setPredicate:", v76);

      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v141);
      v170 = 0u;
      v171 = 0u;
      v168 = 0u;
      v169 = 0u;
      v77 = (id)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v168, v189, 16);
      if (v78)
      {
        v79 = *(_QWORD *)v169;
        do
        {
          for (k = 0; k != v78; ++k)
          {
            if (*(_QWORD *)v169 != v79)
              objc_enumerationMutation(v77);
            v81 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * k);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v81, "clusterSequenceNumber"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v81, v82);

          }
          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v168, v189, 16);
        }
        while (v78);
      }

    }
    objc_autoreleasePoolPop(contexta);
    v83 = objc_loadWeakRetained(location);
    objc_msgSend(v83, "librarySpecificFetchOptions");
    contextb = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "allValues");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces:options:", v114, contextb);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_356;
    aBlock[3] = &unk_1E6B17DF8;
    v155 = v41;
    v111 = spida;
    v156 = v111;
    v85 = v143;
    v167 = v85;
    v17 = v144;
    v157 = v17;
    v112 = v150;
    v158 = v112;
    v113 = v68;
    v159 = v113;
    v160 = v136;
    v161 = v137;
    v86 = v110;
    v162 = v86;
    v122 = v84;
    v163 = v122;
    v164 = v148;
    v87 = v117;
    v165 = v87;
    v88 = v118;
    v166 = v88;
    v130 = _Block_copy(aBlock);
    v89 = (void *)MEMORY[0x1BCCA1B2C]();
    v90 = objc_loadWeakRetained(location);
    v153 = 0;
    locationa = objc_msgSend(v90, "performCancellableChangesAndWait:error:", v130, &v153);
    v123 = v153;

    objc_autoreleasePoolPop(v89);
    if ((locationa & 1) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v196 = (uint64_t)v122;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersistFaceGroups: Set personBuilderState of faceGroups: %@", buf, 0xCu);
      }
      if (v135)
        v135[2]();
      v152 = 0;
      v91 = -[VCPPhotosPersistenceDelegate deleteEmptyGroupsAndReturnError:](v148, "deleteEmptyGroupsAndReturnError:", &v152);
      v92 = v152;
      if (!v91 && (int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v196 = (uint64_t)v92;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PersistFaceGroups: Failed to delete empty face groups with error: %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v88, "count"))
      {
        -[VCPPhotosPersistenceDelegate _localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:cancelOrExtendTimeoutBlock:](v148, "_localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:cancelOrExtendTimeoutBlock:", v88, v85);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "unionSet:", v94);

      }
      if (objc_msgSend(v87, "count"))
      {
        -[VCPPhotosPersistenceDelegate _localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:cancelOrExtendTimeoutBlock:](v148, "_localIdentifiersOfUnverifiedPersonsAssociatedWithFaceGroups:cancelOrExtendTimeoutBlock:", v87, v85);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "unionSet:", v95);

      }
      if (!objc_msgSend(v93, "count"))
        goto LABEL_89;

      objc_msgSend(v93, "allObjects");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = 0;
      v97 = -[VCPPhotosPersistenceDelegate updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:](v148, "updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:", v96, 1, v85, &v151);
      v92 = v151;

      if (v97)
        goto LABEL_89;
      objc_msgSend(v92, "domain");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v98, "isEqualToString:", *MEMORY[0x1E0CD1D78]))
      {
        v99 = objc_msgSend(v92, "code") == 3072;

        if (v99)
        {
          if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_89;
          *(_WORD *)buf = 0;
          v100 = MEMORY[0x1E0C81028];
          v101 = "PersistFaceGroups: Canceled updating key faces unverified persons after persisting face groups.";
          v102 = 2;
LABEL_88:
          _os_log_impl(&dword_1B6C4A000, v100, OS_LOG_TYPE_DEFAULT, v101, buf, v102);
LABEL_89:

          goto LABEL_90;
        }
      }
      else
      {

      }
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_89;
      *(_DWORD *)buf = 138412290;
      v196 = (uint64_t)v92;
      v100 = MEMORY[0x1E0C81028];
      v101 = "PersistFaceGroups: Failed to update key faces unverified persons after persisting face groups. Error: %@";
      v102 = 12;
      goto LABEL_88;
    }
    if (a11)
    {
      objc_msgSend(v123, "domain");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v104, "isEqualToString:", *MEMORY[0x1E0CD1D78]))
      {
        v105 = objc_msgSend(v123, "code") == 3072;

        if (v105)
        {
          v106 = (void *)MEMORY[0x1E0CB35C8];
          v187 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saving clustering results cancelled"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v188 = v107;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v108);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_90;
        }
      }
      else
      {

      }
      *a11 = objc_retainAutorelease(v123);
    }
LABEL_90:

    goto LABEL_91;
  }
  if (a11)
  {
    v103 = (void *)MEMORY[0x1E0CB35C8];
    v197 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photoLibrary is nil"));
    v124 = (id)objc_claimAutoreleasedReturnValue();
    v198[0] = v124;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v198, &v197, 1);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
    locationa = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_91:

    goto LABEL_92;
  }
  locationa = 0;
LABEL_92:

  return locationa;
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "longValue"))
  {
    if (objc_msgSend(v3, "trainingType") == 2 || objc_msgSend(v3, "trainingType") == 4)
    {
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchRejectedPersonsForFace:options:", v3, *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_336;
      v10[3] = &unk_1E6B17C00;
      v11 = *(id *)(a1 + 48);
      v12 = v6;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    }
    else
    {
      objc_msgSend(v3, "personLocalIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v9, v6);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VisionFgMapping] Invalid csn (%@) for newly clustered face %@", buf, 0x16u);

  }
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_336(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_338(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t v41[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = mach_absolute_time();
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VisionFgMapping_LookingForConflictingCluster", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "identifyConflictingL0Clusters:csnToRejectedPersonForNewlyClusteredFaces:csnToConfirmedPersonForNewlyClusteredFaces:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v9, "VisionFgMapping_LookingForConflictingCluster", ", buf, 2u);
  }

  if (v7)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if (objc_msgSend(v33, "count", v33))
  {
    v14 = mach_absolute_time();
    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VisionFgMapping_ResolveConflictingCluster", ", buf, 2u);
    }

    v19 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithSet:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_340;
    v36[3] = &unk_1E6B17D10;
    v37 = v6;
    v38 = *(id *)(a1 + 64);
    v23 = v21;
    v39 = v23;
    v24 = v5;
    v40 = v24;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v36);
    if (objc_msgSend(v23, "count"))
    {
      v25 = v6;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v48 = __Block_byref_object_copy__23;
      v49 = __Block_byref_object_dispose__23;
      objc_msgSend(v23, "anyObject");
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v35[0] = v22;
      v35[1] = 3221225472;
      v35[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_344;
      v35[3] = &unk_1E6B17D38;
      v35[4] = buf;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v35);
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v23, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v27 = objc_msgSend(v23, "count");
        *(_DWORD *)v41 = 138412802;
        v42 = v24;
        v43 = 2112;
        v44 = v26;
        v45 = 2048;
        v46 = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Output (remaining) Cluster %@ -> %@ with %ld faces", v41, 0x20u);
        v6 = v25;
      }
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", &__block_literal_global_346);
      _Block_object_dispose(buf, 8);

    }
    VCPSignPostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_END, v16, "VisionFgMapping_ResolveConflictingCluster", ", buf, 2u);
    }

    if (v14)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v30, v5);

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Output (no-touch) Cluster %@ with %ld faces", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v5);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", &__block_literal_global_349);
  }

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_340(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v3);
    objc_msgSend(*(id *)(a1 + 48), "minusSet:", v7);
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v8;
      v14 = 2048;
      v15 = objc_msgSend(v9, "count");
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VisionFgMapping] Split Cluster %@ with %ld faces with representing face csn %@", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_343);

  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 56);
    v12 = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VisionFgMapping] Cannot exclude invalid l0RepresentingCSN %@ in l1Cluster %@", (uint8_t *)&v12, 0x16u);
  }

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_341(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = objc_msgSend(v2, "longValue");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] \t csn: %ld ", (uint8_t *)&v3, 0xCu);
  }

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_344(uint64_t a1, void *a2)
{
  unint64_t v4;
  id v5;

  v5 = a2;
  v4 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v4 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "unsignedIntegerValue"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_345(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = objc_msgSend(v2, "longValue");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] \t csn: %ld ", (uint8_t *)&v3, 0xCu);
  }

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_348(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = objc_msgSend(v2, "longValue");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VisionFgMapping] \t csn: %ld ", (uint8_t *)&v3, 0xCu);
  }

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_356(uint64_t a1, _BYTE *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id WeakRetained;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *context;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  unint64_t j;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD aBlock[4];
  id v96;
  id v97;
  void *v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  int v102;
  uint64_t v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = 0;
  v64 = *MEMORY[0x1E0CD1B70];
  while (2)
  {
    if (v77 >= objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v61 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      objc_msgSend(*(id *)(a1 + 80), "allObjects");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "removeObjectsForKeys:", v62);

      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_359;
      v83[3] = &unk_1E6B174E8;
      v84 = *(id *)(a1 + 56);
      objc_msgSend(v61, "enumerateKeysAndObjectsUsingBlock:", v83);

      break;
    }
    context = (void *)MEMORY[0x1BCCA1B2C]();
    v6 = *(_QWORD *)(a1 + 128);
    if (v6 && (*(unsigned int (**)(void))(v6 + 16))())
    {
      v7 = 1;
      *a2 = 1;
      goto LABEL_80;
    }
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v77);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_2;
    aBlock[3] = &unk_1E6B17DA8;
    v96 = *(id *)(a1 + 56);
    v97 = *(id *)(a1 + 64);
    v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    v8[2](v8, v74);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v9;
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v74);
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v17 = v72;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v92;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v92 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
            v8[2](v8, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              if (objc_msgSend(v5, "containsObject:", v21))
              {
                objc_msgSend(*(id *)(a1 + 72), "addObject:", v21);
                v23 = *(void **)(a1 + 80);
                objc_msgSend(v22, "localIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObject:", v24);

              }
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 72), "addObject:", v21);
            }

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
        }
        while (v18);
      }

      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v74;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PersistFaceGroups: Photo library is missing a face with CSN = %@", buf, 0xCu);
      }
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v25 = *(void **)(a1 + 72);
        *(_DWORD *)buf = 138412290;
        v100 = v25;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PersistFaceGroups: Faces with these CSNs will be removed from the cluster cache: %@", buf, 0xCu);
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v26 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v27 = *(void **)(a1 + 80);
          *(_DWORD *)buf = 138412290;
          v100 = v27;
          _os_log_impl(&dword_1B6C4A000, v26, OS_LOG_TYPE_INFO, "PersistFaceGroups: Faces with these localIdentifiers will be re-clustered: %@", buf, 0xCu);
        }
      }
      v7 = 4;
      goto LABEL_79;
    }
    v10 = *(void **)(a1 + 88);
    objc_msgSend(v9, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = objc_msgSend(v72, "containsObject:", v74);
    if (v73)
    {
      objc_msgSend(MEMORY[0x1E0CD1560], "creationRequestForFaceGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "placeholderForCreatedFaceGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 96);
      objc_msgSend(v14, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v13;
      objc_msgSend(v15, "addObject:", v16);
      v67 = v14;
    }
    else
    {
      if (!v76)
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PersistFaceGroups: We should not get here! If we did, then we have a previously clustered face without a face group!", buf, 2u);
        }
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PersistFaceGroups: Failed to create a face group change request to add faces!", buf, 2u);
        }
        v7 = 1;
        *a2 = 1;
        goto LABEL_78;
      }
      objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(void **)(a1 + 96);
      objc_msgSend(v76, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)v28;
      objc_msgSend(v29, "addObject:", v16);
      v67 = 0;
    }

    if (!v68)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PersistFaceGroups: Failed to create a face group change request to add faces!", buf, 2u);
      }
      *a2 = 1;

      v7 = 1;
      goto LABEL_78;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_358;
    v85[3] = &unk_1E6B17DD0;
    v86 = *(id *)(a1 + 56);
    v65 = v30;
    v87 = v65;
    v88 = *(id *)(a1 + 64);
    v79 = v63;
    v89 = v79;
    v90 = *(id *)(a1 + 72);
    objc_msgSend(v72, "enumerateObjectsUsingBlock:", v85);
    v31 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 104) + 8));
    v66 = (void *)objc_msgSend(v31, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

    v103 = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFetchPropertySets:", v33);

    v80 = 0;
    for (j = 0; j < objc_msgSend(v79, "count"); ++j)
    {
      v34 = (void *)MEMORY[0x1BCCA1B2C]();
      v35 = *(_QWORD *)(a1 + 128);
      if (!v35 || !(*(unsigned int (**)(void))(v35 + 16))())
      {
        objc_msgSend(v79, "objectAtIndexedSubscript:", j);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *(void **)(a1 + 88);
        v81 = v36;
        objc_msgSend(v36, "localIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          if ((v73 & 1) == 0)
          {
            objc_msgSend(v76, "localIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "localIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v41, "isEqualToString:", v42);

            if ((v43 & 1) != 0)
            {
              v7 = 0;
LABEL_53:

              goto LABEL_54;
            }
          }
          v44 = (void *)objc_opt_class();
          v45 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 104) + 8));
          v78 = (void *)objc_msgSend(v44, "newAllFacesFetchOptionsWithPhotoLibrary:", v45);

          objc_msgSend(MEMORY[0x1E0CD1520], "fetchKeyFaceForFaceGroup:options:", v40, v78);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (v46)
          {
            objc_msgSend(v46, "localIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "localIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v48, "isEqualToString:", v49);

          }
          else
          {
            v50 = 1;
          }
          objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", v40);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v98 = v81;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "removeFaces:", v55);

          objc_msgSend(v54, "setPersonBuilderState:", 1);
          v56 = *(void **)(a1 + 96);
          objc_msgSend(v40, "localIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v57);

          if (v50)
            objc_msgSend(*(id *)(a1 + 112), "addObject:", v40);

          v7 = 0;
          v80 = v54;
        }
        else
        {
          objc_msgSend(v81, "localIdentifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v81, "clusterSequenceNumber");
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v100 = v78;
            v101 = 1024;
            v102 = v51;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PersistFaceGroups: Failed to find a faceGroup for face '%@' with CSN: %d", buf, 0x12u);
          }
          v52 = *(void **)(a1 + 72);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v53);

          objc_msgSend(*(id *)(a1 + 80), "addObject:", v78);
          v7 = 21;
        }

        goto LABEL_53;
      }
      v7 = 1;
      *a2 = 1;
LABEL_54:
      objc_autoreleasePoolPop(v34);
      if (v7 != 21 && v7)
        goto LABEL_77;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v79);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObjectsFromArray:", v65);
    v59 = objc_msgSend(v58, "count");
    if (v59)
    {
      objc_msgSend(v68, "addFaces:", v58);
      if (v67)
      {
        if (v59 == 1)
        {
          objc_msgSend(v58, "firstObject");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setKeyFace:", v60);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 120), "addObject:", v67);
        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersistFaceGroups: No faces added to face groups!", buf, 2u);
    }
    objc_msgSend(v68, "setPersonBuilderState:", 1);

    v7 = 0;
LABEL_77:

LABEL_78:
LABEL_79:

LABEL_80:
    objc_autoreleasePoolPop(context);
    if (!v7 || v7 == 4)
    {
      ++v77;
      continue;
    }
    break;
  }

}

id __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_358(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[5], "addObject:", v3);
  }
  else
  {
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v3 = (void *)v4;
      objc_msgSend(a1[7], "addObject:");
    }
    else
    {
      v3 = 0;
      objc_msgSend(a1[8], "addObject:", v5);
    }
  }

}

void __321__VCPPhotosPersistenceDelegate_persistChangesToAlgorithmicFaceGroups_l1ClustersByFaceCSNRepresentingFaceGroup_l0ClustersByFaceCSNRepresentingFaceGroup_faceCSNByLocalIdentifierForNewlyClusteredFaces_faceCSNsOfUnclusteredFaces_localIdentifiersOfUnclusteredFaces_persistenceCompletionBlock_cancelOrExtendTimeoutBlock_error___block_invoke_359(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClusterSequenceNumber:", objc_msgSend(v6, "integerValue"));

  }
  else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersistFaceGroups: Failed to find face with localIdentier: %@. Could not set its CSN to %@", (uint8_t *)&v9, 0x16u);
  }

}

+ (void)enumerateFetchResult:(id)a3 withBatchSize:(unint64_t)a4 handler:(id)a5
{
  id v7;
  void (**v8)(id, void *, unint64_t, unint64_t, _BYTE *);
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v7 = a3;
  v8 = (void (**)(id, void *, unint64_t, unint64_t, _BYTE *))a5;
  v9 = 0;
  v15 = 0;
  do
  {
    if (v9 >= objc_msgSend(v7, "count"))
      break;
    v10 = objc_msgSend(v7, "count");
    v11 = v10 - v9 >= a4 ? a4 : v10 - v9;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v14 = (void *)MEMORY[0x1BCCA1B2C]();
      v8[2](v8, v13, v9, v11, &v15);
      objc_autoreleasePoolPop(v14);
    }
    v9 += v11;

  }
  while (!v15);

}

- (BOOL)resetLibraryClustersWithCancelOrExtendTimeoutBlock:(id)a3 error:(id *)a4
{
  void (**v6)(_QWORD);
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id *location;
  void *v35;
  VCPPhotosPersistenceDelegate *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  void (**v41)(_QWORD);
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  v36 = self;
  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_photoLibrary);
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_class();
    v11 = objc_loadWeakRetained((id *)p_photoLibrary);
    v35 = (void *)objc_msgSend(v10, "newAllFacesFetchOptionsWithPhotoLibrary:", v11);

    v44 = *MEMORY[0x1E0CD1B70];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id *)p_photoLibrary;
    v29 = a4;
    objc_msgSend(v35, "setFetchPropertySets:", v12);

    objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithOptions:", v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = 0;
    v33 = *MEMORY[0x1E0CD1D78];
    v30 = *MEMORY[0x1E0CB2F90];
    v31 = *MEMORY[0x1E0CB2D50];
    while (1)
    {
      if (v15 >= objc_msgSend(v13, "count"))
      {
        v26 = -[VCPPhotosPersistenceDelegate cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:error:](v36, "cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:error:", v6, v29);
        goto LABEL_21;
      }
      v16 = (void *)MEMORY[0x1BCCA1B2C]();
      if (v6)
        v6[2](v6);
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_loadWeakRetained(location);
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke;
      v38[3] = &unk_1E6B17B10;
      v38[4] = v36;
      v19 = v17;
      v39 = v19;
      v40 = v35;
      v41 = v6;
      v37 = v14;
      v20 = objc_msgSend(v18, "performCancellableChangesAndWait:error:", v38, &v37);
      v21 = v37;

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v21, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v22, "isEqualToString:", v33))
        {
          v14 = v21;
          goto LABEL_12;
        }
        v23 = objc_msgSend(v21, "code") == 3072;

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v42 = v31;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled operation to reset library clusters"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", v30, -128, v25);
          v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
          goto LABEL_13;
        }
      }
      v14 = v21;
LABEL_13:

      objc_autoreleasePoolPop(v16);
      ++v15;
      if ((v20 & 1) == 0)
      {
        if (v29)
        {
          v14 = objc_retainAutorelease(v14);
          v26 = 0;
          *v29 = v14;
        }
        else
        {
          v26 = 0;
        }
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
  }
  if (a4)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not access the library"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v46[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v26 = 0;
LABEL_23:

  return v26;
}

void __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke_2;
  v9[3] = &unk_1E6B17E20;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enumerateFetchResult:withBatchSize:handler:", v5, 100, v9);

  v6 = *(_QWORD *)(a1 + 56);
  if (v6 && (*(unsigned int (**)(void))(v6 + 16))())
  {
    *a2 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CD1560];
    v11[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteFaceGroups:", v8);

  }
}

void __89__VCPPhotosPersistenceDelegate_resetLibraryClustersWithCancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setClusterSequenceNumber:", 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12 && (*(unsigned int (**)(void))(v12 + 16))())
    *a5 = 1;

}

- (BOOL)deleteEmptyGroupsAndReturnError:(id *)a3
{
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;

  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1558], "fetchEmptyFaceGroupsWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "fetchedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_photoLibrary);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__VCPPhotosPersistenceDelegate_deleteEmptyGroupsAndReturnError___block_invoke;
    v13[3] = &unk_1E6B15468;
    v14 = v8;
    v10 = v8;
    v11 = objc_msgSend(v9, "performChangesAndWait:error:", v13, a3);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __64__VCPPhotosPersistenceDelegate_deleteEmptyGroupsAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1560], "deleteFaceGroups:", *(_QWORD *)(a1 + 32));
}

- (BOOL)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  unsigned int (**v9)(_QWORD);
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  char *v26;
  uint64_t v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  id v51;
  id v52;
  id v53;
  _QWORD aBlock[4];
  id v55;
  VCPPhotosPersistenceDelegate *v56;
  id v57;
  unsigned int (**v58)(_QWORD);
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint8_t v68[128];
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v9 = (unsigned int (**)(_QWORD))a5;
  v10 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v44 = (void *)objc_msgSend(v10, "newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", WeakRetained);

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("keyFace == nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setInternalPredicate:", v12);

  }
  if (objc_msgSend(v48, "count"))
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v48, v44);
  else
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "fetchedObjects");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v48, "count") || objc_msgSend(v47, "count"))
  {
    if (!a4)
    {
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke;
      v63[3] = &unk_1E6B17E48;
      v63[4] = self;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v63);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "filteredArrayUsingPredicate:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v14, "count"))
      {
        v28 = 1;
        goto LABEL_51;
      }
      v47 = v14;
    }
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v47;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v15)
    {
      v16 = 0;
      v17 = *(_QWORD *)v60;
      v45 = *MEMORY[0x1E0CB2F90];
      v46 = *MEMORY[0x1E0CB2D50];
LABEL_13:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1BCCA1B2C]();
        if (v9 && v9[2](v9))
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v66 = v46;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpdateKeyFaces] Operation canceled"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", v45, -128, v23);
          v24 = objc_claimAutoreleasedReturnValue();

          v25 = 0;
          v16 = (id)v24;
        }
        else
        {
          -[VCPPhotosPersistenceDelegate bestRepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:](self, "bestRepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:", v19, v51, 0, v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v49, "setObject:forKey:", v22, v19);
          }
          else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "localIdentifier");
            v26 = (char *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v19, "verifiedType");
            *(_DWORD *)buf = 138412546;
            v70 = v26;
            v71 = 2048;
            v72 = v27;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[UpdateKeyFaces] Failed to find a representing face for Person %@ (verified type %ld)", buf, 0x16u);

          }
          v25 = 1;
        }

        objc_autoreleasePoolPop(v20);
        if (!v25)
          break;
        if (v15 == ++v18)
        {
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          if (v15)
            goto LABEL_13;
          break;
        }
      }

      if (v16)
      {
        if (a6)
        {
          v16 = objc_retainAutorelease(v16);
          v28 = 0;
          *a6 = v16;
        }
        else
        {
          v28 = 0;
        }
        goto LABEL_48;
      }
    }
    else
    {

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke_372;
    aBlock[3] = &unk_1E6B17E70;
    v55 = v49;
    v58 = v9;
    v56 = self;
    v57 = v51;
    v32 = _Block_copy(aBlock);
    v33 = (void *)MEMORY[0x1BCCA1B2C]();
    v34 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v53 = 0;
    v28 = objc_msgSend(v34, "performCancellableChangesAndWait:error:", v32, &v53);
    v35 = v53;

    objc_autoreleasePoolPop(v33);
    if ((v28 & 1) != 0)
    {
LABEL_47:

      v16 = 0;
LABEL_48:

      v47 = obj;
LABEL_49:

      goto LABEL_50;
    }
    objc_msgSend(v35, "domain");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0CD1D78]))
    {
      v37 = objc_msgSend(v35, "code") == 3072;

      if (!v37)
        goto LABEL_42;
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpdateKeyFaces] Operation canceled"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v39);
      v40 = objc_claimAutoreleasedReturnValue();

      v35 = (id)v40;
    }

LABEL_42:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v70 = (const char *)v35;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[UpdateKeyFaces] Failed to persist key face - %@", buf, 0xCu);
    }
    if (a6)
    {
      v35 = objc_retainAutorelease(v35);
      *a6 = v35;
    }
    goto LABEL_47;
  }
  v29 = (void *)MEMORY[0x1E0CB35C8];
  v73 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpdateKeyFaces] Failed to find persons %@"), v48);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v31);
  v51 = (id)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[VCPPhotosPersistenceDelegate updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:cancelOrExtendTimeoutBlock:error:]";
    v71 = 2112;
    v72 = (uint64_t)v51;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }
  if (!a6)
  {
    v28 = 0;
    goto LABEL_49;
  }
  v52 = objc_retainAutorelease(v51);
  v28 = 0;
  *a6 = v52;

LABEL_50:
  v14 = v47;
LABEL_51:

  return v28;
}

BOOL __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = (void *)objc_msgSend(v4, "newVisibleFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  objc_msgSend(v6, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v6, "setFetchLimit:", 1);
  v14[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  objc_msgSend(v6, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchKeyFaceForPerson:options:", v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 && (int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[UpdateKeyFaces] Person %@ already has a keyface; skipping",
      (uint8_t *)&v12,
      0xCu);

  }
  return v9 == 0;
}

void __121__VCPPhotosPersistenceDelegate_updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_cancelOrExtendTimeoutBlock_error___block_invoke_372(uint64_t a1, _BYTE *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v36;
    *(_QWORD *)&v5 = 134217984;
    v29 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 56);
        if (v9 && ((*(uint64_t (**)(void))(v9 + 16))() & 1) != 0)
        {
          *a2 = 1;
          goto LABEL_33;
        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8, v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "localIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v8, "verifiedType");
          objc_msgSend(v10, "localIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v41 = (uint64_t)v11;
          v42 = 2048;
          v43 = v12;
          v44 = 2112;
          v45 = v13;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[UpdateKeyFaces] Updating Person %@ (verified type %ld) with key face %@", buf, 0x20u);

        }
        if (objc_msgSend(v8, "verifiedType") == 1
          || objc_msgSend(v8, "verifiedType") == 2
          || (v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8)),
              v15 = objc_msgSend(v14, "mad_useVUGallery"),
              v14,
              v15))
        {
          objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setKeyFace:forCluster:", v10, 0);
        }
        else
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
          objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", v8, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count") == 1)
          {
            objc_msgSend(v18, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setKeyFace:", v10);

          }
          else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v21 = objc_msgSend(v18, "count");
            *(_DWORD *)buf = v29;
            v41 = v21;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[UpdateKeyFaces] Found %lu face groups for unverified person)", buf, 0xCu);
          }

        }
        ++v7;
      }
      while (v4 != v7);
      v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      v4 = v22;
    }
    while (v22);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v3);
        v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setQualityMeasure:", objc_msgSend(v28, "integerValue"));

      }
      v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);
  }
LABEL_33:

}

- (double)_keyFaceWeightingFactorCoefficient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  os_log_type_t v8;
  NSObject *v9;
  const char *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.mediaanalysis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("KeyFaceCoefficient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v8 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = (uint64_t)v5;
        v9 = MEMORY[0x1E0C81028];
        v10 = "[UpdateKeyFaces] Overwriting key face coefficient - %@";
LABEL_8:
        _os_log_impl(&dword_1B6C4A000, v9, v8, v10, (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    v7 = 0.8;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v8 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v12 = 134217984;
        v13 = 0x3FE999999999999ALL;
        v9 = MEMORY[0x1E0C81028];
        v10 = "[UpdateKeyFaces] Default key face coefficient - %.2f";
        goto LABEL_8;
      }
    }
  }

  return v7;
}

- (double)_keyFaceSunglassesFactorCoefficient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  os_log_type_t v8;
  NSObject *v9;
  const char *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.mediaanalysis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("KeyFaceSunglassesCoefficient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v8 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = (uint64_t)v5;
        v9 = MEMORY[0x1E0C81028];
        v10 = "[UpdateKeyFaces] Overwriting key face sunglasses coefficient - %@";
LABEL_8:
        _os_log_impl(&dword_1B6C4A000, v9, v8, v10, (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    v7 = 0.1;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v8 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v12 = 134217984;
        v13 = 0x3FB999999999999ALL;
        v9 = MEMORY[0x1E0C81028];
        v10 = "[UpdateKeyFaces] Default key face sunglasses coefficient - %.2f";
        goto LABEL_8;
      }
    }
  }

  return v7;
}

- (double)_keyFacePortraitFactorCoefficient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  os_log_type_t v8;
  NSObject *v9;
  const char *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.mediaanalysis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("KeyFacePortraitCoefficient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v8 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = (uint64_t)v5;
        v9 = MEMORY[0x1E0C81028];
        v10 = "[UpdateKeyFaces] Overwriting key face portrait coefficient - %@";
LABEL_8:
        _os_log_impl(&dword_1B6C4A000, v9, v8, v10, (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    v7 = 0.1;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v8 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v12 = 134217984;
        v13 = 0x3FB999999999999ALL;
        v9 = MEMORY[0x1E0C81028];
        v10 = "[UpdateKeyFaces] Default key face portrait coefficient - %.2f";
        goto LABEL_8;
      }
    }
  }

  return v7;
}

- (id)_bestVURepresentativeFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 candidateFaces:(id)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  double v10;
  double v11;
  double v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  double v25;
  void *v26;
  void *v27;
  id WeakRetained;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  unint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  int v47;
  void *v48;
  NSObject *v49;
  int v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  int v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  double v96;
  double v97;
  double v98;
  id v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  uint64_t v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  id v120;
  id v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  uint64_t v127;
  double v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  id v133;
  double v134;
  uint64_t v135;
  void *v136;
  double v137;
  double v138;
  uint64_t v139;
  int64_t v140;
  float v141;
  double v142;
  float v143;
  void *v144;
  float v145;
  float v146;
  void *v147;
  double v148;
  void *v149;
  float v150;
  void *v151;
  double v152;
  double v153;
  uint64_t v154;
  uint64_t v155;
  double v156;
  double v157;
  double v158;
  char v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  NSObject *v166;
  id v167;
  double v168;
  char v169;
  uint64_t v170;
  const __CFString *v171;
  const __CFString *v172;
  double v173;
  double v174;
  double v175;
  NSObject *v176;
  id v177;
  double v178;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  double v184;
  uint64_t v185;
  uint64_t v186;
  double v187;
  double v188;
  double v189;
  double v190;
  void *v191;
  double v192;
  double v193;
  double v194;
  NSObject *v195;
  id v196;
  double v197;
  char v198;
  uint64_t v199;
  const __CFString *v200;
  const __CFString *v201;
  double v202;
  double v203;
  double v204;
  NSObject *v205;
  id v206;
  double v207;
  id v208;
  double v209;
  double v210;
  double v211;
  NSObject *v212;
  id v213;
  double v214;
  id v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  NSObject *v220;
  id v221;
  double v222;
  id v223;
  void *v225;
  void *v226;
  double v227;
  VCPPhotosPersistenceDelegate *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  double v233;
  double v234;
  double v235;
  id *location;
  double v237;
  double v238;
  id v239;
  double v240;
  double v241;
  void *v242;
  double v243;
  void *v244;
  void *v245;
  id v246;
  int v247;
  void *v248;
  double v249;
  id v250;
  void *v251;
  int v252;
  void *v253;
  void *v254;
  void *v255;
  id v256;
  double v257;
  void *v258;
  uint64_t v259;
  void *v260;
  id v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  uint64_t (**v266)(void);
  void *context;
  void *contexta;
  void *contextb;
  void *v270;
  unint64_t i;
  unint64_t k;
  _BYTE v273[32];
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  _QWORD v278[4];
  id v279;
  id v280;
  id v281;
  _QWORD v282[3];
  _QWORD v283[3];
  uint8_t buf[4];
  void *v285;
  __int16 v286;
  double v287;
  __int16 v288;
  double v289;
  __int16 v290;
  double v291;
  __int16 v292;
  double v293;
  __int16 v294;
  double v295;
  __int16 v296;
  double v297;
  __int16 v298;
  double v299;
  __int16 v300;
  double v301;
  __int16 v302;
  double v303;
  __int16 v304;
  double v305;
  __int16 v306;
  const __CFString *v307;
  __int16 v308;
  const __CFString *v309;
  _QWORD v310[3];
  _QWORD v311[3];
  _BYTE v312[128];
  _QWORD v313[3];
  void *v314;
  _QWORD v315[4];

  v315[1] = *MEMORY[0x1E0C80C00];
  v261 = a3;
  v239 = a4;
  v246 = a5;
  v266 = (uint64_t (**)(void))a6;
  if (v266 && (v266[2]() & 1) != 0)
  {
    v256 = 0;
    goto LABEL_263;
  }
  -[VCPPhotosPersistenceDelegate _keyFaceWeightingFactorCoefficient](self, "_keyFaceWeightingFactorCoefficient");
  v238 = v10;
  -[VCPPhotosPersistenceDelegate _keyFaceSunglassesFactorCoefficient](self, "_keyFaceSunglassesFactorCoefficient");
  v234 = v11;
  -[VCPPhotosPersistenceDelegate _keyFacePortraitFactorCoefficient](self, "_keyFacePortraitFactorCoefficient");
  v235 = v12;
  v13 = objc_msgSend(v261, "detectionType");
  v14 = (void *)MEMORY[0x1E0CB3940];
  if (v13 == 1)
    v15 = CFSTR("Human");
  else
    v15 = CFSTR("Pet");
  objc_msgSend(v261, "localIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "mdID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("[UpdateKeyFacesVU][%@][%@][%@]"), v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v261, "mdID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v252 = v13;
  v228 = self;
  objc_msgSend(v19, "substringFromIndex:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v225 = v20;
  if (!v20)
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      v241 = 0.0;
      goto LABEL_17;
    }
    v23 = MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v261, "mdID");
      v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412546;
      v285 = v18;
      v286 = 2112;
      v287 = v25;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Person does not have valid mdID: %@", buf, 0x16u);

    }
    v241 = 0.0;
    goto LABEL_15;
  }
  v241 = COERCE_DOUBLE(objc_msgSend(v20, "integerValue"));
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v285 = v18;
      v286 = 2048;
      v287 = v241;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Querying key observations with mdID:%ld", buf, 0x16u);
    }
LABEL_15:

  }
LABEL_17:
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v261, "localIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("[UpdateKeyFacesVU][%@][%@][%ld]"), v15, v27, *(_QWORD *)&v241);
  v254 = (void *)objc_claimAutoreleasedReturnValue();

  location = (id *)&self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  +[MADVUGalleryReader sharedGalleryWithPhotoLibrary:](MADVUGalleryReader, "sharedGalleryWithPhotoLibrary:", WeakRetained);
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v242 && (int)MediaAnalysisLogLevel() >= 4)
  {
    v29 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to initialize VU Gallery Reader. Will fallback to use top quality faces from photos DB", buf, 2u);
    }

  }
  v31 = objc_loadWeakRetained(location);
  objc_msgSend(v31, "mad_allFacesFetchOptions");
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v264, "setIncludeNonvisibleFaces:", 0);
  objc_msgSend(v264, "setIncludeTorsoOnlyDetectionData:", 0);
  v244 = (void *)objc_msgSend(v264, "copy");
  v315[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v315, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setFetchPropertySets:", v32);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_loadWeakRetained(location);
  objc_msgSend(v33, "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:", 0, &unk_1E6B764B8);
  v226 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v226);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = MEMORY[0x1E0C81028];
  while (v34 < objc_msgSend(v263, "count"))
  {
    v36 = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v263, "objectAtIndexedSubscript:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "localIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v38, "isEqualToString:", v39) & 1) != 0)
    {

    }
    else
    {
      v40 = objc_msgSend(v37, "keyFacePickSource") == 1;

      if (!v40)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchKeyFaceForPerson:options:", v37, v244);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v38, "localIdentifier");
          v42 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          objc_msgSend(v37, "localIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v285 = v254;
          v286 = 2112;
          v287 = v42;
          v288 = 2112;
          v289 = *(double *)&v43;
          _os_log_impl(&dword_1B6C4A000, v35, OS_LOG_TYPE_DEBUG, "%@ keyFace %@ is picked by user for %@", buf, 0x20u);

        }
        objc_msgSend(v38, "localIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v260, "addObject:", v44);

      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v37, "localIdentifier");
        v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138412546;
        v285 = v254;
        v286 = 2112;
        v287 = v45;
        _os_log_impl(&dword_1B6C4A000, v35, OS_LOG_TYPE_ERROR, "%@ keyFace picked by user for %@, but NO keyface fetched!", buf, 0x16u);

      }
    }

LABEL_36:
    objc_autoreleasePoolPop(v36);
    ++v34;
  }
  v259 = 0;
  v253 = 0;
  v232 = 0;
  v248 = 0;
  v47 = v241 != 0.0 && v242 != 0;
  v247 = v47;
  v231 = *MEMORY[0x1E0CD1990];
  v230 = *MEMORY[0x1E0CD1970];
  v229 = *MEMORY[0x1E0CD19F8];
  v237 = 1.0 - v238;
  v257 = 0.0;
  v233 = 0.6;
  v227 = 0.0;
  v240 = 0.0;
  do
  {
    v258 = (void *)MEMORY[0x1BCCA1B2C]();
    v48 = v264;
    v49 = MEMORY[0x1E0C81028];
    if (v266 && (v266[2]() & 1) != 0)
    {
      v256 = 0;
      v50 = 1;
      goto LABEL_254;
    }
    if (v247)
    {
      objc_msgSend(v242, "queryKeyObservationsFor:limit:offset:", *(_QWORD *)&v241, 200, 200 * v259);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
    v262 = v51;
    if (!objc_msgSend(v51, "count"))
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v55 = v49;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v285 = v254;
          _os_log_impl(&dword_1B6C4A000, v49, OS_LOG_TYPE_INFO, "%@ End of key observations from VU", buf, 0xCu);
        }

        v48 = v264;
      }
      if (v259 > 0)
      {
        v50 = 16;
        goto LABEL_253;
      }
    }
    if (!v259)
    {
      if (objc_msgSend(v262, "count"))
      {
        objc_msgSend(v262, "firstObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "allValues");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "firstObject");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "doubleValue");
        v60 = v59;

        v48 = v264;
        v61 = MediaAnalysisLogLevel();
        v49 = MEMORY[0x1E0C81028];
        v233 = v60 * 0.85;
        if (v61 >= 6)
        {
          v62 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v285 = v254;
            v286 = 2048;
            v287 = v60 * 0.85;
            _os_log_impl(&dword_1B6C4A000, v49, OS_LOG_TYPE_INFO, "%@ Setting preferred density quality threshold %.2f", buf, 0x16u);
          }

          v48 = v264;
        }
      }
    }
    ++v259;
    if (v266 && (v266[2]() & 1) != 0)
    {
      v256 = 0;
      v50 = 1;
      goto LABEL_253;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v262, "count"));
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v262, "count"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v52 = v49;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v285 = v254;
          _os_log_impl(&dword_1B6C4A000, v49, OS_LOG_TYPE_DEBUG, "%@ Fetching key observations from Photos DB ...", buf, 0xCu);
        }

        v48 = v264;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v262, "count"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v278[0] = MEMORY[0x1E0C809B0];
      v278[1] = 3221225472;
      v278[2] = __130__VCPPhotosPersistenceDelegate__bestVURepresentativeFaceForPerson_qualityMeasureByFace_candidateFaces_cancelOrExtendTimeoutBlock___block_invoke;
      v278[3] = &unk_1E6B17E98;
      v279 = v254;
      v54 = v53;
      v280 = v54;
      v281 = v255;
      objc_msgSend(v262, "enumerateObjectsUsingBlock:", v278);
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithVuObservationIDs:options:", v54, v48);
      v265 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v63 = v49;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v285 = v254;
          _os_log_impl(&dword_1B6C4A000, v49, OS_LOG_TYPE_DEBUG, "%@ Fetching top quality faces from Photos DB ...", buf, 0xCu);
        }

        v48 = v264;
      }
      v54 = (id)objc_msgSend(v48, "copy");
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("quality"), 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v314 = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v314, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setSortDescriptors:", v65);

      objc_msgSend(v54, "setFetchLimit:", 200);
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", v261, v54);
      v265 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v66 = objc_msgSend(v265, "count");
    v67 = MEMORY[0x1E0C81028];
    if (!v66)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v285 = v254;
        _os_log_impl(&dword_1B6C4A000, v67, OS_LOG_TYPE_INFO, "%@ No visible face from the batch", buf, 0xCu);
      }
      v50 = 15;
      goto LABEL_252;
    }
    if ((unint64_t)objc_msgSend(v262, "count") <= 1 && objc_msgSend(v265, "count") == 1)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v265, "firstObject");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localIdentifier");
        v69 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138412546;
        v285 = v254;
        v286 = 2112;
        v287 = v69;
        _os_log_impl(&dword_1B6C4A000, v67, OS_LOG_TYPE_INFO, "%@ Returning sole key face %@", buf, 0x16u);

      }
      objc_msgSend(v265, "firstObject");
      v256 = (id)objc_claimAutoreleasedReturnValue();
      v50 = 1;
      goto LABEL_252;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_loadWeakRetained(location);
    objc_msgSend(v72, "librarySpecificFetchOptions");
    v245 = (void *)objc_claimAutoreleasedReturnValue();

    v313[0] = v231;
    v313[1] = v230;
    v313[2] = v229;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v313, 3);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v245, "setFetchPropertySets:", v73);

    v74 = (void *)MEMORY[0x1E0CD1398];
    objc_msgSend(v265, "fetchedObjects");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "fetchAssetsForFaces:options:", v75, v245);
    v270 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i < objc_msgSend(v270, "count"); ++i)
    {
      context = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v270, "objectAtIndexedSubscript:", i);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v76, v264);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v276 = 0u;
      v277 = 0u;
      v274 = 0u;
      v275 = 0u;
      v78 = v77;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v274, v312, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v275;
        do
        {
          for (j = 0; j != v79; ++j)
          {
            if (*(_QWORD *)v275 != v80)
              objc_enumerationMutation(v78);
            v82 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * j);
            objc_msgSend(v82, "localIdentifier");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "objectForKeyedSubscript:", v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v84 == 0;

            if (v85)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "localIdentifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setObject:forKeyedSubscript:", v86, v87);

            }
            objc_msgSend(v82, "localIdentifier");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectForKeyedSubscript:", v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v89 == 0;

            if (v90)
            {
              objc_msgSend(v82, "localIdentifier");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setObject:forKeyedSubscript:", v76, v91);

            }
          }
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v274, v312, 16);
        }
        while (v79);
      }

      objc_autoreleasePoolPop(context);
    }
    for (k = 0; k < objc_msgSend(v265, "count"); ++k)
    {
      v92 = (void *)MEMORY[0x1BCCA1B2C]();
      if (!v266 || (v266[2]() & 1) == 0)
      {
        objc_msgSend(v265, "objectAtIndexedSubscript:", k);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "localIdentifier");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v260, "containsObject:", v94);

        if (v95)
        {
          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v93, "localIdentifier");
            v96 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138412546;
            v285 = v254;
            v286 = 2112;
            v287 = v96;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Skip user picked keyFace %@", buf, 0x16u);

          }
LABEL_185:
          v50 = 36;
LABEL_186:

          goto LABEL_187;
        }
        objc_msgSend(v93, "quality");
        if (v97 > v257)
        {
          objc_msgSend(v93, "quality");
          v257 = v98;
          v99 = v93;

          v253 = v99;
        }
        if (v252 == 1)
        {
          objc_msgSend(v93, "roll");
          if (fabs(v100) > 0.785398163)
            goto LABEL_185;
          v101 = (void *)MEMORY[0x1E0D751E0];
          objc_msgSend(v93, "size");
          v103 = v102;
          v104 = objc_msgSend(v93, "sourceWidth");
          v105 = objc_msgSend(v93, "sourceHeight");
          objc_msgSend(v93, "centerX");
          v107 = v106;
          objc_msgSend(v93, "centerY");
          if (objc_msgSend(v101, "getCropRectForPortraitImage:size:imgWidth:imgHeight:centerX:centerY:", v273, v103, (double)v104, (double)v105, v107, v108))v109 = 1.0;
          else
            v109 = v235;
          if (objc_msgSend(v93, "glassesType") == 2)
            v110 = v234;
          else
            v110 = 1.0;
          objc_msgSend(v93, "localIdentifier");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectForKeyedSubscript:", v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = objc_msgSend(v112, "integerValue");

          if (v113)
          {
            v114 = 1.0;
            if (v113 == 2)
              v114 = 0.5;
            if (v113 <= 2)
              v115 = v114;
            else
              v115 = 0.25;
            objc_msgSend(v93, "localIdentifier", v114);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectForKeyedSubscript:", v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();

            if (v117)
            {
              v118 = objc_msgSend(v117, "mediaSubtypes");
              objc_msgSend(v117, "creationDate");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              if (v119)
              {
                objc_msgSend(v117, "creationDate");
                v120 = (id)objc_claimAutoreleasedReturnValue();
                v121 = v120;
              }
              else
              {
                objc_msgSend(v117, "curationProperties");
                v120 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "addedDate");
                v121 = (id)objc_claimAutoreleasedReturnValue();

              }
              v185 = *(_QWORD *)&v118 & 0x80004;

              if (v185)
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                v186 = objc_claimAutoreleasedReturnValue();

                v121 = (id)v186;
              }
              v187 = 1.0;
              objc_msgSend(v121, "timeIntervalSinceNow");
              v189 = fmax(v188 / 31557600.0 * 0.05 + 1.0, 0.2);
              if (v189 <= 1.0)
                v190 = v189;
              else
                v190 = 1.0;
              if (objc_msgSend(v93, "poseType") != 1)
              {
                if (objc_msgSend(v93, "poseType"))
                  v187 = 0.1;
                else
                  v187 = 0.5;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v93, "vuObservationID"));
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v255, "objectForKeyedSubscript:", v191);
              contextb = (void *)objc_claimAutoreleasedReturnValue();

              if (contextb)
                objc_msgSend(contextb, "doubleValue");
              else
                objc_msgSend(v93, "quality");
              v193 = v192;
              v194 = v237 * (v109 * v110 * v115 * v190 * v187) + v238 * v192;
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v195 = MEMORY[0x1E0C81028];
                v196 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v195, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v93, "localIdentifier");
                  v197 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                  v198 = objc_msgSend(v117, "mediaSubtypes");
                  v199 = objc_msgSend(v117, "mediaSubtypes");
                  v200 = CFSTR("Yes");
                  if ((v198 & 4) != 0)
                    v201 = CFSTR("Yes");
                  else
                    v201 = CFSTR("No");
                  *(_DWORD *)buf = 138414850;
                  if ((v199 & 0x80000) == 0)
                    v200 = CFSTR("No");
                  v285 = v254;
                  v286 = 2112;
                  v287 = v197;
                  v288 = 2048;
                  v289 = v194;
                  v290 = 2048;
                  v291 = v193;
                  v292 = 2048;
                  v293 = v109;
                  v294 = 2048;
                  v295 = v110;
                  v296 = 2048;
                  v297 = v115;
                  v298 = 2048;
                  v299 = v190;
                  v300 = 2048;
                  v301 = v187;
                  v302 = 2112;
                  v303 = *(double *)&v201;
                  v304 = 2112;
                  v305 = *(double *)&v200;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Face %@ score: %.3f (vu-%.3f, a-%.3f, b-%.3f, c-%.3f, d-%.3f, e-%.3f,ScreenShot-%@, ScreenRecording-%@)", buf, 0x70u);

                }
              }
              if (v109 == 1.0 && v187 == 1.0 && v115 == 1.0 && v110 == 1.0 && !v185 && v193 > v233)
              {
                if (v194 > v240
                  || v194 == v240
                  && (objc_msgSend(v93, "quality"), v203 = v202, objc_msgSend(v248, "quality"), v203 > v204))
                {
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    v205 = MEMORY[0x1E0C81028];
                    v206 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v93, "localIdentifier");
                      v207 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                      *(_DWORD *)buf = 138412546;
                      v285 = v254;
                      v286 = 2112;
                      v287 = v207;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Find a better preferred key face candidate %@", buf, 0x16u);

                    }
                  }
                  v208 = v93;

                  v248 = v208;
                  v240 = v194;
                }
              }
              if (v194 > v227
                || v194 == v227
                && (objc_msgSend(v93, "quality"), v210 = v209, objc_msgSend(v232, "quality"), v210 > v211))
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v212 = MEMORY[0x1E0C81028];
                  v213 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v212, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v93, "localIdentifier");
                    v214 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    *(_DWORD *)buf = 138412546;
                    v285 = v254;
                    v286 = 2112;
                    v287 = v214;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Find a better key face candidate %@", buf, 0x16u);

                  }
                }
                v215 = v93;

                v232 = v215;
                v227 = v194;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(v194 * 1000.0));
              v216 = (void *)objc_claimAutoreleasedReturnValue();
              if (v239)
                objc_msgSend(v239, "setObject:forKey:", v216, v93);
              if (v246)
              {
                v310[0] = CFSTR("localIdentifier");
                objc_msgSend(v93, "photosFaceRepresentationLocalIdentifier");
                v217 = (void *)objc_claimAutoreleasedReturnValue();
                v311[0] = v217;
                v311[1] = v216;
                v310[1] = CFSTR("qualityMeasure");
                v310[2] = CFSTR("quality");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v193);
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                v311[2] = v218;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v311, v310, 3);
                v219 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v246, "addObject:", v219);
              }

LABEL_239:
              v50 = 0;
              goto LABEL_186;
            }
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_185;
          }
          else if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            goto LABEL_185;
          }
          objc_msgSend(v93, "localIdentifier");
          v184 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v285 = v254;
          v286 = 2112;
          v287 = v184;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ No asset found for face %@; skipping",
            buf,
            0x16u);

          goto LABEL_185;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v93, "vuObservationID"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "objectForKeyedSubscript:", v122);
        contexta = (void *)objc_claimAutoreleasedReturnValue();

        if (contexta)
        {
          objc_msgSend(contexta, "doubleValue");
          v124 = v123;
          if (v123 < 0.8)
            goto LABEL_128;
        }
        else
        {
          v124 = 1.0;
        }
        objc_msgSend(v93, "localIdentifier");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectForKeyedSubscript:", v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v249 = v124;
        v127 = objc_msgSend(v126, "integerValue");

        v128 = 1.0;
        if (v127 > 2)
          v128 = 0.25;
        if (v127 == 2)
          v128 = 0.5;
        v243 = v128;
        objc_msgSend(v93, "localIdentifier");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectForKeyedSubscript:", v129);
        v130 = (void *)objc_claimAutoreleasedReturnValue();

        if (v130)
        {
          v131 = objc_msgSend(v130, "mediaSubtypes");
          objc_msgSend(v130, "creationDate");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          if (v132)
          {
            objc_msgSend(v130, "creationDate");
            v133 = (id)objc_claimAutoreleasedReturnValue();
            v250 = v133;
          }
          else
          {
            objc_msgSend(v130, "curationProperties");
            v133 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "addedDate");
            v250 = (id)objc_claimAutoreleasedReturnValue();

          }
          if ((*(_QWORD *)&v131 & 0x80004) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v135 = objc_claimAutoreleasedReturnValue();

            v136 = (void *)v135;
          }
          else
          {
            v136 = v250;
          }
          v251 = v136;
          objc_msgSend(v136, "timeIntervalSinceNow");
          if (v137 >= 0.0)
            v138 = v137;
          else
            v138 = -v137;
          v139 = objc_msgSend(v93, "sourceHeight");
          v140 = objc_msgSend(v93, "sourceWidth");
          if (v139 < v140)
            v140 = v139;
          v141 = VCPPFResolutionQuality(v140);
          objc_msgSend(v93, "size");
          *(float *)&v142 = v142;
          v143 = VCPPFFaceAreaQuality(*(float *)&v142);
          objc_msgSend(v130, "mediaAnalysisProperties");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "wallpaperScore");
          v146 = v145;

          objc_msgSend(v130, "mediaAnalysisProperties");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v148 = 1.0;
          if ((int)objc_msgSend(v147, "probableRotationDirection") >= 2)
          {
            objc_msgSend(v130, "mediaAnalysisProperties");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "probableRotationDirectionConfidence");
            if (v150 < 0.1)
              v148 = 1.0;
            else
              v148 = 0.1;

          }
          v151 = (void *)MEMORY[0x1E0D751E0];
          objc_msgSend(v93, "size");
          v153 = v152;
          v154 = objc_msgSend(v93, "sourceWidth");
          v155 = objc_msgSend(v93, "sourceHeight");
          objc_msgSend(v93, "centerX");
          v157 = v156;
          objc_msgSend(v93, "centerY");
          v159 = objc_msgSend(v151, "getCropRectForPortraitImage:size:imgWidth:imgHeight:centerX:centerY:", v273, v153, (double)v154, (double)v155, v157, v158);
          v160 = 1.0;
          if ((v159 & 1) == 0)
          {
            -[VCPPhotosPersistenceDelegate _keyFacePortraitFactorCoefficient](v228, "_keyFacePortraitFactorCoefficient");
            v160 = v161;
          }
          v162 = fmax(v138 / 31557600.0 * -0.05 + 1.0, 0.8);
          v163 = v141;
          v164 = v143;
          v165 = v237 * (v243 * v162 * v163 * v143 * v146 * v148 * v160) + v238 * v249;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v166 = MEMORY[0x1E0C81028];
            v167 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v93, "localIdentifier");
              v168 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v169 = objc_msgSend(v130, "mediaSubtypes");
              v170 = objc_msgSend(v130, "mediaSubtypes");
              v171 = CFSTR("Yes");
              if ((v169 & 4) != 0)
                v172 = CFSTR("Yes");
              else
                v172 = CFSTR("No");
              *(_DWORD *)buf = 138415362;
              if ((v170 & 0x80000) == 0)
                v171 = CFSTR("No");
              v285 = v254;
              v286 = 2112;
              v287 = v168;
              v288 = 2048;
              v289 = v165;
              v290 = 2048;
              v291 = v249;
              v292 = 2048;
              v293 = v243;
              v294 = 2048;
              v295 = v162;
              v296 = 2048;
              v297 = v163;
              v298 = 2048;
              v299 = v164;
              v300 = 2048;
              v301 = v146;
              v302 = 2048;
              v303 = v148;
              v304 = 2048;
              v305 = v160;
              v306 = 2112;
              v307 = v172;
              v308 = 2112;
              v309 = v171;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Face %@ score: %.3f (vu-%.3f, a-%.3f, b-%.3f, c-%.3f, d-%.3f, e-%.3f, f-%.3f, g-%.3f, ScreenShot-%@, ScreenRecording-%@)", buf, 0x84u);

            }
          }
          if (v165 > v240
            || v165 == v240 && (objc_msgSend(v93, "quality"), v174 = v173, objc_msgSend(v248, "quality"), v174 > v175))
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v176 = MEMORY[0x1E0C81028];
              v177 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v93, "localIdentifier");
                v178 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                *(_DWORD *)buf = 138412546;
                v285 = v254;
                v286 = 2112;
                v287 = v178;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Find a better key face candidate %@", buf, 0x16u);

              }
            }
            v179 = v93;

            v248 = v179;
            v240 = v165;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(v165 * 1000.0));
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          if (v239)
            objc_msgSend(v239, "setObject:forKey:", v180, v93);
          if (v246)
          {
            v282[0] = CFSTR("localIdentifier");
            objc_msgSend(v93, "photosFaceRepresentationLocalIdentifier");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            v283[0] = v181;
            v283[1] = v180;
            v282[1] = CFSTR("qualityMeasure");
            v282[2] = CFSTR("quality");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v249);
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            v283[2] = v182;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v283, v282, 3);
            v183 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v246, "addObject:", v183);
          }

          goto LABEL_239;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v93, "localIdentifier");
          v134 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v285 = v254;
          v286 = 2112;
          v287 = v134;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ No asset found for pet face %@; skipping",
            buf,
            0x16u);

        }
LABEL_128:

        goto LABEL_185;
      }
      v256 = 0;
      v50 = 1;
LABEL_187:
      objc_autoreleasePoolPop(v92);
      if (v50 != 36 && v50)
        goto LABEL_251;
    }
    if (v248)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v220 = MEMORY[0x1E0C81028];
        v221 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v248, "localIdentifier");
          v222 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v285 = v254;
          v286 = 2112;
          v287 = v222;
          _os_log_impl(&dword_1B6C4A000, v220, OS_LOG_TYPE_INFO, "%@ Returning preferred key face %@", buf, 0x16u);

        }
      }
      v50 = 16;
    }
    else
    {
      v248 = 0;
      v50 = 0;
    }
LABEL_251:

LABEL_252:
LABEL_253:

LABEL_254:
    objc_autoreleasePoolPop(v258);
  }
  while (!v50 || v50 == 15);
  if (v50 == 16)
  {
    if (v248)
    {
      v223 = v248;
      v248 = v223;
      goto LABEL_261;
    }
    if (v232)
    {
      v223 = v232;
      v248 = 0;
      v232 = v223;
LABEL_261:
      v256 = v223;
    }
    else
    {
      v256 = v253;
      v232 = 0;
      v248 = 0;
    }
  }

LABEL_263:
  return v256;
}

void __130__VCPPhotosPersistenceDelegate__bestVURepresentativeFaceForPerson_qualityMeasureByFace_candidateFaces_cancelOrExtendTimeoutBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = a1[4];
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v4;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Receiving key observation %@ with score %@", (uint8_t *)&v17, 0x20u);

  }
  v9 = (void *)a1[5];
  objc_msgSend(v3, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  objc_msgSend(v3, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)a1[6];
  objc_msgSend(v3, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v16);

}

- (id)bestRepresentativeFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 candidateFaces:(id)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  uint64_t (**v10)(_QWORD);
  uint64_t (**v11)(_QWORD);
  void *v12;
  id WeakRetained;
  int v14;
  void *v15;
  id v16;
  void *v17;
  VCPPhotosPersistenceDelegate *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  VCPPhotosPersistenceDelegate *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[8];
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v43 = a4;
  v40 = a5;
  v10 = (uint64_t (**)(_QWORD))a6;
  v11 = v10;
  if (!v10 || (v10[2](v10) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v14 = objc_msgSend(WeakRetained, "mad_useVUGallery");

    if (v14)
    {
      -[VCPPhotosPersistenceDelegate _bestVURepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:](self, "_bestVURepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:", v41, v43, v40, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
    v15 = (void *)objc_opt_class();
    v16 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v37 = (void *)objc_msgSend(v15, "newVisibleFacesFetchOptionsWithPhotoLibrary:", v16);

    v50[0] = *MEMORY[0x1E0CD1B58];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = self;
    objc_msgSend(v37, "setFetchPropertySets:", v17);

    v18 = self;
    -[VCPPhotosPersistenceDelegate _facesFromFaceGroupWithMostNumberOfFacesOnPerson:options:error:](self, "_facesFromFaceGroupWithMostNumberOfFacesOnPerson:options:error:", v41, v37, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      if (!v11)
        goto LABEL_15;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[UpdateKeyFaces] None of the faces on the person are clustered - just fetch faces for the person", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", v41, v37);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fetchedObjects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = self;
      if (!v11)
        goto LABEL_15;
    }
    if ((v11[2](v11) & 1) != 0)
    {
      v12 = 0;
LABEL_36:

      goto LABEL_37;
    }
LABEL_15:
    -[VCPPhotosPersistenceDelegate _faceToFaceCountMapForFaces:](v18, "_faceToFaceCountMapForFaces:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v20 = v38;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v25 = (void *)MEMORY[0x1BCCA1B2C]();
          if (v11 && (v11[2](v11) & 1) != 0)
          {
            v26 = 0;
          }
          else
          {
            v27 = objc_msgSend(v24, "qualityMeasure");
            objc_msgSend(v24, "localIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              objc_msgSend(v39, "valueForKey:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "integerValue");

              if (v30 <= 1)
                v31 = 1;
              else
                v31 = v30;
              v27 = objc_msgSend(MEMORY[0x1E0D751E0], "qualityMeasureForFace:countOfFacesOnAsset:", v24, v31);
              if (v43)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setObject:forKey:", v32, v24);

              }
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKey:", v33, v28);

            v26 = 1;
          }
          objc_autoreleasePoolPop(v25);
          if (!v26)
          {
            v12 = 0;
            goto LABEL_35;
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v21)
          continue;
        break;
      }
    }

    -[VCPPhotosPersistenceDelegate _representativenessByFaceCSNFromFaces:cancelOrExtendTimeoutBlock:](v36, "_representativenessByFaceCSNFromFaces:cancelOrExtendTimeoutBlock:", v20, v11);
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D751E0], "selectRepresentativeFromFaces:qualityMeasureByLocalIdentifier:representativenessByCSN:candidateFaces:", v20, v42, v34, v40);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)v34;
LABEL_35:

    goto LABEL_36;
  }
  v12 = 0;
LABEL_37:

  return v12;
}

- (id)_representativenessByFaceCSNFromFaces:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  id v28;
  id v29;
  void *v30;
  void *v32;
  id obj;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (!v7)
    goto LABEL_37;
  v8 = *(_QWORD *)v37;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v37 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x1BCCA1B2C]();
      if (v6 && (v6[2](v6) & 1) != 0)
      {
        v12 = 1;
        goto LABEL_33;
      }
      if (objc_msgSend(v10, "detectionType") == 1)
      {
        objc_msgSend(v10, "faceClusteringProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "faceprint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "faceprintData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v24 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v10;
              _os_log_impl(&dword_1B6C4A000, v24, OS_LOG_TYPE_DEFAULT, "Warning: Couldn't get faceprint data for face: %@; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_31;
        }
        v16 = objc_msgSend(v10, "clusterSequenceNumber");
        if (v16 < 1)
        {
LABEL_15:
          v12 = 0;
LABEL_32:

          goto LABEL_33;
        }
        v35 = 0;
        +[VCPVNImageprintWrapper generateVNImageprintWithType:archiveData:andError:](VCPVNImageprintWrapper, "generateVNImageprintWithType:archiveData:andError:", 0, v15, &v35);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v35;
        if (v17)
        {
          objc_msgSend(v17, "faceprint");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (!v20)
          {
            v21 = objc_alloc_init(MEMORY[0x1E0CEDEE0]);
            objc_msgSend(v21, "setFaceId:", v16);
            objc_msgSend(v21, "setFaceTorsoprint:", v17);
            objc_msgSend(v17, "faceprint");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setFaceprint:", v22);

            objc_msgSend(v32, "addObject:", v21);
            goto LABEL_15;
          }
          if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          *(_WORD *)buf = 0;
          v25 = MEMORY[0x1E0C81028];
          v26 = "representativeness selection receives a torso-only print; ignoring";
          v27 = 2;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          *(_DWORD *)buf = 138412290;
          v41 = v18;
          v25 = MEMORY[0x1E0C81028];
          v26 = "Failed to get VNFaceTorsoprint from faceprint data - %@";
          v27 = 12;
        }
        _os_log_impl(&dword_1B6C4A000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
LABEL_30:

LABEL_31:
        v12 = 3;
        goto LABEL_32;
      }
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v10, "detectionType");
        *(_DWORD *)buf = 67109120;
        LODWORD(v41) = v23;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Warning: cannot handle representativeness with imageprint type %d; ignoring",
          buf,
          8u);
      }
      v12 = 3;
LABEL_33:
      objc_autoreleasePoolPop(v11);
      if (v12 != 3 && v12)
      {
        v28 = (id)MEMORY[0x1E0C9AA70];
        v29 = obj;
        goto LABEL_49;
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v7)
      continue;
    break;
  }
LABEL_37:

  if (!objc_msgSend(v32, "count") || v6 && (v6[2](v6) & 1) != 0)
  {
    v28 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CEDE00], "representativenessForFaces:error:", v32, &v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v34;
    if (v30)
    {
      v28 = v30;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v29;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Warning: Could not get representativeness for faces, error: %@", buf, 0xCu);
      }
      v28 = (id)MEMORY[0x1E0C9AA70];
    }

LABEL_49:
  }

  return v28;
}

- (id)_faceToFaceCountMapForFaces:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  uint64_t v26;
  void *context;
  void *v28;
  void *v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v7 = objc_msgSend(v5, "newAssetFetchOptionsWithPhotoLibrary:", WeakRetained);

  v24 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsForFaces:options:", v25, v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v26 = *MEMORY[0x1E0CD1B70];
  while (v30 < objc_msgSend(v28, "count"))
  {
    context = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v28, "objectAtIndexedSubscript:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    v9 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v10 = (void *)objc_msgSend(v8, "newAllFacesFetchOptionsWithPhotoLibrary:", v9);

    v36[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFetchPropertySets:", v11);

    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v29, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v17, "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "valueForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "localIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setValue:forKey:", v21, v22);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v14);
    }

    objc_autoreleasePoolPop(context);
    ++v30;
  }

  return v4;
}

+ (CGSize)faceTileSizeAdjustingForImageAspectRatio:(CGSize)result imgWidth:(double)a4 imgHeight:(double)a5
{
  if (a4 <= a5)
    result.width = result.height * (a5 / a4);
  else
    result.height = result.width * (a4 / a5);
  if (result.width > 1.0)
  {
    result.height = result.height * (1.0 / result.width);
    result.width = 1.0;
  }
  if (result.height > 1.0)
  {
    result.width = result.width * (1.0 / result.height);
    result.height = 1.0;
  }
  return result;
}

- (id)groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:(unint64_t)a3 error:(id *)a4
{
  void *v4;
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  unint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CD1558];
  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchFaceGroupsWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  v10 = objc_loadWeakRetained((id *)p_photoLibrary);
  v25 = (void *)objc_msgSend(v9, "newAllFacesFetchOptionsWithPhotoLibrary:", v10);

  v11 = *MEMORY[0x1E0CD1B80];
  v26[0] = *MEMORY[0x1E0CD1B70];
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFetchPropertySets:", v12);

  for (i = 0; i < objc_msgSend(v8, "count"); ++i)
  {
    v14 = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v15, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") >= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j < objc_msgSend(v16, "count"); ++j)
      {
        v19 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v16, "objectAtIndexedSubscript:", j);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "clusterSequenceNumber"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v21);

        objc_autoreleasePoolPop(v19);
      }
      objc_msgSend(v23, "addObject:", v17);

    }
    objc_autoreleasePoolPop(v14);
  }

  return v23;
}

- (BOOL)needsPersonBuilding
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(personBuilderState = %ld)"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldPrefetchCount:", 1);
  objc_msgSend(v3, "setInternalPredicate:", v4);
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)_cleanupMergeCandidatesForVerifiedPersons:(id)a3 minimumFaceGroupSize:(unint64_t)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  unsigned int (**v28)(void);
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  char v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  id *location;
  unint64_t v47;
  VCPPhotosPersistenceDelegate *v48;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  void *v53;
  void *v54;
  unsigned int (**v55)(void);
  id v56;
  void *context;
  id contexta;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  unsigned int (**v67)(void);
  _QWORD v68[4];
  id v69;
  VCPPhotosPersistenceDelegate *v70;
  id v71;
  id v72;
  unsigned int (**v73)(void);
  id v74;
  unint64_t v75;
  _QWORD aBlock[5];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  id v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v55 = (unsigned int (**)(void))a5;
  v9 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v52 = (void *)objc_msgSend(v9, "newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", WeakRetained);

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = a4;
  v48 = self;
  location = (id *)&self->_photoLibrary;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v49 = *MEMORY[0x1E0CB2F90];
  v50 = *MEMORY[0x1E0CB2D50];
  while (v59 < objc_msgSend(v56, "count"))
  {
    context = (void *)MEMORY[0x1BCCA1B2C]();
    if (v55 && v55[2]())
    {
      if (!a6)
      {
        v14 = 0;
        goto LABEL_18;
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v89 = v50;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled cleaning up merge candidates of verified persons"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v49, -128);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v56, "objectAtIndexedSubscript:", v59);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchMergeCandidatePersonsForPerson:options:", v12, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "count"))
      {
        objc_msgSend(v12, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setObject:forKey:", v12, v15);

        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v13 = v53;
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v80 != v17)
                objc_enumerationMutation(v13);
              v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              objc_msgSend(v19, "localIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setObject:forKey:", v19, v20);

              objc_msgSend(v12, "localIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = v21;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "localIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              AddMergeCandidatePersonsForPerson(v61, v22, v23, &stru_1E6B1C190);

            }
            v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
          }
          while (v16);
        }

        v14 = 1;
      }
      else
      {
        v14 = 1;
        v13 = v53;
      }
    }

LABEL_18:
    objc_autoreleasePoolPop(context);
    ++v59;
    if ((v14 & 1) == 0)
    {
      v36 = 0;
      goto LABEL_41;
    }
  }
  if (!objc_msgSend(v61, "count"))
  {
    v36 = 1;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke;
  aBlock[3] = &unk_1E6B17EC0;
  aBlock[4] = v48;
  contexta = v54;
  v77 = contexta;
  v26 = v24;
  v78 = v26;
  v60 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v25;
  v68[1] = 3221225472;
  v68[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_2;
  v68[3] = &unk_1E6B17EE8;
  v28 = v55;
  v73 = v28;
  v29 = v62;
  v69 = v29;
  v70 = v48;
  v30 = v60;
  v74 = v30;
  v31 = v26;
  v71 = v31;
  v75 = v47;
  v32 = v27;
  v72 = v32;
  objc_msgSend(v61, "enumerateObjectsUsingBlock:", v68);
  if (!v55 || !((unsigned int (*)(unsigned int (**)(void)))v55[2])(v28))
  {
    objc_msgSend(v61, "minusSet:", v32);
    if (!objc_msgSend(v61, "count"))
    {
      v36 = 1;
      goto LABEL_40;
    }
    v37 = (void *)MEMORY[0x1BCCA1B2C]();
    v38 = objc_loadWeakRetained(location);
    v64[0] = v25;
    v64[1] = 3221225472;
    v64[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_3;
    v64[3] = &unk_1E6B17F38;
    v65 = v61;
    v67 = v28;
    v66 = v29;
    v63 = 0;
    v36 = objc_msgSend(v38, "performCancellableChangesAndWait:error:", v64, &v63);
    v34 = v63;

    objc_autoreleasePoolPop(v37);
    if (a6)
      v39 = v36;
    else
      v39 = 1;
    if ((v39 & 1) != 0)
      goto LABEL_39;
    objc_msgSend(v34, "domain");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0CD1D78]))
    {
      v41 = objc_msgSend(v34, "code") == 3072;

      if (v41)
      {
        v42 = (void *)MEMORY[0x1E0CB35C8];
        v83 = v50;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled cleaning up merge candidates"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", v49, -128, v44);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_39:
        goto LABEL_40;
      }
    }
    else
    {

    }
    v34 = objc_retainAutorelease(v34);
    *a6 = v34;
    goto LABEL_39;
  }
  if (a6)
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v85 = v50;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Canceled cleaning up merge candidates of verified persons"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v86 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v49, -128, v35);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    goto LABEL_39;
  }
  v36 = 0;
LABEL_40:

LABEL_41:
  return v36;
}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v20 = (void *)objc_msgSend(v6, "newVisibleFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  v26[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFetchPropertySets:", v8);

  objc_msgSend(v20, "setShouldPrefetchCount:", 1);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v18;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v12, v13);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v12, v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v17, v13);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *context;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  v6 = *(_QWORD *)(a1 + 64);
  if (v6 && (*(unsigned int (**)(void))(v6 + 16))())
  {
    *a3 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "person1LocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "person2LocalIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", v24, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", v22, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    objc_msgSend(v13, "intersectSet:", v14);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v19, "unsignedIntegerValue") >= *(_QWORD *)(a1 + 80))
          {
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);

            goto LABEL_14;
          }

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_14:

  }
  objc_autoreleasePoolPop(context);

}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_3(uint64_t a1, _BYTE *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_4;
  v9[3] = &unk_1E6B17F10;
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v5, v6, v7))
    *a2 = 1;

}

void __128__VCPPhotosPersistenceDelegate__cleanupMergeCandidatesForVerifiedPersons_minimumFaceGroupSize_cancelOrExtendTimeoutBlock_error___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 && (*(unsigned int (**)(void))(v6 + 16))())
  {
    *a3 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "person1LocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "person2LocalIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v12)
    {
      objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeMergeCandidatePersons:", v14);

    }
  }

}

- (BOOL)cleanupMergeCandidatesWithMinimumFaceGroupSize:(unint64_t)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  if (WeakRetained)
  {
    v10 = (void *)objc_opt_class();
    v11 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v12 = (void *)objc_msgSend(v10, "newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", v11);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType = %d) OR (verifiedType = %d)"), 1, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v13);

    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
      LOBYTE(a5) = -[VCPPhotosPersistenceDelegate _cleanupMergeCandidatesForVerifiedPersons:minimumFaceGroupSize:cancelOrExtendTimeoutBlock:error:](self, "_cleanupMergeCandidatesForVerifiedPersons:minimumFaceGroupSize:cancelOrExtendTimeoutBlock:error:", v14, a3, v8, a5);
    else
      LOBYTE(a5) = 1;

  }
  else if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not access the library"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (id)_updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:(id)a3 fetchLimit:(unint64_t)a4
{
  uint64_t (**v6)(_QWORD);
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v6 = (uint64_t (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v9, "setFetchLimit:", a4);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(personBuilderState = %ld)"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithOptions:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  do
  {
    if (v12 >= objc_msgSend(v11, "count"))
      break;
    v13 = (void *)MEMORY[0x1BCCA1B2C]();
    if (v6 && (v6[2](v6) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(v15, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v15, v18);

      }
      v14 = 1;
    }
    objc_autoreleasePoolPop(v13);
    ++v12;
  }
  while ((v14 & 1) != 0);
  if (v6 && v6[2](v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v7;
  }
  v20 = v19;

  return v20;
}

- (void)_enumeratePersonsWithLocalIdentifiers:(id)a3 fetchOptions:(id)a4 personCache:(id)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void (**v30)(id, void *, uint64_t, unsigned __int8 *);
  id v31;
  unsigned __int8 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a6;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16, v9);
  if (v13)
  {
    v14 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = objc_msgSend(v17, "verifiedType");
          if ((v19 & 0x8000000000000000) == 0)
          {
            v20 = v19 ? objc_msgSend(v10, "minimumVerifiedFaceCount") : objc_msgSend(v10, "minimumUnverifiedFaceCount");
            if (objc_msgSend(v18, "faceCount") >= v20)
            {
              objc_msgSend(v10, "predicate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (!v21 || objc_msgSend(v21, "evaluateWithObject:", v18))
              {
                v32 = 0;
                v30[2](v30, v18, v16, &v32);
                if (v32)
                {

                  v23 = v12;
                  goto LABEL_25;
                }
              }

            }
          }
        }
        else
        {
          objc_msgSend(v31, "addObject:", v16);
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v31, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    do
    {
      if (v24 >= objc_msgSend(v23, "count"))
        break;
      v25 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, v27);

      v32 = 0;
      objc_msgSend(v26, "localIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2](v30, v26, (uint64_t)v28, &v32);

      v29 = v32;
      objc_autoreleasePoolPop(v25);
      ++v24;
    }
    while (!v29);
LABEL_25:

  }
}

- (void)dedupeGraphVerifiedPersonsInFaceGroup:(id)a3 personCache:(id)a4
{
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id *v31;
  os_log_type_t v32;
  NSObject *v33;
  const char *v34;
  id v35;
  id v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  _QWORD v62[5];

  v62[2] = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v42 = a4;
  v6 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v8 = (void *)objc_msgSend(v6, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(trainingType = %d) || (trainingType = %d)"), 1, 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:");
  v9 = *MEMORY[0x1E0CD1B80];
  v62[0] = *MEMORY[0x1E0CD1B70];
  v62[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v10);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v43, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v40 = v11;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v17, "personLocalIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (!v19)
          {
            objc_msgSend(v17, "personLocalIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v14);
    }

    if (!objc_msgSend(v12, "count"))
      goto LABEL_32;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_opt_class();
    v23 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v24 = (void *)objc_msgSend(v22, "newAllPersonsFetchOptionsWithPhotoLibrary:", v23);

    v25 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke;
    v50[3] = &unk_1E6B17F60;
    v26 = v21;
    v51 = v26;
    v27 = v39;
    v52 = v27;
    -[VCPPhotosPersistenceDelegate _enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:](self, "_enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:", v12, v24, v42, v50);
    if (objc_msgSend(v26, "count"))
    {
      if (objc_msgSend(v27, "count"))
      {
        v28 = objc_loadWeakRetained((id *)&self->_photoLibrary);
        v48[0] = v25;
        v48[1] = 3221225472;
        v48[2] = __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_2;
        v48[3] = &unk_1E6B15468;
        v29 = v27;
        v49 = v29;
        v47 = 0;
        v30 = objc_msgSend(v28, "performChangesAndWait:error:", v48, &v47);
        v38 = v47;

        v31 = &v49;
        if (v30)
        {
          if ((int)MediaAnalysisLogLevel() < 6)
            goto LABEL_30;
          v32 = OS_LOG_TYPE_INFO;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_30;
          *(_DWORD *)buf = 138412546;
          v58 = v29;
          v59 = 2112;
          v60 = v43;
          v33 = MEMORY[0x1E0C81028];
          v34 = "PersonBuilder: Deleted duplicate graph-verified persons '%@' from face group %@";
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_30;
          v32 = OS_LOG_TYPE_ERROR;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          *(_DWORD *)buf = 138412546;
          v58 = v29;
          v59 = 2112;
          v60 = v43;
          v33 = MEMORY[0x1E0C81028];
          v34 = "PersonBuilder: Failed to delete duplicate graph-verified persons '%@' from face group %@";
        }
LABEL_29:
        _os_log_impl(&dword_1B6C4A000, v33, v32, v34, buf, 0x16u);
LABEL_30:

      }
    }
    else if ((unint64_t)objc_msgSend(v27, "count") >= 2)
    {
      v35 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      v45[0] = v25;
      v45[1] = 3221225472;
      v45[2] = __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_422;
      v45[3] = &unk_1E6B15468;
      v36 = v27;
      v46 = v36;
      v44 = 0;
      v37 = objc_msgSend(v35, "performChangesAndWait:error:", v45, &v44);
      v38 = v44;

      v31 = &v46;
      if (v37)
      {
        if ((int)MediaAnalysisLogLevel() < 6)
          goto LABEL_30;
        v32 = OS_LOG_TYPE_INFO;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_30;
        *(_DWORD *)buf = 138412546;
        v58 = v36;
        v59 = 2112;
        v60 = v43;
        v33 = MEMORY[0x1E0C81028];
        v34 = "PersonBuilder: Deduped graph-verified persons '%@' from face group %@";
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
          goto LABEL_30;
        v32 = OS_LOG_TYPE_ERROR;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        *(_DWORD *)buf = 138412546;
        v58 = v36;
        v59 = 2112;
        v60 = v43;
        v33 = MEMORY[0x1E0C81028];
        v34 = "PersonBuilder: Failed to dedupe graph-verified persons '%@' from face group %@";
      }
      goto LABEL_29;
    }

LABEL_32:
    v11 = v40;
  }

}

void __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "verifiedType");
  if (v3 == 2)
  {
    v4 = (id *)(a1 + 40);
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = (id *)(a1 + 32);
LABEL_5:
    objc_msgSend(*v4, "addObject:", v5);
  }

}

uint64_t __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD16D0], "deletePersons:", *(_QWORD *)(a1 + 32));
}

id __82__VCPPhotosPersistenceDelegate_dedupeGraphVerifiedPersonsInFaceGroup_personCache___block_invoke_422(uint64_t a1)
{
  return (id)objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForDedupingGraphPersons:", *(_QWORD *)(a1 + 32));
}

- (void)_getMergeCandidates:(id)a3 invalidMergeCandidates:(id)a4 forPersonsWithLocalIdentifiers:(id)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  id v33;
  void *context;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t i;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v32 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v36 = (void *)objc_msgSend(v9, "newAllPersonsFetchOptionsWithPhotoLibrary:", WeakRetained);

    v11 = (void *)MEMORY[0x1E0CD16C8];
    objc_msgSend(v8, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchPersonsWithLocalIdentifiers:options:", v12, v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i < objc_msgSend(v35, "count", v32); ++i)
    {
      context = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v35, "objectAtIndexedSubscript:", i);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchMergeCandidatePersonsForPerson:options:", v39, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "count"))
      {
        objc_msgSend(v33, "objectForKey:", v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v14 = v38;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v47 != v16)
                objc_enumerationMutation(v14);
              v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              if (objc_msgSend(v18, "verifiedType") != 1 && objc_msgSend(v18, "verifiedType") != 2)
              {
                objc_msgSend(v18, "localIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v8, "containsObject:", v19);

                if (!v20)
                  continue;
              }
              objc_msgSend(v18, "localIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v21);

            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v15);
        }

        if (objc_msgSend(v13, "count"))
          objc_msgSend(v33, "setObject:forKey:", v13, v40);

      }
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchInvalidMergeCandidatePersonsForPerson:options:", v39, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "count"))
      {
        objc_msgSend(v32, "objectForKey:", v40);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v23 = v37;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v43;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v43 != v25)
                objc_enumerationMutation(v23);
              v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
              v28 = (void *)MEMORY[0x1BCCA1B2C]();
              if (objc_msgSend(v27, "verifiedType") == 1
                || objc_msgSend(v27, "verifiedType") == 2
                || (objc_msgSend(v27, "localIdentifier"),
                    v29 = (void *)objc_claimAutoreleasedReturnValue(),
                    v30 = objc_msgSend(v8, "containsObject:", v29),
                    v29,
                    v30))
              {
                objc_msgSend(v27, "localIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "addObject:", v31);

              }
              objc_autoreleasePoolPop(v28);
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v24);
        }

        if (objc_msgSend(v22, "count"))
          objc_msgSend(v32, "setObject:forKey:", v22, v40);

      }
      objc_autoreleasePoolPop(context);
    }

  }
}

- (void)_getTrainingFacesByPerson:(id *)a3 confirmedFaceCSNs:(id *)a4 faceCSNsByPerson:(id *)a5 faceCSNsByMigratedPerson:(id *)a6 faceCSNsByQuickClassificationPerson:(id *)a7 mergeCandidates:(id *)a8 invalidMergeCandidates:(id *)a9 rejectedPersonsByPerson:(id *)a10 faceInFaceGroupByCSN:(id *)a11 inFaces:(id)a12 personCache:(id)a13 cancelOrExtendTimeoutBlock:(id)a14
{
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  _BOOL4 v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id WeakRetained;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t (**v58)(void);
  id v59;
  void *v60;
  unint64_t i;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v59 = a12;
  v14 = a13;
  v58 = (uint64_t (**)(void))a14;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v59, "count"); ++i)
  {
    v15 = (void *)MEMORY[0x1BCCA1B2C]();
    if (v58 && (v58[2]() & 1) != 0)
    {
      v16 = 1;
      goto LABEL_52;
    }
    objc_msgSend(v59, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "clusterSequenceNumber"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v17);
    objc_msgSend(v17, "personLocalIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "localIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v68 = v22;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "personLocalIdentifier for PHFace %@ is null; skip processing",
          buf,
          0xCu);

      }
      v16 = 4;
      goto LABEL_51;
    }
    v18 = objc_msgSend(v17, "nameSource");
    v19 = objc_msgSend(v17, "trainingType");
    v20 = v18 == 5;
    if ((v18 | 4) == 5)
      v21 = objc_msgSend(v17, "isConfirmedFaceCropGenerationPending");
    else
      v21 = 0;
    if ((v18 | 2) == 3)
      v20 = 1;
    if ((v19 & 0xFFFFFFFB) == 1)
      v23 = 1;
    else
      v23 = v21;
    if (v23 == 1)
    {
      objc_msgSend(v54, "objectForKey:", v60);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKey:", v24, v60);
      }
      objc_msgSend(v24, "addObject:", v17);

    }
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "clusterSequenceNumber"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKey:", v60);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKey:", v26, v60);
      }
      objc_msgSend(v26, "addObject:", v25);
LABEL_27:

      if (v19 == 2)
      {
        v27 = (void *)objc_opt_class();
        WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
        v52 = (void *)objc_msgSend(v27, "newVerifiedPersonsFetchOptionsWithPhotoLibrary:", WeakRetained);

        objc_msgSend(MEMORY[0x1E0CD16C8], "fetchRejectedPersonsForFace:options:", v17, v52);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "count"))
        {
          objc_msgSend(v49, "objectForKey:", v60);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v29)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v51, "count"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setObject:forKey:", v29, v60);
          }
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v30 = v51;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          if (v31)
          {
            v32 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v63 != v32)
                  objc_enumerationMutation(v30);
                v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                objc_msgSend(v34, "localIdentifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, v35);

                objc_msgSend(v34, "localIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v36);

              }
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
            }
            while (v31);
          }

        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "localIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v68 = v37;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Found no persons rejected for a rejection training face: %@", buf, 0xCu);

        }
      }
      goto LABEL_50;
    }
    if (v19 > 5 || ((1 << v19) & 0x2A) == 0)
    {
      if (v18 == 6)
      {
        objc_msgSend(v46, "objectForKey:", v60);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKey:", v25, v60);
        }
      }
      else if (v18 == 4)
      {
        objc_msgSend(v45, "objectForKey:", v60);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKey:", v25, v60);
        }
      }
      else
      {
        objc_msgSend(v44, "objectForKey:", v60);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v25, v60);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "clusterSequenceNumber"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v26);
      goto LABEL_27;
    }
LABEL_50:
    objc_msgSend(v55, "addObject:", v60);
    v16 = 0;
LABEL_51:

LABEL_52:
    objc_autoreleasePoolPop(v15);
    if ((v16 | 4) != 4)
      goto LABEL_61;
  }
  -[VCPPhotosPersistenceDelegate _getMergeCandidates:invalidMergeCandidates:forPersonsWithLocalIdentifiers:](self, "_getMergeCandidates:invalidMergeCandidates:forPersonsWithLocalIdentifiers:", v47, v48, v55);
  *a3 = objc_retainAutorelease(v54);
  *a4 = objc_retainAutorelease(v53);
  *a5 = objc_retainAutorelease(v44);
  *a6 = objc_retainAutorelease(v45);
  *a7 = objc_retainAutorelease(v46);
  *a8 = objc_retainAutorelease(v47);
  *a9 = objc_retainAutorelease(v48);
  *a10 = objc_retainAutorelease(v49);
  *a11 = objc_retainAutorelease(v56);
LABEL_61:

}

- (void)_getRejectedTrainingFaceCSNs:(id *)a3 rejectedFaceCSNs:(id *)a4 rejectedPersonLocalIdentifiers:(id *)a5 forPerson:(id)a6 faceInFaceGroupByCSN:(id)a7
{
  void *v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id *v29;
  id *v30;
  void *v31;
  id v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v35 = a6;
  v33 = a7;
  if (objc_msgSend(v33, "count"))
  {
    v11 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v34 = (void *)objc_msgSend(v11, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

    v13 = *MEMORY[0x1E0CD1B80];
    v42[0] = *MEMORY[0x1E0CD1B70];
    v42[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = a5;
    v30 = a3;
    objc_msgSend(v34, "setFetchPropertySets:", v14);

    objc_msgSend(MEMORY[0x1E0CD1520], "fetchRejectedFacesForPerson:options:", v35, v34);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(v33, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v18 = v31;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "clusterSequenceNumber"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "containsObject:", v23))
            {
              if (objc_msgSend(v22, "trainingType") == 2)
                v24 = v16;
              else
                v24 = v17;
              objc_msgSend(v24, "addObject:", v23);
            }
            else if (objc_msgSend(v22, "trainingType") == 2)
            {
              objc_msgSend(v22, "personLocalIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                objc_msgSend(v36, "addObject:", v25);

            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v19);
      }

      v26 = objc_retainAutorelease(v16);
      *v30 = v26;
      v27 = objc_retainAutorelease(v17);
      *a4 = v27;
      v28 = objc_retainAutorelease(v36);
      *v29 = v28;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (BOOL)_completePersonBuildingWithPersonsToUpdate:(id)a3 facesToRemoveByPerson:(id)a4 facesToAddByPerson:(id)a5 updateFaceGroup:(id)a6 newMergeCandidatePairs:(id)a7 newInvalidMergeCandidatePairs:(id)a8 faceInFaceGroupByCSN:(id)a9 personCache:(id)a10 keyFaceUpdateBlock:(id)a11 cancelOrExtendTimeoutBlock:(id)a12 context:(id)a13 error:(id *)a14
{
  VCPPhotosPersistenceDelegate *v20;
  void *v21;
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  id v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void (**v77)(id, id);
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  _QWORD aBlock[4];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  VCPPhotosPersistenceDelegate *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD v102[4];
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  uint64_t v110;
  void *v111;
  uint8_t buf[4];
  id v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v65 = a4;
  v64 = a5;
  v66 = a6;
  v79 = a7;
  v67 = a8;
  v20 = self;
  v68 = a9;
  v81 = a10;
  v77 = (void (**)(id, id))a11;
  v69 = a12;
  v70 = a13;
  v21 = (void *)objc_opt_class();
  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v80 = (void *)objc_msgSend(v21, "newAllPersonsFetchOptionsWithPhotoLibrary:", WeakRetained);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke;
  v108[3] = &unk_1E6B17F88;
  v25 = v24;
  v109 = v25;
  v76 = v25;
  -[VCPPhotosPersistenceDelegate _enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:](self, "_enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:", v78, v80, v81, v108);
  v26 = objc_msgSend(v25, "count");
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v26);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = 0;
  }
  if (objc_msgSend(v79, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v28 = v79;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v105 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          objc_msgSend(v32, "person1LocalIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

          objc_msgSend(v32, "person2LocalIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v34);

        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
      }
      while (v29);
    }

    if (objc_msgSend(v76, "count"))
      objc_msgSend(v27, "minusSet:", v76);
    v35 = (void *)objc_msgSend(v27, "copy");
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_2;
    v102[3] = &unk_1E6B17F88;
    v36 = v27;
    v103 = v36;
    -[VCPPhotosPersistenceDelegate _enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:](v20, "_enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:", v35, v80, v81, v102);

    if (objc_msgSend(v36, "count")
      && (int)MediaAnalysisLogLevel() >= 7
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v113 = v36;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonBuilder: Did not find merge candidate persons with local identifiers: '%@'", buf, 0xCu);
    }
    v37 = (void *)MEMORY[0x1E0CB3880];
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_424;
    v97[3] = &unk_1E6B17FB0;
    v98 = v81;
    v38 = v72;
    v99 = v38;
    v100 = v80;
    v39 = v74;
    v101 = v39;
    objc_msgSend(v37, "predicateWithBlock:", v97);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filterUsingPredicate:", v40);

    v25 = v76;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_426;
  aBlock[3] = &unk_1E6B17FF8;
  v73 = v66;
  v84 = v73;
  v42 = v25;
  v85 = v42;
  v62 = v81;
  v86 = v62;
  v63 = v69;
  v96 = v63;
  v43 = v71;
  v87 = v43;
  v58 = v65;
  v88 = v58;
  v59 = v64;
  v89 = v59;
  v61 = v68;
  v90 = v61;
  v91 = v20;
  v44 = v70;
  v92 = v44;
  v60 = v79;
  v93 = v60;
  v75 = v41;
  v94 = v75;
  v45 = v67;
  v95 = v45;
  v46 = _Block_copy(aBlock);
  v47 = (void *)MEMORY[0x1BCCA1B2C]();
  v48 = objc_loadWeakRetained((id *)p_photoLibrary);
  v82 = 0;
  v49 = objc_msgSend(v48, "performCancellableChangesAndWait:error:", v46, &v82);
  v50 = v82;

  objc_autoreleasePoolPop(v47);
  if ((v49 & 1) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v73, "localIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v113 = v51;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonBuilder: Cleared personBuilderState of faceGroup: '%@'", buf, 0xCu);

    }
    if (v77)
      v77[2](v77, v75);
  }
  else if (a14)
  {
    objc_msgSend(v50, "domain");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0CD1D78]))
    {
      v53 = objc_msgSend(v50, "code") == 3072;

      if (v53)
      {
        v57 = (void *)MEMORY[0x1E0CB35C8];
        v110 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Person building cancelled"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v55);
        *a14 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_31;
      }
    }
    else
    {

    }
    *a14 = objc_retainAutorelease(v50);
  }
LABEL_31:

  return v49;
}

uint64_t __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:");
}

uint64_t __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_424(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "person1LocalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person2LocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ((objc_msgSend(v6, "verifiedType") & 0x8000000000000000) == 0
      && (objc_msgSend(v8, "verifiedType") & 0x8000000000000000) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CD16C8], "fetchInvalidMergeCandidatePersonsForPerson:options:", v6, *(_QWORD *)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchedObjects");
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v12, v4);
        v10 = (void *)v12;
      }
      objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CD16C8], "fetchMergeCandidatePersonsForPerson:options:", v6, *(_QWORD *)(a1 + 48));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fetchedObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v13, v4);
      }
      if (objc_msgSend(v10, "containsObject:", v8))
      {
        if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          goto LABEL_19;
        v18 = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v5;
        v15 = MEMORY[0x1E0C81028];
        v16 = "PersonBuilder: Found invalid merge candidate pair ['%@' : '%@']";
      }
      else
      {
        if (!objc_msgSend(v13, "containsObject:", v8))
        {
          v9 = 1;
          goto LABEL_21;
        }
        if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
LABEL_19:
          v9 = 0;
LABEL_21:

          goto LABEL_22;
        }
        v18 = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v5;
        v15 = MEMORY[0x1E0C81028];
        v16 = "PersonBuilder: Already found merge candidate pair ['%@' : '%@']";
      }
      _os_log_impl(&dword_1B6C4A000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v18, 0x16u);
      goto LABEL_19;
    }
    v9 = 0;
  }
LABEL_22:

  return v9;
}

void __278__VCPPhotosPersistenceDelegate__completePersonBuildingWithPersonsToUpdate_facesToRemoveByPerson_facesToAddByPerson_updateFaceGroup_newMergeCandidatePairs_newInvalidMergeCandidatePairs_faceInFaceGroupByCSN_personCache_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context_error___block_invoke_426(uint64_t a1, _BYTE *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id WeakRetained;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  BOOL v76;
  id v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  NSObject *v97;
  id v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id obj;
  uint64_t v104;
  id v105;
  uint64_t v106;
  void *context;
  uint64_t v108;
  void *v109;
  void *type;
  id typea;
  id v113;
  id v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  void *v144;
  _QWORD v145[2];
  uint8_t v146[128];
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  void *v150;
  void *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;
  _BYTE v155[128];
  uint64_t v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v148 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PersonBuilder: persist results for facegroup %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v159, 16);
  if (v6)
  {
    v104 = *(_QWORD *)v141;
    v102 = *MEMORY[0x1E0CD1B70];
    do
    {
      v7 = 0;
      v106 = v6;
      do
      {
        if (*(_QWORD *)v141 != v104)
          objc_enumerationMutation(obj);
        v108 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v7);
        context = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v8);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        if (v109)
        {
          v9 = *(_QWORD *)(a1 + 128);
          if (v9 && (*(unsigned int (**)(void))(v9 + 16))())
          {
            v10 = 1;
            *a2 = 1;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "becomeCurrentWithPendingUnitCount:", 1);
            objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v8);
            v113 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
              objc_msgSend(v113, "minusSet:", v11);
            type = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v113, "count"));
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
            v138 = 0u;
            v139 = 0u;
            v136 = 0u;
            v137 = 0u;
            v13 = (void *)objc_msgSend(v11, "copy");
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v136, v158, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v137;
LABEL_18:
              v16 = 0;
              while (1)
              {
                if (*(_QWORD *)v137 != v15)
                  objc_enumerationMutation(v13);
                v17 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v16);
                v18 = *(_QWORD *)(a1 + 128);
                if (v18)
                {
                  if (((*(uint64_t (**)(void))(v18 + 16))() & 1) != 0)
                    break;
                }
                objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  objc_msgSend(v12, "addObject:", v19);
                  objc_msgSend(v11, "removeObject:", v17);
                }

                if (v14 == ++v16)
                {
                  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v136, v158, 16);
                  if (v14)
                    goto LABEL_18;
                  break;
                }
              }
            }

            v20 = *(_QWORD *)(a1 + 128);
            if (v20 && (*(unsigned int (**)(void))(v20 + 16))())
              goto LABEL_42;
            v134 = 0u;
            v135 = 0u;
            v132 = 0u;
            v133 = 0u;
            v21 = (void *)objc_msgSend(v113, "copy");
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v132, v157, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v133;
LABEL_31:
              v24 = 0;
              while (1)
              {
                if (*(_QWORD *)v133 != v23)
                  objc_enumerationMutation(v21);
                v25 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * v24);
                v26 = *(_QWORD *)(a1 + 128);
                if (v26)
                {
                  if (((*(uint64_t (**)(void))(v26 + 16))() & 1) != 0)
                    break;
                }
                objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  objc_msgSend(type, "addObject:", v27);
                  objc_msgSend(v113, "removeObject:", v25);
                }

                if (v22 == ++v24)
                {
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v132, v157, 16);
                  if (v22)
                    goto LABEL_31;
                  break;
                }
              }
            }

            v28 = *(_QWORD *)(a1 + 128);
            if (v28 && (*(unsigned int (**)(void))(v28 + 16))())
            {
LABEL_42:
              v10 = 1;
              *a2 = 1;
            }
            else
            {
              if (objc_msgSend(v113, "count"))
              {
                v29 = (void *)objc_opt_class();
                WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 88) + 8));
                v31 = (void *)objc_msgSend(v29, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(clusterSequenceNumber IN %@)"), v113);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setPredicate:", v32);

                v156 = v102;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v156, 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setFetchPropertySets:", v33);

                objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v31);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "fetchedObjects");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(type, "addObjectsFromArray:", v35);

              }
              v130 = 0u;
              v131 = 0u;
              v128 = 0u;
              v129 = 0u;
              v36 = type;
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v128, v155, 16);
              if (v37)
              {
                v38 = *(_QWORD *)v129;
                while (2)
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v129 != v38)
                      objc_enumerationMutation(v36);
                    v40 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * i);
                    v41 = (void *)MEMORY[0x1BCCA1B2C]();
                    v42 = *(_QWORD *)(a1 + 128);
                    if (v42 && (*(unsigned int (**)(void))(v42 + 16))())
                    {
                      v43 = 0;
                      *a2 = 1;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v40);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "setNameSource:", 0);

                      v43 = 1;
                    }
                    objc_autoreleasePoolPop(v41);
                    if (!v43)
                    {

LABEL_81:
                      v10 = 1;
                      goto LABEL_82;
                    }
                  }
                  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v128, v155, 16);
                  if (v37)
                    continue;
                  break;
                }
              }

              if (objc_msgSend(v11, "count"))
              {
                v45 = (void *)objc_opt_class();
                v46 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 88) + 8));
                v47 = (void *)objc_msgSend(v45, "newAllFacesFetchOptionsWithPhotoLibrary:", v46);

                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(clusterSequenceNumber IN %@)"), v11);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setPredicate:", v48);

                v154 = v102;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setFetchPropertySets:", v49);

                objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v47);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "fetchedObjects");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObjectsFromArray:", v51);

              }
              v126 = 0u;
              v127 = 0u;
              v124 = 0u;
              v125 = 0u;
              v105 = v12;
              v52 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v124, v153, 16);
              if (v52)
              {
                v53 = *(_QWORD *)v125;
                while (2)
                {
                  for (j = 0; j != v52; ++j)
                  {
                    if (*(_QWORD *)v125 != v53)
                      objc_enumerationMutation(v105);
                    v55 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * j);
                    v56 = (void *)MEMORY[0x1BCCA1B2C]();
                    v57 = *(_QWORD *)(a1 + 128);
                    if (v57 && (*(unsigned int (**)(void))(v57 + 16))())
                    {
                      v58 = 0;
                      *a2 = 1;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v55);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v59, "setNameSource:", 2);

                      v58 = 1;
                    }
                    objc_autoreleasePoolPop(v56);
                    if (!v58)
                    {

                      goto LABEL_81;
                    }
                  }
                  v52 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v124, v153, 16);
                  if (v52)
                    continue;
                  break;
                }
              }

              v60 = objc_msgSend(v36, "count");
              v61 = objc_msgSend(v105, "count");
              if (v60 | v61)
              {
                objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v109);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "setObject:forKey:", v62, v8);
                if (v60)
                  objc_msgSend(v62, "removeFaces:", v36);
                if (v61)
                  objc_msgSend(v62, "addFaces:", v105);

              }
              v10 = 0;
            }
LABEL_82:

            objc_msgSend(*(id *)(a1 + 56), "resignCurrent");
          }
        }
        else
        {
          v10 = 5;
        }

        objc_autoreleasePoolPop(context);
        if (v10 != 5 && v10)
        {

          goto LABEL_94;
        }
        v7 = v108 + 1;
      }
      while (v108 + 1 != v106);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v159, 16);
    }
    while (v6);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 88) + 16)
    || (objc_msgSend(*(id *)(a1 + 96), "personBuilderMergeCandidatesDisabled") & 1) != 0)
  {
    goto LABEL_89;
  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v114 = *(id *)(a1 + 104);
  v65 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v120, v152, 16);
  if (v65)
  {
    v66 = *(_QWORD *)v121;
    do
    {
      for (k = 0; k != v65; ++k)
      {
        if (*(_QWORD *)v121 != v66)
          objc_enumerationMutation(v114);
        v68 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
        v69 = *(_QWORD *)(a1 + 128);
        if (v69 && (*(unsigned int (**)(void))(v69 + 16))())
        {
          *a2 = 1;

          goto LABEL_94;
        }
        objc_msgSend(v68, "person1LocalIdentifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "person2LocalIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "objectForKey:", v70);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v71);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v101, "objectForKey:", v71);
          v74 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v70);
          if (v74)
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = (void *)v74;
          }
          else
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v75);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v71);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        if (v72)
          v76 = v73 == 0;
        else
          v76 = 1;
        if (v76)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_116;
          v80 = MEMORY[0x1E0C81028];
          v77 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v148 = v70;
            v149 = 2112;
            v150 = v71;
            _os_log_impl(&dword_1B6C4A000, v80, OS_LOG_TYPE_ERROR, "PersonBuilder: Could not create merge candidate pair '%@' : '%@'", buf, 0x16u);
          }
        }
        else
        {
          v151 = v73;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addMergeCandidatePersons:", v78);

          v79 = *(void **)(a1 + 112);
          objc_msgSend(v73, "localIdentifier");
          v80 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "addObject:", v80);
        }

LABEL_116:
      }
      v65 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v120, v152, 16);
    }
    while (v65);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  typea = *(id *)(a1 + 120);
  v81 = objc_msgSend(typea, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
  if (!v81)
    goto LABEL_141;
  v115 = *(id *)v117;
  do
  {
    v82 = 0;
    do
    {
      if (*(id *)v117 != v115)
        objc_enumerationMutation(typea);
      v83 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v82);
      v84 = *(_QWORD *)(a1 + 128);
      if (v84 && (*(unsigned int (**)(void))(v84 + 16))())
      {
        *a2 = 1;

        goto LABEL_94;
      }
      objc_msgSend(v83, "person1LocalIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "person2LocalIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "objectForKey:", v85);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_opt_class();
      v89 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 88) + 8));
      v90 = (void *)objc_msgSend(v88, "newAllPersonsFetchOptionsWithPhotoLibrary:", v89);

      v91 = *(void **)(a1 + 88);
      v145[0] = v85;
      v145[1] = v86;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 2);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "_enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:", v92, v90, *(_QWORD *)(a1 + 48), &__block_literal_global_430);

      if (v87)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v86);
        v93 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v101, "objectForKey:", v86);
        v94 = objc_claimAutoreleasedReturnValue();
        v95 = *(void **)(a1 + 48);
        if (!v94)
        {
          objc_msgSend(v95, "objectForKey:", v85);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v99);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v86);
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_130;
        }
        objc_msgSend(v95, "objectForKey:", v85);
        v93 = objc_claimAutoreleasedReturnValue();
        v87 = (void *)v94;
      }
      v96 = (void *)v93;
LABEL_130:
      if (v87 && v96)
      {
        v144 = v96;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
        v97 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "addInvalidMergeCandidatePersons:", v97);
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
          goto LABEL_137;
        v97 = MEMORY[0x1E0C81028];
        v98 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v148 = v85;
          v149 = 2112;
          v150 = v86;
          _os_log_impl(&dword_1B6C4A000, v97, OS_LOG_TYPE_ERROR, "PersonBuilder: Could not create invalid merge candidate pair '%@' : '%@'", buf, 0x16u);
        }
      }

LABEL_137:
      ++v82;
    }
    while (v81 != v82);
    v100 = objc_msgSend(typea, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
    v81 = v100;
  }
  while (v100);
LABEL_141:

LABEL_89:
  v63 = *(_QWORD *)(a1 + 128);
  if (v63 && (*(unsigned int (**)(void))(v63 + 16))())
  {
    *a2 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", *(_QWORD *)(a1 + 32));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setPersonBuilderState:", 0);

  }
LABEL_94:

}

- (unint64_t)_level0ClusterIdForFaceCSN:(unint64_t)a3 level0Clusters:(id)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__VCPPhotosPersistenceDelegate__level0ClusterIdForFaceCSN_level0Clusters___block_invoke;
  v10[3] = &unk_1E6B18020;
  v11 = v6;
  v12 = &v13;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __74__VCPPhotosPersistenceDelegate__level0ClusterIdForFaceCSN_level0Clusters___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "unsignedIntegerValue");
    *a4 = 1;
  }

}

- (id)otherFacesOnAssetWithFace:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesOnAssetWithFace:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_duplicateFaceCSNsOnAssetForPerson:(id)a3 faceCSNsOnPerson:(id)a4 faceByCSNCache:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *context;
  id v32;
  void *v33;
  VCPPhotosPersistenceDelegate *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v8 = a4;
  v35 = a5;
  v33 = v8;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v33, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1BCCA1B2C]();
    v14 = (void *)objc_opt_class();
    context = (void *)v13;
    v34 = self;
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v36 = (void *)objc_msgSend(v14, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

    while (1)
    {
      if (!objc_msgSend(v12, "count"))
      {

        objc_autoreleasePoolPop(context);
        goto LABEL_23;
      }
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectAtIndex:", 0);
      objc_msgSend(v35, "objectForKey:", v38);
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37)
        goto LABEL_5;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clusterSequenceNumber = %ld"), objc_msgSend(v38, "longValue"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPredicate:", v26);

      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "count");
      v28 = MEMORY[0x1E0C81028];
      if (v27)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
          break;
      }
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v38;
        _os_log_impl(&dword_1B6C4A000, v28, OS_LOG_TYPE_DEBUG, "Could not find a face with clusterSequenceNumber '%@' in the library", buf, 0xCu);
      }
LABEL_15:

    }
    objc_msgSend(v35, "setObject:forKey:", v29, v38);
    v37 = v29;

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clusterSequenceNumber != %ld"), objc_msgSend(v38, "longValue"), context);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPredicate:", v16);

    -[VCPPhotosPersistenceDelegate otherFacesOnAssetWithFace:options:](v34, "otherFacesOnAssetWithFace:options:", v37, v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1BCCA1B2C]();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "clusterSequenceNumber"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "containsObject:", v24))
          {
            objc_msgSend(v9, "addObject:", v24);
            objc_msgSend(v9, "addObject:", v38);
            objc_msgSend(v12, "removeObject:", v24);
          }

          objc_autoreleasePoolPop(v23);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v19);
    }

    v25 = (void *)v37;
    goto LABEL_15;
  }
LABEL_23:

  return v9;
}

- (void)_updateFaceCSNsToAddByPerson:(id)a3 faceCSNsToRemoveByPerson:(id)a4 faceInFaceGroupByCSN:(id)a5 faceCSNsByPersonLocalIdentifier:(id)a6 faceCSNsByMigratedPersonLocalIdentifier:(id)a7 personsToUpdate:(id)a8
{
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = a4;
  v29 = a5;
  v31 = a6;
  v30 = a7;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v32, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKey:", v17, v15);
        }
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "unionSet:", v16);
        objc_msgSend(v20, "unionSet:", v18);
        objc_msgSend(v20, "unionSet:", v19);
        -[VCPPhotosPersistenceDelegate _duplicateFaceCSNsOnAssetForPerson:faceCSNsOnPerson:faceByCSNCache:](self, "_duplicateFaceCSNsOnAssetForPerson:faceCSNsOnPerson:faceByCSNCache:", v15, v20, v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v21, "mutableCopy");
        objc_msgSend(v22, "intersectSet:", v16);
        if (objc_msgSend(v22, "count"))
        {
          objc_msgSend(v16, "minusSet:", v22);
          objc_msgSend(v21, "minusSet:", v22);
        }
        v23 = (void *)objc_msgSend(v21, "mutableCopy");

        v24 = v23;
        objc_msgSend(v23, "intersectSet:", v18);
        if (objc_msgSend(v23, "count"))
        {
          objc_msgSend(v17, "unionSet:", v23);
          objc_msgSend(v21, "minusSet:", v23);
        }
        v25 = (void *)objc_msgSend(v21, "mutableCopy");

        objc_msgSend(v25, "intersectSet:", v19);
        if (objc_msgSend(v25, "count"))
          objc_msgSend(v17, "unionSet:", v25);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }

}

- (void)_adjustConfirmingAndRejectionWithFaces:(id)a3 faceCrops:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(_QWORD);
  void *v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id WeakRetained;
  char v21;
  id v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  __int128 v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  char v46;
  id v47;
  __int128 v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  void *v59;
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD aBlock[5];
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  VCPPhotosPersistenceDelegate *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(_QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v7, "count"); ++i)
  {
    v12 = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v13, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v16);

    }
    objc_autoreleasePoolPop(v12);
  }
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke;
  v70[3] = &unk_1E6B18070;
  v49 = v10;
  v71 = v49;
  v72 = self;
  v57 = v50;
  v73 = v57;
  v17 = v51;
  v74 = v17;
  v56 = v52;
  v75 = v56;
  v54 = v53;
  v76 = v54;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v70);
  v55 = v17;
  if (objc_msgSend(v17, "count") || objc_msgSend(v56, "count") || objc_msgSend(v54, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 134217984;
      v78 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCropAdjustment] Correcting %lu training face -> person", buf, 0xCu);
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_442;
    aBlock[3] = &unk_1E6B180E8;
    aBlock[4] = self;
    v67 = v17;
    v68 = v56;
    v69 = v54;
    v19 = _Block_copy(aBlock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v65 = 0;
    v21 = objc_msgSend(WeakRetained, "performChangesAndWait:error:", v19, &v65);
    v22 = v65;

    if ((v21 & 1) == 0
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (uint64_t)v22;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropAdjustment] Failed to update person - %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v57, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_msgSend(v57, "count");
      *(_DWORD *)buf = 134217984;
      v78 = v23;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Checking %lu rejected person(s)", buf, 0xCu);
    }
    objc_msgSend(v57, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsGroupedByFaceUUIDForFaces:", v7);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    *(_QWORD *)&v26 = 138412546;
    v48 = v26;
    do
    {
      if (v25 >= objc_msgSend(v7, "count", v48))
        break;
      v27 = (void *)MEMORY[0x1BCCA1B2C]();
      if (v9 && (v9[2](v9) & 1) != 0)
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "personLocalIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v24, "containsObject:", v30);

        if (v31)
        {
          objc_msgSend(v29, "localIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33 == 0;

          if (!v34)
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v29, "localIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "personLocalIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v48;
              v78 = (uint64_t)v35;
              v79 = 2112;
              v80 = v36;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RejectedFaceCrop] To remove face %@ for person %@", buf, 0x16u);

            }
            objc_msgSend(v29, "personLocalIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectForKeyedSubscript:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38 == 0;

            if (v39)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "personLocalIdentifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setObject:forKeyedSubscript:", v40, v41);

            }
            objc_msgSend(v29, "personLocalIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addObject:", v29);

          }
        }

        v28 = 1;
      }
      objc_autoreleasePoolPop(v27);
      ++v25;
    }
    while ((v28 & 1) != 0);
    if (objc_msgSend(v60, "count"))
    {
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_445;
      v62[3] = &unk_1E6B16D58;
      v63 = v60;
      v64 = v57;
      v44 = _Block_copy(v62);
      v45 = objc_loadWeakRetained((id *)&self->_photoLibrary);
      v61 = 0;
      v46 = objc_msgSend(v45, "performChangesAndWait:error:", v44, &v61);
      v47 = v61;

      if ((v46 & 1) == 0
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v78 = (uint64_t)v47;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropAdjustment] Failed to update person - %@", buf, 0xCu);
      }

    }
  }

}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[FaceCropAdjustment][%@-%d]"), v8, (int)objc_msgSend(v6, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v9;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Checking face %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (objc_msgSend(v6, "type") == 2 || objc_msgSend(v6, "type") == 4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      v12 = +[VCPPhotosPersistenceDelegate newVerifiedPersonsFetchOptionsWithPhotoLibrary:](VCPPhotosPersistenceDelegate, "newVerifiedPersonsFetchOptionsWithPhotoLibrary:", WeakRetained);

      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchRejectedPersonsForFace:options:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_440;
      v26[3] = &unk_1E6B18048;
      v27 = *(id *)(a1 + 48);
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);

      goto LABEL_34;
    }
    if (objc_msgSend(v6, "type") == 1
      || objc_msgSend(v6, "type") == 3
      || objc_msgSend(v6, "type") == 5)
    {
      v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      v25 = +[VCPPhotosPersistenceDelegate newAllPersonsFetchOptionsWithPhotoLibrary:](VCPPhotosPersistenceDelegate, "newAllPersonsFetchOptionsWithPhotoLibrary:", v14);

      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonForFaceCrop:options:", v6, v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "count"))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v9;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ No valid person", buf, 0xCu);
        }
        goto LABEL_33;
      }
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v9;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Found person(s) %@", buf, 0x16u);
      }
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "personLocalIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if ((v19 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "localIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "personLocalIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v16, "verifiedType");
          *(_DWORD *)buf = 138413314;
          v29 = v9;
          v30 = 2112;
          v31 = v24;
          v32 = 2112;
          v33 = v20;
          v34 = 2112;
          v35 = v21;
          v36 = 2048;
          v37 = v22;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Person mismatch: face (%@) personLocalIdentifier %@ vs faceCropPerson %@ (%ld)", buf, 0x34u);

        }
        if (objc_msgSend(v6, "type") == 1)
        {
          v23 = (id *)(a1 + 56);
LABEL_31:
          objc_msgSend(*v23, "setObject:forKeyedSubscript:", v16, v10);
          goto LABEL_32;
        }
        if (objc_msgSend(v6, "type") == 3)
        {
          v23 = (id *)(a1 + 64);
          goto LABEL_31;
        }
        if (objc_msgSend(v6, "type") == 5)
        {
          v23 = (id *)(a1 + 72);
          goto LABEL_31;
        }
      }
LABEL_32:

LABEL_33:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to find face", buf, 0xCu);
  }
LABEL_34:

}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_440(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_442(_QWORD *a1)
{
  id WeakRetained;
  id v3;
  id v4;
  void (**v5)(void *, _QWORD, uint64_t);
  _QWORD aBlock[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  v3 = +[VCPPhotosPersistenceDelegate newAllPersonsFetchOptionsWithPhotoLibrary:](VCPPhotosPersistenceDelegate, "newAllPersonsFetchOptionsWithPhotoLibrary:", WeakRetained);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2;
  aBlock[3] = &unk_1E6B180C0;
  v4 = v3;
  v7 = v4;
  v5 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v5[2](v5, a1[5], 1);
  v5[2](v5, a1[6], 3);
  v5[2](v5, a1[7], 5);

}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_3;
  v5[3] = &unk_1E6B18098;
  v6 = *(id *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonWithFace:options:", v5, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v20 = v9;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v6;
      v25 = 2048;
      v26 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Correcting face %@ from %@ to %@, with nameSource:%ld", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFaces:", v12);

    objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addFaces:", v14);

    objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNameSource:", *(_QWORD *)(a1 + 40));

  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "localIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceCropAdjustment] Failed to find person for face %@", buf, 0xCu);

  }
}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_445(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2_446;
  v2[3] = &unk_1E6B18130;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v2);

}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_2_446(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v10 = 134218242;
    v11 = objc_msgSend(v6, "count");
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCropAdjustment] Removing %lu faces for person %@", (uint8_t *)&v10, 0x16u);
  }
  v7 = (void *)MEMORY[0x1E0CD16D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeRequestForPerson:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeFaces:", v6);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_448);

}

void __108__VCPPhotosPersistenceDelegate__adjustConfirmingAndRejectionWithFaces_faceCrops_cancelOrExtendTimeoutBlock___block_invoke_447(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "personLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Remove face %@ for person %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNameSource:", 0);

}

- (void)_detectDuplicationInExistingFaceCrops:(id)a3 withFetchedFaces:(id)a4 faceCropFaceIdentifiersToEvaluate:(id)a5 duplicationResults:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t j;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  float v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  int v50;
  void *v51;
  int v52;
  float v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  unint64_t k;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  int v70;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  uint64_t (**v83)(void);
  void *v84;
  uint64_t i;
  void *v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  id v90;
  float v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  uint8_t buf[4];
  double v97;
  __int16 v98;
  _BYTE v99[30];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v73 = a4;
  v79 = a5;
  v83 = (uint64_t (**)(void))a7;
  v72 = v10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke;
  v94[3] = &unk_1E6B18158;
  v82 = v11;
  v95 = v82;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v94);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_450;
  v92[3] = &unk_1E6B169B0;
  v80 = v12;
  v93 = v80;
  objc_msgSend(v73, "enumerateObjectsUsingBlock:", v92);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  for (i = 1; v13 < objc_msgSend(v87, "count"); ++i)
  {
    v14 = (void *)MEMORY[0x1BCCA1B2C]();
    if (v83 && (v83[2]() & 1) != 0)
    {
      v15 = 2;
    }
    else
    {
      objc_msgSend(v87, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v79, "containsObject:", v18);

      if ((v19 & 1) == 0)
        goto LABEL_8;
      objc_msgSend(v16, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v86, "containsObject:", v20);

      if ((v21 & 1) == 0)
      {
        objc_msgSend(v16, "localIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectForKeyedSubscript:", v23);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
        {
          objc_msgSend(v81, "faceClusteringProperties");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "faceprint");
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (v76)
          {
            v25 = objc_msgSend(v76, "faceprintVersion");
            objc_msgSend(v76, "faceprintData");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 0, v25, v26);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            v74 = 0;
            for (j = i; j < objc_msgSend(v87, "count"); ++j)
            {
              v28 = (void *)MEMORY[0x1BCCA1B2C]();
              objc_msgSend(v87, "objectAtIndexedSubscript:", j);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "localIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v86, "containsObject:", v30);

              if ((v31 & 1) == 0)
              {
                v32 = objc_msgSend(v29, "type");
                if (v32 == objc_msgSend(v16, "type"))
                {
                  objc_msgSend(v29, "localIdentifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "objectForKeyedSubscript:", v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "objectForKeyedSubscript:", v34);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v35)
                  {
                    v36 = objc_msgSend(v35, "trainingType");
                    if (v36 == objc_msgSend(v81, "trainingType"))
                    {
                      objc_msgSend(v35, "faceClusteringProperties");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "faceprint");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v78)
                      {
                        v38 = objc_msgSend(v78, "faceprintVersion");
                        objc_msgSend(v78, "faceprintData");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 0, v38, v39);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();

                        v91 = 0.0;
                        v90 = 0;
                        v41 = objc_msgSend(v75, "calculateDistance:toWrapper:andError:", &v91, v40, &v90);
                        v77 = v90;
                        if (v41 && v91 < 0.02)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 6
                            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                          {
                            v42 = v91;
                            objc_msgSend(v16, "localIdentifier");
                            v43 = (void *)objc_claimAutoreleasedReturnValue();
                            v70 = objc_msgSend(v16, "type");
                            objc_msgSend(v29, "localIdentifier");
                            v44 = (void *)objc_claimAutoreleasedReturnValue();
                            v45 = objc_msgSend(v29, "type");
                            *(_DWORD *)buf = 134219010;
                            v97 = v42;
                            v98 = 2112;
                            *(_QWORD *)v99 = v43;
                            *(_WORD *)&v99[8] = 1024;
                            *(_DWORD *)&v99[10] = v70;
                            *(_WORD *)&v99[14] = 2112;
                            *(_QWORD *)&v99[16] = v44;
                            *(_WORD *)&v99[24] = 1024;
                            *(_DWORD *)&v99[26] = v45;
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PHFaceCrop Dedupe] Duplicated with distance: %f [%@:%d] vs [%@:%d]", buf, 0x2Cu);

                          }
                          if (!v74)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "set");
                            v74 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v74, "addObject:", v16);
                          }
                          objc_msgSend(v74, "addObject:", v29);
                          objc_msgSend(v16, "localIdentifier");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v86, "addObject:", v46);

                          objc_msgSend(v29, "localIdentifier");
                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v86, "addObject:", v47);

                        }
                        else if ((int)MediaAnalysisLogLevel() >= 7
                               && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                        {
                          v53 = v91;
                          objc_msgSend(v16, "localIdentifier");
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v29, "localIdentifier");
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 134218754;
                          v97 = v53;
                          v98 = 2112;
                          *(_QWORD *)v99 = v54;
                          *(_WORD *)&v99[8] = 2112;
                          *(_QWORD *)&v99[10] = v55;
                          *(_WORD *)&v99[18] = 2112;
                          *(_QWORD *)&v99[20] = v77;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Distance: %f [%@] vs [%@] - %@", buf, 0x2Au);

                        }
                      }
                      else if ((int)MediaAnalysisLogLevel() >= 7
                             && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend(v35, "localIdentifier");
                        v56 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                        *(_DWORD *)buf = 138412290;
                        v97 = v56;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] PHFaceY[%@] without faceprint", buf, 0xCu);

                      }
                    }
                    else if ((int)MediaAnalysisLogLevel() >= 7
                           && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v81, "localIdentifier");
                      v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                      v50 = objc_msgSend(v81, "trainingType");
                      objc_msgSend(v35, "localIdentifier");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      v52 = objc_msgSend(v35, "trainingType");
                      *(_DWORD *)buf = 138413058;
                      v97 = v49;
                      v98 = 1024;
                      *(_DWORD *)v99 = v50;
                      *(_WORD *)&v99[4] = 2112;
                      *(_QWORD *)&v99[6] = v51;
                      *(_WORD *)&v99[14] = 1024;
                      *(_DWORD *)&v99[16] = v52;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Unmatched training type PHFaceX[%@](%d) and PHFaceY[%@](%d)", buf, 0x22u);

                    }
                  }
                  else if ((int)MediaAnalysisLogLevel() >= 4
                         && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(0, "localIdentifier");
                    v48 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    *(_DWORD *)buf = 138412290;
                    v97 = v48;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PHFaceCrop Dedupe] Missing PHFaceY[%@]", buf, 0xCu);

                  }
                }
              }

              objc_autoreleasePoolPop(v28);
            }
            if (v74)
              objc_msgSend(v84, "addObject:", v74);

            v15 = 0;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v81, "localIdentifier");
              v58 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 138412290;
              v97 = v58;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] PHFaceX[%@] without faceprint", buf, 0xCu);

            }
            v15 = 4;
          }

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(0, "localIdentifier");
            v57 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138412290;
            v97 = v57;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PHFaceCrop Dedupe] Missing PHFaceX[%@]", buf, 0xCu);

          }
          v15 = 4;
        }

      }
      else
      {
LABEL_8:
        v15 = 4;
      }

    }
    objc_autoreleasePoolPop(v14);
    if ((v15 | 4) != 4)
      break;
    ++v13;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v84, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Processing duplications", buf, 2u);
    }
    for (k = 0; k < objc_msgSend(v84, "count"); ++k)
    {
      v61 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v84, "objectAtIndexedSubscript:", k);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v63 = COERCE_DOUBLE(objc_msgSend(v62, "count"));
        *(_DWORD *)buf = 134218242;
        v97 = v63;
        v98 = 2112;
        *(_QWORD *)v99 = v62;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] %lu duplications - %@", buf, 0x16u);
      }
      objc_msgSend(v62, "allObjects");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "sortedArrayUsingComparator:", &__block_literal_global_453);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, objc_msgSend(v65, "count") - 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectsAtIndexes:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObjectsFromArray:", v67);
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_2;
      v88[3] = &unk_1E6B181C0;
      v68 = v65;
      v89 = v68;
      objc_msgSend(v67, "enumerateObjectsUsingBlock:", v88);

      objc_autoreleasePoolPop(v61);
    }
  }
  v69 = objc_retainAutorelease(v59);
  *a6 = v69;

}

void __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v9);

  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PHFaceCrop Dedupe] PHFaceCrop without localIdentifier - %@", (uint8_t *)&v10, 0xCu);
  }

}

void __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_450(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v6);

  }
  else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] PHFace without localIdentifier - %@", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_451(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void __167__VCPPhotosPersistenceDelegate__detectDuplicationInExistingFaceCrops_withFetchedFaces_faceCropFaceIdentifiersToEvaluate_duplicationResults_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Removing %@ dupe to %@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_processNewlyClusteredFaceCropsInFaceGroups:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t i;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  int v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  const char *v44;
  uint32_t v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  const char *v54;
  uint32_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  os_signpost_id_t spid;
  unint64_t v60;
  uint64_t v61;
  VCPPhotosPersistenceDelegate *v62;
  void *v63;
  id v64;
  id *location;
  void *v66;
  id v67;
  void *v68;
  uint64_t (**v69)(void);
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  id v82;
  _QWORD v83[7];

  v83[4] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v69 = (uint64_t (**)(void))a4;
  v61 = mach_absolute_time();
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v62 = self;
  spid = v7;
  v60 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MADProcessNewlyClusteredFaceCrops", ", buf, 2u);
  }

  v10 = (void *)objc_opt_class();
  location = (id *)&self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v63 = (void *)objc_msgSend(v10, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  v12 = *MEMORY[0x1E0CD1B68];
  v83[0] = *MEMORY[0x1E0CD1B70];
  v83[1] = v12;
  v13 = *MEMORY[0x1E0CD1B80];
  v83[2] = *MEMORY[0x1E0CD1B58];
  v83[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFetchPropertySets:", v14);

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v67, "count");
    *(_DWORD *)buf = 134217984;
    v80 = v15;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceCrop] Processing newly clustered face crops in %lu PHFaceGroup; start processing ...",
      buf,
      0xCu);
  }
  for (i = 0; i < objc_msgSend(v67, "count", spid); ++i)
  {
    v17 = (void *)MEMORY[0x1BCCA1B2C]();
    if (!v69 || (v69[2]() & 1) == 0)
    {
      objc_msgSend(v67, "objectAtIndexedSubscript:", i);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_loadWeakRetained(location);
      objc_msgSend(v20, "librarySpecificFetchOptions");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1540], "fetchFaceCropByFaceLocalIdentifierForFaces:fetchOptions:", v19, v68);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke;
        v77[3] = &unk_1E6B18158;
        v23 = v22;
        v78 = v23;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v77);
        if (objc_msgSend(v23, "count"))
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            v24 = objc_msgSend(v21, "count");
            objc_msgSend(v66, "localIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v80 = v24;
            v81 = 2112;
            v82 = v25;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Fetched %lu PHFaceCrops in PHFaceGroup (%@); start processing ...",
              buf,
              0x16u);

          }
          -[VCPPhotosPersistenceDelegate _adjustConfirmingAndRejectionWithFaces:faceCrops:cancelOrExtendTimeoutBlock:](v62, "_adjustConfirmingAndRejectionWithFaces:faceCrops:cancelOrExtendTimeoutBlock:", v19, v23, v69);
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCropAdjustment] Processing finished", buf, 2u);
          }
          if ((unint64_t)objc_msgSend(v21, "count") > 1)
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              v32 = objc_msgSend(v21, "count");
              objc_msgSend(v66, "localIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v80 = v32;
              v81 = 2112;
              v82 = v33;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Fetched %lu PHFaceCrops in PHFaceGroup (%@); start dedupping ...",
                buf,
                0x16u);

            }
            v34 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v23, "allKeys");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setWithArray:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v76 = 0;
            -[VCPPhotosPersistenceDelegate _detectDuplicationInExistingFaceCrops:withFetchedFaces:faceCropFaceIdentifiersToEvaluate:duplicationResults:cancelOrExtendTimeoutBlock:](v62, "_detectDuplicationInExistingFaceCrops:withFetchedFaces:faceCropFaceIdentifiersToEvaluate:duplicationResults:cancelOrExtendTimeoutBlock:", v21, v19, v36, &v76, v69);
            v64 = v76;

          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              v26 = objc_msgSend(v21, "count");
              objc_msgSend(v66, "localIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v80 = v26;
              v81 = 2112;
              v82 = v27;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PHFaceCrop Dedupe] Fetched %lu PHFaceCrop in PHFaceGroup (%@); skip",
                buf,
                0x16u);

            }
            v64 = 0;
          }
          v37 = objc_loadWeakRetained(location);
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_456;
          v74[3] = &unk_1E6B15468;
          v38 = v23;
          v75 = v38;
          v73 = 0;
          v39 = objc_msgSend(v37, "performChangesAndWait:error:", v74, &v73);
          v40 = v73;

          if (v39)
          {
            if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v41 = objc_msgSend(v38, "count");
              *(_DWORD *)buf = 134217984;
              v80 = v41;
              v42 = MEMORY[0x1E0C81028];
              v43 = OS_LOG_TYPE_INFO;
              v44 = "[FaceCrop] Updated %lu PHFaceCrops";
              v45 = 12;
              goto LABEL_44;
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v46 = objc_msgSend(v38, "count");
            *(_DWORD *)buf = 134218242;
            v80 = v46;
            v81 = 2112;
            v82 = v40;
            v42 = MEMORY[0x1E0C81028];
            v43 = OS_LOG_TYPE_ERROR;
            v44 = "[FaceCrop] Failed to update %lu PHFaceCrops - %@";
            v45 = 22;
LABEL_44:
            _os_log_impl(&dword_1B6C4A000, v42, v43, v44, buf, v45);
          }
          if (objc_msgSend(v64, "count"))
          {
            v47 = objc_loadWeakRetained(location);
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_459;
            v71[3] = &unk_1E6B15468;
            v48 = v64;
            v72 = v48;
            v70 = v40;
            v49 = objc_msgSend(v47, "performChangesAndWait:error:", v71, &v70);
            v50 = v70;

            if (v49)
            {
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v51 = objc_msgSend(v48, "count");
                *(_DWORD *)buf = 134217984;
                v80 = v51;
                v52 = MEMORY[0x1E0C81028];
                v53 = OS_LOG_TYPE_INFO;
                v54 = "[FaceCrop] Removed %lu duplicated PHFaceCrops";
                v55 = 12;
                goto LABEL_54;
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v56 = objc_msgSend(v48, "count");
              *(_DWORD *)buf = 134218242;
              v80 = v56;
              v81 = 2112;
              v82 = v50;
              v52 = MEMORY[0x1E0C81028];
              v53 = OS_LOG_TYPE_ERROR;
              v54 = "[FaceCrop] Failed to remove %lu duplicated PHFaceCrops - %@";
              v55 = 22;
LABEL_54:
              _os_log_impl(&dword_1B6C4A000, v52, v53, v54, buf, v55);
            }

          }
          else
          {
            v50 = v40;
          }

          v18 = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            v30 = objc_msgSend(v23, "count");
            objc_msgSend(v66, "localIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v80 = v30;
            v81 = 2112;
            v82 = v31;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCrop] Fetched %lu newly clustered PHFaceCrop in PHFaceGroup (%@); skip",
              buf,
              0x16u);

          }
          v18 = 6;
        }

      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v28 = objc_msgSend(v21, "count");
          objc_msgSend(v66, "localIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v80 = v28;
          v81 = 2112;
          v82 = v29;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceCrop] Fetched %lu PHFaceCrop in PHFaceGroup (%@); skip",
            buf,
            0x16u);

        }
        v18 = 6;
      }

      goto LABEL_59;
    }
    v18 = 4;
LABEL_59:
    objc_autoreleasePoolPop(v17);
    if (v18 != 6 && v18)
      break;
  }
  VCPSignPostLog();
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v58, OS_SIGNPOST_INTERVAL_END, spid, "MADProcessNewlyClusteredFaceCrops", ", buf, 2u);
  }

  if (v61)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }

}

void __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

uint64_t __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_456(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_457_0);
}

void __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CD1550], "changeRequestForFaceCrop:");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setState:", 2);

}

uint64_t __103__VCPPhotosPersistenceDelegate__processNewlyClusteredFaceCropsInFaceGroups_cancelOrExtendTimeoutBlock___block_invoke_459(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1550], "deleteFaceCrops:", *(_QWORD *)(a1 + 32));
}

- (void)_buildPersonsFromUpdatedFaceGroups:(id)a3 faceClusterer:(id)a4 keyFaceUpdateBlock:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 context:(id)a7
{
  NSMapTable *v12;
  uint64_t (**v13)(_QWORD);
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  char v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  uint64_t (**v53)(_QWORD);
  BOOL v54;
  NSMapTable *v55;
  VCPPhotosPersistenceDelegate *v56;
  NSObject *v57;
  int v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  NSMapTable *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t (**v77)(_QWORD);
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t ii;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t jj;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t kk;
  uint64_t v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t mm;
  uint64_t v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  char v118;
  NSObject *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  id v123;
  void *v124;
  _BOOL4 v125;
  id v126;
  void *v127;
  void *v128;
  NSObject *v129;
  NSObject *v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  uint64_t nn;
  id v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  int v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t i1;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  int v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i4;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  int v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t i5;
  char v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t i6;
  uint64_t v190;
  void *v191;
  _BOOL4 v192;
  NSObject *v193;
  NSObject *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t i10;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  id v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t i11;
  uint64_t v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t i12;
  uint64_t v219;
  void *v220;
  id v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t i13;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t i7;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t i8;
  uint64_t v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t i9;
  uint64_t v251;
  void *v252;
  NSObject *v253;
  void *v254;
  NSObject *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  int v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t i25;
  uint64_t v265;
  void *v266;
  void *v267;
  void *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  void *v275;
  void *v276;
  NSObject *v277;
  id v278;
  uint64_t v279;
  NSObject *v280;
  const char *v281;
  id v282;
  uint64_t v283;
  NSObject *v284;
  id v285;
  void *v286;
  id v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t i26;
  uint64_t v291;
  void *v292;
  void *v293;
  void *v294;
  unint64_t v295;
  void *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t i14;
  void *v300;
  void *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t i15;
  uint64_t v305;
  uint64_t (**v306)(_QWORD);
  uint64_t v307;
  void *v308;
  void *v309;
  void *v310;
  NSMapTable *v311;
  void *v312;
  void *v313;
  NSMapTable *v314;
  id v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t i16;
  void *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t i17;
  uint64_t v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  id v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t i18;
  id v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t i19;
  uint64_t v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  NSObject *v343;
  NSObject *v344;
  NSObject *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t i20;
  uint64_t v353;
  void *v354;
  void *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t i21;
  uint64_t v359;
  void *v360;
  void *v361;
  void *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t i22;
  uint64_t v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  uint64_t v371;
  NSObject *v372;
  void *v373;
  void *v374;
  void *v375;
  NSObject *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t i3;
  uint64_t v384;
  void *v385;
  void *v386;
  uint64_t v387;
  void *v388;
  uint64_t v389;
  uint64_t v390;
  void *v391;
  char v392;
  id v393;
  NSObject *v394;
  void *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t i23;
  uint64_t v399;
  void *v400;
  void *v401;
  id v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t i24;
  uint64_t v406;
  void *v407;
  void *v408;
  NSObject *v409;
  uint64_t v410;
  void *v411;
  void *v412;
  char v413;
  void *v414;
  void *v415;
  void *v416;
  uint64_t v417;
  void *v418;
  id v419;
  void *v420;
  void *v421;
  void *v422;
  char v423;
  id v424;
  id v425;
  id v426;
  id v427;
  NSObject *v428;
  id v429;
  void *v430;
  void *v431;
  uint64_t v432;
  id v433;
  uint64_t (**v434)(void *, id *);
  void *v435;
  void *v436;
  id obj;
  void *v438;
  void *v439;
  void *v440;
  uint64_t v441;
  id v442;
  void *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  unint64_t v447;
  unint64_t v448;
  id v449;
  id v450;
  uint64_t v451;
  id *location;
  uint64_t v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  id v462;
  void *v463;
  id v464;
  id v465;
  uint64_t v466;
  void *v467;
  void *v468;
  uint64_t v469;
  void *v470;
  void *v471;
  id v472;
  id v473;
  id v474;
  id v475;
  NSMapTable *v476;
  id v477;
  void *v478;
  void *v479;
  void *v480;
  uint64_t v481;
  id v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  uint64_t v489;
  char *v490;
  char *v491;
  void *v492;
  void *v493;
  id v494;
  id v495;
  void *v496;
  void *context;
  void *contexta;
  void *contextb;
  void *contextc;
  void *contextd;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  NSMapTable *table;
  id v508;
  id v509;
  char *v510;
  char *v511;
  id v512;
  id v513;
  void *v514;
  void *v515;
  uint64_t (**v516)(_QWORD);
  void *v517;
  NSMapTable *v518;
  NSMapTable *v519;
  id v520;
  id v521;
  id v522;
  id v523;
  uint64_t v524;
  id v525;
  void *v526;
  void *v527;
  uint64_t v528;
  VCPPhotosPersistenceDelegate *v529;
  void *v530;
  void *v531;
  id exc_buf;
  void *exc_bufa;
  uint64_t (**v534)(_QWORD);
  uint64_t v535;
  void *v536;
  void *v537;
  void *v538;
  uint64_t i2;
  void *v540;
  void *v541;
  uint64_t (*v542)(uint64_t, uint64_t);
  void *v543;
  id v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  _QWORD v661[4];
  id v662;
  _BYTE *v663;
  uint64_t v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  id v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  _QWORD v690[4];
  id v691;
  id v692;
  id v693;
  id v694;
  VCPPhotosPersistenceDelegate *v695;
  id v696;
  id v697;
  id v698;
  id v699;
  id v700;
  id v701;
  id v702;
  id v703;
  id v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  _QWORD v713[5];
  id v714;
  id v715;
  id v716;
  id v717;
  id v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  id v723;
  id v724;
  id v725;
  id v726;
  id v727;
  id v728;
  id v729;
  id v730;
  id v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  id v740;
  _QWORD aBlock[5];
  id v742;
  uint64_t (**v743)(_QWORD);
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  _BYTE v752[128];
  void *v753;
  _BYTE v754[128];
  _BYTE v755[128];
  _BYTE v756[128];
  _BYTE v757[128];
  _BYTE v758[128];
  _BYTE v759[128];
  _BYTE v760[128];
  _BYTE v761[128];
  _BYTE v762[128];
  _BYTE v763[128];
  _BYTE v764[128];
  _BYTE v765[128];
  uint64_t v766;
  _BYTE v767[128];
  _BYTE v768[128];
  _BYTE v769[128];
  _BYTE v770[128];
  _BYTE v771[128];
  _BYTE v772[128];
  _BYTE v773[128];
  _BYTE v774[128];
  _BYTE v775[128];
  _BYTE v776[128];
  _BYTE v777[128];
  _BYTE v778[128];
  _BYTE v779[128];
  _BYTE v780[128];
  _BYTE v781[128];
  _BYTE v782[128];
  uint64_t v783;
  id v784;
  int v785;
  uint64_t v786;
  _BYTE v787[24];
  uint64_t (*v788)(uint64_t, uint64_t);
  void (*v789)(uint64_t);
  id v790;
  id v791;
  _BYTE v792[128];
  _BYTE v793[128];
  _BYTE v794[128];
  _BYTE v795[128];
  _BYTE v796[128];
  _BYTE v797[128];
  uint64_t v798;
  uint64_t v799;
  _BYTE v800[128];
  _BYTE v801[128];
  _BYTE v802[128];
  _QWORD v803[3];
  _BYTE v804[128];
  _BYTE v805[128];
  _BYTE v806[128];
  _BYTE v807[128];
  uint64_t v808;

  v808 = *MEMORY[0x1E0C80C00];
  v12 = (NSMapTable *)a3;
  v426 = a4;
  v429 = a5;
  v13 = (uint64_t (**)(_QWORD))a6;
  v450 = a7;
  location = (id *)&self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  table = v12;
  v534 = v13;
  if (WeakRetained)
  {
    -[NSMapTable objectEnumerator](v12, "objectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = objc_claimAutoreleasedReturnValue();

    v420 = (void *)v16;
    -[VCPPhotosPersistenceDelegate _processNewlyClusteredFaceCropsInFaceGroups:cancelOrExtendTimeoutBlock:](self, "_processNewlyClusteredFaceCropsInFaceGroups:cancelOrExtendTimeoutBlock:", v16, v13);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[NSMapTable count](v12, "count"));
    v457 = (void *)objc_claimAutoreleasedReturnValue();
    v496 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMapTable count](v12, "count"));
    v751 = 0u;
    v750 = 0u;
    v749 = 0u;
    v748 = 0u;
    -[NSMapTable objectEnumerator](v12, "objectEnumerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v748, v807, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v749;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v749 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(v496, "addObject:", *(_QWORD *)(*((_QWORD *)&v748 + 1) + 8 * i));
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v748, v807, 16);
      }
      while (v18);
    }
    v529 = self;

    v21 = (void *)objc_opt_class();
    v22 = objc_loadWeakRetained(location);
    v421 = (void *)objc_msgSend(v21, "newAllPersonsFetchOptionsWithPhotoLibrary:", v22);

    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups:options:", v496, v421);
    v438 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v496, "count");
    if (v23 != objc_msgSend(v438, "count"))
    {
      v24 = (void *)MEMORY[0x1E0C99E20];
      NSAllMapTableKeys(v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v438, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "minusSet:", v29);
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v30 = MEMORY[0x1E0C81028];
        v31 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v787 = 138412290;
          *(_QWORD *)&v787[4] = v26;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to find unverified person for faceGroups '%@'; These will be fixed up and retried later",
            v787,
            0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v747 = 0u;
      v746 = 0u;
      v745 = 0u;
      v744 = 0u;
      v33 = v26;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v744, v806, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v745;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v745 != v35)
              objc_enumerationMutation(v33);
            v37 = *(_QWORD *)(*((_QWORD *)&v744 + 1) + 8 * j);
            -[NSMapTable objectForKey:](table, "objectForKey:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
              objc_msgSend(v32, "addObject:", v38);
            -[NSMapTable removeObjectForKey:](table, "removeObjectForKey:", v37);

          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v744, v806, 16);
        }
        while (v34);
      }

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke;
      aBlock[3] = &unk_1E6B18208;
      aBlock[4] = v529;
      v39 = v32;
      v742 = v39;
      v743 = v534;
      v40 = _Block_copy(aBlock);
      v41 = objc_loadWeakRetained(location);
      v740 = 0;
      v42 = objc_msgSend(v41, "performCancellableChangesAndWait:error:", v40, &v740);
      v43 = v740;

      if ((v42 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v44 = MEMORY[0x1E0C81028];
        v45 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v787 = 138412290;
          *(_QWORD *)&v787[4] = v43;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to fix up face groups without unverified person. Error: '%@'", v787, 0xCu);
        }

      }
    }
    v494 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v739 = 0u;
    v738 = 0u;
    v737 = 0u;
    v736 = 0u;
    objc_msgSend(v438, "objectEnumerator");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v736, v805, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v737;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v737 != v48)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v736 + 1) + 8 * k), "firstObject");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50)
          {
            objc_msgSend(v50, "localIdentifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v494, "setObject:forKeyedSubscript:", v51, v52);

          }
        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v736, v805, 16);
      }
      while (v47);
    }

    v735 = 0u;
    v734 = 0u;
    v733 = 0u;
    v732 = 0u;
    -[NSMapTable keyEnumerator](table, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v53 = v534;
    v453 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v732, v804, 16);
    if (v453)
    {
      v451 = *(_QWORD *)v733;
      v446 = *MEMORY[0x1E0CD1B70];
      v445 = *MEMORY[0x1E0CD1B58];
      v444 = *MEMORY[0x1E0CD1B80];
      do
      {
        v469 = 0;
        do
        {
          if (*(_QWORD *)v733 != v451)
            objc_enumerationMutation(obj);
          v54 = v53 == 0;
          v466 = *(_QWORD *)(*((_QWORD *)&v732 + 1) + 8 * v469);
          v460 = (void *)MEMORY[0x1BCCA1B2C]();
          v55 = table;
          v53 = v534;
          v56 = v529;
          v57 = MEMORY[0x1E0C81028];
          if (v54 || (v534[2](v534) & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v59 = v57;
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v787 = 138412290;
                *(_QWORD *)&v787[4] = v466;
                _os_log_impl(&dword_1B6C4A000, v57, OS_LOG_TYPE_DEBUG, "PersonBuilder: Person Building faceGroup '%@'", v787, 0xCu);
              }

              v55 = table;
              v56 = v529;
            }
            objc_msgSend(v457, "becomeCurrentWithPendingUnitCount:", 1);
            -[NSMapTable objectForKey:](v55, "objectForKey:", v466);
            v463 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPPhotosPersistenceDelegate dedupeGraphVerifiedPersonsInFaceGroup:personCache:](v56, "dedupeGraphVerifiedPersonsInFaceGroup:personCache:", v463, v494);
            v60 = (void *)objc_opt_class();
            v61 = objc_loadWeakRetained(location);
            v468 = (void *)objc_msgSend(v60, "newAllFacesFetchOptionsWithPhotoLibrary:", v61);

            v803[0] = v446;
            v803[1] = v445;
            v803[2] = v444;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v803, 3);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v468, "setFetchPropertySets:", v62);

            objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v463, v468);
            v461 = (void *)objc_claimAutoreleasedReturnValue();
            v448 = objc_msgSend(v461, "count");
            v447 = objc_msgSend(v450, "minimumFaceGroupSizeForCreatingMergeCandidates");
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v543 = (void *)objc_claimAutoreleasedReturnValue();
            v731 = 0;
            v730 = 0;
            v729 = 0;
            v728 = 0;
            v727 = 0;
            v726 = 0;
            v725 = 0;
            v724 = 0;
            v723 = 0;
            -[VCPPhotosPersistenceDelegate _getTrainingFacesByPerson:confirmedFaceCSNs:faceCSNsByPerson:faceCSNsByMigratedPerson:faceCSNsByQuickClassificationPerson:mergeCandidates:invalidMergeCandidates:rejectedPersonsByPerson:faceInFaceGroupByCSN:inFaces:personCache:cancelOrExtendTimeoutBlock:](v529, "_getTrainingFacesByPerson:confirmedFaceCSNs:faceCSNsByPerson:faceCSNsByMigratedPerson:faceCSNsByQuickClassificationPerson:mergeCandidates:invalidMergeCandidates:rejectedPersonsByPerson:faceInFaceGroupByCSN:inFaces:personCache:cancelOrExtendTimeoutBlock:", &v731, &v730, &v729, &v728, &v727, &v726, &v725, &v724, &v723, v461, v494, v534);
            v63 = (NSMapTable *)v731;
            v476 = (NSMapTable *)v730;
            v519 = (NSMapTable *)v729;
            v518 = (NSMapTable *)v728;
            v474 = v727;
            v64 = v726;
            v462 = v725;
            v465 = v724;
            v464 = v723;
            v459 = v64;
            if (v534 && (v534[2](v534) & 1) != 0)
            {
              v58 = 1;
LABEL_607:

              v53 = v534;
              objc_msgSend(v457, "resignCurrent");
              goto LABEL_608;
            }
            v722 = 0u;
            v721 = 0u;
            v720 = 0u;
            v719 = 0u;
            -[NSMapTable keyEnumerator](v518, "keyEnumerator");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v719, v802, 16);
            if (v66)
            {
              v67 = *(_QWORD *)v720;
              do
              {
                for (m = 0; m != v66; ++m)
                {
                  if (*(_QWORD *)v720 != v67)
                    objc_enumerationMutation(v65);
                  objc_msgSend(v543, "addObject:", *(_QWORD *)(*((_QWORD *)&v719 + 1) + 8 * m));
                }
                v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v719, v802, 16);
              }
              while (v66);
            }

            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
            v456 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v455 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v454 = (void *)objc_claimAutoreleasedReturnValue();
            v535 = -[NSMapTable count](v63, "count");
            objc_msgSend(v438, "objectForKeyedSubscript:", v466);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "firstObject");
            v458 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v458, "localIdentifier");
            v542 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            v70 = MEMORY[0x1E0C81028];
            if (!v458 || !v542)
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v787 = 138412802;
                *(_QWORD *)&v787[4] = v466;
                *(_WORD *)&v787[12] = 2112;
                *(_QWORD *)&v787[14] = v458;
                *(_WORD *)&v787[22] = 2112;
                v788 = v542;
                _os_log_impl(&dword_1B6C4A000, v70, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to find unverified person [unverifiedPerson: %@, unverifiedPersonLocalIdentifier: %@] for faceGroup '%@', skipping this face group", v787, 0x20u);
              }
              v58 = 15;
              goto LABEL_606;
            }
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v439 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v541 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v540 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v436 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v435 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v531 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSMapTable count](v63, "count"))
            {
              NSAllMapTableKeys(v63);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v531, "addObjectsFromArray:", v71);

            }
            if (-[NSMapTable count](v476, "count"))
            {
              NSAllMapTableKeys(v476);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v531, "addObjectsFromArray:", v72);

            }
            if (-[NSMapTable count](v519, "count"))
            {
              NSAllMapTableKeys(v519);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v531, "addObjectsFromArray:", v73);

            }
            if (-[NSMapTable count](v518, "count"))
            {
              NSAllMapTableKeys(v518);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v531, "addObjectsFromArray:", v74);

            }
            objc_msgSend(v531, "removeObject:", v542);
            v75 = (void *)objc_opt_class();
            v76 = objc_loadWeakRetained(location);
            v443 = (void *)objc_msgSend(v75, "newVerifiedPersonsFetchOptionsWithPhotoLibrary:", v76);

            v713[0] = MEMORY[0x1E0C809B0];
            v713[1] = 3221225472;
            v713[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_461;
            v713[3] = &unk_1E6B18230;
            v77 = v534;
            v718 = v77;
            v713[4] = v529;
            v525 = v464;
            v714 = v525;
            v477 = v436;
            v715 = v477;
            v449 = v435;
            v716 = v449;
            v78 = v465;
            v717 = v78;
            -[VCPPhotosPersistenceDelegate _enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:](v529, "_enumeratePersonsWithLocalIdentifiers:fetchOptions:personCache:usingBlock:", v531, v443, v494, v713);
            if (v534 && (v534[2](v77) & 1) != 0)
            {
              v58 = 1;
              goto LABEL_605;
            }
            v712 = 0u;
            v711 = 0u;
            v710 = 0u;
            v709 = 0u;
            objc_msgSend(v78, "keyEnumerator");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v709, v801, 16);
            if (v80)
            {
              v81 = *(_QWORD *)v710;
              do
              {
                for (n = 0; n != v80; ++n)
                {
                  if (*(_QWORD *)v710 != v81)
                    objc_enumerationMutation(v79);
                  v83 = *(void **)(*((_QWORD *)&v709 + 1) + 8 * n);
                  objc_msgSend(v78, "objectForKey:", v83);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "allObjects");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  AddMergeCandidatePersonsForPerson(v541, v85, v83, CFSTR("invalid merge candidate pair created from cluster rejections"));

                  objc_msgSend(v84, "allObjects");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  AddMergeCandidatePersonsForPerson(v540, v86, v83, CFSTR("potential invalid merge candidate pair created from cluster rejections"));

                }
                v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v709, v801, 16);
              }
              while (v80);
            }

            v530 = (void *)-[NSMapTable copy](v519, "copy");
            objc_msgSend(v530, "removeObjectForKey:", v542);
            v708 = 0u;
            v707 = 0u;
            v706 = 0u;
            v705 = 0u;
            objc_msgSend(v477, "keyEnumerator");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v705, v800, 16);
            if (v88)
            {
              v89 = *(_QWORD *)v706;
              do
              {
                for (ii = 0; ii != v88; ++ii)
                {
                  if (*(_QWORD *)v706 != v89)
                    objc_enumerationMutation(v87);
                  v799 = *(_QWORD *)(*((_QWORD *)&v705 + 1) + 8 * ii);
                  v91 = v799;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v799, 1);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  AddMergeCandidatePersonsForPerson(v541, v92, v542, CFSTR("invalid merge candidate pair from cluster rejection for verified person"));

                  v798 = v91;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v798, 1);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  AddMergeCandidatePersonsForPerson(v540, v93, v542, CFSTR("potential invalid merge candidate pair from cluster rejection for verified person"));

                  objc_msgSend(v531, "removeObject:", v91);
                  objc_msgSend(v530, "removeObjectForKey:", v91);
                }
                v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v705, v800, 16);
              }
              while (v88);
            }

            v690[0] = MEMORY[0x1E0C809B0];
            v690[1] = 3221225472;
            v690[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_2;
            v690[3] = &unk_1E6B18258;
            v442 = v439;
            v691 = v442;
            v475 = v540;
            v692 = v475;
            v427 = v459;
            v693 = v427;
            v694 = v541;
            v695 = v529;
            v523 = v456;
            v696 = v523;
            exc_buf = v455;
            v697 = exc_buf;
            v473 = v454;
            v698 = v473;
            v699 = v463;
            v424 = v525;
            v700 = v424;
            v701 = v494;
            v703 = v429;
            v516 = v77;
            v704 = v516;
            v425 = v450;
            v702 = v425;
            v434 = (uint64_t (**)(void *, id *))_Block_copy(v690);
            if (!v535)
            {
              v508 = v531;
              v686 = 0u;
              v687 = 0u;
              v688 = 0u;
              v689 = 0u;
              objc_msgSend(v477, "keyEnumerator");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v686, v797, 16);
              if (v96)
              {
                v97 = *(_QWORD *)v687;
                do
                {
                  for (jj = 0; jj != v96; ++jj)
                  {
                    if (*(_QWORD *)v687 != v97)
                      objc_enumerationMutation(v95);
                    v99 = *(_QWORD *)(*((_QWORD *)&v686 + 1) + 8 * jj);
                    -[NSMapTable objectForKey:](v519, "objectForKey:", v99);
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v100, "count"))
                    {
                      objc_msgSend(exc_buf, "objectForKey:", v99);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v101)
                      {
                        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                        v101 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(exc_buf, "setObject:forKey:", v101, v99);
                      }
                      objc_msgSend(v101, "unionSet:", v100);
                      objc_msgSend(v523, "addObject:", v99);

                    }
                  }
                  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v686, v797, 16);
                }
                while (v96);
              }

              if ((unint64_t)objc_msgSend(v508, "count") >= 2)
              {
                v685 = 0u;
                v684 = 0u;
                v683 = 0u;
                v682 = 0u;
                objc_msgSend(v530, "keyEnumerator");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v682, v796, 16);
                if (v103)
                {
                  v104 = *(_QWORD *)v683;
                  do
                  {
                    for (kk = 0; kk != v103; ++kk)
                    {
                      if (*(_QWORD *)v683 != v104)
                        objc_enumerationMutation(v102);
                      v106 = *(_QWORD *)(*((_QWORD *)&v682 + 1) + 8 * kk);
                      -[NSMapTable objectForKey:](v519, "objectForKey:", v106);
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v107, "count"))
                      {
                        objc_msgSend(exc_buf, "objectForKey:", v106);
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v108)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                          v108 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(exc_buf, "setObject:forKey:", v108, v106);
                        }
                        objc_msgSend(v108, "unionSet:", v107);
                        objc_msgSend(v523, "addObject:", v106);

                      }
                    }
                    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v682, v796, 16);
                  }
                  while (v103);
                }

              }
              v681 = 0u;
              v680 = 0u;
              v679 = 0u;
              v678 = 0u;
              v109 = v543;
              v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v678, v795, 16);
              if (v110)
              {
                v111 = *(_QWORD *)v679;
                do
                {
                  for (mm = 0; mm != v110; ++mm)
                  {
                    if (*(_QWORD *)v679 != v111)
                      objc_enumerationMutation(v109);
                    v113 = *(_QWORD *)(*((_QWORD *)&v678 + 1) + 8 * mm);
                    -[NSMapTable objectForKey:](v518, "objectForKey:", v113);
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v114, "count"))
                    {
                      objc_msgSend(exc_buf, "objectForKey:", v113);
                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v115)
                      {
                        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(exc_buf, "setObject:forKey:", v115, v113);
                      }
                      objc_msgSend(v115, "unionSet:", v114);
                      objc_msgSend(v523, "addObject:", v113);
                      objc_msgSend(v508, "addObject:", v113);

                    }
                  }
                  v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v678, v795, 16);
                }
                while (v110);
              }

              v116 = MEMORY[0x1E0C81028];
              if (objc_msgSend(v508, "count") == 1)
              {
                objc_msgSend(v508, "allObjects");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                AddMergeCandidatePersonsForPerson(v442, v117, v542, CFSTR("no training faces in level1 cluster - create 'unverified person : verified/migrated person' candidate pair"));

              }
              v677 = 0;
              v118 = v434[2](v434, &v677);
              v433 = v677;
              if ((v118 & 1) != 0 || (int)MediaAnalysisLogLevel() < 3)
              {
                v58 = 15;
              }
              else
              {
                v119 = v116;
                if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v787 = 138412290;
                  *(_QWORD *)&v787[4] = v433;
                  _os_log_impl(&dword_1B6C4A000, v116, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to build persons [Error: '%@']", v787, 0xCu);
                }
                v58 = 15;

              }
              goto LABEL_604;
            }
            -[NSMapTable keyEnumerator](v63, "keyEnumerator");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "nextObject");
            v508 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v449, "objectForKey:", v508);
            v433 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v477, "objectForKey:", v508);
            v431 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v427, "objectForKey:", v542);
            v430 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v430 || v535 != 1)
            {
              if (v535 == 1)
                goto LABEL_138;
              goto LABEL_141;
            }
            objc_msgSend(v430, "removeObject:", v508);
LABEL_138:
            if (objc_msgSend(v431, "count") || objc_msgSend(v430, "count") || objc_msgSend(v462, "count"))
            {
LABEL_141:
              -[NSMapTable objectEnumerator](v63, "objectEnumerator");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "nextObject");
              v509 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v509, "anyObject");
              v536 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = objc_msgSend(v536, "clusterSequenceNumber");
              objc_msgSend(v426, "level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:error:", v121, 0);
              v526 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v526, "count") >= 2)
              {
                -[VCPPhotosPersistenceDelegate identifyConflictingL0Clusters:csnToRejectedPersonForNewlyClusteredFaces:csnToConfirmedPersonForNewlyClusteredFaces:](v529, "identifyConflictingL0Clusters:csnToRejectedPersonForNewlyClusteredFaces:csnToConfirmedPersonForNewlyClusteredFaces:", v526, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)v787 = 0;
                *(_QWORD *)&v787[8] = v787;
                *(_QWORD *)&v787[16] = 0x3032000000;
                v788 = __Block_byref_object_copy__23;
                v789 = __Block_byref_object_dispose__23;
                v790 = 0;
                v661[0] = MEMORY[0x1E0C809B0];
                v661[1] = 3221225472;
                v661[2] = __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_479;
                v661[3] = &unk_1E6B18280;
                v123 = v526;
                v664 = v121;
                v662 = v123;
                v663 = v787;
                objc_msgSend(v122, "enumerateObjectsUsingBlock:", v661);
                if (*(_QWORD *)(*(_QWORD *)&v787[8] + 40))
                {
                  objc_msgSend(v123, "objectForKeyedSubscript:");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  v125 = v124 == 0;

                  if (!v125)
                  {
                    v783 = *(_QWORD *)(*(_QWORD *)&v787[8] + 40);
                    objc_msgSend(v123, "objectForKeyedSubscript:");
                    v126 = (id)objc_claimAutoreleasedReturnValue();
                    v784 = v126;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v784, &v783, 1);
                    v526 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_147;
                  }
                  v129 = MEMORY[0x1E0C81028];
                  if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    v130 = v129;
                    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                    {
                      v131 = *(_QWORD *)(*(_QWORD *)&v787[8] + 40);
                      v785 = 138412290;
                      v786 = v131;
                      _os_log_impl(&dword_1B6C4A000, v129, OS_LOG_TYPE_ERROR, "[VisionFgMapping] Failed to find conflicting l0cluster (expect csn: %@)", (uint8_t *)&v785, 0xCu);
                    }

                  }
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
                  v526 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v127 = (void *)objc_msgSend(v123, "mutableCopy");
                  objc_msgSend(v122, "allObjects");
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v127, "removeObjectsForKeys:", v128);

                  v126 = v127;
                  v526 = v126;
LABEL_147:

                  v123 = v126;
                }

                _Block_object_dispose(v787, 8);
              }
              objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
              v514 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
              v520 = (id)objc_claimAutoreleasedReturnValue();
              v660 = 0u;
              v659 = 0u;
              v658 = 0u;
              v657 = 0u;
              -[NSMapTable objectEnumerator](v63, "objectEnumerator");
              v495 = (id)objc_claimAutoreleasedReturnValue();
              v132 = objc_msgSend(v495, "countByEnumeratingWithState:objects:count:", &v657, v782, 16);
              if (!v132)
                goto LABEL_181;
              v489 = *(_QWORD *)v658;
              do
              {
                v502 = 0;
                v486 = (void *)v132;
                do
                {
                  if (*(_QWORD *)v658 != v489)
                    objc_enumerationMutation(v495);
                  v133 = *(id *)(*((_QWORD *)&v657 + 1) + 8 * (_QWORD)v502);

                  context = (void *)MEMORY[0x1BCCA1B2C]();
                  v656 = 0u;
                  v655 = 0u;
                  v654 = 0u;
                  v653 = 0u;
                  v509 = v133;
                  v134 = objc_msgSend(v509, "countByEnumeratingWithState:objects:count:", &v653, v781, 16);
                  v135 = v536;
                  if (v134)
                  {
                    v136 = *(_QWORD *)v654;
                    while (2)
                    {
                      for (nn = 0; nn != v134; ++nn)
                      {
                        if (*(_QWORD *)v654 != v136)
                          objc_enumerationMutation(v509);
                        v138 = *(id *)(*((_QWORD *)&v653 + 1) + 8 * nn);
                        v139 = v135;
                        v135 = v138;

                        if (v534 && (v534[2](v516) & 1) != 0)
                        {
                          v536 = v135;
                          v152 = 0;
                          goto LABEL_178;
                        }
                        v140 = -[VCPPhotosPersistenceDelegate _level0ClusterIdForFaceCSN:level0Clusters:](v529, "_level0ClusterIdForFaceCSN:level0Clusters:", objc_msgSend(v135, "clusterSequenceNumber"), v526);
                        if (v140)
                        {
                          v537 = v135;
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v140);
                          v141 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v514, "objectForKey:", v141);
                          v142 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v142)
                          {
                            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                            v142 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v514, "setObject:forKey:", v142, v141);
                          }
                          objc_msgSend(v537, "personLocalIdentifier");
                          v143 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v142, "objectForKey:", v143);
                          v144 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v144)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                            v145 = objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v537, "personLocalIdentifier");
                            v146 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v142, "setObject:forKey:", v145, v146);

                            v144 = (void *)v145;
                          }
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v537, "clusterSequenceNumber"));
                          v147 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v144, "addObject:", v147);

                          objc_msgSend(v537, "personLocalIdentifier");
                          v148 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v520, "objectForKey:", v148);
                          v149 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v149)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                            v150 = objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v537, "personLocalIdentifier");
                            v151 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v520, "setObject:forKey:", v150, v151);

                            v149 = (void *)v150;
                          }
                          objc_msgSend(v149, "addObject:", v141);

                          v135 = v537;
                        }
                      }
                      v134 = objc_msgSend(v509, "countByEnumeratingWithState:objects:count:", &v653, v781, 16);
                      if (v134)
                        continue;
                      break;
                    }
                  }

                  v536 = 0;
                  v152 = 1;
LABEL_178:

                  objc_autoreleasePoolPop(context);
                  if (!v152)
                  {
                    v260 = 1;
                    goto LABEL_571;
                  }
                  v502 = (char *)v502 + 1;
                }
                while (v502 != v486);
                v132 = objc_msgSend(v495, "countByEnumeratingWithState:objects:count:", &v657, v782, 16);
              }
              while (v132);
LABEL_181:

              objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
              v495 = (id)objc_claimAutoreleasedReturnValue();
              v652 = 0u;
              v651 = 0u;
              v650 = 0u;
              v649 = 0u;
              objc_msgSend(v477, "keyEnumerator");
              v482 = (id)objc_claimAutoreleasedReturnValue();
              v153 = objc_msgSend(v482, "countByEnumeratingWithState:objects:count:", &v649, v780, 16);
              if (v153)
              {
                contexta = *(void **)v650;
LABEL_183:
                v154 = 0;
                v490 = (char *)v153;
                while (1)
                {
                  if (*(void **)v650 != contexta)
                    objc_enumerationMutation(v482);
                  v510 = v154;
                  v155 = *(_QWORD *)(*((_QWORD *)&v649 + 1) + 8 * (_QWORD)v154);
                  v503 = (void *)MEMORY[0x1BCCA1B2C]();
                  objc_msgSend(v477, "objectForKey:", v155);
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  v648 = 0u;
                  v647 = 0u;
                  v646 = 0u;
                  v645 = 0u;
                  v157 = v156;
                  v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v645, v779, 16);
                  if (v158)
                  {
                    v159 = *(_QWORD *)v646;
                    while (2)
                    {
                      for (i1 = 0; i1 != v158; ++i1)
                      {
                        if (*(_QWORD *)v646 != v159)
                          objc_enumerationMutation(v157);
                        v161 = *(void **)(*((_QWORD *)&v645 + 1) + 8 * i1);
                        if (v534 && (v534[2](v516) & 1) != 0)
                        {
                          v166 = 0;
                          goto LABEL_203;
                        }
                        v162 = -[VCPPhotosPersistenceDelegate _level0ClusterIdForFaceCSN:level0Clusters:](v529, "_level0ClusterIdForFaceCSN:level0Clusters:", objc_msgSend(v161, "unsignedIntegerValue"), v526);
                        if (v162)
                        {
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v162);
                          v163 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v495, "objectForKey:", v163);
                          v164 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v164)
                          {
                            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                            v164 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v495, "setObject:forKey:", v164, v163);
                          }
                          objc_msgSend(v164, "objectForKey:", v155);
                          v165 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v165)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                            v165 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v164, "setObject:forKey:", v165, v155);
                          }
                          objc_msgSend(v165, "addObject:", v161);

                        }
                      }
                      v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v645, v779, 16);
                      if (v158)
                        continue;
                      break;
                    }
                  }
                  v166 = 1;
LABEL_203:

                  objc_autoreleasePoolPop(v503);
                  if (!v166)
                    break;
                  v154 = v510 + 1;
                  if (v510 + 1 == v490)
                  {
                    v153 = objc_msgSend(v482, "countByEnumeratingWithState:objects:count:", &v649, v780, 16);
                    if (!v153)
                      goto LABEL_206;
                    goto LABEL_183;
                  }
                }
                v260 = 1;
LABEL_570:

                v509 = 0;
LABEL_571:

                if (v260)
                {
                  v58 = 1;
                  goto LABEL_603;
                }
LABEL_573:
                v376 = MEMORY[0x1E0C81028];
                if (objc_msgSend(v425, "quarantineTwinsOnAssetEnabled"))
                  -[VCPPhotosPersistenceDelegate _updateFaceCSNsToAddByPerson:faceCSNsToRemoveByPerson:faceInFaceGroupByCSN:faceCSNsByPersonLocalIdentifier:faceCSNsByMigratedPersonLocalIdentifier:personsToUpdate:](v529, "_updateFaceCSNsToAddByPerson:faceCSNsToRemoveByPerson:faceInFaceGroupByCSN:faceCSNsByPersonLocalIdentifier:faceCSNsByMigratedPersonLocalIdentifier:personsToUpdate:", v473, exc_buf, v424, v519, v518, v523);
                if (objc_msgSend(v477, "count"))
                {
                  v551 = 0u;
                  v552 = 0u;
                  v549 = 0u;
                  v550 = 0u;
                  objc_msgSend(v477, "keyEnumerator");
                  v522 = (id)objc_claimAutoreleasedReturnValue();
                  v528 = objc_msgSend(v522, "countByEnumeratingWithState:objects:count:", &v549, v754, 16);
                  if (v528)
                  {
                    v524 = *(_QWORD *)v550;
                    do
                    {
                      for (i2 = 0; i2 != v528; ++i2)
                      {
                        if (*(_QWORD *)v550 != v524)
                          objc_enumerationMutation(v522);
                        exc_bufa = *(void **)(*((_QWORD *)&v549 + 1) + 8 * i2);
                        objc_msgSend(v477, "objectForKey:");
                        v377 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v377, "count"))
                        {
                          v753 = exc_bufa;
                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v753, 1);
                          v378 = (void *)objc_claimAutoreleasedReturnValue();
                          AddMergeCandidatePersonsForPerson(v475, v378, v542, CFSTR("invalid merge candidate pair: a cluster rejection"));

                          objc_msgSend(MEMORY[0x1E0C99E20], "set");
                          v379 = (void *)objc_claimAutoreleasedReturnValue();
                          v547 = 0u;
                          v548 = 0u;
                          v545 = 0u;
                          v546 = 0u;
                          -[NSMapTable keyEnumerator](v63, "keyEnumerator");
                          v380 = (void *)objc_claimAutoreleasedReturnValue();
                          v381 = objc_msgSend(v380, "countByEnumeratingWithState:objects:count:", &v545, v752, 16);
                          if (v381)
                          {
                            v382 = *(_QWORD *)v546;
                            do
                            {
                              for (i3 = 0; i3 != v381; ++i3)
                              {
                                if (*(_QWORD *)v546 != v382)
                                  objc_enumerationMutation(v380);
                                v384 = *(_QWORD *)(*((_QWORD *)&v545 + 1) + 8 * i3);
                                -[NSMapTable objectForKey:](v63, "objectForKey:", v384);
                                v385 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v385, "valueForKey:", CFSTR("clusterSequenceNumber"));
                                v386 = (void *)objc_claimAutoreleasedReturnValue();

                                if (objc_msgSend(v386, "intersectsSet:", v377))
                                  objc_msgSend(v379, "addObject:", v384);

                              }
                              v381 = objc_msgSend(v380, "countByEnumeratingWithState:objects:count:", &v545, v752, 16);
                            }
                            while (v381);
                          }

                          __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_504(v387, v379, v476, v377);
                          v388 = (void *)-[NSMapTable copy](v519, "copy");
                          __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_504(objc_msgSend(v388, "removeObjectForKey:", v542), v379, v388, v377);
                          __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_504(v389, v379, v518, v377);
                          __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_504(v390, v379, v473, v377);
                          if (objc_msgSend(v379, "count"))
                          {
                            objc_msgSend(v379, "allObjects");
                            v391 = (void *)objc_claimAutoreleasedReturnValue();
                            AddMergeCandidatePersonsForPerson(v475, v391, exc_bufa, CFSTR("invalid merge candidate pair:a face on verified person but cluster-rejected on another verified person"));

                          }
                        }

                      }
                      v528 = objc_msgSend(v522, "countByEnumeratingWithState:objects:count:", &v549, v754, 16);
                    }
                    while (v528);
                  }

                  v376 = MEMORY[0x1E0C81028];
                }
                v544 = 0;
                v392 = v434[2](v434, &v544);
                v393 = v544;
                if ((v392 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
                {
                  v394 = v376;
                  if (os_log_type_enabled(v376, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v787 = 138412290;
                    *(_QWORD *)&v787[4] = v393;
                    _os_log_impl(&dword_1B6C4A000, v376, OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to build persons [Error: '%@']", v787, 0xCu);
                  }

                }
                v58 = 0;
LABEL_603:

LABEL_604:
LABEL_605:

LABEL_606:
                goto LABEL_607;
              }
LABEL_206:

              objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
              v482 = (id)objc_claimAutoreleasedReturnValue();
              v644 = 0u;
              v643 = 0u;
              v642 = 0u;
              v641 = 0u;
              objc_msgSend(v449, "keyEnumerator");
              v472 = (id)objc_claimAutoreleasedReturnValue();
              v167 = objc_msgSend(v472, "countByEnumeratingWithState:objects:count:", &v641, v778, 16);
              if (!v167)
                goto LABEL_231;
              contextb = *(void **)v642;
              do
              {
                v168 = 0;
                v491 = (char *)v167;
                do
                {
                  if (*(void **)v642 != contextb)
                    objc_enumerationMutation(v472);
                  v511 = v168;
                  v169 = *(_QWORD *)(*((_QWORD *)&v641 + 1) + 8 * (_QWORD)v168);
                  v504 = (void *)MEMORY[0x1BCCA1B2C]();
                  objc_msgSend(v449, "objectForKey:", v169);
                  v170 = (void *)objc_claimAutoreleasedReturnValue();
                  v640 = 0u;
                  v639 = 0u;
                  v638 = 0u;
                  v637 = 0u;
                  v171 = v170;
                  v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v637, v777, 16);
                  if (v172)
                  {
                    v173 = *(_QWORD *)v638;
                    while (2)
                    {
                      for (i4 = 0; i4 != v172; ++i4)
                      {
                        if (*(_QWORD *)v638 != v173)
                          objc_enumerationMutation(v171);
                        v175 = *(void **)(*((_QWORD *)&v637 + 1) + 8 * i4);
                        if (v534 && (v534[2](v516) & 1) != 0)
                        {
                          v180 = 0;
                          goto LABEL_228;
                        }
                        v176 = -[VCPPhotosPersistenceDelegate _level0ClusterIdForFaceCSN:level0Clusters:](v529, "_level0ClusterIdForFaceCSN:level0Clusters:", objc_msgSend(v175, "unsignedIntegerValue"), v526);
                        if (v176)
                        {
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v176);
                          v177 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v482, "objectForKey:", v177);
                          v178 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v178)
                          {
                            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                            v178 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v482, "setObject:forKey:", v178, v177);
                          }
                          objc_msgSend(v178, "objectForKey:", v169);
                          v179 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v179)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                            v179 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v178, "setObject:forKey:", v179, v169);
                          }
                          objc_msgSend(v179, "addObject:", v175);

                        }
                      }
                      v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v637, v777, 16);
                      if (v172)
                        continue;
                      break;
                    }
                  }
                  v180 = 1;
LABEL_228:

                  objc_autoreleasePoolPop(v504);
                  if (!v180)
                  {
                    v260 = 1;
                    goto LABEL_569;
                  }
                  v168 = v511 + 1;
                }
                while (v511 + 1 != v491);
                v167 = objc_msgSend(v472, "countByEnumeratingWithState:objects:count:", &v641, v778, 16);
              }
              while (v167);
LABEL_231:

              objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
              v472 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v483 = (void *)objc_claimAutoreleasedReturnValue();
              v636 = 0u;
              v635 = 0u;
              v634 = 0u;
              v633 = 0u;
              objc_msgSend(v514, "keyEnumerator");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v633, v776, 16);
              if (v182)
              {
                v183 = *(_QWORD *)v634;
                do
                {
                  for (i5 = 0; i5 != v182; ++i5)
                  {
                    if (*(_QWORD *)v634 != v183)
                      objc_enumerationMutation(v181);
                    objc_msgSend(v472, "addObject:", *(_QWORD *)(*((_QWORD *)&v633 + 1) + 8 * i5));
                  }
                  v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v633, v776, 16);
                }
                while (v182);
              }

              v413 = 0;
              while (2)
              {
                if (objc_msgSend(v472, "count"))
                {
                  v422 = (void *)MEMORY[0x1BCCA1B2C]();
                  objc_msgSend(v472, "anyObject");
                  v487 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v472, "removeObject:");
                  if (v534 && (v534[2](v516) & 1) != 0)
                  {
                    v185 = 0;
                    goto LABEL_354;
                  }
                  objc_msgSend(v514, "objectForKey:", v487);
                  v484 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v495, "objectForKey:", v487);
                  v512 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                  v492 = (void *)objc_claimAutoreleasedReturnValue();
                  v632 = 0u;
                  v631 = 0u;
                  v630 = 0u;
                  v629 = 0u;
                  objc_msgSend(v484, "keyEnumerator");
                  v186 = (void *)objc_claimAutoreleasedReturnValue();
                  v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v629, v775, 16);
                  if (v187)
                  {
                    v188 = *(_QWORD *)v630;
                    do
                    {
                      for (i6 = 0; i6 != v187; ++i6)
                      {
                        if (*(_QWORD *)v630 != v188)
                          objc_enumerationMutation(v186);
                        v190 = *(_QWORD *)(*((_QWORD *)&v629 + 1) + 8 * i6);
                        objc_msgSend(v512, "objectForKey:", v190);
                        v191 = (void *)objc_claimAutoreleasedReturnValue();
                        v192 = objc_msgSend(v191, "count") == 0;

                        if (v192)
                          objc_msgSend(v492, "addObject:", v190);
                      }
                      v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v629, v775, 16);
                    }
                    while (v187);
                  }

                  v193 = MEMORY[0x1E0C81028];
                  if (objc_msgSend(v492, "count"))
                  {
                    if ((unint64_t)objc_msgSend(v492, "count") < 2)
                    {
                      objc_msgSend(v492, "anyObject");
                      v225 = objc_claimAutoreleasedReturnValue();
                      v226 = (void *)MEMORY[0x1E0C99E20];
                      v505 = (void *)v225;
                      objc_msgSend(v526, "objectForKey:", v487);
                      v227 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v227, "set");
                      v228 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v226, "setWithSet:", v228);
                      contextc = (void *)objc_claimAutoreleasedReturnValue();

                      -[NSMapTable objectForKey:](v519, "objectForKey:", v505);
                      v440 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMapTable objectForKey:](v476, "objectForKey:", v505);
                      v418 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMapTable objectForKey:](v63, "objectForKey:", v505);
                      v229 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v229, "valueForKey:", CFSTR("clusterSequenceNumber"));
                      v416 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v482, "objectForKey:", v487);
                      v230 = (void *)objc_claimAutoreleasedReturnValue();
                      v231 = v505;
                      objc_msgSend(v230, "objectForKey:", v505);
                      v414 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v478 = (void *)objc_claimAutoreleasedReturnValue();
                      v480 = (void *)objc_msgSend(contextc, "mutableCopy");
                      objc_msgSend(v480, "intersectSet:", v440);
                      if (objc_msgSend(v480, "count"))
                      {
                        v611 = 0u;
                        v612 = 0u;
                        v609 = 0u;
                        v610 = 0u;
                        objc_msgSend(v230, "keyEnumerator");
                        v232 = (void *)objc_claimAutoreleasedReturnValue();
                        v233 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v609, v770, 16);
                        if (v233)
                        {
                          v234 = *(_QWORD *)v610;
                          do
                          {
                            for (i7 = 0; i7 != v233; ++i7)
                            {
                              if (*(_QWORD *)v610 != v234)
                                objc_enumerationMutation(v232);
                              v236 = *(_QWORD *)(*((_QWORD *)&v609 + 1) + 8 * i7);
                              objc_msgSend(v230, "objectForKey:", v236);
                              v237 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v480, "intersectsSet:", v237))
                                objc_msgSend(v478, "addObject:", v236);

                            }
                            v233 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v609, v770, 16);
                          }
                          while (v233);
                        }

                        v231 = v505;
                      }
                      objc_msgSend(contextc, "minusSet:", v480);
                      objc_msgSend(contextc, "minusSet:", v418);
                      objc_msgSend(contextc, "minusSet:", v416);
                      objc_msgSend(contextc, "minusSet:", v414);
                      objc_msgSend(MEMORY[0x1E0C99E20], "set");
                      v470 = (void *)objc_claimAutoreleasedReturnValue();
                      v238 = (void *)-[NSMapTable copy](v476, "copy");
                      objc_msgSend(v238, "removeObjectForKey:", v231);
                      v607 = 0u;
                      v608 = 0u;
                      v605 = 0u;
                      v606 = 0u;
                      objc_msgSend(v238, "keyEnumerator");
                      v239 = (void *)objc_claimAutoreleasedReturnValue();
                      v240 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v605, v769, 16);
                      if (v240)
                      {
                        v241 = *(_QWORD *)v606;
                        do
                        {
                          for (i8 = 0; i8 != v240; ++i8)
                          {
                            if (*(_QWORD *)v606 != v241)
                              objc_enumerationMutation(v239);
                            v243 = *(_QWORD *)(*((_QWORD *)&v605 + 1) + 8 * i8);
                            objc_msgSend(v238, "objectForKey:", v243);
                            v244 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v244, "count")
                              && objc_msgSend(v244, "intersectsSet:", contextc))
                            {
                              objc_msgSend(v470, "addObject:", v243);
                              objc_msgSend(contextc, "minusSet:", v244);
                            }

                          }
                          v240 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v605, v769, 16);
                        }
                        while (v240);
                      }

                      v245 = v505;
                      if (objc_msgSend(contextc, "count"))
                      {
                        objc_msgSend(v473, "objectForKey:", v505);
                        v246 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v246)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                          v246 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v473, "setObject:forKey:", v246, v505);
                        }
                        objc_msgSend(v246, "unionSet:", contextc);
                        objc_msgSend(v523, "addObject:", v505);
                        v603 = 0u;
                        v604 = 0u;
                        v601 = 0u;
                        v602 = 0u;
                        objc_msgSend(v230, "keyEnumerator");
                        v247 = (void *)objc_claimAutoreleasedReturnValue();
                        v248 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v601, v768, 16);
                        if (v248)
                        {
                          v249 = *(_QWORD *)v602;
                          do
                          {
                            for (i9 = 0; i9 != v248; ++i9)
                            {
                              if (*(_QWORD *)v602 != v249)
                                objc_enumerationMutation(v247);
                              v251 = *(_QWORD *)(*((_QWORD *)&v601 + 1) + 8 * i9);
                              objc_msgSend(v230, "objectForKey:", v251);
                              v252 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v246, "intersectsSet:", v252))
                                objc_msgSend(v478, "addObject:", v251);

                            }
                            v248 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v601, v768, 16);
                          }
                          while (v248);
                        }

                        v253 = MEMORY[0x1E0C81028];
                        if (v448 >= v447 && objc_msgSend(v470, "count"))
                        {
                          objc_msgSend(v470, "allObjects");
                          v254 = (void *)objc_claimAutoreleasedReturnValue();
                          AddMergeCandidatePersonsForPerson(v442, v254, v505, CFSTR("single training person in level0 cluster - create 'training person : verified person with confirmed face' pair"));

                          v253 = MEMORY[0x1E0C81028];
                        }
                        if ((unint64_t)objc_msgSend(v470, "count") >= 3 && (int)MediaAnalysisLogLevel() >= 3)
                        {
                          v255 = v253;
                          if (os_log_type_enabled(v253, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v787 = 138412290;
                            *(_QWORD *)&v787[4] = v470;
                            _os_log_impl(&dword_1B6C4A000, v253, OS_LOG_TYPE_ERROR, "PersonBuilder: We may have a dirty level0 cluster, verified persons with confirmed face: %@", v787, 0xCu);
                          }

                        }
                        if (v448 >= v447)
                        {
                          while ((unint64_t)objc_msgSend(v470, "count") >= 2)
                          {
                            objc_msgSend(v470, "anyObject");
                            v256 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v470, "removeObject:", v256);
                            objc_msgSend(v470, "allObjects");
                            v257 = (void *)objc_claimAutoreleasedReturnValue();
                            AddMergeCandidatePersonsForPerson(v442, v257, v256, CFSTR("single training person in level0 cluster - create 'verified persons with confirmed face : verified persons with confirmed face' pair"));

                          }
                        }

                        v245 = v505;
                      }
                      if (objc_msgSend(v478, "count"))
                        AddMergeCandidatePersonsForPerson(v475, v478, v245, CFSTR("invalid merge candidate pair because one person has face rejected for the other"));

                    }
                    else
                    {
                      if ((int)MediaAnalysisLogLevel() >= 3)
                      {
                        v194 = v193;
                        if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v787 = 138412290;
                          *(_QWORD *)&v787[4] = v492;
                          _os_log_impl(&dword_1B6C4A000, v193, OS_LOG_TYPE_ERROR, "PersonBuilder: We may have a dirty level0 cluster, persons with training faces: %@", v787, 0xCu);
                        }

                      }
                      objc_msgSend(v492, "allObjects");
                      v195 = (void *)objc_claimAutoreleasedReturnValue();
                      AddMergeCandidatePersonsForPerson(v475, v195, v542, CFSTR("invalid merge candidate pair because we may have a dirty level0 cluster"));

                      v196 = (void *)MEMORY[0x1E0C99E20];
                      objc_msgSend(v526, "objectForKey:", v487);
                      v197 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v197, "set");
                      v198 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v196, "setWithSet:", v198);
                      v505 = (void *)objc_claimAutoreleasedReturnValue();

                      contextc = (void *)-[NSMapTable copy](v519, "copy");
                      objc_msgSend(contextc, "removeObjectForKey:", v542);
                      v620 = 0u;
                      v619 = 0u;
                      v618 = 0u;
                      v617 = 0u;
                      objc_msgSend(contextc, "keyEnumerator");
                      v199 = (void *)objc_claimAutoreleasedReturnValue();
                      v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v617, v772, 16);
                      if (v200)
                      {
                        v201 = *(_QWORD *)v618;
                        do
                        {
                          for (i10 = 0; i10 != v200; ++i10)
                          {
                            if (*(_QWORD *)v618 != v201)
                              objc_enumerationMutation(v199);
                            v203 = *(_QWORD *)(*((_QWORD *)&v617 + 1) + 8 * i10);
                            objc_msgSend(contextc, "objectForKey:", v203);
                            v204 = (void *)objc_claimAutoreleasedReturnValue();
                            v205 = (void *)objc_msgSend(v204, "mutableCopy");

                            objc_msgSend(v205, "intersectSet:", v505);
                            if (objc_msgSend(v205, "count"))
                            {
                              objc_msgSend(exc_buf, "objectForKey:", v203);
                              v206 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!v206)
                              {
                                objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                                v206 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(exc_buf, "setObject:forKey:", v206, v203);
                              }
                              objc_msgSend(v206, "unionSet:", v205);
                              objc_msgSend(v523, "addObject:", v203);

                            }
                          }
                          v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v617, v772, 16);
                        }
                        while (v200);
                      }

                      v615 = 0u;
                      v616 = 0u;
                      v613 = 0u;
                      v614 = 0u;
                      v207 = v543;
                      v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v613, v771, 16);
                      if (v208)
                      {
                        v209 = *(_QWORD *)v614;
                        do
                        {
                          for (i11 = 0; i11 != v208; ++i11)
                          {
                            if (*(_QWORD *)v614 != v209)
                              objc_enumerationMutation(v207);
                            v211 = *(_QWORD *)(*((_QWORD *)&v613 + 1) + 8 * i11);
                            -[NSMapTable objectForKey:](v518, "objectForKey:", v211);
                            v212 = (void *)objc_claimAutoreleasedReturnValue();
                            v213 = (void *)objc_msgSend(v212, "mutableCopy");

                            objc_msgSend(v213, "intersectSet:", v505);
                            if (objc_msgSend(v213, "count"))
                            {
                              objc_msgSend(exc_buf, "objectForKey:", v211);
                              v214 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!v214)
                              {
                                objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                                v214 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(exc_buf, "setObject:forKey:", v214, v211);
                              }
                              objc_msgSend(v214, "unionSet:", v213);
                              objc_msgSend(v523, "addObject:", v211);

                            }
                          }
                          v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v613, v771, 16);
                        }
                        while (v208);
                      }

                      if (v448 < v447)
                      {
                        v413 = 1;
                        goto LABEL_352;
                      }
                      v440 = (void *)objc_msgSend(v492, "mutableCopy");
                      while ((unint64_t)objc_msgSend(v440, "count") >= 2)
                      {
                        objc_msgSend(v440, "anyObject");
                        v258 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v440, "removeObject:", v258);
                        objc_msgSend(v440, "allObjects");
                        v259 = (void *)objc_claimAutoreleasedReturnValue();
                        AddMergeCandidatePersonsForPerson(v442, v259, v258, CFSTR("multiple training persons in level0 cluster - create 'training person : training person' pair"));

                      }
                      v413 = 1;
                    }

LABEL_352:
                    v221 = v505;
                  }
                  else
                  {
                    objc_msgSend(v472, "removeObject:", v487);
                    v628 = 0u;
                    v627 = 0u;
                    v626 = 0u;
                    v625 = 0u;
                    objc_msgSend(v484, "keyEnumerator");
                    v215 = (void *)objc_claimAutoreleasedReturnValue();
                    v216 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v625, v774, 16);
                    if (v216)
                    {
                      v217 = *(_QWORD *)v626;
                      do
                      {
                        for (i12 = 0; i12 != v216; ++i12)
                        {
                          if (*(_QWORD *)v626 != v217)
                            objc_enumerationMutation(v215);
                          v219 = *(_QWORD *)(*((_QWORD *)&v625 + 1) + 8 * i12);
                          objc_msgSend(v520, "objectForKey:", v219);
                          v220 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v220, "removeObject:", v487);
                          if (!objc_msgSend(v220, "count"))
                            objc_msgSend(v520, "removeObjectForKey:", v219);
                          objc_msgSend(v483, "addObject:", v219);

                        }
                        v216 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v625, v774, 16);
                      }
                      while (v216);
                    }

                    v624 = 0u;
                    v623 = 0u;
                    v622 = 0u;
                    v621 = 0u;
                    v221 = v483;
                    v222 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v621, v773, 16);
                    if (v222)
                    {
                      v223 = *(_QWORD *)v622;
                      do
                      {
                        for (i13 = 0; i13 != v222; ++i13)
                        {
                          if (*(_QWORD *)v622 != v223)
                            objc_enumerationMutation(v221);
                          objc_msgSend(v484, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v621 + 1) + 8 * i13));
                        }
                        v222 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v621, v773, 16);
                      }
                      while (v222);
                    }
                  }

                  v185 = 1;
LABEL_354:

                  objc_autoreleasePoolPop(v422);
                  if ((v185 & 1) == 0)
                  {
                    v260 = 1;
                    goto LABEL_568;
                  }
                  continue;
                }
                break;
              }
              v295 = objc_msgSend(v520, "count");
              if (v413 & 1 | (v295 > 3))
              {
                v599 = 0u;
                v600 = 0u;
                v597 = 0u;
                v598 = 0u;
                objc_msgSend(v520, "keyEnumerator");
                v296 = (void *)objc_claimAutoreleasedReturnValue();
                v297 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v597, v767, 16);
                if (v297)
                {
                  v298 = *(_QWORD *)v598;
                  do
                  {
                    for (i14 = 0; i14 != v297; ++i14)
                    {
                      if (*(_QWORD *)v598 != v298)
                        objc_enumerationMutation(v296);
                      v766 = *(_QWORD *)(*((_QWORD *)&v597 + 1) + 8 * i14);
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v766, 1);
                      v300 = (void *)objc_claimAutoreleasedReturnValue();
                      AddMergeCandidatePersonsForPerson(v475, v300, v542, CFSTR("invalid merge candidate pair because we have > 3 verified persons in the face group"));

                    }
                    v297 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v597, v767, 16);
                  }
                  while (v297);
                }

              }
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v520, "count"));
              v493 = (void *)objc_claimAutoreleasedReturnValue();
              v595 = 0u;
              v596 = 0u;
              v593 = 0u;
              v594 = 0u;
              objc_msgSend(v520, "keyEnumerator");
              v301 = (void *)objc_claimAutoreleasedReturnValue();
              v302 = objc_msgSend(v301, "countByEnumeratingWithState:objects:count:", &v593, v765, 16);
              if (v302)
              {
                v303 = *(_QWORD *)v594;
                do
                {
                  for (i15 = 0; i15 != v302; ++i15)
                  {
                    if (*(_QWORD *)v594 != v303)
                      objc_enumerationMutation(v301);
                    objc_msgSend(v493, "addObject:", *(_QWORD *)(*((_QWORD *)&v593 + 1) + 8 * i15));
                  }
                  v302 = objc_msgSend(v301, "countByEnumeratingWithState:objects:count:", &v593, v765, 16);
                }
                while (v302);
              }

              if (!objc_msgSend(v427, "count"))
              {
                if (v295 || objc_msgSend(v483, "count"))
                {
                  if (objc_msgSend(v493, "count") == 1
                    && (objc_msgSend(v493, "anyObject"), (v305 = objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    objc_msgSend(v477, "objectForKey:", v305);
                    v471 = (void *)v305;
                    v419 = (id)objc_claimAutoreleasedReturnValue();

                    v423 = 0;
                  }
                  else
                  {
                    v419 = 0;
                    v471 = 0;
                    v423 = 1;

                  }
                  v417 = objc_msgSend(v419, "count");
                  v583 = 0u;
                  v584 = 0u;
                  v581 = 0u;
                  v582 = 0u;
                  v306 = v534;
                  objc_msgSend(v526, "keyEnumerator");
                  v428 = objc_claimAutoreleasedReturnValue();
                  v441 = -[NSObject countByEnumeratingWithState:objects:count:](v428, "countByEnumeratingWithState:objects:count:", &v581, v762, 16);
                  if (v441)
                  {
                    v432 = *(_QWORD *)v582;
                    do
                    {
                      v481 = 0;
                      do
                      {
                        if (*(_QWORD *)v582 != v432)
                          objc_enumerationMutation(v428);
                        v307 = *(_QWORD *)(*((_QWORD *)&v581 + 1) + 8 * v481);
                        if (v306 && (v306[2](v516) & 1) != 0)
                        {

                          v260 = 1;
                          goto LABEL_566;
                        }
                        objc_msgSend(v495, "objectForKey:", v307);
                        v479 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v472, "containsObject:", v307) & 1) == 0)
                        {
                          if ((v423 & 1) != 0)
                          {
                            v308 = (void *)MEMORY[0x1E0C99E20];
                            objc_msgSend(v526, "objectForKey:", v307);
                            v309 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v309, "set");
                            v310 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v308, "setWithSet:", v310);
                            contextd = (void *)objc_claimAutoreleasedReturnValue();

                            v506 = (void *)-[NSMapTable copy](v519, "copy");
                            objc_msgSend(v495, "objectForKey:", v307);
                            v311 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
                            v467 = v311;
                            if (v311)
                            {
                              v312 = (void *)MEMORY[0x1E0C99E20];
                              NSAllMapTableKeys(v311);
                              v313 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v312, "setWithArray:", v313);
                              v314 = (NSMapTable *)(id)objc_claimAutoreleasedReturnValue();

                              v311 = v314;
                            }
                            v513 = v311;
                            -[NSMapTable intersectSet:](v311, "intersectSet:", v483);
                            objc_msgSend(v506, "removeObjectForKey:", v542);
                            v567 = 0u;
                            v568 = 0u;
                            v565 = 0u;
                            v566 = 0u;
                            v315 = v493;
                            v316 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v565, v758, 16);
                            if (v316)
                            {
                              v317 = *(_QWORD *)v566;
                              do
                              {
                                for (i16 = 0; i16 != v316; ++i16)
                                {
                                  if (*(_QWORD *)v566 != v317)
                                    objc_enumerationMutation(v315);
                                  objc_msgSend(v506, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v565 + 1) + 8 * i16));
                                }
                                v316 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v565, v758, 16);
                              }
                              while (v316);
                            }

                            v563 = 0u;
                            v564 = 0u;
                            v561 = 0u;
                            v562 = 0u;
                            objc_msgSend(v506, "keyEnumerator");
                            v319 = (void *)objc_claimAutoreleasedReturnValue();
                            v320 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v561, v757, 16);
                            if (v320)
                            {
                              v321 = *(_QWORD *)v562;
                              do
                              {
                                for (i17 = 0; i17 != v320; ++i17)
                                {
                                  if (*(_QWORD *)v562 != v321)
                                    objc_enumerationMutation(v319);
                                  v323 = *(_QWORD *)(*((_QWORD *)&v561 + 1) + 8 * i17);
                                  if (objc_msgSend(v513, "containsObject:", v323))
                                  {
                                    -[NSMapTable objectForKey:](v519, "objectForKey:", v323);
                                    v324 = (void *)objc_claimAutoreleasedReturnValue();
                                    v325 = (void *)objc_msgSend(v324, "mutableCopy");

                                    objc_msgSend(v325, "intersectSet:", contextd);
                                    if (objc_msgSend(v325, "count"))
                                    {
                                      objc_msgSend(exc_buf, "objectForKey:", v323);
                                      v326 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (!v326)
                                      {
                                        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                                        v326 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(exc_buf, "setObject:forKey:", v326, v323);
                                      }
                                      objc_msgSend(v326, "unionSet:", v325);
                                      objc_msgSend(v523, "addObject:", v323);

                                    }
                                  }
                                }
                                v320 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v561, v757, 16);
                              }
                              while (v320);
                            }

                            v327 = (void *)objc_msgSend(v543, "mutableCopy");
                            v559 = 0u;
                            v560 = 0u;
                            v557 = 0u;
                            v558 = 0u;
                            v328 = v315;
                            v329 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v557, v756, 16);
                            if (v329)
                            {
                              v330 = *(_QWORD *)v558;
                              do
                              {
                                for (i18 = 0; i18 != v329; ++i18)
                                {
                                  if (*(_QWORD *)v558 != v330)
                                    objc_enumerationMutation(v328);
                                  objc_msgSend(v327, "removeObject:", *(_QWORD *)(*((_QWORD *)&v557 + 1) + 8 * i18));
                                }
                                v329 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v557, v756, 16);
                              }
                              while (v329);
                            }

                            v555 = 0u;
                            v556 = 0u;
                            v553 = 0u;
                            v554 = 0u;
                            v332 = v327;
                            v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v553, v755, 16);
                            if (v333)
                            {
                              v334 = *(_QWORD *)v554;
                              do
                              {
                                for (i19 = 0; i19 != v333; ++i19)
                                {
                                  if (*(_QWORD *)v554 != v334)
                                    objc_enumerationMutation(v332);
                                  v336 = *(_QWORD *)(*((_QWORD *)&v553 + 1) + 8 * i19);
                                  if (objc_msgSend(v513, "containsObject:", v336))
                                  {
                                    -[NSMapTable objectForKey:](v518, "objectForKey:", v336);
                                    v337 = (void *)objc_claimAutoreleasedReturnValue();
                                    v338 = (void *)objc_msgSend(v337, "mutableCopy");

                                    objc_msgSend(v338, "intersectSet:", contextd);
                                    if (objc_msgSend(v338, "count"))
                                    {
                                      objc_msgSend(exc_buf, "objectForKey:", v336);
                                      v339 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (!v339)
                                      {
                                        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                                        v339 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(exc_buf, "setObject:forKey:", v339, v336);
                                      }
                                      objc_msgSend(v339, "unionSet:", v338);
                                      objc_msgSend(v523, "addObject:", v336);

                                    }
                                  }
                                }
                                v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v553, v755, 16);
                              }
                              while (v333);
                            }

                            goto LABEL_541;
                          }
                          objc_msgSend(v479, "objectForKey:", v471);
                          contextd = (void *)objc_claimAutoreleasedReturnValue();
                          v340 = (void *)MEMORY[0x1E0C99E20];
                          objc_msgSend(v526, "objectForKey:", v307);
                          v341 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v341, "set");
                          v342 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v340, "setWithSet:", v342);
                          v506 = (void *)objc_claimAutoreleasedReturnValue();

                          -[NSMapTable objectForKey:](v519, "objectForKey:", v471);
                          v467 = (void *)objc_claimAutoreleasedReturnValue();
                          v343 = MEMORY[0x1E0C81028];
                          if (objc_msgSend(contextd, "count"))
                          {
                            objc_msgSend(exc_buf, "objectForKey:", v471);
                            v513 = (id)objc_claimAutoreleasedReturnValue();
                            if (!v513)
                            {
                              objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                              v513 = (id)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(exc_buf, "setObject:forKey:", v513, v471);
                            }
                            objc_msgSend(v506, "intersectSet:", v467);
                            objc_msgSend(v513, "unionSet:", v506);
                            objc_msgSend(v523, "addObject:", v471);
                            if ((int)MediaAnalysisLogLevel() >= 6)
                            {
                              v344 = v343;
                              if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)v787 = 138412290;
                                *(_QWORD *)&v787[4] = v506;
                                _os_log_impl(&dword_1B6C4A000, v343, OS_LOG_TYPE_INFO, "PersonBuilder: Found training rejection, unassigned faces on trainingPersonLocalIdentifier in level0 cluster: %@", v787, 0xCu);
                              }

                            }
                            goto LABEL_541;
                          }
                          if (v417)
                          {
                            if ((int)MediaAnalysisLogLevel() >= 6)
                            {
                              v345 = v343;
                              if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)v787 = 138412290;
                                *(_QWORD *)&v787[4] = v471;
                                _os_log_impl(&dword_1B6C4A000, v343, OS_LOG_TYPE_INFO, "PersonBuilder: Skip processing level0 cluster since we have rejected face for training person '%@' in level1 cluster", v787, 0xCu);
                              }

                            }
                          }
                          else
                          {
                            -[NSMapTable objectForKey:](v476, "objectForKey:", v471);
                            v513 = (id)objc_claimAutoreleasedReturnValue();
                            -[NSMapTable objectForKey:](v63, "objectForKey:", v471);
                            v346 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v346, "valueForKey:", CFSTR("clusterSequenceNumber"));
                            v415 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v482, "objectForKey:", v307);
                            v347 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v347, "objectForKey:", v471);
                            v412 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                            v488 = (void *)objc_claimAutoreleasedReturnValue();
                            v348 = (void *)objc_msgSend(v506, "mutableCopy");
                            objc_msgSend(v348, "intersectSet:", v467);
                            if (objc_msgSend(v348, "count"))
                            {
                              v579 = 0u;
                              v580 = 0u;
                              v577 = 0u;
                              v578 = 0u;
                              objc_msgSend(v347, "keyEnumerator");
                              v349 = (void *)objc_claimAutoreleasedReturnValue();
                              v350 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v577, v761, 16);
                              if (v350)
                              {
                                v351 = *(_QWORD *)v578;
                                do
                                {
                                  for (i20 = 0; i20 != v350; ++i20)
                                  {
                                    if (*(_QWORD *)v578 != v351)
                                      objc_enumerationMutation(v349);
                                    v353 = *(_QWORD *)(*((_QWORD *)&v577 + 1) + 8 * i20);
                                    objc_msgSend(v347, "objectForKey:", v353);
                                    v354 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (objc_msgSend(v348, "intersectsSet:", v354))
                                      objc_msgSend(v488, "addObject:", v353);

                                  }
                                  v350 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v577, v761, 16);
                                }
                                while (v350);
                              }

                            }
                            objc_msgSend(v506, "minusSet:", v348);
                            objc_msgSend(v506, "minusSet:", v513);
                            objc_msgSend(v506, "minusSet:", v415);
                            objc_msgSend(v506, "minusSet:", v412);
                            objc_msgSend(MEMORY[0x1E0C99E20], "set");
                            v485 = (void *)objc_claimAutoreleasedReturnValue();
                            v411 = (void *)-[NSMapTable copy](v476, "copy");
                            objc_msgSend(v411, "removeObjectForKey:", v471);
                            v575 = 0u;
                            v576 = 0u;
                            v573 = 0u;
                            v574 = 0u;
                            -[NSMapTable keyEnumerator](v476, "keyEnumerator");
                            v355 = (void *)objc_claimAutoreleasedReturnValue();
                            v356 = objc_msgSend(v355, "countByEnumeratingWithState:objects:count:", &v573, v760, 16);
                            if (v356)
                            {
                              v357 = *(_QWORD *)v574;
                              do
                              {
                                for (i21 = 0; i21 != v356; ++i21)
                                {
                                  if (*(_QWORD *)v574 != v357)
                                    objc_enumerationMutation(v355);
                                  v359 = *(_QWORD *)(*((_QWORD *)&v573 + 1) + 8 * i21);
                                  -[NSMapTable objectForKey:](v476, "objectForKey:", v359);
                                  v360 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (objc_msgSend(v360, "count")
                                    && objc_msgSend(v360, "intersectsSet:", v506))
                                  {
                                    objc_msgSend(v485, "addObject:", v359);
                                    objc_msgSend(v506, "minusSet:", v360);
                                  }

                                }
                                v356 = objc_msgSend(v355, "countByEnumeratingWithState:objects:count:", &v573, v760, 16);
                              }
                              while (v356);
                            }

                            if (objc_msgSend(v506, "count"))
                            {
                              objc_msgSend(v473, "objectForKey:", v471);
                              v361 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!v361)
                              {
                                objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                                v361 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v473, "setObject:forKey:", v361, v471);
                              }
                              objc_msgSend(v361, "unionSet:", v506);
                              objc_msgSend(v523, "addObject:", v471);
                              v571 = 0u;
                              v572 = 0u;
                              v569 = 0u;
                              v570 = 0u;
                              objc_msgSend(v347, "keyEnumerator");
                              v362 = (void *)objc_claimAutoreleasedReturnValue();
                              v363 = objc_msgSend(v362, "countByEnumeratingWithState:objects:count:", &v569, v759, 16);
                              if (v363)
                              {
                                v364 = *(_QWORD *)v570;
                                do
                                {
                                  for (i22 = 0; i22 != v363; ++i22)
                                  {
                                    if (*(_QWORD *)v570 != v364)
                                      objc_enumerationMutation(v362);
                                    v366 = *(_QWORD *)(*((_QWORD *)&v569 + 1) + 8 * i22);
                                    objc_msgSend(v347, "objectForKey:", v366);
                                    v367 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (objc_msgSend(v361, "intersectsSet:", v367))
                                      objc_msgSend(v488, "addObject:", v366);

                                  }
                                  v363 = objc_msgSend(v362, "countByEnumeratingWithState:objects:count:", &v569, v759, 16);
                                }
                                while (v363);
                              }

                              if (v448 >= v447)
                              {
                                v368 = v485;
                                if (objc_msgSend(v485, "count"))
                                {
                                  objc_msgSend(v485, "allObjects");
                                  v369 = (void *)objc_claimAutoreleasedReturnValue();
                                  AddMergeCandidatePersonsForPerson(v442, v369, v471, CFSTR("single training person in level1 cluster - create 'training person : verified person with confirmed face' pair"));
                                  goto LABEL_545;
                                }
                                while ((unint64_t)objc_msgSend(v368, "count") >= 2)
                                {
                                  objc_msgSend(v485, "anyObject");
                                  v369 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v485, "removeObject:", v369);
                                  objc_msgSend(v485, "allObjects");
                                  v370 = (void *)objc_claimAutoreleasedReturnValue();
                                  AddMergeCandidatePersonsForPerson(v442, v370, v369, CFSTR("single training person in level1 cluster - create 'verified persons with confirmed face : verified persons with confirmed face' pair"));

LABEL_545:
                                  v368 = v485;
                                }
                              }

                            }
                            if (objc_msgSend(v488, "count"))
                              AddMergeCandidatePersonsForPerson(v475, v488, v471, CFSTR("invalid merge candidate pair because one person has face rejected for the other"));

LABEL_541:
                          }

                        }
                        ++v481;
                        v306 = v534;
                      }
                      while (v481 != v441);
                      v371 = -[NSObject countByEnumeratingWithState:objects:count:](v428, "countByEnumeratingWithState:objects:count:", &v581, v762, 16);
                      v441 = v371;
                    }
                    while (v371);
                  }
                  v431 = v419;
                  v372 = v428;
LABEL_554:

                }
                else
                {
                  v471 = (void *)-[NSMapTable copy](v519, "copy");
                  objc_msgSend(v471, "removeObjectForKey:", v542);
                  v591 = 0u;
                  v592 = 0u;
                  v589 = 0u;
                  v590 = 0u;
                  objc_msgSend(v471, "keyEnumerator");
                  v395 = (void *)objc_claimAutoreleasedReturnValue();
                  v396 = objc_msgSend(v395, "countByEnumeratingWithState:objects:count:", &v589, v764, 16);
                  if (v396)
                  {
                    v397 = *(_QWORD *)v590;
                    do
                    {
                      for (i23 = 0; i23 != v396; ++i23)
                      {
                        if (*(_QWORD *)v590 != v397)
                          objc_enumerationMutation(v395);
                        v399 = *(_QWORD *)(*((_QWORD *)&v589 + 1) + 8 * i23);
                        -[NSMapTable objectForKey:](v519, "objectForKey:", v399);
                        v400 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v400, "count"))
                        {
                          objc_msgSend(exc_buf, "objectForKey:", v399);
                          v401 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v401)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                            v401 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(exc_buf, "setObject:forKey:", v401, v399);
                          }
                          objc_msgSend(v401, "unionSet:", v400);
                          objc_msgSend(v523, "addObject:", v399);

                        }
                      }
                      v396 = objc_msgSend(v395, "countByEnumeratingWithState:objects:count:", &v589, v764, 16);
                    }
                    while (v396);
                  }

                  v587 = 0u;
                  v588 = 0u;
                  v585 = 0u;
                  v586 = 0u;
                  v402 = v543;
                  v403 = objc_msgSend(v402, "countByEnumeratingWithState:objects:count:", &v585, v763, 16);
                  if (v403)
                  {
                    v404 = *(_QWORD *)v586;
                    do
                    {
                      for (i24 = 0; i24 != v403; ++i24)
                      {
                        if (*(_QWORD *)v586 != v404)
                          objc_enumerationMutation(v402);
                        v406 = *(_QWORD *)(*((_QWORD *)&v585 + 1) + 8 * i24);
                        -[NSMapTable objectForKey:](v518, "objectForKey:", v406);
                        v407 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v407, "count"))
                        {
                          objc_msgSend(exc_buf, "objectForKey:", v406);
                          v408 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v408)
                          {
                            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                            v408 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(exc_buf, "setObject:forKey:", v408, v406);
                          }
                          objc_msgSend(v408, "unionSet:", v407);
                          objc_msgSend(v523, "addObject:", v406);

                        }
                      }
                      v403 = objc_msgSend(v402, "countByEnumeratingWithState:objects:count:", &v585, v763, 16);
                    }
                    while (v403);
                  }

                  v372 = MEMORY[0x1E0C81028];
                  if (objc_msgSend(exc_buf, "count") && (int)MediaAnalysisLogLevel() >= 4)
                  {
                    v409 = v372;
                    if (os_log_type_enabled(v372, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v787 = 138412546;
                      *(_QWORD *)&v787[4] = v466;
                      *(_WORD *)&v787[12] = 2112;
                      *(_QWORD *)&v787[14] = exc_buf;
                      _os_log_impl(&dword_1B6C4A000, v372, OS_LOG_TYPE_DEFAULT, "PersonBuilder: Unnamed unconfirmed faces in face group, '%@', without a training face: %@", v787, 0x16u);
                    }
                    goto LABEL_554;
                  }
                }

              }
              if ((unint64_t)objc_msgSend(v493, "count") > 3)
                goto LABEL_563;
              if (v448 >= v447)
              {
                v373 = (void *)objc_msgSend(v493, "mutableCopy");
                while ((unint64_t)objc_msgSend(v373, "count") >= 2)
                {
                  objc_msgSend(v373, "anyObject");
                  v374 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v373, "removeObject:", v374);
                  objc_msgSend(v373, "allObjects");
                  v375 = (void *)objc_claimAutoreleasedReturnValue();
                  AddMergeCandidatePersonsForPerson(v442, v375, v374, CFSTR("level1 cluster - create 'training person : training person' pair"));

                }
              }
              if ((v413 & 1) != 0)
              {
LABEL_563:
                v260 = 0;
              }
              else
              {
                objc_msgSend(v493, "allObjects");
                v471 = (void *)objc_claimAutoreleasedReturnValue();
                AddMergeCandidatePersonsForPerson(v442, v471, v542, CFSTR("level1 cluster - create 'unverifed person : training person' pair"));
                v260 = 0;
                v419 = v431;
LABEL_566:

                v431 = v419;
              }

LABEL_568:
LABEL_569:

              goto LABEL_570;
            }
            objc_msgSend(v473, "objectForKey:", v508);
            v515 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v515)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
              v515 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v473, "setObject:forKey:", v515, v508);
            }
            -[NSMapTable objectForKey:](v519, "objectForKey:", v542);
            v517 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v433, "count"))
              objc_msgSend(v517, "minusSet:", v433);
            if (objc_msgSend(v517, "count"))
            {
              objc_msgSend(v515, "unionSet:", v517);
              objc_msgSend(v523, "addObject:", v508);
            }
            v527 = (void *)-[NSMapTable copy](v519, "copy");
            objc_msgSend(v527, "removeObjectForKey:", v542);
            objc_msgSend(v527, "removeObjectForKey:", v508);
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v538 = (void *)objc_claimAutoreleasedReturnValue();
            v676 = 0u;
            v675 = 0u;
            v674 = 0u;
            v673 = 0u;
            objc_msgSend(v527, "keyEnumerator");
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v673, v794, 16);
            if (v262)
            {
              v263 = *(_QWORD *)v674;
              do
              {
                for (i25 = 0; i25 != v262; ++i25)
                {
                  if (*(_QWORD *)v674 != v263)
                    objc_enumerationMutation(v261);
                  v265 = *(_QWORD *)(*((_QWORD *)&v673 + 1) + 8 * i25);
                  objc_msgSend(v527, "objectForKey:", v265);
                  v266 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v266, "count"))
                  {
                    objc_msgSend(exc_buf, "objectForKey:", v265);
                    v267 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v267)
                    {
                      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                      v267 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(exc_buf, "setObject:forKey:", v267, v265);
                    }
                    objc_msgSend(v267, "unionSet:", v266);
                    objc_msgSend(v538, "addObject:", v265);
                    objc_msgSend(v523, "addObject:", v265);

                  }
                }
                v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v673, v794, 16);
              }
              while (v262);
            }

            v672 = 0u;
            v671 = 0u;
            v670 = 0u;
            v669 = 0u;
            objc_msgSend(v474, "keyEnumerator");
            v268 = (void *)objc_claimAutoreleasedReturnValue();
            v521 = v268;
            v269 = 0;
            v270 = 0;
            v271 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v669, v793, 16);
            if (!v271)
            {
LABEL_398:

              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v284 = MEMORY[0x1E0C81028];
                v285 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v284, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v787 = 134218240;
                  *(_QWORD *)&v787[4] = v270;
                  *(_WORD *)&v787[12] = 2048;
                  *(_QWORD *)&v787[14] = v269;
                  _os_log_impl(&dword_1B6C4A000, v284, OS_LOG_TYPE_INFO, "PersonBuilder: Quick classification face: %lu retained, %lu reassigned", v787, 0x16u);
                }

              }
              v286 = (void *)objc_msgSend(v543, "mutableCopy");
              objc_msgSend(v286, "removeObject:", v508);
              v668 = 0u;
              v667 = 0u;
              v666 = 0u;
              v665 = 0u;
              v287 = v286;
              v288 = objc_msgSend(v287, "countByEnumeratingWithState:objects:count:", &v665, v792, 16);
              if (v288)
              {
                v289 = *(_QWORD *)v666;
                do
                {
                  for (i26 = 0; i26 != v288; ++i26)
                  {
                    if (*(_QWORD *)v666 != v289)
                      objc_enumerationMutation(v287);
                    v291 = *(_QWORD *)(*((_QWORD *)&v665 + 1) + 8 * i26);
                    -[NSMapTable objectForKey:](v518, "objectForKey:", v291);
                    v292 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v292, "count"))
                    {
                      objc_msgSend(exc_buf, "objectForKey:", v291);
                      v293 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v293)
                      {
                        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                        v293 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(exc_buf, "setObject:forKey:", v293, v291);
                      }
                      objc_msgSend(v293, "unionSet:", v292);
                      objc_msgSend(v538, "addObject:", v291);
                      objc_msgSend(v523, "addObject:", v291);

                    }
                  }
                  v288 = objc_msgSend(v287, "countByEnumeratingWithState:objects:count:", &v665, v792, 16);
                }
                while (v288);
              }

              if (objc_msgSend(v538, "count"))
              {
                v791 = v508;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v791, 1);
                v294 = (void *)objc_claimAutoreleasedReturnValue();
                AddMergeCandidatePersonsForPerson(v442, v294, v542, CFSTR("all training faces on single verified person in level1 cluster - create 'unverified person : training person' candidate pair"));

                if (objc_msgSend(v538, "count") == 1)
                {
                  AddMergeCandidatePersonsForPerson(v442, v538, v542, CFSTR("all training faces on single verified person in level1 cluster - create 'unverified person : verified person' candidate pair"));
                  if (v448 >= v447)
                    AddMergeCandidatePersonsForPerson(v442, v538, v508, CFSTR("all training faces on single verified person in level1 cluster - create 'training person : verified person' candidate pair"));
                }
              }

              goto LABEL_573;
            }
            v272 = *(_QWORD *)v670;
            while (2)
            {
              v273 = 0;
LABEL_379:
              if (*(_QWORD *)v670 != v272)
                objc_enumerationMutation(v521);
              v274 = *(void **)(*((_QWORD *)&v669 + 1) + 8 * v273);
              objc_msgSend(v474, "objectForKey:", v274);
              v275 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v275, "count"))
              {
                if (objc_msgSend(v274, "isEqualToString:", v508))
                {
                  objc_msgSend(v473, "objectForKey:", v508);
                  v276 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v276)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                    v276 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v473, "setObject:forKey:", v276, v508);
                  }
                  objc_msgSend(v276, "unionSet:", v275);
                  objc_msgSend(v523, "addObject:", v508);
                  v270 += objc_msgSend(v275, "count");
                  if ((int)MediaAnalysisLogLevel() >= 6)
                  {
                    v277 = MEMORY[0x1E0C81028];
                    v278 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
                    {
                      v279 = objc_msgSend(v275, "count");
                      *(_DWORD *)v787 = 134218242;
                      *(_QWORD *)&v787[4] = v279;
                      *(_WORD *)&v787[12] = 2112;
                      *(_QWORD *)&v787[14] = v275;
                      v280 = v277;
                      v281 = "%lu Quick classification face to retain: %@";
                      goto LABEL_393;
                    }
                    goto LABEL_394;
                  }
                }
                else
                {
                  objc_msgSend(exc_buf, "objectForKey:", v274);
                  v276 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v276)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
                    v276 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(exc_buf, "setObject:forKey:", v276, v274);
                  }
                  objc_msgSend(v276, "unionSet:", v275);
                  objc_msgSend(v523, "addObject:", v274);
                  v269 += objc_msgSend(v275, "count");
                  if ((int)MediaAnalysisLogLevel() >= 6)
                  {
                    v277 = MEMORY[0x1E0C81028];
                    v282 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
                    {
                      v283 = objc_msgSend(v275, "count");
                      *(_DWORD *)v787 = 134218242;
                      *(_QWORD *)&v787[4] = v283;
                      *(_WORD *)&v787[12] = 2112;
                      *(_QWORD *)&v787[14] = v275;
                      v280 = v277;
                      v281 = "%lu Quick classification face to reassign: %@";
LABEL_393:
                      _os_log_impl(&dword_1B6C4A000, v280, OS_LOG_TYPE_INFO, v281, v787, 0x16u);
                    }
LABEL_394:

                  }
                }

              }
              if (v271 == ++v273)
              {
                v268 = v521;
                v271 = objc_msgSend(v521, "countByEnumeratingWithState:objects:count:", &v669, v793, 16);
                if (!v271)
                  goto LABEL_398;
                continue;
              }
              goto LABEL_379;
            }
          }
          v58 = 1;
LABEL_608:
          objc_autoreleasePoolPop(v460);
          if (v58 != 15 && v58)
            goto LABEL_639;
          ++v469;
        }
        while (v469 != v453);
        v410 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v732, v804, 16);
        v453 = v410;
      }
      while (v410);
    }
LABEL_639:

  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v787 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PersonBuilder: Got a 'nil' photoLibrary. Cannot build persons", v787, 2u);
  }

}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke(uint64_t a1, _BYTE *a2)
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = (void *)objc_msgSend(v4, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1BCCA1B2C](v8);
        v14 = *(_QWORD *)(a1 + 48);
        if (v14 && (*(unsigned int (**)(uint64_t))(v14 + 16))(v14))
        {
          v15 = 0;
          if (a2)
            *a2 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v12, v6, (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CD1560], "creationRequestForFaceGroup");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addFaces:", v16);
            objc_msgSend(v17, "setPersonBuilderState:", 1);

          }
          v15 = 1;
        }
        objc_autoreleasePoolPop(v13);
        if (!v15)
        {

          goto LABEL_18;
        }
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CD1560], "deleteFaceGroups:", *(_QWORD *)(a1 + 40));
LABEL_18:

}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_461(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1BCCA1B2C]();
  v10 = *(_QWORD *)(a1 + 72);
  if (v10 && (*(unsigned int (**)(void))(v10 + 16))())
  {
    *a4 = 1;
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v15 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_getRejectedTrainingFaceCSNs:rejectedFaceCSNs:rejectedPersonLocalIdentifiers:forPerson:faceInFaceGroupByCSN:", &v17, &v16, &v15, v7, *(_QWORD *)(a1 + 40));
    v11 = v17;
    v12 = v16;
    v13 = v15;
    if (objc_msgSend(v11, "count"))
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v11, v8);
    if (objc_msgSend(v12, "count"))
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v12, v8);
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:");
      }
      objc_msgSend(v14, "unionSet:", v13);

    }
  }
  objc_autoreleasePoolPop(v9);

}

uint64_t __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "minusSet:", *(_QWORD *)(a1 + 40));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "person1LocalIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "person2LocalIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "containsObject:", v10))
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 64), "_completePersonBuildingWithPersonsToUpdate:facesToRemoveByPerson:facesToAddByPerson:updateFaceGroup:newMergeCandidatePairs:newInvalidMergeCandidatePairs:faceInFaceGroupByCSN:personCache:keyFaceUpdateBlock:cancelOrExtendTimeoutBlock:context:error:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 120), a2, (_QWORD)v13);
}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_479(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __135__VCPPhotosPersistenceDelegate__buildPersonsFromUpdatedFaceGroups_faceClusterer_keyFaceUpdateBlock_cancelOrExtendTimeoutBlock_context___block_invoke_504(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "keyEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "intersectsSet:", v8))
          objc_msgSend(v6, "addObject:", v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)buildPersonWithFaceClusterer:(id)a3 keyFaceUpdateBlock:(id)a4 context:(id)a5 cancelOrExtendTimeoutBlock:(id)a6
{
  NSMapTable *v9;
  void *v10;
  id WeakRetained;
  id v12;
  int v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  double Current;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  qos_class_t v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  char v45;
  char *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id *location;
  id v52;
  void *v54;
  void *v55;
  void *context;
  void *v57;
  uint64_t (**v58)(void);
  id v59;
  _QWORD v60[4];
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  id v65;
  _QWORD v66[8];
  _QWORD v67[10];

  v67[8] = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v48 = a4;
  v49 = a5;
  v58 = (uint64_t (**)(void))a6;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v63 = "-[VCPPhotosPersistenceDelegate buildPersonWithFaceClusterer:keyFaceUpdateBlock:context:cancelOrExtendTimeoutBlock:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonBuilder: ---> buildPersonWithFaceClusterer, %s", buf, 0xCu);
  }
  if (!v58 || (v58[2]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "becomeCurrentWithPendingUnitCount:", 1);
    if ((objc_msgSend(v49, "personBuildingDisabled") & 1) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonBuilder: Person Building is Disabled!", buf, 2u);
      }
      -[VCPPhotosPersistenceDelegate _updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:fetchLimit:](self, "_updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:fetchLimit:", v58, 0);
      v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectEnumerator](v9, "objectEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __115__VCPPhotosPersistenceDelegate_buildPersonWithFaceClusterer_keyFaceUpdateBlock_context_cancelOrExtendTimeoutBlock___block_invoke;
      v60[3] = &unk_1E6B15468;
      v12 = v10;
      v61 = v12;
      v59 = 0;
      v13 = objc_msgSend(WeakRetained, "performChangesAndWait:error:", v60, &v59);
      v14 = v59;

      if (v13)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          NSAllMapTableKeys(v9);
          v15 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v15;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonBuilder: Cleared personBuilderState of faceGroups: %@", buf, 0xCu);

        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSAllMapTableKeys(v9);
        v46 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v63 = v46;
        v64 = 2112;
        v65 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PersonBuilder: Failed to clear personBuilderState of faceGroups: %@, error: %@", buf, 0x16u);

      }
    }
    else
    {
      location = (id *)&self->_photoLibrary;
      do
      {
        context = (void *)MEMORY[0x1BCCA1B2C]();
        -[VCPPhotosPersistenceDelegate _updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:fetchLimit:](self, "_updatedFaceGroupByFGLocalIdentifierFromClusterCSNs:fetchLimit:", v58, 500);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v57, "count");
        if (v16)
        {
          v17 = mach_absolute_time();
          VCPSignPostLog();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = os_signpost_id_generate(v18);

          VCPSignPostLog();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCPFaceProcessingBuildPersonsCoreAnalyticsCollection", ", buf, 2u);
          }

          v22 = objc_msgSend(v52, "clusteredFaceCount");
          v23 = objc_msgSend(v52, "clusterCount");
          v24 = objc_msgSend(v57, "count");
          v25 = objc_loadWeakRetained(location);
          v26 = objc_msgSend(v25, "vcp_assetCountForTaskID:", 3);

          v27 = objc_loadWeakRetained(location);
          objc_msgSend(v27, "librarySpecificFetchOptions");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v55, "setShouldPrefetchCount:", 1);
          objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithOptions:", v55);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          VCPSignPostLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_END, v19, "VCPFaceProcessingBuildPersonsCoreAnalyticsCollection", ", buf, 2u);
          }

          if (v17)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          Current = CFAbsoluteTimeGetCurrent();
          -[VCPPhotosPersistenceDelegate _buildPersonsFromUpdatedFaceGroups:faceClusterer:keyFaceUpdateBlock:cancelOrExtendTimeoutBlock:context:](self, "_buildPersonsFromUpdatedFaceGroups:faceClusterer:keyFaceUpdateBlock:cancelOrExtendTimeoutBlock:context:", v57, v52, v48, v58, v49);
          v33 = CFAbsoluteTimeGetCurrent();
          +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = CFSTR("BuildingInterval");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33 - Current);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v67[0] = v50;
          v66[1] = CFSTR("BuildingSequence");
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "description");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v67[1] = v35;
          v66[2] = CFSTR("ClusterCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v67[2] = v36;
          v66[3] = CFSTR("ClusterFaceCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v67[3] = v37;
          v66[4] = CFSTR("FaceGroupCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v67[4] = v38;
          v66[5] = CFSTR("FaceGroupCountNeedToBuild");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v67[5] = v39;
          v66[6] = CFSTR("ProcessingQoS");
          v40 = qos_class_self();
          VCPMAQoSDescription(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v67[6] = v41;
          v66[7] = CFSTR("TotalAssetCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v67[7] = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 8);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.photos.personbuilding"), v43);

        }
        v44 = v58 && (v58[2]() & 1) != 0;

        objc_autoreleasePoolPop(context);
        if (v16)
          v45 = v44;
        else
          v45 = 1;
      }
      while ((v45 & 1) == 0);
    }
    objc_msgSend(v47, "resignCurrent");
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonBuilder: <--- buildPersonWithFaceClusterer", buf, 2u);
    }

  }
}

void __115__VCPPhotosPersistenceDelegate_buildPersonWithFaceClusterer_keyFaceUpdateBlock_context_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v4), (_QWORD)v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPersonBuilderState:", 0);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v2);
  }

}

- (id)keyFaceForPerson:(id)a3 qualityMeasureByFace:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__VCPPhotosPersistenceDelegate_keyFaceForPerson_qualityMeasureByFace_updateBlock___block_invoke;
  v12[3] = &unk_1E6B182A8;
  v13 = v8;
  v9 = v8;
  -[VCPPhotosPersistenceDelegate bestRepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:](self, "bestRepresentativeFaceForPerson:qualityMeasureByFace:candidateFaces:cancelOrExtendTimeoutBlock:", a3, a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __82__VCPPhotosPersistenceDelegate_keyFaceForPerson_qualityMeasureByFace_updateBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v2;

  v2 = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    (*(void (**)(uint64_t, char *, float))(result + 16))(result, &v2, -1.0);
    return v2 != 0;
  }
  return result;
}

- (id)suggestedMeIdentifierWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(getPGPNGraphHelperClass(), "suggestedMeIdentifierWithPersonClusterManager:forPersons:updateBlock:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)performSocialGroupsIdentifiersWithPersonClusterManager:(id)a3 forPersons:(id)a4 overTheYearsComputation:(BOOL)a5 updateBlock:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v7)
    objc_msgSend(getPGPNGraphHelperClass(), "socialGroupsOverTheYearsWithPersonClusterManager:forPersons:updateBlock:", v9, v10, v11);
  else
    objc_msgSend(getPGPNGraphHelperClass(), "multiLevelSocialGroupsWithPersonClusterManager:forPersons:updateBlock:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)densityClusteringForObjects:(id)a3 maximumDistance:(double)a4 minimumNumberOfObjects:(unint64_t)a5 withDistanceBlock:(id)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a3;
  v10 = a6;
  objc_msgSend(getPGPNGraphHelperClass(), "densityClusteringForObjects:maximumDistance:minimumNumberOfObjects:withDistanceBlock:", v9, a5, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchFaceWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v9 = (void *)objc_msgSend(v7, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

    v10 = (void *)MEMORY[0x1E0CD1520];
    v22 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchFacesWithLocalIdentifiers:options:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count");
    if (v13 == 1)
    {
      objc_msgSend(v12, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fetched %lu faces for %@"), v13, v6, *MEMORY[0x1E0CB2D50]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v14 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_10;
    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceLocalIdentifier is nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v12);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v14;
}

- (id)fetchFaceWithClusterSequenceNumber:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v9 = (void *)objc_msgSend(v7, "newAllFacesFetchOptionsWithPhotoLibrary:", WeakRetained);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clusterSequenceNumber = %ld"), objc_msgSend(v6, "longValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);

    v11 = *MEMORY[0x1E0CD1B80];
    v23[0] = *MEMORY[0x1E0CD1B70];
    v23[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v12);

    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    if (v14 == 1)
    {
      objc_msgSend(v13, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fetched %lu faces for %@"), v14, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      goto LABEL_10;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clusterSequenceNumber is nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v13);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v15;
}

- (id)fetchPersonWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CD16C8];
    v20 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchPersonsWithLocalIdentifiers:options:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "count");
    if (v12 == 1)
    {
      objc_msgSend(v11, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_10;
    }
    if (!a5)
      goto LABEL_9;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fetched %lu persons for %@"), v12, v7, *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    a5 = 0;
    goto LABEL_9;
  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("personLocalIdentifier is nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_10:

  return a5;
}

+ (id)newVerifiedPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType = %d) OR (verifiedType = %d)"), 1, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(v3, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v3, "setIncludeTorsoOnlyPerson:", 1);
  return v3;
}

- (BOOL)removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t (**v9)(_QWORD);
  PHPhotoLibrary **p_photoLibrary;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  id obj;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (**)(_QWORD))a4;
  p_photoLibrary = &self->_photoLibrary;
  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  v46 = v8;
  if (WeakRetained)
  {
    v43 = a5;
    v12 = (void *)objc_opt_class();
    v13 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v14 = objc_msgSend(v12, "newVerifiedPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:", v13);

    v44 = (void *)v14;
    if (objc_msgSend(v8, "count"))
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v8, v14);
    else
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_class();
    v21 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v50 = (void *)objc_msgSend(v20, "newAllPersonsFetchOptionsWithPhotoLibrary:", v21);

    v22 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    objc_msgSend(v22, "librarySpecificFetchOptions");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_opt_class();
    v24 = objc_loadWeakRetained((id *)&self->_photoLibrary);
    v52 = (void *)objc_msgSend(v23, "newAllFacesFetchOptionsWithPhotoLibrary:", v24);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(manual = 0) AND ((nameSource = %d) OR (nameSource = %d) OR (nameSource = %d)) AND ((trainingType = %d) OR (trainingType = nil))"), 0, 2, 4, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setPredicate:", v25);

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v45;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v26)
    {
      v47 = 0;
      v27 = *(_QWORD *)v59;
LABEL_13:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v59 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v28);
        v30 = (void *)MEMORY[0x1BCCA1B2C]();
        if (v9 && (v9[2](v9) & 1) != 0)
        {
          v31 = 0;
          v47 = 1;
        }
        else
        {
          v32 = objc_loadWeakRetained((id *)p_photoLibrary);
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __135__VCPPhotosPersistenceDelegate_removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding_cancelOrExtendTimeoutBlock_error___block_invoke;
          v54[3] = &unk_1E6B180E8;
          v54[4] = v29;
          v55 = v52;
          v56 = v50;
          v57 = v51;
          v53 = 0;
          v33 = objc_msgSend(v32, "performChangesAndWait:error:", v54, &v53);
          v34 = v53;

          if ((v33 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v29, "localIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v67 = v35;
              v68 = 2112;
              v69 = v34;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to remove auto-assigned faces from person '%@', error: %@", buf, 0x16u);

            }
            objc_msgSend(v29, "localIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addObject:", v36);

          }
          v31 = 1;
        }
        objc_autoreleasePoolPop(v30);
        if (!v31)
          break;
        if (v26 == ++v28)
        {
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
          if (v26)
            goto LABEL_13;
          break;
        }
      }

      if ((v47 & 1) != 0)
      {
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v64 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation to remove faces from verified persons has been canceled"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
    }
    else
    {

    }
    if (!objc_msgSend(v48, "count"))
    {
      v19 = 1;
      goto LABEL_35;
    }
    v41 = (void *)MEMORY[0x1E0CB35C8];
    v62 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to removed faces from person with localIdentifiers '%@'"), v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
    *v43 = v40;

    v19 = 0;
LABEL_35:

    goto LABEL_36;
  }
  if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got a 'nil' photoLibrary. Cannot remove auto assigned faces"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a5;
    v72[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v18);
    *v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got a 'nil' photoLibrary. Cannot remove auto assigned faces", buf, 2u);
  }
  v19 = 0;
LABEL_36:

  return v19;
}

void __135__VCPPhotosPersistenceDelegate_removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding_cancelOrExtendTimeoutBlock_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchMergeCandidatePersonsForPerson:options:", a1[4], a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "count");
  if (v4 | objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFaces:", v2);
    objc_msgSend(v5, "removeMergeCandidatePersons:", v3);

  }
  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", a1[4], a1[7]);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CD1560], "changeRequestForFaceGroup:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPersonBuilderState:", 1);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)personBuilderMergeCandidatesDisabled
{
  return self->_personBuilderMergeCandidatesDisabled;
}

- (void)setPersonBuilderMergeCandidatesDisabled:(BOOL)a3
{
  self->_personBuilderMergeCandidatesDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
}

@end
