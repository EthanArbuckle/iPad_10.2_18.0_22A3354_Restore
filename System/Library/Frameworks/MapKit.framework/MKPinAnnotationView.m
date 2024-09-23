@implementation MKPinAnnotationView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

+ (CGSize)_perceivedSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 35.0;
  v3 = 15.0;
  result.height = v2;
  result.width = v3;
  return result;
}

+ (UIColor)redPinColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
}

+ (UIColor)greenPinColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
}

+ (UIColor)purplePinColor
{
  if (qword_1ECE2D6C8 != -1)
    dispatch_once(&qword_1ECE2D6C8, &__block_literal_global_41);
  return (UIColor *)(id)_MergedGlobals_3_1;
}

void __37__MKPinAnnotationView_purplePinColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.788235307, 0.411764711, 0.87843138, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_3_1;
  _MergedGlobals_3_1 = v0;

}

+ (CGRect)_pinFrameForPosition:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.x + -8.0;
  v4 = a3.y + -35.0;
  v5 = 35.0;
  v6 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (id)_bounceAnimation
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  v2 = (void *)_bounceAnimation__pinBounceAnimation;
  if (!_bounceAnimation__pinBounceAnimation)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setKeyPath:", CFSTR("contents"));
    objc_msgSend(v3, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
    LODWORD(v4) = 1.0;
    objc_msgSend(v3, "setRepeatCount:", v4);
    objc_msgSend(v3, "setDuration:", 0.116666667);
    v5 = (void *)_bounceAnimation__pinBounceAnimation;
    _bounceAnimation__pinBounceAnimation = (uint64_t)v3;

    v2 = (void *)_bounceAnimation__pinBounceAnimation;
  }
  return (id)objc_msgSend(v2, "copy");
}

+ (id)_dropBounceAnimation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)_dropBounceAnimation__pinDropBounceAnimation;
  if (!_dropBounceAnimation__pinDropBounceAnimation)
  {
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v3, "setRemovedOnCompletion:", 0);
    v4 = (void *)_dropBounceAnimation__pinDropBounceAnimation;
    _dropBounceAnimation__pinDropBounceAnimation = (uint64_t)v3;

    v2 = (void *)_dropBounceAnimation__pinDropBounceAnimation;
  }
  return (id)objc_msgSend(v2, "copy");
}

+ (id)_imageForLayer:(int64_t)a3 state:(int64_t)a4 mapType:(unint64_t)a5 traits:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v9 = a6;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("pin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(a4 - 1) <= 3)
    objc_msgSend(v10, "appendString:", off_1E20DA830[a4 - 1]);
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_8;
    v12 = CFSTR("_base");
  }
  else
  {
    v12 = CFSTR("_head");
  }
  objc_msgSend(v11, "appendString:", v12);
LABEL_8:
  if (a5 - 1 <= 3)
    objc_msgSend(v11, "appendString:", CFSTR("_sat"));
  if (objc_msgSend(v9, "userInterfaceIdiom") == 3)
    objc_msgSend(v11, "appendString:", CFSTR("_car"));
  objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:compatibleWithTraitCollection:", v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_imageForState:(int64_t)a3 mapType:(unint64_t)a4 pinColor:(id)a5 traits:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  id v18;
  CGImage *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  CGImageRef (*v24)(uint64_t, CGImageRef, CGImage *);
  void *v25;
  id v26;
  int64_t v27;

  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "_imageForLayer:state:mapType:traits:", 0, a3, a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageForLayer:state:mapType:traits:", 1, a3, a4, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = 0;
  if (v12 && v13)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __62__MKPinAnnotationView__imageForState_mapType_pinColor_traits___block_invoke;
    v25 = &unk_1E20DA798;
    v26 = v10;
    v27 = a3;
    v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D778DB8](&v22);
    objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection", v22, v23, v24, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v11);
    v18 = objc_retainAutorelease(v12);
    v19 = (CGImage *)v16[2](v16, objc_msgSend(v18, "CGImage"), objc_msgSend(objc_retainAutorelease(v14), "CGImage"));
    v20 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(v18, "scale");
    v15 = (void *)objc_msgSend(v20, "initWithCGImage:scale:orientation:", v19, 0);
    CGImageRelease(v19);
    objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v17);

  }
  return v15;
}

CGImageRef __62__MKPinAnnotationView__imageForState_mapType_pinColor_traits___block_invoke(uint64_t a1, CGImageRef image, CGImage *a3)
{
  double Width;
  double Height;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v10;
  CGColorSpace *DeviceGray;
  CGContext *v12;
  CGImage *v13;
  CGImageRef v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  Width = (double)CGImageGetWidth(image);
  Height = (double)CGImageGetHeight(image);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v10 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = Width;
  v16.size.height = Height;
  CGContextClearRect(v10, v16);
  CGContextSaveGState(v10);
  CGContextSetFillColorWithColor(v10, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = Width;
  v17.size.height = Height;
  CGContextFillRect(v10, v17);
  CGContextSetBlendMode(v10, kCGBlendModeDestinationIn);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = Width;
  v18.size.height = Height;
  CGContextDrawImage(v10, v18, image);
  CGContextRestoreGState(v10);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = Width;
  v19.size.height = Height;
  CGContextDrawImage(v10, v19, a3);
  if (*(_QWORD *)(a1 + 40) == 5)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    v12 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, 8 * (unint64_t)Width, DeviceGray, 0);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = Width;
    v20.size.height = Height;
    CGContextDrawImage(v12, v20, image);
    v13 = CGBitmapContextCreateImage(v12);
    CGContextRelease(v12);
    CGColorSpaceRelease(DeviceGray);
    CGContextSaveGState(v10);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = Width;
    v21.size.height = Height;
    CGContextClipToMask(v10, v21, image);
    CGContextSetRGBFillColor(v10, 0.0, 0.0, 0.0, 0.200000003);
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = Width;
    v22.size.height = Height;
    CGContextFillRect(v10, v22);
    CGContextRestoreGState(v10);
    CGImageRelease(v13);
  }
  v14 = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  CGColorSpaceRelease(DeviceRGB);
  return v14;
}

+ (id)_imageCache
{
  if (qword_1ECE2D6D8 != -1)
    dispatch_once(&qword_1ECE2D6D8, &__block_literal_global_28);
  return (id)qword_1ECE2D6D0;
}

void __34__MKPinAnnotationView__imageCache__block_invoke()
{
  _MKPinAnnotationViewImageCache *v0;
  void *v1;

  v0 = objc_alloc_init(_MKPinAnnotationViewImageCache);
  v1 = (void *)qword_1ECE2D6D0;
  qword_1ECE2D6D0 = (uint64_t)v0;

}

+ (id)_pinsWithMapType:(unint64_t)a3 pinColor:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "_imageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pinsWithMapType:pinColor:traits:", a3, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
    for (i = 0; i != 6; ++i)
    {
      objc_msgSend(a1, "_imageForState:mapType:pinColor:traits:", i, a3, v8, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v15, v16);

      }
    }
    objc_msgSend(v10, "setPins:forMapType:pinColor:traits:", v13, a3, v8, v9);
  }

  return v13;
}

+ (id)_reuseIdentifier
{
  return CFSTR("MKPinAnnotationView");
}

+ (id)_shadowImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_shadowImage_pinShadowImage;
  if (!_shadowImage_pinShadowImage)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("pin_shadow.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_shadowImage_pinShadowImage;
    _shadowImage_pinShadowImage = v3;

    v2 = (void *)_shadowImage_pinShadowImage;
  }
  return v2;
}

+ (CGPoint)_perceivedAnchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 8.0;
  v3 = 5.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGPoint)_shadowAnchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 2.0;
  v3 = 3.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_draggingDropOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[MKAnnotationView centerOffset](self, "centerOffset");
  v4 = v3 + -3.0;
  result.y = v4;
  result.x = v2;
  return result;
}

+ (CGPoint)_calloutOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -8.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGPoint)_leftCalloutOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -3.0;
  v3 = -13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGPoint)_rightCalloutOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -14.0;
  v3 = -13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (MKPinAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  MKPinAnnotationView *v4;
  void *v5;
  uint64_t v6;
  UIColor *pinTintColor;
  id v8;
  void *v9;
  uint64_t v10;
  UIImageView *shadowView;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  MKPinAnnotationView *v20;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)MKPinAnnotationView;
  v4 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v22, sel_initWithAnnotation_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v5, "redPinColor");
    v6 = objc_claimAutoreleasedReturnValue();
    pinTintColor = v4->_pinTintColor;
    v4->_pinTintColor = (UIColor *)v6;

    v8 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(v5, "_shadowImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithImage:", v9);
    shadowView = v4->_shadowView;
    v4->_shadowView = (UIImageView *)v10;

    -[MKPinAnnotationView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    objc_msgSend(v5, "_calloutOffset");
    -[MKAnnotationView setCalloutOffset:](v4, "setCalloutOffset:");
    objc_msgSend(v5, "_leftCalloutOffset");
    -[MKAnnotationView setLeftCalloutOffset:](v4, "setLeftCalloutOffset:");
    objc_msgSend(v5, "_rightCalloutOffset");
    -[MKAnnotationView setRightCalloutOffset:](v4, "setRightCalloutOffset:");
    -[MKPinAnnotationView layer](v4, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHitOffset:", -8.0, -2.0);
    objc_msgSend(v12, "setHitOutset:", 0.0, 5.0);
    -[MKPinAnnotationView _image](v4, "_image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setImage:](v4, "setImage:", v13);

    -[MKPinAnnotationView traitCollection](v4, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");
    v16 = 8.0;
    if (v15 == 3)
      v16 = 7.5;
    v17 = -15.0;
    if (v15 == 3)
      v17 = -13.5;
    -[MKAnnotationView setCenterOffset:](v4, "setCenterOffset:", v16, v17);

    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[MKPinAnnotationView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v18, sel_traitEnvironment_didChangeTraitCollection_);

    v20 = v4;
  }

  return v4;
}

- (void)setPinColor:(MKPinAnnotationColor)pinColor
{
  uint64_t v4;
  id v5;

  if (pinColor == MKPinAnnotationColorPurple)
  {
    objc_msgSend((id)objc_opt_class(), "purplePinColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (pinColor == MKPinAnnotationColorGreen)
      objc_msgSend((id)objc_opt_class(), "greenPinColor");
    else
      objc_msgSend((id)objc_opt_class(), "redPinColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[MKPinAnnotationView setPinTintColor:](self, "setPinTintColor:", v4);

}

- (MKPinAnnotationColor)pinColor
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  int v9;

  -[MKPinAnnotationView pinTintColor](self, "pinTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "greenPinColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
    return 1;
  -[MKPinAnnotationView pinTintColor](self, "pinTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "purplePinColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
    return 2;
  else
    return 0;
}

- (UIColor)pinTintColor
{
  return self->_pinTintColor;
}

- (void)setPinTintColor:(UIColor *)pinTintColor
{
  char v4;
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;

  v8 = pinTintColor;
  v4 = -[UIColor isEqual:](v8, "isEqual:", self->_pinTintColor);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    if (v8)
    {
      v6 = v8;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "redPinColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_pinTintColor;
    self->_pinTintColor = v6;

    -[MKPinAnnotationView _removeAllAnimations](self, "_removeAllAnimations");
    -[MKPinAnnotationView _invalidateImage](self, "_invalidateImage");
    v5 = v8;
  }

}

- (void)setAnimatesDrop:(BOOL)animatesDrop
{
  self->_animatesDrop = animatesDrop;
}

- (BOOL)animatesDrop
{
  return self->_animatesDrop;
}

- (CGRect)_significantBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 35.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 15.0;
  result.size.height = v2;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 11.0;
  v3 = -5.0;
  v4 = -5.0;
  v5 = 13.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setMapType:(unint64_t)a3
{
  objc_super v5;

  if (-[MKAnnotationView _mapType](self, "_mapType") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MKPinAnnotationView;
    -[MKAnnotationView _setMapType:](&v5, sel__setMapType_, a3);
    -[MKPinAnnotationView _removeAllAnimations](self, "_removeAllAnimations");
    -[MKPinAnnotationView _invalidateImage](self, "_invalidateImage");
  }
}

- (id)description
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  -[MKPinAnnotationView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKPinAnnotationView bounds](self, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bounds");
  v27.origin.x = v13;
  v27.origin.y = v14;
  v27.size.width = v15;
  v27.size.height = v16;
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  LODWORD(v3) = CGRectIntersectsRect(v26, v27);
  v17 = (void *)MEMORY[0x1E0CB3940];
  v25.receiver = self;
  v25.super_class = (Class)MKPinAnnotationView;
  -[MKPinAnnotationView description](&v25, sel_description);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView annotation](self, "annotation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "coordinate");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ visible:%d %@"), v18, v3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_pins
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[MKAnnotationView _mapType](self, "_mapType");
  -[MKPinAnnotationView pinTintColor](self, "pinTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPinAnnotationView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKPinAnnotationView _pinsWithMapType:pinColor:traits:](MKPinAnnotationView, "_pinsWithMapType:pinColor:traits:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;

  v17 = a4;
  -[MKPinAnnotationView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v6 == objc_msgSend(v17, "userInterfaceIdiom"))
  {
    -[MKPinAnnotationView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");
    v9 = objc_msgSend(v17, "userInterfaceStyle");

    if (v8 == v9)
      goto LABEL_11;
  }
  else
  {

  }
  -[MKPinAnnotationView _removeAllAnimations](self, "_removeAllAnimations");
  -[MKPinAnnotationView _invalidateImage](self, "_invalidateImage");
  -[MKPinAnnotationView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");
  v12 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v11 != v12)
  {
    -[MKPinAnnotationView traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");
    v15 = 8.0;
    if (v14 == 3)
      v15 = 7.5;
    v16 = -15.0;
    if (v14 == 3)
      v16 = -13.5;
    -[MKAnnotationView setCenterOffset:](self, "setCenterOffset:", v15, v16);

  }
LABEL_11:

}

- (id)_image
{
  void *v2;
  void *v3;

  -[MKPinAnnotationView _pins](self, "_pins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_highlightedImage
{
  void *v2;
  void *v3;

  -[MKPinAnnotationView _pins](self, "_pins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B60);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_floatingImage
{
  void *v2;
  void *v3;

  -[MKPinAnnotationView _pins](self, "_pins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B78);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_pinBounceImages
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;

  -[MKPinAnnotationView _pins](self, "_pins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v16, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158BA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158BC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158BA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithObjects:", v14, v4, v6, v8, v10, objc_msgSend(v11, "CGImage"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_pinJumpImages
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;

  -[MKPinAnnotationView _pins](self, "_pins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v16, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158BA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158BC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158BA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "CGImage");
  objc_msgSend(v2, "objectForKey:", &unk_1E2158B90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithObjects:", v14, v4, v6, v8, v10, objc_msgSend(v11, "CGImage"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_invalidateImage
{
  id v3;

  -[MKPinAnnotationView _image](self, "_image");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView setImage:](self, "setImage:", v3);

}

- (void)_setRotationRadians:(double)a3 withAnimation:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)MKPinAnnotationView;
  -[MKAnnotationView _setRotationRadians:withAnimation:](&v31, sel__setRotationRadians_withAnimation_, a4, a3);
  -[UIImageView superview](self->_shadowView, "superview");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v30.receiver = self;
    v30.super_class = (Class)MKPinAnnotationView;
    v7 = -[MKAnnotationView dragState](&v30, sel_dragState);

    if (v7 == (id)2)
    {
      -[MKPinAnnotationView center](self, "center");
      v9 = v8;
      v11 = v10;
      -[MKPinAnnotationView superview](self, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPinAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v12, v9, v11);
      v14 = v13;
      v16 = v15;

      -[MKPinAnnotationView superview](self, "superview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertPoint:fromView:", self, v14 + 42.8947487, v16 + -40.0);
      v19 = v18;
      v21 = v20;

      -[UIImageView layer](self->_shadowView, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPosition:", v19, v21);

      -[MKAnnotationView _contentLayer](self, "_contentLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "affineTransform");
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
        v27 = 0u;
      }
      -[UIImageView layer](self->_shadowView, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v27;
      v26[1] = v28;
      v26[2] = v29;
      objc_msgSend(v25, "setAffineTransform:", v26);

    }
  }
}

- (void)_updateShadowLayer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[UIImageView superview](self->_shadowView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKPinAnnotationView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "position");
    v6 = v5;
    v8 = v7;

    v9 = v6 + 42.8947487;
    if (self->_state == 4)
    {
      v8 = v8 + -40.0;
      v6 = v6 + 42.8947487;
    }
    -[UIImageView layer](self->_shadowView, "layer", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPosition:", v6, v8);

  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  -[MKPinAnnotationView _removeAllAnimations](self, "_removeAllAnimations");
  if ((self->_state - 3) >= 2)
    v6 = y;
  else
    v6 = y + -40.0;
  v7.receiver = self;
  v7.super_class = (Class)MKPinAnnotationView;
  -[MKPinAnnotationView setCenter:](&v7, sel_setCenter_, x, v6);
  -[MKPinAnnotationView _updateShadowLayer](self, "_updateShadowLayer");
}

- (void)_didUpdatePosition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPinAnnotationView;
  -[MKAnnotationView _didUpdatePosition](&v3, sel__didUpdatePosition);
  -[MKPinAnnotationView _updateShadowLayer](self, "_updateShadowLayer");
}

- (void)_removeAllAnimations
{
  void *v3;
  void *v4;
  id v5;

  -[MKPinAnnotationView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CALayer removeAnimationForKey:](self->super._imageLayer, "removeAnimationForKey:", CFSTR("contents"));
  -[CALayer removeAnimationForKey:](self->super._imageLayer, "removeAnimationForKey:", CFSTR("jump"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("dropGroup"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("jump"));
  -[UIImageView layer](self->_shadowView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("position"));

  -[UIImageView layer](self->_shadowView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("jump"));

}

- (void)_cleanupAfterPinDropAnimation
{
  void *v3;
  id WeakRetained;

  if (self->_state == 2)
    -[UIImageView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  self->_state = 0;
  -[MKPinAnnotationView _removeAllAnimations](self, "_removeAllAnimations");
  -[MKPinAnnotationView _image](self, "_image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView setImage:](self, "setImage:", v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pinDidDrop:animated:", self, 1);

}

- (id)_bounceAnimation:(BOOL)a3 withDelay:(double)a4 addToLayer:(BOOL)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend((id)objc_opt_class(), "_bounceAnimation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setDelegate:", self);
    if (a3)
      -[MKPinAnnotationView _pinBounceImages](self, "_pinBounceImages");
    else
      -[MKPinAnnotationView _pinJumpImages](self, "_pinJumpImages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValues:", v12);

    objc_msgSend(v10, "setDuration:", 0.116666667);
    objc_msgSend(v10, "setRemovedOnCompletion:", 0);
    objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    if (a5)
    {
      -[MKPinAnnotationView layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertTime:fromLayer:", 0, CACurrentMediaTime() + a4);
      objc_msgSend(v10, "setBeginTime:");

      -[CALayer addAnimation:forKey:](self->super._imageLayer, "addAnimation:forKey:", v10, CFSTR("contents"));
      v11 = 0;
    }
    else
    {
      objc_msgSend(v10, "setBeginTime:", a4);
      v11 = (void *)objc_msgSend(v10, "copy");
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_dropFromDistance:(double)a3 maxDistance:(double)a4 withDelay:(double)a5
{
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  float v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  id v40;
  double v41;
  id v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  _OWORD v51[3];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  -[MKPinAnnotationView superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self->_state = 2;
    -[MKPinAnnotationView _floatingImage](self, "_floatingImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setImage:](self, "setImage:", v10);
    -[MKPinAnnotationView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v13 = v12;
    v47 = v10;
    objc_msgSend(v10, "size");
    v46 = v11;
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v13, v14);
    -[UIImageView layer](self->_shadowView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSubview:atIndex:", self->_shadowView, 0);
    -[MKPinAnnotationView center](self, "center");
    v49 = v15;
    objc_msgSend(v15, "setPosition:");
    -[MKAnnotationView _contentLayer](self, "_contentLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v48 = v9;
    if (v16)
    {
      objc_msgSend(v16, "affineTransform");
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
    }
    v51[0] = v52;
    v51[1] = v53;
    v51[2] = v54;
    objc_msgSend(v49, "setAffineTransform:", v51);

    -[MKAnnotationView setHidden:](self, "setHidden:", 1);
    -[UIImageView setHidden:](self->_shadowView, "setHidden:", 1);
    v18 = CACurrentMediaTime();
    UIAnimationDragCoefficient();
    v20 = v18 + v19 * a5;
    v21 = fmin((a3 / a4 + (1.0 - a3 / a4) * 0.5) * 0.349999994, 3.0);
    +[MKPinAnnotationView _dropBounceAnimation](MKPinAnnotationView, "_dropBounceAnimation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDuration:", v21 + 0.116666667);
    -[MKPinAnnotationView layer](self, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertTime:fromLayer:", 0, v20);
    objc_msgSend(v22, "setBeginTime:");

    objc_msgSend(v22, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CD3058];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTimingFunction:", v26);

    objc_msgSend(v24, "setDuration:", v21);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -4.0 - a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFromValue:", v27);

    objc_msgSend(v24, "setToValue:", &unk_1E2158BD8);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(v28, "addObject:", v24);
    -[MKPinAnnotationView _bounceAnimation:withDelay:addToLayer:](self, "_bounceAnimation:withDelay:addToLayer:", 1, 0, v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPinAnnotationView layer](self, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertTime:fromLayer:", 0, v21 + v20);
    objc_msgSend(v29, "setBeginTime:");

    v45 = v28;
    objc_msgSend(v22, "setAnimations:", v28);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTimingFunction:", v32);

    objc_msgSend(v31, "setDuration:", v21);
    objc_msgSend(v49, "convertTime:fromLayer:", 0, v20);
    objc_msgSend(v31, "setBeginTime:");
    objc_msgSend(v31, "setRemovedOnCompletion:", 1);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.x"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (-4.0 - a3) * -1.07236872);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFromValue:", v34);

    objc_msgSend(v33, "setToValue:", &unk_1E2158BD8);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -4.0 - a3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFromValue:", v36);

    objc_msgSend(v35, "setToValue:", &unk_1E2158BD8);
    v55[0] = v33;
    v55[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAnimations:", v37);

    v38 = v22;
    UIAnimationDragCoefficient();
    if (*(float *)&v39 != 0.0 && *(float *)&v39 != 1.0)
    {
      *(float *)&v39 = 1.0 / *(float *)&v39;
      objc_msgSend(v38, "setSpeed:", v39);
    }

    v40 = v29;
    UIAnimationDragCoefficient();
    if (*(float *)&v41 != 0.0 && *(float *)&v41 != 1.0)
    {
      *(float *)&v41 = 1.0 / *(float *)&v41;
      objc_msgSend(v40, "setSpeed:", v41);
    }

    v42 = v31;
    UIAnimationDragCoefficient();
    if (*(float *)&v43 != 0.0 && *(float *)&v43 != 1.0)
    {
      *(float *)&v43 = 1.0 / *(float *)&v43;
      objc_msgSend(v42, "setSpeed:", v43);
    }

    -[MKPinAnnotationView layer](self, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addAnimation:forKey:", v38, CFSTR("dropGroup"));

    -[CALayer addAnimation:forKey:](self->super._imageLayer, "addAnimation:forKey:", v40, CFSTR("contents"));
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __63__MKPinAnnotationView__dropFromDistance_maxDistance_withDelay___block_invoke;
    v50[3] = &unk_1E20D82F8;
    v50[4] = self;
    objc_msgSend(v49, "_mapkit_addAnimation:forKey:completion:", v42, CFSTR("position"), v50);

    v9 = v48;
  }

}

uint64_t __63__MKPinAnnotationView__dropFromDistance_maxDistance_withDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setHidden:", 1);
}

- (void)_dropAfterDraggingAndRevertPosition:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[9];
  _QWORD v48[5];
  id v49;
  double v50;
  double v51;
  BOOL v52;
  _QWORD v53[5];

  v4 = a4;
  -[MKAnnotationView _containerView](self, "_containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView coordinate](self, "coordinate");
  objc_msgSend(v7, "pointForCoordinate:");
  v9 = v8;
  v11 = v10;

  -[MKAnnotationView centerOffset](self, "centerOffset");
  v13 = v9 + v12;
  -[MKAnnotationView centerOffset](self, "centerOffset");
  v15 = v11 + v14;
  -[MKPinAnnotationView _floatingImage](self, "_floatingImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView setImage:](self, "setImage:", v16);

  v17 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke;
  v53[3] = &unk_1E20D7D98;
  v53[4] = self;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_2;
  v48[3] = &unk_1E20DA810;
  v52 = v4;
  v48[4] = self;
  v50 = v13;
  v51 = v15;
  v18 = (id)MEMORY[0x18D778DB8](v53);
  v49 = v18;
  v19 = MEMORY[0x18D778DB8](v48);
  v20 = (void *)v19;
  if (a3)
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  else
  {
    -[MKPinAnnotationView center](self, "center");
    v22 = v21;
    v24 = v23;
    -[MKPinAnnotationView superview](self, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPinAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v25, v22, v24);
    v27 = v26;
    v29 = v28;

    v30 = v29 + -36.0;
    v31 = v27 + 42.8947487;
    v32 = v30 + -40.0;
    -[MKPinAnnotationView superview](self, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertPoint:fromView:", self, v27, v30);
    v35 = v34;
    v37 = v36;

    -[MKPinAnnotationView superview](self, "superview");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "convertPoint:fromView:", self, v31, v32);
    v40 = v39;
    v42 = v41;

    v43 = (void *)MEMORY[0x1E0CEABB0];
    if (v4)
      v44 = 0.200000003;
    else
      v44 = 0.0;
    v47[0] = v17;
    v47[1] = 3221225472;
    v47[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_5;
    v47[3] = &unk_1E20D8E40;
    v47[4] = self;
    v47[5] = v35;
    v47[6] = v37;
    v47[7] = v40;
    v47[8] = v42;
    v45[0] = v17;
    v45[1] = 3221225472;
    v45[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_6;
    v45[3] = &unk_1E20D8688;
    v46 = v20;
    objc_msgSend(v43, "animateWithDuration:delay:options:animations:completion:", 0, v47, v45, v44, 0.0);

  }
}

id __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1056) = 5;
  return (id)objc_msgSend(*(id *)(a1 + 32), "_bounceAnimation:withDelay:addToLayer:", 1, 1, 0.0);
}

void __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_2(uint64_t a1)
{
  void *v1;
  char v2;
  double v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;
  _QWORD v8[4];
  uint64_t v9;
  __int128 v10;

  v1 = (void *)MEMORY[0x1E0CEABB0];
  v2 = *(_BYTE *)(a1 + 64);
  if (v2)
    v3 = 0.200000003;
  else
    v3 = 0.0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_3;
  v8[3] = &unk_1E20DA7C0;
  v4 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_4;
  v5[3] = &unk_1E20DA7E8;
  v5[4] = v9;
  v7 = v2;
  v6 = v4;
  objc_msgSend(v1, "animateWithDuration:delay:options:animations:completion:", 4, v8, v5, v3, 0.0);

}

void __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", v2, v3);

  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", v5, v6);

}

uint64_t __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "removeFromSuperview");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_updateEffectiveZPriority");
  if (!_MKLinkedOnOrAfterReleaseSet(2053) || (result = _MKLinkedOnOrAfterReleaseSet(2310), (_DWORD)result))
    result = objc_msgSend(*(id *)(a1 + 32), "setDragState:animated:", 0, 0);
  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1056) = 0;
  return result;
}

void __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_5(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", v2, v3);

  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", v5, v6);

}

uint64_t __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDragState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MKPinAnnotationView;
  if (-[MKAnnotationView dragState](&v8, sel_dragState) != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MKPinAnnotationView;
    -[MKAnnotationView setDragState:animated:](&v7, sel_setDragState_animated_, a3, v4);
    if (a3 == 1)
    {
      -[MKPinAnnotationView _liftForDraggingAnimated:](self, "_liftForDraggingAnimated:", v4);
    }
    else if (a3 - 3 <= 1)
    {
      -[MKPinAnnotationView _dropAfterDraggingAndRevertPosition:animated:](self, "_dropAfterDraggingAndRevertPosition:animated:", a3 == 3, v4);
    }
  }
}

- (void)_liftForDraggingAnimated:(BOOL)a3
{
  id v3;

  self->_state = 6;
  if (a3)
    v3 = -[MKPinAnnotationView _bounceAnimation:withDelay:addToLayer:](self, "_bounceAnimation:withDelay:addToLayer:", 0, 1, 0.0);
  else
    -[MKPinAnnotationView _liftForDraggingAfterBounceAnimated:](self, "_liftForDraggingAfterBounceAnimated:");
}

- (void)_liftForDraggingAfterBounceAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  _QWORD v33[5];
  BOOL v34;
  _QWORD v35[9];

  v3 = a3;
  self->_state = 3;
  -[CALayer removeAnimationForKey:](self->super._imageLayer, "removeAnimationForKey:", CFSTR("contents"));
  -[MKPinAnnotationView _floatingImage](self, "_floatingImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAnnotationView setImage:](self, "setImage:", v5);

  -[MKPinAnnotationView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "position");
  v8 = v7;
  v10 = v9;

  -[UIImageView superview](self->_shadowView, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[UIImageView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  -[UIImageView layer](self->_shadowView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllAnimations");

  -[MKPinAnnotationView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertSubview:atIndex:", self->_shadowView, 0);

  -[UIImageView setCenter:](self->_shadowView, "setCenter:", v8, v10);
  -[MKPinAnnotationView superview](self, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPinAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v14, v8, v10);
  v16 = v15;
  v18 = v17;

  v19 = v18 + -40.0;
  v20 = v16 + 42.8947487;
  v21 = v19 + -40.0;
  -[MKPinAnnotationView superview](self, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertPoint:fromView:", self, v16, v19);
  v24 = v23;
  v26 = v25;

  -[MKPinAnnotationView superview](self, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "convertPoint:fromView:", self, v20, v21);
  v29 = v28;
  v31 = v30;

  v32 = 0.200000003;
  if (!v3)
    v32 = 0.0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke;
  v35[3] = &unk_1E20D8E40;
  v35[4] = self;
  v35[5] = v24;
  v35[6] = v26;
  v35[7] = v29;
  v35[8] = v31;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke_2;
  v33[3] = &unk_1E20D8348;
  v33[4] = self;
  v34 = v3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v35, v33, v32);
}

void __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", v2, v3);

  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "_contentLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "affineTransform");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  objc_msgSend(v10, "setAffineTransform:", v11);

}

uint64_t __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke_2(uint64_t a1)
{
  const __CFString *v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = CFSTR("MKPinAnnotationView_LiftAnimation");
  else
    v1 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_liftDidEnd:", v1);
}

- (void)_liftDidEnd:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  self->_state = 4;
  if (-[MKAnnotationView dragState](self, "dragState") == MKAnnotationViewDragStateStarting)
  {
    -[MKPinAnnotationView setDragState:animated:](self, "setDragState:animated:", 2, objc_msgSend(v5, "length") != 0);
    -[MKPinAnnotationView _floatingImage](self, "_floatingImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setImage:](self, "setImage:", v4);

  }
  else
  {
    -[MKPinAnnotationView _dropAfterDraggingAndRevertPosition:animated:](self, "_dropAfterDraggingAndRevertPosition:animated:", 1, 1);
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  int state;
  id v8;

  v5 = a3;
  state = self->_state;
  if (state == 2 || state == 5)
  {
    v8 = v5;
    -[MKPinAnnotationView _cleanupAfterPinDropAnimation](self, "_cleanupAfterPinDropAnimation");
LABEL_9:
    v5 = v8;
    goto LABEL_10;
  }
  if (state == 6)
  {
    self->_state = 3;
    v8 = v5;
    -[MKPinAnnotationView _liftForDraggingAfterBounceAnimated:](self, "_liftForDraggingAfterBounceAnimated:", 1);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)animationDidStart:(id)a3
{
  -[MKAnnotationView setHidden:](self, "setHidden:", 0);
  -[UIImageView setHidden:](self->_shadowView, "setHidden:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int state;
  BOOL v6;
  int v7;
  void *v9;
  objc_super v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPinAnnotationView;
  if (-[MKAnnotationView isHighlighted](&v11, sel_isHighlighted) != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKPinAnnotationView;
    -[MKAnnotationView setHighlighted:](&v10, sel_setHighlighted_, v3);
    if (-[MKAnnotationView dragState](self, "dragState") == MKAnnotationViewDragStateNone)
    {
      state = self->_state;
      v6 = state > 5;
      v7 = (1 << state) & 0x34;
      if (v6 || v7 == 0)
      {
        if (v3)
          -[MKPinAnnotationView _highlightedImage](self, "_highlightedImage");
        else
          -[MKPinAnnotationView _image](self, "_image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKAnnotationView setImage:](self, "setImage:", v9);

      }
    }
  }
}

- (BOOL)isHighlighted
{
  objc_super v4;

  if (-[MKAnnotationView dragState](self, "dragState"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MKPinAnnotationView;
  return -[MKAnnotationView isHighlighted](&v4, sel_isHighlighted);
}

- (int)_state
{
  return self->_state;
}

- (void)_updateAnchorPosition:(CGPoint)a3 alignToPixels:(BOOL)a4
{
  objc_super v4;

  if (self->_state != 4)
  {
    v4.receiver = self;
    v4.super_class = (Class)MKPinAnnotationView;
    -[MKAnnotationView _updateAnchorPosition:alignToPixels:](&v4, sel__updateAnchorPosition_alignToPixels_, a4, a3.x, a3.y);
  }
}

- (_MKPinAnnotationViewDelegate)_delegate
{
  return (_MKPinAnnotationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinTintColor, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
