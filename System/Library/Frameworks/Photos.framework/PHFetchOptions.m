@implementation PHFetchOptions

- (void)mergeWithFetchOptions:(id)a3
{
  void (**v4)(uint64_t, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(uint64_t, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(uint64_t, void *, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  _QWORD *v42;

  v42 = a3;
  v4 = (void (**)(uint64_t, void *, void *))PHPredicateByCombiningPredicatesWithAnd;
  -[PHFetchOptions predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2]((uint64_t)v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void (**)(uint64_t, void *, void *))PHPredicateByCombiningPredicatesWithAnd;
  -[PHFetchOptions internalPredicate](self, "internalPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "internalPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2]((uint64_t)v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHFetchOptions setPredicate:](self, "setPredicate:", v7);
  -[PHFetchOptions setInternalPredicate:](self, "setInternalPredicate:", v11);
  v12 = (void (**)(uint64_t, void *, void *))PHPredicateByCombiningPredicatesWithOr;
  -[PHFetchOptions internalInclusionPredicate](self, "internalInclusionPredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "internalInclusionPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2]((uint64_t)v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHFetchOptions setInternalInclusionPredicate:](self, "setInternalInclusionPredicate:", v15);
  objc_msgSend(v42, "fetchPropertySets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(v42, "fetchPropertySets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions addFetchPropertySets:](self, "addFetchPropertySets:", v18);

  }
  objc_msgSend(v42, "sortDescriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v42, "sortDescriptors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setSortDescriptors:](self, "setSortDescriptors:", v20);

  }
  objc_msgSend(v42, "internalSortDescriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v42, "internalSortDescriptors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setInternalSortDescriptors:](self, "setInternalSortDescriptors:", v22);

  }
  objc_msgSend(v42, "transientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v42, "transientIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setTransientIdentifier:](self, "setTransientIdentifier:", v24);

  }
  objc_msgSend(v42, "customObjectIDSortOrder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v42, "customObjectIDSortOrder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setCustomObjectIDSortOrder:](self, "setCustomObjectIDSortOrder:", v26);

  }
  v27 = v42;
  if (v42[40])
  {
    -[PHFetchOptions setMinimumVerifiedFaceCount:](self, "setMinimumVerifiedFaceCount:", objc_msgSend(v42, "minimumVerifiedFaceCount"));
    v27 = v42;
  }
  if (v27[41])
  {
    -[PHFetchOptions setMinimumUnverifiedFaceCount:](self, "setMinimumUnverifiedFaceCount:", objc_msgSend(v42, "minimumUnverifiedFaceCount"));
    v27 = v42;
  }
  if (objc_msgSend(v27, "includeOnlyFacesNeedingFaceCrop"))
    -[PHFetchOptions setIncludeOnlyFacesNeedingFaceCrop:](self, "setIncludeOnlyFacesNeedingFaceCrop:", 1);
  objc_msgSend(v42, "photoLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v42, "photoLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setPhotoLibrary:](self, "setPhotoLibrary:", v29);

  }
  objc_msgSend(v42, "verifiedPersonTypes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v42, "verifiedPersonTypes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setVerifiedPersonTypes:](self, "setVerifiedPersonTypes:", v31);

  }
  objc_msgSend(v42, "changeDetectionCriteria");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[PHFetchOptions changeDetectionCriteria](self, "changeDetectionCriteria");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "changeDetectionCriteria");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v33, "changeDetectionCriteriaByAddingChangeDetectionCriteria:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchOptions setChangeDetectionCriteria:](self, "setChangeDetectionCriteria:", v35);

    }
    else
    {
      -[PHFetchOptions setChangeDetectionCriteria:](self, "setChangeDetectionCriteria:", v34);
    }

  }
  v36 = v42;
  if (v42[6])
  {
    -[PHFetchOptions setCurationType:](self, "setCurationType:", objc_msgSend(v42, "curationType"));
    v36 = v42;
  }
  if (v36[7])
  {
    -[PHFetchOptions setWantsIncrementalChangeDetails:](self, "setWantsIncrementalChangeDetails:", objc_msgSend(v42, "wantsIncrementalChangeDetails"));
    v36 = v42;
  }
  if (v36[2])
  {
    -[PHFetchOptions setIncludeAllBurstAssets:](self, "setIncludeAllBurstAssets:", objc_msgSend(v42, "includeAllBurstAssets"));
    v36 = v42;
  }
  if (v36[1])
  {
    -[PHFetchOptions setIncludeHiddenAssets:](self, "setIncludeHiddenAssets:", objc_msgSend(v42, "includeHiddenAssets"));
    v36 = v42;
  }
  if (v36[8])
  {
    -[PHFetchOptions setChunkSizeForFetch:](self, "setChunkSizeForFetch:", objc_msgSend(v42, "chunkSizeForFetch"));
    v36 = v42;
  }
  if (v36[9])
  {
    -[PHFetchOptions setCacheSizeForFetch:](self, "setCacheSizeForFetch:", objc_msgSend(v42, "cacheSizeForFetch"));
    v36 = v42;
  }
  if (v36[4])
  {
    -[PHFetchOptions setFetchLimit:](self, "setFetchLimit:", objc_msgSend(v42, "fetchLimit"));
    v36 = v42;
  }
  if (v36[5])
  {
    -[PHFetchOptions setFetchOffset:](self, "setFetchOffset:", objc_msgSend(v42, "fetchOffset"));
    v36 = v42;
  }
  if (v36[3])
  {
    -[PHFetchOptions setIncludeAssetSourceTypes:](self, "setIncludeAssetSourceTypes:", objc_msgSend(v42, "includeAssetSourceTypes"));
    v36 = v42;
  }
  if (v36[11])
  {
    -[PHFetchOptions setIncludeDuplicateAssets:](self, "setIncludeDuplicateAssets:", objc_msgSend(v42, "includeDuplicateAssets"));
    v36 = v42;
  }
  if (v36[12])
  {
    -[PHFetchOptions setExcludeDuplicateAssetVisibilityStateHidden:](self, "setExcludeDuplicateAssetVisibilityStateHidden:", objc_msgSend(v42, "excludeDuplicateAssetVisibilityStateHidden"));
    v36 = v42;
  }
  if (v36[13])
  {
    -[PHFetchOptions setIncludeDuplicateAssetVisibilityStateMostRelevant:](self, "setIncludeDuplicateAssetVisibilityStateMostRelevant:", objc_msgSend(v42, "includeDuplicateAssetVisibilityStateMostRelevant"));
    v36 = v42;
  }
  if (v36[14])
  {
    -[PHFetchOptions setExcludeNonVisibleStackedAssets:](self, "setExcludeNonVisibleStackedAssets:", objc_msgSend(v42, "excludeNonVisibleStackedAssets"));
    v36 = v42;
  }
  if (v36[15])
  {
    -[PHFetchOptions setIncludeGuestAssets:](self, "setIncludeGuestAssets:", objc_msgSend(v42, "includeGuestAssets"));
    v36 = v42;
  }
  if (v36[16])
  {
    -[PHFetchOptions setIncludePlaceholderAssets:](self, "setIncludePlaceholderAssets:", objc_msgSend(v42, "includePlaceholderAssets"));
    v36 = v42;
  }
  if (v36[17])
  {
    -[PHFetchOptions setIncludePendingMemories:](self, "setIncludePendingMemories:", objc_msgSend(v42, "includePendingMemories"));
    v36 = v42;
  }
  if (v36[18])
  {
    -[PHFetchOptions setIncludeRejectedMemories:](self, "setIncludeRejectedMemories:", objc_msgSend(v42, "includeRejectedMemories"));
    v36 = v42;
  }
  if (v36[19])
  {
    -[PHFetchOptions setIncludeLocalMemories:](self, "setIncludeLocalMemories:", objc_msgSend(v42, "includeLocalMemories"));
    v36 = v42;
  }
  if (v36[20])
  {
    -[PHFetchOptions setIncludeStoryMemories:](self, "setIncludeStoryMemories:", objc_msgSend(v42, "includeStoryMemories"));
    v36 = v42;
  }
  if (v36[21])
  {
    -[PHFetchOptions setIncludeSourceMemories:](self, "setIncludeSourceMemories:", objc_msgSend(v42, "includeSourceMemories"));
    v36 = v42;
  }
  if (v36[22])
  {
    -[PHFetchOptions setPersonContext:](self, "setPersonContext:", objc_msgSend(v42, "personContext"));
    v36 = v42;
  }
  if (v36[23])
  {
    -[PHFetchOptions setSocialGroupContext:](self, "setSocialGroupContext:", objc_msgSend(v42, "socialGroupContext"));
    v36 = v42;
  }
  if (v36[10])
  {
    -[PHFetchOptions setReverseSortOrder:](self, "setReverseSortOrder:", objc_msgSend(v42, "reverseSortOrder"));
    v36 = v42;
  }
  if (v36[24])
  {
    -[PHFetchOptions setIncludeTrashedAssets:](self, "setIncludeTrashedAssets:", objc_msgSend(v42, "includeTrashedAssets"));
    v36 = v42;
  }
  if (v36[25])
  {
    -[PHFetchOptions setIncludeTrashedShares:](self, "setIncludeTrashedShares:", objc_msgSend(v42, "includeTrashedShares"));
    v36 = v42;
  }
  if (v36[26])
  {
    -[PHFetchOptions setIncludeExpiredShares:](self, "setIncludeExpiredShares:", objc_msgSend(v42, "includeExpiredShares"));
    v36 = v42;
  }
  if (v36[27])
  {
    -[PHFetchOptions setIncludeExitingShares:](self, "setIncludeExitingShares:", objc_msgSend(v42, "includeExitingShares"));
    v36 = v42;
  }
  if (v36[28])
  {
    -[PHFetchOptions setIncludeFavoriteMemoriesCollectionList:](self, "setIncludeFavoriteMemoriesCollectionList:", objc_msgSend(v42, "includeFavoriteMemoriesCollectionList"));
    v36 = v42;
  }
  if (v36[29])
  {
    -[PHFetchOptions setIncludePlacesSmartAlbum:](self, "setIncludePlacesSmartAlbum:", objc_msgSend(v42, "includePlacesSmartAlbum"));
    v36 = v42;
  }
  if (v36[30])
  {
    -[PHFetchOptions setIncludeAllPhotosSmartAlbum:](self, "setIncludeAllPhotosSmartAlbum:", objc_msgSend(v42, "includeAllPhotosSmartAlbum"));
    v36 = v42;
  }
  if (v36[31])
  {
    -[PHFetchOptions setIncludeRecentlyEditedSmartAlbum:](self, "setIncludeRecentlyEditedSmartAlbum:", objc_msgSend(v42, "includeRecentlyEditedSmartAlbum"));
    v36 = v42;
  }
  if (v36[32])
  {
    -[PHFetchOptions setIncludeScreenRecordingsSmartAlbum:](self, "setIncludeScreenRecordingsSmartAlbum:", objc_msgSend(v42, "includeScreenRecordingsSmartAlbum"));
    v36 = v42;
  }
  if (v36[33])
  {
    -[PHFetchOptions setIncludeSharedLibrarySharingSuggestionsSmartAlbum:](self, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", objc_msgSend(v42, "includeSharedLibrarySharingSuggestionsSmartAlbum"));
    v36 = v42;
  }
  if (v36[34])
  {
    -[PHFetchOptions setIncludeActionCamVideoSmartAlbum:](self, "setIncludeActionCamVideoSmartAlbum:", objc_msgSend(v42, "includeActionCamVideoSmartAlbum"));
    v36 = v42;
  }
  if (v36[35])
  {
    -[PHFetchOptions setIncludeProResSmartAlbum:](self, "setIncludeProResSmartAlbum:", objc_msgSend(v42, "includeProResSmartAlbum"));
    v36 = v42;
  }
  if (v36[36])
  {
    -[PHFetchOptions setIncludeTrashBinAlbum:](self, "setIncludeTrashBinAlbum:", objc_msgSend(v42, "includeTrashedAssets"));
    v36 = v42;
  }
  if (v36[37])
  {
    -[PHFetchOptions setIncludeRootFolder:](self, "setIncludeRootFolder:", objc_msgSend(v42, "includeRootFolder"));
    v36 = v42;
  }
  if (v36[38])
  {
    -[PHFetchOptions setExcludeMontageAssets:](self, "setExcludeMontageAssets:", objc_msgSend(v42, "excludeMontageAssets"));
    v36 = v42;
  }
  if (v36[39])
  {
    -[PHFetchOptions setExcludeScreenshotAssets:](self, "setExcludeScreenshotAssets:", objc_msgSend(v42, "excludeScreenshotAssets"));
    v36 = v42;
  }
  if (v36[49])
  {
    -[PHFetchOptions setShouldPrefetchCount:](self, "setShouldPrefetchCount:", objc_msgSend(v42, "shouldPrefetchCount"));
    v36 = v42;
  }
  if (v36[47])
  {
    -[PHFetchOptions setIsExclusivePredicate:](self, "setIsExclusivePredicate:", objc_msgSend(v42, "isExclusivePredicate"));
    v36 = v42;
  }
  if (v36[50])
  {
    -[PHFetchOptions setHighlightCurationType:](self, "setHighlightCurationType:", objc_msgSend(v42, "highlightCurationType"));
    v36 = v42;
  }
  if (v36[51])
  {
    -[PHFetchOptions setSharingStream:](self, "setSharingStream:", objc_msgSend(v42, "sharingStream"));
    v36 = v42;
  }
  if (v36[52])
  {
    -[PHFetchOptions setIncludeUserSmartAlbums:](self, "setIncludeUserSmartAlbums:", objc_msgSend(v42, "includeUserSmartAlbums"));
    v36 = v42;
  }
  if (v36[42])
  {
    -[PHFetchOptions setIncludeNonvisibleFaces:](self, "setIncludeNonvisibleFaces:", objc_msgSend(v42, "includeNonvisibleFaces"));
    v36 = v42;
  }
  if (v36[45])
  {
    -[PHFetchOptions setIncludeOnlyFacesWithFaceprints:](self, "setIncludeOnlyFacesWithFaceprints:", objc_msgSend(v42, "includeOnlyFacesWithFaceprints"));
    v36 = v42;
  }
  if (v36[46])
  {
    -[PHFetchOptions setIncludeOnlyFacesInFaceGroups:](self, "setIncludeOnlyFacesInFaceGroups:", objc_msgSend(v42, "includeOnlyFacesInFaceGroups"));
    v36 = v42;
  }
  if (v36[43])
  {
    -[PHFetchOptions setIncludeOnlyPersonsWithVisibleKeyFaces:](self, "setIncludeOnlyPersonsWithVisibleKeyFaces:", objc_msgSend(v42, "includeOnlyPersonsWithVisibleKeyFaces"));
    v36 = v42;
  }
  if (v36[53])
  {
    -[PHFetchOptions setIncludeOnlyAssetsAllowedForAnalysis:](self, "setIncludeOnlyAssetsAllowedForAnalysis:", objc_msgSend(v42, "includeOnlyAssetsAllowedForAnalysis"));
    v36 = v42;
  }
  if (v36[54])
  {
    -[PHFetchOptions setIncludeOnlyContentContributedByCurrentUser:](self, "setIncludeOnlyContentContributedByCurrentUser:", objc_msgSend(v42, "includeOnlyContentContributedByCurrentUser"));
    v36 = v42;
  }
  if (v36[55])
  {
    -[PHFetchOptions setIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser:](self, "setIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser:", objc_msgSend(v42, "includeBothPrivateAssetsAndSharedContentContributedByCurrentUser"));
    v36 = v42;
  }
  objc_msgSend(v36, "importantFetchName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v42, "importantFetchName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setImportantFetchName:](self, "setImportantFetchName:", v38);

  }
  objc_msgSend(v42, "includedDetectionTypes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v42, "includedDetectionTypes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setIncludedDetectionTypes:](self, "setIncludedDetectionTypes:", v40);

  }
  v41 = v42;
  if (v42[57])
  {
    -[PHFetchOptions setIncludeTorsoAndFaceDetectionData:](self, "setIncludeTorsoAndFaceDetectionData:", objc_msgSend(v42, "includeTorsoAndFaceDetectionData"));
    v41 = v42;
  }
  if (v41[58])
  {
    -[PHFetchOptions setIncludeOnlyTorsoDetectionData:](self, "setIncludeOnlyTorsoDetectionData:", objc_msgSend(v42, "includeOnlyTorsoDetectionData"));
    v41 = v42;
  }
  if (v41[59])
  {
    -[PHFetchOptions setIncludeTorsoOnlyPerson:](self, "setIncludeTorsoOnlyPerson:", objc_msgSend(v42, "includeTorsoOnlyPerson"));
    v41 = v42;
  }
  if (v41[60])
  {
    -[PHFetchOptions setIncludeDuplicatesAlbums:](self, "setIncludeDuplicatesAlbums:", objc_msgSend(v42, "includeDuplicatesAlbums"));
    v41 = v42;
  }
  if (v41[61])
  {
    -[PHFetchOptions setIncludeMediaAnalysisProcessingRangeTypes:](self, "setIncludeMediaAnalysisProcessingRangeTypes:", objc_msgSend(v42, "includeMediaAnalysisProcessingRangeTypes"));
    v41 = v42;
  }
  if (v41[64])
  {
    -[PHFetchOptions setSharingFilter:](self, "setSharingFilter:", objc_msgSend(v42, "sharingFilter"));
    v41 = v42;
  }
  if (v41[65])
  {
    -[PHFetchOptions setUseNoIndexOnSharingFilter:](self, "setUseNoIndexOnSharingFilter:", objc_msgSend(v42, "useNoIndexOnSharingFilter"));
    v41 = v42;
  }
  if (v41[62])
  {
    -[PHFetchOptions setSuppressSlowFetchReports:](self, "setSuppressSlowFetchReports:", objc_msgSend(v42, "suppressSlowFetchReports"));
    v41 = v42;
  }
  if (v41[63])
    -[PHFetchOptions setReverseDefaultSortDescriptors:](self, "setReverseDefaultSortDescriptors:", objc_msgSend(v42, "reverseDefaultSortDescriptors"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  -[PHFetchOptions predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPredicate:", v6);

  -[PHFetchOptions sortDescriptors](self, "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSortDescriptors:", v8);

  -[PHFetchOptions internalPredicate](self, "internalPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setInternalPredicate:", v10);

  -[PHFetchOptions internalInclusionPredicate](self, "internalInclusionPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setInternalInclusionPredicate:", v12);

  -[PHFetchOptions internalSortDescriptors](self, "internalSortDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setInternalSortDescriptors:", v14);

  -[PHFetchOptions fetchPropertySets](self, "fetchPropertySets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v15);

  -[PHFetchOptions transientIdentifier](self, "transientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransientIdentifier:", v16);

  -[PHFetchOptions customObjectIDSortOrder](self, "customObjectIDSortOrder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomObjectIDSortOrder:", v17);

  -[PHFetchOptions photoLibrary](self, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotoLibrary:", v18);

  -[PHFetchOptions verifiedPersonTypes](self, "verifiedPersonTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setVerifiedPersonTypes:", v20);

  -[PHFetchOptions changeDetectionCriteria](self, "changeDetectionCriteria");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setChangeDetectionCriteria:", v22);

  v23 = -[NSNumber copy](self->_curationTypeNumber, "copy");
  v24 = (void *)v4[6];
  v4[6] = v23;

  v25 = -[NSNumber copy](self->_wantsIncrementalChangeDetailsNumber, "copy");
  v26 = (void *)v4[7];
  v4[7] = v25;

  v27 = -[NSNumber copy](self->_includeAllBurstAssetsNumber, "copy");
  v28 = (void *)v4[2];
  v4[2] = v27;

  v29 = -[NSNumber copy](self->_includeHiddenAssetsNumber, "copy");
  v30 = (void *)v4[1];
  v4[1] = v29;

  v31 = -[NSNumber copy](self->_chunkSizeForFetchNumber, "copy");
  v32 = (void *)v4[8];
  v4[8] = v31;

  v33 = -[NSNumber copy](self->_cacheSizeForFetchNumber, "copy");
  v34 = (void *)v4[9];
  v4[9] = v33;

  v35 = -[NSNumber copy](self->_fetchLimitNumber, "copy");
  v36 = (void *)v4[4];
  v4[4] = v35;

  v37 = -[NSNumber copy](self->_fetchOffsetNumber, "copy");
  v38 = (void *)v4[5];
  v4[5] = v37;

  v39 = -[NSNumber copy](self->_includeAssetSourceTypesNumber, "copy");
  v40 = (void *)v4[3];
  v4[3] = v39;

  v41 = -[NSNumber copy](self->_includeDuplicateAssetsNumber, "copy");
  v42 = (void *)v4[11];
  v4[11] = v41;

  v43 = -[NSNumber copy](self->_excludeDuplicateAssetVisibilityStateHiddenNumber, "copy");
  v44 = (void *)v4[12];
  v4[12] = v43;

  v45 = -[NSNumber copy](self->_includeDuplicateAssetVisibilityStateMostRelevantNumber, "copy");
  v46 = (void *)v4[13];
  v4[13] = v45;

  v47 = -[NSNumber copy](self->_excludeNonVisibleStackedAssetsNumber, "copy");
  v48 = (void *)v4[14];
  v4[14] = v47;

  v49 = -[NSNumber copy](self->_includeGuestAssetsNumber, "copy");
  v50 = (void *)v4[15];
  v4[15] = v49;

  v51 = -[NSNumber copy](self->_includePlaceholderAssetsNumber, "copy");
  v52 = (void *)v4[16];
  v4[16] = v51;

  v53 = -[NSNumber copy](self->_includePendingMemoriesNumber, "copy");
  v54 = (void *)v4[17];
  v4[17] = v53;

  v55 = -[NSNumber copy](self->_includeRejectedMemoriesNumber, "copy");
  v56 = (void *)v4[18];
  v4[18] = v55;

  v57 = -[NSNumber copy](self->_includeLocalMemoriesNumber, "copy");
  v58 = (void *)v4[19];
  v4[19] = v57;

  v59 = -[NSNumber copy](self->_includeStoryMemoriesNumber, "copy");
  v60 = (void *)v4[20];
  v4[20] = v59;

  v61 = -[NSNumber copy](self->_personContextNumber, "copy");
  v62 = (void *)v4[22];
  v4[22] = v61;

  v63 = -[NSNumber copy](self->_includeSourceMemoriesNumber, "copy");
  v64 = (void *)v4[21];
  v4[21] = v63;

  v65 = -[NSNumber copy](self->_socialGroupContextNumber, "copy");
  v66 = (void *)v4[23];
  v4[23] = v65;

  v67 = -[NSNumber copy](self->_reverseSortOrderNumber, "copy");
  v68 = (void *)v4[10];
  v4[10] = v67;

  v69 = -[NSNumber copy](self->_includeTrashedAssetsNumber, "copy");
  v70 = (void *)v4[24];
  v4[24] = v69;

  v71 = -[NSNumber copy](self->_includeTrashedSharesNumber, "copy");
  v72 = (void *)v4[25];
  v4[25] = v71;

  v73 = -[NSNumber copy](self->_includeExpiredSharesNumber, "copy");
  v74 = (void *)v4[26];
  v4[26] = v73;

  v75 = -[NSNumber copy](self->_includeExitingSharesNumber, "copy");
  v76 = (void *)v4[27];
  v4[27] = v75;

  v77 = -[NSNumber copy](self->_includeFavoriteMemoriesCollectionListNumber, "copy");
  v78 = (void *)v4[28];
  v4[28] = v77;

  v79 = -[NSNumber copy](self->_includePlacesSmartAlbumNumber, "copy");
  v80 = (void *)v4[29];
  v4[29] = v79;

  v81 = -[NSNumber copy](self->_includeAllPhotosSmartAlbumNumber, "copy");
  v82 = (void *)v4[30];
  v4[30] = v81;

  v83 = -[NSNumber copy](self->_includeRecentlyEditedSmartAlbumNumber, "copy");
  v84 = (void *)v4[31];
  v4[31] = v83;

  v85 = -[NSNumber copy](self->_includeScreenRecordingsSmartAlbumNumber, "copy");
  v86 = (void *)v4[32];
  v4[32] = v85;

  v87 = -[NSNumber copy](self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber, "copy");
  v88 = (void *)v4[33];
  v4[33] = v87;

  v89 = -[NSNumber copy](self->_includeActionCamVideoSmartAlbumNumber, "copy");
  v90 = (void *)v4[34];
  v4[34] = v89;

  v91 = -[NSNumber copy](self->_includeProResSmartAlbumNumber, "copy");
  v92 = (void *)v4[35];
  v4[35] = v91;

  v93 = -[NSNumber copy](self->_includeTrashBinAlbumNumber, "copy");
  v94 = (void *)v4[36];
  v4[36] = v93;

  v95 = -[NSNumber copy](self->_includeRootFolderNumber, "copy");
  v96 = (void *)v4[37];
  v4[37] = v95;

  v97 = -[NSNumber copy](self->_excludeMontageAssetsNumber, "copy");
  v98 = (void *)v4[38];
  v4[38] = v97;

  v99 = -[NSNumber copy](self->_excludeScreenshotAssetsNumber, "copy");
  v100 = (void *)v4[39];
  v4[39] = v99;

  v101 = -[NSNumber copy](self->_minimumVerifiedFaceCountNumber, "copy");
  v102 = (void *)v4[40];
  v4[40] = v101;

  v103 = -[NSNumber copy](self->_minimumUnverifiedFaceCountNumber, "copy");
  v104 = (void *)v4[41];
  v4[41] = v103;

  v105 = -[NSNumber copy](self->_includeNonvisibleFacesNumber, "copy");
  v106 = (void *)v4[42];
  v4[42] = v105;

  v107 = -[NSNumber copy](self->_includeOnlyPersonsWithVisibleKeyFacesNumber, "copy");
  v108 = (void *)v4[43];
  v4[43] = v107;

  v109 = -[NSNumber copy](self->_includeOnlyFacesNeedingFaceCropNumber, "copy");
  v110 = (void *)v4[44];
  v4[44] = v109;

  v111 = -[NSNumber copy](self->_includeOnlyFacesWithFaceprintsNumber, "copy");
  v112 = (void *)v4[45];
  v4[45] = v111;

  v113 = -[NSNumber copy](self->_includeOnlyFacesInFaceGroupsNumber, "copy");
  v114 = (void *)v4[46];
  v4[46] = v113;

  v115 = -[NSNumber copy](self->_shouldPrefetchCountNumber, "copy");
  v116 = (void *)v4[49];
  v4[49] = v115;

  v117 = -[NSNumber copy](self->_isExclusivePredicateNumber, "copy");
  v118 = (void *)v4[47];
  v4[47] = v117;

  v119 = -[NSNumber copy](self->_highlightCurationTypeNumber, "copy");
  v120 = (void *)v4[50];
  v4[50] = v119;

  v121 = -[NSNumber copy](self->_sharingStreamNumber, "copy");
  v122 = (void *)v4[51];
  v4[51] = v121;

  v123 = -[NSNumber copy](self->_includeUserSmartAlbumsNumber, "copy");
  v124 = (void *)v4[52];
  v4[52] = v123;

  v125 = -[NSNumber copy](self->_includeOnlyAssetsAllowedForAnalysisNumber, "copy");
  v126 = (void *)v4[53];
  v4[53] = v125;

  v127 = -[NSNumber copy](self->_includeOnlyContentContributedByCurrentUserNumber, "copy");
  v128 = (void *)v4[54];
  v4[54] = v127;

  v129 = -[NSNumber copy](self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber, "copy");
  v130 = (void *)v4[55];
  v4[55] = v129;

  v131 = -[NSString copy](self->_importantFetchName, "copy");
  v132 = (void *)v4[76];
  v4[76] = v131;

  v133 = -[NSArray copy](self->_includedDetectionTypes, "copy");
  v134 = (void *)v4[56];
  v4[56] = v133;

  v135 = -[NSNumber copy](self->_includeTorsoAndFaceDetectionDataNumber, "copy");
  v136 = (void *)v4[57];
  v4[57] = v135;

  v137 = -[NSNumber copy](self->_includeOnlyTorsoDetectionDataNumber, "copy");
  v138 = (void *)v4[58];
  v4[58] = v137;

  v139 = -[NSNumber copy](self->_includeTorsoOnlyPersonNumber, "copy");
  v140 = (void *)v4[59];
  v4[59] = v139;

  v141 = -[NSNumber copy](self->_includeDuplicatesAlbumsNumber, "copy");
  v142 = (void *)v4[60];
  v4[60] = v141;

  v143 = -[NSNumber copy](self->_includeMediaAnalysisProcessingRangeTypesNumber, "copy");
  v144 = (void *)v4[61];
  v4[61] = v143;

  v145 = -[NSNumber copy](self->_sharingFilterNumber, "copy");
  v146 = (void *)v4[64];
  v4[64] = v145;

  v147 = -[NSNumber copy](self->_useNoIndexOnSharingFilter, "copy");
  v148 = (void *)v4[65];
  v4[65] = v147;

  v149 = -[NSNumber copy](self->_suppressSlowFetchReportsNumber, "copy");
  v150 = (void *)v4[62];
  v4[62] = v149;

  v151 = -[NSNumber copy](self->_reverseDefaultSortDescriptorsNumber, "copy");
  v152 = (void *)v4[63];
  v4[63] = v151;

  return v4;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (NSArray)internalSortDescriptors
{
  return self->_internalSortDescriptors;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSPredicate)internalPredicate
{
  return self->_internalPredicate;
}

- (NSPredicate)internalInclusionPredicate
{
  return self->_internalInclusionPredicate;
}

- (NSArray)customObjectIDSortOrder
{
  return self->_customObjectIDSortOrder;
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  objc_storeStrong((id *)&self->_sortDescriptors, sortDescriptors);
}

- (void)setInternalSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_internalSortDescriptors, a3);
}

- (void)setInternalPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_internalPredicate, a3);
}

- (void)setInternalInclusionPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_internalInclusionPredicate, a3);
}

- (NSSet)verifiedPersonTypes
{
  return self->_verifiedPersonTypes;
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (void)setPredicate:(NSPredicate *)predicate
{
  objc_storeStrong((id *)&self->_predicate, predicate);
}

- (NSArray)fetchPropertySets
{
  return (NSArray *)-[NSMutableSet allObjects](self->_propertySets, "allObjects");
}

- (PHQueryChangeDetectionCriteria)changeDetectionCriteria
{
  return (PHQueryChangeDetectionCriteria *)objc_getProperty(self, a2, 544, 1);
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PHFetchOptions)init
{
  PHFetchOptions *v2;
  uint64_t v3;
  NSMutableSet *propertySets;
  uint64_t v5;
  NSArray *includedDetectionTypes;
  uint64_t v7;
  NSNumber *includeMediaAnalysisProcessingRangeTypesNumber;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHFetchOptions;
  v2 = -[PHFetchOptions init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    propertySets = v2->_propertySets;
    v2->_propertySets = (NSMutableSet *)v3;

    +[PHFetchOptions defaultDetectionTypes](PHFetchOptions, "defaultDetectionTypes");
    v5 = objc_claimAutoreleasedReturnValue();
    includedDetectionTypes = v2->_includedDetectionTypes;
    v2->_includedDetectionTypes = (NSArray *)v5;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[PHFetchOptions defaultMediaAnalysisProcessingRangeTypes](PHFetchOptions, "defaultMediaAnalysisProcessingRangeTypes"));
    v7 = objc_claimAutoreleasedReturnValue();
    includeMediaAnalysisProcessingRangeTypesNumber = v2->_includeMediaAnalysisProcessingRangeTypesNumber;
    v2->_includeMediaAnalysisProcessingRangeTypesNumber = (NSNumber *)v7;

  }
  return v2;
}

+ (int64_t)defaultMediaAnalysisProcessingRangeTypes
{
  return 1;
}

+ (id)defaultDetectionTypes
{
  return &unk_1E3657270;
}

- (void)setVerifiedPersonTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (void)setFetchPropertySets:(id)a3
{
  NSMutableSet *propertySets;
  id v5;

  propertySets = self->_propertySets;
  v5 = a3;
  -[NSMutableSet removeAllObjects](propertySets, "removeAllObjects");
  -[NSMutableSet addObjectsFromArray:](self->_propertySets, "addObjectsFromArray:", v5);

}

- (void)setTransientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transientIdentifier, a3);
}

- (void)setCustomObjectIDSortOrder:(id)a3
{
  objc_storeStrong((id *)&self->_customObjectIDSortOrder, a3);
}

- (void)setChangeDetectionCriteria:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 544);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importantFetchName, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_verifiedPersonTypes, 0);
  objc_storeStrong((id *)&self->_customObjectIDSortOrder, 0);
  objc_storeStrong((id *)&self->_internalInclusionPredicate, 0);
  objc_storeStrong((id *)&self->_internalSortDescriptors, 0);
  objc_storeStrong((id *)&self->_internalPredicate, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
  objc_storeStrong((id *)&self->_changeDetectionCriteria, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_useNoIndexOnSharingFilter, 0);
  objc_storeStrong((id *)&self->_sharingFilterNumber, 0);
  objc_storeStrong((id *)&self->_reverseDefaultSortDescriptorsNumber, 0);
  objc_storeStrong((id *)&self->_suppressSlowFetchReportsNumber, 0);
  objc_storeStrong((id *)&self->_includeMediaAnalysisProcessingRangeTypesNumber, 0);
  objc_storeStrong((id *)&self->_includeDuplicatesAlbumsNumber, 0);
  objc_storeStrong((id *)&self->_includeTorsoOnlyPersonNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyTorsoDetectionDataNumber, 0);
  objc_storeStrong((id *)&self->_includeTorsoAndFaceDetectionDataNumber, 0);
  objc_storeStrong((id *)&self->_includedDetectionTypes, 0);
  objc_storeStrong((id *)&self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyContentContributedByCurrentUserNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyAssetsAllowedForAnalysisNumber, 0);
  objc_storeStrong((id *)&self->_includeUserSmartAlbumsNumber, 0);
  objc_storeStrong((id *)&self->_sharingStreamNumber, 0);
  objc_storeStrong((id *)&self->_highlightCurationTypeNumber, 0);
  objc_storeStrong((id *)&self->_shouldPrefetchCountNumber, 0);
  objc_storeStrong((id *)&self->_propertySets, 0);
  objc_storeStrong((id *)&self->_isExclusivePredicateNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyFacesInFaceGroupsNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyFacesWithFaceprintsNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyFacesNeedingFaceCropNumber, 0);
  objc_storeStrong((id *)&self->_includeOnlyPersonsWithVisibleKeyFacesNumber, 0);
  objc_storeStrong((id *)&self->_includeNonvisibleFacesNumber, 0);
  objc_storeStrong((id *)&self->_minimumUnverifiedFaceCountNumber, 0);
  objc_storeStrong((id *)&self->_minimumVerifiedFaceCountNumber, 0);
  objc_storeStrong((id *)&self->_excludeScreenshotAssetsNumber, 0);
  objc_storeStrong((id *)&self->_excludeMontageAssetsNumber, 0);
  objc_storeStrong((id *)&self->_includeRootFolderNumber, 0);
  objc_storeStrong((id *)&self->_includeTrashBinAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeProResSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeActionCamVideoSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeScreenRecordingsSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeRecentlyEditedSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeAllPhotosSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includePlacesSmartAlbumNumber, 0);
  objc_storeStrong((id *)&self->_includeFavoriteMemoriesCollectionListNumber, 0);
  objc_storeStrong((id *)&self->_includeExitingSharesNumber, 0);
  objc_storeStrong((id *)&self->_includeExpiredSharesNumber, 0);
  objc_storeStrong((id *)&self->_includeTrashedSharesNumber, 0);
  objc_storeStrong((id *)&self->_includeTrashedAssetsNumber, 0);
  objc_storeStrong((id *)&self->_socialGroupContextNumber, 0);
  objc_storeStrong((id *)&self->_personContextNumber, 0);
  objc_storeStrong((id *)&self->_includeSourceMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includeStoryMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includeLocalMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includeRejectedMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includePendingMemoriesNumber, 0);
  objc_storeStrong((id *)&self->_includePlaceholderAssetsNumber, 0);
  objc_storeStrong((id *)&self->_includeGuestAssetsNumber, 0);
  objc_storeStrong((id *)&self->_excludeNonVisibleStackedAssetsNumber, 0);
  objc_storeStrong((id *)&self->_includeDuplicateAssetVisibilityStateMostRelevantNumber, 0);
  objc_storeStrong((id *)&self->_excludeDuplicateAssetVisibilityStateHiddenNumber, 0);
  objc_storeStrong((id *)&self->_includeDuplicateAssetsNumber, 0);
  objc_storeStrong((id *)&self->_reverseSortOrderNumber, 0);
  objc_storeStrong((id *)&self->_cacheSizeForFetchNumber, 0);
  objc_storeStrong((id *)&self->_chunkSizeForFetchNumber, 0);
  objc_storeStrong((id *)&self->_wantsIncrementalChangeDetailsNumber, 0);
  objc_storeStrong((id *)&self->_curationTypeNumber, 0);
  objc_storeStrong((id *)&self->_fetchOffsetNumber, 0);
  objc_storeStrong((id *)&self->_fetchLimitNumber, 0);
  objc_storeStrong((id *)&self->_includeAssetSourceTypesNumber, 0);
  objc_storeStrong((id *)&self->_includeAllBurstAssetsNumber, 0);
  objc_storeStrong((id *)&self->_includeHiddenAssetsNumber, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSharingFilter:(unsigned __int16)a3
{
  NSNumber *v4;
  NSNumber *sharingFilterNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sharingFilterNumber = self->_sharingFilterNumber;
  self->_sharingFilterNumber = v4;

}

- (void)setIncludeGuestAssets:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeGuestAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeGuestAssetsNumber = self->_includeGuestAssetsNumber;
  self->_includeGuestAssetsNumber = v4;

}

- (void)setIsExclusivePredicate:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *isExclusivePredicateNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isExclusivePredicateNumber = self->_isExclusivePredicateNumber;
  self->_isExclusivePredicateNumber = v4;

}

- (NSArray)includedDetectionTypes
{
  return self->_includedDetectionTypes;
}

- (BOOL)includeGuestAssets
{
  return -[NSNumber BOOLValue](self->_includeGuestAssetsNumber, "BOOLValue");
}

- (void)setIncludedDetectionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_includedDetectionTypes, a3);
}

- (void)setIncludeMediaAnalysisProcessingRangeTypes:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *includeMediaAnalysisProcessingRangeTypesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeMediaAnalysisProcessingRangeTypesNumber = self->_includeMediaAnalysisProcessingRangeTypesNumber;
  self->_includeMediaAnalysisProcessingRangeTypesNumber = v4;

}

- (BOOL)includeOnlyFacesNeedingFaceCrop
{
  return -[NSNumber BOOLValue](self->_includeOnlyFacesNeedingFaceCropNumber, "BOOLValue");
}

- (int64_t)includeMediaAnalysisProcessingRangeTypes
{
  return -[NSNumber integerValue](self->_includeMediaAnalysisProcessingRangeTypesNumber, "integerValue");
}

- (int64_t)cacheSizeForFetch
{
  return -[NSNumber integerValue](self->_cacheSizeForFetchNumber, "integerValue");
}

- (NSString)importantFetchName
{
  return self->_importantFetchName;
}

- (BOOL)suppressSlowFetchReports
{
  return -[NSNumber BOOLValue](self->_suppressSlowFetchReportsNumber, "BOOLValue");
}

- (BOOL)isExclusivePredicate
{
  return -[NSNumber BOOLValue](self->_isExclusivePredicateNumber, "BOOLValue");
}

- (BOOL)wantsIncrementalChangeDetails
{
  NSNumber *wantsIncrementalChangeDetailsNumber;

  wantsIncrementalChangeDetailsNumber = self->_wantsIncrementalChangeDetailsNumber;
  return !wantsIncrementalChangeDetailsNumber || -[NSNumber BOOLValue](wantsIncrementalChangeDetailsNumber, "BOOLValue");
}

- (BOOL)shouldPrefetchCount
{
  return -[NSNumber BOOLValue](self->_shouldPrefetchCountNumber, "BOOLValue");
}

- (BOOL)reverseSortOrder
{
  return -[NSNumber BOOLValue](self->_reverseSortOrderNumber, "BOOLValue");
}

- (NSSet)fetchPropertySetsAsSet
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_propertySets);
}

- (unint64_t)fetchOffset
{
  return -[NSNumber unsignedIntegerValue](self->_fetchOffsetNumber, "unsignedIntegerValue");
}

- (NSUInteger)fetchLimit
{
  return -[NSNumber unsignedIntegerValue](self->_fetchLimitNumber, "unsignedIntegerValue");
}

- (int64_t)chunkSizeForFetch
{
  return -[NSNumber integerValue](self->_chunkSizeForFetchNumber, "integerValue");
}

- (BOOL)hasAnySortDescriptors
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PHFetchOptions sortDescriptors](self, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PHFetchOptions internalSortDescriptors](self, "internalSortDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

+ (id)fetchOptionsCopyFromNullableFetchOptions:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  PHFetchOptions *v7;
  PHFetchOptions *v8;

  v5 = a3;
  v6 = a4;
  if (v5)
    v7 = (PHFetchOptions *)objc_msgSend(v5, "copy");
  else
    v7 = objc_alloc_init(PHFetchOptions);
  v8 = v7;
  if (v6)
    -[PHFetchOptions setPhotoLibrary:](v7, "setPhotoLibrary:", v6);

  return v8;
}

- (BOOL)includeUserSmartAlbums
{
  return -[NSNumber BOOLValue](self->_includeUserSmartAlbumsNumber, "BOOLValue");
}

- (BOOL)includeSharedLibrarySharingSuggestionsSmartAlbum
{
  return -[NSNumber BOOLValue](self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber, "BOOLValue");
}

- (BOOL)includeScreenRecordingsSmartAlbum
{
  return -[NSNumber BOOLValue](self->_includeScreenRecordingsSmartAlbumNumber, "BOOLValue");
}

- (BOOL)includeRecentlyEditedSmartAlbum
{
  return -[NSNumber BOOLValue](self->_includeRecentlyEditedSmartAlbumNumber, "BOOLValue");
}

- (BOOL)includeProResSmartAlbum
{
  return -[NSNumber BOOLValue](self->_includeProResSmartAlbumNumber, "BOOLValue");
}

- (BOOL)includePlacesSmartAlbum
{
  return -[NSNumber BOOLValue](self->_includePlacesSmartAlbumNumber, "BOOLValue");
}

- (BOOL)includeFavoriteMemoriesCollectionList
{
  return -[NSNumber BOOLValue](self->_includeFavoriteMemoriesCollectionListNumber, "BOOLValue");
}

- (BOOL)includeDuplicatesAlbums
{
  return -[NSNumber BOOLValue](self->_includeDuplicatesAlbumsNumber, "BOOLValue");
}

- (BOOL)includeActionCamVideoSmartAlbum
{
  return -[NSNumber BOOLValue](self->_includeActionCamVideoSmartAlbumNumber, "BOOLValue");
}

- (void)setIncludeHiddenAssets:(BOOL)includeHiddenAssets
{
  NSNumber *v4;
  NSNumber *includeHiddenAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", includeHiddenAssets);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeHiddenAssetsNumber = self->_includeHiddenAssetsNumber;
  self->_includeHiddenAssetsNumber = v4;

}

- (void)setHighlightCurationType:(unsigned __int16)a3
{
  NSNumber *v4;
  NSNumber *highlightCurationTypeNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  highlightCurationTypeNumber = self->_highlightCurationTypeNumber;
  self->_highlightCurationTypeNumber = v4;

}

- (void)setChunkSizeForFetch:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *chunkSizeForFetchNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  chunkSizeForFetchNumber = self->_chunkSizeForFetchNumber;
  self->_chunkSizeForFetchNumber = v4;

}

+ (id)effectivePhotoLibraryForFetchOptions:(id)a3 object:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(a4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (BOOL)includeAllPhotosSmartAlbum
{
  return -[NSNumber BOOLValue](self->_includeAllPhotosSmartAlbumNumber, "BOOLValue");
}

- (void)addFetchPropertySets:(id)a3
{
  if (a3)
    -[NSMutableSet addObjectsFromArray:](self->_propertySets, "addObjectsFromArray:");
}

- (unsigned)highlightCurationType
{
  NSNumber *highlightCurationTypeNumber;

  highlightCurationTypeNumber = self->_highlightCurationTypeNumber;
  if (highlightCurationTypeNumber)
    LOWORD(highlightCurationTypeNumber) = -[NSNumber integerValue](highlightCurationTypeNumber, "integerValue");
  return (unsigned __int16)highlightCurationTypeNumber;
}

- (unsigned)sharingFilter
{
  NSNumber *sharingFilterNumber;

  sharingFilterNumber = self->_sharingFilterNumber;
  if (sharingFilterNumber)
    return -[NSNumber unsignedShortValue](sharingFilterNumber, "unsignedShortValue");
  else
    return 2;
}

- (BOOL)includeTrashedShares
{
  return -[NSNumber BOOLValue](self->_includeTrashedSharesNumber, "BOOLValue");
}

- (BOOL)includeTrashedAssets
{
  return -[NSNumber BOOLValue](self->_includeTrashedAssetsNumber, "BOOLValue");
}

- (BOOL)includeOnlyContentContributedByCurrentUser
{
  return -[NSNumber BOOLValue](self->_includeOnlyContentContributedByCurrentUserNumber, "BOOLValue");
}

- (BOOL)includeOnlyAssetsAllowedForAnalysis
{
  return -[NSNumber BOOLValue](self->_includeOnlyAssetsAllowedForAnalysisNumber, "BOOLValue");
}

- (BOOL)includeHiddenAssets
{
  return -[NSNumber BOOLValue](self->_includeHiddenAssetsNumber, "BOOLValue");
}

- (BOOL)includeExpiredShares
{
  return -[NSNumber BOOLValue](self->_includeExpiredSharesNumber, "BOOLValue");
}

- (BOOL)includeExitingShares
{
  return -[NSNumber BOOLValue](self->_includeExitingSharesNumber, "BOOLValue");
}

- (BOOL)includeBothPrivateAssetsAndSharedContentContributedByCurrentUser
{
  return -[NSNumber BOOLValue](self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber, "BOOLValue");
}

- (BOOL)includeDuplicateAssets
{
  return -[NSNumber BOOLValue](self->_includeDuplicateAssetsNumber, "BOOLValue");
}

- (BOOL)includeDuplicateAssetVisibilityStateMostRelevant
{
  return -[NSNumber BOOLValue](self->_includeDuplicateAssetVisibilityStateMostRelevantNumber, "BOOLValue");
}

- (PHAssetSourceType)includeAssetSourceTypes
{
  return -[NSNumber unsignedIntegerValue](self->_includeAssetSourceTypesNumber, "unsignedIntegerValue");
}

- (BOOL)includeAllBurstAssets
{
  return -[NSNumber BOOLValue](self->_includeAllBurstAssetsNumber, "BOOLValue");
}

- (BOOL)excludeScreenshotAssets
{
  return -[NSNumber BOOLValue](self->_excludeScreenshotAssetsNumber, "BOOLValue");
}

- (BOOL)excludeMontageAssets
{
  return -[NSNumber BOOLValue](self->_excludeMontageAssetsNumber, "BOOLValue");
}

- (BOOL)excludeDuplicateAssetVisibilityStateHidden
{
  return -[NSNumber BOOLValue](self->_excludeDuplicateAssetVisibilityStateHiddenNumber, "BOOLValue");
}

- (void)setCacheSizeForFetch:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *cacheSizeForFetchNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cacheSizeForFetchNumber = self->_cacheSizeForFetchNumber;
  self->_cacheSizeForFetchNumber = v4;

}

- (void)setReverseSortOrder:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *reverseSortOrderNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  reverseSortOrderNumber = self->_reverseSortOrderNumber;
  self->_reverseSortOrderNumber = v4;

}

- (void)setIncludeAllPhotosSmartAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeAllPhotosSmartAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeAllPhotosSmartAlbumNumber = self->_includeAllPhotosSmartAlbumNumber;
  self->_includeAllPhotosSmartAlbumNumber = v4;

}

- (void)setFetchLimit:(NSUInteger)fetchLimit
{
  NSNumber *v4;
  NSNumber *fetchLimitNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", fetchLimit);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fetchLimitNumber = self->_fetchLimitNumber;
  self->_fetchLimitNumber = v4;

}

- (void)setIncludeExitingShares:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeExitingSharesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeExitingSharesNumber = self->_includeExitingSharesNumber;
  self->_includeExitingSharesNumber = v4;

}

- (void)setIncludeAllBurstAssets:(BOOL)includeAllBurstAssets
{
  NSNumber *v4;
  NSNumber *includeAllBurstAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", includeAllBurstAssets);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeAllBurstAssetsNumber = self->_includeAllBurstAssetsNumber;
  self->_includeAllBurstAssetsNumber = v4;

}

- (void)setIncludeAssetSourceTypes:(PHAssetSourceType)includeAssetSourceTypes
{
  NSNumber *v4;
  NSNumber *includeAssetSourceTypesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", includeAssetSourceTypes);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeAssetSourceTypesNumber = self->_includeAssetSourceTypesNumber;
  self->_includeAssetSourceTypesNumber = v4;

}

- (void)setFetchOffset:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *fetchOffsetNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fetchOffsetNumber = self->_fetchOffsetNumber;
  self->_fetchOffsetNumber = v4;

}

- (void)setWantsIncrementalChangeDetails:(BOOL)wantsIncrementalChangeDetails
{
  NSNumber *v4;
  NSNumber *wantsIncrementalChangeDetailsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", wantsIncrementalChangeDetails);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  wantsIncrementalChangeDetailsNumber = self->_wantsIncrementalChangeDetailsNumber;
  self->_wantsIncrementalChangeDetailsNumber = v4;

}

- (void)setIncludeDuplicateAssets:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeDuplicateAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeDuplicateAssetsNumber = self->_includeDuplicateAssetsNumber;
  self->_includeDuplicateAssetsNumber = v4;

}

- (void)setExcludeDuplicateAssetVisibilityStateHidden:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *excludeDuplicateAssetVisibilityStateHiddenNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  excludeDuplicateAssetVisibilityStateHiddenNumber = self->_excludeDuplicateAssetVisibilityStateHiddenNumber;
  self->_excludeDuplicateAssetVisibilityStateHiddenNumber = v4;

}

- (void)setIncludeDuplicateAssetVisibilityStateMostRelevant:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeDuplicateAssetVisibilityStateMostRelevantNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeDuplicateAssetVisibilityStateMostRelevantNumber = self->_includeDuplicateAssetVisibilityStateMostRelevantNumber;
  self->_includeDuplicateAssetVisibilityStateMostRelevantNumber = v4;

}

- (BOOL)excludeNonVisibleStackedAssets
{
  return -[NSNumber BOOLValue](self->_excludeNonVisibleStackedAssetsNumber, "BOOLValue");
}

- (void)setExcludeNonVisibleStackedAssets:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *excludeNonVisibleStackedAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  excludeNonVisibleStackedAssetsNumber = self->_excludeNonVisibleStackedAssetsNumber;
  self->_excludeNonVisibleStackedAssetsNumber = v4;

}

- (BOOL)includePlaceholderAssets
{
  BOOL result;

  result = PLIsMobileSlideShow();
  if (self->_includePlaceholderAssetsNumber)
    return -[NSNumber BOOLValue](self->_includePlaceholderAssetsNumber, "BOOLValue");
  return result;
}

- (void)setIncludePlaceholderAssets:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includePlaceholderAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includePlaceholderAssetsNumber = self->_includePlaceholderAssetsNumber;
  self->_includePlaceholderAssetsNumber = v4;

}

- (BOOL)includePendingMemories
{
  return -[NSNumber BOOLValue](self->_includePendingMemoriesNumber, "BOOLValue");
}

- (void)setIncludePendingMemories:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includePendingMemoriesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includePendingMemoriesNumber = self->_includePendingMemoriesNumber;
  self->_includePendingMemoriesNumber = v4;

}

- (BOOL)includeRejectedMemories
{
  return -[NSNumber BOOLValue](self->_includeRejectedMemoriesNumber, "BOOLValue");
}

- (void)setIncludeRejectedMemories:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeRejectedMemoriesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeRejectedMemoriesNumber = self->_includeRejectedMemoriesNumber;
  self->_includeRejectedMemoriesNumber = v4;

}

- (BOOL)includeLocalMemories
{
  return -[NSNumber BOOLValue](self->_includeLocalMemoriesNumber, "BOOLValue");
}

- (void)setIncludeLocalMemories:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeLocalMemoriesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeLocalMemoriesNumber = self->_includeLocalMemoriesNumber;
  self->_includeLocalMemoriesNumber = v4;

}

- (BOOL)includeStoryMemories
{
  return -[NSNumber BOOLValue](self->_includeStoryMemoriesNumber, "BOOLValue");
}

- (void)setIncludeStoryMemories:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeStoryMemoriesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeStoryMemoriesNumber = self->_includeStoryMemoriesNumber;
  self->_includeStoryMemoriesNumber = v4;

}

- (BOOL)includeSourceMemories
{
  return -[NSNumber BOOLValue](self->_includeSourceMemoriesNumber, "BOOLValue");
}

- (void)setIncludeSourceMemories:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeSourceMemoriesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeSourceMemoriesNumber = self->_includeSourceMemoriesNumber;
  self->_includeSourceMemoriesNumber = v4;

}

- (int64_t)curationType
{
  return -[NSNumber integerValue](self->_curationTypeNumber, "integerValue");
}

- (void)setCurationType:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *curationTypeNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  curationTypeNumber = self->_curationTypeNumber;
  self->_curationTypeNumber = v4;

}

- (int64_t)personContext
{
  return -[NSNumber integerValue](self->_personContextNumber, "integerValue");
}

- (void)setPersonContext:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *personContextNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  personContextNumber = self->_personContextNumber;
  self->_personContextNumber = v4;

}

- (int64_t)socialGroupContext
{
  return -[NSNumber integerValue](self->_socialGroupContextNumber, "integerValue");
}

- (void)setSocialGroupContext:(int64_t)a3
{
  NSNumber *v4;
  NSNumber *socialGroupContextNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  socialGroupContextNumber = self->_socialGroupContextNumber;
  self->_socialGroupContextNumber = v4;

}

- (void)setIncludeTrashedAssets:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeTrashedAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeTrashedAssetsNumber = self->_includeTrashedAssetsNumber;
  self->_includeTrashedAssetsNumber = v4;

}

- (void)setIncludeTrashedShares:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeTrashedSharesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeTrashedSharesNumber = self->_includeTrashedSharesNumber;
  self->_includeTrashedSharesNumber = v4;

}

- (void)setIncludeExpiredShares:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeExpiredSharesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeExpiredSharesNumber = self->_includeExpiredSharesNumber;
  self->_includeExpiredSharesNumber = v4;

}

- (void)setIncludeFavoriteMemoriesCollectionList:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeFavoriteMemoriesCollectionListNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeFavoriteMemoriesCollectionListNumber = self->_includeFavoriteMemoriesCollectionListNumber;
  self->_includeFavoriteMemoriesCollectionListNumber = v4;

}

- (void)setIncludePlacesSmartAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includePlacesSmartAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includePlacesSmartAlbumNumber = self->_includePlacesSmartAlbumNumber;
  self->_includePlacesSmartAlbumNumber = v4;

}

- (void)setIncludeRecentlyEditedSmartAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeRecentlyEditedSmartAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeRecentlyEditedSmartAlbumNumber = self->_includeRecentlyEditedSmartAlbumNumber;
  self->_includeRecentlyEditedSmartAlbumNumber = v4;

}

- (void)setIncludeScreenRecordingsSmartAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeScreenRecordingsSmartAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeScreenRecordingsSmartAlbumNumber = self->_includeScreenRecordingsSmartAlbumNumber;
  self->_includeScreenRecordingsSmartAlbumNumber = v4;

}

- (void)setIncludeSharedLibrarySharingSuggestionsSmartAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeSharedLibrarySharingSuggestionsSmartAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeSharedLibrarySharingSuggestionsSmartAlbumNumber = self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber;
  self->_includeSharedLibrarySharingSuggestionsSmartAlbumNumber = v4;

}

- (void)setIncludeActionCamVideoSmartAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeActionCamVideoSmartAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeActionCamVideoSmartAlbumNumber = self->_includeActionCamVideoSmartAlbumNumber;
  self->_includeActionCamVideoSmartAlbumNumber = v4;

}

- (void)setIncludeProResSmartAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeProResSmartAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeProResSmartAlbumNumber = self->_includeProResSmartAlbumNumber;
  self->_includeProResSmartAlbumNumber = v4;

}

- (BOOL)includeTrashBinAlbum
{
  return -[NSNumber BOOLValue](self->_includeTrashBinAlbumNumber, "BOOLValue");
}

- (void)setIncludeTrashBinAlbum:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeTrashBinAlbumNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeTrashBinAlbumNumber = self->_includeTrashBinAlbumNumber;
  self->_includeTrashBinAlbumNumber = v4;

}

- (BOOL)includeRootFolder
{
  return -[NSNumber BOOLValue](self->_includeRootFolderNumber, "BOOLValue");
}

- (void)setIncludeRootFolder:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeRootFolderNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeRootFolderNumber = self->_includeRootFolderNumber;
  self->_includeRootFolderNumber = v4;

}

- (void)setExcludeMontageAssets:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *excludeMontageAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  excludeMontageAssetsNumber = self->_excludeMontageAssetsNumber;
  self->_excludeMontageAssetsNumber = v4;

}

- (void)setExcludeScreenshotAssets:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *excludeScreenshotAssetsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  excludeScreenshotAssetsNumber = self->_excludeScreenshotAssetsNumber;
  self->_excludeScreenshotAssetsNumber = v4;

}

- (unint64_t)minimumVerifiedFaceCount
{
  NSNumber *minimumVerifiedFaceCountNumber;

  minimumVerifiedFaceCountNumber = self->_minimumVerifiedFaceCountNumber;
  if (minimumVerifiedFaceCountNumber)
    return -[NSNumber unsignedIntegerValue](minimumVerifiedFaceCountNumber, "unsignedIntegerValue");
  else
    return 1;
}

- (void)setMinimumVerifiedFaceCount:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *minimumVerifiedFaceCountNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  minimumVerifiedFaceCountNumber = self->_minimumVerifiedFaceCountNumber;
  self->_minimumVerifiedFaceCountNumber = v4;

}

- (unint64_t)minimumUnverifiedFaceCount
{
  NSNumber *minimumUnverifiedFaceCountNumber;

  minimumUnverifiedFaceCountNumber = self->_minimumUnverifiedFaceCountNumber;
  if (minimumUnverifiedFaceCountNumber)
    return -[NSNumber unsignedIntegerValue](minimumUnverifiedFaceCountNumber, "unsignedIntegerValue");
  else
    return 2;
}

- (void)setMinimumUnverifiedFaceCount:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *minimumUnverifiedFaceCountNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  minimumUnverifiedFaceCountNumber = self->_minimumUnverifiedFaceCountNumber;
  self->_minimumUnverifiedFaceCountNumber = v4;

}

- (BOOL)includeNonvisibleFaces
{
  NSNumber *includeNonvisibleFacesNumber;

  includeNonvisibleFacesNumber = self->_includeNonvisibleFacesNumber;
  return !includeNonvisibleFacesNumber || -[NSNumber BOOLValue](includeNonvisibleFacesNumber, "BOOLValue");
}

- (void)setIncludeNonvisibleFaces:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeNonvisibleFacesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeNonvisibleFacesNumber = self->_includeNonvisibleFacesNumber;
  self->_includeNonvisibleFacesNumber = v4;

}

- (BOOL)includeOnlyPersonsWithVisibleKeyFaces
{
  return -[NSNumber BOOLValue](self->_includeOnlyPersonsWithVisibleKeyFacesNumber, "BOOLValue");
}

- (void)setIncludeOnlyPersonsWithVisibleKeyFaces:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeOnlyPersonsWithVisibleKeyFacesNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeOnlyPersonsWithVisibleKeyFacesNumber = self->_includeOnlyPersonsWithVisibleKeyFacesNumber;
  self->_includeOnlyPersonsWithVisibleKeyFacesNumber = v4;

}

- (BOOL)includeTorsoAndFaceDetectionData
{
  return -[NSNumber BOOLValue](self->_includeTorsoAndFaceDetectionDataNumber, "BOOLValue");
}

- (void)setIncludeTorsoAndFaceDetectionData:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeTorsoAndFaceDetectionDataNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeTorsoAndFaceDetectionDataNumber = self->_includeTorsoAndFaceDetectionDataNumber;
  self->_includeTorsoAndFaceDetectionDataNumber = v4;

}

- (BOOL)includeOnlyTorsoDetectionData
{
  return -[NSNumber BOOLValue](self->_includeOnlyTorsoDetectionDataNumber, "BOOLValue");
}

- (void)setIncludeOnlyTorsoDetectionData:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeOnlyTorsoDetectionDataNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeOnlyTorsoDetectionDataNumber = self->_includeOnlyTorsoDetectionDataNumber;
  self->_includeOnlyTorsoDetectionDataNumber = v4;

}

- (void)setIncludeDuplicatesAlbums:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeDuplicatesAlbumsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeDuplicatesAlbumsNumber = self->_includeDuplicatesAlbumsNumber;
  self->_includeDuplicatesAlbumsNumber = v4;

}

- (BOOL)includeTorsoOnlyPerson
{
  return -[NSNumber BOOLValue](self->_includeTorsoOnlyPersonNumber, "BOOLValue");
}

- (void)setIncludeTorsoOnlyPerson:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeTorsoOnlyPersonNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeTorsoOnlyPersonNumber = self->_includeTorsoOnlyPersonNumber;
  self->_includeTorsoOnlyPersonNumber = v4;

}

- (void)setIncludeOnlyFacesNeedingFaceCrop:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeOnlyFacesNeedingFaceCropNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeOnlyFacesNeedingFaceCropNumber = self->_includeOnlyFacesNeedingFaceCropNumber;
  self->_includeOnlyFacesNeedingFaceCropNumber = v4;

}

- (BOOL)includeOnlyFacesWithFaceprints
{
  return -[NSNumber BOOLValue](self->_includeOnlyFacesWithFaceprintsNumber, "BOOLValue");
}

- (void)setIncludeOnlyFacesWithFaceprints:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeOnlyFacesWithFaceprintsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeOnlyFacesWithFaceprintsNumber = self->_includeOnlyFacesWithFaceprintsNumber;
  self->_includeOnlyFacesWithFaceprintsNumber = v4;

}

- (BOOL)includeOnlyFacesInFaceGroups
{
  return -[NSNumber BOOLValue](self->_includeOnlyFacesInFaceGroupsNumber, "BOOLValue");
}

- (void)setIncludeOnlyFacesInFaceGroups:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeOnlyFacesInFaceGroupsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeOnlyFacesInFaceGroupsNumber = self->_includeOnlyFacesInFaceGroupsNumber;
  self->_includeOnlyFacesInFaceGroupsNumber = v4;

}

- (void)setShouldPrefetchCount:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *shouldPrefetchCountNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  shouldPrefetchCountNumber = self->_shouldPrefetchCountNumber;
  self->_shouldPrefetchCountNumber = v4;

}

- (unint64_t)sharingStream
{
  NSNumber *sharingStreamNumber;

  sharingStreamNumber = self->_sharingStreamNumber;
  if (sharingStreamNumber)
    return -[NSNumber unsignedIntegerValue](sharingStreamNumber, "unsignedIntegerValue");
  else
    return 1;
}

- (void)setSharingStream:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *sharingStreamNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sharingStreamNumber = self->_sharingStreamNumber;
  self->_sharingStreamNumber = v4;

}

- (void)setIncludeUserSmartAlbums:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeUserSmartAlbumsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeUserSmartAlbumsNumber = self->_includeUserSmartAlbumsNumber;
  self->_includeUserSmartAlbumsNumber = v4;

}

- (void)setIncludeOnlyAssetsAllowedForAnalysis:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeOnlyAssetsAllowedForAnalysisNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeOnlyAssetsAllowedForAnalysisNumber = self->_includeOnlyAssetsAllowedForAnalysisNumber;
  self->_includeOnlyAssetsAllowedForAnalysisNumber = v4;

}

- (void)setIncludeOnlyContentContributedByCurrentUser:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeOnlyContentContributedByCurrentUserNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeOnlyContentContributedByCurrentUserNumber = self->_includeOnlyContentContributedByCurrentUserNumber;
  self->_includeOnlyContentContributedByCurrentUserNumber = v4;

}

- (void)setIncludeBothPrivateAssetsAndSharedContentContributedByCurrentUser:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber = self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber;
  self->_includeBothPrivateAssetsAndSharedContentContributedByCurrentUserNumber = v4;

}

- (BOOL)useNoIndexOnSharingFilter
{
  return -[NSNumber BOOLValue](self->_useNoIndexOnSharingFilter, "BOOLValue");
}

- (void)setUseNoIndexOnSharingFilter:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *useNoIndexOnSharingFilter;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  useNoIndexOnSharingFilter = self->_useNoIndexOnSharingFilter;
  self->_useNoIndexOnSharingFilter = v4;

}

- (void)setSuppressSlowFetchReports:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *suppressSlowFetchReportsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  suppressSlowFetchReportsNumber = self->_suppressSlowFetchReportsNumber;
  self->_suppressSlowFetchReportsNumber = v4;

}

- (BOOL)reverseDefaultSortDescriptors
{
  return -[NSNumber BOOLValue](self->_reverseDefaultSortDescriptorsNumber, "BOOLValue");
}

- (void)setReverseDefaultSortDescriptors:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *reverseDefaultSortDescriptorsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  reverseDefaultSortDescriptorsNumber = self->_reverseDefaultSortDescriptorsNumber;
  self->_reverseDefaultSortDescriptorsNumber = v4;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHFetchOptions;
  -[PHFetchOptions description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions sortDescriptors](self, "sortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" predicate=%@, sort=%@, wantsChangeDetails=%d"), v4, v5, -[PHFetchOptions wantsIncrementalChangeDetails](self, "wantsIncrementalChangeDetails"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  NSUInteger v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PHFetchOptions;
  -[PHFetchOptions description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions predicate](self, "predicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  -[PHFetchOptions internalPredicate](self, "internalPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v5 = -[PHFetchOptions fetchLimit](self, "fetchLimit");
  -[PHFetchOptions sortDescriptors](self, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions internalSortDescriptors](self, "internalSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchOptions customObjectIDSortOrder](self, "customObjectIDSortOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (-[PHFetchOptions reverseSortOrder](self, "reverseSortOrder"))
    v10 = CFSTR("D");
  else
    v10 = CFSTR("A");
  -[PHFetchOptions transientIdentifier](self, "transientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" predicate=%@/%@[%ld], sort=%@/%@/%ld/%@, changes[%@]=%d"), v15, v14, v5, v6, v7, v9, v10, v11, -[PHFetchOptions wantsIncrementalChangeDetails](self, "wantsIncrementalChangeDetails"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSDictionary)internalLoggingDescriptionDictionary
{
  id v4;
  objc_class *v5;
  objc_property_t *v6;
  objc_property_t *v7;
  id v8;
  const char *v9;
  unint64_t i;
  void *v11;
  const char *Name;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int outCount;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (MEMORY[0x19AEBDEDC]())
  {
    outCount = 0;
    v5 = (objc_class *)objc_opt_class();
    v6 = class_copyPropertyList(v5, &outCount);
    if (v6)
    {
      v7 = v6;
      NSStringFromSelector(a2);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = (const char *)objc_msgSend(v8, "UTF8String");

      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          v11 = (void *)MEMORY[0x19AEBEADC]();
          Name = property_getName(v7[i]);
          if (Name)
          {
            v13 = Name;
            if (strcmp(Name, "shortDescription"))
            {
              if (strcmp(v13, v9))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[PHFetchOptions valueForKey:](self, "valueForKey:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v15;
                if (v15)
                {
                  objc_msgSend(v15, "debugDescription");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v14);

                }
                else
                {
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("(null)"), v14);
                }

              }
            }
          }
          objc_autoreleasePoolPop(v11);
        }
      }
      free(v7);
    }
  }
  return (NSDictionary *)v4;
}

- (void)setImportantFetchName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

+ (PHFetchOptions)fetchOptionsWithInclusiveDefaults
{
  void *v3;
  void *v4;

  +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchOptions *)v4;
}

+ (PHFetchOptions)fetchOptionsWithInclusiveDefaultsForPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v3, "setIncludeAllBurstAssets:", 1);
  return (PHFetchOptions *)v3;
}

+ (PHFetchOptions)fetchOptionsWithPhotoLibrary:(id)a3 orObject:(id)a4
{
  id v5;
  id v6;
  PHFetchOptions *v7;
  PHFetchOptions *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PHFetchOptions);
  v8 = v7;
  if (v5)
  {
    -[PHFetchOptions setPhotoLibrary:](v7, "setPhotoLibrary:", v5);
  }
  else
  {
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchOptions setPhotoLibrary:](v8, "setPhotoLibrary:", v9);

  }
  return v8;
}

@end
