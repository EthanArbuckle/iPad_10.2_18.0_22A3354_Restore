@implementation _CKAvatarCutoutSupplementaryView

+ (id)reuseIdentifier
{
  return CFSTR("_CKAvatarCutoutDecorationView_reuseIdentifier");
}

+ (id)supplementaryViewKind
{
  return CFSTR("_CKAvatarCutoutDecorationView_supplementaryViewKind");
}

- (_CKAvatarCutoutSupplementaryView)initWithFrame:(CGRect)a3
{
  _CKAvatarCutoutSupplementaryView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_CKAvatarCutoutSupplementaryView;
  v3 = -[_CKAvatarCutoutSupplementaryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAvatarCutoutSupplementaryView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CKAvatarCutoutSupplementaryView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", v5);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarCutoutSize");
    v9 = v8 * 0.5;
    -[_CKAvatarCutoutSupplementaryView layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", v9);

  }
  return v3;
}

@end
