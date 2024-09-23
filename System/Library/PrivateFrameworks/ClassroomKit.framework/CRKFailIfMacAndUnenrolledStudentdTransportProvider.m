@implementation CRKFailIfMacAndUnenrolledStudentdTransportProvider

- (CRKFailIfMacAndUnenrolledStudentdTransportProvider)initWithTransportProvider:(id)a3 featureDataStore:(id)a4
{
  id v7;
  id v8;
  CRKFailIfMacAndUnenrolledStudentdTransportProvider *v9;
  CRKFailIfMacAndUnenrolledStudentdTransportProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKFailIfMacAndUnenrolledStudentdTransportProvider;
  v9 = -[CRKFailIfMacAndUnenrolledStudentdTransportProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_underlyingTransportProvider, a3);
    objc_storeStrong((id *)&v10->_featureDataStore, a4);
  }

  return v10;
}

- (CRKFailIfMacAndUnenrolledStudentdTransportProvider)initWithTransportProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRKFailIfMacAndUnenrolledStudentdTransportProvider *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "makeFeatureDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CRKFailIfMacAndUnenrolledStudentdTransportProvider initWithTransportProvider:featureDataStore:](self, "initWithTransportProvider:featureDataStore:", v4, v6);
  return v7;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKFailIfMacAndUnenrolledStudentdTransportProvider underlyingTransportProvider](self, "underlyingTransportProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchTransportWithCompletion:", v4);

}

- (CRKTransportProviding)underlyingTransportProvider
{
  return self->_underlyingTransportProvider;
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDataStore, 0);
  objc_storeStrong((id *)&self->_underlyingTransportProvider, 0);
}

@end
