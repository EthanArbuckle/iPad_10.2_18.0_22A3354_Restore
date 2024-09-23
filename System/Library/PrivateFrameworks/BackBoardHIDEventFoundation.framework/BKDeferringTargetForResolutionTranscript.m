@implementation BKDeferringTargetForResolutionTranscript

void ___BKDeferringTargetForResolutionTranscript_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pid");
  BSProcessDescriptionForPID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "token");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", v6, 0);

}

@end
