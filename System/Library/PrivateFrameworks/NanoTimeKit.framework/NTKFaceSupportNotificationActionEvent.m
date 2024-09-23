@implementation NTKFaceSupportNotificationActionEvent

- (NTKFaceSupportNotificationActionEvent)initWithBundleIdentifier:(id)a3 action:(int64_t)a4 delayFromPresentation:(double)a5
{
  id v8;
  uint64_t v9;
  NTKFaceSupportNotificationActionEvent *v12;
  NTKFaceSupportNotificationActionEvent *v13;
  NTKFaceSupportNotificationActionEvent *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  objc_super v18;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (a5 <= 0.0 || (unint64_t)(a4 - 4) < 0xFFFFFFFFFFFFFFFDLL || v9 == 0)
  {
    v12 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKFaceSupportNotificationActionEvent;
    v13 = -[NTKFaceSupportNotificationActionEvent init](&v18, sel_init);
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v8, "copy");
      bundleIdentifier = v14->_bundleIdentifier;
      v14->_bundleIdentifier = (NSString *)v15;

      v14->_action = a4;
      v14->_delayFromPresentation = a5;
    }
    self = v14;
    v12 = self;
  }

  return v12;
}

- (NSString)ntkfs_analyticsEventName
{
  return (NSString *)CFSTR("com.apple.nanotimekit.facesupport.notification_action");
}

- (NSDictionary)ntkfs_analyticsJSONRepresentation
{
  void *v3;
  int64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[NTKFaceSupportNotificationActionEvent bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKFaceSupportNotificationActionEvent action](self, "action");
  -[NTKFaceSupportNotificationActionEvent delayFromPresentation](self, "delayFromPresentation");
  v6 = v5;
  v12[0] = v3;
  v11[0] = CFSTR("bundle_identifier");
  v11[1] = CFSTR("action_invoked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("delay_from_presentation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)action
{
  return self->_action;
}

- (double)delayFromPresentation
{
  return self->_delayFromPresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
