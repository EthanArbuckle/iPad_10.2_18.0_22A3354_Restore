@implementation GCReplayNotificationOptions

- (id)initRecordingStart
{
  GCReplayNotificationOptions *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCReplayNotificationOptions;
  v2 = -[GCReplayNotificationOptions init](&v6, sel_init);
  if (v2)
  {
    _GCFConvertStringToLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCNotificationOptions setTitle:](v2, "setTitle:", v3);

    _GCFConvertStringToLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCNotificationOptions setBody:](v2, "setBody:", v4);

    -[GCNotificationOptions setCategoryID:](v2, "setCategoryID:", CFSTR("videoStartRecordID"));
    -[GCNotificationOptions setThreadID:](v2, "setThreadID:", CFSTR("videoStartRecordID"));
  }
  return v2;
}

@end
