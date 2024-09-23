@implementation ZoomUI_PHSOSViewController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHSOSViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)presentMedicalID
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ZoomUI_PHSOSViewController;
  -[ZoomUI_PHSOSViewController presentMedicalID](&v3, sel_presentMedicalID);
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyZoomSOSMedicalIDShown");

}

@end
