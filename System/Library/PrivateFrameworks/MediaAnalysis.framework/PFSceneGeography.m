@implementation PFSceneGeography

void __59__PFSceneGeography_MediaAnalysis__vcp_sharedSceneGeography__block_invoke()
{
  id v0;
  void *v1;
  uint8_t v2[16];

  v0 = objc_alloc_init(MEMORY[0x1E0D75240]);
  v1 = (void *)+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance;
  +[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance = (uint64_t)v0;

  if (!+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize PFSceneGeography", v2, 2u);
  }
}

@end
