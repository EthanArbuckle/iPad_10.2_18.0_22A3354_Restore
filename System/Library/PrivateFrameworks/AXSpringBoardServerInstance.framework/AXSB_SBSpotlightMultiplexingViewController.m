@implementation AXSB_SBSpotlightMultiplexingViewController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSpotlightMultiplexingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSpotlightMultiplexingViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSpotlightMultiplexingViewController"), CFSTR("viewWillDisappear:"), "v", "B", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSB_SBSpotlightMultiplexingViewController;
  -[AXSB_SBSpotlightMultiplexingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springBoardActionOccurred:withPayload:", 14, &unk_24DDF54E8);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSB_SBSpotlightMultiplexingViewController;
  -[AXSB_SBSpotlightMultiplexingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springBoardActionOccurred:withPayload:", 14, &unk_24DDF5510);

}

@end
