@implementation AXSBSideAppCustomAction

- (AXSBSideAppCustomAction)initWithName:(id)a3 gesture:(unint64_t)a4 target:(id)a5 selector:(SEL)a6
{
  AXSBSideAppCustomAction *v7;
  AXSBSideAppCustomAction *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSBSideAppCustomAction;
  v7 = -[AXSBSideAppCustomAction initWithName:target:selector:](&v10, sel_initWithName_target_selector_, a3, a5, a6);
  v8 = v7;
  if (v7)
    -[AXSBSideAppCustomAction setGesture:](v7, "setGesture:", a4);
  return v8;
}

- (unint64_t)gesture
{
  return self->_gesture;
}

- (void)setGesture:(unint64_t)a3
{
  self->_gesture = a3;
}

@end
