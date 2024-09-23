@implementation ML3UpdateArtworkInterestDataOperation

- (unint64_t)type
{
  return 5;
}

- (BOOL)_execute:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MLDatabaseOperationAttributeArtworkTokenKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3DatabaseOperation attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MLDatabaseOperationAttributeArtworkInterestDataKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3DatabaseOperation transaction](self, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v8;
  v22[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = objc_msgSend(v10, "executeUpdate:withParameters:error:", CFSTR("UPDATE artwork SET interest_data = ? WHERE artwork_token = ?"), v11, &v17);
  v13 = v17;

  if ((v12 & 1) == 0)
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Failed to save interest data to database for artwork_token %{public}@ with error: %{public}@", buf, 0x16u);
    }

  }
  v15 = objc_retainAutorelease(v13);
  *a3 = v15;

  return v12;
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  char isKindOfClass;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ML3UpdateArtworkInterestDataOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v13, sel__verifyLibraryConnectionAndAttributesProperties_))return 0;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MLDatabaseOperationAttributeArtworkTokenKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3DatabaseOperation attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MLDatabaseOperationAttributeArtworkInterestDataKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length") != 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  v10 = v9 & isKindOfClass;
  if (a3 && !v10)
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 500, CFSTR("ML3UpdateArtworkInterestDataOperation requires an artworkToken attribute and an artwork interest data blob"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
