@implementation CKShare(HealthDaemon)

- (uint64_t)hd_isCKShare
{
  return 1;
}

+ (id)hd_shareWithSystemData:()HealthDaemon error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)_recordClasses;
  if (!_recordClasses)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;
  objc_msgSend(v7, "arrayByAddingObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v30;
    v27 = a4;
    while (2)
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v9);
        v16 = *(objc_class **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        v17 = objc_alloc(MEMORY[0x1E0CB3710]);
        v28 = v15;
        v18 = (void *)objc_msgSend(v17, "initForReadingFromData:error:", v5, &v28);
        v12 = v28;

        if (!v18)
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("Failed to initialize unarchiver for class %@"), v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "hk_assignError:code:description:underlyingError:", v27, 100, v25, v12);

          v20 = v9;
          goto LABEL_16;
        }
        objc_msgSend(v18, "_enableStrictSecureDecodingMode");
        v19 = (void *)objc_msgSend([v16 alloc], "initWithCoder:", v18);
        objc_msgSend(v18, "finishDecoding");

        if (v19)
        {
          v20 = v9;
          goto LABEL_18;
        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      a4 = v27;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v9, "hk_map:", &__block_literal_global_39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to unarchive data for classes %@"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_assignError:code:description:", a4, 100, v22);
LABEL_16:

  v19 = 0;
LABEL_18:

  return v19;
}

@end
