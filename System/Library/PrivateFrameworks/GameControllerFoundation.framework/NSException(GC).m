@implementation NSException(GC)

+ (id)gc_exceptionWithName:()GC error:
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  objc_msgSend(a4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v10 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = v12;
    goto LABEL_9;
  }
  if (v9)
  {
    v12 = v9;
    goto LABEL_8;
  }
  if (v10)
  {
    v12 = v10;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_9:
  v14 = (id)objc_msgSend(a4, "domain");
  if (v14)
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("GC_NSExceptionErrorDomain"));
  +[NSNumber numberWithInteger:](&off_1F03A9E90, "numberWithInteger:", objc_msgSend(a4, "code"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("GC_NSExceptionErrorCode"));

  objc_msgSend(a1, "exceptionWithName:reason:userInfo:", a3, v13, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (uint64_t)gc_exceptionWithError:()GC
{
  return objc_msgSend(a1, "gc_exceptionWithName:error:", CFSTR("NSUnhandledErrorException"), a3);
}

- (id)gc_error
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GC_NSExceptionErrorDomain"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gc_objectForKey:ofClass:error:", CFSTR("GC_NSExceptionErrorCode"), objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObjectForKey:", CFSTR("GC_NSExceptionErrorDomain"));
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("GC_NSExceptionErrorCode"));
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(a1, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("Exception");
    objc_msgSend(v8, "setObject:forKey:", v13, v9);

  }
  v14 = *MEMORY[0x1E0CB2D68];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2D68]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(a1, "reason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_10;
    objc_msgSend(a1, "reason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v15, v14);
  }

LABEL_10:
  if (v3)
    v17 = v3;
  else
    v17 = CFSTR("NSExceptionErrorDomain");
  +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", v17, v6, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
