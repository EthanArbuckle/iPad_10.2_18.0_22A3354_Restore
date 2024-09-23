@implementation CNPRSPosterArchiver

+ (id)archiveCNConfiguration:(id)a3 error:(id *)a4
{
  Class (__cdecl *v5)();
  id v6;
  Class v7;
  void *v8;
  void *v9;

  v5 = (Class (__cdecl *)())getPRSPosterArchiverClass[0];
  v6 = a3;
  v7 = v5();
  objc_msgSend(v6, "wrappedPosterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class archiveConfiguration:format:error:](v7, "archiveConfiguration:format:error:", v8, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unarchiveCNConfigurationAtURL:(id)a3 error:(id *)a4
{
  Class (__cdecl *v5)();
  id v6;
  void *v7;
  id v8;
  CNPRSPosterConfiguration *v9;
  NSObject *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (Class (__cdecl *)())getPRSPosterArchiverClass[0];
  v6 = a3;
  v13 = 0;
  -[objc_class unarchiveConfigurationAtURL:format:error:](v5(), "unarchiveConfigurationAtURL:format:error:", v6, -1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v7)
  {
    v9 = -[CNPRSPosterConfiguration initWithPosterConfiguration:]([CNPRSPosterConfiguration alloc], "initWithPosterConfiguration:", v7);
  }
  else
  {
    CNUILogPosters();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "PRSPosterArchiver failed to unarchive configuration, %@", buf, 0xCu);

    }
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v9;
}

+ (id)unarchiveCNConfigurationFromData:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  CNPRSPosterConfiguration *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
  {
    CNUILogPosters();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Failed to unarchive configuration, poster data is empty", buf, 2u);
    }
    v7 = 0;
  }
  else
  {
    v12 = 0;
    objc_msgSend((Class)getPRSPosterArchiverClass[0](), "unarchiveConfigurationFromData:format:error:", v5, -1, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v8)
    {
      v7 = -[CNPRSPosterConfiguration initWithPosterConfiguration:]([CNPRSPosterConfiguration alloc], "initWithPosterConfiguration:", v8);
    }
    else
    {
      CNUILogPosters();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[NSObject localizedDescription](v6, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "PRSPosterArchiver failed to unarchive configuration, %@", buf, 0xCu);

      }
      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v6);
    }

  }
  return v7;
}

@end
