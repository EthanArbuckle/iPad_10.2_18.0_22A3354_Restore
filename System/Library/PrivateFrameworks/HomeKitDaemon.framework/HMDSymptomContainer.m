@implementation HMDSymptomContainer

- (HMDSymptomContainer)initWithIDSIdentifier:(id)a3
{
  id v5;
  void *v6;
  HMDSymptomContainer *v7;
  HMDSymptomContainer *v8;
  HMDSymptomContainer *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDSymptomContainer;
    v7 = -[HMDSymptomContainer init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_idsIdentifier, a3);

    return v8;
  }
  else
  {
    v10 = (HMDSymptomContainer *)_HMFPreconditionFailure();
    return (HMDSymptomContainer *)-[HMDSymptomContainer idsIdentifier](v10, v11);
  }
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (HMDAccessorySymptomsDelegate)delegate
{
  return (HMDAccessorySymptomsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)symptoms
{
  return self->_symptoms;
}

- (void)setSymptoms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptoms, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end
