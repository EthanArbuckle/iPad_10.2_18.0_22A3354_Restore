@implementation AXCCShadowView

- (AXCCShadowView)initWithFrame:(CGRect)a3
{
  AXCCShadowView *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  AXCCShadowView *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXCCShadowView;
  v3 = -[AXCCShadowView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v3;
  if (v3)
  {
    objc_msgSend_layer(v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShadowPathIsBounds_(v8, v9, 1, v10);

  }
  return v7;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char hasPrefix;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXCCShadowView;
  if (-[AXCCShadowView _shouldAnimatePropertyWithKey:](&v9, sel__shouldAnimatePropertyWithKey_, v4))
    hasPrefix = 1;
  else
    hasPrefix = objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("shadow"), v6);

  return hasPrefix;
}

@end
