@implementation ULHomeSlamFence

- (ULHomeSlamFence)initWithFenceRadius:(float)a3
{
  ULHomeSlamFence *v4;
  double v5;
  ULHomeSlamFence *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ULHomeSlamFence;
  v4 = -[ULHomeSlamFence init](&v8, sel_init);
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = a3 * a3;
    -[ULHomeSlamFence setRadiusSquare:](v4, "setRadiusSquare:", v5);
  }
  return v6;
}

- (BOOL)didFenceCrossWithOdometryEntry:(const void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v5 = (void *)*((_QWORD *)a3 + 3);
  objc_msgSend(MEMORY[0x24BDD1880], "nilUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7)
  {
    -[ULHomeSlamFence trajectoryUUID](self, "trajectoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ULHomeSlamFence trajectoryUUID](self, "trajectoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:", *((_QWORD *)a3 + 3));

      if (v10)
      {
        -[ULHomeSlamFence _resetState](self, "_resetState");
        -[ULHomeSlamFence _updateStateWithEntry:](self, "_updateStateWithEntry:", a3);
        v11 = (void *)objc_msgSend(*((id *)a3 + 3), "copy");
        -[ULHomeSlamFence setTrajectoryUUID:](self, "setTrajectoryUUID:", v11);

        return 1;
      }
    }
    else
    {
      -[ULHomeSlamFence _resetState](self, "_resetState");
      v13 = (void *)objc_msgSend(*((id *)a3 + 3), "copy");
      -[ULHomeSlamFence setTrajectoryUUID:](self, "setTrajectoryUUID:", v13);

    }
    -[ULHomeSlamFence _updateStateWithEntry:](self, "_updateStateWithEntry:", a3);
    return -[ULHomeSlamFence _checkFenceCrossAndResetIfNeeded](self, "_checkFenceCrossAndResetIfNeeded");
  }
  else
  {
    -[ULHomeSlamFence _resetState](self, "_resetState");
    return 0;
  }
}

- (void)_resetState
{
  double v2;
  double v4;

  LODWORD(v2) = 0;
  -[ULHomeSlamFence setDeltaPositionX:](self, "setDeltaPositionX:", v2);
  LODWORD(v4) = 0;
  -[ULHomeSlamFence setDeltaPositionY:](self, "setDeltaPositionY:", v4);
  -[ULHomeSlamFence setTrajectoryUUID:](self, "setTrajectoryUUID:", 0);
}

- (void)_updateStateWithEntry:(const void *)a3
{
  float v5;
  double v6;
  float v7;
  double v8;

  -[ULHomeSlamFence deltaPositionX](self, "deltaPositionX");
  *(float *)&v6 = v5 + *(float *)a3;
  -[ULHomeSlamFence setDeltaPositionX:](self, "setDeltaPositionX:", v6);
  -[ULHomeSlamFence deltaPositionY](self, "deltaPositionY");
  *(float *)&v8 = v7 + *((float *)a3 + 1);
  -[ULHomeSlamFence setDeltaPositionY:](self, "setDeltaPositionY:", v8);
}

- (BOOL)_checkFenceCrossAndResetIfNeeded
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;

  -[ULHomeSlamFence deltaPositionX](self, "deltaPositionX");
  v4 = v3;
  -[ULHomeSlamFence deltaPositionX](self, "deltaPositionX");
  v6 = v5;
  -[ULHomeSlamFence deltaPositionY](self, "deltaPositionY");
  v8 = v7;
  -[ULHomeSlamFence deltaPositionY](self, "deltaPositionY");
  v10 = (float)(v8 * v9) + (float)(v4 * v6);
  -[ULHomeSlamFence radiusSquare](self, "radiusSquare");
  v12 = v11;
  if (v10 > v11)
    -[ULHomeSlamFence _resetState](self, "_resetState");
  return v10 > v12;
}

- (float)radiusSquare
{
  return self->_radiusSquare;
}

- (void)setRadiusSquare:(float)a3
{
  self->_radiusSquare = a3;
}

- (float)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(float)a3
{
  self->_deltaPositionX = a3;
}

- (float)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(float)a3
{
  self->_deltaPositionY = a3;
}

- (NSUUID)trajectoryUUID
{
  return self->_trajectoryUUID;
}

- (void)setTrajectoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_trajectoryUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trajectoryUUID, 0);
}

@end
