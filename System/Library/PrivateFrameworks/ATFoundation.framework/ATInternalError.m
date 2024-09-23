@implementation ATInternalError

+ (id)errorWithCode:(unint64_t)a3 format:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v14);

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ATInternalError"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)errorWithCode:(unint64_t)a3 underlyingError:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB3388];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ATInternalError"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithPosixError:(int)a3 format:(id)a4
{
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = *(_QWORD *)&a3;
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s (%d)"), v7, strerror(v4), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E0CB2D50], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
