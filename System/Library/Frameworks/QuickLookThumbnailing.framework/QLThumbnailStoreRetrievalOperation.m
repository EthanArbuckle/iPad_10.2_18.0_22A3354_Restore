@implementation QLThumbnailStoreRetrievalOperation

+ (BOOL)canMostRecentClientsGenerateThumbnailsForUTI:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.adobe.illustrator.ai-image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.adobe.photoshop-image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.adobe.photoshop-large-image"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC520])
    && (objc_msgSend(v3, "conformsToType:", v4) & 1) == 0
    && (objc_msgSend(v3, "conformsToType:", v5) & 1) == 0
    && !objc_msgSend(v3, "conformsToType:", v6)
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC570]) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0
    || objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC590])
    && !objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC4B0])
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC5C0]) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC5C8]) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC668]) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC538]);
  }

  return v7;
}

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    -[QLThumbnailStoreRetrievalOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = a3;
    -[QLThumbnailStoreRetrievalOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    -[QLThumbnailStoreRetrievalOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = a3;
    -[QLThumbnailStoreRetrievalOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (QLThumbnailStoreRetrievalOperation)init
{
  -[QLThumbnailStoreRetrievalOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (QLThumbnailStoreRetrievalOperation)initWithDocumentAtURL:(id)a3
{
  id v5;
  QLThumbnailStoreRetrievalOperation *v6;
  QLThumbnailStoreRetrievalOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLThumbnailStoreRetrievalOperation;
  v6 = -[QLThumbnailStoreRetrievalOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentURL, a3);
    v7->_allowsThumbnailGeneration = 1;
  }

  return v7;
}

- (id)description
{
  void *v3;
  QLThumbnailStoreRetrievalOperation *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p;"),
                 objc_opt_class(),
                 self);
  v4 = self;
  objc_sync_enter(v4);
  if (-[QLThumbnailStoreRetrievalOperation isCancelled](v4, "isCancelled"))
    objc_msgSend(v3, "appendString:", CFSTR(" cancelled"));
  if (-[QLThumbnailStoreRetrievalOperation isExecuting](v4, "isExecuting"))
    objc_msgSend(v3, "appendString:", CFSTR(" executing"));
  if (-[QLThumbnailStoreRetrievalOperation isFinished](v4, "isFinished"))
    objc_msgSend(v3, "appendString:", CFSTR(" finished"));
  objc_sync_exit(v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)QLThumbnailStoreRetrievalOperation;
  -[QLThumbnailStoreRetrievalOperation cancel](&v2, sel_cancel);
}

- (BOOL)_finishIfNeeded
{
  QLThumbnailStoreRetrievalOperation *v2;
  int v3;
  NSObject *v4;
  void *v5;
  int v7;
  QLThumbnailStoreRetrievalOperation *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[QLThumbnailStoreRetrievalOperation isCancelled](v2, "isCancelled");
  if (v3)
  {
    _log_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v2;
      _os_log_impl(&dword_1AE3F5000, v4, OS_LOG_TYPE_INFO, "Finishing %@ because it is cancelled", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailStoreRetrievalOperation _finishWithError:](v2, "_finishWithError:", v5);

  }
  objc_sync_exit(v2);

  return v3;
}

- (void)_finishBecauseGenerationFailedWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSURL *documentURL;
  void *v9;
  int v10;
  NSURL *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14 = *MEMORY[0x1E0CB3388];
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  _log_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    documentURL = self->_documentURL;
    v10 = 138412546;
    v11 = documentURL;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1AE3F5000, v7, OS_LOG_TYPE_INFO, "Finishing thumbnail store retrieval for %@ because generation failed with %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailStoreRetrievalOperation _finishWithError:](self, "_finishWithError:", v9);

}

- (void)start
{
  OS_os_activity *v3;
  OS_os_activity *retrievalActivity;
  os_activity_scope_state_s v5;

  v3 = (OS_os_activity *)_os_activity_create(&dword_1AE3F5000, "!quicklook/thumbnail-retrieval", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  retrievalActivity = self->_retrievalActivity;
  self->_retrievalActivity = v3;

  -[QLThumbnailStoreRetrievalOperation setExecuting:](self, "setExecuting:", 1);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_retrievalActivity, &v5);
  -[QLThumbnailStoreRetrievalOperation main](self, "main");
  os_activity_scope_leave(&v5);
}

- (void)_generateThumbnail
{
  OS_os_activity *v3;
  OS_os_activity *generationActivity;
  void *v5;
  void *v6;
  uint64_t v7;
  NSURL *v8;
  NSURL *destinationURL;
  void *v10;
  QLThumbnailGenerationRequest *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  os_activity_scope_state_s state;
  char v16[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (OS_os_activity *)_os_activity_create(&dword_1AE3F5000, "!quicklook/thumbnail-generation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  generationActivity = self->_generationActivity;
  self->_generationActivity = v3;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_generationActivity, &state);
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("QuickLookThumbnail.XXXXXX.jpg"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", v16, 1024);

  v7 = mkstemps(v16, 4);
  if ((v7 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailStoreRetrievalOperation _finishBecauseGenerationFailedWithUnderlyingError:](self, "_finishBecauseGenerationFailedWithUnderlyingError:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v16, 0, 0);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    destinationURL = self->_destinationURL;
    self->_destinationURL = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v7, 1);
    v11 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:]([QLThumbnailGenerationRequest alloc], "initWithFileAtURL:size:scale:representationTypes:", self->_documentURL, 4, 1024.0, 1024.0, 1.0);
    +[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CEC530];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__QLThumbnailStoreRetrievalOperation__generateThumbnail__block_invoke;
    v14[3] = &unk_1E5D7C5B8;
    v14[4] = self;
    objc_msgSend(v12, "saveBestRepresentationForRequest:toFileHandle:asContentType:allowingThumbnailDownloads:completionHandler:", v11, v10, v13, 0, v14);

  }
  os_activity_scope_leave(&state);
}

void __56__QLThumbnailStoreRetrievalOperation__generateThumbnail__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "destinationURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtURL:error:", v4, 0);

    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_afterThumbnailIsGenerated");
  }

}

- (void)_afterDeterminingWhetherWeCanGenerate:(BOOL)a3
{
  _BOOL4 v3;
  QLThumbnailAddition *addition;
  BOOL v6;
  QLThumbnailVersion *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  QLThumbnailAddition *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSURL *v17;
  NSURL *v18;
  void *v19;
  NSURL *documentURL;
  void *v21;
  int v22;
  NSURL *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  QLThumbnailVersion *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  addition = self->_addition;
  if (addition)
    v6 = !a3;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = -[QLThumbnailVersion initWithFileURL:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFileURL:automaticallyGenerated:", self->_documentURL, 1);
    _log_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      documentURL = self->_documentURL;
      -[QLThumbnailAddition thumbnailVersion](self->_addition, "thumbnailVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = documentURL;
      v24 = 2112;
      v25 = v21;
      v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_1AE3F5000, v8, OS_LOG_TYPE_DEBUG, "%@: Stored thumbnail version: %@, proposed version: %@", (uint8_t *)&v22, 0x20u);

    }
    -[QLThumbnailAddition thumbnailVersion](self->_addition, "thumbnailVersion");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          -[QLThumbnailAddition thumbnailVersion](self->_addition, "thumbnailVersion"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "shouldBeInvalidatedByThumbnailWithVersion:", v7),
          v11,
          v10,
          v12))
    {
      _log_0();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1AE3F5000, v13, OS_LOG_TYPE_INFO, "Invalidating existing version. Regenerating a thumbnail.", (uint8_t *)&v22, 2u);
      }

      v14 = self->_addition;
      self->_addition = 0;

    }
    addition = self->_addition;
  }
  if (addition)
  {
    -[QLThumbnailStoreRetrievalOperation _finishWithError:](self, "_finishWithError:", 0);
  }
  else
  {
    _log_0();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v16)
      {
        v17 = self->_documentURL;
        v22 = 138412290;
        v23 = v17;
        _os_log_impl(&dword_1AE3F5000, v15, OS_LOG_TYPE_INFO, "No addition for %@, trying generation", (uint8_t *)&v22, 0xCu);
      }

      -[QLThumbnailStoreRetrievalOperation _generateThumbnail](self, "_generateThumbnail");
    }
    else
    {
      if (v16)
      {
        v18 = self->_documentURL;
        v22 = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1AE3F5000, v15, OS_LOG_TYPE_INFO, "No addition for %@ and generation not possible", (uint8_t *)&v22, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 106, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLThumbnailStoreRetrievalOperation _finishWithError:](self, "_finishWithError:", v19);

    }
  }
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6(&dword_1AE3F5000, v0, v1, "QLThumbnailStoreRetrievalOperation for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __42__QLThumbnailStoreRetrievalOperation_main__block_invoke(uint64_t a1)
{
  NSObject *v2;

  _log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __42__QLThumbnailStoreRetrievalOperation_main__block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_afterDeterminingWhetherWeCanGenerate:", 0);
}

uint64_t __42__QLThumbnailStoreRetrievalOperation_main__block_invoke_35(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_afterDeterminingWhetherWeCanGenerate:", a2);
}

- (void)_afterThumbnailIsGenerated
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could NOT associate an iCloud Drive thumbnail for %@: %@");
  OUTLINED_FUNCTION_2();
}

- (void)afterThumbnailIsPutInGenstore
{
  QLThumbnailStoreRetrievalOperation *v2;
  QLThumbnailAddition *v3;
  NSURL *documentURL;
  uint64_t v5;
  id v6;
  QLThumbnailAddition *addition;
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  if (!-[QLThumbnailStoreRetrievalOperation _finishIfNeeded](v2, "_finishIfNeeded"))
  {
    v3 = [QLThumbnailAddition alloc];
    documentURL = v2->_documentURL;
    v8 = 0;
    v5 = -[QLThumbnailAddition initWithAdditionsPresentOnURL:error:](v3, "initWithAdditionsPresentOnURL:error:", documentURL, &v8);
    v6 = v8;
    addition = v2->_addition;
    v2->_addition = (QLThumbnailAddition *)v5;

    -[QLThumbnailStoreRetrievalOperation _finishWithError:](v2, "_finishWithError:", v6);
  }
  objc_sync_exit(v2);

}

- (void)_finishWithError:(id)a3
{
  if (!self->_addition)
    -[QLThumbnailStoreRetrievalOperation setError:](self, "setError:", a3);
  -[QLThumbnailStoreRetrievalOperation setExecuting:](self, "setExecuting:", 0);
  -[QLThumbnailStoreRetrievalOperation setFinished:](self, "setFinished:", 1);
}

- (NSDictionary)thumbnailImagesDictionary
{
  QLThumbnailAddition *addition;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  addition = self->_addition;
  if (!addition)
    return (NSDictionary *)0;
  -[QLThumbnailAddition additionURL](addition, "additionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *MEMORY[0x1E0C998A8];
    -[QLThumbnailAddition thumbnailURLForKey:](self->_addition, "thumbnailURLForKey:", *MEMORY[0x1E0C998A8]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v9 = v5;
      v10[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return (NSDictionary *)v4;
}

- (NSData)serializedQuickLookMetadataDictionary
{
  QLThumbnailAddition *addition;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  addition = self->_addition;
  if (addition
    && (-[QLThumbnailAddition metadata](addition, "metadata"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = (void *)MEMORY[0x1E0CB38B0];
    -[QLThumbnailAddition metadata](self->_addition, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSData *)v7;
}

- (GSAddition)genStoreAddition
{
  return -[QLThumbnailAddition genStoreAddition](self->_addition, "genStoreAddition");
}

- (BOOL)thumbnailWasAutomaticallyGenerated
{
  void *v2;
  char v3;

  -[QLThumbnailAddition thumbnailVersion](self->_addition, "thumbnailVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutomaticallyGenerated");

  return v3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)allowsThumbnailGeneration
{
  return self->_allowsThumbnailGeneration;
}

- (void)setAllowsThumbnailGeneration:(BOOL)a3
{
  self->_allowsThumbnailGeneration = a3;
}

- (BOOL)generateThumbnailsAtBackgroundPriority
{
  return self->_generateThumbnailsAtBackgroundPriority;
}

- (void)setGenerateThumbnailsAtBackgroundPriority:(BOOL)a3
{
  self->_generateThumbnailsAtBackgroundPriority = a3;
}

- (BOOL)thumbnailWasJustAutomaticallyGenerated
{
  return self->_thumbnailWasJustAutomaticallyGenerated;
}

- (QLThumbnailAddition)addition
{
  return (QLThumbnailAddition *)objc_getProperty(self, a2, 288, 1);
}

- (QLThumbnailGenerationRequest)thumbnailRequest
{
  return (QLThumbnailGenerationRequest *)objc_getProperty(self, a2, 296, 1);
}

- (void)setThumbnailRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 304, 1);
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_thumbnailRequest, 0);
  objc_storeStrong((id *)&self->_addition, 0);
  objc_storeStrong((id *)&self->_generationActivity, 0);
  objc_storeStrong((id *)&self->_retrievalActivity, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
}

void __42__QLThumbnailStoreRetrievalOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not reach the thumbnails generation service to generate thumbnail for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
