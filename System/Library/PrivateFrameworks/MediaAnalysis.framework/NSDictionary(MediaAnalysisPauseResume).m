@implementation NSDictionary(MediaAnalysisPauseResume)

- (void)vcp_syncPoint
{
  const __CFDictionary *v3;
  uint64_t v4;
  const __CFDictionary *v5;

  objc_msgSend(a1, "objectForKey:", CFSTR("SyncPoint"));
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    CMTimeMakeFromDictionary(a2, v3);
  }
  else
  {
    v4 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&a2->value = *MEMORY[0x1E0CA2E18];
    a2->epoch = *(_QWORD *)(v4 + 16);
  }

}

@end
