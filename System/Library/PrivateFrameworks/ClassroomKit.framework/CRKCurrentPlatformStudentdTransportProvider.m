@implementation CRKCurrentPlatformStudentdTransportProvider

- (CRKCurrentPlatformStudentdTransportProvider)init
{
  CRKCurrentPlatformStudentdTransportProvider *v2;
  CRKCurrentPlatformStudentdTransportProvider *v3;
  uint64_t v4;
  CRKTransportProviding *mBaseProvider;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKCurrentPlatformStudentdTransportProvider;
  v2 = -[CRKCurrentPlatformStudentdTransportProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRKCurrentPlatformStudentdTransportProvider makeProviderForCurrentPlatform](v2, "makeProviderForCurrentPlatform");
    v4 = objc_claimAutoreleasedReturnValue();
    mBaseProvider = v3->mBaseProvider;
    v3->mBaseProvider = (CRKTransportProviding *)v4;

  }
  return v3;
}

- (id)makeProviderForCurrentPlatform
{
  return (id)objc_opt_new();
}

- (void)fetchTransportWithCompletion:(id)a3
{
  -[CRKTransportProviding fetchTransportWithCompletion:](self->mBaseProvider, "fetchTransportWithCompletion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBaseProvider, 0);
}

@end
