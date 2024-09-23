@implementation BSBlockSentinelFireFailureHandler

void __BSBlockSentinelFireFailureHandler_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[BSBlockSentinelSignalContext failureContext]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

@end
