@implementation PHFaceGroup(PNFaceGroupProtocol)

- (uint64_t)faceCountInFaceGroup
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v7[0] = *MEMORY[0x1E0CD1B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchPropertySets:", v3);

  objc_msgSend(v2, "setShouldPrefetchCount:", 1);
  objc_msgSend(v2, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v2, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInFaceGroup:options:", a1, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (BOOL)isDirty
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setShouldPrefetchCount:", 1);
  objc_msgSend(v2, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonAssociatedWithFaceGroup:options:", a1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 1;

  return v4;
}

@end
