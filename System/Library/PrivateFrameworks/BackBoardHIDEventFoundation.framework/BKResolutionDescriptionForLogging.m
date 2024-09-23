@implementation BKResolutionDescriptionForLogging

void ___BKResolutionDescriptionForLogging_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___BKResolutionDescriptionForLogging_block_invoke_2;
  v6[3] = &unk_1E81F6FF8;
  v7 = v3;
  v8 = v4;
  v9 = *(_BYTE *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v8, "appendProem:block:", 0, v6);

}

void ___BKResolutionDescriptionForLogging_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "display");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, 0, 1);

  if ((objc_msgSend(v11, "_isNullDisplay") & 1) == 0)
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:skipIfNil:", v11, CFSTR("display"), 1);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "processDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "pid");
      BSProcessDescriptionForPID();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "appendString:withName:skipIfEmpty:", v6, 0, 1);

  }
  else
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", (int)objc_msgSend(*(id *)(a1 + 32), "pid"), CFSTR("pid"));
  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v9, CFSTR("token"), 1);

}

@end
