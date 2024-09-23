@implementation NSString(MBSplitPath)

- (void)mb_splitIntoBase:()MBSplitPath andRelativePath:
{
  const char *v6;
  _BYTE *v7;
  void *v8;

  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  if (strlen(v6) < 0x400)
    goto LABEL_8;
  v7 = v6 + 1023;
  while (*v7 != 47)
  {
    if (--v7 <= v6)
    {
      if (*v7 != 47)
        goto LABEL_8;
      break;
    }
  }
  v8 = malloc_type_malloc(v7 - v6 + 1, 0x2DF96AD7uLL);
  memcpy(v8, v6, v7 - v6);
  *((_BYTE *)v8 + v7 - v6) = 0;
  *a3 = open((const char *)v8, 0);
  free(v8);
  if (*a3 == -1)
LABEL_8:
    *a3 = -2;
  else
    v6 = v7 + 1;
  *a4 = v6;
}

- (id)_mb_openatWithFlags:()MBSplitPath setupDir:itemAccessor:
{
  void (**v8)(id, _QWORD, char *);
  void (**v9)(id, _QWORD);
  void *v10;
  uint64_t v11;
  char *v13;
  int v14;

  v8 = a4;
  v9 = a5;
  v14 = -1;
  v13 = 0;
  objc_msgSend(a1, "mb_splitIntoBase:andRelativePath:", &v14, &v13);
  if (!v8 || (v8[2](v8, v14, v13), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = openat(v14, v13, a3);
    if ((v11 & 0x80000000) != 0)
    {
      +[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, a1, CFSTR("openat() error"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9[2](v9, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      close(v11);
    }
  }
  if ((v14 & 0x80000000) == 0)
    close(v14);

  return v10;
}

- (uint64_t)mb_openatWithFlags:()MBSplitPath error:setupDir:itemAccessor:
{
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;

  objc_msgSend(a1, "_mb_openatWithFlags:setupDir:itemAccessor:", a3, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = v9;
  if (!v9)
    *a4 = objc_retainAutorelease(v7);

  return v10;
}

@end
