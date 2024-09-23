@implementation MFAttachmentUtilities

+ (id)temporaryDirectory
{
  return -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("/MobileMailAttachments"));
}

+ (id)_temporaryDirectoryUniqueURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = objc_msgSend((id)objc_msgSend(a1, "temporaryDirectory"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "globallyUniqueString"));
  if (!v4)
    return 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
  if (!objc_msgSend((id)objc_msgSend(v5, "scheme"), "hasPrefix:", CFSTR("file")))
    return 0;
  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v7);
  return v5;
}

+ (id)temporaryFileURLWithExtension:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  id v11;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_msgSend(a1, "_temporaryDirectoryUniqueURL");
  v7 = (void *)objc_msgSend(v6, "path");
  v8 = (void *)objc_msgSend(v7, "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XXXXX.%@"), a3));
  if (!v6)
    return 0;
  v9 = strdup((const char *)objc_msgSend(v8, "fileSystemRepresentation"));
  if (mkstemps(v9, objc_msgSend(a3, "length") + 1) != -1)
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    objc_msgSend(v5, "createFileAtPath:contents:attributes:", v10, 0, 0);
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v10, 0);
    if (!v9)
      return v11;
    goto LABEL_7;
  }
  objc_msgSend(v5, "removeItemAtPath:error:", objc_msgSend(v6, "path"), 0);
  v11 = 0;
  if (v9)
LABEL_7:
    free(v9);
  return v11;
}

+ (id)temporaryFileURLWithFileName:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_msgSend(a1, "_temporaryDirectoryUniqueURL");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend((id)objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", a3);
    if (objc_msgSend(v5, "createFileAtPath:contents:attributes:", v8, 0, 0))
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v8, 0);
    objc_msgSend(v5, "removeItemAtPath:error:", objc_msgSend(v7, "path"), 0);
  }
  return 0;
}

+ (id)mimeTypeForFileName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringForMimeTypeFromFileName:", a3);
}

@end
