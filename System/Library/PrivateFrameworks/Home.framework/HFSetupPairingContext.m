@implementation HFSetupPairingContext

- (HFSetupPairingContext)initWithSetupAccessoryDescription:(id)a3 isTrustedOrigin:(BOOL)a4
{
  id v8;
  HFSetupPairingContext *v9;
  HFSetupPairingContext *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupPairingContext.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setupAccessoryDescription"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HFSetupPairingContext;
  v9 = -[HFSetupPairingContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_setupAccessoryDescription, a3);
    v10->_isTrustedOrigin = a4;
  }

  return v10;
}

- (HFSetupPairingContext)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSetupAccessoryDescription_isTrustedOrigin_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupPairingContext.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSetupPairingContext init]",
    v5);

  return 0;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void)setSetupAccessoryDescription:(id)a3
{
  objc_storeStrong((id *)&self->_setupAccessoryDescription, a3);
}

- (BOOL)isTrustedOrigin
{
  return self->_isTrustedOrigin;
}

- (void)setIsTrustedOrigin:(BOOL)a3
{
  self->_isTrustedOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
}

@end
