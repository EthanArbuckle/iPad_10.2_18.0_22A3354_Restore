@implementation NSString(CommonBRPathAdditions)

+ (char)br_pathWithFileSystemRepresentation:()CommonBRPathAdditions
{
  char *v3;
  void *v4;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", v3, strlen(v3));
    v3 = (char *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)br_stringByDeletingPathBounceNo:()CommonBRPathAdditions andPathExtension:
{
  id v6;
  char *v7;
  const char *v8;
  const char *v9;
  char v10;
  size_t v11;
  size_t v12;
  size_t v13;
  int v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  BOOL v22;
  char *v23;

  v6 = objc_retainAutorelease(a1);
  v7 = (char *)objc_msgSend(v6, "fileSystemRepresentation");
  v8 = _extensionInFilename(v7, 0);
  v9 = v8;
  if (!a4)
  {
    if (v8)
      goto LABEL_5;
LABEL_7:
    v11 = strlen(v7);
    v10 = 1;
    goto LABEL_8;
  }
  if (!v8)
  {
    *a4 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v8);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v10 = 0;
  v11 = (size_t)&v9[~(unint64_t)v7];
LABEL_8:
  v12 = v11;
  do
  {
    if (!v12)
      goto LABEL_14;
    v13 = v12 - 1;
    v14 = v7[--v12];
  }
  while ((v14 - 48) < 0xA);
  if (v14 != 32 || v7[v13 + 1] == 48)
  {
    v12 = 0;
LABEL_14:
    if (!a3)
      goto LABEL_16;
LABEL_15:
    *a3 = v12;
    goto LABEL_16;
  }
  *__error() = 0;
  v19 = strtoll(&v7[v13 + 1], 0, 10);
  v20 = *__error() == 0;
  v21 = v19 > 1;
  v22 = !v20 || !v21;
  if (v20 && v21)
    v12 = v19;
  else
    v12 = 0;
  if (!v22)
    v11 = v13;
  if (a3)
    goto LABEL_15;
LABEL_16:
  if (a4)
    v15 = 1;
  else
    v15 = v10;
  if ((v15 & 1) != 0)
  {
    if (v7[v11])
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFileSystemRepresentation:length:", v7, v11);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v6;
    }
  }
  else
  {
    v23 = 0;
    asprintf(&v23, "%.*s.%s", v11, v7, v9);
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v23);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    free(v23);
  }
  return v17;
}

- (uint64_t)br_stringByDeletingPathBounceNo:()CommonBRPathAdditions
{
  return objc_msgSend(a1, "br_stringByDeletingPathBounceNo:andPathExtension:", a3, 0);
}

@end
