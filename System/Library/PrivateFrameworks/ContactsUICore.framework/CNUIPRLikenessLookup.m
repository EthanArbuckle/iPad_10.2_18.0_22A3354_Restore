@implementation CNUIPRLikenessLookup

uint64_t __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "futureResultForPhotoImageDataForContact:error:", *(_QWORD *)(a1 + 40), a2);
}

void __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke_cold_1();

}

CNUIPRLikenessPhotoProvider *__85__CNUIPRLikenessLookup_photoObservableWithPhotoFuture_likenessFingerprint_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNUIPRLikenessPhotoProvider *v4;

  v3 = a2;
  v4 = -[CNUIPRLikenessPhotoProvider initWithPhotoData:fingerprint:]([CNUIPRLikenessPhotoProvider alloc], "initWithPhotoData:fingerprint:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

id __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  +[CNUILikenessFingerprint fingerprintForContact:](CNUILikenessFingerprint, "fingerprintForContact:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  +[CNUIRemotePhotoFutures photoForContact:](CNUIRemotePhotoFutures, "photoForContact:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)futureResultForPhotoImageDataForContact:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[CNUIPRLikenessLookup photoImageDataForContact:error:](self, "photoImageDataForContact:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C968C8], 302, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
      *a4 = objc_retainAutorelease(v7);

    v6 = 0;
  }

  return v6;
}

- (void)setProhibitedSources:(int64_t)a3
{
  self->_prohibitedSources = a3;
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4
{
  return -[CNUIPRLikenessLookup initWithContactStore:schedulerProvider:meMonitor:](self, "initWithContactStore:schedulerProvider:meMonitor:", a3, a4, 0);
}

- (id)photoImageDataForContact:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "thumbnailImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length") && objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
  {
    objc_msgSend(v4, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C96688]))
      objc_msgSend(v4, "cropRect");
    CNImageUtilsCroppedImageDataFromFullSizeImageData();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CNUIPRLikenessLookup photoImageDataForContact:error:].cold.1();

  return v5;
}

id __78__CNUIPRLikenessLookup_basicMonogramObservableForContactFuture_monogramColor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  if (objc_msgSend(v2, "contactType"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97218], "abbreviatedStringFromContact:trimmingWhitespace:", v2, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    v3 = v5;

  }
  return v3;
}

void __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_3;
  v8[3] = &unk_1EA6042B8;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "performBlock:", v8);

}

id __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "shouldFetchSharedPhotoForContact:", v3);
  v5 = (void *)MEMORY[0x1E0D13A68];
  if (v4)
  {
    v14 = MEMORY[0x1E0C809B0];
    v6 = __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_2;
    v7 = &v14;
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v6 = __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_3;
    v7 = &v13;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&unk_1EA604CB8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v7[4] = v8;
  v7[5] = (uint64_t)v3;
  v10 = v3;
  objc_msgSend(v5, "futureWithBlock:scheduler:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)contentObservableForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5 workScheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_class();
  -[CNUIPRLikenessLookup contactStore](self, "contactStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contactFuture:contactStore:scheduler:refetchContact:", v10, v15, v13, -[CNUIPRLikenessLookup skipContactLookup](self, "skipContactLookup") ^ 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIPRLikenessLookup photoFutureForContactFuture:scheduler:](self, "photoFutureForContactFuture:scheduler:", v16, v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup photoFutureForContactFuture:photoFuture:allowingFallbackForMeCard:](self, "photoFutureForContactFuture:photoFuture:allowingFallbackForMeCard:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v17;
  -[CNUIPRLikenessLookup blessedPhotoObservableWithFuture:contact:workScheduler:](self, "blessedPhotoObservableWithFuture:contact:workScheduler:", v17, v10, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_cn_addNonNilObject:", v19);

  -[CNUIPRLikenessLookup remoteImagesObservableWithContactFuture:workScheduler:](self, "remoteImagesObservableWithContactFuture:workScheduler:", v16, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_cn_addNonNilObject:", v20);

  v34 = v12;
  objc_msgSend(v12, "monogramColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup basicMonogramObservableWithContactFuture:monogramColor:](self, "basicMonogramObservableWithContactFuture:monogramColor:", v16, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_cn_addNonNilObject:", v22);

  v35 = v11;
  -[CNUIPRLikenessLookup silhouetteObservableWithPlaceholderProviderFactory:contact:workScheduler:](self, "silhouetteObservableWithPlaceholderProviderFactory:contact:workScheduler:", v11, v10, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_cn_addNonNilObject:", v23);

  objc_msgSend(v18, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v18, "_cn_tail");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v37;
    do
    {
      v29 = 0;
      v30 = v24;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v30, "onEmpty:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v29));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        ++v29;
        v30 = v24;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v27);
  }

  return v24;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)skipContactLookup
{
  return -[CNUIPRLikenessLookup lookupOptions](self, "lookupOptions") & 1;
}

- (BOOL)shouldFetchSharedPhotoForContact:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;
  char isKindOfClass;
  void *v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  if ((-[CNUIPRLikenessLookup lookupOptions](self, "lookupOptions") & 2) != 0)
  {
    if (-[CNUIPRLikenessLookup isMeContact:](self, "isMeContact:", v4))
    {
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nicknameProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isNicknameSharingEnabled");

    }
    else
    {
      v8 = 0;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v4, "thumbnailImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = 1;
    }
    else if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
    {
      objc_msgSend(v4, "imageData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12 != 0;

    }
    else
    {
      v11 = 0;
    }

    v5 = v8 & (isKindOfClass & v11 ^ 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

- (id)remoteImagesObservableWithContactFuture:(id)a3 workScheduler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 1))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1;
    v20 = __Block_byref_object_dispose__1;
    v8 = MEMORY[0x1E0C809B0];
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke;
    v15[3] = &unk_1EA604B60;
    v15[4] = &v16;
    objc_msgSend(v6, "flatMap:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "photoObservableWithPhotoFuture:likenessFingerprint:scheduler:", v9, v17[5], v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2;
    v13[3] = &unk_1EA604B10;
    v14 = v6;
    objc_msgSend(v10, "doOnNext:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)photoFutureForContactFuture:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke;
  v10[3] = &unk_1EA604CE0;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)photoFutureForContactFuture:(id)a3 photoFuture:(id)a4 allowingFallbackForMeCard:(BOOL)a5
{
  return a4;
}

- (id)blessedPhotoObservableWithFuture:(id)a3 contact:(id)a4 workScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 1))
  {
    +[CNUILikenessFingerprint fingerprintForContact:](CNUILikenessFingerprint, "fingerprintForContact:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "photoObservableWithPhotoFuture:likenessFingerprint:scheduler:", v8, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke;
    v15[3] = &unk_1EA604B10;
    v16 = v9;
    objc_msgSend(v12, "doOnNext:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)mayIncludeSource:(int64_t)a3
{
  return (-[CNUIPRLikenessLookup prohibitedSources](self, "prohibitedSources") & a3) == 0;
}

- (int64_t)prohibitedSources
{
  return self->_prohibitedSources;
}

- (id)basicMonogramObservableWithContactFuture:(id)a3 monogramColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 2))
  {
    objc_msgSend((id)objc_opt_class(), "basicMonogramObservableForContactFuture:monogramColor:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke;
    v11[3] = &unk_1EA604B10;
    v12 = v6;
    objc_msgSend(v8, "doOnNext:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)observableFromLikenessProviderBlock:(id)a3 withScheduler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D13AE8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke;
  v12[3] = &unk_1EA604C40;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "observableWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)contactFuture:(id)a3 contactStore:(id)a4 scheduler:(id)a5 refetchContact:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0D13A68];
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__CNUIPRLikenessLookup_contactFuture_contactStore_scheduler_refetchContact___block_invoke;
  v21[3] = &unk_1EA604C90;
  v14 = v10;
  v25 = a6;
  v23 = v11;
  v24 = a1;
  v22 = v14;
  v15 = v11;
  objc_msgSend(v12, "futureWithBlock:scheduler:", v21, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __76__CNUIPRLikenessLookup_contactFuture_contactStore_scheduler_refetchContact___block_invoke_42;
  v19[3] = &unk_1EA6038F0;
  v20 = v14;
  v17 = v14;
  objc_msgSend(v16, "addSuccessBlock:", v19);

  return v16;
}

+ (id)basicMonogramObservableForContactFuture:(id)a3 monogramColor:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0D13AE8];
  v7 = a4;
  objc_msgSend(v6, "observableWithFuture:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "map:", &__block_literal_global_49);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filter:", *MEMORY[0x1E0D13830]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "basicMonogramObservableFromString:color:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)photoObservableWithPhotoFuture:(id)a3 likenessFingerprint:(id)a4 scheduler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13AE8];
  v9 = a5;
  objc_msgSend(v8, "observableWithFuture:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__CNUIPRLikenessLookup_photoObservableWithPhotoFuture_likenessFingerprint_scheduler___block_invoke;
  v17[3] = &unk_1EA604C68;
  v18 = v7;
  v11 = v7;
  objc_msgSend(v10, "map:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscribeOn:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "onError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)basicMonogramObservableFromString:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__CNUIPRLikenessLookup_basicMonogramObservableFromString_color___block_invoke;
  v10[3] = &unk_1EA604BA8;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a3, "map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filter:", *MEMORY[0x1E0D13830]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)likenessesForContact:(id)a3 options:(id)a4 workScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[CNUIPRLikenessLookup placeholderProviderFactory](self, "placeholderProviderFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup likenessObservableForContact:placeholderProviderFactory:options:workScheduler:](self, "likenessObservableForContact:placeholderProviderFactory:options:workScheduler:", v8, v11, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke;
  v16[3] = &unk_1EA604B10;
  v17 = v8;
  v13 = v8;
  objc_msgSend(v12, "doOnNext:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CNUIPlaceholderProviderFactory)placeholderProviderFactory
{
  return self->_placeholderProviderFactory;
}

- (id)likenessObservableForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5 workScheduler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v11, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup contentObservableForContact:placeholderProviderFactory:options:workScheduler:](self, "contentObservableForContact:placeholderProviderFactory:options:workScheduler:", v14, v10, v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 8))
  {
    -[CNUIPRLikenessLookup loadingPlaceholderObservableWithPlaceholderProviderFactory:](self, "loadingPlaceholderObservableWithPlaceholderProviderFactory:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cn_addNonNilObject:", v17);

    -[CNUIPRLikenessLookup schedulerProvider](self, "schedulerProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mainThreadScheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "observeOn:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v20;
  }
  objc_msgSend(v15, "addObject:", v16);
  objc_msgSend(MEMORY[0x1E0D13AE8], "concatenate:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __76__CNUIPRLikenessLookup_contactFuture_contactStore_scheduler_refetchContact___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "descriptorForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenPersisted") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "imageData"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      if (*(_QWORD *)(a1 + 40) && objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
      {
        v10 = a1 + 32;
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v10 + 8);
        v18[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contactsMatchingPropertiesOfContact:unifyResults:keysToFetch:error:", v8, 1, v11, a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1DD140000, v13, OS_LOG_TYPE_INFO, "[LikenessResolver] Matched more than one contact when resolving likeness", v17, 2u);
          }

        }
        objc_msgSend(v12, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v7;
      }
      else
      {
        v7 = v4;
      }
    }
    else
    {
      v7 = *(void **)(a1 + 32);
    }
    v15 = v7;

  }
  else
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.7();

    v4 = v4;
    v15 = v4;
  }

  return v15;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1002, *MEMORY[0x1E0C96890], *MEMORY[0x1E0C96818], *MEMORY[0x1E0C967F8], *MEMORY[0x1E0C966A8], *MEMORY[0x1E0C967C0], *MEMORY[0x1E0C96898]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[6] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUIPRLikenessLookup descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_2;
  v9[3] = &unk_1EA604C18;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4 meMonitor:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNUIPRLikenessLookup *v12;
  CNUIPRLikenessLookup *v13;
  CNUIPlaceholderProviderFactory *v14;
  CNUIPlaceholderProviderFactory *placeholderProviderFactory;
  CNUIPRLikenessLookup *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNUIPRLikenessLookup;
  v12 = -[CNUIPRLikenessLookup init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contactStore, a3);
    v14 = objc_alloc_init(CNUIPlaceholderProviderFactory);
    placeholderProviderFactory = v13->_placeholderProviderFactory;
    v13->_placeholderProviderFactory = v14;

    objc_storeStrong((id *)&v13->_schedulerProvider, a4);
    objc_storeStrong((id *)&v13->_meMonitor, a5);
    v16 = v13;
  }

  return v13;
}

void __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke_cold_1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);
  objc_storeStrong((id *)&self->_meMonitor, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke_cold_1();

}

id __64__CNUIPRLikenessLookup_basicMonogramObservableFromString_color___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  CNUIPRLikenessProvider *v12;

  v3 = a2;
  v4 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v3))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)getPRMonogramClass_0(), "monogram");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v3);
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v7);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (*(_QWORD *)(a1 + 32))
        objc_msgSend(v6, "setMonogramColor:");
      v9 = (void *)MEMORY[0x1E0D70A68];
      objc_msgSend(v6, "dataRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "monogramWithRecipe:staticRepresentation:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = -[CNUIPRLikenessProvider initWithPRLikeness:]([CNUIPRLikenessProvider alloc], "initWithPRLikeness:", v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v12 = (CNUIPRLikenessProvider *)objc_claimAutoreleasedReturnValue();
      }
      v5 = v12;

    }
  }

  return v5;
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 scheduler:(id)a4 meMonitor:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNUIPRLikenessLookup *v19;

  v7 = (void *)MEMORY[0x1E0D13B70];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "defaultProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D13B70]);
  objc_msgSend(v11, "mainThreadScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "immediateScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("serialSchedulerProvider"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("synchronousSerialSchedulerProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("readerWriterSchedulerProvider"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v12, "initWithBackgroundScheduler:mainThreadScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v9, v13, v14, v15, v16, v17);

  v19 = -[CNUIPRLikenessLookup initWithContactStore:schedulerProvider:meMonitor:](self, "initWithContactStore:schedulerProvider:meMonitor:", v10, v18, v8);
  return v19;
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 scheduler:(id)a4
{
  return -[CNUIPRLikenessLookup initWithContactStore:scheduler:meMonitor:](self, "initWithContactStore:scheduler:meMonitor:", a3, a4, 0);
}

- (id)likenessesForContacts:(id)a3 options:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v7 = a4;
  v8 = a3;
  -[CNUIPRLikenessLookup placeholderProviderFactory](self, "placeholderProviderFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__CNUIPRLikenessLookup_likenessesForContacts_options_error___block_invoke;
  v15[3] = &unk_1EA603240;
  v15[4] = self;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v10, "_cn_map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __60__CNUIPRLikenessLookup_likenessesForContacts_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "likenessForContact:placeholderProviderFactory:options:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)resolveLikenessesForContacts:(id)a3 workScheduler:(id)a4 withContentHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  CNUIPRLikenessLookup *v24;
  id v25;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __86__CNUIPRLikenessLookup_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke;
  v23 = &unk_1EA603D48;
  v24 = self;
  v25 = v8;
  v12 = v8;
  objc_msgSend(v11, "_cn_map:", &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D13AE8];
  -[CNUIPRLikenessLookup schedulerProvider](self, "schedulerProvider", v20, v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "combineLatest:resultScheduler:schedulerProvider:", v13, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AF0], "observerWithResultBlock:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "subscribe:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __86__CNUIPRLikenessLookup_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "likenessesForContact:workScheduler:", a2, *(_QWORD *)(a1 + 40));
}

- (id)likenessForContact:(id)a3 error:(id *)a4
{
  return -[CNUIPRLikenessLookup likenessForContact:options:error:](self, "likenessForContact:options:error:", a3, 0, a4);
}

- (id)likenessForContact:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  -[CNUIPRLikenessLookup placeholderProviderFactory](self, "placeholderProviderFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:](self, "likenessForContact:placeholderProviderFactory:options:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)likenessesForContact:(id)a3 workScheduler:(id)a4
{
  return -[CNUIPRLikenessLookup likenessesForContact:options:workScheduler:](self, "likenessesForContact:options:workScheduler:", a3, 0, a4);
}

- (id)likenessForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_class();
  -[CNUIPRLikenessLookup contactStore](self, "contactStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactFuture:contactStore:refetchContact:", v8, v12, -[CNUIPRLikenessLookup skipContactLookup](self, "skipContactLookup") ^ 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13B68], "immediateScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup photoFutureForContactFuture:scheduler:](self, "photoFutureForContactFuture:scheduler:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIPRLikenessLookup photoFutureForContactFuture:photoFuture:allowingFallbackForMeCard:](self, "photoFutureForContactFuture:photoFuture:allowingFallbackForMeCard:", v13, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup blessedPhotoWithFuture:contact:](self, "blessedPhotoWithFuture:contact:", v16, v8);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:].cold.4();
  }
  else
  {
    -[CNUIPRLikenessLookup remoteImageWithContactFuture:](self, "remoteImageWithContactFuture:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v18 = (void *)v20;
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:].cold.3();
    }
    else
    {
      objc_msgSend(v10, "monogramColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIPRLikenessLookup basicMonogramWithContactFuture:monogramColor:](self, "basicMonogramWithContactFuture:monogramColor:", v13, v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:].cold.2();
      }
      else
      {
        -[CNUIPRLikenessLookup silhouetteWithPlaceholderProviderFactory:contact:](self, "silhouetteWithPlaceholderProviderFactory:contact:", v9, v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:].cold.1();
      }
    }
  }

  v22 = v18;
  return v22;
}

- (CNUIPRLikenessProvider)loadingPlaceholderLikeness
{
  void *v3;
  void *v4;

  -[CNUIPRLikenessLookup placeholderProviderFactory](self, "placeholderProviderFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPRLikenessLookup loadingPlaceholderWithPlaceholderProviderFactory:](self, "loadingPlaceholderWithPlaceholderProviderFactory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNUIPRLikenessProvider *)v4;
}

- (id)loadingPlaceholderWithPlaceholderProviderFactory:(id)a3
{
  return (id)objc_msgSend(a3, "loadingPlaceholderProvider");
}

- (id)loadingPlaceholderObservableWithPlaceholderProviderFactory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__CNUIPRLikenessLookup_loadingPlaceholderObservableWithPlaceholderProviderFactory___block_invoke;
  v11[3] = &unk_1EA604B38;
  v12 = v4;
  v6 = v4;
  -[CNUIPRLikenessLookup schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observableFromLikenessProviderBlock:withScheduler:", v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __83__CNUIPRLikenessLookup_loadingPlaceholderObservableWithPlaceholderProviderFactory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadingPlaceholderProvider");
}

- (id)blessedPhotoWithFuture:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 1))
  {
    +[CNUILikenessFingerprint fingerprintForContact:](CNUILikenessFingerprint, "fingerprintForContact:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "photoWithPhotoFuture:likenessFingerprint:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessLookup blessedPhotoWithFuture:contact:].cold.1();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)remoteImageWithContactFuture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 1))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__CNUIPRLikenessLookup_remoteImageWithContactFuture___block_invoke;
    v10[3] = &unk_1EA604B60;
    v10[4] = &v11;
    objc_msgSend(v4, "flatMap:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "photoWithPhotoFuture:likenessFingerprint:", v5, v12[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "result:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIPRLikenessLookup remoteImageWithContactFuture:].cold.1((uint64_t)v6, v8, (uint64_t)v17, v7);
    }

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __53__CNUIPRLikenessLookup_remoteImageWithContactFuture___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  +[CNUILikenessFingerprint fingerprintForContact:](CNUILikenessFingerprint, "fingerprintForContact:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  +[CNUIRemotePhotoFutures photoForContact:](CNUIRemotePhotoFutures, "photoForContact:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2_cold_1();

}

- (id)basicMonogramWithContactFuture:(id)a3 monogramColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 2))
  {
    objc_msgSend((id)objc_opt_class(), "basicMonogramForContactFuture:monogramColor:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessLookup basicMonogramWithContactFuture:monogramColor:].cold.1();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)basicMonogramForContactFuture:(id)a3 monogramColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "result:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (!objc_msgSend(v7, "contactType"))
  {
    objc_msgSend(MEMORY[0x1E0C97218], "abbreviatedStringFromContact:trimmingWhitespace:", v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "length"))
    {
      objc_msgSend(a1, "basicMonogramFromString:color:", v10, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)basicMonogramFromString:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;
  CNUIPRLikenessProvider *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "length"))
  {
    -[objc_class monogram](getPRMonogramClass_0(), "monogram");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v5);
    objc_msgSend(v7, "text");
    v8 = (CNUIPRLikenessProvider *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        if (v6)
          objc_msgSend(v7, "setMonogramColor:", v6);
        v11 = (void *)MEMORY[0x1E0D70A68];
        objc_msgSend(v7, "dataRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "monogramWithRecipe:staticRepresentation:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v8 = -[CNUIPRLikenessProvider initWithPRLikeness:]([CNUIPRLikenessProvider alloc], "initWithPRLikeness:", v13);
        else
          v8 = 0;

      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)basicMonogramFromString:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "basicMonogramFromString:color:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)basicMonogramObservableFromString:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "basicMonogramObservableFromString:color:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)silhouetteWithPlaceholderProviderFactory:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 4))
  {
    objc_msgSend(v6, "placeholderProviderForContact:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CNUIPRLikenessLookup silhouetteWithPlaceholderProviderFactory:contact:].cold.1();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)silhouetteObservableWithPlaceholderProviderFactory:(id)a3 contact:(id)a4 workScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CNUIPRLikenessLookup mayIncludeSource:](self, "mayIncludeSource:", 4))
  {
    v11 = (void *)objc_opt_class();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __97__CNUIPRLikenessLookup_silhouetteObservableWithPlaceholderProviderFactory_contact_workScheduler___block_invoke;
    v18 = &unk_1EA604BD0;
    v19 = v8;
    v20 = v9;
    objc_msgSend(v11, "observableFromLikenessProviderBlock:withScheduler:", &v15, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doOnNext:", &__block_literal_global_30, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __97__CNUIPRLikenessLookup_silhouetteObservableWithPlaceholderProviderFactory_contact_workScheduler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "placeholderProviderForContact:", *(_QWORD *)(a1 + 40));
}

void __97__CNUIPRLikenessLookup_silhouetteObservableWithPlaceholderProviderFactory_contact_workScheduler___block_invoke_2()
{
  NSObject *v0;

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    -[CNUIPRLikenessLookup silhouetteWithPlaceholderProviderFactory:contact:].cold.1();

}

- (id)badgeWithLikenessBadge:(id)a3
{
  id v3;
  CNUIPRLikenessBadgeImageProvider *v4;

  v3 = a3;
  v4 = -[CNUIPRLikenessBadgeImageProvider initWithBadge:]([CNUIPRLikenessBadgeImageProvider alloc], "initWithBadge:", v3);

  return v4;
}

- (id)badgeObservableWithLikenessBadge:(id)a3 workScheduler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_class();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke;
  v12[3] = &unk_1EA604B38;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "observableFromLikenessProviderBlock:withScheduler:", v12, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doOnNext:", &__block_literal_global_32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

CNUIPRLikenessBadgeImageProvider *__71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke(uint64_t a1)
{
  return -[CNUIPRLikenessBadgeImageProvider initWithBadge:]([CNUIPRLikenessBadgeImageProvider alloc], "initWithBadge:", *(_QWORD *)(a1 + 32));
}

void __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2()
{
  NSObject *v0;

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2_cold_1();

}

+ (id)photoWithPhotoFuture:(id)a3 likenessFingerprint:(id)a4
{
  id v5;
  void *v6;
  id v7;
  CNUIPRLikenessPhotoProvider *v8;
  NSObject *v9;
  id v11;

  v5 = a4;
  v11 = 0;
  objc_msgSend(a3, "result:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = -[CNUIPRLikenessPhotoProvider initWithPhotoData:fingerprint:]([CNUIPRLikenessPhotoProvider alloc], "initWithPhotoData:fingerprint:", v6, v5);
  }
  else
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[CNUIPRLikenessLookup photoWithPhotoFuture:likenessFingerprint:].cold.1((uint64_t)v7, v9);

    v8 = 0;
  }

  return v8;
}

+ (id)contactFuture:(id)a3 contactStore:(id)a4 refetchContact:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint8_t v25[8];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.7();
    goto LABEL_23;
  }
  if ((objc_msgSend(v8, "hasBeenPersisted") & 1) == 0)
  {
    objc_msgSend(v8, "imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.6();
LABEL_23:

      objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  if (!v9)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.1();
    goto LABEL_23;
  }
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.5();
    goto LABEL_23;
  }
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v9, "contactsMatchingPropertiesOfContact:unifyResults:keysToFetch:error:", v8, 1, v13, &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v26;

  if (v14)
  {
    if (objc_msgSend(v14, "count"))
    {
      if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      {
        +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_1DD140000, v16, OS_LOG_TYPE_INFO, "[LikenessResolver] Matched more than one contact when resolving likeness", v25, 2u);
        }

      }
      objc_msgSend(v14, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.4();

      objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v17);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.3();

      v24 = (void *)MEMORY[0x1E0D13A68];
      +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 402);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "futureWithError:", v17);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v19;

  }
  else
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.2((uint64_t)v15, v22);

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_24:
  return v20;
}

void __76__CNUIPRLikenessLookup_contactFuture_contactStore_scheduler_refetchContact___block_invoke_42(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __76__CNUIPRLikenessLookup_contactFuture_contactStore_scheduler_refetchContact___block_invoke_42_cold_1();

}

- (BOOL)isMeContact:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[CNUIPRLikenessLookup skipContactLookup](self, "skipContactLookup"))
  {
    v5 = 0;
  }
  else
  {
    -[CNUIPRLikenessLookup meMonitor](self, "meMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNUIPRLikenessLookup meMonitor](self, "meMonitor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isMeContact:", v4);
    }
    else
    {
      -[CNUIPRLikenessLookup contactStore](self, "contactStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", MEMORY[0x1E0C9AA60], 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "isEqualToString:", v10);

    }
  }

  return v5;
}

uint64_t __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "futureResultForPhotoImageDataForMeContact:error:", *(_QWORD *)(a1 + 40), a2);
}

- (id)futureResultForPhotoImageDataForMeContact:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  CNUIPRLikenessLookup *v20;
  id v21;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nicknameProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__CNUIPRLikenessLookup_futureResultForPhotoImageDataForMeContact_error___block_invoke;
  v18[3] = &unk_1EA604D08;
  v10 = v6;
  v19 = v10;
  v20 = self;
  v11 = v7;
  v21 = v11;
  objc_msgSend(v9, "fetchPersonalNicknameAsContactWithCompletion:", v18);

  v12 = *MEMORY[0x1E0D13880];
  objc_msgSend(v11, "future");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultWithTimeout:error:", 0, 0.2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
  {
    -[CNUIPRLikenessLookup futureResultForPhotoImageDataForContact:error:](self, "futureResultForPhotoImageDataForContact:error:", v10, a4);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }

  return v15;
}

void __72__CNUIPRLikenessLookup_futureResultForPhotoImageDataForMeContact_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a2;
  if (!a2)
    v4 = (void *)a1[4];
  v5 = v4;
  v6 = (void *)a1[5];
  v11 = a2;
  objc_msgSend(v6, "photoImageDataForContact:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13818] + 16))();
  v9 = (void *)a1[6];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C968C8], 302, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
  else
  {
    objc_msgSend(v9, "finishWithResult:", v7);
  }

}

- (void)setLookupOptions:(unint64_t)a3
{
  self->_lookupOptions = a3;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUIMeContactMonitor)meMonitor
{
  return self->_meMonitor;
}

- (void)setMeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_meMonitor, a3);
}

- (void)setPlaceholderProviderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderProviderFactory, a3);
}

void __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "[LikenessResolver] Concatenation received provider %@ for contact %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Falling back to silhouette likeness", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Found basic monogram likeness", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Found remote image likeness", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Found blessed photo likeness", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)blessedPhotoWithFuture:contact:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "[LikenessResolver] Received photo provider %@ for contact %@", v1);
  OUTLINED_FUNCTION_2();
}

void __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "[LikenessResolver] Received photo provider %@ for contact %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)remoteImageWithContactFuture:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, a4, a3, "[LikenessResolver] Received photo provider %@ for contact %@", (uint8_t *)a3);

}

void __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "result:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, v3, "[LikenessResolver] Received remote image %@ for contact %@", v4);

  OUTLINED_FUNCTION_2_3();
}

- (void)basicMonogramWithContactFuture:monogramColor:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "result:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, v3, "[LikenessResolver] Creating basic monogram %@ for contact %@", v4);

  OUTLINED_FUNCTION_2_3();
}

void __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "result:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, v3, "[LikenessResolver] Creating basic monogram %@ for contact %@", v4);

  OUTLINED_FUNCTION_2_3();
}

- (void)silhouetteWithPlaceholderProviderFactory:contact:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Creating silhouette", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Creating badge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)photoWithPhotoFuture:(uint64_t)a1 likenessFingerprint:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "[LikenessResolver] Could not load photo: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)contactFuture:contactStore:refetchContact:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] No refetching store provided; continuing with original contact",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

+ (void)contactFuture:(uint64_t)a1 contactStore:(NSObject *)a2 refetchContact:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD140000, a2, OS_LOG_TYPE_ERROR, "[LikenessResolver] Refetch failed with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)contactFuture:contactStore:refetchContact:.cold.3()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1DD140000, v0, OS_LOG_TYPE_ERROR, "[LikenessResolver] Refetch succeeded but no contacts were found", v1, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)contactFuture:contactStore:refetchContact:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "[LikenessResolver] got contact %@ matching %@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)contactFuture:contactStore:refetchContact:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Contacts access not authorized; continuing with original contact",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

+ (void)contactFuture:contactStore:refetchContact:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Using a provided transient contact", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)contactFuture:contactStore:refetchContact:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, v0, v1, "[LikenessResolver] Contact lookup disabled, skipping contact refetch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__CNUIPRLikenessLookup_contactFuture_contactStore_scheduler_refetchContact___block_invoke_42_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "[LikenessResolver] got contact %@ matching %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)photoImageDataForContact:error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, v3, "[LikenessResolver] Returning thumbnail/image of %@, length: %@", v4);

  OUTLINED_FUNCTION_2_3();
}

@end
