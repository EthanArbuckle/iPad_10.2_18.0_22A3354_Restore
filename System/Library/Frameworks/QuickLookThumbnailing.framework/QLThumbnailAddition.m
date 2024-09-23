@implementation QLThumbnailAddition

- (QLThumbnailAddition)initWithAdditionsPresentOnURL:(id)a3 includingExtendedAttributes:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  QLThumbnailAddition *v9;
  QLThumbnailAddition *v10;
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v17;
  objc_super v18;

  v6 = a4;
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLThumbnailAddition;
  v9 = -[QLThumbnailAddition init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v6)
    {
      v17 = 0;
      v11 = -[QLThumbnailAddition _initWithXattrsPresentOnURL:error:](v9, "_initWithXattrsPresentOnURL:error:", v8, &v17);
      v12 = v17;
      v13 = v12;
      if (v11)
      {
LABEL_18:

        goto LABEL_19;
      }
      if (objc_msgSend(v12, "code") != 93)
      {
        if (a5)
        {
          objc_msgSend(v13, "domain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
          {
            v15 = objc_msgSend(v13, "code");

            if (v15 == 2)
            {
              v13 = objc_retainAutorelease(v13);
              *a5 = v13;
              goto LABEL_17;
            }
          }
          else
          {

          }
          setErrorWrappingUnderlyingError(v13, CFSTR("QLThumbnailErrorDomain"), 102, a5);
        }
LABEL_17:

        v10 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      v13 = 0;
    }
    getpid();
    if (sandbox_check())
    {
      if (-[QLThumbnailAddition _initWithAdditionsPresentOnURLUsingDaemon:error:](v10, "_initWithAdditionsPresentOnURLUsingDaemon:error:", v8, a5, "com.apple.revisiond"))
      {
        goto LABEL_18;
      }
    }
    else if (-[QLThumbnailAddition _initWithAdditionsPresentOnURLDirectly:error:](v10, "_initWithAdditionsPresentOnURLDirectly:error:", v8, a5, "com.apple.revisiond"))
    {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_19:

  return v10;
}

- (QLThumbnailAddition)initWithAdditionsPresentOnURL:(id)a3 error:(id *)a4
{
  return -[QLThumbnailAddition initWithAdditionsPresentOnURL:includingExtendedAttributes:error:](self, "initWithAdditionsPresentOnURL:includingExtendedAttributes:error:", a3, 1, a4);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_additionURLSandboxToken)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)QLThumbnailAddition;
  -[QLThumbnailAddition dealloc](&v3, sel_dealloc);
}

- (BOOL)_initWithXattrsPresentOnURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *v10;
  NSDictionary *thumbnailDataDictionary;
  NSDictionary *v12;
  NSDictionary *metadata;
  BOOL v14;

  v6 = a3;
  if (QLThumbnailAdditionSimulateOneSlowIOForTesting)
  {
    QLThumbnailAdditionSimulateOneSlowIOForTesting = 0;
    sleep(5u);
  }
  v7 = objc_retainAutorelease(v6);
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 4);
  if ((v8 & 0x80000000) != 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "plistInExtendedAttributeNamed:flags:onFileDescriptor:error:", QLThumbnailDictionaryXattrName, 3, v8, a4);
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  thumbnailDataDictionary = self->_thumbnailDataDictionary;
  self->_thumbnailDataDictionary = v10;

  if (self->_thumbnailDataDictionary)
  {
    objc_msgSend((id)objc_opt_class(), "plistInExtendedAttributeNamed:flags:onFileDescriptor:error:", QLThumbnailMetadataXattrName, 3, v9, a4);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    metadata = self->_metadata;
    self->_metadata = v12;

  }
  close(v9);
  if (!self->_thumbnailDataDictionary)
    goto LABEL_10;
  v14 = self->_metadata != 0;
LABEL_11:

  return v14;
}

- (BOOL)_initWithAdditionsPresentOnURLDirectly:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  GSAddition *v8;
  id v9;
  GSAddition *addition;
  GSAddition *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  if (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", a4))
  {
    +[QLThumbnailAdditionCache sharedInstance](QLThumbnailAdditionCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "thumbnailAdditionForItemAtURL:error:", v6, &v17);
    v8 = (GSAddition *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    addition = self->_addition;
    self->_addition = v8;

    v11 = self->_addition;
    v12 = v11 != 0;
    if (v11)
    {
      -[GSAddition url](v11, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLThumbnailAddition setAdditionURL:](self, "setAdditionURL:", v13);

      -[GSAddition userInfo](self->_addition, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("QLThumbnailAdditionMetadataKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLThumbnailAddition setMetadata:](self, "setMetadata:", v15);

    }
    else
    {
      setErrorWrappingUnderlyingError(v9, CFSTR("QLThumbnailErrorDomain"), 102, a4);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailVersion, 0);
  objc_storeStrong((id *)&self->_thumbnailDataDictionary, 0);
  objc_storeStrong((id *)&self->_addition, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_additionURL, 0);
}

+ (id)plistInExtendedAttributeNamed:(const char *)a3 flags:(unint64_t)a4 onFileDescriptor:(int)a5 error:(id *)a6
{
  char *v8;
  char *v9;
  ssize_t v10;
  size_t v11;
  void *v12;
  void *v13;
  ssize_t v14;
  ssize_t v15;
  void *v16;

  v8 = xattr_name_with_flags(a3, a4);
  if (v8)
  {
    v9 = v8;
    v10 = fgetxattr(a5, v8, 0, 0, 0, 0);
    v11 = v10;
    if (a6 && v10 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      free(v9);
      goto LABEL_15;
    }
    if (v10 < 1)
      goto LABEL_14;
    v13 = malloc_type_malloc(v10, 0x5398AD07uLL);
    v14 = fgetxattr(a5, v9, v13, v11, 0, 0);
    if (v14 < 0)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      free(v13);
      goto LABEL_14;
    }
    v15 = v14;
    free(v9);
    if (v13)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v13, v15, 1);
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v16, 0, 0, a6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
LABEL_15:
    v12 = 0;
    return v12;
  }
  if (!a6)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
  v12 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (BOOL)shouldBeInvalidatedByThumbnailVersion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;

  v4 = a3;
  -[QLThumbnailAddition thumbnailVersion](self, "thumbnailVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _log_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[QLThumbnailAddition shouldBeInvalidatedByThumbnailVersion:].cold.1();

  if (v5)
    v7 = objc_msgSend(v5, "shouldBeInvalidatedByThumbnailWithVersion:", v4);
  else
    v7 = 1;

  return v7;
}

- (id)thumbnailURLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  -[QLThumbnailAddition metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("QLThumbnailMetadataFileNamesDictionaryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[QLThumbnailAddition additionURL](self, "additionURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      goto LABEL_7;
    }
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C998A8]))
  {
    -[QLThumbnailAddition metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("QLThumbnailMetadataFileNameKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v13 = 0;
LABEL_8:

      if (v13)
        goto LABEL_12;
      goto LABEL_9;
    }
    -[QLThumbnailAddition additionURL](self, "additionURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    v11 = v8;
LABEL_7:
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
LABEL_9:
  _log_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[QLThumbnailAddition thumbnailURLForKey:].cold.1(self);

  v13 = 0;
LABEL_12:

  return v13;
}

- (id)thumbnailDataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_thumbnailDataDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[QLThumbnailAddition thumbnailURLForKey:](self, "thumbnailURLForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v6, 1, 0);
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)_initWithAdditionsPresentOnURLUsingDaemon:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke;
    v21[3] = &unk_1E5D7C810;
    v23 = &v24;
    v10 = v8;
    v22 = v10;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_76;
    v18[3] = &unk_1E5D7C838;
    v18[4] = self;
    v20 = &v24;
    v12 = v10;
    v19 = v12;
    objc_msgSend(v11, "thumbnailsStoreURLForURL:completionBlock:", v6, v18);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v13 = (void *)v25[5];
    if (v13)
    {
      if (objc_msgSend(v13, "code"))
        v14 = 101;
      else
        v14 = 102;
      setErrorWrappingUnderlyingError((void *)v25[5], CFSTR("QLThumbnailErrorDomain"), v14, a4);
    }
    else if (a4)
    {
      *a4 = 0;
    }
    -[QLThumbnailAddition additionURL](self, "additionURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16 != 0;

  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_76(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v9)
  {
    objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
    objc_msgSend(*(id *)(a1 + 32), "setAdditionURLSandboxToken:", sandbox_extension_consume());
    objc_msgSend(*(id *)(a1 + 32), "setAdditionURL:", v9);
    objc_msgSend(*(id *)(a1 + 32), "setMetadata:", v10);
  }
  else
  {
    _log_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_76_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (BOOL)setPropertyList:(id)a3 forExtendedAttributeNamed:(const char *)a4 flags:(unint64_t)a5 onFileDescriptor:(int)a6 error:(id *)a7
{
  uint64_t v8;
  id v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;

  v8 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = xattr_name_with_flags(a4, a5);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_retainAutorelease(v14);
      if (!fsetxattr(v8, v13, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), 0, 0))
      {
        v24 = 1;
        goto LABEL_13;
      }
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      _log_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition setPropertyList:forExtendedAttributeNamed:flags:onFileDescriptor:error:].cold.1(v8, v17, v18, v19, v20, v21, v22, v23);

    }
    v24 = 0;
LABEL_13:
    free(v13);

    goto LABEL_14;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v24 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
LABEL_14:

  return v24;
}

+ (BOOL)removeExtendedAttributeNamed:(const char *)a3 flags:(unint64_t)a4 onFileDescriptor:(int)a5 error:(id *)a6
{
  uint64_t v7;
  char *v8;
  char *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = *(_QWORD *)&a5;
  v8 = xattr_name_with_flags(a3, a4);
  if (v8)
  {
    v9 = v8;
    if (fremovexattr(v7, v8, 0) && *__error() != 93)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      _log_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition removeExtendedAttributeNamed:flags:onFileDescriptor:error:].cold.1(v7, v10, v11, v12, v13, v14, v15, v16);

    }
    free(v9);
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (unint64_t)sizeOfAdditionsPresentOnURL:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  ssize_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = xattr_name_with_flags((const char *)QLThumbnailDictionaryXattrName, 3uLL);
  if (!v5
    || (v6 = v5,
        v7 = getxattr((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), v5, 0, 0, 0, 0), free(v6), v7 <= 0))
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAdditionsPresentOnURL:includingExtendedAttributes:error:", v4, 0, 0);
    v9 = v8;
    if (v8)
      v7 = objc_msgSend(v8, "additionSize");
    else
      v7 = 0;

  }
  return v7;
}

- (QLThumbnailVersion)thumbnailVersion
{
  QLThumbnailVersion *thumbnailVersion;
  void *v4;
  void *v5;
  QLThumbnailVersion *v6;
  QLThumbnailVersion *v7;

  thumbnailVersion = self->_thumbnailVersion;
  if (!thumbnailVersion)
  {
    -[QLThumbnailAddition metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("QLThumbnailMetadataFileVersionKey.2"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[QLThumbnailVersion initWithDictionaryRepresentation:]([QLThumbnailVersion alloc], "initWithDictionaryRepresentation:", v5);
        v7 = self->_thumbnailVersion;
        self->_thumbnailVersion = v6;

      }
    }

    thumbnailVersion = self->_thumbnailVersion;
  }
  return thumbnailVersion;
}

- (CGImage)thumbnailWithMaximumDimension:(double)a3 contentRect:(CGRect *)a4 properties:(id *)a5
{
  const __CFData *v9;
  const __CFData *v10;
  CGImageSource *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFDictionary *v20;
  CGImageRef ImageAtIndex;
  CGImageRef v22;
  void *v23;
  void *v24;
  NSString *v25;
  CGImage *v26;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  -[QLThumbnailAddition thumbnailDataForKey:](self, "thumbnailDataForKey:", *MEMORY[0x1E0C998A8]);
  v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = CGImageSourceCreateWithData(v9, 0);
  else
    v11 = 0;
  -[QLThumbnailAddition metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("QLThumbnailMetadataMaximumDimensionKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (!v11)
    goto LABEL_17;
  v16 = 1024.0;
  if (v15 != 0.0)
    v16 = v15;
  if (v16 <= a3)
  {
    v28 = *MEMORY[0x1E0CBD250];
    v29 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, v20);
  }
  else
  {
    v17 = MEMORY[0x1E0C9AAB0];
    v18 = *MEMORY[0x1E0CBD178];
    v30[0] = *MEMORY[0x1E0CBD190];
    v30[1] = v18;
    v31[0] = MEMORY[0x1E0C9AAB0];
    v31[1] = MEMORY[0x1E0C9AAB0];
    v30[2] = *MEMORY[0x1E0CBD2A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = *MEMORY[0x1E0CBD250];
    v31[2] = v19;
    v31[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    ImageAtIndex = CGImageSourceCreateThumbnailAtIndex(v11, 0, v20);
  }
  v22 = ImageAtIndex;

  CFRelease(v11);
  if (v22)
  {
    if (a5)
    {
      -[QLThumbnailAddition metadata](self, "metadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueForKey:", CFSTR("QLThumbnailMetadataQLPropertiesKey"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[QLThumbnailAddition metadata](self, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForKey:", CFSTR("QLThumbnailMetadataContentRectKey"));
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (a4 && v25)
      *a4 = NSRectFromString(v25);
    v26 = (CGImage *)CFAutorelease(v22);

  }
  else
  {
LABEL_17:
    v26 = 0;
  }

  return v26;
}

+ (id)additionCreationInfo
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D25CE0];
  v6[0] = *MEMORY[0x1E0D25CD8];
  v6[1] = v2;
  v7[0] = CFSTR("com.apple.thumbnails");
  v7[1] = &unk_1E5D86A50;
  v6[2] = *MEMORY[0x1E0D25CD0];
  objc_msgSend(MEMORY[0x1E0D25D38], "makeNameForUser:name:", getuid(), CFSTR("QLThumbnailAdditionName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_hitAdditionsOnURL:(id)a3 size:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[3];
  char v22;
  id v23;

  v7 = a3;
  v8 = a5;
  v23 = 0;
  +[QLThumbnailServiceProxy sharedInstanceWithError:](QLThumbnailServiceProxy, "sharedInstanceWithError:", &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  if (v9)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke;
    v19[3] = &unk_1E5D7C860;
    v12 = v8;
    v20 = v12;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_85;
    v14[3] = &unk_1E5D7C8D8;
    v16 = v12;
    v17 = v21;
    v18 = a4;
    v15 = v7;
    objc_msgSend(v13, "askThumbnailAdditionIndex:", v14);

    _Block_object_dispose(v21, 8);
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    objc_msgSend(getFPSandboxingURLWrapperClass(), "wrapperWithURL:extensionClass:error:", v6, "com.apple.quicklook.readonly", &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
    if (v8)
    {
      _log_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:].cold.1();

    }
    v10 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_87;
    v22[3] = &unk_1E5D7C860;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v22);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_88;
    v17[3] = &unk_1E5D7C8B0;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    v21 = *(_QWORD *)(a1 + 56);
    v16 = *(_OWORD *)(a1 + 40);
    v11 = (id)v16;
    v20 = v16;
    v12 = v7;
    v13 = v18;
    objc_msgSend(v13, "hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:", v12, 1, v21, v17);

  }
  else
  {
    _log_0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_85_cold_1();

    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, 0);
  }

}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_87_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_88(_QWORD *a1, char a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  if ((a2 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v2 = a1[6];
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[8];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5D7C888;
    v7 = *((_OWORD *)a1 + 3);
    v6 = (id)v7;
    v9 = v7;
    objc_msgSend(v3, "addThumbnailForURLWrapper:size:completion:", v4, v5, v8);

  }
}

uint64_t __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (BOOL)storeThumbnailDataDictionary:(id)a3 metadata:(id)a4 asExtendedAttributeOnURL:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v10 = a3;
  v11 = a4;
  v12 = open((const char *)objc_msgSend(objc_retainAutorelease(a5), "fileSystemRepresentation"), 4);
  if ((v12 & 0x80000000) != 0)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v13 = v12;
  if ((objc_msgSend(a1, "setPropertyList:forExtendedAttributeNamed:flags:onFileDescriptor:error:", v10, QLThumbnailDictionaryXattrName, 3, v12, a6) & 1) == 0)
  {
    close(v13);
    goto LABEL_7;
  }
  v14 = objc_msgSend(a1, "setPropertyList:forExtendedAttributeNamed:flags:onFileDescriptor:error:", v11, QLThumbnailMetadataXattrName, 3, v13, a6);
  close(v13);
LABEL_8:

  return v14;
}

+ (BOOL)removeThumbnailsStoredInExtendedAttributesOnURL:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  char v8;

  v6 = open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 4);
  if ((v6 & 0x80000000) != 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = v6;
    if ((objc_msgSend(a1, "removeExtendedAttributeNamed:flags:onFileDescriptor:error:", QLThumbnailDictionaryXattrName, 3, v6, a4) & 1) != 0)
    {
      v8 = objc_msgSend(a1, "removeExtendedAttributeNamed:flags:onFileDescriptor:error:", QLThumbnailMetadataXattrName, 3, v7, a4);
      close(v7);
      return v8;
    }
    close(v7);
  }
  return 0;
}

+ (BOOL)associateThumbnailImagesDictionary:(id)a3 serializedQuickLookMetadata:(id)a4 withDocumentAtURL:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:", a3, a4, 0, a5, a6);
}

+ (id)imageNameFor1024ThumbnailInMetadataDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("QLThumbnailMetadataFileNamesDictionaryKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C998A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("QLThumbnailMetadataFileNameKey"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)imageNameForThumbnailInImageSource:(CGImageSource *)a3
{
  CFStringRef Type;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  Type = CGImageSourceGetType(a3);
  if (Type)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", Type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "preferredFilenameExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(CFSTR("thumbnail"), "stringByAppendingPathExtension:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)imageNameFor1024ThumbnailAtURL:(id)a3 metadataDictionary:(id)a4
{
  const __CFURL *v6;
  void *v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  id v10;

  v6 = (const __CFURL *)a3;
  objc_msgSend(a1, "imageNameFor1024ThumbnailInMetadataDictionary:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = CGImageSourceCreateWithURL(v6, 0);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(a1, "imageNameForThumbnailInImageSource:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v9);
    }
    else
    {
      v7 = 0;
    }
  }
  v10 = v7;

  return v10;
}

+ (id)imageNameFor1024ThumbnailData:(id)a3 metadataDictionary:(id)a4
{
  const __CFData *v6;
  void *v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  id v10;

  v6 = (const __CFData *)a3;
  objc_msgSend(a1, "imageNameFor1024ThumbnailInMetadataDictionary:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = CGImageSourceCreateWithData(v6, 0);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(a1, "imageNameForThumbnailInImageSource:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v9);
    }
    else
    {
      v7 = 0;
    }
  }
  v10 = v7;

  return v10;
}

+ (BOOL)associateThumbnailImagesDictionary:(id)a3 serializedQuickLookMetadata:(id)a4 withImmutableDocument:(BOOL)a5 atURL:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  char v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  QLThumbnailVersion *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v53;
  id v54;
  void *v55;
  id v56;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  const __CFString *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v10, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v64;
    v18 = *MEMORY[0x1E0C99998];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v64 != v17)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        v62 = 0;
        if (objc_msgSend(v20, "getResourceValue:forKey:error:", &v62, v18, 0))
          v16 += objc_msgSend(v62, "unsignedIntegerValue");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  v21 = *MEMORY[0x1E0C998A8];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C998A8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v61 = 0;
    v24 = objc_msgSend(v22, "checkResourceIsReachableAndReturnError:", &v61);
    v25 = v61;
    v26 = v25;
    if ((v24 & 1) == 0)
    {
      _log_0();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:].cold.3();

      v29 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v26);
      goto LABEL_50;
    }
    v56 = v25;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    objc_msgSend(a1, "imageNameFor1024ThumbnailAtURL:metadataDictionary:", v23, v27);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (!v31)
    {
      _log_0();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:].cold.2();

      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
        v29 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      v42 = v27;
      goto LABEL_49;
    }
    v53 = (void *)v31;
    v54 = v11;
    v69 = v21;
    v70 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFileURL:automaticallyGenerated:", v12, 0);
    -[QLThumbnailVersion dictionaryRepresentation](v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v55 = (void *)objc_msgSend(v27, "mutableCopy");
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v33, CFSTR("QLThumbnailMetadataFileNamesDictionaryKey"));
      if (!v35)
      {
LABEL_38:

        objc_msgSend(a1, "_hitAdditionsOnURL:size:completionHandler:", v12, v16, 0);
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __120__QLThumbnailAddition_associateThumbnailImagesDictionary_serializedQuickLookMetadata_withImmutableDocument_atURL_error___block_invoke;
          v59[3] = &unk_1E5D7C900;
          v60 = v39;
          v40 = v39;
          objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v59);
          v41 = a1;
          v42 = v55;
          v29 = objc_msgSend(v41, "storeThumbnailDataDictionary:metadata:asExtendedAttributeOnURL:error:", v40, v55, v12, a7);
          objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7);

          v32 = v53;
          v11 = v54;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D25D48], "manager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "permanentStorageForItemAtURL:allocateIfNone:error:", v12, 1, a7);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v54;
          if (v44)
          {
            objc_msgSend(v44, "stagingURLforCreatingAdditionWithError:", a7);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45;
            if (v45)
            {
              objc_msgSend(v45, "URLByAppendingPathComponent:", CFSTR("thumbnail.qlthumbnail"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "URLByAppendingPathComponent:isDirectory:", v53, 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v47, 0, 0, 0);

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "moveItemAtURL:toURL:error:", v23, v48, 0);

              objc_msgSend(a1, "adjustFileProtectionForThumbnail:fromOriginalDocument:", v48, v12);
              v51 = a1;
              v42 = v55;
              v29 = objc_msgSend(v51, "makeAdditionFromStagingURL:metadata:inStorage:error:", v47, v55, v44, a7);

              v11 = v54;
            }
            else
            {
              v29 = 0;
              v42 = v55;
            }

            v32 = v53;
          }
          else
          {
            v29 = 0;
            v32 = v53;
            v42 = v55;
          }

        }
LABEL_49:

        v26 = v56;
LABEL_50:

        goto LABEL_51;
      }
    }
    else
    {
      v67 = CFSTR("QLThumbnailMetadataFileNamesDictionaryKey");
      v68 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v37, "mutableCopy");

      if (!v35)
        goto LABEL_38;
    }
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("QLThumbnailMetadataFileVersionKey.2"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v35, CFSTR("QLThumbnailMetadataFileVersionKey.2"));
    goto LABEL_38;
  }
  _log_0();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:].cold.1();

  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v29 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
LABEL_51:

  return v29;
}

void __120__QLThumbnailAddition_associateThumbnailImagesDictionary_serializedQuickLookMetadata_withImmutableDocument_atURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v5, 1, 0);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

  }
}

void __120__QLThumbnailAddition_associateThumbnailImagesDictionary_serializedQuickLookMetadata_withImmutableDocument_atURL_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtURL:error:", v4, 0);

  }
}

+ (void)adjustFileProtectionForThumbnail:(id)a3 fromOriginalDocument:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v19 = 0;
    v8 = *MEMORY[0x1E0C99938];
    v18 = 0;
    v9 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v19, v8, &v18);
    v10 = v19;
    v11 = v18;
    v12 = v11;
    if (v9)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (v13)
    {
      _log_0();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition adjustFileProtectionForThumbnail:fromOriginalDocument:].cold.2();
      v16 = v12;
    }
    else
    {
      v17 = v11;
      v15 = objc_msgSend(v5, "setResourceValue:forKey:error:", v10, v8, &v17);
      v16 = v17;

      if ((v15 & 1) != 0)
        goto LABEL_14;
      _log_0();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition adjustFileProtectionForThumbnail:fromOriginalDocument:].cold.1();
    }

LABEL_14:
  }

}

+ (BOOL)hasThumbnailOnImmutableDocumentAtURL:(id)a3
{
  const char *v3;
  char *v4;
  char *v5;
  BOOL v6;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v4 = xattr_name_with_flags((const char *)QLThumbnailDictionaryXattrName, 3uLL);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = getxattr(v3, v4, 0, 0, 0, 0) >= 0;
  free(v5);
  return v6;
}

+ (BOOL)makeAdditionFromStagingURL:(id)a3 metadata:(id)a4 inStorage:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  dispatch_semaphore_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  const __CFString *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend((id)objc_opt_class(), "additionCreationInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v10)
  {
    v46 = CFSTR("QLThumbnailAdditionMetadataKey");
    v47[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0D25CF8]);

  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  obj = 0;
  objc_msgSend(v11, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", v9, 1, v13, &obj);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v43, obj);
  if (v15)
  {
    objc_msgSend(v11, "documentURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v17 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v36, *MEMORY[0x1E0C998F8], 0);
    v18 = v36;

    if ((v17 & 1) == 0)
    {

      v18 = 0;
    }
    v19 = dispatch_semaphore_create(0);
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __75__QLThumbnailAddition_makeAdditionFromStagingURL_metadata_inStorage_error___block_invoke;
    v27[3] = &unk_1E5D7C948;
    v30 = &v32;
    v20 = v18;
    v28 = v20;
    v31 = &v38;
    v21 = v19;
    v29 = v21;
    objc_msgSend(v11, "createAdditionStagedAtURL:creationInfo:completionHandler:", v15, v13, v27);
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v33 + 24))
    {
      _log_0();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v11;
        _os_log_impl(&dword_1AE3F5000, v22, OS_LOG_TYPE_INFO, "Saved addition in storage %@", buf, 0xCu);
      }

    }
    else
    {
      _log_0();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition makeAdditionFromStagingURL:metadata:inStorage:error:].cold.2();

      setErrorWrappingUnderlyingError((void *)v39[5], CFSTR("QLThumbnailErrorDomain"), 101, a6);
    }
    v24 = *((_BYTE *)v33 + 24) != 0;

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    _log_0();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[QLThumbnailAddition makeAdditionFromStagingURL:metadata:inStorage:error:].cold.1();

    setErrorWrappingUnderlyingError((void *)v39[5], CFSTR("QLThumbnailErrorDomain"), 101, a6);
    v24 = 0;
  }

  _Block_object_dispose(&v38, 8);
  return v24;
}

void __75__QLThumbnailAddition_makeAdditionFromStagingURL_metadata_inStorage_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9 != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = v5;
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
    goto LABEL_5;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    +[QLThumbnailAdditionCache sharedInstance](QLThumbnailAdditionCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheAddition:forDocumentID:", v9, *(_QWORD *)(a1 + 32));
LABEL_5:

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (BOOL)imageContainsAlphaForOtherImages:(CGImage *)a3
{
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *DeviceGray;
  CGContext *v7;
  size_t BytesPerRow;
  char *Data;
  uint64_t i;
  unint64_t v11;
  char *v12;
  BOOL v13;
  CGRect v15;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v7 = CGBitmapContextCreate(0, Width, Height, 8uLL, Width, DeviceGray, 7u);
  CFRelease(DeviceGray);
  if (!v7)
    return 0;
  BytesPerRow = CGBitmapContextGetBytesPerRow(v7);
  if (CGBitmapContextGetBitsPerPixel(v7) != 8)
    +[QLThumbnailAddition imageContainsAlphaForOtherImages:].cold.1();
  v15.size.width = (double)Width;
  v15.size.height = (double)Height;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  CGContextDrawImage(v7, v15, a3);
  Data = (char *)CGBitmapContextGetData(v7);
  if (Height)
  {
    for (i = 0; i != Height; ++i)
    {
      v11 = (unint64_t)&Data[Width - 8];
      v12 = Data;
      if ((unint64_t)Data >= v11)
        goto LABEL_11;
      do
      {
        if (*(_QWORD *)v12 != -1)
        {
LABEL_14:
          v13 = 1;
          goto LABEL_15;
        }
        v12 += 8;
      }
      while ((unint64_t)v12 < v11);
LABEL_11:
      while (v12 < &Data[Width])
      {
        if (*v12 != 255)
          goto LABEL_14;
        ++v12;
      }
      Data += BytesPerRow;
    }
  }
  v13 = 0;
LABEL_15:
  CGContextRelease(v7);
  return v13;
}

+ (BOOL)imageContainsAlpha:(CGImage *)a3
{
  CGBitmapInfo v5;
  size_t BitsPerPixel;
  size_t v7;
  BOOL result;
  size_t v9;
  CGDataProvider *DataProvider;
  CFDataRef v11;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  const __CFData *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  if (CGImageGetBitsPerComponent(a3) != 8)
    return objc_msgSend(a1, "imageContainsAlphaForOtherImages:", a3);
  v5 = CGImageGetBitmapInfo(a3) & 0x1F;
  BitsPerPixel = CGImageGetBitsPerPixel(a3);
  v7 = 0;
  result = 0;
  v9 = BitsPerPixel >> 3;
  switch(v5)
  {
    case 0u:
    case 5u:
    case 6u:
      return result;
    case 1u:
    case 3u:
      v7 = v9 - 1;
      goto LABEL_4;
    case 2u:
    case 4u:
LABEL_4:
      DataProvider = CGImageGetDataProvider(a3);
      v11 = CGDataProviderCopyData(DataProvider);
      Width = CGImageGetWidth(a3);
      Height = CGImageGetHeight(a3);
      BytesPerRow = CGImageGetBytesPerRow(a3);
      v15 = objc_retainAutorelease(v11);
      v16 = -[__CFData bytes](v15, "bytes");
      if (!Height)
        goto LABEL_11;
      v17 = 0;
      v18 = Width * v9;
      break;
    default:
      return objc_msgSend(a1, "imageContainsAlphaForOtherImages:", a3);
  }
  while (v18 < 1)
  {
LABEL_10:
    v16 += BytesPerRow;
    if (++v17 == Height)
    {
LABEL_11:
      CFRelease(v15);
      return 0;
    }
  }
  v19 = v16;
  while (*(unsigned __int8 *)(v19 + v7) == 255)
  {
    v19 += v9;
    if (v19 >= v16 + v18)
      goto LABEL_10;
  }
  CFRelease(v15);
  return 1;
}

+ (id)metadataForGeneratedThumbnailForURL:(id)a3 maximumDimension:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  QLThumbnailVersion *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFileURL:automaticallyGenerated:", v6, 1);

  -[QLThumbnailVersion dictionaryRepresentation](v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("QLThumbnailMetadataFileVersionKey.2"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("QLThumbnailMetadataMaximumDimensionKey"));

  return v7;
}

+ (BOOL)associateImage:(CGImage *)a3 metadata:(id)a4 automaticallyGenerated:(BOOL)a5 withURL:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  size_t Width;
  size_t Height;
  unint64_t v22;
  double v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  QLThumbnailVersion *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFURL *v36;
  const __CFURL *v37;
  CGImageDestination *v38;
  NSObject *v39;
  char v40;
  NSObject *v41;
  __CFString *v42;
  const __CFDictionary *v43;
  int v44;
  id v45;
  void *v46;
  uint64_t v47;
  _BOOL4 v49;
  id *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[2];

  v9 = a5;
  v58[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  _log_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:].cold.4();

  v15 = objc_msgSend(a1, "imageContainsAlpha:", a3);
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v16, "permanentStorageForItemAtURL:allocateIfNone:error:", v13, 1, &v56);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v56;

  if (v17)
  {
    v55 = v18;
    objc_msgSend(v17, "stagingURLforCreatingAdditionWithError:", &v55);
    v19 = objc_claimAutoreleasedReturnValue();
    v52 = v55;

    v53 = (void *)v19;
    if (v19)
    {
      v49 = v9;
      v50 = a7;
      Width = CGImageGetWidth(a3);
      Height = CGImageGetHeight(a3);
      if (Width <= Height)
        v22 = Height;
      else
        v22 = Width;
      v23 = (double)v22;
      if (v15)
        v24 = CFSTR("jp2");
      else
        v24 = CFSTR("jpg");
      objc_msgSend(CFSTR("thumbnail"), "stringByAppendingPathExtension:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("QLThumbnailMetadataMaximumDimensionKey"));

      v57 = *MEMORY[0x1E0C998A8];
      v58[0] = v25;
      v51 = (void *)v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("QLThumbnailMetadataFileNamesDictionaryKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("QLThumbnailMetadataVersionKey"));

      if (v12)
        objc_msgSend(v26, "addEntriesFromDictionary:", v12);
      objc_msgSend(v26, "valueForKey:", CFSTR("QLThumbnailMetadataFileVersionKey.2"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v31 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFileURL:automaticallyGenerated:", v13, v49);
        _log_0();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:].cold.3();

        -[QLThumbnailVersion dictionaryRepresentation](v31, "dictionaryRepresentation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setValue:forKey:", v33, CFSTR("QLThumbnailMetadataFileVersionKey.2"));

      }
      objc_msgSend(v53, "URLByAppendingPathComponent:", CFSTR("thumbnail.qlthumbnail"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v34, 0, 0, 0);

      objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", v51, 0);
      v36 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v15)
      {
        v38 = CGImageDestinationCreateWithURL(v36, (CFStringRef)*MEMORY[0x1E0CA5BB0], 1uLL, 0);
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v38 = CGImageDestinationCreateWithURL(v37, v42, 1uLL, 0);

      }
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", &unk_1E5D86A68, *MEMORY[0x1E0CBC780]);
      v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGImageDestinationSetProperties(v38, v43);
      CGImageDestinationAddImage(v38, a3, 0);
      CGImageDestinationFinalize(v38);
      CFRelease(v38);
      objc_msgSend(a1, "adjustFileProtectionForThumbnail:fromOriginalDocument:", v37, v13);
      v54 = 0;
      v44 = -[__CFURL getResourceValue:forKey:error:](v37, "getResourceValue:forKey:error:", &v54, *MEMORY[0x1E0C99998], 0);
      v45 = v54;
      v46 = v45;
      v47 = 0;
      if (v44)
        v47 = objc_msgSend(v45, "unsignedIntegerValue");
      objc_msgSend(a1, "_hitAdditionsOnURL:size:completionHandler:", v13, v47, 0);
      v40 = objc_msgSend(a1, "makeAdditionFromStagingURL:metadata:inStorage:error:", v34, v26, v17, v50);

      v18 = v52;
    }
    else
    {
      _log_0();
      v41 = objc_claimAutoreleasedReturnValue();
      v18 = v52;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:].cold.2();

      setErrorWrappingUnderlyingError(v52, CFSTR("QLThumbnailErrorDomain"), 101, a7);
      v40 = 0;
    }

  }
  else
  {
    _log_0();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      +[QLThumbnailAddition associateImage:metadata:automaticallyGenerated:withURL:error:].cold.1();

    setErrorWrappingUnderlyingError(v18, CFSTR("QLThumbnailErrorDomain"), 101, a7);
    v40 = 0;
  }

  return v40;
}

+ (BOOL)_removeAdditionsOnURLDirectly:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v6, "permanentStorageForItemAtURL:allocateIfNone:error:", v5, 0, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  v9 = v8;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  if (v7)
  {
    v10 = dispatch_semaphore_create(0);
    v32[0] = CFSTR("com.apple.thumbnails");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__QLThumbnailAddition__removeAdditionsOnURLDirectly_error___block_invoke;
    v16[3] = &unk_1E5D7C970;
    v19 = &v27;
    v20 = &v21;
    v17 = v5;
    v12 = v10;
    v18 = v12;
    objc_msgSend(v7, "removeAllAdditionsForNamespaces:completionHandler:", v11, v16);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      v13 = (void *)v22[5];
      if (v13)
        *a4 = objc_retainAutorelease(v13);
    }

  }
  else
  {
    v30 = 0;
    setErrorWrappingUnderlyingError(v8, (void *)*MEMORY[0x1E0CB28A8], 4, a4);
  }
  v14 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void __59__QLThumbnailAddition__removeAdditionsOnURLDirectly_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = (uint64_t *)MEMORY[0x1E0CB3388];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v12 = *v4;
    v13[0] = a2;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a2;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = 0;
    +[QLThumbnailAdditionCache sharedInstance](QLThumbnailAdditionCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "purgeCachedAdditionForItemAtURL:", *(_QWORD *)(a1 + 32));
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)_removeAdditionsOnURLUsingDaemon:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  int v9;
  BOOL v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__QLThumbnailAddition__removeAdditionsOnURLUsingDaemon_error___block_invoke;
    v12[3] = &unk_1E5D7C998;
    v14 = &v22;
    v15 = &v16;
    v8 = v7;
    v13 = v8;
    objc_msgSend(v6, "removeThumbnailAdditionsOnURL:completionBlock:", v5, v12);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v9 = *((unsigned __int8 *)v23 + 24);
    if (!*((_BYTE *)v23 + 24))
    {
      setErrorWrappingUnderlyingError((void *)v17[5], (void *)*MEMORY[0x1E0CB28A8], 4, a4);
      v9 = *((unsigned __int8 *)v23 + 24);
    }
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __62__QLThumbnailAddition__removeAdditionsOnURLUsingDaemon_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    _log_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_76_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (BOOL)_removedAdditionsOnURLUsingDaemon:(id)a3
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v3 = a3;
  +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = dispatch_semaphore_create(0);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke;
    v16[3] = &unk_1E5D7C5B8;
    v7 = v5;
    v17 = v7;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2;
    v12[3] = &unk_1E5D7C9E8;
    v9 = v7;
    v13 = v9;
    v14 = v3;
    v15 = &v18;
    objc_msgSend(v8, "askThumbnailAdditionIndex:", v12);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v10 = *((_BYTE *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

intptr_t __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_104;
    v11[3] = &unk_1E5D7C5B8;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2_105;
    v8[3] = &unk_1E5D7C9C0;
    v6 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "removeThumbnailForURL:completion:", v6, v8);

  }
  else
  {
    _log_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_85_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

intptr_t __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_104(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __57__QLThumbnailAddition__removedAdditionsOnURLUsingDaemon___block_invoke_2_105(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)removeAdditionsOnURL:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  char v10;

  v6 = a3;
  getpid();
  v7 = sandbox_check();
  _log_0();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v7)
  {
    if (v9)
      +[QLThumbnailAddition removeAdditionsOnURL:error:].cold.1();

    if ((objc_msgSend(a1, "_removeAdditionsOnURLDirectly:error:", v6, a4, "com.apple.revisiond") & 1) != 0)
      goto LABEL_5;
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (v9)
    +[QLThumbnailAddition removeAdditionsOnURL:error:].cold.2();

  if (!objc_msgSend(a1, "_removeAdditionsOnURLUsingDaemon:error:", v6, a4, "com.apple.revisiond"))
    goto LABEL_9;
LABEL_5:
  v10 = objc_msgSend(a1, "_removedAdditionsOnURL:", v6);
LABEL_10:

  return v10;
}

- (id)thumbnailsDictionaryWithError:(id *)a3
{
  id v4;
  CGImage *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = QLTImageClassWithError(a3);
  if (v4)
  {
    v5 = -[QLThumbnailAddition thumbnailWithMaximumDimension:contentRect:properties:](self, "thumbnailWithMaximumDimension:contentRect:properties:", 0, 0, 1024.0);
    if (v5)
    {
      v9 = *MEMORY[0x1E0C998A8];
      objc_msgSend(v4, "imageWithCGImage:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    v4 = 0;
  }
  return v4;
}

+ (id)thumbnailsDictionaryForURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = 0;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAdditionsPresentOnURL:error:", v6, &v25);
  v8 = v25;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(v8, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("QLThumbnailErrorDomain")))
    {
      v14 = objc_msgSend(v9, "code");

      if (v14 == 102)
      {
        _log_0();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v6;
          _os_log_impl(&dword_1AE3F5000, v15, OS_LOG_TYPE_INFO, "No thumbnail present for %@, pondering generation", buf, 0xCu);
        }

        if (thumbnailsDictionaryForURL_error__once != -1)
          dispatch_once(&thumbnailsDictionaryForURL_error__once, &__block_literal_global_106);
        v16 = thumbnailsDictionaryForURL_error__sDownloadingQueue;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2;
        v22[3] = &unk_1E5D7CA30;
        v23 = v6;
        v24 = a1;
        dispatch_async(v16, v22);

        goto LABEL_19;
      }
    }
    else
    {

    }
    _log_0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[QLThumbnailAddition thumbnailsDictionaryForURL:error:].cold.1();

    if (a4)
    {
      v12 = 0;
      *a4 = objc_retainAutorelease(v9);
      goto LABEL_20;
    }
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  _log_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1AE3F5000, v10, OS_LOG_TYPE_INFO, "Retrieved thumbnail addition for %@", buf, 0xCu);
  }

  if (thumbnailsDictionaryForURL_error__once_108 != -1)
    dispatch_once(&thumbnailsDictionaryForURL_error__once_108, &__block_literal_global_110);
  v11 = thumbnailsDictionaryForURL_error__hitAdditionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_112;
  block[3] = &unk_1E5D7CA30;
  v21 = a1;
  v20 = v6;
  dispatch_async(v11, block);

  objc_msgSend(v7, "thumbnailsDictionaryWithError:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v12;
}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.quicklook.thumbnailretrieval", v0);
  v2 = (void *)thumbnailsDictionaryForURL_error__sDownloadingQueue;
  thumbnailsDictionaryForURL_error__sDownloadingQueue = (uint64_t)v1;

}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  char v6;
  NSObject *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(v2, "mayPermanentStorageBeSupportedAtURL:error:", v3, &v8);
  v5 = v8;
  if ((v4 & 1) != 0)
  {

LABEL_4:
    objc_msgSend((id)objc_opt_class(), "downloadOrGenerateThumbnailAtURL:completionHandler:", *(_QWORD *)(a1 + 32), 0);
    goto LABEL_8;
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "shouldUseXattrsToStoreThumbnailsOnURL:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) != 0)
    goto LABEL_4;
  _log_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_cold_1();

LABEL_8:
}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_109()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.quicklook.thumbnails-maintenance", v2);
  v1 = (void *)thumbnailsDictionaryForURL_error__hitAdditionsQueue;
  thumbnailsDictionaryForURL_error__hitAdditionsQueue = (uint64_t)v0;

}

uint64_t __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_112(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "_hitAdditionsOnURL:size:completionHandler:", *(_QWORD *)(a1 + 32), 0, 0);
}

+ (void)downloadOrGenerateThumbnailAtURL:(id)a3
{
  objc_msgSend(a1, "downloadOrGenerateThumbnailAtURL:completionHandler:", a3, 0);
}

+ (void)downloadOrGenerateThumbnailAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  char v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5D7CA78;
  v29 = v8;
  v10 = v6;
  v27 = v10;
  v11 = v7;
  v28 = v11;
  v12 = _Block_copy(aBlock);
  if (_CFURLIsItemPromiseAtURL())
  {
    _log_0();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[QLThumbnailAddition downloadOrGenerateThumbnailAtURL:completionHandler:].cold.3();

    v14 = (id)_CFURLCopyLogicalURLOfPromiseAtURL();
    if (v14)
    {
LABEL_5:
      objc_msgSend(a1, "downloadOrGenerateThumbnailAtTaggedURL:completionHandler:", v14, v12);
LABEL_15:

      goto LABEL_16;
    }
  }
  else
  {
    v15 = (void *)_CFURLPromiseCopyPhysicalURL();
    _log_0();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (!v15)
    {
      if (v17)
        +[QLThumbnailAddition downloadOrGenerateThumbnailAtURL:completionHandler:].cold.1();

      v14 = objc_alloc_init(MEMORY[0x1E0CB3600]);
      objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", v10, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke_116;
      v22[3] = &unk_1E5D7CAA0;
      v25 = a1;
      v23 = v18;
      v24 = v12;
      v21 = v18;
      objc_msgSend(v14, "coordinateAccessWithIntents:queue:byAccessor:", v19, v20, v22);

      goto LABEL_15;
    }
    if (v17)
      +[QLThumbnailAddition downloadOrGenerateThumbnailAtURL:completionHandler:].cold.2();

    v14 = v10;
    if (v14)
      goto LABEL_5;
  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 0, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, id))v12 + 2))(v12, v14);
    goto LABEL_15;
  }
LABEL_16:

}

void __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    v3 = v5;
  }

}

void __74__QLThumbnailAddition_downloadOrGenerateThumbnailAtURL_completionHandler___block_invoke_116(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadOrGenerateThumbnailAtTaggedURL:completionHandler:", v3, *(_QWORD *)(a1 + 40));

}

+ (void)downloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  if (_FPIsCloudDocsWithFPFSEnabled())
    objc_msgSend(a1, "fpfsDownloadOrGenerateThumbnailAtTaggedURL:completionHandler:", v7, v6);
  else
    objc_msgSend(a1, "preFPFSDownloadOrGenerateThumbnailAtTaggedURL:completionHandler:", v7, v6);

}

+ (void)preFPFSDownloadThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];
  uint64_t v34;
  __int128 buf;
  uint64_t v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v8 = *MEMORY[0x1E0C999D0];
  v33[0] = *MEMORY[0x1E0C99A38];
  v7 = v33[0];
  v33[1] = v8;
  v34 = *MEMORY[0x1E0C99A00];
  v9 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v5, "promisedItemResourceValuesForKeys:error:", v10, &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31;

  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (!v11)
    v14 = 0;
  _log_0();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((v14 & (v18 ^ 1 | v16)) != 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1AE3F5000, v20, OS_LOG_TYPE_INFO, "Downloading thumbnail for %@", (uint8_t *)&buf, 0xCu);
    }

    v32 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke;
    v28[3] = &unk_1E5D7CAC8;
    v29 = v5;
    v30 = v6;
    v22 = v21;
    v23 = v28;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x2020000000;
    v24 = getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr;
    v37 = getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr;
    if (!getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr)
    {
      v25 = (void *)CloudDocsLibrary();
      v24 = dlsym(v25, "BRStartDownloadForItemsWithOptions");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v24;
      getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr = v24;
    }
    _Block_object_dispose(&buf, 8);
    if (!v24)
    {
      +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
      __break(1u);
    }
    ((void (*)(id, uint64_t, _QWORD *))v24)(v22, 2, v23);

  }
  else
  {
    v26 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v26)
        +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 102, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v27);

    }
    else
    {
      if (v26)
        +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.3();

      (*((void (**)(id, id))v6 + 2))(v6, v12);
    }
  }

}

void __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _log_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)preFPFSDownloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  QLThumbnailGenerationRequest *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:]([QLThumbnailGenerationRequest alloc], "initWithFileAtURL:size:scale:representationTypes:", v6, 4, 1024.0, 1024.0, 1.0);
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "_QLCreateTemporaryReplacementURLForOriginalFileAtURL:withExtension:temporaryDirectoryURL:", v6, CFSTR("jpg"), &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v9)
  {
    +[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CEC530];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke;
    v14[3] = &unk_1E5D7CAF0;
    v15 = v6;
    v16 = v10;
    v19 = a1;
    v18 = v7;
    v17 = v9;
    objc_msgSend(v11, "saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:", v8, v17, v12, 0, v14);

    v13 = v15;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
    goto LABEL_5;
  }
LABEL_6:

}

void __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void **v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void (*v17)(void);
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v6 = (void **)(a1 + 32);
    v7 = (void *)_CFURLPromiseCopyPhysicalURL();
    v8 = v7;
    if (!v7)
      v8 = *v6;
    v9 = v8;

    v10 = *(_QWORD *)(a1 + 48);
    v21 = *MEMORY[0x1E0C998A8];
    v22 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v12 = +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withDocumentAtURL:error:](QLThumbnailAddition, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withDocumentAtURL:error:", v11, 0, v9, &v20);
    v13 = v20;

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99AB8]);
      objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", *(_QWORD *)(a1 + 40));
      _log_0();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *v6;
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl(&dword_1AE3F5000, v14, OS_LOG_TYPE_INFO, "downloadOrGenerateThumbnailAtTaggedURL associated thumbnail with %@", buf, 0xCu);
      }

      v16 = *(_QWORD *)(a1 + 56);
      if (!v16)
        goto LABEL_17;
      v17 = *(void (**)(void))(v16 + 16);
    }
    else
    {
      _log_0();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1((_QWORD *)(a1 + 32));

      objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", *(_QWORD *)(a1 + 40));
      v19 = *(_QWORD *)(a1 + 56);
      if (!v19)
        goto LABEL_17;
      v17 = *(void (**)(void))(v19 + 16);
    }
    v17();
LABEL_17:

    goto LABEL_18;
  }
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_1AE3F5000, v4, OS_LOG_TYPE_INFO, "Could not save thumbnail for %@: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 64), "preFPFSDownloadThumbnailAtTaggedURL:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
LABEL_18:

}

+ (void)fpfsDownloadOrGenerateThumbnailAtTaggedURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  QLThumbnailGenerationRequest *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:]([QLThumbnailGenerationRequest alloc], "initWithFileAtURL:size:scale:representationTypes:", v5, 4, 1024.0, 1024.0, 1.0);
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "_QLCreateTemporaryReplacementURLForOriginalFileAtURL:withExtension:temporaryDirectoryURL:", v5, CFSTR("jpg"), &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v8)
  {
    +[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CEC530];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke;
    v13[3] = &unk_1E5D7CB18;
    v14 = v5;
    v15 = v9;
    v17 = v6;
    v16 = v8;
    objc_msgSend(v10, "saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:", v7, v16, v11, 1, v13);

    v12 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
    goto LABEL_5;
  }
LABEL_6:

}

void __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v20 = *MEMORY[0x1E0C998A8];
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v17 = 0;
    v9 = +[QLThumbnailAddition associateThumbnailImagesDictionary:serializedQuickLookMetadata:withDocumentAtURL:error:](QLThumbnailAddition, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withDocumentAtURL:error:", v7, 0, v8, &v17);
    v10 = v17;

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99AB8]);
      objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", *(_QWORD *)(a1 + 40));
      _log_0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v19 = v12;
        _os_log_impl(&dword_1AE3F5000, v11, OS_LOG_TYPE_INFO, "downloadOrGenerateThumbnailAtTaggedURL associated thumbnail with %@", buf, 0xCu);
      }

      v13 = *(_QWORD *)(a1 + 56);
      if (!v13)
        goto LABEL_16;
      v14 = *(void (**)(void))(v13 + 16);
    }
    else
    {
      _log_0();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v15);

      objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", *(_QWORD *)(a1 + 40));
      v16 = *(_QWORD *)(a1 + 56);
      if (!v16)
        goto LABEL_16;
      v14 = *(void (**)(void))(v16 + 16);
    }
    v14();
LABEL_16:

    goto LABEL_17;
  }
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_2(a1);

  objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
LABEL_17:

}

+ (BOOL)setThumbnailsDictionary:(id)a3 forURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = *MEMORY[0x1E0C9B0D0];
    if ((id)*MEMORY[0x1E0C9B0D0] == v8)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0C998A8]);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = v11 == v10;
      else
        v13 = 1;
      if (!v13)
      {
        if (QLTImageClassWithError(a5))
        {
          v14 = objc_msgSend(v12, "CGImage");
          _log_0();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v14)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v9;
              _os_log_impl(&dword_1AE3F5000, v16, OS_LOG_TYPE_INFO, "Associating thumbnail for %@", buf, 0xCu);
            }

            v17 = objc_msgSend(a1, "associateImage:metadata:automaticallyGenerated:withURL:error:", v14, 0, 0, v9, a5);
            dispatch_get_global_queue(-2, 0);
            v18 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke;
            block[3] = &unk_1E5D7C4F0;
            v23 = v9;
            dispatch_async(v18, block);

            goto LABEL_17;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            +[QLThumbnailAddition setThumbnailsDictionary:forURL:error:].cold.2();

          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 100, 0);
            v17 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
        }
        else
        {
          _log_0();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            +[QLThumbnailAddition setThumbnailsDictionary:forURL:error:].cold.1();

        }
        v17 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    _log_0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_1AE3F5000, v19, OS_LOG_TYPE_INFO, "Setting image to nil on %@ -> removing any preexisting thumbnails", buf, 0xCu);
    }

    v17 = objc_msgSend(a1, "removeAdditionsOnURL:error:", v9, a5);
    goto LABEL_17;
  }
  v17 = 1;
LABEL_18:

  return v17;
}

void __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _Unwind_Exception *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  if (_FPURLMightBeInFileProvider(*(_QWORD *)(a1 + 32)) && (_FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke_2;
    v8[3] = &unk_1E5D7C5B8;
    v9 = v2;
    v3 = v9;
    v4 = v8;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v5 = getBRThumbnailChangedAtURLSymbolLoc_ptr;
    v13 = getBRThumbnailChangedAtURLSymbolLoc_ptr;
    if (!getBRThumbnailChangedAtURLSymbolLoc_ptr)
    {
      v6 = (void *)CloudDocsLibrary();
      v5 = dlsym(v6, "BRThumbnailChangedAtURL");
      v11[3] = (uint64_t)v5;
      getBRThumbnailChangedAtURLSymbolLoc_ptr = v5;
    }
    _Block_object_dispose(&v10, 8);
    if (!v5)
    {
      v7 = (_Unwind_Exception *)+[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v7);
    }
    ((void (*)(id, _QWORD *))v5)(v3, v4);

  }
}

void __60__QLThumbnailAddition_setThumbnailsDictionary_forURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _log_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1AE3F5000, v4, OS_LOG_TYPE_DEFAULT, "Error when notifying BR the thumbnail changed at %@: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

+ (BOOL)shouldUseXattrsToStoreThumbnailsOnURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    CloudDocsLibrary();
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isItemAtURLInsidePermanentStorage:error:", v3, 0) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "br_isInCloudDocsPrivateStorages");

  return v5;
}

+ (BOOL)associateThumbnailsForDocumentAtURL:(id)a3 withDocumentAtURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  LOBYTE(a5) = objc_msgSend(a1, "associateThumbnailsForDocumentAtURL:withImmutableDocument:atURL:error:", v9, objc_msgSend(a1, "shouldUseXattrsToStoreThumbnailsOnURL:", v8), v8, a5);

  return (char)a5;
}

+ (BOOL)associateThumbnailsForDocumentAtURL:(id)a3 withImmutableDocument:(BOOL)a4 atURL:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  QLThumbnailAddition *v13;
  QLThumbnailVersion *v14;
  NSObject *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  QLThumbnailVersion *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  char v40;
  NSObject *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  char v47;
  uint64_t v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  QLThumbnailVersion *v54;
  void *v55;
  _QWORD v56[4];
  QLThumbnailAddition *v57;
  id v58;
  id v59;
  _BYTE *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  _QWORD v77[4];

  v8 = a4;
  v77[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  _log_0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v73) = v8;
    _os_log_debug_impl(&dword_1AE3F5000, v12, OS_LOG_TYPE_DEBUG, "Copying thumbnails from %@ to %@ (immutable: %d)", buf, 0x1Cu);
  }

  v13 = -[QLThumbnailAddition initWithAdditionsPresentOnURL:error:]([QLThumbnailAddition alloc], "initWithAdditionsPresentOnURL:error:", v10, a6);
  if (v13)
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 1;
    v14 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFileURL:automaticallyGenerated:", v10, 1);
    if (-[QLThumbnailAddition shouldBeInvalidatedByThumbnailVersion:](v13, "shouldBeInvalidatedByThumbnailVersion:", v14))
    {
      _log_0();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_1AE3F5000, v15, OS_LOG_TYPE_DEFAULT, "Not copying thumbnails from %@ to %@ because it was outdated for the source already", buf, 0x16u);
      }

      if (!a6)
      {
        v18 = 0;
LABEL_45:

        _Block_object_dispose(&v62, 8);
        goto LABEL_46;
      }
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v76 = *MEMORY[0x1E0CB32F0];
      v77[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 115, v17);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

      goto LABEL_45;
    }
    -[QLThumbnailAddition thumbnailDataDictionary](v13, "thumbnailDataDictionary");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v73 = __Block_byref_object_copy__3;
    v74 = __Block_byref_object_dispose__3;
    v75 = 0;
    -[QLThumbnailAddition metadata](v13, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v19, "mutableCopy");

    v20 = [QLThumbnailVersion alloc];
    -[QLThumbnailAddition thumbnailVersion](v13, "thumbnailVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:](v20, "initWithFileURL:automaticallyGenerated:", v11, objc_msgSend(v21, "isAutomaticallyGenerated"));

    -[QLThumbnailVersion dictionaryRepresentation](v54, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v22, CFSTR("QLThumbnailMetadataFileVersionKey.2"));

    if (v8)
    {
      if (!v17)
      {
        -[QLThumbnailAddition metadata](v13, "metadata");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", CFSTR("QLThumbnailMetadataFileNamesDictionaryKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          objc_msgSend(CFSTR("thumbnail"), "stringByAppendingPathExtension:", CFSTR("jpg"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = *MEMORY[0x1E0C998A8];
          v71 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __93__QLThumbnailAddition_associateThumbnailsForDocumentAtURL_withImmutableDocument_atURL_error___block_invoke;
        v56[3] = &unk_1E5D7CB40;
        v57 = v13;
        v27 = v24;
        v58 = v27;
        v60 = buf;
        v61 = &v62;
        v28 = v26;
        v59 = v28;
        objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v56);
        v29 = v59;
        v17 = v28;

      }
      if (*((_BYTE *)v63 + 24))
      {
        v30 = objc_msgSend(a1, "storeThumbnailDataDictionary:metadata:asExtendedAttributeOnURL:error:", v17, v55, v11, a6);
        *((_BYTE *)v63 + 24) = v30;
      }
      else if (a6)
      {
        *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      }
LABEL_40:
      v48 = -[QLThumbnailAddition additionSize](v13, "additionSize");
      if (*((_BYTE *)v63 + 24))
      {
        objc_msgSend(a1, "_hitAdditionsOnURL:size:completionHandler:", v11, v48, 0);
        v18 = *((_BYTE *)v63 + 24) != 0;
LABEL_43:

        _Block_object_dispose(buf, 8);
        goto LABEL_44;
      }
LABEL_42:
      v18 = 0;
      goto LABEL_43;
    }
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "permanentStorageForItemAtURL:allocateIfNone:error:", v11, 1, a6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      goto LABEL_42;
    objc_msgSend(v32, "stagingURLforCreatingAdditionWithError:", a6);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52)
    {

      goto LABEL_42;
    }
    v33 = *MEMORY[0x1E0C998A8];
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0C998A8]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "URLByAppendingPathComponent:", CFSTR("thumbnail.qlthumbnail"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(a1, "imageNameFor1024ThumbnailData:metadataDictionary:", v51, v55);
      v34 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v34;
      if (!v34)
      {
        _log_0();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          +[QLThumbnailAddition associateThumbnailsForDocumentAtURL:withImmutableDocument:atURL:error:].cold.1();

        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
          v42 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v42 = 0;
        }
LABEL_39:

        if (!v42)
          goto LABEL_42;
        goto LABEL_40;
      }
      v68 = v33;
      v69 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v35, CFSTR("QLThumbnailMetadataFileNamesDictionaryKey"));
      }
      else
      {
        v66 = CFSTR("QLThumbnailMetadataFileNamesDictionaryKey");
        v67 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_msgSend(v43, "mutableCopy");

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v53, 0, 0, 0);

      objc_msgSend(v53, "URLByAppendingPathComponent:isDirectory:", v50, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v51, "writeToURL:options:error:", v45, 0, a6);
      *((_BYTE *)v63 + 24) = v46;
      objc_msgSend(a1, "adjustFileProtectionForThumbnail:fromOriginalDocument:", v45, v10);

    }
    else
    {
      -[QLThumbnailAddition additionURL](v13, "additionURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36 == 0;

      if (v37)
      {
        *((_BYTE *)v63 + 24) = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLThumbnailAddition additionURL](v13, "additionURL");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "copyItemAtURL:toURL:error:", v39, v53, a6);
        *((_BYTE *)v63 + 24) = v40;

        objc_msgSend(a1, "adjustFileProtectionForThumbnail:fromOriginalDocument:", v53, v10);
      }
    }
    if (*((_BYTE *)v63 + 24))
    {
      v47 = objc_msgSend(a1, "makeAdditionFromStagingURL:metadata:inStorage:error:", v53, v55, v32, a6);
      *((_BYTE *)v63 + 24) = v47;
      objc_msgSend(a1, "removeThumbnailsStoredInExtendedAttributesOnURL:error:", v11, 0);
    }
    v42 = 1;
    goto LABEL_39;
  }
  v18 = 0;
LABEL_46:

  return v18;
}

void __93__QLThumbnailAddition_associateThumbnailsForDocumentAtURL_withImmutableDocument_atURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "additionURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 1, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v11, v6);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }

}

+ (void)noteCloudDocsDownloadedFileAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(-32768, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke;
  v10[3] = &unk_1E5D7CBE0;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_123;
    v6[3] = &unk_1E5D7CBB8;
    v8 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v2, "askThumbnailAdditionIndex:", v6);

    v3 = v8;
LABEL_7:

    goto LABEL_8;
  }
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    goto LABEL_7;
  }
LABEL_8:

}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_123(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id FPSandboxingURLWrapperClass;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_124;
    v21[3] = &unk_1E5D7C860;
    v22 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v21);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
    v7 = *(_QWORD *)(a1 + 32);
    v20 = 0;
    objc_msgSend(FPSandboxingURLWrapperClass, "wrapperWithURL:extensionClass:error:", v7, "com.apple.quicklook.readonly", &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (v9)
    {
      _log_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_123_cold_2((_QWORD *)(a1 + 32));

    }
    v16[0] = v4;
    v16[1] = 3221225472;
    v16[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_125;
    v16[3] = &unk_1E5D7CB90;
    v17 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v18 = v5;
    v19 = v11;
    v12 = v5;
    objc_msgSend(v12, "hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:", v8, 0, 0, v16);

    v13 = v22;
    goto LABEL_11;
  }
  _log_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_85_cold_1();

  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 107, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v13);
LABEL_11:

  }
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _log_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_124_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_125(id *a1, int a2)
{
  void *v3;
  id v4;
  void (**v5)(id, id);
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  if (a2)
  {
    +[QLThumbnailGenerationQueue sharedInstance](QLThumbnailGenerationQueue, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v6 = v3;
    if (a1[6])
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_2;
      v8[3] = &unk_1E5D7CB68;
      v9 = a1[5];
      v10 = a1[4];
      v11 = a1[6];
      objc_msgSend(v6, "enqueueThumbnailGenerationIfNeededForDocumentAtURL:atBackgroundPriority:completionHandler:", v4, 1, v8);

    }
    else
    {
      objc_msgSend(v3, "enqueueThumbnailGenerationIfNeededForDocumentAtURL:atBackgroundPriority:completionHandler:", v4, 1, 0);

    }
  }
  else
  {
    v5 = (void (**)(id, id))a1[6];
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 104, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7);

    }
  }
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a4;
  objc_msgSend(v6, "updateFileSize:ofThumbnailForURL:completion:", a3, v7, 0);
  (*(void (**)(void))(a1[6] + 16))();

}

- (GSAddition)genStoreAddition
{
  return self->_addition;
}

- (id)allImageURLs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[QLThumbnailAddition metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("QLThumbnailMetadataFileNamesDictionaryKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[QLThumbnailAddition additionURL](self, "additionURL", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v12, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v14);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v9);
    }
  }
  else
  {
    -[QLThumbnailAddition metadata](self, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("QLThumbnailMetadataFileNameKey"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[QLThumbnailAddition additionURL](self, "additionURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v7, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
  }

  return v6;
}

- (unint64_t)additionSize
{
  NSDictionary *thumbnailDataDictionary;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  thumbnailDataDictionary = self->_thumbnailDataDictionary;
  if (thumbnailDataDictionary)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __35__QLThumbnailAddition_additionSize__block_invoke;
    v20[3] = &unk_1E5D7CC08;
    v20[4] = &v21;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](thumbnailDataDictionary, "enumerateKeysAndObjectsUsingBlock:", v20);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[QLThumbnailAddition allImageURLs](self, "allImageURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v17;
      v6 = *MEMORY[0x1E0C99998];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
          v15 = 0;
          v9 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v15, v6, 0);
          v10 = v15;
          v11 = v10;
          if (v9)
          {
            v12 = objc_msgSend(v10, "unsignedIntegerValue");
            v22[3] += v12;
          }

          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
      }
      while (v4);
    }

  }
  v13 = v22[3];
  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __35__QLThumbnailAddition_additionSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "length");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (NSURL)additionURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAdditionURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)thumbnailDataDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThumbnailDataDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)additionURLSandboxToken
{
  return self->_additionURLSandboxToken;
}

- (void)setAdditionURLSandboxToken:(int64_t)a3
{
  self->_additionURLSandboxToken = a3;
}

- (void)shouldBeInvalidatedByThumbnailVersion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10_0(&dword_1AE3F5000, v0, v1, "%@ should be invalidated by %@?");
  OUTLINED_FUNCTION_2();
}

- (void)thumbnailURLForKey:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "additionURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12_0(&dword_1AE3F5000, v4, v5, "Found an addition at %@ without a file name for key %@ in its metadata %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_13();
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Error caught while looking for a thumbnail: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__QLThumbnailAddition__initWithAdditionsPresentOnURLUsingDaemon_error___block_invoke_76_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Got underlying error from service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)setPropertyList:(uint64_t)a3 forExtendedAttributeNamed:(uint64_t)a4 flags:(uint64_t)a5 onFileDescriptor:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1AE3F5000, a2, a3, "Unable to set xattr on file descriptor %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)removeExtendedAttributeNamed:(uint64_t)a3 flags:(uint64_t)a4 onFileDescriptor:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1AE3F5000, a2, a3, "Unable to remove xattr on file descriptor %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not communicate with thumbnailing agent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_85_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Received nil thumbnail addition index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__QLThumbnailAddition__hitAdditionsOnURL_size_completionHandler___block_invoke_87_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not communicate with addition index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "%@ should have a NSThumbnail1024x1024SizeKey key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could not determine what type of image %@ [thumbnail for %@] is");
  OUTLINED_FUNCTION_2();
}

+ (void)associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "%@ is not reachable: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)adjustFileProtectionForThumbnail:fromOriginalDocument:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to set FileProtection Attributes on staging URL %@: error %@");
  OUTLINED_FUNCTION_2();
}

+ (void)adjustFileProtectionForThumbnail:fromOriginalDocument:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to get FileProtection Attributes from document URL %@: error %@");
  OUTLINED_FUNCTION_2();
}

+ (void)makeAdditionFromStagingURL:metadata:inStorage:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to prepare addition from staging URL %@: error %@");
  OUTLINED_FUNCTION_2();
}

+ (void)makeAdditionFromStagingURL:metadata:inStorage:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to create addition from staging URL %@: error %@");
  OUTLINED_FUNCTION_2();
}

+ (void)imageContainsAlphaForOtherImages:.cold.1()
{
  __assert_rtn("+[QLThumbnailAddition imageContainsAlphaForOtherImages:]", "QLThumbnailAddition.m", 1070, "CGBitmapContextGetBitsPerPixel(alphaContext) == 8");
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to associate thumbnail with %@: GenerationalStorage failed to return an additions storage (error: %@)");
  OUTLINED_FUNCTION_2();
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to associate thumbnail with %@: GenerationalStorage failed to return a staging URL (error: %@)");
  OUTLINED_FUNCTION_2();
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1AE3F5000, v0, OS_LOG_TYPE_DEBUG, "Storing version %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)associateImage:metadata:automaticallyGenerated:withURL:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10_0(&dword_1AE3F5000, v0, v1, "associate thumbnail with URL %@ metadata %@");
  OUTLINED_FUNCTION_2();
}

+ (void)removeAdditionsOnURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Process does have access to revisiond", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)removeAdditionsOnURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Process does not have access to revisiond, going through the service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)thumbnailsDictionaryForURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Error %@ retrieving thumbnail for %@");
  OUTLINED_FUNCTION_2();
}

void __56__QLThumbnailAddition_thumbnailsDictionaryForURL_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "You tried to access NSURLThumbnailDictionaryKey (or related URL resources) on a volume which does not support it. NSURLThumbnailDictionaryKey is deprecated, please switch to QLThumbnailGenerator (for retrieving thumbnails) or Quick Look thumbnail extensions (for providing thumbnails). %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)downloadOrGenerateThumbnailAtURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Untagged logical URL, coordinating to get the physical URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)downloadOrGenerateThumbnailAtURL:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Tagged logical URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)downloadOrGenerateThumbnailAtURL:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1AE3F5000, v0, v1, "Physical URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (uint64_t)preFPFSDownloadThumbnailAtTaggedURL:completionHandler:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.2(v0);
}

+ (void)preFPFSDownloadThumbnailAtTaggedURL:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Not downloading thumbnail for %@ as it is not ubiquitous", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)preFPFSDownloadThumbnailAtTaggedURL:completionHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12_0(&dword_1AE3F5000, v1, v2, "Failed to determine if %@ (%@) is ubiquitous: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_13();
}

void __77__QLThumbnailAddition_preFPFSDownloadThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Error %@ while downloading thumbnail for %@");
  OUTLINED_FUNCTION_2();
}

void __87__QLThumbnailAddition_preFPFSDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v1, v2, "Could not associate thumbnail with %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412546;
  v4 = v2;
  v5 = 2112;
  v6 = 0;
  _os_log_error_impl(&dword_1AE3F5000, a2, OS_LOG_TYPE_ERROR, "Could not associate thumbnail with %@: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __84__QLThumbnailAddition_fpfsDownloadOrGenerateThumbnailAtTaggedURL_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v1, v2, "Could not download thumbnail for %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

+ (void)setThumbnailsDictionary:forURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "You need to link with UIKit to be able to set thumbnails", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)setThumbnailsDictionary:forURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not extract a CGImage from the value of the %@ key in the thumbnails dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)associateThumbnailsForDocumentAtURL:withImmutableDocument:atURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not determine what type of image the thumbnail for %@ is", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, v0, v1, "Could not contact the Quick Look thumbnails agent to check if a thumbnail exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_123_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v1, v2, "Could not create FPSandboxingURLWrapper with url: %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __74__QLThumbnailAddition_noteCloudDocsDownloadedFileAtURL_completionHandler___block_invoke_124_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not contact the Quick Look thumbnails agent to check if a thumbnail exists: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
