@implementation MKUserLocationHeadingArrowLayer

- (MKUserLocationHeadingArrowLayer)initWithUserLocationView:(id)a3
{
  id v4;
  MKUserLocationHeadingArrowLayer *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  MKUserLocationHeadingArrowLayer *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKUserLocationHeadingArrowLayer;
  v5 = -[MKUserLocationHeadingArrowLayer init](&v12, sel_init);
  if (v5)
  {
    GEOConfigGetDouble();
    v5->_maxUncertaintyAngleToShowArrow = v6;
    objc_msgSend((id)objc_opt_class(), "innerDiameter");
    v8 = v7 * 0.5 + 1.0;
    v5->_baseRadius = v8;
    v5->_tipRadius = v8 + 5.0;
    v5->_baseHalfAngle = asin(9.0 / (v5->_baseRadius + v5->_baseRadius));
    -[MKUserLocationHeadingArrowLayer setBounds:](v5, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v5->_tipRadius + v5->_tipRadius, v5->_tipRadius + v5->_tipRadius);
    objc_storeWeak((id *)&v5->_userLocationView, v4);
    -[MKUserLocationHeadingArrowLayer setName:](v5, "setName:", CFSTR("heading"));
    -[MKUserLocationHeadingArrowLayer setAnchorPoint:](v5, "setAnchorPoint:", 0.5, 0.5);
    -[MKUserLocationHeadingArrowLayer setZPosition:](v5, "setZPosition:", 100.0);
    -[MKUserLocationHeadingArrowLayer _positionWhenVisible:](v5, "_positionWhenVisible:", 1);
    -[MKUserLocationHeadingArrowLayer setPosition:](v5, "setPosition:");
    -[MKUserLocationHeadingArrowLayer setPath:](v5, "setPath:", -[MKUserLocationHeadingArrowLayer _pathWhenVisible:](v5, "_pathWhenVisible:", 1));
    objc_msgSend(v4, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKUserLocationHeadingArrowLayer updateTintColor:](v5, "updateTintColor:", v9);

    objc_msgSend(v4, "heading");
    -[MKUserLocationHeadingArrowLayer updateHeading:](v5, "updateHeading:");
    v10 = v5;
  }

  return v5;
}

- (void)updateHeading:(double)a3
{
  CGFloat v4;
  CATransform3D v5;
  CATransform3D v6;

  v4 = a3 * 0.0174532925;
  -[MKUserLocationHeadingArrowLayer setHeadingRadians:](self, "setHeadingRadians:", a3 * 0.0174532925);
  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeRotation(&v6, v4, 0.0, 0.0, 1.0);
  v5 = v6;
  -[MKUserLocationHeadingArrowLayer setTransform:](self, "setTransform:", &v5);
}

- (void)updateHeadingAccuracy:(double)a3 previousAccuracy:(double)a4
{
  _BOOL8 v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = -[MKUserLocationHeadingArrowLayer _shouldBeVisibleForAccuracy:](self, "_shouldBeVisibleForAccuracy:", a3, a4);
  if (v5 == -[MKUserLocationHeadingArrowLayer isHidden](self, "isHidden"))
  {
    -[MKUserLocationHeadingArrowLayer setHidden:](self, "setHidden:", 0);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__MKUserLocationHeadingArrowLayer_updateHeadingAccuracy_previousAccuracy___block_invoke;
    v6[3] = &unk_1E20D8348;
    v6[4] = self;
    v7 = v5;
    -[MKUserLocationHeadingArrowLayer animateToSetVisible:completion:](self, "animateToSetVisible:completion:", v5, v6);
  }
}

uint64_t __74__MKUserLocationHeadingArrowLayer_updateHeadingAccuracy_previousAccuracy___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setHidden:", *(_BYTE *)(result + 40) == 0);
  return result;
}

- (BOOL)_shouldBeVisibleForAccuracy:(double)a3
{
  return self->_maxUncertaintyAngleToShowArrow >= a3;
}

- (void)updateTintColor:(id)a3
{
  -[MKUserLocationHeadingArrowLayer setFillColor:](self, "setFillColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

- (void)animateToSetVisible:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  const __CFString *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[MKUserLocationHeadingArrowLayer _animationToSetVisible:](self, "_animationToSetVisible:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CALayer _mapkit_removeAnimationImmediatelyForKey:](self, "_mapkit_removeAnimationImmediatelyForKey:", CFSTR("headingHideAnimation"));
    -[CALayer _mapkit_removeAnimationImmediatelyForKey:](self, "_mapkit_removeAnimationImmediatelyForKey:", CFSTR("headingShowAnimation"));
    -[MKUserLocationHeadingArrowLayer _positionWhenVisible:](self, "_positionWhenVisible:", v4);
    -[MKUserLocationHeadingArrowLayer setPosition:](self, "setPosition:");
    -[MKUserLocationHeadingArrowLayer setPath:](self, "setPath:", -[MKUserLocationHeadingArrowLayer _pathWhenVisible:](self, "_pathWhenVisible:", v4));
    if (v4)
      v7 = CFSTR("headingShowAnimation");
    else
      v7 = CFSTR("headingHideAnimation");
    -[CALayer _mapkit_addAnimation:forKey:completion:](self, "_mapkit_addAnimation:forKey:completion:", v6, v7, v8);
  }

}

- (id)_animationToSetVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v3 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", -[MKUserLocationHeadingArrowLayer _pathWhenVisible:](self, "_pathWhenVisible:", v3 ^ 1));
  objc_msgSend(v5, "setToValue:", -[MKUserLocationHeadingArrowLayer _pathWhenVisible:](self, "_pathWhenVisible:", v3));
  objc_msgSend(v5, "setDamping:", 2.0);
  objc_msgSend(v5, "setDuration:", 0.300000012);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3B18];
  -[MKUserLocationHeadingArrowLayer _positionWhenVisible:](self, "_positionWhenVisible:", v3 ^ 1);
  objc_msgSend(v7, "valueWithCGPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v8);

  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[MKUserLocationHeadingArrowLayer _positionWhenVisible:](self, "_positionWhenVisible:", v3);
  objc_msgSend(v9, "valueWithCGPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v10);

  objc_msgSend(v6, "setDuration:", 0.300000012);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAnimations:", v12);

  objc_msgSend(v11, "setDuration:", 0.300000012);
  return v11;
}

- (CGPath)_pathWhenVisible:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  id v8;
  CGPath *v9;

  v3 = a3;
  -[MKUserLocationHeadingArrowLayer _baseRadiusWhenVisible:](self, "_baseRadiusWhenVisible:");
  v6 = v5;
  -[MKUserLocationHeadingArrowLayer _tipRadiusWhenVisible:](self, "_tipRadiusWhenVisible:", v3);
  -[MKUserLocationHeadingArrowLayer _bezierPathWithBaseRadius:tipRadius:baseHalfAngle:](self, "_bezierPathWithBaseRadius:tipRadius:baseHalfAngle:", v6, v7, self->_baseHalfAngle);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (CGPath *)objc_msgSend(v8, "CGPath");

  return v9;
}

- (id)_bezierPathWithBaseRadius:(double)a3 tipRadius:(double)a4 baseHalfAngle:(double)a5
{
  double MidX;
  double MidY;
  void *v11;
  CGRect v13;
  CGRect v14;

  -[MKUserLocationHeadingArrowLayer bounds](self, "bounds");
  MidX = CGRectGetMidX(v13);
  -[MKUserLocationHeadingArrowLayer bounds](self, "bounds");
  MidY = CGRectGetMidY(v14);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, a3, 4.71238898 - a5, a5 + 4.71238898);
  objc_msgSend(v11, "addLineToPoint:", MidX, MidY - a4);
  objc_msgSend(v11, "closePath");
  return v11;
}

- (CGPoint)_positionWhenVisible:(BOOL)a3
{
  double v3;
  double v4;
  double baseRadius;
  double v7;
  double v8;
  __double2 v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!a3)
  {
    baseRadius = self->_baseRadius;
    -[MKUserLocationHeadingArrowLayer _baseRadiusWhenVisible:](self, "_baseRadiusWhenVisible:", 0);
    v8 = baseRadius - v7;
    v9 = __sincos_stret(self->_headingRadians);
    v4 = v4 - v8 * v9.__sinval;
    v3 = v3 + v8 * v9.__cosval;
  }
  v10 = v4;
  v11 = v3;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)_baseRadiusWhenVisible:(BOOL)a3
{
  id WeakRetained;
  double v6;
  double v7;

  if (a3)
    return self->_baseRadius;
  +[_MKPuckAnnotationView innerDiameter](_MKPuckAnnotationView, "innerDiameter");
  WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
  UIRoundToViewScale();
  v7 = v6;

  return v7;
}

- (double)_tipRadiusWhenVisible:(BOOL)a3
{
  double result;

  if (a3)
    return self->_tipRadius;
  -[MKUserLocationHeadingArrowLayer _baseRadiusWhenVisible:](self, "_baseRadiusWhenVisible:");
  return result;
}

- (_MKPuckAnnotationView)userLocationView
{
  return (_MKPuckAnnotationView *)objc_loadWeakRetained((id *)&self->_userLocationView);
}

- (double)headingRadians
{
  return self->_headingRadians;
}

- (void)setHeadingRadians:(double)a3
{
  self->_headingRadians = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (double)minimumAccuracyRadius
{
  return self->_minimumAccuracyRadius;
}

- (void)setMinimumAccuracyRadius:(double)a3
{
  self->_minimumAccuracyRadius = a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userLocationView);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
