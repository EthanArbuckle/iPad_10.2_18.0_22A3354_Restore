@implementation CIBurstClusterDivider

- (int64_t)compareDividers:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v9;
  float v10;
  float v11;

  objc_msgSend(a3, "dividerScore");
  v6 = v5;
  -[CIBurstClusterDivider dividerScore](self, "dividerScore");
  if (v6 > v7)
    return 1;
  objc_msgSend(a3, "dividerScore");
  v10 = v9;
  -[CIBurstClusterDivider dividerScore](self, "dividerScore");
  if (v10 >= v11)
    return 0;
  else
    return -1;
}

- (int64_t)compareIndices:(id)a3
{
  int v5;
  int v7;

  v5 = objc_msgSend(a3, "leftImage");
  if (v5 > -[CIBurstClusterDivider leftImage](self, "leftImage"))
    return -1;
  v7 = objc_msgSend(a3, "leftImage");
  return v7 < -[CIBurstClusterDivider leftImage](self, "leftImage");
}

- (int64_t)compareActionAmounts:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v9;
  float v10;
  float v11;

  objc_msgSend(a3, "actionAmount");
  v6 = v5;
  -[CIBurstClusterDivider actionAmount](self, "actionAmount");
  if (v6 > v7)
    return 1;
  objc_msgSend(a3, "actionAmount");
  v10 = v9;
  -[CIBurstClusterDivider actionAmount](self, "actionAmount");
  if (v10 >= v11)
    return 0;
  else
    return -1;
}

- (float)dividerScore
{
  return self->dividerScore;
}

- (void)setDividerScore:(float)a3
{
  self->dividerScore = a3;
}

- (int)leftImage
{
  return self->leftImage;
}

- (void)setLeftImage:(int)a3
{
  self->leftImage = a3;
}

- (int)trueLocalMaximum
{
  return self->trueLocalMaximum;
}

- (void)setTrueLocalMaximum:(int)a3
{
  self->trueLocalMaximum = a3;
}

- (float)actionAmount
{
  return self->actionAmount;
}

- (void)setActionAmount:(float)a3
{
  self->actionAmount = a3;
}

- (float)noiseThreshold
{
  return self->noiseThreshold;
}

- (void)setNoiseThreshold:(float)a3
{
  self->noiseThreshold = a3;
}

- (float)highNoiseThreshold
{
  return self->highNoiseThreshold;
}

- (void)setHighNoiseThreshold:(float)a3
{
  self->highNoiseThreshold = a3;
}

@end
