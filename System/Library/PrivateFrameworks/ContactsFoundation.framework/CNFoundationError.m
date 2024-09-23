@implementation CNFoundationError

+ (id)ifResultIsNil:(id)a3 setOutputError:(id *)a4 toError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__CNFoundationError_ifResultIsNil_setOutputError_toError___block_invoke;
  v12[3] = &unk_1E29BC230;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "ifResultIsNil:setOutputError:withBlock:", a3, a4, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ifResultIsNil:(id)a3 setOutputError:(id *)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    v10 = v7;
  }
  else if (a4)
  {
    (*((void (**)(id))v8 + 2))(v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (NSError)timeoutError
{
  return (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 2, 0);
}

+ (BOOL)isTimeoutError:(id)a3
{
  return objc_msgSend(a1, "isError:errorWithDomain:code:", a3, CFSTR("CNContactsFoundationErrorDomain"), 2);
}

+ (NSError)userCanceledError
{
  return (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
}

+ (BOOL)isCanceledError:(id)a3
{
  return objc_msgSend(a1, "isError:errorWithDomain:code:", a3, *MEMORY[0x1E0CB28A8], 3072);
}

+ (NSError)notImplementedError
{
  return (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 11, 0);
}

+ (BOOL)isNotImplementedError:(id)a3
{
  return objc_msgSend(a1, "isError:errorWithDomain:code:", a3, CFSTR("CNContactsFoundationErrorDomain"), 11);
}

+ (BOOL)isFileNotFoundError:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;

  v4 = a3;
  v5 = *MEMORY[0x1E0CB28A8];
  if ((objc_msgSend(a1, "isError:errorWithDomain:code:", v4, *MEMORY[0x1E0CB28A8], 260) & 1) != 0
    || (objc_msgSend(a1, "isError:errorWithDomain:code:", v4, v5, 4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(a1, "isError:errorWithDomain:code:", v4, *MEMORY[0x1E0CB2FE0], 2);
  }

  return v6;
}

+ (BOOL)isFileAlreadyExistsError:(id)a3
{
  return objc_msgSend(a1, "isError:errorWithDomain:code:", a3, *MEMORY[0x1E0CB28A8], 516);
}

+ (BOOL)isCertificateError:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;

  v4 = a3;
  v5 = *MEMORY[0x1E0CB32E8];
  if ((objc_msgSend(a1, "isError:errorWithDomain:code:", v4, *MEMORY[0x1E0CB32E8], -1203) & 1) != 0
    || (objc_msgSend(a1, "isError:errorWithDomain:code:", v4, v5, -1201) & 1) != 0
    || (objc_msgSend(a1, "isError:errorWithDomain:code:", v4, v5, -1204) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(a1, "isError:errorWithDomain:code:", v4, v5, -1202);
  }

  return v6;
}

+ (BOOL)isError:(id)a3 errorWithDomain:(id)a4 code:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "code") == a5)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)errorWithErrno
{
  return (id)objc_msgSend(a1, "errorWithErrno:userInfo:", *__error(), 0);
}

+ (id)errorWithErrno:(int)a3
{
  return (id)objc_msgSend(a1, "errorWithErrno:userInfo:", *(_QWORD *)&a3, 0);
}

+ (id)errorWithErrnoAndUserInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "errorWithErrno:userInfo:", *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorWithErrno:(int)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a3, a4);
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), a3, a4);
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 underlyingException:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = CFSTR("com.apple.contacts.underlying-exception");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __58__CNFoundationError_ifResultIsNil_setOutputError_toError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)ifResultIsNo:(BOOL)a3 setOutputError:(id *)a4 toError:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__CNFoundationError_ifResultIsNo_setOutputError_toError___block_invoke;
  v11[3] = &unk_1E29BC230;
  v12 = v8;
  v9 = v8;
  LOBYTE(a4) = objc_msgSend(a1, "ifResultIsNo:setOutputError:withBlock:", v6, a4, v11);

  return (char)a4;
}

id __57__CNFoundationError_ifResultIsNo_setOutputError_toError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)ifResultIsNo:(BOOL)a3 setOutputError:(id *)a4 withBlock:(id)a5
{
  if (a4 && !a3)
  {
    (*((void (**)(id, SEL))a5 + 2))(a5, a2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3;
}

@end
