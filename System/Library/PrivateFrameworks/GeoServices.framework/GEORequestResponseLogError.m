@implementation GEORequestResponseLogError

void ___GEORequestResponseLogError_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  rrPersister(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "persistResponseTask:error:", v4, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v3, "persistResponseTaskCanceled:", v4);

}

@end
