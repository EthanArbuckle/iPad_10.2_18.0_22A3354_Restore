@implementation CIDVUIProofingFlowManager

- (CIDVUIProofingFlowManager)initWithDelegate:(id)a3
{
  id v4;
  CIDVUIProofingFlowManager *v5;
  _TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CIDVUIProofingFlowManager;
  v5 = -[CIDVUIProofingFlowManager init](&v8, sel_init);
  if (v5)
  {
    v6 = -[CIDVUIInternalProofingFlowManager initWithDelegate:externalProofingFlowManager:]([_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager alloc], "initWithDelegate:externalProofingFlowManager:", v4, v5);
    -[CIDVUIProofingFlowManager setProofingFlowManager:](v5, "setProofingFlowManager:", v6);

  }
  return v5;
}

- (unint64_t)currentProofingEligibilityStatus
{
  void *v2;
  unint64_t v3;

  -[CIDVUIProofingFlowManager proofingFlowManager](self, "proofingFlowManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "proofingEligibilityStatus");

  return v3;
}

- (void)startProofing:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CIDVUIProofingFlowManager proofingFlowManager](self, "proofingFlowManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startProofingWithConfiguration:completionHandler:", v7, v6);

}

- (id)proofingFlowViewController
{
  void *v2;
  void *v3;

  -[CIDVUIProofingFlowManager proofingFlowManager](self, "proofingFlowManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proofingFlowViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)proofingFlowAvailability:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CIDVUIProofingFlowManager proofingFlowManager](self, "proofingFlowManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proofingFlowAvailabilityWithCompletionHandler:", v4);

}

- (void)proofingStatus:(id)a3 country:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CIDVUIProofingFlowManager proofingFlowManager](self, "proofingFlowManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "proofingStatusFor:country:completionHandler:", v10, v9, v8);

}

- (_TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager)proofingFlowManager
{
  return self->_proofingFlowManager;
}

- (void)setProofingFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_proofingFlowManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proofingFlowManager, 0);
}

@end
