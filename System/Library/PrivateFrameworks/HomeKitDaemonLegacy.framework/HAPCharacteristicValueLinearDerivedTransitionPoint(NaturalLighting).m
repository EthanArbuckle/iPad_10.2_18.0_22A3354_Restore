@implementation HAPCharacteristicValueLinearDerivedTransitionPoint(NaturalLighting)

- (unint64_t)colorTemperatureForBrightness:()NaturalLighting
{
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  unint64_t v13;

  objc_msgSend(a1, "scale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;
  v9 = (float)a3;
  objc_msgSend(a1, "offset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = llroundf(v12 + (float)(v8 * v9));

  return v13;
}

+ (id)transitionPointWithMinimumBrightness:()NaturalLighting minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:
{
  float v8;
  float v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;

  if (a5 <= a3)
  {
    v23 = _HMFPreconditionFailure();
    return (id)+[HAPCharacteristicValueLinearDerivedTransitionPoint(NaturalLighting) transitionPointWithPreviousTransitionPoint:nextTransitionPoint:timeElapsedSincePreviousTransitionPoint:minimumBrightness:maximumBrightness:](v23);
  }
  else
  {
    v8 = (float)(a6 - a4) / (float)(a5 - a3);
    v9 = (float)a4 - (float)(v8 * (float)a3);
    v10 = objc_alloc(MEMORY[0x1E0D16600]);
    *(float *)&v11 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithValue:", v12);

    v14 = objc_alloc(MEMORY[0x1E0D16600]);
    *(float *)&v15 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithValue:", v16);

    v18 = objc_alloc(MEMORY[0x1E0D16610]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithValue:", v19);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16438]), "initWithScale:offset:targetCompletionDuration:startDelayDuration:", v13, v17, v20, 0);
    return v21;
  }
}

+ (uint64_t)transitionPointWithPreviousTransitionPoint:()NaturalLighting nextTransitionPoint:timeElapsedSincePreviousTransitionPoint:minimumBrightness:maximumBrightness:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  void *v46;
  unint64_t v47;

  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "scale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;
  objc_msgSend(v12, "offset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19 + (float)(v16 * (float)a6);

  objc_msgSend(v12, "scale");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;
  objc_msgSend(v12, "offset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "value");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v28 = v27 + (float)(v24 * (float)a7);

  objc_msgSend(v11, "scale");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "value");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  v32 = v31;
  objc_msgSend(v11, "offset");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "value");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  v36 = v35 + (float)(v32 * (float)a6);

  objc_msgSend(v11, "scale");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "value");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "floatValue");
  v40 = v39;
  objc_msgSend(v11, "offset");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "value");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "floatValue");
  v44 = v43 + (float)(v40 * (float)a7);

  objc_msgSend(v11, "targetCompletionDuration");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "value");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedLongLongValue");

  return objc_msgSend(MEMORY[0x1E0D16438], "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:", a6, (uint64_t)(float)(v20 + (float)((float)((float)(v36 - v20) / (float)v47) * (float)a5)), a7, (uint64_t)(float)(v28 + (float)((float)((float)(v44 - v28) / (float)v47) * (float)a5)), 0);
}

@end
