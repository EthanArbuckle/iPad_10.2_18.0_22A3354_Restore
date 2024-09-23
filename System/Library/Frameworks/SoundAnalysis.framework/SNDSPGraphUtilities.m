@implementation SNDSPGraphUtilities

+ (id)actCatchingExceptions:(id)a3 error:(id *)a4
{
  void (**v5)(id, id *);
  void *v6;

  v5 = (void (**)(id, id *))a3;
  v5[2](v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)populateClientError:(id *)a3 withDSPGraphException:(void *)a4
{
  _BOOL4 v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = +[SNUtils isInternalBuild](SNUtils, "isInternalBuild");
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (*((char *)a4 + 95) >= 0)
    v8 = (char *)a4 + 72;
  else
    v8 = (char *)*((_QWORD *)a4 + 9);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)a4 + 16))(a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((char *)a4 + 39) >= 0)
      v11 = (char *)a4 + 16;
    else
      v11 = (char *)*((_QWORD *)a4 + 2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((char *)a4 + 71) >= 0)
      v13 = (char *)a4 + 48;
    else
      v13 = (char *)*((_QWORD *)a4 + 6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)a4 + 10));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (what: %@; file %@; function %@; line: %@)"),
      v9,
      v10,
      v12,
      v14,
      v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (*(uint64_t (**)(void *))(*(_QWORD *)a4 + 16))(a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (what: %@)"), v9, v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a3, 2, 0, v16);
}

@end
