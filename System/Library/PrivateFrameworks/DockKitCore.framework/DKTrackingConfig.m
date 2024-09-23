@implementation DKTrackingConfig

- (DKTrackingConfig)initWithClientApplicationID:(id)a3 customInferenceEnabled:(id)a4
{
  id v7;
  id v8;
  DKTrackingConfig *v9;
  DKTrackingConfig *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKTrackingConfig;
  v9 = -[DKTrackingConfig init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientApplicationID, a3);
    v10->_customInferenceEnabled = v8 != 0;
  }

  return v10;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)customInferenceEnabled
{
  return self->_customInferenceEnabled;
}

- (void)setCustomInferenceEnabled:(BOOL)a3
{
  self->_customInferenceEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientApplicationID, 0);
}

@end
