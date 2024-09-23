@implementation VCPHuman

- (VCPHuman)init
{
  VCPHuman *v2;
  VCPHuman *v3;
  CGSize v4;
  uint64_t v5;
  __int128 v6;
  VNTorsoprint *torsoprint;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPHuman;
  v2 = -[VCPHuman init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_flags = 0;
    v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v2->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->_bounds.size = v4;
    *(_QWORD *)&v2->_confidence = 0;
    v5 = MEMORY[0x1E0CA2E40];
    v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&v2->_timerange.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&v2->_timerange.start.epoch = v6;
    *(_OWORD *)&v2->_timerange.duration.timescale = *(_OWORD *)(v5 + 32);
    torsoprint = v2->_torsoprint;
    v2->_torsoprint = 0;

  }
  return v3;
}

+ (unint64_t)flagsFromKeypoints:(id)a3 withMinConfidence:(float)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  unsigned __int8 v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  uint64_t v19;
  BOOL v20;

  v5 = a3;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = -13;
  while (objc_msgSend(v5, "count") > v6)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 != 3)
      goto LABEL_25;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    if (v18 > a4)
    {
      if (v6 > 4)
      {
        if (v12 + 8 > 1)
        {
          if (v12 < 0xFFFFFFFE)
          {
            if (v12 + 6 > 1)
            {
              if (v12 < 2)
                v7 |= 0x800000uLL;
            }
            else
            {
              v7 |= 0x400000uLL;
            }
          }
          else
          {
            ++v10;
          }
        }
        else
        {
          ++v9;
        }
      }
      else
      {
        v11 |= v6 < 3;
        ++v8;
      }
    }
    ++v6;
    ++v12;
  }
  if ((v11 & (v8 > 2)) != 0)
    v19 = v7 | 0x100000;
  else
    v19 = v7;
  if (v10)
    v20 = v9 == 0;
  else
    v20 = 1;
  if (v20)
    v7 = v19;
  else
    v7 = v19 | 0x200000;
LABEL_25:

  return v7;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int)humanID
{
  return self->_humanID;
}

- (void)setHumanID:(int)a3
{
  self->_humanID = a3;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timerange
{
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;

  objc_copyStruct(retstr, &self->_timerange, 48, 1, 0);
  return result;
}

- (void)setTimerange:(id *)a3
{
  objc_copyStruct(&self->_timerange, a3, 48, 1, 0);
}

- (VNTorsoprint)torsoprint
{
  return (VNTorsoprint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTorsoprint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprint, 0);
}

@end
