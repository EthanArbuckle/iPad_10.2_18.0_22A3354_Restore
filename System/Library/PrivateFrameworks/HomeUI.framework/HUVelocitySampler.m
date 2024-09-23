@implementation HUVelocitySampler

- (void)addTouchSample:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  y = a3.y;
  x = a3.x;
  v6 = CACurrentMediaTime();
  -[HUVelocitySampler currentSample](self, "currentSample");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[HUVelocitySampler currentSample](self, "currentSample"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isSampleDistinctFromPoint:", x, y),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    -[HUVelocitySampler currentSample](self, "currentSample");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEnd:", x, y);

    -[HUVelocitySampler currentSample](self, "currentSample");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEndTime:", v6);
  }
  else
  {
    -[HUVelocitySampler currentSample](self, "currentSample");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HUVelocitySampler currentSample](self, "currentSample");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "end");
      v14 = v13;
      v16 = v15;

      -[HUVelocitySampler currentSample](self, "currentSample");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endTime");
      v19 = v18;

    }
    else
    {
      v14 = x;
      v16 = y;
      v19 = v6;
    }
    -[HUVelocitySampler currentSample](self, "currentSample");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUVelocitySampler setPreviousSample:](self, "setPreviousSample:", v21);

    +[HUVelocitySample sampleWithStart:end:startTime:endTime:](HUVelocitySample, "sampleWithStart:end:startTime:endTime:", v14, v16, x, y, v19, v6);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[HUVelocitySampler setCurrentSample:](self, "setCurrentSample:", v22);
  }

}

- (void)reset
{
  -[HUVelocitySampler setPreviousSample:](self, "setPreviousSample:", 0);
  -[HUVelocitySampler setCurrentSample:](self, "setCurrentSample:", 0);
}

- (CGVector)velocity
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGVector result;

  -[HUVelocitySampler currentSample](self, "currentSample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUVelocitySampler currentSample](self, "currentSample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocity");
    v6 = v5;
    v8 = v7;

    -[HUVelocitySampler previousSample](self, "previousSample");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[HUVelocitySampler previousSample](self, "previousSample");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dt");
      v13 = v12;

      if (v13 > 0.00000011920929)
      {
        -[HUVelocitySampler previousSample](self, "previousSample");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "velocity");
        v16 = v15;
        v18 = v17;

        v6 = v16 * 0.75 + v6 * 0.25;
        v8 = v18 * 0.75 + v8 * 0.25;
      }
    }
  }
  else
  {
    v6 = 0.0;
    v8 = 0.0;
  }
  v19 = v6;
  v20 = v8;
  result.dy = v20;
  result.dx = v19;
  return result;
}

- (HUVelocitySample)currentSample
{
  return self->_currentSample;
}

- (void)setCurrentSample:(id)a3
{
  objc_storeStrong((id *)&self->_currentSample, a3);
}

- (HUVelocitySample)previousSample
{
  return self->_previousSample;
}

- (void)setPreviousSample:(id)a3
{
  objc_storeStrong((id *)&self->_previousSample, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSample, 0);
  objc_storeStrong((id *)&self->_currentSample, 0);
}

@end
