@implementation NSFileManager(SYExtendedAttributes)

- (uint64_t)setExtendedAttributeValue:()SYExtendedAttributes forKey:atURL:error:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "setExtendedAttributeData:forKey:atURL:error:", v12, v11, v10, a6);

  return v13;
}

- (BOOL)setExtendedAttributeData:()SYExtendedAttributes forKey:atURL:error:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!_ValidateURL(v11, a6))
    goto LABEL_7;
  if (objc_msgSend(v11, "isFileReferenceURL"))
  {
    objc_msgSend(v11, "filePathURL");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v12;
  }
  v11 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  v15 = objc_retainAutorelease(v9);
  v16 = setxattr(v13, v14, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0, 6);
  v17 = v16 == 0;
  if (a6 && v16)
  {
    v18 = *__error();
    v19 = objc_alloc(MEMORY[0x24BDD1540]);
    v20 = *MEMORY[0x24BDD1128];
    v11 = v11;
    v21 = (void *)objc_opt_new();
    objc_msgSend(v11, "absoluteURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDD1310]);

    objc_msgSend(v11, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BDD1320]);
    *a6 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, v18, v21);

LABEL_7:
    v17 = 0;
  }

  return v17;
}

- (id)stringForExtendedAttribute:()SYExtendedAttributes atURL:error:
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "dataForExtendedAttribute:atURL:error:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    v8 = (void *)v7;
    if (a5 && !v7)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      *a5 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 2048, 0);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_QWORD)dataForExtendedAttribute:()SYExtendedAttributes atURL:error:
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  ssize_t v12;
  void *v13;
  id v14;
  const char *v15;
  const char *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;

  v7 = a3;
  v8 = a4;
  if (!_ValidateURL(v8, a5))
    goto LABEL_10;
  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  v11 = objc_retainAutorelease(v7);
  v12 = getxattr(v10, (const char *)objc_msgSend(v11, "UTF8String"), 0, 0, 0, 0);
  if (v12 < 0)
  {
    if (!a5)
      goto LABEL_15;
    v20 = *__error();
    v21 = objc_alloc(MEMORY[0x24BDD1540]);
    v22 = *MEMORY[0x24BDD1128];
    v23 = v9;
    v24 = (void *)objc_opt_new();
    objc_msgSend(v23, "absoluteURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BDD1310]);

    objc_msgSend(v23, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BDD1320]);
    *a5 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, v20, v24);

LABEL_10:
    a5 = 0;
    goto LABEL_15;
  }
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", v12);
    v14 = objc_retainAutorelease(v9);
    v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");
    v16 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    v17 = objc_retainAutorelease(v13);
    v18 = getxattr(v15, v16, (void *)objc_msgSend(v17, "mutableBytes"), objc_msgSend(v17, "length"), 0, 0);
    if ((v18 & 0x8000000000000000) != 0)
    {
      if (a5)
      {
        v27 = *__error();
        v28 = objc_alloc(MEMORY[0x24BDD1540]);
        v29 = *MEMORY[0x24BDD1128];
        v30 = v14;
        v31 = (void *)objc_opt_new();
        objc_msgSend(v30, "absoluteURL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BDD1310]);

        objc_msgSend(v30, "absoluteString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BDD1320]);
        *a5 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, v27, v31);

        a5 = 0;
      }
    }
    else
    {
      v19 = v18;
      if (v18 < objc_msgSend(v17, "length"))
        objc_msgSend(v17, "setLength:", v19);
      a5 = v17;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    a5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return a5;
}

@end
