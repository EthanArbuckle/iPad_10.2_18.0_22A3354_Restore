@implementation APRemoteApprovalPasswordEntryMetricsEvent

- (APRemoteApprovalPasswordEntryMetricsEvent)init
{
  APRemoteApprovalPasswordEntryMetricsEvent *v2;
  APRemoteApprovalPasswordEntryMetricsEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APRemoteApprovalPasswordEntryMetricsEvent;
  v2 = -[APRemoteApprovalPasswordEntryMetricsEvent initWithTopic:](&v5, sel_initWithTopic_, CFSTR("xp_amp_payments"));
  v3 = v2;
  if (v2)
  {
    -[APRemoteApprovalPasswordEntryMetricsEvent setEventVersion:](v2, "setEventVersion:", &unk_24DB1D768);
    -[APRemoteApprovalPasswordEntryMetricsEvent setProperty:forBodyKey:](v3, "setProperty:forBodyKey:", CFSTR("OkCancel"), CFSTR("dialogType"));
    -[APRemoteApprovalPasswordEntryMetricsEvent setProperty:forBodyKey:](v3, "setProperty:forBodyKey:", CFSTR("Sign in to Approve"), CFSTR("title"));
    -[APRemoteApprovalPasswordEntryMetricsEvent setProperty:forBodyKey:](v3, "setProperty:forBodyKey:", &unk_24DB1D790, CFSTR("options"));
  }
  return v3;
}

@end
