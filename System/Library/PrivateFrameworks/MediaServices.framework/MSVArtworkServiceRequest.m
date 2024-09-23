@implementation MSVArtworkServiceRequest

- (MSVArtworkServiceRequest)init
{
  MSVArtworkServiceRequest *v2;
  uint64_t v3;
  NSMutableDictionary *sandboxExtensions;
  uint64_t v5;
  NSMutableArray *sandboxHandles;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSVArtworkServiceRequest;
  v2 = -[MSVArtworkServiceRequest init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    sandboxExtensions = v2->_sandboxExtensions;
    v2->_sandboxExtensions = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    sandboxHandles = v2->_sandboxHandles;
    v2->_sandboxHandles = (NSMutableArray *)v5;

  }
  return v2;
}

- (MSVArtworkServiceRequest)initWithCoder:(id)a3
{
  id v4;
  MSVArtworkServiceRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *sandboxExtensions;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *sandboxHandles;

  v4 = a3;
  v5 = -[MSVArtworkServiceRequest init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("MSVArtworkServiceRequestSandboxExtensions"));
    v10 = objc_claimAutoreleasedReturnValue();
    sandboxExtensions = v5->_sandboxExtensions;
    v5->_sandboxExtensions = (NSMutableDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("MSVArtworkServiceRequestSandboxHandles"));
    v15 = objc_claimAutoreleasedReturnValue();
    sandboxHandles = v5->_sandboxHandles;
    v5->_sandboxHandles = (NSMutableArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *sandboxExtensions;
  id v5;

  sandboxExtensions = self->_sandboxExtensions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sandboxExtensions, CFSTR("MSVArtworkServiceRequestSandboxExtensions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sandboxHandles, CFSTR("MSVArtworkServiceRequestSandboxHandles"));

}

- (void)addSandboxExtensionIfNeededForURL:(id)a3
{
  void *v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sandboxExtensions, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    getpid();
    objc_msgSend(v11, "path");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v5, "UTF8String");
    v6 = sandbox_check();

    if (!v6)
    {
      objc_msgSend(v11, "path", v10);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "fileSystemRepresentation");
      v8 = (void *)sandbox_extension_issue_file();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sandboxExtensions, "setObject:forKeyedSubscript:", v9, v11);

        free(v8);
      }
    }
  }

}

- (void)consumeSandboxExtensions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *sandboxHandles;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_sandboxExtensions, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7)), "UTF8String");
        v8 = sandbox_extension_consume();
        sandboxHandles = self->_sandboxHandles;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](sandboxHandles, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)releaseSandboxExtensions
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_sandboxHandles;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "longLongValue", (_QWORD)v7);
        sandbox_extension_release();
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (Class)operationClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVArtworkServiceRequest.m"), 99, CFSTR("Subclass must implement!"));

  return 0;
}

- (int64_t)operationPriority
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxHandles, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
}

+ (BOOL)canConnectToMediaArtworkService
{
  getpid();
  objc_msgSend(CFSTR("com.apple.mediaartworkd.xpc"), "UTF8String");
  return sandbox_check() == 0;
}

+ (BOOL)hasWriteAccessToPath:(id)a3
{
  id v3;

  if (!a3)
    return 0;
  objc_msgSend(a3, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "fileSystemRepresentation");

  getpid();
  return sandbox_check() == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
