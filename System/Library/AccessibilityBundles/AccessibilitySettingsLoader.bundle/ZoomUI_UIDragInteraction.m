@implementation ZoomUI_UIDragInteraction

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDragInteraction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_sessionHandedOffDragImage:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ZoomUI_UIDragInteraction;
  -[ZoomUI_UIDragInteraction _sessionHandedOffDragImage:](&v4, sel__sessionHandedOffDragImage_, a3);
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyZoomDragWillStart");

}

- (void)_sessionWillEnd:(id)a3 withOperation:(unint64_t)a4
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ZoomUI_UIDragInteraction;
  -[ZoomUI_UIDragInteraction _sessionWillEnd:withOperation:](&v5, sel__sessionWillEnd_withOperation_, a3, a4);
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyZoomDragWillEnd");

}

@end
