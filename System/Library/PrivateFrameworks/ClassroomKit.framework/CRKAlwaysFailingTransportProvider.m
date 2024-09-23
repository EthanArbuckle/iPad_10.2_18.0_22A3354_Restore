@implementation CRKAlwaysFailingTransportProvider

- (CRKAlwaysFailingTransportProvider)initWithError:(id)a3
{
  id v5;
  CRKAlwaysFailingTransportProvider *v6;
  CRKAlwaysFailingTransportProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKAlwaysFailingTransportProvider;
  v6 = -[CRKAlwaysFailingTransportProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mError, a3);

  return v7;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD, NSError *))a3 + 2))(a3, 0, self->mError);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mError, 0);
}

@end
