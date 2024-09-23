@implementation MKRotationFilter

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKRotationFilter)initWithMapLayer:(id)a3
{
  id v4;
  MKRotationFilter *v5;
  MKRotationFilter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKRotationFilter;
  v5 = -[MKRotationFilter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_mapLayer, v4);

  return v6;
}

- (MKRotationFilter)init
{
  MKRotationFilter *result;

  result = (MKRotationFilter *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3 withSnapping:(BOOL)a4
{
  double y;
  double x;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  id v11;
  double v12;
  id v13;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RotationFilterSnappingThreshold"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "doubleValue");
    kRotationSnappingThreshold = v9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(WeakRetained, "startRotatingWithFocusPoint:", x, y);

  v11 = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(v11, "yaw");
  self->_gestureStartAngle = v12;

  self->_snappingEnabled = a4;
  -[MKRotationFilter updateSnappedToNorth](self, "updateSnappedToNorth");
  self->_snappedAtStart = self->_snappedToNorth;

}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  double y;
  double x;
  double v7;
  CGFloat v8;
  long double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double additionalSnappingAngle;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  id WeakRetained;
  CGFloat v23;
  id v24;

  y = a3.y;
  x = a3.x;
  v7 = a4 * 57.2957795;
  if (!self->_snappingEnabled)
    goto LABEL_35;
  v23 = a3.x;
  v8 = a3.y;
  v9 = self->_gestureStartAngle + a4 * -57.2957795;
  v10 = fmod(v9, 360.0);
  if (v9 >= 0.0)
    v11 = v10;
  else
    v11 = v10 + 360.0;
  v12 = 0.0;
  v13 = vabdd_f64(0.0, v11);
  if (v13 <= 180.0)
    goto LABEL_8;
  if (v11 > 0.0)
  {
    v12 = 360.0;
LABEL_8:
    v14 = v11;
    goto LABEL_10;
  }
  v14 = v11 + 360.0;
LABEL_10:
  v15 = v14 - v12;
  additionalSnappingAngle = self->_additionalSnappingAngle;
  v17 = fmod(additionalSnappingAngle, 360.0);
  if (additionalSnappingAngle < 0.0)
    v17 = v17 + 360.0;
  v18 = vabdd_f64(v17, v11);
  v19 = v17;
  v20 = v11;
  if (v18 > 180.0)
  {
    if (v17 >= v11)
    {
      v20 = v11 + 360.0;
      v19 = v17;
    }
    else
    {
      v19 = v17 + 360.0;
      v20 = v11;
    }
  }
  if (fabs(v15) >= *(double *)&kRotationSnappingThreshold)
  {
    if (vabdd_f64(v20, v19) >= *(double *)&kRotationSnappingThreshold)
    {
      v21 = 0;
      goto LABEL_25;
    }
    if (!self->_snappedAtStart)
    {
      if (v18 > 180.0)
      {
        y = v8;
        x = v23;
        if (v17 >= v11)
          v11 = v11 + 360.0;
        else
          v17 = v17 + 360.0;
        goto LABEL_31;
      }
LABEL_30:
      y = v8;
      x = v23;
LABEL_31:
      v7 = v7 + v11 - v17;
      v21 = 1;
      goto LABEL_32;
    }
  }
  else if (!self->_snappedAtStart)
  {
    v17 = 0.0;
    if (v13 > 180.0)
    {
      if (v11 <= 0.0)
        v11 = v11 + 360.0;
      else
        v17 = 360.0;
    }
    goto LABEL_30;
  }
  v21 = 1;
LABEL_25:
  y = v8;
  x = v23;
LABEL_32:
  if (self->_snappedToNorth != (_DWORD)v21)
  {
    -[MKRotationFilter setSnappedToNorth:](self, "setSnappedToNorth:", v21);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "rotationFilter:didChangeSnapping:", self, v21);

    if ((v21 & 1) == 0)
      self->_snappedAtStart = 0;
  }
LABEL_35:
  v24 = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(v24, "updateRotationWithFocusPoint:newValue:", x, y, v7 * 0.0174532925);

}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(WeakRetained, "stopRotatingWithFocusPoint:", x, y);

}

- (void)snapToNorthAnimated:(BOOL)a3 forceTrueNorth:(BOOL)a4
{
  _BOOL8 v5;
  double additionalSnappingAngle;
  id WeakRetained;
  double v9;
  long double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;

  v5 = a3;
  additionalSnappingAngle = 0.0;
  if (-[MKRotationFilter hasAdditionalSnappingAngle](self, "hasAdditionalSnappingAngle") && !a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
    objc_msgSend(WeakRetained, "yaw");
    v10 = v9;

    v11 = fmod(v10, 360.0);
    if (v10 >= 0.0)
      v12 = v11;
    else
      v12 = v11 + 360.0;
    v13 = 0.0;
    if (fabs(v12) <= 180.0)
    {
      v14 = v12;
    }
    else
    {
      v14 = v12;
      v13 = 360.0;
      if (v12 < 0.0)
      {
        v14 = v12 + 360.0;
        v13 = 0.0;
      }
    }
    v15 = vabdd_f64(v13, v14);
    additionalSnappingAngle = self->_additionalSnappingAngle;
    v16 = fmod(additionalSnappingAngle, 360.0);
    if (additionalSnappingAngle < 0.0)
      v16 = v16 + 360.0;
    if (vabdd_f64(v12, v16) > 180.0)
    {
      if (v12 >= v16)
        v16 = v16 + 360.0;
      else
        v12 = v12 + 360.0;
    }
    if (v15 >= 0.1)
    {
      v17 = vabdd_f64(v16, v12);
      if (v15 < v17 || v17 < 0.1)
        additionalSnappingAngle = 0.0;
    }
  }
  v19 = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(v19, "setYaw:animated:", v5, additionalSnappingAngle);

}

- (void)updateSnappedToNorth
{
  VKMapView **p_mapLayer;
  long double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  long double v9;
  double v10;
  long double additionalSnappingAngle;
  double v12;
  double v13;
  double v14;
  id WeakRetained;

  p_mapLayer = &self->_mapLayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(WeakRetained, "yaw");
  v5 = v4;
  v6 = fmod(v4, 360.0);
  if (v5 < 0.0)
    v6 = v6 + 360.0;
  v7 = 0.0;
  if (fabs(v6) > 180.0)
  {
    if (v6 >= 0.0)
      v7 = 360.0;
    else
      v6 = v6 + 360.0;
  }
  if (vabdd_f64(v7, v6) < 0.1)
  {
    -[MKRotationFilter setSnappedToNorth:](self, "setSnappedToNorth:", 1);
  }
  else
  {
    v8 = objc_loadWeakRetained((id *)p_mapLayer);
    objc_msgSend(v8, "yaw");
    v10 = v9;
    additionalSnappingAngle = self->_additionalSnappingAngle;
    v12 = fmod(v9, 360.0);
    if (v10 >= 0.0)
      v13 = v12;
    else
      v13 = v12 + 360.0;
    v14 = fmod(additionalSnappingAngle, 360.0);
    if (additionalSnappingAngle < 0.0)
      v14 = v14 + 360.0;
    if (vabdd_f64(v13, v14) > 180.0)
    {
      if (v13 >= v14)
        v14 = v14 + 360.0;
      else
        v13 = v13 + 360.0;
    }
    -[MKRotationFilter setSnappedToNorth:](self, "setSnappedToNorth:", vabdd_f64(v14, v13) < 0.1);

  }
}

- (BOOL)hasAdditionalSnappingAngle
{
  long double additionalSnappingAngle;
  double v3;
  double v4;

  additionalSnappingAngle = self->_additionalSnappingAngle;
  v3 = fmod(additionalSnappingAngle, 360.0);
  if (additionalSnappingAngle < 0.0)
    v3 = v3 + 360.0;
  v4 = 0.0;
  if (vabdd_f64(0.0, v3) > 180.0)
  {
    if (v3 <= 0.0)
      v3 = v3 + 360.0;
    else
      v4 = 360.0;
  }
  return vabdd_f64(v3, v4) >= 0.1;
}

- (BOOL)isSnappedToNorth
{
  return self->_snappedToNorth;
}

- (void)setSnappedToNorth:(BOOL)a3
{
  self->_snappedToNorth = a3;
}

- (double)additionalSnappingAngle
{
  return self->_additionalSnappingAngle;
}

- (void)setAdditionalSnappingAngle:(double)a3
{
  self->_additionalSnappingAngle = a3;
}

- (MKRotationFilterDelegate)delegate
{
  return (MKRotationFilterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_mapLayer);
}

@end
