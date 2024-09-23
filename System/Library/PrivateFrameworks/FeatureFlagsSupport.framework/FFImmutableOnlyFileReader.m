@implementation FFImmutableOnlyFileReader

- (FFImmutableOnlyFileReader)init
{
  FFImmutableOnlyFileReader *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FFImmutableOnlyFileReader;
  v2 = -[FFImmutableOnlyFileReader init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *_os_feature_search_paths());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFImmutableOnlyFileReader setImmutablePathPrefix:](v2, "setImmutablePathPrefix:", v3);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_feature_internal_search_path());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFImmutableOnlyFileReader setImmutableInternalPathPrefix:](v2, "setImmutableInternalPathPrefix:", v4);

  }
  return v2;
}

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFImmutableOnlyFileReader immutablePathPrefix](self, "immutablePathPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasPrefix:", v8))
  {

  }
  else
  {
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFImmutableOnlyFileReader immutableInternalPathPrefix](self, "immutableInternalPathPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hasPrefix:", v10);

    if (!v11)
    {
      v13 = 0;
      goto LABEL_6;
    }
  }
  -[FFImmutableOnlyFileReader underlying](self, "underlying");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithContentsOfURL:error:", v6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFImmutableOnlyFileReader immutablePathPrefix](self, "immutablePathPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasPrefix:", v8))
  {

  }
  else
  {
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFImmutableOnlyFileReader immutableInternalPathPrefix](self, "immutableInternalPathPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hasPrefix:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  -[FFImmutableOnlyFileReader underlying](self, "underlying");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentsOfDirectoryAtURL:error:", v6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (FFFileReader)underlying
{
  return self->_underlying;
}

- (void)setUnderlying:(id)a3
{
  objc_storeStrong((id *)&self->_underlying, a3);
}

- (NSString)immutablePathPrefix
{
  return self->_immutablePathPrefix;
}

- (void)setImmutablePathPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_immutablePathPrefix, a3);
}

- (NSString)immutableInternalPathPrefix
{
  return self->_immutableInternalPathPrefix;
}

- (void)setImmutableInternalPathPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_immutableInternalPathPrefix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immutableInternalPathPrefix, 0);
  objc_storeStrong((id *)&self->_immutablePathPrefix, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
