@implementation FBSCAContextSceneLayer

- (FBSCAContextSceneLayer)initWithCAContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBSCAContextSceneLayer;
  return -[FBSSceneLayer initWithWindowContext:](&v4, sel_initWithWindowContext_, a3);
}

+ (id)layerWithCAContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWindowContext:", v4);

  return v5;
}

- (FBSCAContextSceneLayer)initWithCAContextID:(unsigned int)a3 level:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBSCAContextSceneLayer;
  return -[FBSSceneLayer initWithContextID:level:](&v5, sel_initWithContextID_level_, *(_QWORD *)&a3, a4);
}

@end
