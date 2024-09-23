@implementation NSError(HFErrorHandlerAdditions)

+ (id)hf_errorWithCode:()HFErrorHandlerAdditions operation:options:
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 | v8)
  {
    objc_msgSend(v9, "hf_errorWithOperationType:options:", v7, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v9;
  }
  v12 = v11;

  return v12;
}

- (id)hf_errorWithOperationType:()HFErrorHandlerAdditions options:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "mutableCopy");

  }
  objc_msgSend(v10, "na_safeSetObject:forKey:", v7, CFSTR("HFErrorUserInfoOperationKey"));

  objc_msgSend(v10, "na_safeSetObject:forKey:", v6, CFSTR("HFErrorUserInfoOptionsKey"));
  v12 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(a1, "code"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)hf_errorWithOperationType:()HFErrorHandlerAdditions failedItemName:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v14 = CFSTR("HFErrorHandlerOptionFailedItemName");
    v15[0] = v6;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a3;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_errorWithOperationType:options:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = a3;
    objc_msgSend(a1, "hf_errorWithOperationType:options:", v12, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

@end
