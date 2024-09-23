@implementation GKNoiseMap

- (int)mapIndexX:(int)a3 y:(int)a4
{
  return a3 + *(_QWORD *)&self->_sampleCount[7] * a4;
}

- (GKNoiseMap)init
{
  void *v3;
  void *v4;
  GKNoiseMap *v5;

  v3 = (void *)objc_opt_new();
  +[GKNoise noiseWithNoiseSource:](GKNoise, "noiseWithNoiseSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[GKNoiseMap initWithNoise:](self, "initWithNoise:", v4);
  return v5;
}

+ (GKNoiseMap)noiseMapWithNoise:(GKNoise *)noise
{
  GKNoise *v3;
  void *v4;

  v3 = noise;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNoise:", v3);

  return (GKNoiseMap *)v4;
}

+ (GKNoiseMap)noiseMapWithNoise:(GKNoise *)noise size:(vector_double2)size origin:(vector_double2)origin sampleCount:(vector_int2)sampleCount seamless:(BOOL)seamless
{
  _BOOL8 v7;
  GKNoise *v9;
  void *v10;
  double v12;
  double v13;

  v7 = seamless;
  v12 = size.f64[0];
  v13 = origin.f64[0];
  v9 = noise;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNoise:size:origin:sampleCount:seamless:", v9, v7, v12, v13, *(double *)&sampleCount);

  return (GKNoiseMap *)v10;
}

- (GKNoiseMap)initWithNoise:(GKNoise *)noise
{
  __asm { FMOV            V0.2D, #1.0 }
  return -[GKNoiseMap initWithNoise:size:origin:sampleCount:seamless:](self, "initWithNoise:size:origin:sampleCount:seamless:", noise, 0, *(double *)&_Q0, 0.0, COERCE_DOUBLE(0x6400000064));
}

- (GKNoiseMap)initWithNoise:(GKNoise *)noise size:(vector_double2)size origin:(vector_double2)origin sampleCount:(vector_int2)sampleCount seamless:(BOOL)seamless
{
  GKNoise *v10;
  GKNoiseMap *v11;
  GKNoiseMap *v12;
  uint64_t v13;
  NSDictionary *gradientColors;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  int v21;
  uint64_t v22;
  int64x2_t v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  double v27;
  int v28;
  float v29;
  uint64_t v32;
  uint64_t v34;
  _OWORD v35[2];
  objc_super v36;

  v10 = noise;
  v36.receiver = self;
  v36.super_class = (Class)GKNoiseMap;
  v11 = -[GKNoiseMap init](&v36, sel_init);
  v12 = v11;
  if (v11)
  {
    *(vector_double2 *)v11->_size = size;
    *(vector_double2 *)v11->_origin = origin;
    *(vector_int2 *)&v11->_sampleCount[7] = sampleCount;
    v11->_seamless = seamless;
    -[GKNoise gradientColors](v10, "gradientColors");
    v13 = objc_claimAutoreleasedReturnValue();
    gradientColors = v12->_gradientColors;
    v12->_gradientColors = (NSDictionary *)v13;

    -[GKNoise __modules](v10, "__modules");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v12->_map = (float *)operator new[]();
    v18 = *(_QWORD *)&v12->_sampleCount[7];
    v19 = 0.0;
    v20 = 0.0;
    if ((int)v18 >= 2)
    {
      v20 = (*(double *)v12->_size - *(double *)v12->_origin) / (double)(int)(*(_QWORD *)&v12->_sampleCount[7] - 1);
      v21 = HIDWORD(v18) - 1;
      if (SHIDWORD(v18) <= 1)
      {
LABEL_4:
        if (SHIDWORD(v18) < 1)
        {
LABEL_14:

          goto LABEL_15;
        }
LABEL_8:
        v22 = 0;
        v23 = *(int64x2_t *)v12->_origin;
        do
        {
          *(double *)&v23.i64[1] = *(double *)&v12->_origin[8] + v19 * (double)(int)v22;
          if ((int)v18 >= 1)
          {
            v24 = 0;
            do
            {
              *(double *)&v25 = *(double *)v12->_origin + v20 * (double)(int)v24;
              v34 = v23.i64[1];
              v35[0] = v25;
              v35[1] = vdupq_laneq_s64(v23, 1);
              objc_msgSend(v16, "valueAt:", v35, v25, v17, v23.i64[0]);
              v27 = v26;
              v28 = -[GKNoiseMap mapIndexX:y:](v12, "mapIndexX:y:", v24, v22);
              v23.i64[1] = v34;
              v23.i64[0] = v32;
              v29 = v27;
              v12->_map[v28] = v29;
              v24 = (v24 + 1);
              v18 = *(_QWORD *)&v12->_sampleCount[7];
            }
            while ((int)v24 < (int)v18);
          }
          v22 = (v22 + 1);
        }
        while ((int)v22 < SHIDWORD(v18));
        goto LABEL_14;
      }
    }
    else
    {
      v21 = HIDWORD(v18) - 1;
      if (SHIDWORD(v18) <= 1)
        goto LABEL_4;
    }
    v19 = (*(double *)&v12->_size[8] - *(double *)&v12->_origin[8]) / (double)v21;
    goto LABEL_8;
  }
LABEL_15:

  return v12;
}

- (void)dealloc
{
  float *map;
  objc_super v4;

  map = self->_map;
  if (map)
    MEMORY[0x22E2A5088](map, 0x1000C8052888210);
  self->_map = 0;
  v4.receiver = self;
  v4.super_class = (Class)GKNoiseMap;
  -[GKNoiseMap dealloc](&v4, sel_dealloc);
}

- (id)__colorData
{
  void *v3;
  uint64_t v4;
  GKNoiseMap *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GKNoiseMap *v12;
  uint64_t v13;
  int v14;
  float v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  float64x2_t v44;
  int16x8_t v45;
  void *v46;
  uint64_t v48;
  int v49;
  float64x2_t v50;
  int v51;
  uint64_t v52;
  unsigned int v53;
  GKNoiseMap *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _QWORD v64[2];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v49 = HIDWORD(*(_QWORD *)&self->_sampleCount[7]);
  v51 = *(_QWORD *)&self->_sampleCount[7];
  v52 = operator new[]();
  v54 = self;
  -[GKNoiseMap gradientColors](self, "gradientColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = v54;
  if (!v4)
  {
    v64[0] = &unk_24F059298;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = &unk_24F0592A8;
    v65[0] = v6;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNoiseMap setGradientColors:](v54, "setGradientColors:", v8);

    v5 = v54;
  }
  -[GKNoiseMap gradientColors](v5, "gradientColors", 4 * v51 * v49);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v54;
  if (v49 >= 1 && v51 >= 1)
  {
    v53 = 0;
    v50 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    do
    {
      v13 = 0;
      do
      {
        v14 = -[GKNoiseMap mapIndexX:y:](v12, "mapIndexX:y:", v13, v53);
        v15 = v12->_map[v14];
        v62 = 0.0;
        v63 = 0.0;
        v61 = 0.0;
        objc_msgSend(v11, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v17 = v15;
        if (v18 >= v15)
        {
          -[GKNoiseMap gradientColors](v12, "gradientColors");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "getRed:green:blue:alpha:", &v63, &v62, &v61, 0);
        }
        else
        {
          objc_msgSend(v11, "lastObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          if (v20 <= v17)
          {
            -[GKNoiseMap gradientColors](v12, "gradientColors");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", v19);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "getRed:green:blue:alpha:", &v63, &v62, &v61, 0);
          }
          else
          {
            v21 = objc_msgSend(v11, "count");
            v22 = 0;
            if (v21 <= 1)
              v23 = 1;
            else
              v23 = v21;
            v24 = (v23 - 1);
            v25 = v23 - 1;
            while (v24 != v22)
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", ++v22);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "doubleValue");
              v28 = v27;

              if (v28 > v17)
              {
                v25 = v22 - 1;
                v24 = (v22 - 1);
                break;
              }
            }
            objc_msgSend(v11, "objectAtIndexedSubscript:", v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", (v25 + 1));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "doubleValue");
            v32 = v31;
            objc_msgSend(v30, "doubleValue");
            v34 = v33;
            objc_msgSend(v29, "doubleValue");
            v36 = v35;
            -[GKNoiseMap gradientColors](v54, "gradientColors");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v29);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            -[GKNoiseMap gradientColors](v54, "gradientColors");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", v30);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = 0.0;
            v60 = 0.0;
            v57 = 0.0;
            v58 = 0.0;
            v55 = 0.0;
            v56 = 0.0;
            objc_msgSend(v38, "getRed:green:blue:alpha:", &v60, &v59, &v58, 0);
            objc_msgSend(v40, "getRed:green:blue:alpha:", &v57, &v56, &v55, 0);
            v41 = (v17 - v32) / (v34 - v36);
            v62 = v59 * (1.0 - v41) + v56 * v41;
            v63 = v60 * (1.0 - v41) + v57 * v41;
            v61 = v58 * (1.0 - v41) + v55 * v41;

          }
        }

        v44.f64[0] = v63;
        v44.f64[1] = v62;
        *(int32x2_t *)&v44.f64[0] = vmovn_s64(vcvtq_s64_f64(vmulq_f64(v44, v50)));
        v45.i16[3] = 255;
        v45.i64[1] = 0xFF00FF00FF00FFLL;
        v45.i16[0] = LOWORD(v44.f64[0]);
        v45.i16[1] = WORD2(v44.f64[0]);
        v45.i16[2] = (int)(v61 * 255.0);
        *(_DWORD *)(v52 + 4 * v14) = vmovn_s16(v45).u32[0];

        v13 = (v13 + 1);
        v12 = v54;
      }
      while ((_DWORD)v13 != v51);
      ++v53;
    }
    while (v53 != v49);
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v52, v48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22E2A5088](v52, 0x1000C8052888210);

  return v46;
}

uint64_t __25__GKNoiseMap___colorData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "doubleValue");
    v11 = v10;
    objc_msgSend(v5, "doubleValue");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (float)valueAtPosition:(vector_int2)position
{
  int v4;
  int v5;
  int v6;
  int v7;
  float v8;
  float result;

  v4 = position.i32[0];
  v5 = HIDWORD(*(_QWORD *)&self->_sampleCount[7]);
  if (position.i32[0] >= (int)(*(_QWORD *)&self->_sampleCount[7] - 1))
    v4 = *(_QWORD *)&self->_sampleCount[7] - 1;
  if (position.i32[1] >= v5 - 1)
    v6 = v5 - 1;
  else
    v6 = position.i32[1];
  v7 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v4 & ~(v4 >> 31), v6 & ~(v6 >> 31));
  v8 = self->_map[v7];
  result = -1.0;
  if (v8 >= -1.0)
  {
    result = self->_map[v7];
    if (v8 > 1.0)
      return 1.0;
  }
  return result;
}

- (float)interpolatedValueAtPosition:(vector_float2)position
{
  int32x2_t v4;
  int64x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  int32x2_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  int v15;
  int v16;
  int v17;
  float *v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  int v27;
  int v28;
  float *map;
  float v30;
  uint64_t v31;
  int v32;

  v4 = vadd_s32(*(int32x2_t *)&self->_sampleCount[7], (int32x2_t)-1);
  v5.i64[0] = v4.i32[0];
  v5.i64[1] = v4.i32[1];
  v6 = vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32((float32x2_t)position), vcvtq_f64_s64(v5)), (float64x2_t)0));
  v7 = vrnda_f32(v6);
  v8 = vcge_f32(vabd_f32(v6, v7), (float32x2_t)0x3400000034000000);
  if (((v8.i32[0] | v8.i32[1]) & 1) == 0)
  {
    v21 = self->_map[-[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", (int)v7.f32[0], (int)v7.f32[1])];
    return fmax(fmin(v21, 1.0), -1.0);
  }
  if ((v8.i8[0] & 1) == 0)
  {
    v22 = (int)v7.f32[0];
    v23 = ((int)v6.f32[1] + 1);
    v24 = truncf(v6.f32[1]);
    v25 = v6.f32[1] - v24;
    v26 = (float)(int)v23 - v24;
    v27 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v22);
    v28 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v22, v23);
    map = self->_map;
    v30 = map[v27];
LABEL_8:
    v21 = (float)((float)((float)(map[v28] - v30) * v25) / v26) + v30;
    return fmax(fmin(v21, 1.0), -1.0);
  }
  v9 = (int)v6.f32[0];
  v10 = (v9 + 1);
  if ((v8.i8[4] & 1) == 0)
  {
    v31 = (int)v7.f32[1];
    v25 = v6.f32[0] - (float)(int)v9;
    v26 = (float)(int)v10 - (float)(int)v9;
    v32 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v9, v31);
    v28 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v10, v31);
    map = self->_map;
    v30 = map[v32];
    goto LABEL_8;
  }
  v11 = v6.f32[1];
  v12 = (int)v6.f32[1];
  v13 = (v12 + 1);
  v14 = (float)(v6.f32[0] - (float)(int)v9) / (float)((float)(int)v10 - (float)(int)v9);
  v15 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v9, v12);
  LODWORD(v12) = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", (v9 + 1), v12);
  v16 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v9, v13);
  v17 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v10, v13);
  v18 = self->_map;
  v19 = (float)(v18[v15] * (float)(1.0 - v14)) + (float)(v18[(int)v12] * v14);
  v20 = truncf(v11);
  v21 = (float)((float)((float)((float)(v18[v17] * v14) - (float)(v19 - (float)(v18[v16] * (float)(1.0 - v14))))
                      * (float)(v11 - v20))
              / (float)((float)(int)v13 - v20))
      + v19;
  return fmax(fmin(v21, 1.0), -1.0);
}

- (void)setValue:(float)value atPosition:(vector_int2)position
{
  int v4;
  int v5;
  int v6;

  v4 = position.i32[0];
  v5 = HIDWORD(*(_QWORD *)&self->_sampleCount[7]);
  if (position.i32[0] >= (int)(*(_QWORD *)&self->_sampleCount[7] - 1))
    v4 = *(_QWORD *)&self->_sampleCount[7] - 1;
  if (position.i32[1] >= v5 - 1)
    v6 = v5 - 1;
  else
    v6 = position.i32[1];
  self->_map[-[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v4 & ~(v4 >> 31), v6 & ~(v6 >> 31))] = value;
}

- (vector_double2)size
{
  return *(vector_double2 *)self->_size;
}

- (vector_double2)origin
{
  return *(vector_double2 *)self->_origin;
}

- (vector_int2)sampleCount
{
  return *(vector_int2 *)&self->_sampleCount[7];
}

- (BOOL)isSeamless
{
  return self->_seamless;
}

- (NSDictionary)gradientColors
{
  return self->_gradientColors;
}

- (void)setGradientColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColors, 0);
}

@end
