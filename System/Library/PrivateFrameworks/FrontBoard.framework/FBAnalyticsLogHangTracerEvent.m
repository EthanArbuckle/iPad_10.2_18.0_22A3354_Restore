@implementation FBAnalyticsLogHangTracerEvent

void __FBAnalyticsLogHangTracerEvent_block_invoke(uint64_t a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  if (a2)
  {
    v3 = *(id *)(a1 + 32);
    v4 = v3;
    if (*(_QWORD *)(a1 + 40))
    {
      v8 = v3;
      v5 = (void *)objc_msgSend(v3, "mutableCopy");
      v6 = *MEMORY[0x1E0D287E8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, v7);

      v4 = v5;
    }
    v9 = v4;
    HTAppActivationEvent();

  }
}

@end
