@implementation MPAssistantAddMediaItemsToLibrary

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToLibrary aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Library"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[SAMPAddMediaItemsToLibrary mediaItems](self, "mediaItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (invoke) <%{public}@>: media items %{public}@", buf, 0x16u);

  }
  v12 = self->_requestAceHash;
  -[SAMPAddMediaItemsToLibrary influencedUserSharedUserId](self, "influencedUserSharedUserId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMPAddMediaItemsToLibrary influencedUserSharedUserId](self, "influencedUserSharedUserId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1CC9ABA10;
  v16[3] = &unk_1E88E3E10;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  sub_1CC995BFC(CFSTR("Add Media Items To Library"), v12, v13, v14, v16);

}

- (void)_performWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[MPAssistantAddMediaItemsToLibrary _addMediaItemsToLibrarySupported](self, "_addMediaItemsToLibrarySupported"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1CC9AB92C;
    v8[3] = &unk_1E88E3E38;
    v9 = v4;
    v5 = v4;
    -[MPAssistantAddMediaItemsToLibrary _performAddMediaItemsWithCompletion:](self, "_performAddMediaItemsWithCompletion:", v8);
    v6 = v9;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1CC9AB938;
    v7[3] = &unk_1E88E3E60;
    v7[4] = self;
    v7[5] = v4;
    v6 = v4;
    sub_1CC9AB938((uint64_t)v7, 0);
  }

}

- (BOOL)_addMediaItemsToLibrarySupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CC2358], "controllerWithUserIdentity:", self->_userIdentity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeActiveAndWaitUntilDone:", 1);
  v3 = objc_msgSend(v2, "isCloudLibraryEnabled");

  return v3;
}

- (int64_t)_extractAtomID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  NSString *v9;
  NSString *requestAceHash;
  NSObject *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  int v26;
  NSString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SAMPAddMediaItemsToLibrary mediaItems](self, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_1CC9834E0(v5) == 3)
  {
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    if (v7)
      goto LABEL_23;
  }
  else
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToLibrary aceId](self, "aceId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Library"), v8);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v9;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = self->_requestAceHash;
      v26 = 138543618;
      v27 = v12;
      v28 = 2114;
      v29 = v5;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_ERROR, "Add Media Items To Library (extract) <%{public}@>: Unsupported origin for collection %{public}@", (uint8_t *)&v26, 0x16u);
    }

  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToLibrary aceId](self, "aceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Library"), v13);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = self->_requestAceHash;
      self->_requestAceHash = v14;

    }
    _MPLogCategoryAssistant();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_requestAceHash;
      v26 = 138543618;
      v27 = v17;
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_1CC97B000, v16, OS_LOG_TYPE_ERROR, "Add Media Items To Library (extract) <%{public}@>: Cannot add multiple items %{public}@", (uint8_t *)&v26, 0x16u);
    }

  }
  objc_msgSend(v4, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_1CC9834E0(v19) == 3)
  {
    objc_msgSend(v19, "lastPathComponent");
    v20 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject longLongValue](v20, "longLongValue");
  }
  else
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToLibrary aceId](self, "aceId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Library"), v21);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = self->_requestAceHash;
      self->_requestAceHash = v22;

    }
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_requestAceHash;
      v26 = 138543618;
      v27 = v24;
      v28 = 2114;
      v29 = v19;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "Add Media Items To Library (extract) <%{public}@>: Unsupported origin for entity %{public}@", (uint8_t *)&v26, 0x16u);
    }
    v7 = 0;
  }

LABEL_23:
  return v7;
}

- (void)_requestCompanionToAddMediaItemsForOrigin:(void *)a3 withCompletion:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSString *v18;
  NSString *requestAceHash;
  NSObject *v20;
  NSString *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[MPAssistantAddMediaItemsToLibrary _extractAtomID](self, "_extractAtomID");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v7);
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1CC9AB848;
  v27[3] = &unk_1E88E3E88;
  v10 = v8;
  v28 = v10;
  v11 = v6;
  v29 = v11;
  v12 = (void *)MEMORY[0x1D17B0600](v27);
  if (v7)
  {
    if (v11)
    {
      v13 = *MEMORY[0x1E0D4CCC0];
      v34[0] = *MEMORY[0x1E0D4CD28];
      v34[1] = v13;
      v35[0] = v10;
      v35[1] = CFSTR("com.apple.MediaAssistant.siri");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x1E0D4B318]);
      objc_msgSend(v15, "setOrigin:", a3);
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = sub_1CC9AB8E0;
      v24[3] = &unk_1E88E4068;
      v25 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
      v26 = v12;
      v16 = v25;
      objc_msgSend(v16, "sendCommand:toDestination:withOptions:completion:", 128, v15, v14, v24);

LABEL_10:
    }
  }
  else if (v11)
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToLibrary aceId](self, "aceId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Library"), v17);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v18;

    }
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_requestAceHash;
      -[SAMPAddMediaItemsToLibrary mediaItems](self, "mediaItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "Add Media Items To Library (companion) <%{public}@>: No adam IDs in %{public}@", buf, 0x16u);

    }
    v23 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v14 = (void *)objc_msgSend(v23, "initWithErrorCode:", *MEMORY[0x1E0D88DF8]);
    (*((void (**)(id, void *))v11 + 2))(v11, v14);
    goto LABEL_10;
  }

}

- (void)_performAddMediaItemsWithCompletion:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  NSString *v8;
  NSString *requestAceHash;
  NSObject *v10;
  NSString *v11;
  MPCloudController *v12;
  MPCloudController *cloudController;
  void *v14;
  MPCloudController *v15;
  id v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  NSString *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  MPAssistantAddMediaItemsToLibrary *v26;
  id v27;
  int64_t v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MPAssistantAddMediaItemsToLibrary _extractAtomID](self, "_extractAtomID");
  if (v5)
  {
    v6 = v5;
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToLibrary aceId](self, "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Library"), v7);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v8;

    }
    _MPLogCategoryAssistant();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      v31 = 2048;
      v32 = v6;
      _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (cloud) <%{public}@>: Will add store item %lld", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CC2358], "controllerWithUserIdentity:", self->_userIdentity);
    v12 = (MPCloudController *)objc_claimAutoreleasedReturnValue();
    cloudController = self->_cloudController;
    self->_cloudController = v12;

    v14 = (void *)-[NSString copy](self->_requestAceHash, "copy");
    v15 = self->_cloudController;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1CC9AB658;
    v24[3] = &unk_1E88E3EB0;
    v25 = v14;
    v28 = v6;
    v26 = self;
    v27 = v4;
    v16 = v14;
    -[MPCloudController addStoreItemWithAdamID:completionHandler:](v15, "addStoreItemWithAdamID:completionHandler:", v6, v24);

LABEL_13:
    goto LABEL_14;
  }
  if (v4)
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToLibrary aceId](self, "aceId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Library"), v17);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_requestAceHash;
      self->_requestAceHash = v18;

    }
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_requestAceHash;
      -[SAMPAddMediaItemsToLibrary mediaItems](self, "mediaItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v21;
      v31 = 2114;
      v32 = (int64_t)v22;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "Add Media Items To Library (companion) <%{public}@>: No adam IDs in %{public}@", buf, 0x16u);

    }
    v23 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v16 = (id)objc_msgSend(v23, "initWithErrorCode:", *MEMORY[0x1E0D88DF8]);
    (*((void (**)(id, id))v4 + 2))(v4, v16);
    goto LABEL_13;
  }
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudController, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
