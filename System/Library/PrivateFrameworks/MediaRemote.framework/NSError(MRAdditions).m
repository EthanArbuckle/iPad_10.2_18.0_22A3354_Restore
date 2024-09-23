@implementation NSError(MRAdditions)

- (uint64_t)initWithMRError:()MRAdditions userInfo:
{
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;

  if (a4)
  {
    v6 = objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  v8 = (__CFString *)MRMediaRemoteErrorCopyDescription(a3);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);

  v9 = objc_msgSend(a1, "initWithDomain:code:userInfo:", CFSTR("kMRMediaRemoteFrameworkErrorDomain"), a3, v7);
  return v9;
}

- (uint64_t)initWithMRError:()MRAdditions
{
  return objc_msgSend(a1, "initWithMRError:userInfo:", a3, 0);
}

- (uint64_t)initWithMRError:()MRAdditions format:
{
  objc_class *v11;
  id v12;
  void *v13;
  uint64_t v14;

  if (a4)
  {
    v11 = (objc_class *)MEMORY[0x1E0CB3940];
    v12 = a4;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(a1, "initWithMRError:description:", a3, v13);

  return v14;
}

- (uint64_t)initWithMRError:()MRAdditions description:
{
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;

  if (a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E08];
    v7 = a4;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 1);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D68]);

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(a1, "initWithMRError:userInfo:", a3, v8);

  return v9;
}

- (id)mr_errorByEnvelopingWithMRError:()MRAdditions
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithMRError:userInfo:", a3, v6);

  return v7;
}

- (id)recursiveUnderlyingError
{
  void *v1;
  uint64_t v2;
  void *i;
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); ; i = (void *)v7)
  {

    objc_msgSend(i, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      break;
    objc_msgSend(i, "userInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", v2);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (uint64_t)mr_isMediaRemoteError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("kMRMediaRemoteFrameworkErrorDomain"));

  return v2;
}

- (id)mr_initWithProtobuf:()MRAdditions
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99E08];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);

    objc_msgSend(v5, "localizedFailureReason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D68]);

    objc_msgSend(v5, "underlyingErrors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "msv_map:", &__block_literal_global_72);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2F70]);

    v11 = a1;
    objc_msgSend(v5, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v5, "code");

    v13 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, (int)v10, v6);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (_MRErrorProtobuf)mr_protobuf
{
  _MRErrorProtobuf *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(_MRErrorProtobuf);
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRErrorProtobuf setDomain:](v2, "setDomain:", v3);

  -[_MRErrorProtobuf setCode:](v2, "setCode:", objc_msgSend(a1, "code"));
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRErrorProtobuf setLocalizedDescription:](v2, "setLocalizedDescription:", v5);

  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRErrorProtobuf setLocalizedFailureReason:](v2, "setLocalizedFailureReason:", v7);

  objc_msgSend(a1, "underlyingErrors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "msv_map:", &__block_literal_global_6_4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  -[_MRErrorProtobuf setUnderlyingErrors:](v2, "setUnderlyingErrors:", v10);

  return v2;
}

@end
