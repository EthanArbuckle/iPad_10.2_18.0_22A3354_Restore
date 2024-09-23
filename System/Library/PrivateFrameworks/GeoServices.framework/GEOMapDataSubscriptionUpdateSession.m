@implementation GEOMapDataSubscriptionUpdateSession

- (GEOMapDataSubscriptionUpdateSession)initWithSubscriptions:(id)a3 downloadMode:(unint64_t)a4 updateType:(int64_t)a5 auditToken:(id)a6 backgroundTask:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  GEOMapDataSubscriptionUpdateSession *v10;
  GEOMapDataSubscriptionUpdateSession *v11;
  GEOMapDataSubscriptionUpdateSession *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GEOMapDataSubscriptionUpdateSession;
  v10 = -[GEOMapDataSubscriptionDownloadGroup initWithSubscriptions:downloadMode:auditToken:backgroundTask:delegate:delegateQueue:](&v14, sel_initWithSubscriptions_downloadMode_auditToken_backgroundTask_delegate_delegateQueue_, a3, a4, a6, a7, a8, a9);
  v11 = v10;
  if (v10)
  {
    v10->_updateType = a5;
    v12 = v10;
  }

  return v11;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (NSDictionary)offlineDataVersions
{
  return self->_offlineDataVersions;
}

- (void)setOfflineDataVersions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDataVersions, 0);
}

@end
