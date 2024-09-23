@implementation VideoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.VideoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AppStore.ProductLockupCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.VideoView"), CFSTR("accessibilityUpdatePlayerControllerControls"), "v", 0);

}

- (void)accessibilityUpdatePlayerControllerControls
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideoViewAccessibility;
  -[VideoViewAccessibility accessibilityUpdatePlayerControllerControls](&v7, sel_accessibilityUpdatePlayerControllerControls);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__VideoViewAccessibility_accessibilityUpdatePlayerControllerControls__block_invoke;
  v5[3] = &unk_250160010;
  v6 = CFSTR("AppStore.ProductLockupCollectionViewCell");
  -[VideoViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "resetProductLockupCellAccessibilityElements");

}

uint64_t __69__VideoViewAccessibility_accessibilityUpdatePlayerControllerControls__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  MEMORY[0x234905FEC](v2);
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

@end
