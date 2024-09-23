@implementation FMDeviceAnnotationView

- (FMDeviceAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  FMDeviceAnnotationView *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDeviceAnnotationView;
  v4 = -[FMDeviceAnnotationView initWithAnnotation:reuseIdentifier:](&v8, "initWithAnnotation:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)CAShapeLayer);
    -[FMDeviceAnnotationView setBalloonLayer:](v4, "setBalloonLayer:", v5);

    v6 = objc_alloc_init((Class)CALayer);
    -[FMDeviceAnnotationView setBalloonImage:](v4, "setBalloonImage:", v6);

    -[FMDeviceAnnotationView setCanShowCallout:](v4, "setCanShowCallout:", 1);
    -[FMDeviceAnnotationView _setupLayers](v4, "_setupLayers");
    -[FMDeviceAnnotationView _updateAppearance](v4, "_updateAppearance");
  }
  return v4;
}

- (FMDeviceAnnotationView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDeviceAnnotationView;
  return -[FMDeviceAnnotationView initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)prepareForDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDeviceAnnotationView;
  -[FMDeviceAnnotationView prepareForDisplay](&v4, "prepareForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView annotation](self, "annotation"));
  -[FMDeviceAnnotationView _updateAnnotation:](self, "_updateAnnotation:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDeviceAnnotationView;
  -[FMDeviceAnnotationView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[FMDeviceAnnotationView _updateAppearance](self, "_updateAppearance");
}

- (void)_setupLayers
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[8];

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView _bezierPathWithBalloonRadius:tailLength:](self, "_bezierPathWithBalloonRadius:tailLength:", 30.0, 7.5)));
  v4 = objc_msgSend(v3, "CGPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  objc_msgSend(v5, "setPath:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  objc_msgSend(v6, "setFrame:", 4.0, 0.0, 60.0, 67.5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonImage](self, "balloonImage"));
  objc_msgSend(v7, "addSublayer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  objc_msgSend(v10, "bounds");
  -[FMDeviceAnnotationView _applyCircularShadowToLayer:bounds:](self, "_applyCircularShadowToLayer:bounds:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView layer](self, "layer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  objc_msgSend(v11, "addSublayer:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView layer](self, "layer"));
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, 68.0, 161.0);

  -[FMDeviceAnnotationView _updateDynamicLayers](self, "_updateDynamicLayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  v15 = *(_OWORD *)&CATransform3DIdentity.m33;
  v19[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v19[5] = v15;
  v16 = *(_OWORD *)&CATransform3DIdentity.m43;
  v19[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v19[7] = v16;
  v17 = *(_OWORD *)&CATransform3DIdentity.m13;
  v19[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v19[1] = v17;
  v18 = *(_OWORD *)&CATransform3DIdentity.m23;
  v19[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v19[3] = v18;
  objc_msgSend(v14, "setTransform:", v19);

}

- (void)_updateDynamicLayers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonImage](self, "balloonImage"));
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, 60.0, 60.0);

}

- (void)_updateAnnotation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  -[FMDeviceAnnotationView _updateDynamicLayers](self, "_updateDynamicLayers", a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView deviceImage](self, "deviceImage")));
  v5 = objc_msgSend(v4, "CGImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonImage](self, "balloonImage"));
  objc_msgSend(v6, "setContents:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView layer](self, "layer"));
  objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.5);

}

- (void)_updateAppearance
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v8 = objc_retainAutorelease(v5);
  v6 = objc_msgSend(v8, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDeviceAnnotationView balloonLayer](self, "balloonLayer"));
  objc_msgSend(v7, "setFillColor:", v6);

}

- (id)_bezierPathWithBalloonRadius:(double)a3 tailLength:(double)a4
{
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v12;
  double v13;

  v12 = a4 / 6.0;
  v6 = a3 * 0.448;
  v13 = a3 * 0.385;
  v7 = a4 / 3.0;
  v8 = objc_alloc_init((Class)UIBezierPath);
  objc_msgSend(v8, "moveToPoint:", a3 + a3, a3);
  v9 = a4 * 0.5;
  objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", v7 + a4 * 0.5 + a3, a3 + a3, a3 + a3);
  v10 = a3 + a3 + a4;
  objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", a3, v10, v7 + a3, a3 + a3 + v7, v12 + a3, v10);
  objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", a3 - (v9 + v7), a3 + a3, a3 - v12, v10, a3 - v7, a3 + a3 + v7);
  objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 0.0, a3, v13, a3 + a3 - v7, 0.0, a3 * 1.5);
  objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", a3, 0.0, 0.0, v6, v6, 0.0);
  objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", a3 + a3, a3, a3 + a3 - v6, 0.0, a3 + a3, v6);
  objc_msgSend(v8, "closePath");
  return v8;
}

- (void)_applyCircularShadowToLayer:(id)a3 bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v8;
  id v9;
  CGPathRef v10;
  id v11;
  double v12;
  CGAffineTransform v13;
  CGRect v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v13.c = v8;
  *(_OWORD *)&v13.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v9 = a3;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v10 = CGPathCreateWithEllipseInRect(v14, &v13);
  objc_msgSend(v9, "setShadowPath:", v10, *(_OWORD *)&v13.a, *(_OWORD *)&v13.c, *(_OWORD *)&v13.tx);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  objc_msgSend(v9, "setShadowColor:", objc_msgSend(v11, "CGColor"));

  objc_msgSend(v9, "setShadowOffset:", 0.0, 0.0);
  LODWORD(v12) = 1045220557;
  objc_msgSend(v9, "setShadowOpacity:", v12);
  objc_msgSend(v9, "setShadowRadius:", 4.0);

}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImage, a3);
}

- (CAShapeLayer)balloonLayer
{
  return self->_balloonLayer;
}

- (void)setBalloonLayer:(id)a3
{
  objc_storeStrong((id *)&self->_balloonLayer, a3);
}

- (CALayer)balloonImage
{
  return self->_balloonImage;
}

- (void)setBalloonImage:(id)a3
{
  objc_storeStrong((id *)&self->_balloonImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonImage, 0);
  objc_storeStrong((id *)&self->_balloonLayer, 0);
  objc_storeStrong((id *)&self->_deviceImage, 0);
}

@end
