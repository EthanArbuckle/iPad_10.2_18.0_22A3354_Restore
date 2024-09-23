@implementation IDSPhoneCertificateVendor

- (IDSPhoneCertificateVendor)initWithQueue:(id)a3
{
  NSObject *v4;
  IDSPhoneCertificateVendor *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  IDSDaemonRequestTimer *v9;
  IDSDaemonRequestTimer *daemonRequestTimer;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IDSPhoneCertificateVendor;
  v5 = -[IDSPhoneCertificateVendor init](&v14, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.IDS.IDSPhoneCertificateVendor", v6, v4);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(IDSDaemonRequestTimer);
    daemonRequestTimer = v5->_daemonRequestTimer;
    v5->_daemonRequestTimer = v9;

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "listener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addHandler:", v5);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandler:", self);

  v5.receiver = self;
  v5.super_class = (Class)IDSPhoneCertificateVendor;
  -[IDSPhoneCertificateVendor dealloc](&v5, sel_dealloc);
}

- (void)authenticatePhoneWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190731590;
  v7[3] = &unk_1E2C60820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)generatePhoneAuthenticationSignatureOverData:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1907317CC;
  block[3] = &unk_1E2C61F60;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)requestCarrierTokenWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190731A0C;
  block[3] = &unk_1E2C61F60;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_updateSelfRetentionBasedOnInFlightRequestCount
{
  void *v3;

  -[IDSPhoneCertificateVendor daemonRequestTimer](self, "daemonRequestTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inFlightRequestCount");

  MEMORY[0x1E0DE7D20](self, sel_setStrongSelfReference_);
}

- (BOOL)_isPhoneCertificateVendorSupported
{
  return 1;
}

- (id)_debugDescriptionForErrorCode:(int64_t)a3
{
  if (a3 > -1101)
  {
    switch(a3)
    {
      case -1100:
        return CFSTR("Failed to fetch carrier token");
      case -900:
        return CFSTR("An unknown error occurred");
      case -1000:
        return CFSTR("Failed to fetch local phone authentication certificate");
    }
  }
  else
  {
    switch(a3)
    {
      case -4000:
        return CFSTR("The requested operation is not supported on this platform");
      case -3000:
        return CFSTR("Request timed out waiting for response from daemon");
      case -2000:
        return CFSTR("Failed to generate phone authentication signature");
    }
  }
  return CFSTR("Unknown phone certificate error");
}

- (id)_clientErrorForCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IDSPhoneCertificateVendor _debugDescriptionForErrorCode:](self, "_debugDescriptionForErrorCode:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2938]);
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSPhoneCertificateVendorErrorDomain"), a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)didAuthenticatePhoneWithAuthenticationCertificateData:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IDSPhoneCertificateVendor *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_190731E74;
  v15[3] = &unk_1E2C60C50;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)didGeneratePhoneAuthenticationSignature:(id)a3 nonce:(id)a4 certificates:(id)a5 labelIDs:(id)a6 inputData:(id)a7 requestUUID:(id)a8 error:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  IDSPhoneCertificateVendor *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1907321B4;
  v30[3] = &unk_1E2C623B8;
  v31 = v17;
  v32 = self;
  v33 = v21;
  v34 = v15;
  v35 = v16;
  v36 = v18;
  v37 = v19;
  v38 = v20;
  v23 = v20;
  v24 = v19;
  v25 = v18;
  v26 = v16;
  v27 = v15;
  v28 = v21;
  v29 = v17;
  dispatch_async(v22, v30);

}

- (void)didRequestCarrierTokenString:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IDSPhoneCertificateVendor *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_190732528;
  v15[3] = &unk_1E2C60C50;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (int64_t)_subscriptionSourceFromIntegerValue:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (int64_t)_subscriptionSourceForContext:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "slotID");
  if (result != 2)
    return result == 1;
  return result;
}

- (id)_scheduleTimeoutForPhoneAuthenticationSignatureRequestCompletionBlock:(id)a3
{
  id v4;
  IDSDaemonResponseHandler *v5;
  void *v6;
  void *v7;
  IDSDaemonResponseHandler *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  IDSPhoneCertificateVendor *v17;
  id v18;

  v4 = a3;
  v5 = [IDSDaemonResponseHandler alloc];
  v6 = (void *)MEMORY[0x19400FE1C](v4);
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IDSDaemonResponseHandler initWithBlock:queue:](v5, "initWithBlock:queue:", v6, v7);

  -[IDSPhoneCertificateVendor daemonRequestTimer](self, "daemonRequestTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = sub_190732834;
  v16 = &unk_1E2C60E00;
  v17 = self;
  v18 = v4;
  v10 = v4;
  objc_msgSend(v9, "scheduleTimeoutWithResponseHandler:timeoutInterval:timeoutBlock:", v8, &v13, 20.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSPhoneCertificateVendor _updateSelfRetentionBasedOnInFlightRequestCount](self, "_updateSelfRetentionBasedOnInFlightRequestCount", v13, v14, v15, v16, v17);
  return v11;
}

- (id)_scheduleTimeoutForPhoneAuthenticationCertificateRequestCompletionBlock:(id)a3
{
  id v4;
  IDSDaemonResponseHandler *v5;
  void *v6;
  void *v7;
  IDSDaemonResponseHandler *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  IDSPhoneCertificateVendor *v17;
  id v18;

  v4 = a3;
  v5 = [IDSDaemonResponseHandler alloc];
  v6 = (void *)MEMORY[0x19400FE1C](v4);
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IDSDaemonResponseHandler initWithBlock:queue:](v5, "initWithBlock:queue:", v6, v7);

  -[IDSPhoneCertificateVendor daemonRequestTimer](self, "daemonRequestTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = sub_190732A40;
  v16 = &unk_1E2C60E00;
  v17 = self;
  v18 = v4;
  v10 = v4;
  objc_msgSend(v9, "scheduleTimeoutWithResponseHandler:timeoutInterval:timeoutBlock:", v8, &v13, 360.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSPhoneCertificateVendor _updateSelfRetentionBasedOnInFlightRequestCount](self, "_updateSelfRetentionBasedOnInFlightRequestCount", v13, v14, v15, v16, v17);
  return v11;
}

- (id)_scheduleTimeoutForCarrierTokenCompletionBlock:(id)a3
{
  id v4;
  IDSDaemonResponseHandler *v5;
  void *v6;
  void *v7;
  IDSDaemonResponseHandler *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  IDSPhoneCertificateVendor *v17;
  id v18;

  v4 = a3;
  v5 = [IDSDaemonResponseHandler alloc];
  v6 = (void *)MEMORY[0x19400FE1C](v4);
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IDSDaemonResponseHandler initWithBlock:queue:](v5, "initWithBlock:queue:", v6, v7);

  -[IDSPhoneCertificateVendor daemonRequestTimer](self, "daemonRequestTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = sub_190732C4C;
  v16 = &unk_1E2C60E00;
  v17 = self;
  v18 = v4;
  v10 = v4;
  objc_msgSend(v9, "scheduleTimeoutWithResponseHandler:timeoutInterval:timeoutBlock:", v8, &v13, 360.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSPhoneCertificateVendor _updateSelfRetentionBasedOnInFlightRequestCount](self, "_updateSelfRetentionBasedOnInFlightRequestCount", v13, v14, v15, v16, v17);
  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSPhoneCertificateVendor)strongSelfReference
{
  return self->_strongSelfReference;
}

- (void)setStrongSelfReference:(id)a3
{
  objc_storeStrong((id *)&self->_strongSelfReference, a3);
}

- (IDSDaemonRequestTimer)daemonRequestTimer
{
  return self->_daemonRequestTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonRequestTimer, 0);
  objc_storeStrong((id *)&self->_strongSelfReference, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)requestCarrierTokenWithMessageBody:(id)a3 completion:(id)a4
{
  id v5;
  IDSCarrierTokenRequestParameters *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = -[IDSCarrierTokenRequestParameters initWithSubscriptionSource:IMEI:carrierNonce:]([IDSCarrierTokenRequestParameters alloc], "initWithSubscriptionSource:IMEI:carrierNonce:", 1, CFSTR("TEST_IMEI"), CFSTR("TEST_NONCE"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190732E60;
  v8[3] = &unk_1E2C623E0;
  v9 = v5;
  v7 = v5;
  -[IDSPhoneCertificateVendor requestCarrierTokenWithParameters:completion:](self, "requestCarrierTokenWithParameters:completion:", v6, v8);

}

- (void)setCurrentPhoneUserSubscriptionSource:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190732F84;
  block[3] = &unk_1E2C61830;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)requestCurrentPhoneUserSubscriptionSourceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907331C0;
  v7[3] = &unk_1E2C60820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int64_t)currentPhoneUserSubscriptionSourceWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1E1EB0 != -1)
    dispatch_once(&qword_1EE1E1EB0, &unk_1E2C62400);
  v5 = (void *)qword_1EE1E1EC0;
  if (!qword_1EE1E1EC0)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_1907EA234(v6);

    v5 = (void *)qword_1EE1E1EC0;
  }
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v7, "selectedPhoneNumberRegistrationSubscriptionWithError:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;

  if (v8
    && (v10 = -[IDSPhoneCertificateVendor _subscriptionSourceForContext:](self, "_subscriptionSourceForContext:", v8)) != 0)
  {
    v11 = v10;
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "sms");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v18 = 0;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Unable to determine selected phone user subscription source synchronously {subscriptionSource: %ld, selectedContext: %@, subscriptionError: %@}", buf, 0x20u);
    }

    -[IDSPhoneCertificateVendor _clientErrorForCode:underlyingError:](self, "_clientErrorForCode:underlyingError:", -900, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "sms");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Returning current phone user subscription source synchronously {subscriptionSource: %ld, clientError: %@}", buf, 0x16u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v12);

  return v11;
}

- (id)_scheduleTimeoutForPhoneSubscriptionSourceCompletionBlock:(id)a3
{
  id v4;
  IDSDaemonResponseHandler *v5;
  void *v6;
  void *v7;
  IDSDaemonResponseHandler *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  IDSPhoneCertificateVendor *v17;
  id v18;

  v4 = a3;
  v5 = [IDSDaemonResponseHandler alloc];
  v6 = (void *)MEMORY[0x19400FE1C](v4);
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IDSDaemonResponseHandler initWithBlock:queue:](v5, "initWithBlock:queue:", v6, v7);

  -[IDSPhoneCertificateVendor daemonRequestTimer](self, "daemonRequestTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = sub_190733698;
  v16 = &unk_1E2C60E00;
  v17 = self;
  v18 = v4;
  v10 = v4;
  objc_msgSend(v9, "scheduleTimeoutWithResponseHandler:timeoutInterval:timeoutBlock:", v8, &v13, 360.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSPhoneCertificateVendor _updateSelfRetentionBasedOnInFlightRequestCount](self, "_updateSelfRetentionBasedOnInFlightRequestCount", v13, v14, v15, v16, v17);
  return v11;
}

- (void)didSetPhoneUserSubscriptionSource:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IDSPhoneCertificateVendor *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19073387C;
  v15[3] = &unk_1E2C60C50;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)didFetchPhoneUserSubscriptionSource:(id)a3 requestUUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IDSPhoneCertificateVendor *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IDSPhoneCertificateVendor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_190733AE8;
  v15[3] = &unk_1E2C60C50;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

@end
