@implementation PHSceneClassification(MediaAnalysis)

+ (id)vcp_instanceWithExtendedSceneIdentifier:()MediaAnalysis confidence:
{
  id v6;

  v6 = objc_alloc(MEMORY[0x1E0CD1758]);
  return (id)objc_msgSend(v6, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", a4, 0, a1, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), 0.0, 0.0);
}

+ (uint64_t)mad_typeFromCSUIdType:()MediaAnalysis
{
  uint64_t v3;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (a3 - 1);
  if (v3 < 4)
    return v3 + 4;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected CSUSearchableKnowledgeObjectIdType: %d", (uint8_t *)v6, 8u);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (uint64_t)mad_CSUIdTypeFromType:()MediaAnalysis
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 4) >= 4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected PHSceneClassificationType: %ld\n", (uint8_t *)&v6, 0xCu);
    }
    return 0;
  }
  else
  {
    return (__int16)(a3 - 3);
  }
}

+ (void)mad_pecTypes
{
  return &unk_1E6B76800;
}

@end
