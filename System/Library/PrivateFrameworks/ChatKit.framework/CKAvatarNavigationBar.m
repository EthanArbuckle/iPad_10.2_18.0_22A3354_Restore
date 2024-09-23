@implementation CKAvatarNavigationBar

+ (BOOL)_supportsCanvasView
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  objc_super v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)CKAvatarNavigationBar;
    -[CKAvatarNavigationBar sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
    v9 = v8;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maxNavigationBarExpandedHeightValue");
    v12 = v11;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKAvatarNavigationBar;
    -[CKAvatarNavigationBar sizeThatFits:](&v17, sel_sizeThatFits_, width, height);
    v9 = v13;
    v12 = v14;
  }
  v15 = v9;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

@end
