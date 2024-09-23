@implementation NSError(HKHTTP)

+ (id)hk_HTTPErrorRepresentingResponse:()HKHTTP request:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "statusCode") < 100 || objc_msgSend(v7, "statusCode") >= 400)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+HKHTTP.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response == nil || [response isKindOfClass:[NSHTTPURLResponse class]]"));

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(v7, "statusCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "capitalizedString");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "statusCode") < 100 || objc_msgSend(v7, "statusCode") >= 600)
    {

      v11 = CFSTR("Invalid Status Code");
    }
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld %@"), objc_msgSend(v7, "statusCode"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    if (v8)
    {
      objc_msgSend(v8, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("HKHTTPErrorRequestURL"));

    }
    if (v7)
    {
      objc_msgSend(v7, "allHeaderFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("HKHTTPErrorResponseHeaderFields"));

    }
    objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("HKHTTPErrorDomain"), objc_msgSend(v7, "statusCode"), v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)hk_HTTPErrorWithHTTPStatusCode:()HKHTTP URLResponse:
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = *MEMORY[0x1E0CB3388];
  v10[0] = v5;
  v10[1] = a1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("HKHTTPErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
