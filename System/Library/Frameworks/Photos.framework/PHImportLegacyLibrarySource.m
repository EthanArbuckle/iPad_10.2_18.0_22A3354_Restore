@implementation PHImportLegacyLibrarySource

- (PHImportLegacyLibrarySource)initWithUrls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHImportLegacyLibrarySource *v9;
  NSObject *p_super;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") != 1)
  {
    PLImportGetLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "Unexpected: Attempting to create a library import source with more than on URL: %@", buf, 0xCu);
    }
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Masters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Originals"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PHImportLegacyLibrarySource;
  v9 = -[PHImportUrlSource initWithUrls:](&v12, sel_initWithUrls_, v8);

  if (v9)
  {
    self = v5;
    p_super = &v9->_libraryURL->super;
    v9->_libraryURL = (NSURL *)self;
LABEL_7:

    v5 = self;
  }

  return v9;
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  PHImportException *v11;
  PHImportException *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PHImportLegacyLibrarySource;
  v5 = -[PHImportUrlSource containsSupportedMediaWithImportExceptions:](&v14, sel_containsSupportedMediaWithImportExceptions_);
  if (!v5)
  {
    -[NSURL path](self->_libraryURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3)
    {
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Masters"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[PHImportAsset directoryExists:](PHImportAsset, "directoryExists:", v8))
      {
LABEL_6:

        goto LABEL_7;
      }
      objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Originals"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[PHImportAsset directoryExists:](PHImportAsset, "directoryExists:", v9);

      if (!v10)
      {
        v11 = [PHImportException alloc];
        -[NSURL path](self->_libraryURL, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PHImportException initWithType:path:underlyingError:file:line:](v11, "initWithType:path:underlyingError:file:line:", 8, v8, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLegacyLibrarySource.m", 42);
        v15[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
    }
LABEL_7:

  }
  return v5;
}

- (BOOL)isReadonlyVolume
{
  return 1;
}

- (void)loadSidecarsFor:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[PHImportLegacyLibrarySource loadSidecarsFor:]";
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "%s should never be called on an PHImportLegacyLibrarySource", (uint8_t *)&v4, 0xCu);
  }

}

- (id)productKind
{
  return CFSTR("Legacy Library");
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)isLibrary
{
  return 1;
}

- (id)name
{
  void *v2;
  void *v3;
  void *v4;

  -[PHImportUrlSource prefix](self, "prefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

@end
