@implementation FBSKeyboardLayer

- (FBSKeyboardLayer)initWithTrackingContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBSKeyboardLayer;
  return -[FBSSceneLayer initWithKeyboardContext:](&v4, sel_initWithKeyboardContext_, a3);
}

@end
