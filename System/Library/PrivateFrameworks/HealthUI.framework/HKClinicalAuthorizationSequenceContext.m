@implementation HKClinicalAuthorizationSequenceContext

+ (HKClinicalAuthorizationSequenceContext)contextWithHealthStore:(id)a3 request:(id)a4 source:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HKClinicalSourceAuthorizationController *v13;
  void *v14;
  HKClinicalSourceAuthorizationController *v15;
  id v16;
  void *v17;
  void *v18;

  v8 = (objc_class *)MEMORY[0x1E0CB6768];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithHealthStore:", v11);
  v13 = [HKClinicalSourceAuthorizationController alloc];
  objc_msgSend(v10, "typesRequiringReadAuthorization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKClinicalSourceAuthorizationController initWithHealthStore:healthRecordsStore:source:typesRequestedForReading:](v13, "initWithHealthStore:healthRecordsStore:source:typesRequestedForReading:", v11, v12, v9, v14);

  v16 = objc_alloc((Class)a1);
  objc_msgSend(v10, "readUsageDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v16, "initWithHealthStore:healthRecordsStore:authorizationController:readUsageDescription:source:", v11, v12, v15, v17, v9);
  return (HKClinicalAuthorizationSequenceContext *)v18;
}

- (HKClinicalAuthorizationSequenceContext)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4 authorizationController:(id)a5 readUsageDescription:(id)a6 source:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKClinicalAuthorizationSequenceContext *v17;
  HKClinicalAuthorizationSequenceContext *v18;
  uint64_t v19;
  NSString *readUsageDescription;
  uint64_t v21;
  HKSource *source;
  HKClinicalAuthorizationFlowManager *v23;
  HKClinicalAuthorizationFlowManager *authFlowManager;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKClinicalAuthorizationSequenceContext;
  v17 = -[HKClinicalAuthorizationSequenceContext init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_authorizationController, a5);
    v19 = objc_msgSend(v15, "copy");
    readUsageDescription = v18->_readUsageDescription;
    v18->_readUsageDescription = (NSString *)v19;

    v21 = objc_msgSend(v16, "copy");
    source = v18->_source;
    v18->_source = (HKSource *)v21;

    v23 = -[HKClinicalAuthorizationFlowManager initWithHealthStore:healthRecordsStore:]([HKClinicalAuthorizationFlowManager alloc], "initWithHealthStore:healthRecordsStore:", v12, v13);
    authFlowManager = v18->_authFlowManager;
    v18->_authFlowManager = v23;

    objc_storeStrong(&v18->_wrappedFlowManager, v18->_authFlowManager);
  }

  return v18;
}

- (id)createInitialViewControllerWithDelegate:(id)a3
{
  return -[HKClinicalAuthorizationFlowManager createInitialViewControllerWithContext:delegate:](self->_authFlowManager, "createInitialViewControllerWithContext:delegate:", self, a3);
}

- (HKClinicalSourceAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (id)wrappedFlowManager
{
  return self->_wrappedFlowManager;
}

- (NSString)readUsageDescription
{
  return self->_readUsageDescription;
}

- (HKSource)source
{
  return self->_source;
}

- (HKClinicalAuthorizationFlowManager)authFlowManager
{
  return self->_authFlowManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authFlowManager, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_readUsageDescription, 0);
  objc_storeStrong(&self->_wrappedFlowManager, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
}

@end
