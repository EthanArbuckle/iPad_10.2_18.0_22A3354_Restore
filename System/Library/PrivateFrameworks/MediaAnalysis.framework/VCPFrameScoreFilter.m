@implementation VCPFrameScoreFilter

- (VCPFrameScoreFilter)initWithFilterTabs:(int)a3 distanceVariance:(float)a4 diffVariance:(float)a5
{
  VCPFrameScoreFilter *v8;
  VCPFrameScoreFilter *v9;
  VCPFrameScoreFilter *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPFrameScoreFilter;
  v8 = -[VCPFrameScoreFilter init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_numFilterTabs = a3;
    v8->_distanceVariance = a4;
    v8->_diffVariance = a5;
    v8->_numOfScores = 0;
    v8->_scoreArray = (float *)operator new[]();
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  float *scoreArray;
  objc_super v4;

  scoreArray = self->_scoreArray;
  if (scoreArray)
    MEMORY[0x1BCCA128C](scoreArray, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPFrameScoreFilter;
  -[VCPFrameScoreFilter dealloc](&v4, sel_dealloc);
}

- (float)processFrameScore:(float)a3 validScore:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t numOfScores;
  uint64_t v8;
  float v9;
  float v10;
  float *scoreArray;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int numFilterTabs;
  float *v20;
  unint64_t v21;
  float v23;
  float v24;
  float v25;
  float result;
  float v27;

  v4 = a4;
  numOfScores = self->_numOfScores;
  if ((int)numOfScores < 1)
  {
    v13 = 0.0;
    v12 = 0.0;
  }
  else
  {
    v8 = 0;
    v9 = self->_distanceVariance * self->_distanceVariance;
    v10 = self->_diffVariance * self->_diffVariance;
    scoreArray = self->_scoreArray;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      v14 = v8 + 1;
      v15 = expf((float)((float)((float)(v8 + 1) * -0.5) * (float)(v8 + 1)) / v9);
      v16 = scoreArray[v8];
      v17 = vabds_f32(a3, v16);
      if (!v4)
        v17 = 0.0;
      v18 = v15 * expf((float)(v17 * (float)(v17 * -0.5)) / v10);
      v12 = v12 + (float)(v16 * v18);
      v13 = v13 + v18;
      ++v8;
    }
    while (numOfScores != v14);
  }
  numFilterTabs = self->_numFilterTabs;
  v20 = self->_scoreArray;
  if (numFilterTabs > 1)
  {
    v21 = self->_numFilterTabs;
    do
      v20[(v21 - 1)] = v20[(v21 - 2)];
    while (v21-- > 2);
  }
  v23 = v13 + 1.0;
  if (!v4)
    v23 = v13;
  v24 = -0.0;
  if (v4)
    v24 = a3;
  v25 = (float)(v24 + v12) / v23;
  if (v23 <= 0.0)
    result = a3;
  else
    result = v25;
  if (v4)
    v27 = a3;
  else
    v27 = result;
  *v20 = v27;
  if (numFilterTabs >= (int)numOfScores + 1)
    numFilterTabs = numOfScores + 1;
  self->_numOfScores = numFilterTabs;
  return result;
}

@end
