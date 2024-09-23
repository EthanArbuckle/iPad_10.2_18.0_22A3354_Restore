@implementation UIView(ClipServicesUIExtras)

+ (id)cps_viewWithBackgroundColor:()ClipServicesUIExtras cornerRadius:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = objc_alloc_init(a1);
  objc_msgSend(v7, "_setContinuousCornerRadius:", a2);
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(v7, "setClipsToBounds:", 1);
  return v7;
}

- (uint64_t)cps_configureForAnimatesAlphaWhenHighlighted:()ClipServicesUIExtras
{
  double v3;
  _QWORD v5[5];
  char v6;

  v3 = 0.16;
  if (!a3)
    v3 = 0.5;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__UIView_ClipServicesUIExtras__cps_configureForAnimatesAlphaWhenHighlighted___block_invoke;
  v5[3] = &unk_1E8E8B0B8;
  v5[4] = a1;
  v6 = a3;
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 50659328, v5, 0, v3, 0.0);
}

- (uint64_t)cps_sizeToFitWithinSize:()ClipServicesUIExtras
{
  CGAffineTransform v3;

  objc_msgSend(a1, "sizeThatFits:");
  objc_msgSend(a1, "transform");
  if (CGAffineTransformIsIdentity(&v3))
  {
    objc_msgSend(a1, "frame");
    return objc_msgSend(a1, "setFrame:");
  }
  else
  {
    objc_msgSend(a1, "bounds");
    return objc_msgSend(a1, "setBounds:");
  }
}

- (void)cps_verticallyAlignTopView:()ClipServicesUIExtras bottomView:margin:
{
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat v26;
  double Height;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat rect;
  double Width;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v36 = a5;
  v7 = a4;
  objc_msgSend(a1, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  rect = v14;
  objc_msgSend(v7, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v37.origin.x = v9;
  v37.origin.y = v11;
  v37.size.width = v13;
  v37.size.height = v15;
  Width = CGRectGetWidth(v37);
  v38.origin.x = v17;
  v38.origin.y = v19;
  v38.size.width = v21;
  v24 = v21;
  v25 = v23;
  v38.size.height = v23;
  v26 = (Width - CGRectGetWidth(v38)) * 0.5;
  v39.origin.x = v9;
  v39.origin.y = v11;
  v39.size.width = v13;
  v39.size.height = rect;
  Height = CGRectGetHeight(v39);
  objc_msgSend(v7, "bounds");
  v28 = CGRectGetHeight(v40) + a2;
  objc_msgSend(v36, "bounds");
  v29 = (Height - (v28 + CGRectGetHeight(v41))) * 0.5;
  objc_msgSend(v7, "setFrame:", v26, v29, v24, v25);

  objc_msgSend(v36, "frame");
  v30 = v42.size.width;
  v31 = v42.size.height;
  v32 = (Width - CGRectGetWidth(v42)) * 0.5;
  v43.origin.x = v26;
  v43.origin.y = v29;
  v43.size.width = v24;
  v43.size.height = v25;
  objc_msgSend(v36, "setFrame:", v32, v29 + CGRectGetHeight(v43) + a2, v30, v31);

}

+ (id)cps_vibrantSeparator
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v0, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v1);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(v2, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v5, "constraintEqualToConstant:", 1.0 / v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  return v2;
}

@end
