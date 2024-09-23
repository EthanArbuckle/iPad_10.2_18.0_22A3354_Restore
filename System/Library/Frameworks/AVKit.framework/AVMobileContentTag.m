@implementation AVMobileContentTag

- (id)_initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileContentTag;
  return -[AVMobileContentTag init](&v3, sel_init);
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (float)normalizedCornerRadius
{
  return self->_normalizedCornerRadius;
}

- (unint64_t)placement
{
  return self->_placement;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)adContentTag
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.44140625, 0.734375, 0.91796875, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adContentTagWithTintColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)adContentTagWithTintColor:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = -[AVMobileContentTag _initInternal]([AVMobileContentTag alloc], "_initInternal");
  AVLocalizedString(CFSTR("Ad"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = (void *)v4[3];
  v4[3] = v3;
  v8 = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[4];
  v4[4] = v9;

  v4[5] = 1;
  *((_DWORD *)v4 + 2) = 1048576000;
  *((_OWORD *)v4 + 3) = xmmword_1AC5F8190;
  *((_OWORD *)v4 + 4) = xmmword_1AC5F8190;
  return v4;
}

+ (id)liveContentTag
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.37109375, 0.37109375, 0.37109375, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_liveContentTagWithTintColor:withTextColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)liveEdgeContentTag
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "avkit_liveContentAccessoryViewColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_liveContentTagWithTintColor:withTextColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_liveContentTagWithTintColor:(id)a3 withTextColor:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = -[AVMobileContentTag _initInternal]([AVMobileContentTag alloc], "_initInternal");
  AVLocalizedString(CFSTR("LIVE"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v7[2];
  v7[2] = v8;

  v10 = (void *)v7[3];
  v7[3] = v5;
  v11 = v5;

  v12 = (void *)v7[4];
  v7[4] = v6;

  v7[5] = 0;
  *((_DWORD *)v7 + 2) = 1056964608;
  *((_OWORD *)v7 + 3) = xmmword_1AC5F81A0;
  *((_OWORD *)v7 + 4) = xmmword_1AC5F81A0;
  return v7;
}

@end
