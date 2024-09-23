@implementation ML3Artwork

- (ML3Artwork)initWithToken:(id)a3 artworkType:(int64_t)a4 musicLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ML3Artwork *v11;

  v8 = a5;
  v9 = a3;
  +[ML3MusicLibrary artworkRelativePathFromToken:](ML3MusicLibrary, "artworkRelativePathFromToken:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ML3Artwork initWithToken:relativePath:artworkType:musicLibrary:](self, "initWithToken:relativePath:artworkType:musicLibrary:", v9, v10, a4, v8);

  return v11;
}

- (id)fileURLForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[3];

  height = a3.height;
  width = a3.width;
  v16[2] = *MEMORY[0x1E0C80C00];
  -[ML3Artwork originalFileURL](self, "originalFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (width != 1.79769313e308 || height != 1.79769313e308)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[ML3Artwork musicLibrary](self, "musicLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "artworkCacheDirectoryForSize:", width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    -[ML3Artwork relativePath](self, "relativePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathWithComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v14;
  }
  return v6;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (NSURL)originalFileURL
{
  return self->_originalFileURL;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (ML3Artwork)initWithToken:(id)a3 relativePath:(id)a4 artworkType:(int64_t)a5 musicLibrary:(id)a6
{
  id v12;
  id v13;
  id v14;
  ML3Artwork *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *serialQueue;
  void *v19;
  void *v20;
  void *v21;
  NSString *relativePath;
  void *v23;
  void *v24;
  uint64_t v25;
  NSURL *originalFileURL;
  void *v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3Artwork.m"), 40, CFSTR("Relative path cannot be nil."));

  }
  v29.receiver = self;
  v29.super_class = (Class)ML3Artwork;
  v15 = -[ML3Artwork init](&v29, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MusicLibrary.%@"), objc_opt_class());
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    serialQueue = v15->_serialQueue;
    v15->_serialQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v15->_artworkToken, a3);
    objc_storeStrong((id *)&v15->_relativePath, a4);
    v15->_artworkType = a5;
    v19 = (void *)MEMORY[0x1E0C99E98];
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "originalArtworkDirectory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    relativePath = v15->_relativePath;
    v30[0] = v21;
    v30[1] = relativePath;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pathWithComponents:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:isDirectory:", v24, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    originalFileURL = v15->_originalFileURL;
    v15->_originalFileURL = (NSURL *)v25;

    objc_storeStrong((id *)&v15->_musicLibrary, a6);
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_artworkToken, "hash");
  return -[NSString hash](self->_relativePath, "hash") ^ v3 ^ self->_artworkType;
}

- (BOOL)isEqual:(id)a3
{
  ML3Artwork *v4;
  NSObject *serialQueue;
  BOOL v6;
  _QWORD v8[5];
  ML3Artwork *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = (ML3Artwork *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      serialQueue = self->_serialQueue;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __22__ML3Artwork_isEqual___block_invoke;
      v8[3] = &unk_1E5B65E20;
      v10 = &v16;
      v8[4] = self;
      v9 = v4;
      v11 = &v12;
      dispatch_sync(serialQueue, v8);
      if (*((_BYTE *)v17 + 24))
        v6 = *((_BYTE *)v13 + 24) != 0;
      else
        v6 = 0;

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)fileURLForEffect:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[ML3Artwork musicLibrary](self, "musicLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkCacheDirectoryForEffect:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  -[ML3Artwork relativePath](self, "relativePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathWithComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)artworkType
{
  NSObject *serialQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__ML3Artwork_artworkType__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)sourceType
{
  NSObject *serialQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__ML3Artwork_sourceType__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDictionary)interestDictionary
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23265;
  v10 = __Block_byref_object_dispose__23266;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__ML3Artwork_interestDictionary__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)setInterestDictionary:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ML3Artwork_setInterestDictionary___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)_onSerialQueue_faultInProperties
{
  void *v3;
  _QWORD v4[5];

  -[ML3Artwork musicLibrary](self, "musicLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke;
  v4[3] = &unk_1E5B65F08;
  v4[4] = self;
  objc_msgSend(v3, "databaseConnectionAllowingWrites:withBlock:", 0, v4);

}

- (id)_interestDictionaryFromInterestData:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ML3Artwork artworkToken](self, "artworkToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v15 = v8;
      v16 = 2113;
      v17 = v4;
      v9 = "Unarchived interest data for artwork_token %{private}@ with resulting dict: %{private}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_1AC149000, v10, v11, v9, buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[ML3Artwork artworkToken](self, "artworkToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v15 = v8;
    v16 = 2114;
    v17 = v5;
    v9 = "Failed to unarchive data for artwork_token %{private}@. err=%{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

  return v4;
}

- (id)_interestDataFromInterestDictionary:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  v6 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ML3Artwork artworkToken](self, "artworkToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v16 = v8;
      v9 = "Archived interest data for artwork_token %{private}@.";
      v10 = v7;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_1AC149000, v10, v11, v9, buf, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[ML3Artwork artworkToken](self, "artworkToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v16 = v8;
    v17 = 2114;
    v18 = v5;
    v9 = "Failed to archive interest data for artwork_token %{private}@. Error=%{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_8;
  }

  return v4;
}

- (NSString)artworkToken
{
  return self->_artworkToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFileURL, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_artworkToken, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);
  objc_storeStrong((id *)&self->_interestDictionary, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "artworkToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:withParameters:", CFSTR("SELECT artwork_source_type, artwork_type, interest_data FROM artwork WHERE artwork_token = ?"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke_2;
  v8[3] = &unk_1E5B65EE0;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "enumerateRowsWithBlock:", v8);

}

void __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = (int)objc_msgSend(v6, "intForColumnIndex:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = (int)objc_msgSend(v6, "intForColumnIndex:", 1);
  objc_msgSend(v6, "dataForColumnIndex:", 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_interestDictionaryFromInterestData:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  *a4 = 1;
}

void __36__ML3Artwork_setInterestDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v5);
    if (!v4)

    objc_msgSend(*(id *)(a1 + 32), "artworkToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_interestDataFromInterestDictionary:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v11 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      v27 = 1024;
      v28 = v10 != v12;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Setting intereset dict with artwork token: %{public}@, with nonnull data: %{BOOL}u", buf, 0x12u);

    }
    v23[0] = CFSTR("MLDatabaseOperationAttributeArtworkTokenKey");
    v23[1] = CFSTR("MLDatabaseOperationAttributeArtworkInterestDataKey");
    v24[0] = v6;
    v24[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("MLDatabaseOperationOptionDatabasePathKey");
    objc_msgSend(*(id *)(a1 + 32), "musicLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "databasePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("MLDatabaseOperationOptionUseLimitedQueue");
    v22[0] = v15;
    v22[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __36__ML3Artwork_setInterestDictionary___block_invoke_14;
    v19[3] = &unk_1E5B65E90;
    v20 = v6;
    v18 = v6;
    objc_msgSend(v17, "performDatabaseOperation:withAttributes:options:completionHandler:", 5, v13, v16, v19);

  }
}

void __36__ML3Artwork_setInterestDictionary___block_invoke_14(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v8;
      v9 = "Saved interest data to database for artwork_token %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AC149000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138543618;
    v15 = v13;
    v16 = 2114;
    v17 = v5;
    v9 = "Failed to save interest data to database for artwork_token %{public}@ with error: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __32__ML3Artwork_interestDictionary__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (id)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "_onSerialQueue_faultInProperties");
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v5)
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (v3 != v5)

}

_QWORD *__24__ML3Artwork_sourceType__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[3];
  if (!v3)
  {
    result = (_QWORD *)objc_msgSend(result, "_onSerialQueue_faultInProperties");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

_QWORD *__25__ML3Artwork_artworkType__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[2];
  if (!v3)
  {
    result = (_QWORD *)objc_msgSend(result, "_onSerialQueue_faultInProperties");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __22__ML3Artwork_isEqual___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 48), "isEqualToString:", *(_QWORD *)(a1[5] + 48));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 16) == *(_QWORD *)(a1[5] + 16);
  return result;
}

@end
