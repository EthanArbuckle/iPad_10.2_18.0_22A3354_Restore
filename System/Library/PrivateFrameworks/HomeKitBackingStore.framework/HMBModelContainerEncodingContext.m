@implementation HMBModelContainerEncodingContext

- (HMBModelContainerEncodingContext)initWithModelContainer:(id)a3
{
  id v5;
  void *v6;
  HMBModelContainerEncodingContext *v7;
  HMBModelContainerEncodingContext *v8;
  HMBModelContainerEncodingContext *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMBModelContainerEncodingContext;
    v7 = -[HMBModelContainerEncodingContext init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_modelContainer, a3);

    return v8;
  }
  else
  {
    v10 = (HMBModelContainerEncodingContext *)_HMFPreconditionFailure();
    return (HMBModelContainerEncodingContext *)-[HMBModelContainerEncodingContext modelContainer](v10, v11);
  }
}

- (HMBModelContainer)modelContainer
{
  return (HMBModelContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelContainer, 0);
}

@end
