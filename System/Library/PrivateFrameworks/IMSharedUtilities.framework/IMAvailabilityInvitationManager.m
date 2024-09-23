@implementation IMAvailabilityInvitationManager

+ (id)sharedInstance
{
  if (qword_1ECFC74B0 != -1)
    dispatch_once(&qword_1ECFC74B0, &unk_1E3FB3268);
  return (id)qword_1ECFC6F40;
}

- (IMAvailabilityInvitationManager)init
{
  IMAvailabilityInvitationManager *v2;
  NSCache *v3;
  NSCache *dateAttemptedInvitationByHandleCache;
  dispatch_queue_t v5;
  OS_dispatch_queue *dndBackgroundQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMAvailabilityInvitationManager;
  v2 = -[IMAvailabilityInvitationManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    dateAttemptedInvitationByHandleCache = v2->_dateAttemptedInvitationByHandleCache;
    v2->_dateAttemptedInvitationByHandleCache = v3;

    v5 = dispatch_queue_create("com.apple.messages.IMAvailabilityInvitationManager.DoNotDisturb", 0);
    dndBackgroundQueue = v2->_dndBackgroundQueue;
    v2->_dndBackgroundQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)attemptIfNeccessaryToAutomaticallyShareFocusStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19E255CE0;
  v14[3] = &unk_1E3FB4CA8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[IMAvailabilityInvitationManager fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:](self, "fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:", v14);

}

- (void)repairSharedFocusStatusFollowingFailedValidationWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19E256604;
  v14[3] = &unk_1E3FB4CA8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[IMAvailabilityInvitationManager fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:](self, "fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:", v14);

}

- (void)manuallyShareFocusStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Received request to manually share focus status with handleID: %@ fromHandleID: %@.", buf, 0x16u);
    }

  }
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode](IMAppleStoreHelper, "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Not manually sharing focus status while in Apple Store Demo mode.", buf, 2u);
      }

    }
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_19E257034;
    v13[3] = &unk_1E3FB4CA8;
    v16 = v10;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    -[IMAvailabilityInvitationManager fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:](self, "fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:", v13);

  }
}

- (void)fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t);

  v5 = (void (**)(id, uint64_t))a3;
  -[IMAvailabilityInvitationManager dndGlobalConfigurationService](self, "dndGlobalConfigurationService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "isCloudSyncActiveWithCompletionHandler:", v5);
  else
    v5[2](v5, objc_msgSend(v4, "isCloudSyncActive"));

}

- (id)dndGlobalConfigurationService
{
  DNDGlobalConfigurationService *cachedDNDGlobalConfigurationService;
  DNDGlobalConfigurationService **p_cachedDNDGlobalConfigurationService;
  DNDGlobalConfigurationService *v4;
  void *v5;
  DNDGlobalConfigurationService *v6;
  NSObject *v7;
  NSObject *v8;

  p_cachedDNDGlobalConfigurationService = &self->_cachedDNDGlobalConfigurationService;
  cachedDNDGlobalConfigurationService = self->_cachedDNDGlobalConfigurationService;
  if (cachedDNDGlobalConfigurationService)
  {
    v4 = cachedDNDGlobalConfigurationService;
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("DNDGlobalConfigurationService"), CFSTR("DoNotDisturb"));
    if (v5)
    {
      objc_msgSend(v5, "serviceForClientIdentifier:", CFSTR("com.apple.messages"));
      v4 = (DNDGlobalConfigurationService *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_storeStrong((id *)p_cachedDNDGlobalConfigurationService, v4);
        v6 = v4;
      }
      else
      {
        IMLogHandleForCategory("IMAvailabilityInvitationManager");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_19E36B2E8();

      }
    }
    else
    {
      IMLogHandleForCategory("IMAvailabilityInvitationManager");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_19E36B2BC();

      v4 = 0;
    }
  }
  return v4;
}

- (void)manuallyRemoveSharingOfFocusStatusWithHandleID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, _QWORD);
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Received request to manually remove sharing of focus status with handleID: %@", buf, 0xCu);
    }

  }
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode](IMAppleStoreHelper, "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Not manually removing sharing focus status while in Apple Store Demo mode.", buf, 2u);
      }

    }
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_19E257628;
    v10[3] = &unk_1E3FB4D48;
    v12 = v7;
    v10[4] = self;
    v11 = v6;
    -[IMAvailabilityInvitationManager fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:](self, "fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:", v10);

  }
}

- (void)_sharePersonalAvailabilityWithSKHandle:(id)a3 fromSKHandle:(id)a4 allowingInvitationOfRemovedUsers:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  IMAvailabilityInvitationManager *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[IMAvailabilityInvitationManager publishingService](self, "publishingService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_19E2579C0;
  v18[3] = &unk_1E3FB4DC0;
  v14 = v10;
  v19 = v14;
  v15 = v12;
  v25 = a5;
  v23 = v15;
  v20 = self;
  v16 = v11;
  v21 = v16;
  v17 = v13;
  v22 = v17;
  objc_copyWeak(&v24, &location);
  -[IMAvailabilityInvitationManager _invitablityForHandle:fromHandle:completion:](self, "_invitablityForHandle:fromHandle:completion:", v14, v16, v18);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

- (void)_invitablityForHandle:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "handleString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Checking invitability for handle: %@ fromHandle: %@", buf, 0x16u);

    }
  }
  -[IMAvailabilityInvitationManager publishingService](self, "publishingService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19E2581CC;
  v16[3] = &unk_1E3FB4DE8;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "fetchHandleInvitability:fromSenderHandle:completion:", v8, v9, v16);

}

- (void)isFocusStatusSharedWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  -[IMAvailabilityInvitationManager _skHandleForString:](self, "_skHandleForString:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAvailabilityInvitationManager _skHandleForString:](self, "_skHandleForString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAvailabilityInvitationManager _isFocusStatusSharedWithHandle:fromHandle:completion:](self, "_isFocusStatusSharedWithHandle:fromHandle:completion:", v11, v10, v8);
}

- (void)_isFocusStatusSharedWithHandle:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "handleString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Checking (async) if handle is already invited: %@ fromHandle: %@", buf, 0x16u);

    }
  }
  -[IMAvailabilityInvitationManager publishingService](self, "publishingService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_19E2585C4;
  v18[3] = &unk_1E3FB4E10;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "isHandleInvited:fromSenderHandle:completion:", v17, v16, v18);

}

- (void)_invitationPayloadForHandleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *dndBackgroundQueue;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1A1AE7D4C](CFSTR("SKInvitationPayload"), CFSTR("StatusKit"));
  v9 = MEMORY[0x1A1AE7D4C](CFSTR("AKAvailabilityInvitation"), CFSTR("AvailabilityKit"));
  if (v8 && (v10 = (void *)v9) != 0)
  {
    location = 0;
    objc_initWeak(&location, self);
    dndBackgroundQueue = self->_dndBackgroundQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2589C4;
    block[3] = &unk_1E3FB4E38;
    objc_copyWeak(v16, &location);
    v14 = v6;
    v15 = v7;
    v16[1] = v10;
    dispatch_async(dndBackgroundQueue, block);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    IMLogHandleForCategory("IMAvailabilityInvitationManager");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_19E36B4A8();

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (id)_newDNDModeConfigurationService
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("DNDModeConfigurationService"), CFSTR("DoNotDisturb"));
  if (v2)
  {
    objc_msgSend(v2, "serviceForClientIdentifier:", CFSTR("com.apple.messages"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v4 = v3;
      v5 = v4;
    }
    else
    {
      IMLogHandleForCategory("IMAvailabilityInvitationManager");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_19E36B5C0();

      v5 = 0;
    }
  }
  else
  {
    IMLogHandleForCategory("IMAvailabilityInvitationManager");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_19E36B594();
    v5 = 0;
  }

  return v5;
}

- (void)_republishCurrentAvailabilityStatus
{
  NSObject *dndBackgroundQueue;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  dndBackgroundQueue = self->_dndBackgroundQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19E258D28;
  v4[3] = &unk_1E3FB4E60;
  objc_copyWeak(&v5, &location);
  dispatch_async(dndBackgroundQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_dndHandleForHandleID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  if (IMStringIsEmail())
    v4 = 1;
  else
    v4 = 2;
  v5 = objc_alloc_init((Class)MEMORY[0x1A1AE7D4C](CFSTR("DNDMutableContactHandle"), CFSTR("DoNotDisturb")));
  objc_msgSend(v5, "setType:", v4);
  objc_msgSend(v5, "setValue:", v3);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)_invitationCacheKeyForHandleID:(id)a3 fromHandleID:(id)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = &stru_1E3FBBA48;
  if (a3)
    v5 = (const __CFString *)a3;
  else
    v5 = &stru_1E3FBBA48;
  if (a4)
    v4 = (const __CFString *)a4;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"), v5, v4);
}

- (SKStatusPublishingService)publishingService
{
  SKStatusPublishingService *publishingService;
  objc_class *v4;
  id v5;
  SKStatusPublishingService *v6;
  SKStatusPublishingService *v7;

  publishingService = self->_publishingService;
  if (!publishingService)
  {
    v4 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("SKStatusPublishingService"), CFSTR("StatusKit"));
    v5 = *(id *)MEMORY[0x1A1AE7D58]("AKAvailabilityStatusTypeIdentifier", CFSTR("AvailabilityKit"));
    v6 = (SKStatusPublishingService *)objc_msgSend([v4 alloc], "initWithStatusTypeIdentifier:", v5);
    v7 = self->_publishingService;
    self->_publishingService = v6;

    publishingService = self->_publishingService;
  }
  return publishingService;
}

- (id)_skHandleForString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1A1AE7D4C](CFSTR("SKHandle"), CFSTR("StatusKit"))), "initWithString:", v3);

  return v4;
}

- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode](IMAppleStoreHelper, "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Not automatically sharing focus status while in Apple Store Demo mode.", (uint8_t *)&v11, 2u);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (MEMORY[0x1A1AE7CF8](v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Handle \"%@\" is a business ID, not eligible to receive availability subscription invitation.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_15;
    }
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if (MEMORY[0x1A1AE7D1C](v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Handle \"%@\" is a stewie ID, not eligible to receive availability subscription invitation.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchCNContactForHandleWithID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v9);
  if (!v5 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Handle \"%@\" is not in the users contacts, not eligible to receive availability subscription invitation.", (uint8_t *)&v11, 0xCu);
    }

  }
LABEL_17:

  return v5;
}

- (void)setPublishingService:(id)a3
{
  objc_storeStrong((id *)&self->_publishingService, a3);
}

- (NSCache)dateAttemptedInvitationByHandleCache
{
  return self->_dateAttemptedInvitationByHandleCache;
}

- (void)setDateAttemptedInvitationByHandleCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateAttemptedInvitationByHandleCache, a3);
}

- (OS_dispatch_queue)dndBackgroundQueue
{
  return self->_dndBackgroundQueue;
}

- (void)setDndBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dndBackgroundQueue, a3);
}

- (DNDGlobalConfigurationService)cachedDNDGlobalConfigurationService
{
  return self->_cachedDNDGlobalConfigurationService;
}

- (void)setCachedDNDGlobalConfigurationService:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDNDGlobalConfigurationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDNDGlobalConfigurationService, 0);
  objc_storeStrong((id *)&self->_dndBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_dateAttemptedInvitationByHandleCache, 0);
  objc_storeStrong((id *)&self->_publishingService, 0);
}

@end
