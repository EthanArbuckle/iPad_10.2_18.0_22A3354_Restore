@implementation NSError(MMCSKit)

- (uint64_t)MMCSErrorType
{
  if ((objc_msgSend(a1, "MMCSIsNetworkConditionsError") & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "MMCSIsAuthorizationError") & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "MMCSIsFatalError"))
    return 2;
  return 3;
}

- (void)_MMCSApplyBlock:()MMCSKit
{
  unsigned int (**v4)(id, void *);
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  unsigned int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *MEMORY[0x1E0D46768];
    v9 = *MEMORY[0x1E0CB3388];
    do
    {
      if (!v4[2](v4, v6))
      {
        v18 = v6;
        goto LABEL_22;
      }
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v12);
              if ((((uint64_t (*)(id, _QWORD))v4[2])(v4, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)) & 1) != 0)
              {

                v19 = v7;
                v18 = v6;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      objc_msgSend(v6, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v7 + 1;
      if (!v18)
        break;
      v6 = v18;
    }
    while (v7++ < 0x13);
LABEL_19:
    if (v19 >= 0x14)
      NSLog(CFSTR("Not following any more underlying errors."));
  }
  else
  {
    v18 = 0;
  }
LABEL_22:

}

- (uint64_t)MMCSIsCancelError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__NSError_MMCSKit__MMCSIsCancelError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MMCSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MMCSIsNetworkConditionsError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__NSError_MMCSKit__MMCSIsNetworkConditionsError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MMCSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MMCSIsAuthorizationError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__NSError_MMCSKit__MMCSIsAuthorizationError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MMCSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MMCSIsFatalError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__NSError_MMCSKit__MMCSIsFatalError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MMCSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (id)MMCSRetryAfterDate
{
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__5161;
  v8 = __Block_byref_object_dispose__5162;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__NSError_MMCSKit__MMCSRetryAfterDate__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MMCSApplyBlock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

+ (id)MMCSErrorWithDomain:()MMCSKit code:description:
{
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = MMCSErrorWithDomain_code_description__onceToken;
  v12 = a5;
  v13 = a3;
  if (v11 != -1)
    dispatch_once(&MMCSErrorWithDomain_code_description__onceToken, &__block_literal_global_5167);
  objc_msgSend((id)MMCSErrorWithDomain_code_description__MMCSKitBundle, "localizedStringForKey:value:table:", v12, v12, CFSTR("MMCSKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v14, &a9);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E0CB2D50], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v13, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
