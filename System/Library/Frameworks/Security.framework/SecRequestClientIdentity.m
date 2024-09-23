@implementation SecRequestClientIdentity

void __SecRequestClientIdentity_block_invoke(_QWORD *a1)
{
  void *v2;
  AcmeCertRequest *v3;
  uint64_t v4;
  id v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x18D770A24]();
  v3 = -[AcmeCertRequest initWithSubject:parameters:]([AcmeCertRequest alloc], "initWithSubject:parameters:", a1[6], a1[7]);
  -[AcmeCertRequest sanitizeParameters](v3, "sanitizeParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)v4;
  }
  else
  {
    v10 = 0;
    -[AcmeCertRequest identityWithError:](v3, "identityWithError:", &v10);
    v5 = v10;
  }
  (*(void (**)(void))(a1[4] + 16))();
  v6 = (const void *)a1[7];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[6];
  if (v7)
    CFRelease(v7);

  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  objc_autoreleasePoolPop(v2);
}

@end
