@implementation IMDAvailabilityVerificationManager

+ (id)sharedInstance
{
  if (qword_1ED935EB8 != -1)
    dispatch_once(&qword_1ED935EB8, &unk_1E9229518);
  return (id)qword_1ED936120;
}

- (IMDAvailabilityVerificationManager)init
{
  IMDAvailabilityVerificationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateWorkQueue;
  NSCache *v6;
  NSCache *subscriptionValidationTokenByHandleIDCache;
  void *v8;
  uint64_t v9;
  SKStatusSubscriptionService *availabilitySubscriptionService;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMDAvailabilityVerificationManager;
  v2 = -[IMDAvailabilityVerificationManager init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.Messages.IMDAvailabilityVerificationManager", v3);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    subscriptionValidationTokenByHandleIDCache = v2->_subscriptionValidationTokenByHandleIDCache;
    v2->_subscriptionValidationTokenByHandleIDCache = v6;

    objc_msgSend((id)objc_opt_class(), "availabilityStatusTypeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKStatusSubscriptionService"), CFSTR("StatusKit"))), "initWithStatusTypeIdentifier:", v8);
    availabilitySubscriptionService = v2->_availabilitySubscriptionService;
    v2->_availabilitySubscriptionService = (SKStatusSubscriptionService *)v9;

    -[SKStatusSubscriptionService addDelegate:queue:](v2->_availabilitySubscriptionService, "addDelegate:queue:", v2, v2->_privateWorkQueue);
  }
  return v2;
}

+ (id)availabilityStatusTypeIdentifier
{
  return *(id *)MEMORY[0x1D17EA3F8]("AKAvailabilityStatusTypeIdentifier", CFSTR("AvailabilityKit"));
}

- (id)cachedAvailabilityVerificationTokensForHandleID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSCache objectForKey:](self->_subscriptionValidationTokenByHandleIDCache, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 138412546;
        v11 = v6;
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Using cached availability verification tokens %@ for message to handleID \"%@\", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D16666E0();

    -[IMDAvailabilityVerificationManager populateCacheWithAvailabilityVerificationTokensForHandleID:](self, "populateCacheWithAvailabilityVerificationTokensForHandleID:", v4);
  }

  return v6;
}

- (void)populateCacheWithAvailabilityVerificationTokensForHandleID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  SKStatusSubscriptionService *availabilitySubscriptionService;
  _QWORD *v11;
  NSObject *v12;
  SKStatusSubscriptionService *v13;
  _QWORD v14[6];
  _QWORD v15[6];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSCache objectForKey:](self->_subscriptionValidationTokenByHandleIDCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMOSLoggingEnabled(v5);
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Subscription validation tokens %@ is already cached for handleID: \"%@\". Not fetching again", buf, 0x16u);
      }

    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Fetching subscription validation token for handle handleID: %@", buf, 0xCu);
      }

    }
    v9 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKHandle"), CFSTR("StatusKit"))), "initWithString:", v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      availabilitySubscriptionService = self->_availabilitySubscriptionService;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1D1468504;
      v15[3] = &unk_1E9229540;
      v11 = v15;
      v15[4] = v4;
      v15[5] = self;
      -[SKStatusSubscriptionService subscriptionValidationTokensForHandle:completion:](availabilitySubscriptionService, "subscriptionValidationTokensForHandle:completion:", v9, v15);
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1D166670C();

      v13 = self->_availabilitySubscriptionService;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_1D14686A4;
      v14[3] = &unk_1E9229568;
      v11 = v14;
      v14[4] = v4;
      v14[5] = self;
      -[SKStatusSubscriptionService subscriptionValidationTokenForHandle:completion:](v13, "subscriptionValidationTokenForHandle:completion:", v9, v14);
    }

  }
}

+ (BOOL)deviceSupportsSubscriptionValidationTokens
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(a1))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "This device will validate subscription validation tokens", v4, 2u);
    }

  }
  return 1;
}

- (void)verifyPersonalSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 receivedByHandleID:(id)a5 fromHandleID:(id)a6 messageDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _BYTE buf[12];
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Received request to validate validation token \"%@\" from senderHandleID \"%@\", buf, 0x16u);
    }

  }
  v18 = objc_msgSend((id)objc_opt_class(), "deviceSupportsSubscriptionValidationTokens");
  if ((v18 & 1) != 0)
  {
    v19 = objc_msgSend(v16, "timeIntervalSinceNow");
    if (fabs(v20) <= 300.0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        IMLogHandleForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1D1666810();
        goto LABEL_19;
      }
      v22 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKHandle"), CFSTR("StatusKit"))), "initWithString:", v15);
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = sub_1D1468C38;
      v23[3] = &unk_1E9229590;
      objc_copyWeak(&v27, (id *)buf);
      v24 = v12;
      v25 = v15;
      v26 = v14;
      -[IMDAvailabilityVerificationManager _validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:encryptionValidationToken:fromSender:completion:](self, "_validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:encryptionValidationToken:fromSender:completion:", v24, v13, v22, v23);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);

    }
    else if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v12;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Not processing validation token \"%@\" for old message from %@ with date: %@", buf, 0x20u);
      }
LABEL_19:

    }
  }
  else if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Skipping validation, this device should not validate tokens", buf, 2u);
    }
    goto LABEL_19;
  }

}

- (void)_validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 fromSender:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKSubscriptionValidationTokens"), CFSTR("StatusKit"))), "initWithSubscriptionValidationToken:encryptionValidationToken:", v14, v10);
    -[SKStatusSubscriptionService validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:fromSender:completion:](self->_availabilitySubscriptionService, "validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:fromSender:completion:", v13, v11, v12);

  }
  else
  {
    -[SKStatusSubscriptionService validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:fromSender:completion:](self->_availabilitySubscriptionService, "validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:fromSender:completion:", v14, v11, v12);
  }

}

- (void)_inviteSenderHandleID:(id)a3 fromHandleID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D396E8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repairSharedFocusStatusFollowingFailedValidationWithHandleID:fromHandleID:completion:", v7, v6, &unk_1E92295D0);

}

- (void)subscriptionInvitationReceived:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Subscription invitation received, clearing cache. Subscription: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[NSCache removeAllObjects](self->_subscriptionValidationTokenByHandleIDCache, "removeAllObjects");

}

- (void)subscriptionReceivedStatusUpdate:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Subscription received status update, no verification manager action required. Subscription: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)subscriptionStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Subscription state changed, clearing cache. Subscription: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[NSCache removeAllObjects](self->_subscriptionValidationTokenByHandleIDCache, "removeAllObjects");

}

- (void)subscriptionServiceDaemonDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Subscription service daemon disconnected, clearing cache, but not reconnecting.", v6, 2u);
    }

  }
  -[NSCache removeAllObjects](self->_subscriptionValidationTokenByHandleIDCache, "removeAllObjects");

}

- (SKStatusSubscriptionService)availabilitySubscriptionService
{
  return self->_availabilitySubscriptionService;
}

- (void)setAvailabilitySubscriptionService:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySubscriptionService, a3);
}

- (NSCache)subscriptionValidationTokenByHandleIDCache
{
  return self->_subscriptionValidationTokenByHandleIDCache;
}

- (void)setSubscriptionValidationTokenByHandleIDCache:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionValidationTokenByHandleIDCache, a3);
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionValidationTokenByHandleIDCache, 0);
  objc_storeStrong((id *)&self->_availabilitySubscriptionService, 0);
}

@end
