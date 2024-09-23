@implementation UploadRecordAnalytics

- (UploadRecordAnalytics)init
{
  void *v3;
  UploadRecordAnalytics *v4;
  objc_super v6;

  +[AnalyticsWorkspace defaultWorkspace](AnalyticsWorkspace, "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)UploadRecordAnalytics;
  v4 = -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v6, sel_initWithWorkspace_entityName_withCache_, v3, CFSTR("UploadRecord"), 1);

  return v4;
}

- (UploadRecordAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UploadRecordAnalytics;
  return -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v5, sel_initWithWorkspace_entityName_withCache_, a3, CFSTR("UploadRecord"), a4);
}

@end
