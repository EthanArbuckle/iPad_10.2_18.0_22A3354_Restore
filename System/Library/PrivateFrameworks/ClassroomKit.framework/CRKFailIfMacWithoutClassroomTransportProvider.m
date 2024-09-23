@implementation CRKFailIfMacWithoutClassroomTransportProvider

- (CRKFailIfMacWithoutClassroomTransportProvider)initWithTransportProvider:(id)a3
{
  id v5;
  CRKFailIfMacWithoutClassroomTransportProvider *v6;
  CRKFailIfMacWithoutClassroomTransportProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFailIfMacWithoutClassroomTransportProvider;
  v6 = -[CRKFailIfMacWithoutClassroomTransportProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mBaseProvider, a3);

  return v7;
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
