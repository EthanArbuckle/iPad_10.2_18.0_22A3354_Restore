@implementation MDMDeclarativeManagement

+ (void)executeRequestForEndpoint:(id)a3 channelType:(unint64_t)a4 requestData:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, id);
  void *v13;
  void *v14;
  void *v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id, id))a6;
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "refreshDetailsFromDisk");
  objc_msgSend(v13, "memberQueueManagingProfileIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v28 = v10;
    v29 = v11;
    objc_msgSend(v13, "memberQueueCheckInURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const void *)objc_msgSend(v13, "copyMemberQueueIdentity");
    objc_msgSend(v13, "memberQueueCheckInPinnedSecCertificateRefs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v13, "memberQueuePinningRevocationCheckRequired");
    v18 = objc_msgSend(v13, "memberQueueSignMessage");
    v19 = objc_msgSend(v13, "isUserEnrollment");
    objc_msgSend(v13, "enrollmentID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && v16)
    {
      +[MDMClientCore clientWithChannelType:](MDMClientCore, "clientWithChannelType:", a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v33 = a4;
        _os_log_impl(&dword_1D4BF7000, v21, OS_LOG_TYPE_INFO, "Calling remoteManagementCheckInURL - channel type: %lu", buf, 0xCu);
      }
      v30 = 0;
      v31 = 0;
      objc_msgSend(v26, "remoteManagementCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:isUserEnrollment:enrollmentID:endpoint:requestData:outResponse:outError:", v15, v16, v17, v27, v18, v19, v20, v28, v29, &v31, &v30);
      v22 = v31;
      v23 = v30;
      CFRelease(v16);
      v12[2](v12, v22, v23);

      v10 = v28;
    }
    else
    {
      if (v16)
        CFRelease(v16);
      objc_msgSend(a1, "_createNoInstallationError");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v25);

      v10 = v28;
    }

    v11 = v29;
  }
  else
  {
    objc_msgSend(a1, "_createNoInstallationError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v24);

  }
}

+ (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MDMHTTPTransaction *v15;
  MDMHTTPTransaction *v16;
  _QWORD v17[4];
  MDMHTTPTransaction *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "refreshDetailsFromDisk");
  objc_msgSend(v8, "memberQueueManagingProfileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (const void *)objc_msgSend(v8, "copyMemberQueueIdentity");
    objc_msgSend(v8, "memberQueueCheckInPinnedSecCertificateRefs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "memberQueuePinningRevocationCheckRequired");
    v13 = objc_msgSend(v8, "memberQueueSignMessage");
    objc_msgSend(v8, "rmAccountID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v15 = -[MDMHTTPTransaction initWithURL:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isShortTransaction:rmAccountID:]([MDMHTTPTransaction alloc], "initWithURL:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isShortTransaction:rmAccountID:", v6, v10, v11, v12, v13, 0, v14);
      CFRelease(v10);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__MDMDeclarativeManagement_fetchDataAtURL_completionHandler___block_invoke;
      v17[3] = &unk_1E9852A90;
      v18 = v15;
      v19 = v7;
      v16 = v15;
      -[DMCHTTPTransaction performCompletionBlock:](v16, "performCompletionBlock:", v17);

    }
    else
    {
      objc_msgSend(a1, "_createNoInstallationError");
      v16 = (MDMHTTPTransaction *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, MDMHTTPTransaction *))v7 + 2))(v7, 0, v16);
    }

  }
  else
  {
    objc_msgSend(a1, "_createNoInstallationError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

void __61__MDMDeclarativeManagement_fetchDataAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = CFSTR("ResponseStatusCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "statusCode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v10[1] = CFSTR("ResponseHeaders");
    objc_msgSend(*(id *)(a1 + 32), "responseHeaders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "responseData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ResponseBody"));

    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_msgSend(v6, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
}

+ (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  MDMHTTPTransaction *v18;
  MDMHTTPTransaction *v19;
  uint64_t v20;
  _QWORD v21[4];
  MDMHTTPTransaction *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshDetailsFromDisk");
  objc_msgSend(v11, "memberQueueManagingProfileIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (const void *)objc_msgSend(v11, "copyMemberQueueIdentity");
    objc_msgSend(v11, "memberQueueCheckInPinnedSecCertificateRefs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "memberQueuePinningRevocationCheckRequired");
    v16 = objc_msgSend(v11, "memberQueueSignMessage");
    objc_msgSend(v11, "rmAccountID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      LOBYTE(v20) = 0;
      v18 = -[MDMHTTPTransaction initWithURL:downloadURL:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isShortTransaction:rmAccountID:]([MDMHTTPTransaction alloc], "initWithURL:downloadURL:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isShortTransaction:rmAccountID:", v8, v9, v13, v14, v15, v16, v20, v17);
      CFRelease(v13);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __76__MDMDeclarativeManagement_downloadDataAtURL_downloadURL_completionHandler___block_invoke;
      v21[3] = &unk_1E9852AB8;
      v22 = v18;
      v24 = v10;
      v23 = v9;
      v19 = v18;
      -[DMCHTTPTransaction performCompletionBlock:](v19, "performCompletionBlock:", v21);

    }
    else
    {
      objc_msgSend(a1, "_createNoInstallationError");
      v19 = (MDMHTTPTransaction *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, MDMHTTPTransaction *))v10 + 2))(v10, 0, v19);
    }

  }
  else
  {
    objc_msgSend(a1, "_createNoInstallationError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
  }

}

void __76__MDMDeclarativeManagement_downloadDataAtURL_downloadURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = CFSTR("ResponseStatusCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "statusCode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v7[1] = CFSTR("ResponseHeaders");
    objc_msgSend(*(id *)(a1 + 32), "responseHeaders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = CFSTR("ResponseDownloadURL");
    v5 = *(_QWORD *)(a1 + 40);
    v8[1] = v4;
    v8[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (id)_createUnsupportedFeatureError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15008, v4, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createNoInstallationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C150];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12079, v4, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
