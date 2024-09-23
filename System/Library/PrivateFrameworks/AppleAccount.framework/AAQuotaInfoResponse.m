@implementation AAQuotaInfoResponse

- (AAQuotaInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AAQuotaInfoResponse *v4;
  AAQuotaInfoResponse *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAQuotaInfoResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v8, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    if (-[NSHTTPURLResponse statusCode](v4->super._httpResponse, "statusCode") == 200)
    {
      -[AAQuotaInfoResponse _initFromResponseDict](v5, "_initFromResponseDict");
    }
    else
    {
      _AALogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[AAQuotaInfoResponse initWithHTTPResponse:data:].cold.1((id *)&v5->super._httpResponse, v6);

    }
  }
  return v5;
}

- (void)_initFromResponseDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSDictionary objectForKeyedSubscript:](self->super._responseDictionary, "objectForKeyedSubscript:", CFSTR("storage_data"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("quota_info_in_bytes"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&self->_quotaInfo, v3);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("storage_info_in_bytes"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&self->_storageInfo, v4);

    }
  }
  -[NSDictionary objectForKeyedSubscript:](self->super._responseDictionary, "objectForKeyedSubscript:", CFSTR("storage_usage_by_media"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_usage, v5);
  -[NSDictionary objectForKeyedSubscript:](self->super._responseDictionary, "objectForKeyedSubscript:", CFSTR("entry_points"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_endPoints, v6);
  -[NSDictionary objectForKeyedSubscript:](self->super._responseDictionary, "objectForKeyedSubscript:", CFSTR("storage_meter_label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_storageMeterLabel, v7);

}

- (NSURL)manageStorageURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_endPoints, "objectForKeyedSubscript:", CFSTR("quota.manage_storage_url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSNumber)totalStorageInBytes
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_quotaInfo, "objectForKeyedSubscript:", CFSTR("total_quota"));
}

- (NSNumber)usedStorageInBytes
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_quotaInfo, "objectForKeyedSubscript:", CFSTR("total_used"));
}

- (NSNumber)availableStorageInBytes
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_quotaInfo, "objectForKeyedSubscript:", CFSTR("total_available"));
}

- (BOOL)hasMaxTier
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->super._responseDictionary, "objectForKeyedSubscript:", CFSTR("quota_status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("have_max_quota_tier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)displayLabel
{
  void *v2;
  id v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_storageMeterLabel, "objectForKeyedSubscript:", CFSTR("display_label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SERVICE_TYPE_ICLOUD"), 0, CFSTR("Localizable"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (void)updateAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "aa_lastKnownQuota");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAQuotaInfoResponse totalStorageInBytes](self, "totalStorageInBytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(v8, "isEqualToNumber:", v9) & 1) == 0)
  {
    objc_msgSend(v6, "aa_setLastKnownQuota:", v9);
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Quota for %@ changed from %@ to %@; updating last known quota",
        buf,
        0x20u);
    }

    objc_msgSend(v6, "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__AAQuotaInfoResponse_updateAccount_completion___block_invoke;
    v12[3] = &unk_1E416EED0;
    v13 = v7;
    objc_msgSend(v11, "saveVerifiedAccount:withCompletionHandler:", v6, v12);

  }
}

void __48__AAQuotaInfoResponse_updateAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Updated account quota information with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (NSArray)usage
{
  return self->_usage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_storageMeterLabel, 0);
  objc_storeStrong((id *)&self->_storageInfo, 0);
  objc_storeStrong((id *)&self->_endPoints, 0);
  objc_storeStrong((id *)&self->_quotaInfo, 0);
}

- (void)initWithHTTPResponse:(id *)a1 data:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*a1, "statusCode");
  v5 = *a1;
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "AAQuotaInfoResponse has non-200 status code: %zd for response: %@", (uint8_t *)&v6, 0x16u);
}

@end
