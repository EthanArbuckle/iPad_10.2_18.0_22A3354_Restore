@implementation HMDFileManager

- (BOOL)writeJSONObject:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  BOOL v11;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0C99E48];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithURL:append:", v9, 0);

  if (v10)
  {
    objc_msgSend(v10, "open");
    v11 = objc_msgSend(MEMORY[0x1E0CB36D8], "writeJSONObject:toStream:options:error:", v7, v10, 1, a5) != 0;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, v7, v10, a6);

  return (char)a6;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

- (id)JSONObjectWithURL:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0C99DB0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithURL:", v6);

  if (v7)
  {
    objc_msgSend(v7, "open");
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v7, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSURL)heroFrameStoreDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  getBulletinImagesPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("HeroFrame"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSURL)legacyHeroFrameStoreDirectoryURL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (id)storeDirectoryPath;
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("HeroFrame"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, a4);

  return (char)a4;
}

- (BOOL)fileExistsAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "fileExistsAtPath:", v6);
  return (char)v4;
}

- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, a4, a5);
}

- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return objc_msgSend(a3, "writeToURL:options:error:", a4, a5, a6);
}

- (BOOL)writeDictionary:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "writeToURL:error:", a4, a5);
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "removeItemAtURL:error:", v6, a4);

  return (char)a4;
}

- (BOOL)unzipItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  id v16;
  BOOL v17;
  BOOL v18;
  id v20;
  id v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23[0] = CFSTR("extractPKZip");
  v23[1] = CFSTR("sequesterResources");
  v24[0] = MEMORY[0x1E0C9AAB0];
  v24[1] = MEMORY[0x1E0C9AAB0];
  v23[2] = CFSTR("copyResources");
  v24[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("temp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  BOMCopierNew();
  v13 = objc_retainAutorelease(v8);
  objc_msgSend(v13, "fileSystemRepresentation");
  v14 = objc_retainAutorelease(v12);
  objc_msgSend(v14, "fileSystemRepresentation");
  v15 = BOMCopierCopyWithOptions();
  BOMCopierFree();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v22 = 0;
  -[HMDFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v13, &v22);
  v20 = v22;
  v21 = v20;
  -[HMDFileManager moveItemAtURL:toURL:error:](self, "moveItemAtURL:toURL:error:", v14, v9, &v21);
  v16 = v21;

  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v16);
LABEL_4:
  if (v15)
    v17 = 0;
  else
    v17 = v16 == 0;
  v18 = v17;

  return v18;
}

- (BOOL)zipItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  FILE *v9;
  void *v10;
  id v11;
  char StreamableZip;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = fopen((const char *)objc_msgSend(v8, "fileSystemRepresentation"), "w+");

  if (v9)
  {
    v14 = *MEMORY[0x1E0DAFEA0];
    v15[0] = *MEMORY[0x1E0DAFE98];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, 0, 0, 0, 0, 0, v9, 0, 0, 0, 0, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "fileSystemRepresentation");
    StreamableZip = SZArchiverCreateStreamableZip();

    fclose(v9);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    StreamableZip = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    StreamableZip = 0;
  }

  return StreamableZip;
}

- (BOOL)linkItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "linkItemAtURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

- (id)fileHandleForReadingFromURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", a3, a4);
}

- (BOOL)isDeletableFileAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeletableFileAtPath:", v4);

  return v6;
}

- (void)enumerateItemsAtURL:(id)a3 includingPropertiesForKeys:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v8, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        v9[2](v9, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

- (id)attributesOfItemAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v10, v9, v8);

  return v12;
}

@end
