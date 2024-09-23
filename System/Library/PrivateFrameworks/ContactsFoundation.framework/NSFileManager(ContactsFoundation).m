@implementation NSFileManager(ContactsFoundation)

- (uint64_t)_cn_setValue:()ContactsFoundation forExtendedAttribute:url:error:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a5, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "_cn_setValue:forExtendedAttribute:path:error:", v11, v10, v12, a6);

  return v13;
}

- (uint64_t)_cn_getValue:()ContactsFoundation forExtendendAttribute:url:error:
{
  id v10;
  void *v11;
  uint64_t v12;

  v10 = a4;
  objc_msgSend(a5, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "_cn_getValue:forExtendendAttribute:path:error:", a3, v10, v11, a6);

  return v12;
}

- (uint64_t)_cn_setValue:()ContactsFoundation forExtendedAttribute:path:error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v10))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 1300, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
LABEL_3:
      v12 = objc_retainAutorelease(v12);
      *a6 = v12;
    }
  }
  else
  {
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    v16 = objc_retainAutorelease(v9);
    if (!setxattr(v14, v15, (const void *)objc_msgSend(v16, "UTF8String"), objc_msgSend(v16, "lengthOfBytesUsingEncoding:", 4), 0, 0))
    {
      v13 = 1;
      goto LABEL_9;
    }
    +[CNFoundationError errorWithErrno](CNFoundationError, "errorWithErrno");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
      goto LABEL_3;
  }

  v13 = 0;
LABEL_9:

  return v13;
}

- (id)_cn_valueForExtendedAttribute:()ContactsFoundation path:error:
{
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v6 = objc_msgSend(a1, "_cn_getValue:forExtendendAttribute:path:error:", &v15, a3, a4, a5);
  v7 = v15;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      +[CNFoundationError errorWithErrno:](CNFoundationError, "errorWithErrno:", 93);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0CB3388];
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 1302, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (a5)
        *a5 = objc_retainAutorelease(v11);

    }
    v13 = 0;
  }
  else
  {
    v13 = v7;
  }

  return v13;
}

- (uint64_t)_cn_getValue:()ContactsFoundation forExtendendAttribute:path:error:
{
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  ssize_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _OWORD value[16];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v10))
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = CFSTR("CNContactsFoundationErrorDomain");
    v14 = 1300;
    goto LABEL_11;
  }
  if ((objc_msgSend(a1, "fileExistsAtPath:", v11) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = (const __CFString *)*MEMORY[0x1E0CB28A8];
    v14 = 4;
    goto LABEL_11;
  }
  memset(value, 0, sizeof(value));
  v15 = getxattr((const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), value, 0xFFuLL, 0, 0);
  if ((v15 & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", value);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v16;
      if (a3)
        *a3 = objc_retainAutorelease(v16);

      goto LABEL_9;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = CFSTR("CNContactsFoundationErrorDomain");
    v14 = 1301;
LABEL_11:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a6)
      *a6 = objc_retainAutorelease(v19);
LABEL_13:

    v18 = 0;
    goto LABEL_14;
  }
  if (v15 != -1 || *__error() != 93)
  {
    +[CNFoundationError errorWithErrno](CNFoundationError, "errorWithErrno");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB3388];
    v26 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 1302, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a6)
      *a6 = objc_retainAutorelease(v23);

    goto LABEL_13;
  }
  if (a3)
    *a3 = 0;
LABEL_9:
  v18 = 1;
LABEL_14:

  return v18;
}

- (uint64_t)_cn_removeExtendedAttributeForKey:()ContactsFoundation path:error:
{
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = a3;
  v9 = a4;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v8))
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = CFSTR("CNContactsFoundationErrorDomain");
    v12 = 1300;
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "fileExistsAtPath:", v9) & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = (const __CFString *)*MEMORY[0x1E0CB28A8];
    v12 = 4;
LABEL_8:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5)
    {
LABEL_10:

      v13 = 0;
      goto LABEL_11;
    }
LABEL_9:
    v14 = objc_retainAutorelease(v14);
    *a5 = v14;
    goto LABEL_10;
  }
  if (removexattr((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0)&& *__error() != 93)
  {
    +[CNFoundationError errorWithErrno](CNFoundationError, "errorWithErrno");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v13 = 1;
LABEL_11:

  return v13;
}

@end
