@implementation CIDVUIIdentityProofingDataSharingFlowManager

- (CIDVUIIdentityProofingDataSharingFlowManager)init
{
  CIDVUIIdentityProofingDataSharingFlowManager *v2;
  _TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIDVUIIdentityProofingDataSharingFlowManager;
  v2 = -[CIDVUIIdentityProofingDataSharingFlowManager init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager);
    -[CIDVUIIdentityProofingDataSharingFlowManager setDataSharingManager:](v2, "setDataSharingManager:", v3);

  }
  return v2;
}

- (void)checkUserConsent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIIdentityProofingDataSharingFlowManager dataSharingManager](self, "dataSharingManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkUserConsentWithCompletionHandler:", v4);

}

- (void)fetchUserConsent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIIdentityProofingDataSharingFlowManager dataSharingManager](self, "dataSharingManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchUserConsentWithCompletionHandler:", v4);

}

- (void)didChangeUserConsent:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CIDVUIIdentityProofingDataSharingFlowManager dataSharingManager](self, "dataSharingManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didChangeUserConsent:completion:", a3, v6);

}

- (_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager)dataSharingManager
{
  return self->_dataSharingManager;
}

- (void)setDataSharingManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSharingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSharingManager, 0);
}

@end
