@implementation GEORPEnrichmentSubmissionConfig

+ (id)standardConfig
{
  if (_MergedGlobals_177 != -1)
    dispatch_once(&_MergedGlobals_177, &__block_literal_global_7);
  return (id)qword_1ECDBB888;
}

void __49__GEORPEnrichmentSubmissionConfig_standardConfig__block_invoke()
{
  GEORPEnrichmentSubmissionConfig *v0;
  void *v1;

  v0 = objc_alloc_init(GEORPEnrichmentSubmissionConfig);
  v1 = (void *)qword_1ECDBB888;
  qword_1ECDBB888 = (uint64_t)v0;

}

- (unint64_t)urlType
{
  return 53;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

- (int)analyticNetworkServiceTypeForRequest:(id)a3 traits:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint8_t v11[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "feedbackRequestParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "submissionParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "details");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasIncidentFeedback");

    if (v8)
      v9 = 28;
    else
      v9 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [request isKindOfClass:GEORPFeedbackRequest.class]", v11, 2u);
    }
    v9 = 0;
  }

  return v9;
}

@end
