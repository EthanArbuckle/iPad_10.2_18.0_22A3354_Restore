@implementation MRUWaveformData

+ (id)zero
{
  if (zero_onceToken != -1)
    dispatch_once(&zero_onceToken, &__block_literal_global_20);
  return (id)__MRUWaveformDataZero;
}

void __23__MRUWaveformData_zero__block_invoke()
{
  int v0;
  MRUWaveformData *v1;
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (+[MRUWaveformData amplitudeCount](MRUWaveformData, "amplitudeCount") >= 1)
  {
    v0 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", &unk_1E5878220);
      ++v0;
    }
    while (v0 < +[MRUWaveformData amplitudeCount](MRUWaveformData, "amplitudeCount"));
  }
  v1 = -[MRUWaveformData initWithAmplitudes:]([MRUWaveformData alloc], "initWithAmplitudes:", v3);
  v2 = (void *)__MRUWaveformDataZero;
  __MRUWaveformDataZero = (uint64_t)v1;

}

+ (int)amplitudeCount
{
  return 6;
}

- (MRUWaveformData)initWithAmplitudes:(id)a3
{
  id v4;
  MRUWaveformData *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRUWaveformData;
  v5 = -[MRUWaveformData init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    -[MRUWaveformData setAmplitudes:](v5, "setAmplitudes:", v6);

  }
  return v5;
}

- (float)maxAbsoluteDifferenceFrom:(id)a3
{
  id v4;
  uint64_t v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  float v13;
  float v14;

  v4 = a3;
  if (v4)
  {
    if (+[MRUWaveformData amplitudeCount](MRUWaveformData, "amplitudeCount") < 1)
    {
      v6 = 0.0;
    }
    else
    {
      v5 = 0;
      v6 = 0.0;
      do
      {
        -[MRUWaveformData amplitudes](self, "amplitudes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "floatValue");
        v10 = v9;
        objc_msgSend(v4, "amplitudes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v14 = vabds_f32(v10, v13);

        if (v6 < v14)
          v6 = v14;
        ++v5;
      }
      while (v5 < +[MRUWaveformData amplitudeCount](MRUWaveformData, "amplitudeCount"));
    }
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (MRUWaveformData)initWithFFTSamples:(float *)a3 count:(int)a4 sampleRate:(float)a5 settings:(id)a6
{
  id v9;
  int v10;
  void *v11;
  void *v12;
  float *v13;
  uint64_t v14;
  int v15;
  float v16;
  uint64_t v17;
  unint64_t v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  unint64_t v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  uint64_t i;
  float v34;
  float v35;
  long double v36;
  float v37;
  float v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  float v45;
  long double v46;
  long double v47;
  void *v48;
  float v49;
  long double v50;
  void *v51;
  float v52;
  long double v53;
  void *v54;
  float v55;
  void *v56;
  void *v57;
  int v60;
  void *v61;

  v9 = a6;
  v10 = +[MRUWaveformData amplitudeCount](MRUWaveformData, "amplitudeCount");
  objc_msgSend(v9, "stops");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v10;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  v13 = (float *)malloc_type_calloc(+[MRUWaveformData amplitudeCount](MRUWaveformData, "amplitudeCount"), 4uLL, 0x100004052888210uLL);
  v61 = v12;
  if (a4 >= 1)
  {
    v14 = 0;
    v15 = 0;
    v16 = a5 / (float)(2 * a4);
    v17 = a4;
    do
    {
      if (objc_msgSend(v11, "count") - 1 == v15)
        break;
      v18 = v15;
      v19 = v16 * (float)(int)v14;
      objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

      objc_msgSend(v11, "objectAtIndexedSubscript:", v15 + 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      if (v19 < v22 || v19 > v25)
      {
        if (objc_msgSend(v11, "count") - 2 > (unint64_t)v15 && v19 >= v25)
        {
          do
          {
            v27 = v18++;
            v15 = v18;
            objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "floatValue");

            objc_msgSend(v11, "objectAtIndexedSubscript:", v27 + 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "floatValue");
            v31 = v30;

          }
          while (objc_msgSend(v11, "count") - 2 > v18 && v19 >= v31);
        }
        if (objc_msgSend(v11, "count") <= v18)
          goto LABEL_16;
        v32 = v13[v18] + (float)((float)(1.0 / (float)(v25 - v22)) * a3[v14]);
      }
      else
      {
        v32 = a3[v14] + v13[v15];
      }
      v13[v18] = v32;
LABEL_16:
      v12 = v61;
      ++v14;
    }
    while (v14 != v17);
  }
  if (v60 >= 1)
  {
    for (i = 0; i != v60; ++i)
    {
      v34 = v13[i];
      objc_msgSend(v9, "amplitudeGain");
      v36 = (float)(v34 * v35);
      objc_msgSend(v9, "exponentialGain");
      v38 = pow(v36, v37);
      v13[i] = v38;
      objc_msgSend(v9, "frequencyExponent");
      *(float *)&v36 = (float)((float)((float)(int)i * v39) + 1.0) * v13[i];
      objc_msgSend(v9, "adjustmentCoefficients");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v43 = v42;
      objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      v46 = *(float *)&v36;
      v47 = v43 + v45 * v46;
      objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "floatValue");
      v50 = v47 + v49 * (v46 * v46);
      objc_msgSend(v40, "objectAtIndexedSubscript:", 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "floatValue");
      v53 = v50 + v52 * pow(v46, 3.0);
      objc_msgSend(v40, "objectAtIndexedSubscript:", 4);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "floatValue");
      *(float *)&v46 = v53 + v55 * pow(v46, 4.0);

      v12 = v61;
      v13[i] = fmaxf(fminf(v13[i] * *(float *)&v46, 1.0), 0.0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:atIndexedSubscript:", v56, i);

    }
  }
  free(v13);
  v57 = (void *)objc_msgSend(v12, "copy");
  -[MRUWaveformData setAmplitudes:](self, "setAmplitudes:", v57);

  return self;
}

- (NSArray)amplitudes
{
  return self->_amplitudes;
}

- (void)setAmplitudes:(id)a3
{
  objc_storeStrong((id *)&self->_amplitudes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amplitudes, 0);
}

@end
