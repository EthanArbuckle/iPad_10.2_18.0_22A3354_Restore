@implementation NSUserActivity

void __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  INCacheableGetSerializationQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke_2;
  block[3] = &unk_1E2292238;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2 && !a1[5])
  {
    v4 = CFSTR("userActivityData");
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__NSUserActivity_IntentsAdditions___setInteraction_donate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void *v7;
  void (**v8)(id, id, void *, id, _QWORD);
  id v9;
  void *v10;
  id v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0CB36F8];
  v12 = 0;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  v8[2](v8, v9, v10, v11, 0);

}

void __50__NSUserActivity_IntentsAdditions___setAppIntent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void *v7;
  void (**v8)(id, id, void *, id, _QWORD);
  id v9;
  void *v10;
  id v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0CB36F8];
  v12 = 0;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  v8[2](v8, v9, v10, v11, 0);

}

@end
