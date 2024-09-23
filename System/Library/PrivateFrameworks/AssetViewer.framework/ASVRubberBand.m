@implementation ASVRubberBand

- (ASVRubberBand)initWithRubberBandFactor:(float)a3 minOffset:(float)a4 maxOffset:(float)a5 overshoot:(float)a6
{
  ASVRubberBand *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASVRubberBand;
  result = -[ASVRubberBand init](&v11, sel_init);
  if (result)
  {
    result->_rubberBandFactor = a3;
    result->_minOffset = a4;
    result->_maxOffset = a5;
    result->_overshoot = a6;
  }
  return result;
}

- (float)rubberBandOffsetForOffset:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  -[ASVRubberBand maxOffset](self, "maxOffset");
  if (v5 >= a3)
  {
    -[ASVRubberBand minOffset](self, "minOffset");
    if (v16 <= a3)
    {
      return a3;
    }
    else
    {
      -[ASVRubberBand minOffset](self, "minOffset");
      v18 = v17 - a3;
      -[ASVRubberBand overshoot](self, "overshoot");
      v20 = v18 / v19;
      -[ASVRubberBand rubberBandFactor](self, "rubberBandFactor");
      v22 = 1.0 - (float)(1.0 / (float)((float)(v21 * v20) + 1.0));
      -[ASVRubberBand minOffset](self, "minOffset");
      v24 = v23;
      -[ASVRubberBand overshoot](self, "overshoot");
      return v24 - (float)(v22 * v25);
    }
  }
  else
  {
    -[ASVRubberBand maxOffset](self, "maxOffset");
    v7 = a3 - v6;
    -[ASVRubberBand overshoot](self, "overshoot");
    v9 = v7 / v8;
    -[ASVRubberBand rubberBandFactor](self, "rubberBandFactor");
    v11 = 1.0 - (float)(1.0 / (float)((float)(v10 * v9) + 1.0));
    -[ASVRubberBand overshoot](self, "overshoot");
    v13 = v12;
    -[ASVRubberBand maxOffset](self, "maxOffset");
    return v14 + (float)(v11 * v13);
  }
}

- (float)offsetForRubberBandOffset:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;

  -[ASVRubberBand maxOffset](self, "maxOffset");
  if (v5 >= a3)
  {
    -[ASVRubberBand minOffset](self, "minOffset");
    if (v17 > a3)
    {
      -[ASVRubberBand minOffset](self, "minOffset");
      v19 = v18 - a3;
      -[ASVRubberBand overshoot](self, "overshoot");
      v21 = (float)(v19 / v20) + -1.0;
      if (v21 != 0.0)
      {
        v22 = (float)(-1.0 / v21) + -1.0;
        -[ASVRubberBand rubberBandFactor](self, "rubberBandFactor");
        v24 = v23;
        -[ASVRubberBand minOffset](self, "minOffset");
        v26 = v25;
        -[ASVRubberBand overshoot](self, "overshoot");
        return v26 + (float)((float)((float)-v22 / v24) * v27);
      }
    }
  }
  else
  {
    -[ASVRubberBand maxOffset](self, "maxOffset");
    v7 = a3 - v6;
    -[ASVRubberBand overshoot](self, "overshoot");
    v9 = (float)(v7 / v8) + -1.0;
    if (v9 != 0.0)
    {
      v10 = (float)(-1.0 / v9) + -1.0;
      -[ASVRubberBand rubberBandFactor](self, "rubberBandFactor");
      v12 = v10 / v11;
      -[ASVRubberBand overshoot](self, "overshoot");
      v14 = v13;
      -[ASVRubberBand maxOffset](self, "maxOffset");
      return v15 + (float)(v12 * v14);
    }
  }
  return a3;
}

- (BOOL)offsetIsWithinRubberBandedRange:(float)a3
{
  float v5;
  float v7;

  -[ASVRubberBand maxOffset](self, "maxOffset");
  if (v5 < a3)
    return 1;
  -[ASVRubberBand minOffset](self, "minOffset");
  return v7 > a3;
}

- (float)rubberBandFactor
{
  return self->_rubberBandFactor;
}

- (void)setRubberBandFactor:(float)a3
{
  self->_rubberBandFactor = a3;
}

- (float)minOffset
{
  return self->_minOffset;
}

- (void)setMinOffset:(float)a3
{
  self->_minOffset = a3;
}

- (float)maxOffset
{
  return self->_maxOffset;
}

- (void)setMaxOffset:(float)a3
{
  self->_maxOffset = a3;
}

- (float)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(float)a3
{
  self->_overshoot = a3;
}

@end
