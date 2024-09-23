@implementation CLKUIAnalogHandConfiguration

+ (id)defaultHourConfigurationForDevice:(id)a3
{
  CLKUIAnalogHandConfiguration *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  _LayoutConstants(a3, &v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  -[CLKUIAnalogHandConfiguration setType:](v3, "setType:", 0);
  -[CLKUIAnalogHandConfiguration setInlayInsetRadius:](v3, "setInlayInsetRadius:", *(double *)&v5);
  -[CLKUIAnalogHandConfiguration setHandWidth:](v3, "setHandWidth:", *((double *)&v5 + 1));
  -[CLKUIAnalogHandConfiguration setHandLength:](v3, "setHandLength:", *(double *)&v6);
  -[CLKUIAnalogHandConfiguration setPegRadius:](v3, "setPegRadius:", *((double *)&v6 + 1));
  -[CLKUIAnalogHandConfiguration setPegStrokeWidth:](v3, "setPegStrokeWidth:", *(double *)&v7);
  -[CLKUIAnalogHandConfiguration setArmWidth:](v3, "setArmWidth:", *((double *)&v7 + 1));
  -[CLKUIAnalogHandConfiguration setArmLength:](v3, "setArmLength:", *(double *)&v8);
  -[CLKUIAnalogHandConfiguration setDropShadowOpacity:](v3, "setDropShadowOpacity:", *(double *)&v9);
  -[CLKUIAnalogHandConfiguration setDropShadowRadius:](v3, "setDropShadowRadius:", *((double *)&v8 + 1));
  -[CLKUIAnalogHandConfiguration setRadialShadowOpacity:](v3, "setRadialShadowOpacity:", *(double *)&v10);
  -[CLKUIAnalogHandConfiguration setRadialShadowRadius:](v3, "setRadialShadowRadius:", *((double *)&v9 + 1));
  -[CLKUIAnalogHandConfiguration setDirectionalShadowOffset:](v3, "setDirectionalShadowOffset:", *((double *)&v10 + 1), *(double *)&v11);
  -[CLKUIAnalogHandConfiguration setExcludePeg:](v3, "setExcludePeg:", 0);
  -[CLKUIAnalogHandConfiguration setSmoothingRadius:](v3, "setSmoothingRadius:", 1.25);
  return v3;
}

+ (id)defaultMinuteConfigurationForDevice:(id)a3
{
  CLKUIAnalogHandConfiguration *v3;
  _OWORD v5[6];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants(a3, v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  -[CLKUIAnalogHandConfiguration setType:](v3, "setType:", 0);
  -[CLKUIAnalogHandConfiguration setInlayInsetRadius:](v3, "setInlayInsetRadius:", *(double *)v5);
  -[CLKUIAnalogHandConfiguration setHandWidth:](v3, "setHandWidth:", *((double *)&v6 + 1));
  -[CLKUIAnalogHandConfiguration setHandLength:](v3, "setHandLength:", *(double *)&v7);
  -[CLKUIAnalogHandConfiguration setPegRadius:](v3, "setPegRadius:", *((double *)&v7 + 1));
  -[CLKUIAnalogHandConfiguration setPegStrokeWidth:](v3, "setPegStrokeWidth:", *(double *)&v8);
  -[CLKUIAnalogHandConfiguration setArmWidth:](v3, "setArmWidth:", *((double *)&v8 + 1));
  -[CLKUIAnalogHandConfiguration setArmLength:](v3, "setArmLength:", *(double *)&v9);
  -[CLKUIAnalogHandConfiguration setDropShadowOpacity:](v3, "setDropShadowOpacity:", *(double *)&v10);
  -[CLKUIAnalogHandConfiguration setDropShadowRadius:](v3, "setDropShadowRadius:", *((double *)&v9 + 1));
  -[CLKUIAnalogHandConfiguration setRadialShadowOpacity:](v3, "setRadialShadowOpacity:", *(double *)&v11);
  -[CLKUIAnalogHandConfiguration setRadialShadowRadius:](v3, "setRadialShadowRadius:", *((double *)&v10 + 1));
  -[CLKUIAnalogHandConfiguration setDirectionalShadowOffset:](v3, "setDirectionalShadowOffset:", *((double *)&v11 + 1), *(double *)&v12);
  -[CLKUIAnalogHandConfiguration setExcludePeg:](v3, "setExcludePeg:", 0);
  -[CLKUIAnalogHandConfiguration setSmoothingRadius:](v3, "setSmoothingRadius:", 1.25);
  return v3;
}

+ (id)defaultSecondConfigurationForDevice:(id)a3
{
  CLKUIAnalogHandConfiguration *v3;
  _OWORD v5[12];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants(a3, v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  -[CLKUIAnalogHandConfiguration setType:](v3, "setType:", 1);
  -[CLKUIAnalogHandConfiguration setHandWidth:](v3, "setHandWidth:", *((double *)&v6 + 1));
  -[CLKUIAnalogHandConfiguration setHandLength:](v3, "setHandLength:", *(double *)&v7);
  -[CLKUIAnalogHandConfiguration setPegRadius:](v3, "setPegRadius:", *((double *)&v7 + 1));
  -[CLKUIAnalogHandConfiguration setPegStrokeWidth:](v3, "setPegStrokeWidth:", *(double *)&v8);
  -[CLKUIAnalogHandConfiguration setTailLength:](v3, "setTailLength:", *((double *)&v8 + 1));
  -[CLKUIAnalogHandConfiguration setDropShadowOpacity:](v3, "setDropShadowOpacity:", *((double *)&v9 + 1));
  -[CLKUIAnalogHandConfiguration setDropShadowRadius:](v3, "setDropShadowRadius:", *(double *)&v9);
  -[CLKUIAnalogHandConfiguration setRadialShadowOpacity:](v3, "setRadialShadowOpacity:", *((double *)&v10 + 1));
  -[CLKUIAnalogHandConfiguration setRadialShadowRadius:](v3, "setRadialShadowRadius:", *(double *)&v10);
  -[CLKUIAnalogHandConfiguration setDirectionalShadowOffset:](v3, "setDirectionalShadowOffset:", v11);
  -[CLKUIAnalogHandConfiguration setRoundedSecondHand:](v3, "setRoundedSecondHand:", 1);
  -[CLKUIAnalogHandConfiguration setExcludeSecondTail:](v3, "setExcludeSecondTail:", 0);
  -[CLKUIAnalogHandConfiguration setSmoothingRadius:](v3, "setSmoothingRadius:", 1.25);
  return v3;
}

+ (id)defaultSubdialConfigurationForDevice:(id)a3
{
  CLKUIAnalogHandConfiguration *v3;
  _OWORD v5[14];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;

  v11 = 0.0;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants(a3, v5);
  v3 = objc_alloc_init(CLKUIAnalogHandConfiguration);
  -[CLKUIAnalogHandConfiguration setType:](v3, "setType:", 1);
  -[CLKUIAnalogHandConfiguration setHandWidth:](v3, "setHandWidth:", *(double *)&v10);
  -[CLKUIAnalogHandConfiguration setHandLength:](v3, "setHandLength:", *((double *)&v10 + 1));
  -[CLKUIAnalogHandConfiguration setPegRadius:](v3, "setPegRadius:", 0.0);
  -[CLKUIAnalogHandConfiguration setPegStrokeWidth:](v3, "setPegStrokeWidth:", v11);
  -[CLKUIAnalogHandConfiguration setTailLength:](v3, "setTailLength:", *((double *)&v6 + 1));
  -[CLKUIAnalogHandConfiguration setDropShadowOpacity:](v3, "setDropShadowOpacity:", 0.0);
  -[CLKUIAnalogHandConfiguration setDropShadowRadius:](v3, "setDropShadowRadius:", 0.0);
  -[CLKUIAnalogHandConfiguration setRadialShadowOpacity:](v3, "setRadialShadowOpacity:", 0.0);
  -[CLKUIAnalogHandConfiguration setRadialShadowRadius:](v3, "setRadialShadowRadius:", 0.0);
  -[CLKUIAnalogHandConfiguration setDirectionalShadowOffset:](v3, "setDirectionalShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[CLKUIAnalogHandConfiguration setRoundedSecondHand:](v3, "setRoundedSecondHand:", 1);
  -[CLKUIAnalogHandConfiguration setExcludeSecondTail:](v3, "setExcludeSecondTail:", 1);
  -[CLKUIAnalogHandConfiguration setSmoothingRadius:](v3, "setSmoothingRadius:", 1.25);
  return v3;
}

- (CGPoint)anchorPoint
{
  unint64_t type;
  double handLength;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  type = self->_type;
  if (type == 1)
  {
    handLength = self->_handLength;
    goto LABEL_5;
  }
  if (!type)
  {
    handLength = self->_handLength + self->_armLength + self->_pegRadius + self->_pegStrokeWidth;
LABEL_5:
    -[CLKUIAnalogHandConfiguration bounds](self, "bounds");
    v5 = handLength / v4;
  }
  v6 = 0.5;
  result.y = v5;
  result.x = v6;
  return result;
}

- (CGRect)bounds
{
  double handWidth;
  unint64_t type;
  double v4;
  double v5;
  double v6;
  double tailLength;
  double v8;
  double v9;
  double v10;
  CGRect result;

  type = self->_type;
  if (type == 1)
  {
    if (self->_excludeSecondTail)
    {
      v6 = self->_pegRadius + self->_pegStrokeWidth;
      tailLength = v6;
    }
    else
    {
      tailLength = self->_tailLength;
      v6 = self->_pegRadius + self->_pegStrokeWidth;
    }
    v5 = self->_handLength + tailLength;
    v8 = v6 + v6;
    if (self->_handWidth >= v8)
      handWidth = self->_handWidth;
    else
      handWidth = v8;
  }
  else if (!type)
  {
    v4 = self->_pegRadius + self->_pegStrokeWidth;
    handWidth = self->_handWidth;
    if (handWidth < v4 + v4)
      handWidth = v4 + v4;
    v5 = self->_handLength + self->_armLength + v4 * 2.0;
  }
  v9 = 0.0;
  v10 = 0.0;
  result.size.height = v5;
  result.size.width = handWidth;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (UIEdgeInsets)inlayInsets
{
  double v3;
  double v4;
  double v5;
  unint64_t type;
  double v7;
  UIEdgeInsets result;

  -[CLKUIAnalogHandConfiguration inlayInsetRadius](self, "inlayInsetRadius");
  type = self->_type;
  if (type == 1)
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v7 = v3;
    if (!type)
    {
      v4 = v3 + self->_armLength + (self->_pegRadius + self->_pegStrokeWidth) * 2.0;
      v5 = v3;
    }
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v7;
  result.top = v3;
  return result;
}

- (id)configurationByApplyingInset:(double)a3
{
  void *v5;
  void *v6;
  unint64_t type;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v5 = (void *)-[CLKUIAnalogHandConfiguration copy](self, "copy");
  v6 = v5;
  type = self->_type;
  if (type == 1)
  {
    objc_msgSend(v5, "handWidth");
    objc_msgSend(v6, "setHandWidth:", v16 + a3 * -2.0);
    objc_msgSend(v6, "handLength");
    objc_msgSend(v6, "setHandLength:", v17 - a3);
    objc_msgSend(v6, "tailLength");
    objc_msgSend(v6, "setTailLength:", v18 - a3);
    objc_msgSend(v6, "pegRadius");
    if (v19 <= 0.0)
    {
      objc_msgSend(v6, "pegStrokeWidth");
      v22 = v30 - a3;
    }
    else
    {
      objc_msgSend(v6, "pegRadius");
      objc_msgSend(v6, "setPegRadius:", v20 + a3);
      objc_msgSend(v6, "pegStrokeWidth");
      v22 = v21 + a3 * -2.0;
    }
    objc_msgSend(v6, "setPegStrokeWidth:", v22);
    objc_msgSend(v6, "smoothingRadius");
    if (v31 > 0.0)
    {
      objc_msgSend(v6, "smoothingRadius");
      objc_msgSend(v6, "setSmoothingRadius:", v32 + a3);
    }
    objc_msgSend(v6, "handWidth");
    objc_msgSend(v6, "setHandWidth:", fmax(v33, 0.0));
    objc_msgSend(v6, "handLength");
    objc_msgSend(v6, "setHandLength:", fmax(v34, 0.0));
    objc_msgSend(v6, "tailLength");
    objc_msgSend(v6, "setTailLength:", fmax(v35, 0.0));
    goto LABEL_15;
  }
  if (!type)
  {
    objc_msgSend(v5, "handLength");
    objc_msgSend(v6, "setHandLength:", v8 + a3 * -2.0);
    objc_msgSend(v6, "handWidth");
    objc_msgSend(v6, "setHandWidth:", v9 + a3 * -2.0);
    objc_msgSend(v6, "armWidth");
    objc_msgSend(v6, "setArmWidth:", v10 + a3 * -2.0);
    objc_msgSend(v6, "armLength");
    objc_msgSend(v6, "setArmLength:", v11 + a3 * 2.0);
    objc_msgSend(v6, "pegRadius");
    if (v12 <= 0.0)
    {
      objc_msgSend(v6, "pegStrokeWidth");
      v15 = v23 - a3;
    }
    else
    {
      objc_msgSend(v6, "pegRadius");
      objc_msgSend(v6, "setPegRadius:", v13 + a3);
      objc_msgSend(v6, "pegStrokeWidth");
      v15 = v14 + a3 * -2.0;
    }
    objc_msgSend(v6, "setPegStrokeWidth:", v15);
    objc_msgSend(v6, "smoothingRadius");
    if (v24 > 0.0)
    {
      objc_msgSend(v6, "smoothingRadius");
      objc_msgSend(v6, "setSmoothingRadius:", v25 + a3);
    }
    objc_msgSend(v6, "handLength");
    objc_msgSend(v6, "setHandLength:", fmax(v26, 0.0));
    objc_msgSend(v6, "handWidth");
    objc_msgSend(v6, "setHandWidth:", fmax(v27, 0.0));
    objc_msgSend(v6, "armWidth");
    objc_msgSend(v6, "setArmWidth:", fmax(v28, 0.0));
    objc_msgSend(v6, "armLength");
    objc_msgSend(v6, "setArmLength:", fmax(v29, 0.0));
LABEL_15:
    objc_msgSend(v6, "pegRadius");
    objc_msgSend(v6, "setPegRadius:", fmax(v36, 0.0));
    objc_msgSend(v6, "pegStrokeWidth");
    objc_msgSend(v6, "setPegStrokeWidth:", fmax(v37, 0.0));
  }
  return v6;
}

- (id)configurationByApplyingScale:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = (void *)-[CLKUIAnalogHandConfiguration copy](self, "copy");
  objc_msgSend(v4, "handLength");
  objc_msgSend(v4, "setHandLength:", v5 * a3);
  objc_msgSend(v4, "handWidth");
  objc_msgSend(v4, "setHandWidth:", v6 * a3);
  objc_msgSend(v4, "armLength");
  objc_msgSend(v4, "setArmLength:", v7 * a3);
  objc_msgSend(v4, "armWidth");
  objc_msgSend(v4, "setArmWidth:", v8 * a3);
  objc_msgSend(v4, "pegStrokeWidth");
  objc_msgSend(v4, "setPegStrokeWidth:", v9 * a3);
  objc_msgSend(v4, "pegRadius");
  objc_msgSend(v4, "setPegRadius:", v10 * a3);
  objc_msgSend(v4, "tailLength");
  objc_msgSend(v4, "setTailLength:", v11 * a3);
  objc_msgSend(v4, "smoothingRadius");
  objc_msgSend(v4, "setSmoothingRadius:", v12 * a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CLKUIAnalogHandConfiguration copyToConfiguration:](self, "copyToConfiguration:", v4);
  return v4;
}

- (void)copyToConfiguration:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "setType:", type);
  objc_msgSend(v5, "setInlayInsetRadius:", self->_inlayInsetRadius);
  objc_msgSend(v5, "setHandWidth:", self->_handWidth);
  objc_msgSend(v5, "setHandLength:", self->_handLength);
  objc_msgSend(v5, "setPegRadius:", self->_pegRadius);
  objc_msgSend(v5, "setPegStrokeWidth:", self->_pegStrokeWidth);
  objc_msgSend(v5, "setArmLength:", self->_armLength);
  objc_msgSend(v5, "setArmWidth:", self->_armWidth);
  objc_msgSend(v5, "setTailLength:", self->_tailLength);
  objc_msgSend(v5, "setDropShadowOpacity:", self->_dropShadowOpacity);
  objc_msgSend(v5, "setDropShadowRadius:", self->_dropShadowRadius);
  objc_msgSend(v5, "setRadialShadowOpacity:", self->_radialShadowOpacity);
  objc_msgSend(v5, "setRadialShadowRadius:", self->_radialShadowRadius);
  objc_msgSend(v5, "setDirectionalShadowOffset:", self->_directionalShadowOffset.width, self->_directionalShadowOffset.height);
  objc_msgSend(v5, "setRoundedSecondHand:", self->_roundedSecondHand);
  objc_msgSend(v5, "setExcludePeg:", self->_excludePeg);
  objc_msgSend(v5, "setExcludeSecondTail:", self->_excludeSecondTail);
  objc_msgSend(v5, "setSmoothingRadius:", self->_smoothingRadius);
  objc_msgSend(v5, "setRemoveInlay:", self->_removeInlay);

}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4;
  unint64_t type;
  double inlayInsetRadius;
  double v7;
  double handWidth;
  double v9;
  double handLength;
  double v11;
  double pegRadius;
  double v13;
  double pegStrokeWidth;
  double v15;
  double armLength;
  double v17;
  double armWidth;
  double v19;
  double tailLength;
  double v21;
  int roundedSecondHand;
  int excludePeg;
  int excludeSecondTail;
  double smoothingRadius;
  double v26;
  BOOL v27;

  v4 = a3;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_14;
  inlayInsetRadius = self->_inlayInsetRadius;
  objc_msgSend(v4, "inlayInsetRadius");
  if (inlayInsetRadius != v7)
    goto LABEL_14;
  handWidth = self->_handWidth;
  objc_msgSend(v4, "handWidth");
  if (handWidth != v9)
    goto LABEL_14;
  handLength = self->_handLength;
  objc_msgSend(v4, "handLength");
  if (handLength != v11)
    goto LABEL_14;
  pegRadius = self->_pegRadius;
  objc_msgSend(v4, "pegRadius");
  if (pegRadius != v13)
    goto LABEL_14;
  pegStrokeWidth = self->_pegStrokeWidth;
  objc_msgSend(v4, "pegStrokeWidth");
  if (pegStrokeWidth != v15)
    goto LABEL_14;
  armLength = self->_armLength;
  objc_msgSend(v4, "armLength");
  if (armLength != v17)
    goto LABEL_14;
  armWidth = self->_armWidth;
  objc_msgSend(v4, "armWidth");
  if (armWidth == v19
    && (tailLength = self->_tailLength, objc_msgSend(v4, "tailLength"), tailLength == v21)
    && (roundedSecondHand = self->_roundedSecondHand,
        roundedSecondHand == objc_msgSend(v4, "roundedSecondHand"))
    && (excludePeg = self->_excludePeg, excludePeg == objc_msgSend(v4, "excludePeg"))
    && (excludeSecondTail = self->_excludeSecondTail,
        excludeSecondTail == objc_msgSend(v4, "excludeSecondTail")))
  {
    smoothingRadius = self->_smoothingRadius;
    objc_msgSend(v4, "smoothingRadius");
    v27 = smoothingRadius == v26;
  }
  else
  {
LABEL_14:
    v27 = 0;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  CLKUIAnalogHandConfiguration *v4;
  CLKUIAnalogHandConfiguration *v5;
  BOOL v6;

  v4 = (CLKUIAnalogHandConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CLKUIAnalogHandConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;

  v3 = -[CLKUIAnalogHandConfiguration type](self, "type");
  -[CLKUIAnalogHandConfiguration inlayInsetRadius](self, "inlayInsetRadius");
  v5 = v3 ^ v4;
  -[CLKUIAnalogHandConfiguration handWidth](self, "handWidth");
  v7 = v6;
  -[CLKUIAnalogHandConfiguration handLength](self, "handLength");
  v9 = v5 ^ v7 ^ v8;
  -[CLKUIAnalogHandConfiguration pegRadius](self, "pegRadius");
  v11 = v10;
  -[CLKUIAnalogHandConfiguration pegStrokeWidth](self, "pegStrokeWidth");
  v13 = v11 ^ v12;
  -[CLKUIAnalogHandConfiguration armLength](self, "armLength");
  v15 = v9 ^ v13 ^ v14;
  -[CLKUIAnalogHandConfiguration armWidth](self, "armWidth");
  v17 = v16;
  -[CLKUIAnalogHandConfiguration tailLength](self, "tailLength");
  v19 = v17 ^ v18;
  -[CLKUIAnalogHandConfiguration dropShadowRadius](self, "dropShadowRadius");
  v21 = v19 ^ v20;
  -[CLKUIAnalogHandConfiguration dropShadowOpacity](self, "dropShadowOpacity");
  v23 = v15 ^ v21 ^ v22;
  -[CLKUIAnalogHandConfiguration radialShadowRadius](self, "radialShadowRadius");
  v25 = v24;
  -[CLKUIAnalogHandConfiguration radialShadowOpacity](self, "radialShadowOpacity");
  v27 = v25 ^ v26;
  -[CLKUIAnalogHandConfiguration directionalShadowOffset](self, "directionalShadowOffset");
  v29 = v27 ^ v28;
  -[CLKUIAnalogHandConfiguration directionalShadowOffset](self, "directionalShadowOffset");
  v31 = v30;
  v32 = -[CLKUIAnalogHandConfiguration roundedSecondHand](self, "roundedSecondHand");
  v33 = -[CLKUIAnalogHandConfiguration excludePeg](self, "excludePeg");
  v34 = -[CLKUIAnalogHandConfiguration excludeSecondTail](self, "excludeSecondTail");
  -[CLKUIAnalogHandConfiguration smoothingRadius](self, "smoothingRadius");
  v36 = v35;
  v37 = -[CLKUIAnalogHandConfiguration removeInlay](self, "removeInlay");
  v38 = 0x10000000;
  if (!v37)
    v38 = 0;
  return v23 ^ v29 ^ v32 ^ v31 ^ v33 ^ v34 ^ v36 ^ v38;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  const __CFString *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CLKUIAnalogHandConfiguration type](self, "type");
  -[CLKUIAnalogHandConfiguration inlayInsetRadius](self, "inlayInsetRadius");
  v32 = v5;
  -[CLKUIAnalogHandConfiguration handWidth](self, "handWidth");
  v31 = v6;
  -[CLKUIAnalogHandConfiguration handLength](self, "handLength");
  v30 = v7;
  -[CLKUIAnalogHandConfiguration pegRadius](self, "pegRadius");
  v9 = v8;
  -[CLKUIAnalogHandConfiguration pegStrokeWidth](self, "pegStrokeWidth");
  v11 = v10;
  -[CLKUIAnalogHandConfiguration armLength](self, "armLength");
  v13 = v12;
  -[CLKUIAnalogHandConfiguration armWidth](self, "armWidth");
  v15 = v14;
  -[CLKUIAnalogHandConfiguration tailLength](self, "tailLength");
  v17 = v16;
  -[CLKUIAnalogHandConfiguration directionalShadowOffset](self, "directionalShadowOffset");
  v19 = v18;
  -[CLKUIAnalogHandConfiguration directionalShadowOffset](self, "directionalShadowOffset");
  v21 = v20;
  v22 = -[CLKUIAnalogHandConfiguration roundedSecondHand](self, "roundedSecondHand");
  v23 = -[CLKUIAnalogHandConfiguration excludePeg](self, "excludePeg");
  v24 = -[CLKUIAnalogHandConfiguration excludeSecondTail](self, "excludeSecondTail");
  -[CLKUIAnalogHandConfiguration smoothingRadius](self, "smoothingRadius");
  v26 = v25;
  v27 = -[CLKUIAnalogHandConfiguration removeInlay](self, "removeInlay");
  v28 = CFSTR("NO");
  if (v27)
    v28 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("type:%lu-inlayInsetRadius:%f-handWidth:%f-handLength:%f-pegRadius:%f-pegStrokeWidth:%f-armLength:%f-armWidth:%f-tailLength:%f-directionalShadowOffset:%f/%f-roundedSecondHand:%i-excludePeg:%i-excludeSecondTail:%i-smoothingRadius:%f-removeInlay:%@"), v4, v32, v31, v30, v9, v11, v13, v15, v17, v19, v21, v22, v23, v24, v26, v28);
}

- (id)handCacheIdentifier
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CLKUIAnalogHandConfiguration type](self, "type");
  -[CLKUIAnalogHandConfiguration inlayInsetRadius](self, "inlayInsetRadius");
  v29 = v5;
  -[CLKUIAnalogHandConfiguration handWidth](self, "handWidth");
  v28 = v6;
  -[CLKUIAnalogHandConfiguration handLength](self, "handLength");
  v27 = v7;
  -[CLKUIAnalogHandConfiguration pegRadius](self, "pegRadius");
  v9 = v8;
  -[CLKUIAnalogHandConfiguration pegStrokeWidth](self, "pegStrokeWidth");
  v11 = v10;
  -[CLKUIAnalogHandConfiguration armLength](self, "armLength");
  v13 = v12;
  -[CLKUIAnalogHandConfiguration armWidth](self, "armWidth");
  v15 = v14;
  -[CLKUIAnalogHandConfiguration tailLength](self, "tailLength");
  v17 = v16;
  -[CLKUIAnalogHandConfiguration directionalShadowOffset](self, "directionalShadowOffset");
  v19 = v18;
  -[CLKUIAnalogHandConfiguration directionalShadowOffset](self, "directionalShadowOffset");
  v21 = v20;
  v22 = -[CLKUIAnalogHandConfiguration roundedSecondHand](self, "roundedSecondHand");
  v23 = -[CLKUIAnalogHandConfiguration excludePeg](self, "excludePeg");
  v24 = -[CLKUIAnalogHandConfiguration excludeSecondTail](self, "excludeSecondTail");
  -[CLKUIAnalogHandConfiguration smoothingRadius](self, "smoothingRadius");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%lu-%f-%f-%f-%f-%f-%f-%f-%f-%f-%f-%i-%i-%i-%f-%d"), v4, v29, v28, v27, v9, v11, v13, v15, v17, v19, v21, v22, v23, v24, v25, -[CLKUIAnalogHandConfiguration removeInlay](self, "removeInlay") ^ 1);
}

- (id)radialShadowCacheIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CLKUIAnalogHandConfiguration handCacheIdentifier](self, "handCacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandConfiguration radialShadowRadius](self, "radialShadowRadius");
  v6 = v5;
  -[CLKUIAnalogHandConfiguration radialShadowOpacity](self, "radialShadowOpacity");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%f-%f"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dropShadowCacheIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CLKUIAnalogHandConfiguration handCacheIdentifier](self, "handCacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandConfiguration dropShadowRadius](self, "dropShadowRadius");
  v6 = v5;
  -[CLKUIAnalogHandConfiguration dropShadowOpacity](self, "dropShadowOpacity");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%f-%f"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)handLength
{
  return self->_handLength;
}

- (void)setHandLength:(double)a3
{
  self->_handLength = a3;
}

- (double)handWidth
{
  return self->_handWidth;
}

- (void)setHandWidth:(double)a3
{
  self->_handWidth = a3;
}

- (double)pegRadius
{
  return self->_pegRadius;
}

- (void)setPegRadius:(double)a3
{
  self->_pegRadius = a3;
}

- (double)pegStrokeWidth
{
  return self->_pegStrokeWidth;
}

- (void)setPegStrokeWidth:(double)a3
{
  self->_pegStrokeWidth = a3;
}

- (double)smoothingRadius
{
  return self->_smoothingRadius;
}

- (void)setSmoothingRadius:(double)a3
{
  self->_smoothingRadius = a3;
}

- (double)inlayInsetRadius
{
  return self->_inlayInsetRadius;
}

- (void)setInlayInsetRadius:(double)a3
{
  self->_inlayInsetRadius = a3;
}

- (double)armLength
{
  return self->_armLength;
}

- (void)setArmLength:(double)a3
{
  self->_armLength = a3;
}

- (double)armWidth
{
  return self->_armWidth;
}

- (void)setArmWidth:(double)a3
{
  self->_armWidth = a3;
}

- (BOOL)excludePeg
{
  return self->_excludePeg;
}

- (void)setExcludePeg:(BOOL)a3
{
  self->_excludePeg = a3;
}

- (BOOL)removeInlay
{
  return self->_removeInlay;
}

- (void)setRemoveInlay:(BOOL)a3
{
  self->_removeInlay = a3;
}

- (double)tailLength
{
  return self->_tailLength;
}

- (void)setTailLength:(double)a3
{
  self->_tailLength = a3;
}

- (double)dropShadowRadius
{
  return self->_dropShadowRadius;
}

- (void)setDropShadowRadius:(double)a3
{
  self->_dropShadowRadius = a3;
}

- (double)dropShadowOpacity
{
  return self->_dropShadowOpacity;
}

- (void)setDropShadowOpacity:(double)a3
{
  self->_dropShadowOpacity = a3;
}

- (double)radialShadowRadius
{
  return self->_radialShadowRadius;
}

- (void)setRadialShadowRadius:(double)a3
{
  self->_radialShadowRadius = a3;
}

- (double)radialShadowOpacity
{
  return self->_radialShadowOpacity;
}

- (void)setRadialShadowOpacity:(double)a3
{
  self->_radialShadowOpacity = a3;
}

- (CGSize)directionalShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_directionalShadowOffset.width;
  height = self->_directionalShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDirectionalShadowOffset:(CGSize)a3
{
  self->_directionalShadowOffset = a3;
}

- (BOOL)roundedSecondHand
{
  return self->_roundedSecondHand;
}

- (void)setRoundedSecondHand:(BOOL)a3
{
  self->_roundedSecondHand = a3;
}

- (BOOL)excludeSecondTail
{
  return self->_excludeSecondTail;
}

- (void)setExcludeSecondTail:(BOOL)a3
{
  self->_excludeSecondTail = a3;
}

@end
