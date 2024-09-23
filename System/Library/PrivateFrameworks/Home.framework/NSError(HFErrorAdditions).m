@implementation NSError(HFErrorAdditions)

+ (uint64_t)hf_errorWithCode:()HFErrorAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HFErrorDomain"), a3, MEMORY[0x1E0C9AA70]);
}

+ (id)hf_errorWithCode:()HFErrorAdditions descriptionFormat:
{
  objc_msgSend(a1, "hf_errorWithCode:descriptionFormat:arguments:", a3, a4, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hf_errorWithCode:()HFErrorAdditions description:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:title:description:", a3, 0, a4);
}

+ (id)hf_errorWithCode:()HFErrorAdditions title:description:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("HFErrorUserInfoOptionTitleKey"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("HFErrorUserInfoOptionDescriptionKey"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);

  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("HFErrorUserInfoOptionsKey"));

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("HFErrorDomain"), a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)hf_errorWithCode:()HFErrorAdditions descriptionFormat:arguments:
{
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithFormat:arguments:", v8, a5);

  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:title:description:", a3, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hf_internalErrorWithDescription:()HFErrorAdditions
{
  objc_msgSend(a1, "hf_errorWithCode:descriptionFormat:arguments:", -1, a3, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_mappedHMError:()HFErrorAdditions
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB8C70];
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

  if (!v6)
  {
    if ((objc_msgSend(v3, "na_isCancelledError") & 1) != 0)
    {
      v8 = 2001;
    }
    else
    {
      if ((objc_msgSend(v3, "na_isTimeoutError") & 1) == 0)
      {
        objc_msgSend(v3, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("HFErrorDomain"));

        if (!v12)
        {
          v9 = 0;
          goto LABEL_9;
        }
        v13 = objc_msgSend(v3, "code");
        v9 = 0;
        if (v13 > 33)
        {
          v8 = 2001;
          switch(v13)
          {
            case '"':
              v8 = 54;
              goto LABEL_7;
            case '#':
              v8 = 4;
              goto LABEL_7;
            case '$':
            case '&':
              goto LABEL_9;
            case '%':
              goto LABEL_7;
            case '\'':
              goto LABEL_6;
            default:
              if (v13 != 46)
                goto LABEL_9;
              v8 = 96;
              break;
          }
          goto LABEL_7;
        }
        if (v13 != 6)
        {
          if (v13 == 21)
          {
            v8 = 13;
          }
          else
          {
            if (v13 != 22)
              goto LABEL_9;
            v8 = 2004;
          }
          goto LABEL_7;
        }
      }
LABEL_6:
      v8 = 8;
    }
LABEL_7:
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v5, v8, 0);
    goto LABEL_8;
  }
  v7 = v3;
LABEL_8:
  v9 = v7;
LABEL_9:

  return v9;
}

- (BOOL)hf_isHFErrorWithCode:()HFErrorAdditions
{
  void *v5;
  int v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HFErrorDomain"));

  return v6 && objc_msgSend(a1, "code") == a3;
}

@end
