@implementation MDMCheckInRequest

+ (void)executeRequestForMessageType:(id)a3 channelType:(unint64_t)a4 requestDict:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  id v29;
  id v30;
  uint8_t buf[4];
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Authenticate")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("TokenUpdate")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("CheckOut")))
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = (unint64_t)v10;
      _os_log_impl(&dword_1D4BF7000, v13, OS_LOG_TYPE_ERROR, "This checkin channel does not support the messageType: %{public}@", buf, 0xCu);
    }
    objc_msgSend(a1, "_createUnsupportedFeatureError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v14);
  }
  else
  {
    +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "refreshDetailsFromDisk");
    objc_msgSend(v14, "memberQueueManagingProfileIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v14, "memberQueueCheckInURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (const void *)objc_msgSend(v14, "copyMemberQueueIdentity");
      objc_msgSend(v14, "memberQueueCheckInPinnedSecCertificateRefs");
      v28 = objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v14, "memberQueuePinningRevocationCheckRequired");
      v26 = objc_msgSend(v14, "memberQueueSignMessage");
      v18 = objc_msgSend(v14, "isUserEnrollment");
      objc_msgSend(v14, "enrollmentID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && v17)
      {
        +[MDMClientCore clientWithChannelType:](MDMClientCore, "clientWithChannelType:", a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v32 = a4;
          _os_log_impl(&dword_1D4BF7000, v20, OS_LOG_TYPE_INFO, "Calling checkInRequestAtURL - channel type: %lu", buf, 0xCu);
        }
        v29 = 0;
        v30 = 0;
        v21 = (void *)v28;
        objc_msgSend(v25, "checkInRequestAtURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:isUserEnrollment:enrollmentID:messageType:requestDict:outResponse:outError:", v16, v17, v28, v27, v26, v18, v19, v10, v11, &v30, &v29);
        v22 = v30;
        v23 = v29;
        CFRelease(v17);
        ((void (**)(id, id, void *))v12)[2](v12, v22, v23);

      }
      else
      {
        if (v17)
          CFRelease(v17);
        objc_msgSend(a1, "_createNoInstallationError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, 0, v24);

        v21 = (void *)v28;
      }

    }
    else
    {
      objc_msgSend(a1, "_createNoInstallationError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v16);
    }

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
