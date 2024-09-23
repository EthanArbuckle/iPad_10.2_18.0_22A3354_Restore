@implementation NSError(EmailFoundationAdditions)

- (uint64_t)ef_isCancelledError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = v1[2](v1, *MEMORY[0x1E0CB28A8], 3072);

  return v2;
}

- (void)ef_match
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__NSError_EmailFoundationAdditions__ef_match__block_invoke;
  aBlock[3] = &unk_1E62A6470;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

+ (uint64_t)ef_cancelledError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
}

+ (uint64_t)ef_timeoutError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EFErrorDomain"), 1000000, 0);
}

+ (uint64_t)ef_notSupportedError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EFErrorDomain"), 1000001, 0);
}

+ (uint64_t)ef_connectionInterruptedError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EFErrorDomain"), 1000002, 0);
}

+ (uint64_t)ef_temporarilyUnavailableError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EFErrorDomain"), 1000003, 0);
}

+ (uint64_t)ef_invalidInputError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EFErrorDomain"), 1000004, 0);
}

- (id)ef_initWithDomain:()EmailFoundationAdditions code:underlyingError:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v14 = *MEMORY[0x1E0CB3388];
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_msgSend(a1, "initWithDomain:code:userInfo:", v8, a4, v11);

  return v12;
}

- (uint64_t)ef_isTimeoutError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v1)[2](v1, CFSTR("EFErrorDomain"), 1000000);

  return v2;
}

- (uint64_t)ef_isNotSupportedError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v1)[2](v1, CFSTR("EFErrorDomain"), 1000001);

  return v2;
}

- (uint64_t)ef_isConnectionInterruptedError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v1)[2](v1, CFSTR("EFErrorDomain"), 1000002);

  return v2;
}

- (uint64_t)ef_isTemporarilyUnavailableError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v1)[2](v1, CFSTR("EFErrorDomain"), 1000003);

  return v2;
}

- (uint64_t)ef_isInvalidInputError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v1)[2](v1, CFSTR("EFErrorDomain"), 1000004);

  return v2;
}

- (id)ef_underlyingError
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ef_secureCodableError
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke;
    v14 = &unk_1E62A64C0;
    v4 = v3;
    v15 = v4;
    v16 = &v17;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v11);
    if (*((_BYTE *)v18 + 24))
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(a1, "domain", v11, v12, v13, v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v4);

    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = a1;
  v9 = v8;

  return v9;
}

@end
