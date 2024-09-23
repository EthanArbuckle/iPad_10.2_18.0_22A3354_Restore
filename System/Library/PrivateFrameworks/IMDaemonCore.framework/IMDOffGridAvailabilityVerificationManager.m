@implementation IMDOffGridAvailabilityVerificationManager

+ (id)sharedInstance
{
  if (qword_1ED935ED0 != -1)
    dispatch_once(&qword_1ED935ED0, &unk_1E922ADB8);
  return (id)qword_1ED936128;
}

- (IMDOffGridAvailabilityVerificationManager)init
{
  IMDOffGridAvailabilityVerificationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateWorkQueue;
  uint64_t v6;
  SKStatusSubscriptionService *offGridAvailabilitySubscriptionService;
  NSCache *v8;
  NSCache *subscriptionValidationTokenByHandleIDCache;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMDOffGridAvailabilityVerificationManager;
  v2 = -[IMDOffGridAvailabilityVerificationManager init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.Messages.IMDOffGridAvailabilityVerificationManager", v3);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKStatusSubscriptionService"), CFSTR("StatusKit"))), "initWithStatusTypeIdentifier:", CFSTR("com.apple.offgrid.status"));
    offGridAvailabilitySubscriptionService = v2->_offGridAvailabilitySubscriptionService;
    v2->_offGridAvailabilitySubscriptionService = (SKStatusSubscriptionService *)v6;

    -[SKStatusSubscriptionService addDelegate:queue:](v2->_offGridAvailabilitySubscriptionService, "addDelegate:queue:", v2, v2->_privateWorkQueue);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    subscriptionValidationTokenByHandleIDCache = v2->_subscriptionValidationTokenByHandleIDCache;
    v2->_subscriptionValidationTokenByHandleIDCache = v8;

  }
  return v2;
}

- (void)populateCacheForHandleID:(id)a3
{
  id v4;
  void *v5;
  SKStatusSubscriptionService *offGridAvailabilitySubscriptionService;
  id v7;
  _QWORD v8[4];
  id v9;
  IMDOffGridAvailabilityVerificationManager *v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKHandle"), CFSTR("StatusKit"))), "initWithString:", v4);
  offGridAvailabilitySubscriptionService = self->_offGridAvailabilitySubscriptionService;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D14AE924;
  v8[3] = &unk_1E9229540;
  v9 = v4;
  v10 = self;
  v7 = v4;
  -[SKStatusSubscriptionService subscriptionValidationTokensForHandle:completion:](offGridAvailabilitySubscriptionService, "subscriptionValidationTokensForHandle:completion:", v5, v8);

}

- (id)cachedAvailabilityTokensForHandleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[NSCache objectForKey:](self->_subscriptionValidationTokenByHandleIDCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1D16680CC((uint64_t)v4, v6);

    -[IMDOffGridAvailabilityVerificationManager populateCacheForHandleID:](self, "populateCacheForHandleID:", v4);
  }

  return v5;
}

- (void)verifyOffGridSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 receivedByHandleID:(id)a5 fromHandleID:(id)a6 messageDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  SKStatusSubscriptionService *offGridAvailabilitySubscriptionService;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKHandle"), CFSTR("StatusKit"))), "initWithString:", v12);
  v16 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1D17EA3EC](CFSTR("SKSubscriptionValidationTokens"), CFSTR("StatusKit"))), "initWithSubscriptionValidationToken:encryptionValidationToken:", v14, v13);

  offGridAvailabilitySubscriptionService = self->_offGridAvailabilitySubscriptionService;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D14AEBCC;
  v20[3] = &unk_1E922AE20;
  v21 = v12;
  v22 = v11;
  v18 = v11;
  v19 = v12;
  -[SKStatusSubscriptionService validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:fromSender:completion:](offGridAvailabilitySubscriptionService, "validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:fromSender:completion:", v16, v15, v20);

}

- (void)subscriptionInvitationReceived:(id)a3
{
  -[NSCache removeAllObjects](self->_subscriptionValidationTokenByHandleIDCache, "removeAllObjects", a3);
}

- (void)subscriptionStateChanged:(id)a3
{
  -[NSCache removeAllObjects](self->_subscriptionValidationTokenByHandleIDCache, "removeAllObjects", a3);
}

- (void)subscriptionServiceDaemonDisconnected:(id)a3
{
  -[NSCache removeAllObjects](self->_subscriptionValidationTokenByHandleIDCache, "removeAllObjects", a3);
}

- (SKStatusSubscriptionService)offGridAvailabilitySubscriptionService
{
  return self->_offGridAvailabilitySubscriptionService;
}

- (void)setOffGridAvailabilitySubscriptionService:(id)a3
{
  objc_storeStrong((id *)&self->_offGridAvailabilitySubscriptionService, a3);
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (NSCache)subscriptionValidationTokenByHandleIDCache
{
  return self->_subscriptionValidationTokenByHandleIDCache;
}

- (void)setSubscriptionValidationTokenByHandleIDCache:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionValidationTokenByHandleIDCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionValidationTokenByHandleIDCache, 0);
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_offGridAvailabilitySubscriptionService, 0);
}

@end
