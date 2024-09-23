@implementation UITraitCollection(SwiftUIStaging)

- (BOOL)_swiftui_sceneIsCaptured
{
  return (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a1, "sceneCaptureState") == 1;
}

@end
