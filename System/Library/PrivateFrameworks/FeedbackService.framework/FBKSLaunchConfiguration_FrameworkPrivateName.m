@implementation FBKSLaunchConfiguration_FrameworkPrivateName

- (void)setToSkipPrompt:(BOOL)a3
{
  sub_23B44E218((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_skipsPrompt);
}

- (void)setAlwaysLaunchInRemoteAlert:(BOOL)a3
{
  sub_23B44E218((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_alwaysLaunchInRemoteAlert);
}

- (void)setNotifyImmediately:(BOOL)a3
{
  sub_23B44E218((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_notifyImmediately);
}

- (NSData)asJSON
{
  FBKSLaunchConfiguration_FrameworkPrivateName *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = FBKSLaunchConfiguration.asJSON.getter();
  v5 = v4;

  v6 = (void *)sub_23B483338();
  sub_23B43ED7C(v3, v5);
  return (NSData *)v6;
}

+ (id)fromJSONWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = a3;
  v4 = sub_23B483344();
  v6 = v5;

  v7 = (void *)_s15FeedbackService23FBKSLaunchConfigurationC8fromJSON4dataACSg10Foundation4DataV_tFZ_0();
  sub_23B43ED7C(v4, v6);
  return v7;
}

- (int64_t)promptStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setPromptStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)localizedPromptTitle
{
  return (NSString *)sub_23B455614((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle);
}

- (void)setLocalizedPromptTitle:(id)a3
{
  sub_23B4556F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle);
}

- (NSString)localizedPromptMessage
{
  return (NSString *)sub_23B455614((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage);
}

- (void)setLocalizedPromptMessage:(id)a3
{
  sub_23B4556F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage);
}

- (NSString)localizedAlertViewProceedButtonTitle
{
  return (NSString *)sub_23B455614((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle);
}

- (void)setLocalizedAlertViewProceedButtonTitle:(id)a3
{
  sub_23B4556F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle);
}

- (NSString)localizedAlertViewDeclineButtonTitle
{
  return (NSString *)sub_23B455614((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle);
}

- (void)setLocalizedAlertViewDeclineButtonTitle:(id)a3
{
  sub_23B4556F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle);
}

- (FBKSLaunchConfiguration_FrameworkPrivateName)init
{
  return (FBKSLaunchConfiguration_FrameworkPrivateName *)FBKSLaunchConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
