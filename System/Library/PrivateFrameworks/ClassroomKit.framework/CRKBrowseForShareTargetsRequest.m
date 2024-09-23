@implementation CRKBrowseForShareTargetsRequest

- (CRKBrowseForShareTargetsRequest)init
{
  CRKBrowseForShareTargetsRequest *v2;
  CRKBrowseForShareTargetsRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKBrowseForShareTargetsRequest;
  v2 = -[CATTaskRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CATTaskRequest setHandlesNotifications:](v2, "setHandlesNotifications:", 1);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
