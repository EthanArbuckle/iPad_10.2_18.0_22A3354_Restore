@implementation _MKPuckAccuracyLayer

- (void)_updateColors
{
  unint64_t v3;
  void *v4;
  UIColor *v5;
  UIColor *v6;
  unint64_t mapType;
  float v8;
  double v9;
  id v10;
  UIColor *v11;
  UIColor *fullOpacityStrokeColor;
  double *p_baseStrokeOpacity;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  double mapPitchRadians;
  float v19;
  double v20;
  double v21;
  long double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  double v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  id v37;
  id v38;
  double v39;
  UIColor *v40;
  double v41;
  UIColor *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CEA000uLL;
  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", self->_traitCollection);
  if (self->_stale)
  {
    _MKPuckAnnotationViewInnerStaleColor();
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_tintColor;
  }
  v6 = v5;
  mapType = self->_mapType;
  if (mapType - 1 < 4 || (v8 = 1.0, mapType == 107))
    v8 = 2.0;
  v9 = (float)(v8 * flt_18B2AFA20[!self->_stale]);
  objc_storeStrong((id *)&self->_fullOpacityFillColor, v5);
  self->_baseOpacity = v9;
  -[UIColor colorWithAlphaComponent:](self->_fullOpacityFillColor, "colorWithAlphaComponent:", self->_additionalOpacityMultiplier * v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_ring, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  if (_MKModernPuckDesignEnabled())
  {
    _MKPuckAnnotationViewBaseColor(self->_mapType, 1);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    fullOpacityStrokeColor = self->_fullOpacityStrokeColor;
    self->_fullOpacityStrokeColor = v11;

    p_baseStrokeOpacity = &self->_baseStrokeOpacity;
    if (!-[UIColor getRed:green:blue:alpha:](self->_fullOpacityStrokeColor, "getRed:green:blue:alpha:", 0, 0, 0, &self->_baseStrokeOpacity))*p_baseStrokeOpacity = 1.0;
    -[UIColor colorWithAlphaComponent:](self->_fullOpacityStrokeColor, "colorWithAlphaComponent:", self->_additionalStrokeOpacityMultiplier, v6, v4);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBorderColor:](self->_ring, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    -[CALayer setBorderWidth:](self->_ring, "setBorderWidth:", 3.0);
    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceStyle") == 2;

    self->_useDarkAppearance = v16;
    -[CALayer setShadowRadius:](self->_ring, "setShadowRadius:", 4.0);
    -[CALayer setShadowOffset:](self->_ring, "setShadowOffset:", 0.0, 1.0);
    _MKUserLocationViewBaseShadowColor();
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setShadowColor:](self->_ring, "setShadowColor:", objc_msgSend(v17, "CGColor"));

    mapPitchRadians = self->_mapPitchRadians;
    if (!self->_faux3DEnabled || (v19 = 0.0, mapPitchRadians <= 0.0))
    {
      v20 = dbl_18B2AFA10[!self->_useDarkAppearance];
      if (self->_useDarkAppearance)
        v21 = 0.300000012;
      else
        v21 = 0.5;
      v22 = 1.0 - cos(mapPitchRadians);
      mapPitchRadians = v22 * v21 + (1.0 - v22) * v20;
      v19 = mapPitchRadians;
    }
    *(float *)&mapPitchRadians = v19;
    -[CALayer setShadowOpacity:](self->_ring, "setShadowOpacity:", mapPitchRadians);
    if (self->_faux3DHighlight)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckFaux3DFaceHighlight"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckFaux3DFaceDark"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_mapkit_blendedColorWithFraction:ofColor:", v24, 0.200000003);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v49[0] = objc_msgSend(v25, "CGColor");
      v26 = objc_retainAutorelease(v23);
      v49[1] = objc_msgSend(v26, "CGColor");
      v27 = objc_retainAutorelease(v24);
      v49[2] = objc_msgSend(v27, "CGColor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setColors:](self->_faux3DHighlight, "setColors:", v28);
      -[CAGradientLayer setLocations:](self->_faux3DHighlight, "setLocations:", &unk_1E215A168);
      v29 = *p_baseStrokeOpacity * self->_additionalStrokeOpacityMultiplier;
      *(float *)&v29 = v29;
      -[CAGradientLayer setOpacity:](self->_faux3DHighlight, "setOpacity:", v29);

    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v30 = self->_faux3DHighlightMaskRings;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckFaux3DFaceDark"));
          v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v35, "setBorderColor:", objc_msgSend(v36, "CGColor"));

          -[CALayer borderWidth](self->_ring, "borderWidth");
          objc_msgSend(v35, "setBorderWidth:");
        }
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v32);
    }

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBorderColor:](self->_faux3DShadow, "setBorderColor:", objc_msgSend(v37, "CGColor"));

    -[CALayer borderWidth](self->_ring, "borderWidth");
    -[CALayer setBorderWidth:](self->_faux3DShadow, "setBorderWidth:");
    -[CALayer setShadowRadius:](self->_faux3DShadow, "setShadowRadius:", 4.0);
    _MKUserLocationViewBaseShadowColor();
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setShadowColor:](self->_faux3DShadow, "setShadowColor:", objc_msgSend(v38, "CGColor"));

    -[CALayer setShadowOffset:](self->_faux3DShadow, "setShadowOffset:", 0.0, 1.0);
    LODWORD(v39) = 0;
    -[CALayer setShadowOpacity:](self->_faux3DShadow, "setShadowOpacity:", v39);
    -[_MKPuckAccuracyLayer _updateFaux3DRingsIfNecessary](self, "_updateFaux3DRingsIfNecessary");
    v6 = v42;
    v4 = v43;
    v3 = 0x1E0CEA000;
  }
  else
  {
    v40 = self->_fullOpacityStrokeColor;
    self->_fullOpacityStrokeColor = 0;

    -[CALayer setBorderColor:](self->_ring, "setBorderColor:", 0);
    -[CALayer setBorderWidth:](self->_ring, "setBorderWidth:", 0.0);
    LODWORD(v41) = 0;
    -[CALayer setShadowOpacity:](self->_ring, "setShadowOpacity:", v41);
  }
  objc_msgSend(*(id *)(v3 + 2880), "setCurrentTraitCollection:", v4);

}

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (double)accuracy
{
  double v2;

  -[CALayer bounds](self->_ring, "bounds");
  return v2 * 0.5;
}

- (void)setMapCameraDistance:(double)a3
{
  if (vabdd_f64(a3, self->_mapCameraDistance) >= 0.00000011920929)
  {
    self->_mapCameraDistance = a3;
    -[_MKPuckAccuracyLayer _updateFaux3DRingsIfNecessary](self, "_updateFaux3DRingsIfNecessary");
  }
}

- (void)_createFaux3DRings
{
  uint64_t v3;
  NSArray *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  NSArray *faux3DHighlightMaskRings;
  CALayer *v10;
  CALayer *faux3DShadow;
  void *v12;
  NSArray *v13;

  if (self->_faux3DEnabled)
  {
    v3 = 6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAnchorPoint:", v5, v6);
      -[CALayer actions](self->_ring, "actions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setActions:", v8);

      objc_msgSend(v7, "setHidden:", 1);
      -[NSArray addObject:](v4, "addObject:", v7);
      -[CALayer insertSublayer:atIndex:](self->_faux3DHighlightMask, "insertSublayer:atIndex:", v7, 0);

      --v3;
    }
    while (v3);
    faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
    self->_faux3DHighlightMaskRings = v4;
    v13 = v4;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
    faux3DShadow = self->_faux3DShadow;
    self->_faux3DShadow = v10;

    -[CALayer setAnchorPoint:](self->_faux3DShadow, "setAnchorPoint:", 0.5, 0.5);
    -[CALayer actions](self->_ring, "actions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](self->_faux3DShadow, "setActions:", v12);

    -[CALayer setHidden:](self->_faux3DShadow, "setHidden:", 1);
    -[_MKPuckAccuracyLayer insertSublayer:atIndex:](self, "insertSublayer:atIndex:", self->_faux3DShadow, 0);

  }
}

- (void)_updateFaux3DRingsIfNecessary
{
  double mapPitchRadians;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  double v15;
  double mapCameraDistance;
  double v17;
  double v18;
  CALayer *ring;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  CALayer *v40;
  CALayer *faux3DShadow;
  double v42;
  long double v43;
  _OWORD v44[8];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;
  CATransform3D v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CATransform3D v61;
  CATransform3D v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (self->_faux3DEnabled)
  {
    mapPitchRadians = self->_mapPitchRadians;
    v4 = dbl_18B2AFA10[!self->_useDarkAppearance];
    if (self->_useDarkAppearance)
      v5 = 0.300000012;
    else
      v5 = 0.5;
    v6 = 1.0 - cos(self->_mapPitchRadians);
    v7 = v6 * v5 + (1.0 - v6) * v4;
    if (fabs(mapPitchRadians) >= 0.000001)
    {
      mapCameraDistance = self->_mapCameraDistance;
      if (mapCameraDistance > 23000.0)
        mapCameraDistance = 23000.0;
      if (mapCameraDistance <= 1440.0)
        v17 = 1.0;
      else
        v17 = (mapCameraDistance + -1440.0) / -21560.0 + 1.0;
      v18 = v6 * (v17 * 12.0 + (1.0 - v17) * 0.0);
      CATransform3DMakeTranslation(&v62, 0.0, -v18, 0.0);
      ring = self->_ring;
      v61 = v62;
      -[CALayer setTransform:](ring, "setTransform:", &v61);
      LODWORD(v20) = 0;
      -[CALayer setShadowOpacity:](self->_ring, "setShadowOpacity:", v20);
      -[CALayer bounds](self->_ring, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v18 + v27;
      -[CAGradientLayer setBounds:](self->_faux3DHighlight, "setBounds:");
      -[CAGradientLayer setPosition:](self->_faux3DHighlight, "setPosition:", 0.0, v18 * -0.5 + 2.0);
      -[CALayer setFrame:](self->_faux3DHighlightMask, "setFrame:", v22, v24, v26, v28);
      -[CAGradientLayer setHidden:](self->_faux3DHighlight, "setHidden:", 0);
      -[CALayer bounds](self->_ring, "bounds");
      v30 = v29;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v31 = self->_faux3DHighlightMaskRings;
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v32)
      {
        v33 = v32;
        v34 = 0;
        v35 = v28 - v30 + -1.0;
        v36 = v35 - v18;
        v37 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v58 != v37)
              objc_enumerationMutation(v31);
            v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            v36 = v36 + 2.0;
            if (v36 >= v35)
            {
              if ((v34 & 1) != 0)
              {
                v34 = 1;
                objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setHidden:", 1);
              }
              else
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setHidden:", 0);
                CATransform3DMakeTranslation(&v56, 0.0, v35, 0.0);
                v55 = v56;
                objc_msgSend(v39, "setTransform:", &v55);
                v34 = 1;
              }
            }
            else
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setHidden:", 0);
              CATransform3DMakeTranslation(&v54, 0.0, v36, 0.0);
              v53 = v54;
              objc_msgSend(v39, "setTransform:", &v53);
            }
          }
          v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        }
        while (v33);
      }

      -[CALayer setHidden:](self->_faux3DShadow, "setHidden:", 0);
      v40 = self->_ring;
      if (v40)
      {
        -[CALayer transform](v40, "transform");
      }
      else
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
      }
      faux3DShadow = self->_faux3DShadow;
      v44[4] = v49;
      v44[5] = v50;
      v44[6] = v51;
      v44[7] = v52;
      v44[0] = v45;
      v44[1] = v46;
      v44[2] = v47;
      v44[3] = v48;
      -[CALayer setTransform:](faux3DShadow, "setTransform:", v44);
      *(float *)&v42 = v7;
      -[CALayer setShadowOpacity:](self->_faux3DShadow, "setShadowOpacity:", v42);
      v43 = cos(self->_mapPitchRadians);
      -[CALayer setShadowOffset:](self->_faux3DShadow, "setShadowOffset:", 0.0, (double)(v18 + 1.0 + 1.0 - v43 + 1.0 - v43));
    }
    else
    {
      v8 = v7 * self->_additionalStrokeOpacityMultiplier;
      *(float *)&v8 = v8;
      -[CALayer setShadowOpacity:](self->_ring, "setShadowOpacity:", v8);
      v66 = 0u;
      v65 = 0u;
      v64 = 0u;
      v63 = 0u;
      v9 = self->_faux3DHighlightMaskRings;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v64 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
            objc_msgSend(v14, "setHidden:", 1);
            LODWORD(v15) = 0;
            objc_msgSend(v14, "setShadowOpacity:", v15);
          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        }
        while (v11);
      }

      -[CAGradientLayer setHidden:](self->_faux3DHighlight, "setHidden:", 1);
      -[CALayer setHidden:](self->_faux3DShadow, "setHidden:", 1);
    }
  }
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
  -[_MKPuckAccuracyLayer _updateColors](self, "_updateColors");
}

- (void)setMinimumRadius:(double)a3
{
  objc_super v4;
  CGRect v5;

  self->_minimumRadius = a3;
  -[CALayer bounds](self->_ring, "bounds");
  if (CGRectGetWidth(v5) * 0.5 < self->_minimumRadius)
  {
    self->_internallyHidden = 1;
    v4.receiver = self;
    v4.super_class = (Class)_MKPuckAccuracyLayer;
    -[_MKPuckAccuracyLayer setHidden:](&v4, sel_setHidden_, 1);
  }
}

- (_MKPuckAccuracyLayer)init
{
  _MKPuckAccuracyLayer *v2;
  _MKPuckAccuracyLayer *v3;
  uint64_t v4;
  CALayer *ring;
  double v6;
  const CGPath *v7;
  const CGPath *CopyByStrokingPath;
  _MKPuckAccuracyLayer *v9;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)_MKPuckAccuracyLayer;
  v2 = -[_MKPuckAccuracyLayer init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_additionalOpacityMultiplier = 1.0;
    v2->_additionalStrokeOpacityMultiplier = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    ring = v3->_ring;
    v3->_ring = (CALayer *)v4;

    -[_MKPuckAccuracyLayer bounds](v3, "bounds");
    -[CALayer setFrame:](v3->_ring, "setFrame:");
    -[_MKPuckAccuracyLayer bounds](v3, "bounds");
    -[CALayer setCornerRadius:](v3->_ring, "setCornerRadius:", v6 * 0.5);
    -[CALayer _mapkit_setActionsToRemoveDefaultImplicitActions](v3->_ring, "_mapkit_setActionsToRemoveDefaultImplicitActions");
    -[_MKPuckAccuracyLayer bounds](v3, "bounds");
    v7 = CGPathCreateWithEllipseInRect(v12, 0);
    CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v7, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
    -[CALayer setShadowPath:](v3->_ring, "setShadowPath:", CopyByStrokingPath);
    CGPathRelease(v7);
    CGPathRelease(CopyByStrokingPath);
    -[_MKPuckAccuracyLayer addSublayer:](v3, "addSublayer:", v3->_ring);
    -[_MKPuckAccuracyLayer updateLegacyConfiguration](v3, "updateLegacyConfiguration");
    v9 = v3;
  }

  return v3;
}

- (void)updateLegacyConfiguration
{
  -[_MKPuckAccuracyLayer _updateColors](self, "_updateColors");
  -[_MKPuckAccuracyLayer startAnimationsIfNecessary](self, "startAnimationsIfNecessary");
}

- (void)setFaux3DEnabled:(BOOL)a3
{
  CAGradientLayer *v4;
  CAGradientLayer *faux3DHighlight;
  CALayer *v6;
  CALayer *faux3DHighlightMask;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSArray *faux3DHighlightMaskRings;
  CAGradientLayer *v14;
  CALayer *ring;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v20;
  double v21;
  long double v22;
  long double v23;
  _OWORD v24[8];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_faux3DEnabled != a3)
  {
    self->_faux3DEnabled = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CD2790], "layer");
      v4 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      faux3DHighlight = self->_faux3DHighlight;
      self->_faux3DHighlight = v4;

      -[CAGradientLayer _mapkit_setActionsToRemoveDefaultImplicitActions](self->_faux3DHighlight, "_mapkit_setActionsToRemoveDefaultImplicitActions");
      -[CAGradientLayer setStartPoint:](self->_faux3DHighlight, "setStartPoint:", 0.0, 0.5);
      -[CAGradientLayer setEndPoint:](self->_faux3DHighlight, "setEndPoint:", 1.0, 0.5);
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v6 = (CALayer *)objc_claimAutoreleasedReturnValue();
      faux3DHighlightMask = self->_faux3DHighlightMask;
      self->_faux3DHighlightMask = v6;

      -[CALayer _mapkit_setActionsToRemoveDefaultImplicitActions](self->_faux3DHighlightMask, "_mapkit_setActionsToRemoveDefaultImplicitActions");
      -[CAGradientLayer setMask:](self->_faux3DHighlight, "setMask:", self->_faux3DHighlightMask);
      -[_MKPuckAccuracyLayer _createFaux3DRings](self, "_createFaux3DRings");
      -[_MKPuckAccuracyLayer insertSublayer:atIndex:](self, "insertSublayer:atIndex:", self->_faux3DHighlight, 0);
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = self->_faux3DHighlightMaskRings;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "removeFromSuperlayer");
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v10);
      }

      faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
      self->_faux3DHighlightMaskRings = 0;

      -[CAGradientLayer removeFromSuperlayer](self->_faux3DHighlight, "removeFromSuperlayer");
      v14 = self->_faux3DHighlight;
      self->_faux3DHighlight = 0;

      ring = self->_ring;
      v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v24[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v24[5] = v16;
      v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v24[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v24[7] = v17;
      v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v24[0] = *MEMORY[0x1E0CD2610];
      v24[1] = v18;
      v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v24[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v24[3] = v19;
      -[CALayer setTransform:](ring, "setTransform:", v24);
      v20 = dbl_18B2AFA10[!self->_useDarkAppearance];
      if (self->_useDarkAppearance)
        v21 = 0.300000012;
      else
        v21 = 0.5;
      v22 = cos(self->_mapPitchRadians);
      v23 = (1.0 - v22) * v21 + (1.0 - (1.0 - v22)) * v20;
      *(float *)&v23 = v23;
      -[CALayer setShadowOpacity:](self->_ring, "setShadowOpacity:", (double)v23);
    }
    -[_MKPuckAccuracyLayer _updateColors](self, "_updateColors");
    -[_MKPuckAccuracyLayer _updateFaux3DRingsIfNecessary](self, "_updateFaux3DRingsIfNecessary");
    if (self->_shouldShowAnimationsIfAvailable)
      -[_MKPuckAccuracyLayer startAnimationsIfNecessary](self, "startAnimationsIfNecessary");
  }
}

- (void)startAnimationsIfNecessary
{
  char v3;
  CALayer *ring;
  void *v5;
  NSArray *faux3DHighlightMaskRings;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  self->_shouldShowAnimationsIfAvailable = 1;
  v3 = _MKModernPuckDesignEnabled();
  ring = self->_ring;
  if ((v3 & 1) != 0)
  {
    -[CALayer animationForKey:](ring, "animationForKey:", CFSTR("pulse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_12;
    faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
    if (!faux3DHighlightMaskRings)
      return;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = faux3DHighlightMaskRings;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (!v8)
      goto LABEL_20;
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "animationForKey:", CFSTR("pulse"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 |= v13 == 0;

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("borderWidth"));
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray setFromValue:](v7, "setFromValue:", &unk_1E2158660);
      -[NSArray setToValue:](v7, "setToValue:", &unk_1E2158670);
      -[NSArray setDuration:](v7, "setDuration:", 1.5);
      -[NSArray setRemovedOnCompletion:](v7, "setRemovedOnCompletion:", 0);
      -[NSArray setFillMode:](v7, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      -[NSArray setAutoreverses:](v7, "setAutoreverses:", 1);
      LODWORD(v14) = 2139095039;
      -[NSArray setRepeatCount:](v7, "setRepeatCount:", v14);
      -[NSArray setFrameInterval:](v7, "setFrameInterval:", 0.0250000004);
      -[CALayer addAnimation:forKey:](self->_ring, "addAnimation:forKey:", v7, CFSTR("pulse"));
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = self->_faux3DHighlightMaskRings;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "addAnimation:forKey:", v7, CFSTR("pulse"), (_QWORD)v25);
          }
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        }
        while (v17);
      }

      -[CALayer addAnimation:forKey:](self->_faux3DShadow, "addAnimation:forKey:", v7, CFSTR("pulse"));
LABEL_20:

    }
  }
  else
  {
    -[CALayer removeAnimationForKey:](ring, "removeAnimationForKey:", CFSTR("pulse"));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = self->_faux3DHighlightMaskRings;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "removeAnimationForKey:", CFSTR("pulse"));
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v22);
    }

    -[CALayer removeAnimationForKey:](self->_faux3DShadow, "removeAnimationForKey:", CFSTR("pulse"));
  }
}

- (void)setAccuracy:(double)a3 duration:(double)a4
{
  double minimumRadius;
  long double mapPitchRadians;
  double v8;
  double mapCameraDistance;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  double v43;
  const CGPath *v44;
  CGPathRef CopyByStrokingPath;
  double Width;
  double v47;
  double v48;
  _BOOL8 externallyHidden;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  CALayer *ring;
  NSArray *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  _BOOL4 v83;
  uint64_t v84;
  NSArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  CGFloat v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  CGFloat v102;
  void *v103;
  CGFloat v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  objc_super v109;
  _QWORD v110[4];
  _QWORD v111[4];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[4];
  _QWORD v115[4];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[6];
  _QWORD v121[4];
  _QWORD v122[4];
  objc_super v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _QWORD v129[2];
  _BYTE v130[128];
  _QWORD v131[3];
  _QWORD v132[3];
  _BYTE v133[128];
  uint64_t v134;
  CGRect v135;
  CGRect v136;

  v134 = *MEMORY[0x1E0C80C00];
  if (self->_minimumRadius >= a3)
    minimumRadius = self->_minimumRadius;
  else
    minimumRadius = a3;
  mapPitchRadians = self->_mapPitchRadians;
  v8 = 0.0;
  if (mapPitchRadians > 0.0)
  {
    mapCameraDistance = self->_mapCameraDistance;
    v10 = 1.0 - cos(mapPitchRadians);
    v11 = 23000.0;
    if (mapCameraDistance <= 23000.0)
      v11 = mapCameraDistance;
    if (v11 <= 1440.0)
      v12 = 1.0;
    else
      v12 = (v11 + -1440.0) / -21560.0 + 1.0;
    v8 = v10 * (v12 * 12.0 + (1.0 - v12) * 0.0);
  }
  -[CALayer currentLayer](self->_ring, "currentLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v95 = v14;
  v16 = v15;
  v102 = v18;
  v104 = v17;

  -[CAGradientLayer currentLayer](self->_faux3DHighlight, "currentLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v97 = v21;
  v98 = v20;
  v100 = v23;
  v101 = v22;

  -[CAGradientLayer currentLayer](self->_faux3DHighlight, "currentLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "position");
  v91 = v26;
  v93 = v25;

  if (a4 <= 0.0)
  {
    -[CALayer animationForKey:](self->_ring, "animationForKey:", CFSTR("radius"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v27 = v29 != 0;
    if (v29)
    {
      objc_msgSend(v29, "beginTime");
      v99 = v31;
      -[_MKPuckAccuracyLayer convertTime:fromLayer:](self, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v33 = v32;
      objc_msgSend(v30, "beginTime");
      v28 = 0.0;
      if (v33 - v34 > 0.0)
      {
        objc_msgSend(v30, "beginTime");
        v28 = v33 - v35;
      }
      objc_msgSend(v30, "duration", v91, v93);
      a4 = v36;
    }
    else
    {
      v99 = 0.0;
      v28 = 0.0;
    }

  }
  else
  {
    v99 = 0.0;
    v27 = 1;
    v28 = 0.0;
  }
  v37 = v8 * -0.5;
  -[CALayer removeAnimationForKey:](self->_ring, "removeAnimationForKey:", CFSTR("radius"), v91, v93);
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v38 = self->_faux3DHighlightMaskRings;
  v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v125 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * i), "removeAnimationForKey:", CFSTR("radius"));
      }
      v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
    }
    while (v40);
  }
  v43 = minimumRadius + minimumRadius + v8;

  -[CAGradientLayer removeAnimationForKey:](self->_faux3DHighlight, "removeAnimationForKey:", CFSTR("radius"));
  -[CALayer removeAnimationForKey:](self->_faux3DHighlightMask, "removeAnimationForKey:", CFSTR("radius"));
  -[CALayer removeAnimationForKey:](self->_faux3DShadow, "removeAnimationForKey:", CFSTR("radius"));
  v135.origin.x = 0.0;
  v135.origin.y = 0.0;
  v135.size.width = minimumRadius + minimumRadius;
  v135.size.height = minimumRadius + minimumRadius;
  v44 = CGPathCreateWithEllipseInRect(v135, 0);
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v44, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
  CGPathRelease(v44);
  if (v27)
  {
    v136.origin.x = v95;
    v136.origin.y = v16;
    v136.size.height = v102;
    v136.size.width = v104;
    Width = CGRectGetWidth(v136);
    if (self->_internallyHidden)
    {
      v47 = Width * 0.5;
      v48 = self->_minimumRadius;
      if (v47 > v48 || minimumRadius > v48)
      {
        self->_internallyHidden = 0;
        externallyHidden = self->_externallyHidden;
        v123.receiver = self;
        v123.super_class = (Class)_MKPuckAccuracyLayer;
        -[_MKPuckAccuracyLayer setHidden:](&v123, sel_setHidden_, externallyHidden);
      }
    }
    v132[0] = &unk_1E21594A8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28 / a4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v132[1] = v50;
    v132[2] = &unk_1E21594C0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    *(CGFloat *)v122 = v95;
    *(CGFloat *)&v122[1] = v16;
    *(CGFloat *)&v122[2] = v104;
    *(CGFloat *)&v122[3] = v102;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v122, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = 0;
    v121[1] = 0;
    *(double *)&v121[2] = minimumRadius + minimumRadius;
    *(double *)&v121[3] = minimumRadius + minimumRadius;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v121, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    _accuracyRadiusAnimation((uint64_t)CFSTR("bounds"), v52, v53, v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (void *)MEMORY[0x1E0CB37E8];
    -[CALayer currentLayer](self->_ring, "currentLayer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "cornerRadius");
    objc_msgSend(v55, "numberWithDouble:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", minimumRadius);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    _accuracyRadiusAnimation((uint64_t)CFSTR("cornerRadius"), v57, v58, v51);
    v59 = objc_claimAutoreleasedReturnValue();

    -[CALayer currentLayer](self->_ring, "currentLayer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    _accuracyRadiusAnimation((uint64_t)CFSTR("shadowPath"), (void *)objc_msgSend(v60, "shadowPath"), CopyByStrokingPath, v51);
    v61 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v131[0] = v54;
    v103 = (void *)v59;
    v131[1] = v59;
    v96 = (void *)v61;
    v131[2] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 3);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setAnimations:", v63);

    objc_msgSend(v62, "setDuration:", a4);
    if (v99 > 0.0)
      objc_msgSend(v62, "setBeginTime:", v99);
    ring = self->_ring;
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __45___MKPuckAccuracyLayer_setAccuracy_duration___block_invoke;
    v120[3] = &unk_1E20DF390;
    v120[4] = self;
    *(double *)&v120[5] = minimumRadius;
    -[CALayer _mapkit_addAnimation:forKey:completion:](ring, "_mapkit_addAnimation:forKey:completion:", v62, CFSTR("radius"), v120);
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v65 = self->_faux3DHighlightMaskRings;
    v66 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
    v67 = v43;
    if (v66)
    {
      v68 = v66;
      v69 = *(_QWORD *)v117;
      do
      {
        for (j = 0; j != v68; ++j)
        {
          if (*(_QWORD *)v117 != v69)
            objc_enumerationMutation(v65);
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * j), "addAnimation:forKey:", v62, CFSTR("radius"));
        }
        v68 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
      }
      while (v68);
    }

    -[CALayer addAnimation:forKey:](self->_faux3DShadow, "addAnimation:forKey:", v62, CFSTR("radius"));
    if (self->_faux3DHighlight)
    {
      v115[0] = v98;
      v115[1] = v97;
      v115[2] = v101;
      v115[3] = v100;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v115, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = 0;
      v114[1] = 0;
      *(double *)&v114[2] = minimumRadius + minimumRadius;
      *(double *)&v114[3] = v43;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v114, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      _accuracyRadiusAnimation((uint64_t)CFSTR("bounds"), v71, v72, v51);
      v73 = objc_claimAutoreleasedReturnValue();

      v113[0] = v94;
      v113[1] = v92;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v113, "{CGPoint=dd}");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = 0;
      *(double *)&v112[1] = v37 + 2.0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v112, "{CGPoint=dd}");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      _accuracyRadiusAnimation((uint64_t)CFSTR("position"), v74, v75, v51);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      v129[0] = v73;
      v129[1] = v76;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setAnimations:", v78);

      objc_msgSend(v77, "setDuration:", a4);
      if (v99 > 0.0)
        objc_msgSend(v77, "setBeginTime:", v99);
      -[CAGradientLayer addAnimation:forKey:](self->_faux3DHighlight, "addAnimation:forKey:", v77, CFSTR("radius"));
      v111[0] = v98;
      v111[1] = v97;
      v111[2] = v101;
      v111[3] = v100;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v111, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = 0;
      v110[1] = 0;
      *(double *)&v110[2] = minimumRadius + minimumRadius;
      *(double *)&v110[3] = v43;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v110, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      _accuracyRadiusAnimation((uint64_t)CFSTR("frame"), v79, v80, v51);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "setDuration:", a4);
      if (v99 > 0.0)
        objc_msgSend(v81, "setBeginTime:", v99);
      -[CALayer addAnimation:forKey:](self->_faux3DHighlightMask, "addAnimation:forKey:", v81, CFSTR("radius"));

      v54 = (void *)v73;
    }
    else
    {
      v77 = v62;
    }

  }
  else
  {
    v82 = self->_minimumRadius;
    v83 = minimumRadius < v82;
    if (vabdd_f64(minimumRadius, v82) < 0.01)
      v83 = 1;
    self->_internallyHidden = v83;
    v84 = self->_externallyHidden || v83;
    v109.receiver = self;
    v109.super_class = (Class)_MKPuckAccuracyLayer;
    -[_MKPuckAccuracyLayer setHidden:](&v109, sel_setHidden_, v84);
    v67 = v43;
  }
  -[CALayer setBounds:](self->_ring, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, minimumRadius + minimumRadius);
  -[CALayer setCornerRadius:](self->_ring, "setCornerRadius:", minimumRadius);
  -[CALayer setShadowPath:](self->_ring, "setShadowPath:", CopyByStrokingPath);
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v85 = self->_faux3DHighlightMaskRings;
  v86 = -[NSArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v106;
    do
    {
      for (k = 0; k != v87; ++k)
      {
        if (*(_QWORD *)v106 != v88)
          objc_enumerationMutation(v85);
        v90 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
        objc_msgSend(v90, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, minimumRadius + minimumRadius);
        objc_msgSend(v90, "setCornerRadius:", minimumRadius);
        objc_msgSend(v90, "setShadowPath:", CopyByStrokingPath);
      }
      v87 = -[NSArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
    }
    while (v87);
  }

  -[CALayer setBounds:](self->_faux3DShadow, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, minimumRadius + minimumRadius);
  -[CALayer setCornerRadius:](self->_faux3DShadow, "setCornerRadius:", minimumRadius);
  -[CALayer setShadowPath:](self->_faux3DShadow, "setShadowPath:", CopyByStrokingPath);
  -[CAGradientLayer setBounds:](self->_faux3DHighlight, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, v67);
  -[CAGradientLayer setPosition:](self->_faux3DHighlight, "setPosition:", 0.0, v37 + 2.0);
  -[CALayer setFrame:](self->_faux3DHighlightMask, "setFrame:", 0.0, 0.0, minimumRadius + minimumRadius, v67);
  CGPathRelease(CopyByStrokingPath);
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
  -[_MKPuckAccuracyLayer _updateColors](self, "_updateColors");
}

- (void)setMapPitchRadians:(double)a3
{
  if (vabdd_f64(a3, self->_mapPitchRadians) >= 0.000001)
  {
    self->_mapPitchRadians = a3;
    -[_MKPuckAccuracyLayer _updateFaux3DRingsIfNecessary](self, "_updateFaux3DRingsIfNecessary");
  }
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
  -[_MKPuckAccuracyLayer _updateColors](self, "_updateColors");
}

- (void)setStale:(BOOL)a3
{
  self->_stale = a3;
  -[_MKPuckAccuracyLayer _updateColors](self, "_updateColors");
}

- (double)currentAccuracy
{
  void *v2;
  double v3;
  double v4;

  -[CALayer currentLayer](self->_ring, "currentLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 * 0.5;

  return v4;
}

- (CGRect)significantBounds
{
  CALayer *ring;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  ring = self->_ring;
  -[CALayer bounds](ring, "bounds");
  -[CALayer convertRect:toLayer:](ring, "convertRect:toLayer:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)presentationFillOpacity
{
  return self->_baseOpacity * self->_additionalOpacityMultiplier;
}

- (void)setFillOpacity:(double)a3 duration:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (vabdd_f64(a3, self->_additionalOpacityMultiplier) >= 0.000001)
  {
    self->_additionalOpacityMultiplier = a3;
    -[UIColor colorWithAlphaComponent:](self->_fullOpacityFillColor, "colorWithAlphaComponent:", self->_baseOpacity * a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 <= 0.0)
    {
      -[CALayer removeAnimationForKey:](self->_ring, "removeAnimationForKey:", CFSTR("opacity"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("backgroundColor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer currentLayer](self, "currentLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v8, "backgroundColor"));

      objc_msgSend(v7, "setToValue:", objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
      objc_msgSend(v7, "setDuration:", a4);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimingFunction:", v9);

      -[CALayer addAnimation:forKey:](self->_ring, "addAnimation:forKey:", v7, CFSTR("opacity"));
    }
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_CA_setDisableActions:", 1);

    v12 = objc_retainAutorelease(v6);
    -[CALayer setBackgroundColor:](self->_ring, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_CA_setDisableActions:", 0);

  }
}

- (void)setStrokeOpacity:(double)a3 duration:(double)a4
{
  double v7;
  double v8;
  long double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double additionalStrokeOpacityMultiplier;
  void *v26;
  id v27;
  id v28;

  if (vabdd_f64(a3, self->_additionalStrokeOpacityMultiplier) >= 0.000001)
  {
    self->_additionalStrokeOpacityMultiplier = a3;
    v7 = dbl_18B2AFA10[!self->_useDarkAppearance];
    if (self->_useDarkAppearance)
      v8 = 0.300000012;
    else
      v8 = 0.5;
    v9 = cos(self->_mapPitchRadians);
    v10 = ((1.0 - v9) * v8 + (1.0 - (1.0 - v9)) * v7) * a3;
    -[UIColor colorWithAlphaComponent:](self->_fullOpacityStrokeColor, "colorWithAlphaComponent:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 <= 0.0)
    {
      -[CALayer removeAnimationForKey:](self->_ring, "removeAnimationForKey:", CFSTR("strokeOpacity"));
      -[CAGradientLayer removeAnimationForKey:](self->_faux3DHighlight, "removeAnimationForKey:", CFSTR("strokeOpacity"));
      -[CALayer removeAnimationForKey:](self->_faux3DShadow, "removeAnimationForKey:", CFSTR("strokeOpacity"));
      -[CALayer removeAnimationForKey:](self->_ring, "removeAnimationForKey:", CFSTR("shadowOpacity"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[CALayer currentLayer](self->_ring, "currentLayer");
      v27 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "opacity");
      objc_msgSend(v13, "numberWithFloat:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFromValue:", v15);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setToValue:", v16);

      objc_msgSend(v12, "setDuration:", a4);
      objc_msgSend(v12, "setRemovedOnCompletion:", 1);
      -[CALayer addAnimation:forKey:](self->_ring, "addAnimation:forKey:", v12, CFSTR("strokeOpacity"));
      -[CAGradientLayer addAnimation:forKey:](self->_faux3DHighlight, "addAnimation:forKey:", v12, CFSTR("strokeOpacity"));
      -[CALayer addAnimation:forKey:](self->_faux3DShadow, "addAnimation:forKey:", v12, CFSTR("strokeOpacity"));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOpacity"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[CALayer currentLayer](self->_ring, "currentLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shadowOpacity");
      objc_msgSend(v18, "numberWithFloat:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFromValue:", v20);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setToValue:", v21);

      objc_msgSend(v17, "setDuration:", a4);
      objc_msgSend(v17, "setRemovedOnCompletion:", 1);
      v11 = v27;
      -[CALayer addAnimation:forKey:](self->_ring, "addAnimation:forKey:", v17, CFSTR("shadowOpacity"));

    }
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_CA_setDisableActions:", 1);

    v28 = objc_retainAutorelease(v11);
    -[CALayer setBorderColor:](self->_ring, "setBorderColor:", objc_msgSend(v28, "CGColor"));
    *(float *)&v23 = v10;
    -[CALayer setShadowOpacity:](self->_ring, "setShadowOpacity:", v23);
    v24 = self->_additionalStrokeOpacityMultiplier * self->_baseStrokeOpacity;
    *(float *)&v24 = v24;
    -[CAGradientLayer setOpacity:](self->_faux3DHighlight, "setOpacity:", v24);
    additionalStrokeOpacityMultiplier = self->_additionalStrokeOpacityMultiplier;
    *(float *)&additionalStrokeOpacityMultiplier = additionalStrokeOpacityMultiplier;
    -[CALayer setOpacity:](self->_faux3DShadow, "setOpacity:", additionalStrokeOpacityMultiplier);
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_CA_setDisableActions:", 0);

  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  self->_externallyHidden = a3;
  v3 = a3 || self->_internallyHidden;
  v4.receiver = self;
  v4.super_class = (Class)_MKPuckAccuracyLayer;
  -[_MKPuckAccuracyLayer setHidden:](&v4, sel_setHidden_, v3);
}

- (void)stopAnimations
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_shouldShowAnimationsIfAvailable = 0;
  -[CALayer removeAnimationForKey:](self->_ring, "removeAnimationForKey:", CFSTR("pulse"));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_faux3DHighlightMaskRings;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeAnimationForKey:", CFSTR("pulse"), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CALayer removeAnimationForKey:](self->_faux3DShadow, "removeAnimationForKey:", CFSTR("pulse"));
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (BOOL)isFaux3DEnabled
{
  return self->_faux3DEnabled;
}

- (double)mapPitchRadians
{
  return self->_mapPitchRadians;
}

- (double)mapCameraDistance
{
  return self->_mapCameraDistance;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faux3DShadow, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMaskRings, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMask, 0);
  objc_storeStrong((id *)&self->_faux3DHighlight, 0);
  objc_storeStrong((id *)&self->_ring, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_fullOpacityStrokeColor, 0);
  objc_storeStrong((id *)&self->_fullOpacityFillColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
