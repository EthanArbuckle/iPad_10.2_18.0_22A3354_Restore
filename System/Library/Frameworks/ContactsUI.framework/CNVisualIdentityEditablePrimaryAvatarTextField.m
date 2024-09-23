@implementation CNVisualIdentityEditablePrimaryAvatarTextField

- (CGRect)caretRectForPosition:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarTextField;
  -[CNVisualIdentityEditablePrimaryAvatarTextField caretRectForPosition:](&v19, sel_caretRectForPosition_, a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CNVisualIdentityEditablePrimaryAvatarTextField bounds](self, "bounds");
  v13 = (v11 - v12 * 0.5) * 0.5;
  v14 = v11 <= v12 * 0.5;
  if (v11 <= v12 * 0.5)
    v15 = v11;
  else
    v15 = v12 * 0.5;
  if (v14)
    v13 = -0.0;
  v16 = v7 + v13;
  v17 = v5;
  v18 = v9;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

@end
