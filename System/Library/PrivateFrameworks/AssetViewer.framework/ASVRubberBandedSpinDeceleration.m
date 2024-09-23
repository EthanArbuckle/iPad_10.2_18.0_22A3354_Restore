@implementation ASVRubberBandedSpinDeceleration

- (ASVRubberBandedSpinDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 startingOffset:(float)a5 decelerationRate:(float)a6 rubberBand:(id)a7
{
  id v13;
  double v14;
  double v15;
  double v16;
  ASVRubberBandedSpinDeceleration *v17;
  ASVRubberBandedSpinDeceleration *v18;
  double v19;
  float v20;
  objc_super v22;

  v13 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ASVRubberBandedSpinDeceleration;
  *(float *)&v14 = a3;
  *(float *)&v15 = a4;
  *(float *)&v16 = a6;
  v17 = -[ASVDampingDeceleration initWithVelocity:minEndDelta:decelerationRate:](&v22, sel_initWithVelocity_minEndDelta_decelerationRate_, v14, v15, v16);
  v18 = v17;
  if (v17)
  {
    v17->_currentOffset = a5;
    objc_storeStrong((id *)&v17->_rubberBand, a7);
    *(float *)&v19 = a5;
    objc_msgSend(v13, "rubberBandOffsetForOffset:", v19);
    v18->_previousRubberBandedOffset = v20;
  }

  return v18;
}

- (float)decelerationDelta
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  float v25;
  objc_super v27;

  v3 = 0.0;
  if (!-[ASVDeceleration isDecelerating](self, "isDecelerating"))
    return v3;
  v27.receiver = self;
  v27.super_class = (Class)ASVRubberBandedSpinDeceleration;
  -[ASVDampingDeceleration decelerationDelta](&v27, sel_decelerationDelta);
  v5 = v4;
  -[ASVRubberBandedSpinDeceleration currentOffset](self, "currentOffset");
  *(float *)&v7 = v5 + v6;
  -[ASVRubberBandedSpinDeceleration setCurrentOffset:](self, "setCurrentOffset:", v7);
  -[ASVRubberBandedSpinDeceleration currentOffset](self, "currentOffset");
  v9 = v8;
  -[ASVRubberBandedSpinDeceleration rubberBand](self, "rubberBand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maxOffset");
  if (v9 <= v11 || (-[ASVDeceleration velocity](self, "velocity"), v12 <= 0.0))
  {
    -[ASVRubberBandedSpinDeceleration currentOffset](self, "currentOffset");
    v14 = v13;
    -[ASVRubberBandedSpinDeceleration rubberBand](self, "rubberBand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minOffset");
    if (v14 >= v16)
    {

    }
    else
    {
      -[ASVDeceleration velocity](self, "velocity");
      v18 = v17;

      if (v18 < 0.0)
        goto LABEL_7;
    }
    -[ASVRubberBandedSpinDeceleration currentOffset](self, "currentOffset");
    v21 = v22;
    goto LABEL_10;
  }

LABEL_7:
  -[ASVRubberBandedSpinDeceleration rubberBand](self, "rubberBand");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVRubberBandedSpinDeceleration currentOffset](self, "currentOffset");
  objc_msgSend(v19, "rubberBandOffsetForOffset:");
  v21 = v20;

LABEL_10:
  -[ASVRubberBandedSpinDeceleration previousRubberBandedOffset](self, "previousRubberBandedOffset");
  v3 = v21 - v23;
  *(float *)&v24 = v21;
  -[ASVRubberBandedSpinDeceleration setPreviousRubberBandedOffset:](self, "setPreviousRubberBandedOffset:", v24);
  if (-[ASVDeceleration frameCount](self, "frameCount"))
  {
    -[ASVDeceleration minEndDelta](self, "minEndDelta");
    if (fabsf(v3) <= v25)
    {
      -[ASVDeceleration setIsDecelerating:](self, "setIsDecelerating:", 0);
      return 0.0;
    }
  }
  return v3;
}

- (float)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(float)a3
{
  self->_currentOffset = a3;
}

- (float)previousRubberBandedOffset
{
  return self->_previousRubberBandedOffset;
}

- (void)setPreviousRubberBandedOffset:(float)a3
{
  self->_previousRubberBandedOffset = a3;
}

- (ASVRubberBand)rubberBand
{
  return self->_rubberBand;
}

- (void)setRubberBand:(id)a3
{
  objc_storeStrong((id *)&self->_rubberBand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rubberBand, 0);
}

@end
