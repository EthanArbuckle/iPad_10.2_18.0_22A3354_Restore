@implementation CMContinuityCaptureCenterStageStateRestorationData

- (CMContinuityCaptureCenterStageStateRestorationData)initWithPreferencesDomain:(id)a3
{
  id v5;
  CMContinuityCaptureCenterStageStateRestorationData *v6;
  CMContinuityCaptureCenterStageStateRestorationData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMContinuityCaptureCenterStageStateRestorationData;
  v6 = -[CMContinuityCaptureCenterStageStateRestorationData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preferencesDomain, a3);

  return v7;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("preferencesDomain: %@"), self->_preferencesDomain);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureCenterStageStateRestorationData debugDescription](self, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)preferencesDomain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesDomain, 0);
}

@end
