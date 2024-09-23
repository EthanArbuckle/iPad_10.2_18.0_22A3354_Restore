@implementation UIView(PKTextInputFakeInteractions)

- (void)setFakeScribbleInteractionDelegate:()PKTextInputFakeInteractions
{
  objc_setAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Pencil Text Input/PKTextInputFakeInteractions.m", a3, (void *)1);
}

- (id)fakeScribbleInteractionDelegate
{
  return objc_getAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Pencil Text Input/PKTextInputFakeInteractions.m");
}

@end
