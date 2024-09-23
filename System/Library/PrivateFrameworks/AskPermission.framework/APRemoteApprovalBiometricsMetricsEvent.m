@implementation APRemoteApprovalBiometricsMetricsEvent

- (APRemoteApprovalBiometricsMetricsEvent)init
{
  APRemoteApprovalBiometricsMetricsEvent *v2;
  APRemoteApprovalBiometricsMetricsEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APRemoteApprovalBiometricsMetricsEvent;
  v2 = -[APRemoteApprovalBiometricsMetricsEvent initWithTopic:](&v5, sel_initWithTopic_, CFSTR("xp_amp_payments"));
  v3 = v2;
  if (v2)
  {
    -[APRemoteApprovalBiometricsMetricsEvent setEventVersion:](v2, "setEventVersion:", &unk_24DB1D750);
    -[APRemoteApprovalBiometricsMetricsEvent setProperty:forBodyKey:](v3, "setProperty:forBodyKey:", CFSTR("biometricsAnalyze"), CFSTR("actionType"));
    -[APRemoteApprovalBiometricsMetricsEvent setProperty:forBodyKey:](v3, "setProperty:forBodyKey:", CFSTR("SignIn"), CFSTR("dialogType"));
  }
  return v3;
}

@end
