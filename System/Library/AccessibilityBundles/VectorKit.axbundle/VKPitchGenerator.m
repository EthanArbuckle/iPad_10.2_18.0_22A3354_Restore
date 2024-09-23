@implementation VKPitchGenerator

+ (id)AXVectorKitBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

+ (id)defaultSoundFileURL
{
  void *v2;
  void *v3;

  +[VKPitchGenerator AXVectorKitBundle](VKPitchGenerator, "AXVectorKitBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("3beacon"), CFSTR("aiff"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fourPitchesSoundFileArray
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  +[VKPitchGenerator AXVectorKitBundle](VKPitchGenerator, "AXVectorKitBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("4beacon"), CFSTR("aiff"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[VKPitchGenerator AXVectorKitBundle](VKPitchGenerator, "AXVectorKitBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("3beacon"), CFSTR("aiff"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[VKPitchGenerator AXVectorKitBundle](VKPitchGenerator, "AXVectorKitBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("2beacon"), CFSTR("aiff"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VKPitchGenerator AXVectorKitBundle](VKPitchGenerator, "AXVectorKitBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("1beacon"), CFSTR("aiff"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v3;
  v12[1] = v5;
  v12[2] = v7;
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)twoPitchesSoundFileArray
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  +[VKPitchGenerator AXVectorKitBundle](VKPitchGenerator, "AXVectorKitBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("4beacon"), CFSTR("aiff"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[VKPitchGenerator AXVectorKitBundle](VKPitchGenerator, "AXVectorKitBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("3beacon"), CFSTR("aiff"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v3;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VKPitchGenerator)initWithPitchMode:(int64_t)a3 minDepth:(id)a4 maxDepth:(id)a5 minPtich:(id)a6 maxPitch:(id)a7 twoPitchesThreshold:(id)a8 fourPitchesThresholdArray:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  VKPitchGenerator *v19;
  VKPitchGenerator *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  uint64_t v30;
  NSNumber *intercept;
  double v32;
  uint64_t v33;
  NSNumber *slope;
  NSNumber *v35;
  VKPitchGenerator *v36;
  id v38;
  id v39;
  objc_super v40;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v39 = a8;
  v38 = a9;
  v40.receiver = self;
  v40.super_class = (Class)VKPitchGenerator;
  v19 = -[VKPitchGenerator init](&v40, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_pitchMode = a3;
    objc_storeStrong((id *)&v19->_minPitch, a6);
    objc_storeStrong((id *)&v20->_maxPitch, a7);
    objc_storeStrong((id *)&v20->_twoPitchesThreshold, a8);
    objc_storeStrong((id *)&v20->_fourPitchesThresholdArray, a9);
    if (v16 && v15 && v17 && v18)
    {
      objc_msgSend(v18, "floatValue");
      v22 = v21;
      objc_msgSend(v17, "floatValue");
      v24 = v23;
      objc_msgSend(v15, "floatValue");
      v26 = v25;
      objc_msgSend(v16, "floatValue");
      v28 = (float)(v22 - v24) / (float)(v27 - v26);
      *(float *)&v29 = v24 - (float)(v28 * v27);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      intercept = v20->_intercept;
      v20->_intercept = (NSNumber *)v30;

      *(float *)&v32 = v28;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      slope = v20->_slope;
      v20->_slope = (NSNumber *)v33;
    }
    else
    {
      v35 = v20->_slope;
      v20->_slope = 0;

      slope = v20->_intercept;
      v20->_intercept = 0;
    }

    v36 = v20;
  }

  return v20;
}

- (VKPitchGenerator)initWithMinPitch:(id)a3 maxPitch:(id)a4 minDepth:(id)a5 maxDepth:(id)a6
{
  return -[VKPitchGenerator initWithPitchMode:minDepth:maxDepth:minPtich:maxPitch:twoPitchesThreshold:fourPitchesThresholdArray:](self, "initWithPitchMode:minDepth:maxDepth:minPtich:maxPitch:twoPitchesThreshold:fourPitchesThresholdArray:", 0, a5, a6, a3, a4, 0, 0);
}

- (VKPitchGenerator)initWithTwoPitchesThreshold:(id)a3
{
  return -[VKPitchGenerator initWithPitchMode:minDepth:maxDepth:minPtich:maxPitch:twoPitchesThreshold:fourPitchesThresholdArray:](self, "initWithPitchMode:minDepth:maxDepth:minPtich:maxPitch:twoPitchesThreshold:fourPitchesThresholdArray:", 1, 0, 0, 0, 0, a3, 0);
}

- (VKPitchGenerator)initWithFourPitchesThresholdArray:(id)a3
{
  return -[VKPitchGenerator initWithPitchMode:minDepth:maxDepth:minPtich:maxPitch:twoPitchesThreshold:fourPitchesThresholdArray:](self, "initWithPitchMode:minDepth:maxDepth:minPtich:maxPitch:twoPitchesThreshold:fourPitchesThresholdArray:", 2, 0, 0, 0, 0, 0, a3);
}

- (float)pitchForDepth:(int)a3
{
  float result;
  NSNumber *maxPitch;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  NSNumber *minPitch;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;

  if (self->_pitchMode)
    return 1.0;
  if (!self->_minPitch)
    return 1.0;
  maxPitch = self->_maxPitch;
  if (!maxPitch || !self->_slope || !self->_intercept)
    return 1.0;
  -[NSNumber floatValue](maxPitch, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->_minPitch, "floatValue");
  v10 = v9;
  -[NSNumber floatValue](self->_slope, "floatValue");
  v12 = v11;
  v13 = (float)a3;
  -[NSNumber floatValue](self->_intercept, "floatValue");
  if (v10 <= (float)(v14 + (float)(v12 * (float)a3)))
  {
    -[NSNumber floatValue](self->_slope, "floatValue");
    v17 = v16;
    -[NSNumber floatValue](self->_intercept, "floatValue");
    v15 = v18 + (float)(v17 * v13);
  }
  else
  {
    -[NSNumber floatValue](self->_minPitch, "floatValue");
  }
  if (v8 < v15)
  {
    minPitch = self->_maxPitch;
LABEL_14:
    -[NSNumber floatValue](minPitch, "floatValue");
    return result;
  }
  -[NSNumber floatValue](self->_minPitch, "floatValue");
  v21 = v20;
  -[NSNumber floatValue](self->_slope, "floatValue");
  v23 = v22;
  -[NSNumber floatValue](self->_intercept, "floatValue");
  if (v21 > (float)(v24 + (float)(v23 * v13)))
  {
    minPitch = self->_minPitch;
    goto LABEL_14;
  }
  -[NSNumber floatValue](self->_slope, "floatValue");
  v26 = v25;
  -[NSNumber floatValue](self->_intercept, "floatValue");
  return v27 + (float)(v26 * v13);
}

- (id)fileForDepthInUnit:(double)a3
{
  id v4;
  int64_t pitchMode;
  NSArray *fourPitchesThresholdArray;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSNumber *twoPitchesThreshold;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = self;
  pitchMode = self->_pitchMode;
  if (pitchMode == 2)
  {
    fourPitchesThresholdArray = self->_fourPitchesThresholdArray;
    if (fourPitchesThresholdArray)
    {
      -[NSArray lastObject](fourPitchesThresholdArray, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      if (v9 >= a3)
      {
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__4;
        v23 = __Block_byref_object_dispose__4;
        v24 = 0;
        objc_msgSend(v4, "fourPitchesThresholdArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __39__VKPitchGenerator_fileForDepthInUnit___block_invoke;
        v18[3] = &unk_2503C55D0;
        *(double *)&v18[5] = a3;
        v18[4] = &v19;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

        v4 = (id)v20[5];
        _Block_object_dispose(&v19, 8);

        return v4;
      }
      +[VKPitchGenerator fourPitchesSoundFileArray](VKPitchGenerator, "fourPitchesSoundFileArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      goto LABEL_10;
    }
  }
  else
  {
    if (pitchMode != 1)
    {
      if (pitchMode)
        return v4;
      goto LABEL_11;
    }
    twoPitchesThreshold = self->_twoPitchesThreshold;
    if (twoPitchesThreshold)
    {
      -[NSNumber doubleValue](twoPitchesThreshold, "doubleValue");
      v14 = v13;
      +[VKPitchGenerator twoPitchesSoundFileArray](VKPitchGenerator, "twoPitchesSoundFileArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v14 >= a3)
      {
        objc_msgSend(v10, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
LABEL_10:
      objc_msgSend(v10, "lastObject");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v4 = (id)v15;

      return v4;
    }
  }
LABEL_11:
  +[VKPitchGenerator defaultSoundFileURL](VKPitchGenerator, "defaultSoundFileURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  return v4;
}

void __39__VKPitchGenerator_fileForDepthInUnit___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = *(double *)(a1 + 40);
  objc_msgSend(a2, "doubleValue");
  if (v7 <= v8)
  {
    +[VKPitchGenerator fourPitchesSoundFileArray](VKPitchGenerator, "fourPitchesSoundFileArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (int64_t)pitchMode
{
  return self->_pitchMode;
}

- (void)setPitchMode:(int64_t)a3
{
  self->_pitchMode = a3;
}

- (NSNumber)minPitch
{
  return self->_minPitch;
}

- (void)setMinPitch:(id)a3
{
  objc_storeStrong((id *)&self->_minPitch, a3);
}

- (NSNumber)maxPitch
{
  return self->_maxPitch;
}

- (void)setMaxPitch:(id)a3
{
  objc_storeStrong((id *)&self->_maxPitch, a3);
}

- (NSNumber)twoPitchesThreshold
{
  return self->_twoPitchesThreshold;
}

- (void)setTwoPitchesThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_twoPitchesThreshold, a3);
}

- (NSArray)fourPitchesThresholdArray
{
  return self->_fourPitchesThresholdArray;
}

- (void)setFourPitchesThresholdArray:(id)a3
{
  objc_storeStrong((id *)&self->_fourPitchesThresholdArray, a3);
}

- (NSNumber)slope
{
  return self->_slope;
}

- (void)setSlope:(id)a3
{
  objc_storeStrong((id *)&self->_slope, a3);
}

- (NSNumber)intercept
{
  return self->_intercept;
}

- (void)setIntercept:(id)a3
{
  objc_storeStrong((id *)&self->_intercept, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intercept, 0);
  objc_storeStrong((id *)&self->_slope, 0);
  objc_storeStrong((id *)&self->_fourPitchesThresholdArray, 0);
  objc_storeStrong((id *)&self->_twoPitchesThreshold, 0);
  objc_storeStrong((id *)&self->_maxPitch, 0);
  objc_storeStrong((id *)&self->_minPitch, 0);
}

@end
