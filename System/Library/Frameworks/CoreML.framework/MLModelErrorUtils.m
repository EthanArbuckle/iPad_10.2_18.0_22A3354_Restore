@implementation MLModelErrorUtils

+ (id)errorWithIntegerCode:(int64_t)a3 underlyingError:(id)a4 format:(id)a5 args:(char *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, a6);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D50]);

  }
  if (v9)
LABEL_5:
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4 args:(char *)a5
{
  return (id)objc_msgSend(a1, "errorWithIntegerCode:underlyingError:format:args:", a3, 0, a4, a5);
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 format:(id)a5
{
  uint64_t v6;

  objc_msgSend(a1, "errorWithCode:underlyingError:format:args:", a3, a4, a5, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "errorWithCode:underlyingError:format:args:", a3, 0, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)genericErrorWithFormat:(id)a3
{
  uint64_t v4;

  objc_msgSend(a1, "errorWithCode:format:args:", 0, a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)updateErrorWithFormat:(id)a3
{
  uint64_t v4;

  objc_msgSend(a1, "errorWithCode:format:args:", 6, a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)featureTypeErrorWithFormat:(id)a3
{
  uint64_t v4;

  objc_msgSend(a1, "errorWithCode:format:args:", 1, a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)IOErrorWithFormat:(id)a3
{
  uint64_t v4;

  objc_msgSend(a1, "errorWithCode:format:args:", 3, a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)programValidationAtLoadErrorWithReason:(int)a3 format:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "privateErrorWithCode:underlyingError:format:args:", 70, v8, v7, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)programParsingAtLoadErrorWithReason:(int)a3 format:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "privateErrorWithCode:underlyingError:format:args:", 71, v8, v7, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)customLayerErrorWithUnderlyingError:(id)a3 withFormat:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "errorWithCode:underlyingError:format:args:", 4, a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)parameterErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "errorWithCode:underlyingError:format:args:", 7, a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)modelEncryptionErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "privateErrorWithCode:underlyingError:format:args:", 50, a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)modelDecryptionKeyFetchErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "errorWithCode:underlyingError:format:args:", 8, a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)modelDecryptionErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "errorWithCode:underlyingError:format:args:", 9, a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)programEvaluationErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "privateErrorWithCode:underlyingError:format:args:", 60, a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
