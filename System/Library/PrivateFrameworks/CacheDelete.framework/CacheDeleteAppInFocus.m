@implementation CacheDeleteAppInFocus

+ (void)subscribeToAppInFocusStreamBeginning:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  void (*v7)(void);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  void *(*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!qword_1ECE24330)
  {
    v27 = xmmword_1E4A331C8;
    v28 = 0;
    qword_1ECE24330 = _sl_dlopen();
  }
  if (qword_1ECE24330)
  {
    if (qword_1ECE24318 != -1)
      dispatch_once(&qword_1ECE24318, &__block_literal_global_10);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v7 = (void (*)(void))off_1ECE24340;
    v26 = off_1ECE24340;
    v8 = MEMORY[0x1E0C809B0];
    if (!off_1ECE24340)
    {
      *(_QWORD *)&v27 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v27 + 1) = 3221225472;
      v28 = __getBiomeLibrarySymbolLoc_block_invoke;
      v29 = &unk_1E4A331E8;
      v30 = &v23;
      __getBiomeLibrarySymbolLoc_block_invoke((uint64_t)&v27);
      v7 = (void (*)(void))v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (!v7)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v7();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "App");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "InFocus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1A8591C18]();
    v13 = (void *)objc_opt_new();
    v14 = objc_alloc((Class)_MergedGlobals_8);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v15, v5, 0, 0, 1);

    objc_msgSend(v11, "publisherWithOptions:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_3;
    v20[3] = &unk_1E4A33188;
    v21 = v13;
    v22 = v6;
    v18 = v13;
    v19 = (id)objc_msgSend(v17, "sinkWithCompletion:receiveInput:", &__block_literal_global_34, v20);

    objc_autoreleasePoolPop(v12);
  }

}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke()
{
  void *v0;
  id v1;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)qword_1ECE24338;
  v6 = qword_1ECE24338;
  if (!qword_1ECE24338)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getBMPublisherOptionsClass_block_invoke;
    v2[3] = &unk_1E4A331E8;
    v2[4] = &v3;
    __getBMPublisherOptionsClass_block_invoke((uint64_t)v2);
    v0 = (void *)v4[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v3, 8);
  _MergedGlobals_8 = (uint64_t)v1;
}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  objc_msgSend(v2, "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("subscribeToAppInFocusStreamBeginning completion: %ld %@"), v3, v4);
}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v21, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v7);

    if ((v5 & 1) == 0)
    {
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v21, "eventBody");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "starting");

        if ((v9 & 1) == 0)
        {
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v21, "eventBody");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bundleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v12);

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v21, "timestamp");
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "eventBody");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "starting"))
          v16 = "Entering";
        else
          v16 = " Leaving";
        objc_msgSend(v21, "eventBody");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "eventBody");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "launchReason");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%d subscribeToAppInFocusStreamBeginning event: %@ %s %@ %@"), 153, v14, v16, v18, v20);

      }
    }
  }

}

@end
