@implementation PHPhotoLibrary(PNPhotoLibraryProtocol)

+ (id)_phFaceSortDescriptors
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_phPeopleSortDescriptors
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_defaultAssetPropertySets
{
  uint64_t v0;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD1A48];
  v2[0] = *MEMORY[0x1E0CD1968];
  v2[1] = v0;
  v2[2] = *MEMORY[0x1E0CD1A00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultFacePropertySets
{
  uint64_t v0;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD1B68];
  v2[0] = *MEMORY[0x1E0CD1B70];
  v2[1] = v0;
  v2[2] = *MEMORY[0x1E0CD1B58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultFetchOptions
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v2, "setPhotoLibrary:", a1);
  return v2;
}

- (id)_defaultAssetFetchOptions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_defaultFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultAssetPropertySets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFetchPropertySets:", v2);

  return v1;
}

- (id)pn_persistentStorageDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  char v14;
  id v15;
  char v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("mediaanalysisd")))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v17 = 0;
    objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v7)
    {
      v8 = v7;
      v4 = 0;
LABEL_5:
      v9 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileURLWithPath:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v6, "URLByAppendingPathComponent:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v4, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v13, &v16);

    if ((v14 & 1) != 0)
    {
      if (!v16)
      {

        v4 = 0;
        v8 = 0;
        goto LABEL_5;
      }
      v8 = 0;
    }
    else
    {
      v15 = 0;
      objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v15);
      v8 = v15;
    }
    if (v4 && !v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(a1, "urlForApplicationDataFolderIdentifier:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v4;
}

- (id)pn_fetchPersonsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD16F0], "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchPersonsWithType:()PNPhotoLibraryProtocol
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F0], "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  switch(a3)
  {
    case 0:
      abort();
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType = %@ OR verifiedType = %@"), &unk_1E6B724D0, &unk_1E6B724E8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPredicate:", v7);

      goto LABEL_7;
    case 2:
      objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 2);
      objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 2);
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSortDescriptors:", v12);

      objc_msgSend(v10, "setPhotoLibrary:", a1);
      objc_msgSend(v9, "fetchedObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3880];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__PHPhotoLibrary_PNPhotoLibraryProtocol__pn_fetchPersonsWithType___block_invoke;
      v19[3] = &unk_1E6B154D0;
      v20 = v10;
      v15 = v10;
      objc_msgSend(v14, "predicateWithBlock:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filteredArrayUsingPredicate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 3:
      objc_msgSend(v5, "setPersonContext:", 0);
      goto LABEL_7;
    case 4:
      objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 1);
      objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      break;
  }
  v9 = v8;
  v17 = v9;
LABEL_9:

  return v17;
}

- (id)pn_fetchPersonsInMoment:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD16F0], "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsForAssetCollection:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchCandidatePersonsForPerson:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F0], "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchMergeCandidatePersonsForPerson:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchInvalidCandidatePersonsForPerson:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F0], "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchInvalidMergeCandidatePersonsForPerson:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD16F0], "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsGroupedByAssetLocalIdentifierForAssets:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)pn_numberOfFacesWithFaceprints
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_defaultFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIncludeOnlyFacesWithFaceprints:", 1);
  v6[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFetchPropertySets:", v2);

  objc_msgSend(v1, "setShouldPrefetchCount:", 1);
  objc_msgSend(v1, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v1, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)pn_fetchFacesWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CD16F0], "_phFaceSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v5, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchFacesForPerson:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeOnlyFacesWithFaceprints:", 1);
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CD16F0], "_phFaceSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v5, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchFacesForPerson:()PNPhotoLibraryProtocol inMoment:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pn_fetchFacesForPersonLocalIdentifiers:inMoment:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pn_fetchFacesForPersonLocalIdentifiers:()PNPhotoLibraryProtocol inMoment:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "fetchFacesForMediaProcessingWithPersonLocalIdentifiers:inMoment:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
    v2 = v1;
  else
    v2 = (id)MEMORY[0x1E0C9AA60];

  return v2;
}

- (id)pn_fetchFacesForFaceGroup:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CD16F0], "_phFaceSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v5, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CD16F0], "_phFaceSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v5, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchMoments
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_defaultFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EA8], "momentSortDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSortDescriptors:", v2);

  objc_msgSend(MEMORY[0x1E0CD13C0], "fetchMomentsWithOptions:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pn_fetchMomentsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EA8], "momentSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD13C0], "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pn_fetchMomentsForPerson:()PNPhotoLibraryProtocol
{
  id v3;

  v3 = a3;
  abort();
}

- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EA8], "momentSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD13C0], "fetchMomentsForAssetsWithLocalIdentifiers:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchAssetsWithLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsInMoment:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsInAssetCollection:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsForPerson:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD1398];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsForPersons:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchAssetsForFaceGroup:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD1398];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsForFaceGroups:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchFaceGroups
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_defaultFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsWithOptions:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pn_fetchFaceGroupsForPerson:()PNPhotoLibraryProtocol
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1558], "fetchFaceGroupsForPerson:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_progressFromWorkerStatesDictionary:()PNPhotoLibraryProtocol
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("total-allowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("total-allowed"), (_QWORD)v16) & 1) == 0)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v13, "unsignedIntegerValue");

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v5)
  {
    if ((double)v9 / (double)v5 <= 1.0)
      v14 = (double)v9 / (double)v5;
    else
      v14 = 1.0;
  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (float)pn_faceProcessingProgress
{
  double v1;

  objc_msgSend(a1, "ratioOfAssetsWithFacesProcessed");
  return v1;
}

- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "_defaultFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = *MEMORY[0x1E0CD19B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  objc_msgSend(MEMORY[0x1E0CD13C0], "fetchAssetCollectionsWithType:subtype:options:", 2, 211, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsInAssetCollection:options:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v9), "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }
  objc_msgSend(MEMORY[0x1E0CD13C0], "fetchAssetCollectionsWithType:subtype:options:", 2, 201, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsInAssetCollection:options:", v12, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

  return v2;
}

- (id)pn_lastAssetDate
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_defaultFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSortDescriptors:", v3);

  objc_msgSend(v1, "setFetchLimit:", 1);
  objc_msgSend(v1, "setIncludeAssetSourceTypes:", 5);
  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsForFaceLocalIdentifiers:()PNPhotoLibraryProtocol
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CD16A0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "_defaultAssetFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY detectedFaces.uuid IN %@"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInternalPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithOptions:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
