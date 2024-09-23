@implementation PFSceneTaxonomy

void __52__PFSceneTaxonomy_MediaAnalysis__vcp_sharedTaxonomy__block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "mad_isExpectedTaxonomy") & 1) == 0
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error: MAD tracked taxonomy is not the latest in Photos!", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D75258], "latestTaxonomyIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Loading PFSceneTaxonomy identifier %@", buf, 0xCu);
  }
  v5 = 0;
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75258]), "initWithIdentifier:error:", v0, &v5);
  v2 = v5;
  v3 = (void *)+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance;
  +[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance = v1;

  if ((!+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance || v2)
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v7 = v0;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize PFSceneTaxonomy w/identifier %@ (%@)", buf, 0x16u);

  }
}

void __56__PFSceneTaxonomy_MediaAnalysis__mad_isExpectedTaxonomy__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0D75258], "latestTaxonomyIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::isLatest = objc_msgSend(CFSTR("99"), "isEqualToString:", v0);
  if ((+[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::isLatest & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    __56__PFSceneTaxonomy_MediaAnalysis__mad_isExpectedTaxonomy__block_invoke_cold_1((uint64_t)v0);
  }

}

void __56__PFSceneTaxonomy_MediaAnalysis__mad_isExpectedTaxonomy__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 138412546;
  v2 = CFSTR("99");
  v3 = 2112;
  v4 = a1;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Error: MAD tracked taxonomy identifier %@ does not match the latest in Photos: %@!", (uint8_t *)&v1, 0x16u);
}

@end
