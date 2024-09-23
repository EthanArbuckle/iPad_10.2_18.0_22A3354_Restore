@implementation AXMADSREnvelope

+ (id)defaultEnvelope
{
  return -[AXMADSREnvelope initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:]([AXMADSREnvelope alloc], "initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:", 20.0, 1.0, 200.0, 50.0, 0.0, 50.0);
}

- (AXMADSREnvelope)initWithAttackDuration:(double)a3 attackLevel:(double)a4 decayDuration:(double)a5 sustainDuration:(double)a6 sustainLevel:(double)a7 releaseDuration:(double)a8
{
  AXMADSREnvelope *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXMADSREnvelope;
  result = -[AXMADSREnvelope init](&v15, sel_init);
  if (result)
  {
    result->_attackMS = a3;
    result->_attackLevel = a4;
    result->_decayMS = a5;
    result->_sustainMS = a6;
    result->_sustainLevel = a7;
    result->_releaseMS = a8;
  }
  return result;
}

- (AXMADSREnvelope)init
{
  return -[AXMADSREnvelope initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:](self, "initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
}

- (id)copy
{
  return -[AXMADSREnvelope initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:]([AXMADSREnvelope alloc], "initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:", self->_attackMS, self->_attackLevel, self->_decayMS, self->_sustainMS, self->_sustainLevel, self->_releaseMS);
}

- (double)lengthMS
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AXMADSREnvelope attackMS](self, "attackMS");
  v4 = v3;
  -[AXMADSREnvelope decayMS](self, "decayMS");
  v6 = v4 + v5;
  -[AXMADSREnvelope sustainMS](self, "sustainMS");
  v8 = v6 + v7;
  -[AXMADSREnvelope releaseMS](self, "releaseMS");
  return v8 + v9;
}

- (double)levelForTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;
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

  -[AXMADSREnvelope attackMS](self, "attackMS");
  v6 = v5;
  -[AXMADSREnvelope attackMS](self, "attackMS");
  v8 = v7;
  if (v6 > a3)
  {
    -[AXMADSREnvelope attackLevel](self, "attackLevel");
    return a3 / v8 * v9;
  }
  -[AXMADSREnvelope decayMS](self, "decayMS");
  v12 = v8 + v11;
  -[AXMADSREnvelope attackMS](self, "attackMS");
  v14 = v13;
  if (v12 <= a3)
  {
    -[AXMADSREnvelope decayMS](self, "decayMS");
    v26 = v14 + v25;
    -[AXMADSREnvelope sustainMS](self, "sustainMS");
    if (v26 + v27 > a3)
    {
      -[AXMADSREnvelope sustainLevel](self, "sustainLevel");
      return result;
    }
    -[AXMADSREnvelope attackMS](self, "attackMS");
    v29 = a3 - v28;
    -[AXMADSREnvelope decayMS](self, "decayMS");
    v31 = v29 - v30;
    -[AXMADSREnvelope sustainMS](self, "sustainMS");
    v33 = v31 - v32;
    -[AXMADSREnvelope releaseMS](self, "releaseMS");
    v17 = v34;
    -[AXMADSREnvelope sustainLevel](self, "sustainLevel");
    v19 = v35;
    -[AXMADSREnvelope sustainLevel](self, "sustainLevel");
    v24 = -v33;
  }
  else
  {
    v15 = a3 - v13;
    -[AXMADSREnvelope decayMS](self, "decayMS");
    v17 = v16;
    -[AXMADSREnvelope attackLevel](self, "attackLevel");
    v19 = v18;
    -[AXMADSREnvelope attackLevel](self, "attackLevel");
    v21 = v20;
    -[AXMADSREnvelope sustainLevel](self, "sustainLevel");
    v23 = v21 - v22;
    v24 = -v15;
  }
  return v19 + v24 / v17 * v23;
}

- (double)attackMS
{
  return self->_attackMS;
}

- (void)setAttackMS:(double)a3
{
  self->_attackMS = a3;
}

- (double)attackLevel
{
  return self->_attackLevel;
}

- (void)setAttackLevel:(double)a3
{
  self->_attackLevel = a3;
}

- (double)decayMS
{
  return self->_decayMS;
}

- (void)setDecayMS:(double)a3
{
  self->_decayMS = a3;
}

- (double)sustainMS
{
  return self->_sustainMS;
}

- (void)setSustainMS:(double)a3
{
  self->_sustainMS = a3;
}

- (double)sustainLevel
{
  return self->_sustainLevel;
}

- (void)setSustainLevel:(double)a3
{
  self->_sustainLevel = a3;
}

- (double)releaseMS
{
  return self->_releaseMS;
}

- (void)setReleaseMS:(double)a3
{
  self->_releaseMS = a3;
}

@end
