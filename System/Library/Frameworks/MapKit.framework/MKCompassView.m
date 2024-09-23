@implementation MKCompassView

+ (id)_parameterForSize:(int64_t)a3
{
  if (_parameterForSize__onceToken != -1)
    dispatch_once(&_parameterForSize__onceToken, &__block_literal_global_23_1);
  if ((unint64_t)a3 <= 2)
    a1 = (id)*(&off_1E20DCD80)[a3];
  return a1;
}

- (void)movedToWindow:(id)a3
{
  if (a3)
    -[MKCompassView _updateStyle](self, "_updateStyle");
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_parameterForSize:", -[MKCompassView compassViewSize](self, "compassViewSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diameter");
  v4 = v3;

  v5 = v4;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKCompassView;
  -[MKCompassView layoutSubviews](&v3, sel_layoutSubviews);
  -[MKCompassView _setupImageView:](self, "_setupImageView:", self->_containerImageView);
  -[MKCompassView _setupImageView:](self, "_setupImageView:", self->_assetImageView);
}

- (void)setMapHeading:(double)a3
{
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  CATransform3D v10;
  CATransform3D v11;
  CATransform3D v12;

  v5 = MKCompassPointNEWSForHeading(a3);
  if ((_DWORD)v5 != self->_lastDrawnCompassDirection)
  {
    v6 = v5;
    -[MKCompassView _updateImageForCompassDirection:](self, "_updateImageForCompassDirection:", v5);
    self->_lastDrawnCompassDirection = v6;
  }
  memset(&v12, 0, sizeof(v12));
  CATransform3DMakeRotation(&v12, a3 * -0.0174532925, 0.0, 0.0, 1.0);
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_CA_setDisableActions:", 1);

  v11 = v12;
  -[UIImageView layer](self->_assetImageView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  objc_msgSend(v8, "setTransform:", &v10);

  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_CA_setDisableActions:", 0);

}

- (void)_updateLayerForCurrentSizeAndStyle
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  double v19;
  id v20;

  objc_msgSend((id)objc_opt_class(), "_parameterForSize:", -[MKCompassView compassViewSize](self, "compassViewSize"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_parameterForStyle:", -[MKCompassView compassViewStyle](self, "compassViewStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCompassView setBackgroundColor:](self, "setBackgroundColor:", v4);

  objc_msgSend(v20, "diameter");
  v6 = v5 * 0.5;
  -[MKCompassView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v6);

  -[MKCompassView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowRadius:", 8.0);

  -[MKCompassView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowOffset:", 0.0, 2.0);

  objc_msgSend(v3, "shadowColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "CGColor");
  -[MKCompassView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowColor:", v11);

  -[MKCompassView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1034147594;
  objc_msgSend(v13, "setShadowOpacity:", v14);

  v15 = (void *)MEMORY[0x1E0CEA390];
  -[MKCompassView bounds](self, "bounds");
  objc_msgSend(v15, "bezierPathWithOvalInRect:");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "CGPath");
  -[MKCompassView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShadowPath:", v17);

  -[MKCompassView mapHeading](self, "mapHeading");
  -[MKCompassView _updateImageForCompassDirection:](self, "_updateImageForCompassDirection:", MKCompassPointNEWSForHeading(v19));

}

- (void)_updateImageForCompassDirection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _MKCompassDirectionImageKey *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _MKCompassDirectionImageKey *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "_parameterForSize:", -[MKCompassView compassViewSize](self, "compassViewSize"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_parameterForStyle:", -[MKCompassView compassViewStyle](self, "compassViewStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA638];
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v23, "imageNamePart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamePart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Compass%@%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_mapkit_imageNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_assetImageView, "setImage:", v11);

  -[UIImageView image](self->_assetImageView, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [_MKCompassDirectionImageKey alloc];
    -[UIImageView image](self->_assetImageView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;
    -[MKCompassView stringForCompassPoint:](self, "stringForCompassPoint:", v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_MKCompassDirectionImageKey initWithSize:headingString:compassViewStyle:](v13, "initWithSize:headingString:compassViewStyle:", v19, -[MKCompassView compassViewStyle](self, "compassViewStyle"), v16, v18);

    -[MKCompassView traitCollection](self, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayScale");
    -[MKCompassView _compassDirectionImageForKey:sizeParams:styleParams:scale:](self, "_compassDirectionImageForKey:sizeParams:styleParams:scale:", v20, v23, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_containerImageView, "setImage:", v22);

    -[MKCompassView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  else
  {
    -[MKCompassView setHidden:](self, "setHidden:", 1);
  }

}

- (int64_t)compassViewStyle
{
  return self->_compassViewStyle;
}

- (int64_t)compassViewSize
{
  return self->_compassViewSize;
}

+ (id)_parameterForStyle:(int64_t)a3
{
  uint64_t *v4;

  if (qword_1ECE2D760 == -1)
  {
    if (a3)
      goto LABEL_3;
LABEL_6:
    v4 = &qword_1ECE2D758;
    goto LABEL_7;
  }
  dispatch_once(&qword_1ECE2D760, &__block_literal_global_32_0);
  if (!a3)
    goto LABEL_6;
LABEL_3:
  if (a3 == 1)
  {
    v4 = &qword_1ECE2D750;
LABEL_7:
    a1 = (id)*v4;
  }
  return a1;
}

- (id)stringForCompassPoint:(int)a3
{
  uint64_t v3;

  if (a3)
    v3 = (a3 - 1);
  else
    v3 = 1;
  return -[NSArray objectAtIndexedSubscript:](self->_compassPointLocalizedAbbreviations, "objectAtIndexedSubscript:", v3);
}

- (id)_compassDirectionImageForKey:(id)a3 sizeParams:(id)a4 styleParams:(id)a5 scale:(double)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  _QWORD v24[2];
  _QWORD v25[3];
  CGSize v26;

  v25[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (qword_1ECE2D730 != -1)
    dispatch_once(&qword_1ECE2D730, &__block_literal_global_86);
  objc_msgSend((id)_MergedGlobals_3_5, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v9, "size");
    UIGraphicsBeginImageContextWithOptions(v26, 0, a6);
    v24[0] = *MEMORY[0x1E0CEA098];
    objc_msgSend(v10, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v24[1] = *MEMORY[0x1E0CEA0A0];
    objc_msgSend(v11, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "headingString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithString:attributes:", v17, v15);

    objc_msgSend(v9, "size");
    objc_msgSend(v9, "size");
    objc_msgSend(v9, "headingString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sizeWithAttributes:", v15);

    UIRoundToViewScale();
    v21 = v20;
    UIRoundToViewScale();
    objc_msgSend(v18, "drawAtPoint:", v21, v22);
    UIGraphicsGetImageFromCurrentImageContext();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend((id)_MergedGlobals_3_5, "setObject:forKey:", v12, v9);

  }
  return v12;
}

- (double)mapHeading
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIImageView layer](self->_assetImageView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("transform.rotation.z"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5 * -57.2957795;
}

- (void)_setupImageView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  id v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  objc_msgSend(v4, "image");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v6 = v5;
  objc_msgSend(v18, "size");
  v8 = v7;
  -[MKCompassView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v6, v8);
  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v20));

}

- (void)setCompassViewSize:(int64_t)a3 style:(int64_t)a4
{
  if (self->_compassViewSize != a3 || self->_compassViewStyle != a4)
  {
    self->_compassViewSize = a3;
    self->_compassViewStyle = a4;
    -[MKCompassView _updateLayerForCurrentSizeAndStyle](self, "_updateLayerForCurrentSizeAndStyle");
    -[MKCompassView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (MKCompassView)initWithFrame:(CGRect)a3
{
  MKCompassView *v3;
  MKCompassView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKCompassView;
  v3 = -[MKCompassView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKCompassView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  double v2;
  double v4;
  double v5;
  double v6;
  UIImageView *v7;
  UIImageView *containerImageView;
  UIImageView *v9;
  UIImageView *assetImageView;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  LODWORD(v2) = 1144750080;
  -[MKCompassView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v2);
  LODWORD(v4) = 1144750080;
  -[MKCompassView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  LODWORD(v5) = 1144750080;
  -[MKCompassView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1144750080;
  -[MKCompassView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v6);
  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
  containerImageView = self->_containerImageView;
  self->_containerImageView = v7;

  -[MKCompassView addSubview:](self, "addSubview:", self->_containerImageView);
  v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
  assetImageView = self->_assetImageView;
  self->_assetImageView = v9;

  -[UIImageView addSubview:](self->_containerImageView, "addSubview:", self->_assetImageView);
  -[MKCompassView _populateCompassPointLocalizedAbbreviationsArray](self, "_populateCompassPointLocalizedAbbreviationsArray");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MNLocaleDidChangeNotification();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_updateLocale_, v12, 0);

  v15[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)-[MKCompassView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v13, sel_traitEnvironment_didChangeTraitCollection_);

}

- (void)_populateCompassPointLocalizedAbbreviationsArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *compassPointLocalizedAbbreviations;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  MKLocalizedAbbreviationForCompassPointNEWS(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  MKLocalizedAbbreviationForCompassPointNEWS(2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  MKLocalizedAbbreviationForCompassPointNEWS(3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  MKLocalizedAbbreviationForCompassPointNEWS(4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  compassPointLocalizedAbbreviations = self->_compassPointLocalizedAbbreviations;
  self->_compassPointLocalizedAbbreviations = v7;

}

void __36__MKCompassView__parameterForStyle___block_invoke()
{
  _MKCompassViewStyleParameter *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _MKCompassViewStyleParameter *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v0 = objc_alloc_init(_MKCompassViewStyleParameter);
  v1 = (void *)qword_1ECE2D750;
  qword_1ECE2D750 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECE2D750, "setImageNamePart:", CFSTR("Light"));
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.639999986);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D750, "setTextColor:", v2);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D750, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0500000007);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D750, "setBorderColor:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D750, "setShadowColor:", v5);

  v6 = objc_alloc_init(_MKCompassViewStyleParameter);
  v7 = (void *)qword_1ECE2D758;
  qword_1ECE2D758 = (uint64_t)v6;

  objc_msgSend((id)qword_1ECE2D758, "setImageNamePart:", CFSTR("Dark"));
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.639999986);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D758, "setTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D758, "setBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0500000007);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D758, "setBorderColor:", v10);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D758, "setShadowColor:", v11);

}

void __35__MKCompassView__parameterForSize___block_invoke()
{
  _MKCompassViewSizeParameter *v0;
  void *v1;
  double v2;
  void *v3;
  _MKCompassViewSizeParameter *v4;
  void *v5;
  void *v6;
  _MKCompassViewSizeParameter *v7;
  void *v8;
  id v9;

  v0 = objc_alloc_init(_MKCompassViewSizeParameter);
  v1 = (void *)qword_1ECE2D738;
  qword_1ECE2D738 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECE2D738, "setImageNamePart:", CFSTR("Small"));
  objc_msgSend((id)qword_1ECE2D738, "setDiameter:", 36.0);
  v2 = *MEMORY[0x1E0CEB5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0CEB5E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D738, "setFont:", v3);

  v4 = objc_alloc_init(_MKCompassViewSizeParameter);
  v5 = (void *)qword_1ECE2D740;
  qword_1ECE2D740 = (uint64_t)v4;

  objc_msgSend((id)qword_1ECE2D740, "setImageNamePart:", CFSTR("Medium"));
  objc_msgSend((id)qword_1ECE2D740, "setDiameter:", 44.0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 16.0, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D740, "setFont:", v6);

  v7 = objc_alloc_init(_MKCompassViewSizeParameter);
  v8 = (void *)qword_1ECE2D748;
  qword_1ECE2D748 = (uint64_t)v7;

  objc_msgSend((id)qword_1ECE2D748, "setImageNamePart:", CFSTR("Large"));
  objc_msgSend((id)qword_1ECE2D748, "setDiameter:", 60.0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 20.0, *MEMORY[0x1E0CEB5F8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2D748, "setFont:", v9);

}

- (void)_updateStyle
{
  -[MKCompassView _adaptCompassStyleToUserInterfaceStyle](self, "_adaptCompassStyleToUserInterfaceStyle");
  -[MKCompassView _updateLayerForCurrentSizeAndStyle](self, "_updateLayerForCurrentSizeAndStyle");
}

- (void)_adaptCompassStyleToUserInterfaceStyle
{
  id v3;

  -[MKCompassView traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_compassViewStyle = objc_msgSend(v3, "userInterfaceStyle") != 2;

}

void __75__MKCompassView__compassDirectionImageForKey_sizeParams_styleParams_scale___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_3_5;
  _MergedGlobals_3_5 = v0;

}

- (MKCompassView)initWithCoder:(id)a3
{
  MKCompassView *v3;
  MKCompassView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKCompassView;
  v3 = -[MKCompassView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MKCompassView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MKCompassView;
  -[MKCompassView dealloc](&v4, sel_dealloc);
}

- (void)updateLocale:(id)a3
{
  -[MKCompassView _populateCompassPointLocalizedAbbreviationsArray](self, "_populateCompassPointLocalizedAbbreviationsArray", a3);
  -[MKCompassView _updateLayerForCurrentSizeAndStyle](self, "_updateLayerForCurrentSizeAndStyle");
}

- (void)setCompassViewSize:(int64_t)a3
{
  -[MKCompassView setCompassViewSize:style:](self, "setCompassViewSize:style:", a3, self->_compassViewStyle);
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a4;
  -[MKCompassView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
    -[MKCompassView _updateStyle](self, "_updateStyle");
}

- (BOOL)isPointInNorthEastHalf:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[MKCompassView center](self, "center");
  v7 = v6;
  -[MKCompassView center](self, "center");
  v9 = y - v8;
  v10 = 0.0;
  if (vabdd_f64(y, v8) >= 0.000001)
    v10 = atan((x - v7) / -v9);
  if (v9 > 0.0)
    v10 = v10 + 3.14159265;
  return v10 < 2.35619449 && v10 >= -0.785398163;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compassPointLocalizedAbbreviations, 0);
  objc_storeStrong((id *)&self->_assetImageView, 0);
  objc_storeStrong((id *)&self->_containerImageView, 0);
}

@end
