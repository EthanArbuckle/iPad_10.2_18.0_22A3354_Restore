@implementation CKServerChangeToken(BRCAddition)

- (id)descriptionWithContext:()BRCAddition
{
  id v4;
  void *v5;
  id v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  uint64_t v31;
  const __CFString *v32;

  v4 = a3;
  objc_msgSend(a1, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") == 33)
  {
    v6 = objc_retainAutorelease(v5);
    v7 = (char *)objc_msgSend(v6, "bytes");
    v8 = *v7;
    if ((_DWORD)v8 == 1)
    {
      v9 = bswap64(*(_QWORD *)(v7 + 1));
      v10 = *(_QWORD *)(v7 + 9);
      if (v10 == -129)
      {
        v11 = CFSTR("current");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", bswap64(v10));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v24, 1, v4);

        v11 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v27, 1, v4);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3940];
      v31 = (uint64_t)v19;
      v32 = v11;
      v20 = CFSTR("<%@,%@>");
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "length") != 17)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    v21 = objc_msgSend(v5, "length");
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    v32 = v19;
    v20 = CFSTR("unkown-token-size:%lu (%@)");
    goto LABEL_11;
  }
  v6 = objc_retainAutorelease(v5);
  v12 = (char *)objc_msgSend(v6, "bytes");
  v8 = *v12;
  if ((_DWORD)v8 != 101)
  {
LABEL_9:
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = v8;
    v32 = v19;
    v20 = CFSTR("unkown-token-version:%d (%@)");
LABEL_11:
    v22 = v18;
LABEL_14:
    objc_msgSend(v22, "stringWithFormat:", v20, v31, v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v13 = *(_QWORD *)(v12 + 1);
  v14 = *(_QWORD *)(v12 + 9);
  if (v13 == -1)
  {
    v17 = CFSTR("beginning");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", bswap64(v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v16, 1, v4);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v14 == -1)
  {
    v19 = CFSTR("beginning");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", bswap64(v14));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringValue");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@,%@>"), v17, v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v28;
}

- (void)sqliteBind:()BRCAddition index:
{
  id v6;

  objc_msgSend(a1, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sqliteBind:index:", a3, a4);

}

+ (uint64_t)newFromSqliteValue:()BRCAddition
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "newFromSqliteValue:");
  if (v0)
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95100]), "initWithData:", v0);
  else
    v1 = 0;

  return v1;
}

+ (uint64_t)newFromSqliteStatement:()BRCAddition atIndex:
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "newFromSqliteStatement:atIndex:");
  if (v0)
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95100]), "initWithData:", v0);
  else
    v1 = 0;

  return v1;
}

@end
