@implementation MSError

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6
{
  uint64_t v7;

  +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:arguments:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:arguments:", a3, a4, 5, a5, a6, &v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;
  if (v14)
    objc_msgSend(v16, "setObject:forKey:", v14, *MEMORY[0x1E0CB3388]);
  if (!v15)
  {
    v18 = 0;
    if (!a5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v15, a8);
  objc_msgSend(v17, "setObject:forKey:", v18, *MEMORY[0x1E0CB2D50]);
  if (a5)
LABEL_5:
    _MSLog(a5, v18);
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v13, a4, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)MSErrorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7
{
  uint64_t v8;

  +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:arguments:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:arguments:", a3, a4, a5, a6, a7, &v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
