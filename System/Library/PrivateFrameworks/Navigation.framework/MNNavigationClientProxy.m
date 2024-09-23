@implementation MNNavigationClientProxy

- (MNNavigationClientProxy)init
{
  MNNavigationClientProxy *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  GEOApplicationAuditToken *auditToken;
  MNNavigationClientProxy *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MNNavigationClientProxy;
  v2 = -[MNNavigationClientProxy init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D26EF8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithProxiedApplicationBundleId:", v5);
    auditToken = v2->_auditToken;
    v2->_auditToken = (GEOApplicationAuditToken *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)requestDirections:(id)a3 withIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOApplicationAuditToken *v11;
  GEOApplicationAuditToken *auditToken;
  GEOApplicationAuditToken *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "auditToken");
  v11 = (GEOApplicationAuditToken *)objc_claimAutoreleasedReturnValue();
  auditToken = v11;
  if (!v11)
    auditToken = self->_auditToken;
  v13 = auditToken;

  -[MNNavigationClientProxy _directionsRequestManager](self, "_directionsRequestManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestDirections:withIdentifier:auditToken:finishedHandler:", v10, v9, v13, v8);

}

- (void)cancelDirectionsRequestWithIdentifier:(id)a3
{
  -[MNDirectionsRequestManager cancelDirectionsRequestWithIdentifier:](self->_directionsRequestManager, "cancelDirectionsRequestWithIdentifier:", a3);
}

- (id)_directionsRequestManager
{
  MNDirectionsRequestManager *directionsRequestManager;
  MNDirectionsRequestManager *v4;
  MNDirectionsRequestManager *v5;

  directionsRequestManager = self->_directionsRequestManager;
  if (!directionsRequestManager)
  {
    v4 = objc_alloc_init(MNDirectionsRequestManager);
    v5 = self->_directionsRequestManager;
    self->_directionsRequestManager = v4;

    directionsRequestManager = self->_directionsRequestManager;
  }
  return directionsRequestManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsRequestManager, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
