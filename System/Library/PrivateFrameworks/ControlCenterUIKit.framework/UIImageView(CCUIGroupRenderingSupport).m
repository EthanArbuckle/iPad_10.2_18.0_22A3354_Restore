@implementation UIImageView(CCUIGroupRenderingSupport)

- (uint64_t)ccui_configureForPunchOutRendering:()CCUIGroupRenderingSupport
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    v6 = *MEMORY[0x1E0CD2C50];
  else
    v6 = 0;
  objc_msgSend(v4, "setCompositingFilter:", v6);
  objc_msgSend(v5, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 ^ 1u;
  objc_msgSend(v7, "setAllowsGroupOpacity:", v8);
  objc_msgSend(v7, "setAllowsGroupBlending:", v8);

  return 1;
}

- (id)ccui_punchOutCompensatingCopy
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(a1, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithImage:", v3);

  objc_msgSend(a1, "frame");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.37254902, 0.37254902, 0.37254902, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ccui_applyGlyphTintColor:", v5);

  objc_msgSend(a1, "alpha");
  objc_msgSend(v4, "ccui_setCompensationAlpha:");
  return v4;
}

- (uint64_t)ccui_setCompensationAlpha:()CCUIGroupRenderingSupport
{
  if (a3 > 0.15)
    a3 = 0.15;
  return objc_msgSend(a1, "setAlpha:", a3);
}

@end
