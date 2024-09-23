@implementation CNVisualSimilarity

+ (id)log
{
  if (log_cn_once_token_0_1 != -1)
    dispatch_once(&log_cn_once_token_0_1, &__block_literal_global_36);
  return (id)log_cn_once_object_0_1;
}

void __25__CNVisualSimilarity_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "vision");
  v1 = (void *)log_cn_once_object_0_1;
  log_cn_once_object_0_1 = (uint64_t)v0;

}

+ (BOOL)isData:(id)a3 similarTo:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "fingerprintForData:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fingerprintForData:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "isFingerprint:similarTo:", v7, v8);
  return (char)a1;
}

+ (id)fingerprintForData:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CEDF70];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithData:options:", v5, MEMORY[0x1E0C9AA70]);

  objc_msgSend(a1, "fingerprintForImageRequestHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fingerprintForImageRequestHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  CNVisualFingerprint *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CEDE30]);
  v5 = (void *)MEMORY[0x19400675C](objc_msgSend(v4, "setRevision:", 1));
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend(v3, "performRequests:error:", v6, &v15);
  v8 = v15;

  if ((v7 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CNVisualSimilarity fingerprintForImageRequestHandler:].cold.1((uint64_t)v8, v9);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fingerprintHashes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    v13 = 0;
  else
    v13 = -[CNVisualFingerprint initWithVNFingerprintHashes:]([CNVisualFingerprint alloc], "initWithVNFingerprintHashes:", v12);

  return v13;
}

+ (BOOL)isFingerprint:(id)a3 similarTo:(id)a4
{
  return objc_msgSend(a1, "isFingerprint:similarTo:threshold:", a3, a4, 10.0);
}

+ (BOOL)isFingerprint:(id)a3 similarTo:(id)a4 threshold:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  double v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a3, "hashData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v7, "hashData", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v23 != v17)
                objc_enumerationMutation(v14);
              v19 = (double)objc_msgSend(v13, "_cn_distanceFromData:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
              if (v19 < a5)
              {

                v20 = 1;
                goto LABEL_19;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16, v19);
            if (v16)
              continue;
            break;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v20 = 0;
    }
    while (v10);
  }
  else
  {
    v20 = 0;
  }
LABEL_19:

  return v20;
}

+ (void)fingerprintForImageRequestHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Could not generate fingerprint: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
