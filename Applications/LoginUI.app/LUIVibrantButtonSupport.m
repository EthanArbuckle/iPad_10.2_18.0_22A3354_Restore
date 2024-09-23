@implementation LUIVibrantButtonSupport

+ (id)defaultConstraintsForBottomLeftVibrantButton:(id)a3 inView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v7, "edgeInsetsForFooterButton");
  v9 = v8;
  v11 = v10;

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, v9));
  v27[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -v11));
  v27[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v17, "footerButtonWidth");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:"));
  v27[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", v21));
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));

  return v23;
}

+ (id)defaultConstraintsForBottomRightVibrantButton:(id)a3 inView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v7, "edgeInsetsForFooterButton");
  v9 = v8;
  v11 = v10;

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -v9));
  v27[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -v11));
  v27[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v17, "footerButtonWidth");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:"));
  v27[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", v21));
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));

  return v23;
}

+ (id)defaultVibrantButtonWithImageType:(int64_t)a3 vibrancyAllowed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;

  v4 = a4;
  v6 = objc_msgSend(objc_alloc((Class)SBUIVibrantButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wallpaperLegibilitySettings"));

  objc_msgSend(v6, "setLegibilitySettings:", v8);
  objc_msgSend(v6, "setStrength:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUIVibrantButtonSupport _imageForImageType:](LUIVibrantButtonSupport, "_imageForImageType:", a3));
  objc_msgSend(v6, "setGlyphImage:", v9);

  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setNumberOfLines:", 2);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_SBFVibrantSettings vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:](_SBFVibrantSettings, "vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:", 0, v8, 1.0));
  v11 = objc_msgSend(v8, "style");
  v12 = 0.0;
  if (v11 != (id)2)
    v12 = 1.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v12, 0.5));
  objc_msgSend(v10, "setTintColor:", v13);

  objc_msgSend(v6, "setVibrancyAllowed:", v4);
  objc_msgSend(v6, "setVibrantSettings:", v10);

  return v6;
}

+ (id)_imageForImageType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 4)
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", off_100068E60[a3], v3, v4));
}

@end
