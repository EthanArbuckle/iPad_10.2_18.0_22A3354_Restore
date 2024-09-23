@implementation FBSKeyboardProxyLayer

- (FBSKeyboardProxyLayer)initWithLevel:(double)a3 keyboardOwner:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBSKeyboardProxyLayer;
  return -[FBSSceneLayer initWithKeyboardOwner:level:](&v5, sel_initWithKeyboardOwner_level_, a4, a3);
}

@end
