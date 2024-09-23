@implementation AADeviceProvisioningSession

- (AADeviceProvisioningSession)init
{
  return -[AADeviceProvisioningSession initWithDSID:](self, "initWithDSID:", 0);
}

- (AADeviceProvisioningSession)initWithDSID:(id)a3
{
  id v5;
  NSObject *v6;
  AADeviceProvisioningSession *v7;
  AADeviceProvisioningSession *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *dsid;
  objc_super v13;
  uint8_t buf[4];
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "BADNESS!!! Nil DSID passed into provisioning session.", buf, 2u);
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)AADeviceProvisioningSession;
  v7 = -[AADeviceProvisioningSession init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dsid, a3);
    v9 = objc_msgSend(v5, "longLongValue");
    v8->_dsidNumber = v9;
    if (!v9)
    {
      _AALogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        dsid = v8->_dsid;
        *(_DWORD *)buf = 138412290;
        v15 = dsid;
        _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "BADNESS!!! Invalid DSID passed into provisioning session: %@", buf, 0xCu);
      }

    }
  }

  return v8;
}

- (AADeviceProvisioningSession)initWithAccount:(id)a3
{
  id v5;
  void *v6;
  AADeviceProvisioningSession *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADeviceProvisioningSession.m"), 47, CFSTR("Nil account passed to provisioning session."));

  }
  objc_msgSend(v5, "aa_personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AADeviceProvisioningSession initWithDSID:](self, "initWithDSID:", v6);

  return v7;
}

- (void)setCookieStorageRef:(OpaqueCFHTTPCookieStorage *)a3
{
  self->_cookieStorageRef = a3;
}

- (void)addProvisioningInfoToAARequest:(id)a3
{
  -[AADeviceProvisioningSession addProvisioningInfoToAARequest:withFallback:](self, "addProvisioningInfoToAARequest:withFallback:", a3, 0);
}

- (void)addProvisioningInfoToAARequest:(id)a3 withFallback:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[AADeviceProvisioningSession deviceProvisioningInfo](self, "deviceProvisioningInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mid_data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceProvisioningMachineId:", v8);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("otp_data"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceProvisioningOneTimePassword:", v9);

  }
  else if (v4)
  {
    objc_msgSend(v10, "setDeviceProvisioningOneTimePassword:", &stru_1E41752F8);
    objc_msgSend(v10, "setDeviceProvisioningMachineId:", &stru_1E41752F8);
  }

}

- (void)addProvisioningInfoToURLRequest:(id)a3 sendEmptyValues:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  _DWORD v12[2];
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AADeviceProvisioningSession deviceProvisioningInfo](self, "deviceProvisioningInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v4;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Adding HSA info to request. sendEmptyValues = %d", (uint8_t *)v12, 8u);
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mid_data"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("otp_data"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v4 && v9 == 0)
    v9 = &stru_1E41752F8;
  if (v4 && v10 == 0)
    v11 = &stru_1E41752F8;
  else
    v11 = (__CFString *)v10;
  if (v9)
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-MD-M"));
  if (v11)
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v11, CFSTR("X-Apple-MD"));

}

- (id)deviceProvisioningInfo
{
  NSObject *v3;
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_dsid)
    return 0;
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Request device provisioning info.", buf, 2u);
  }

  v19 = 0;
  v20 = 0;
  v18 = 0;
  qi864985u0(self->_dsidNumber, (uint64_t)&v20, (uint64_t)&v18 + 4, (uint64_t)&v19, (uint64_t)&v18);
  if (!v4)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    v6 = objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", v20, HIDWORD(v18), 0);
    v12 = objc_alloc(MEMORY[0x1E0C99D50]);
    v13 = (void *)objc_msgSend(v12, "initWithBytesNoCopy:length:freeWhenDone:", v19, v18, 0);
    -[NSObject base64EncodedStringWithOptions:](v6, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Provisioning Info: mid - %@ otp - %@", buf, 0x16u);
    }

    v21[0] = CFSTR("mid_data");
    v21[1] = CFSTR("otp_data");
    v22[0] = v14;
    v22[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      jk24uiwqrg(v20);
    if (v19)
      jk24uiwqrg(v19);

    goto LABEL_20;
  }
  v5 = v4;
  if (v4 == -45061)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Account not provisioned";
      v8 = v6;
      v9 = 2;
LABEL_18:
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v5;
      v7 = "ADIOTPRequest failed. ERROR: %d";
      v8 = v6;
      v9 = 8;
      goto LABEL_18;
    }
  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (int)provisionDeviceWithData:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t dsidNumber;
  id v7;
  int v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  AADeviceProvisioningRequest *v15;
  AADeviceProvisioningRequest *v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  _QWORD v31[5];
  NSObject *v32;
  uint8_t *v33;
  uint8_t *v34;
  uint64_t *v35;
  uint8_t v36[8];
  uint8_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t v48[4];
  int v49;
  uint8_t buf[8];
  uint8_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Begin device provisioning.", buf, 2u);
  }

  v46 = 0;
  v47 = 0;
  dsidNumber = self->_dsidNumber;
  v7 = objc_retainAutorelease(v4);
  rsegvyrt87(dsidNumber, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), (uint64_t)&v47, (uint64_t)&v46 + 4, (uint64_t)&v46);
  v9 = v8;
  v10 = v8 == 0;
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "ADIProvisioningStart successful", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v47, HIDWORD(v46));
    v11 = objc_claimAutoreleasedReturnValue();
    +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishProvisioningURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[AADeviceProvisioningRequest initWithDSID:URLString:requestData:]([AADeviceProvisioningRequest alloc], "initWithDSID:URLString:requestData:", self->_dsid, v14, v11);
    v16 = v15;
    if (self->_cookieStorageRef)
      -[AARequest setCookieStorage:](v15, "setCookieStorage:");
    *(_QWORD *)buf = 0;
    v51 = buf;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__5;
    v54 = __Block_byref_object_dispose__5;
    v55 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__5;
    v44 = __Block_byref_object_dispose__5;
    v45 = 0;
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Sending finishProvisioningMachine Request", v36, 2u);
    }

    v18 = dispatch_semaphore_create(0);
    *(_QWORD *)v36 = 0;
    v37 = v36;
    v38 = 0x2020000000;
    v39 = 1;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __55__AADeviceProvisioningSession_provisionDeviceWithData___block_invoke;
    v31[3] = &unk_1E416F240;
    v33 = v36;
    v31[4] = self;
    v34 = buf;
    v35 = &v40;
    v19 = v18;
    v32 = v19;
    -[AARequest performRequestWithHandler:](v16, "performRequestWithHandler:", v31);
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    if (v37[24])
    {
      _AALogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Calling ADIProvisioningEnd", v48, 2u);
      }

      objc_msgSend(objc_retainAutorelease(*((id *)v51 + 5)), "bytes");
      objc_msgSend(*((id *)v51 + 5), "length");
      objc_msgSend(objc_retainAutorelease((id)v41[5]), "bytes");
      objc_msgSend((id)v41[5], "length");
      uv5t6nhkui();
      v22 = v21;
      if (v21)
      {
        _AALogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v48 = 67109120;
          v49 = v22;
          _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "ADIProvisioningEnd failed. ERROR: %d", v48, 8u);
        }

      }
    }
    _AALogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_19EACA000, v24, OS_LOG_TYPE_DEFAULT, "Calling ADIProvisioningSessionDestroy", v48, 2u);
    }

    fy34trz2st();
    v9 = v25;
    if (v25)
    {
      _AALogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v48 = 67109120;
        v49 = v9;
        v27 = "ADIProvisioningSessionDestroy failed. ERROR: %d";
        v28 = v26;
        v29 = 8;
LABEL_26:
        _os_log_impl(&dword_19EACA000, v28, OS_LOG_TYPE_DEFAULT, v27, v48, v29);
      }
    }
    else
    {
      _AALogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v48 = 0;
        v27 = "Device provisioning complete. Huzzah!";
        v28 = v26;
        v29 = 2;
        goto LABEL_26;
      }
    }

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_28;
  }
  if (v12)
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "ADIProvisioningStart failed. ERROR: %d", buf, 8u);
  }
LABEL_28:

  return v9;
}

void __55__AADeviceProvisioningSession_provisionDeviceWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v7;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "finishProvisioningMachine failed. ERROR: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "finishProvisioningMachine succeeded", (uint8_t *)&v23, 2u);
    }

    objc_msgSend(v6, "responseDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("settingInfo"));
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "responseDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transportKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "responseDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("dsId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longLongValue");

    if (v15 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      _AALogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Returned DSID from finishProvisioningMachine doesn't match!", (uint8_t *)&v23, 2u);
      }

    }
    if (v8)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v19 = *(NSObject **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
    }
    else
    {
      _AALogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Didn't get a settingsInfo back from the server", (uint8_t *)&v23, 2u);
      }
    }

    if (v12)
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v22 = *(NSObject **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;
    }
    else
    {
      _AALogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "Didn't get a transportKey back from the server", (uint8_t *)&v23, 2u);
      }
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (int)synchronizeProvisioningWithData:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t dsidNumber;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  AADeviceProvisioningRequest *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  _QWORD v22[5];
  dispatch_semaphore_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[16];
  uint8_t v27[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Begin synchronizing device provisioning.", buf, 2u);
  }

  v25 = 0;
  *(_QWORD *)buf = 0;
  v24 = 0;
  dsidNumber = self->_dsidNumber;
  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  tn46gtiuhw(dsidNumber, v8, v9, (uint64_t)buf, (uint64_t)&v24 + 4, (uint64_t)&v25, (uint64_t)&v24);
  v11 = v10;
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)v27 = 67109120;
      v28 = v11;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "ADISynchronize failed. ERROR: %d", v27, 8u);
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "ADISynchronize successful", v27, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v25, v24);
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = (void *)objc_msgSend(v14, "initWithBytes:length:encoding:", *(_QWORD *)buf, HIDWORD(v24), 0);
    +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "syncMachineURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[AADeviceProvisioningRequest initWithDSID:URLString:requestData:]([AADeviceProvisioningRequest alloc], "initWithDSID:URLString:requestData:", self->_dsid, v17, v12);
    -[AARequest setDeviceProvisioningMachineId:](v18, "setDeviceProvisioningMachineId:", v15);
    if (self->_cookieStorageRef)
      -[AARequest setCookieStorage:](v18, "setCookieStorage:");
    v19 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__AADeviceProvisioningSession_synchronizeProvisioningWithData___block_invoke;
    v22[3] = &unk_1E416F268;
    v22[4] = self;
    v23 = v19;
    v20 = v19;
    -[AARequest performRequestWithHandler:](v18, "performRequestWithHandler:", v22);
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

  }
  return v11;
}

void __63__AADeviceProvisioningSession_synchronizeProvisioningWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v16 = 138412290;
      v17 = v7;
      v10 = "syncMachine failed. ERROR: %@";
      v11 = v8;
      v12 = 12;
LABEL_9:
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v9)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "syncMachine succeeded", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(v6, "responseDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("dsId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longLongValue");

  if (v15 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v10 = "Returned DSID from finishProvisioningMachine doesn't match!";
      v11 = v8;
      v12 = 2;
      goto LABEL_9;
    }
LABEL_10:

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (int)eraseProvisioning
{
  NSObject *v3;
  NSString *dsid;
  void *v5;
  int v6;
  int v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dsid = self->_dsid;
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)&v9[4] = dsid;
    _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Erase device provisioning for dsid:%@", v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", self->_dsid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v9 = 0;
  objc_msgSend(v5, "scanUnsignedLongLong:", v9);
  p435tmhbla();
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
