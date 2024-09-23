@implementation CSFLPCMTypeConverter

+ (id)convertToFloatLPCMBufFromShortLPCMBuf:(id)a3
{
  id v3;
  vDSP_Length v4;
  void *v5;
  id v6;
  const __int16 *v7;
  id v8;
  id v9;
  const float *v10;
  id v11;
  id v12;
  const float *v13;
  id v14;
  float __C;
  float v17;
  float __B;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "length") >> 1;
  __B = 0.000030519;
  __C = 1.0;
  v17 = -1.0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * v4);
  v6 = objc_retainAutorelease(v3);
  v7 = (const __int16 *)objc_msgSend(v6, "bytes");

  v8 = objc_retainAutorelease(v5);
  vDSP_vflt16(v7, 1, (float *)objc_msgSend(v8, "bytes"), 1, v4);
  v9 = objc_retainAutorelease(v8);
  v10 = (const float *)objc_msgSend(v9, "bytes");
  v11 = objc_retainAutorelease(v9);
  vDSP_vsmul(v10, 1, &__B, (float *)objc_msgSend(v11, "bytes"), 1, v4);
  v12 = objc_retainAutorelease(v11);
  v13 = (const float *)objc_msgSend(v12, "bytes");
  v14 = objc_retainAutorelease(v12);
  vDSP_vclip(v13, 1, &v17, &__C, (float *)objc_msgSend(v14, "bytes"), 1, v4);
  return v14;
}

+ (id)convertToShortLPCMBufFromFloatLPCMBuf:(id)a3
{
  id v3;
  unint64_t v4;
  vDSP_Length v5;
  void *v6;
  void *v7;
  id v8;
  const float *v9;
  id v10;
  id v11;
  const float *v12;
  id v13;
  id v14;
  const float *v15;
  id v16;
  float __C;
  float __B;
  float v20;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = v4 >> 2;
  v20 = 32767.0;
  __C = 1.0;
  __B = -1.0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v4 & 0xFFFFFFFFFFFFFFFCLL);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * (v4 >> 2));
  v8 = objc_retainAutorelease(v3);
  v9 = (const float *)objc_msgSend(v8, "bytes");

  v10 = objc_retainAutorelease(v6);
  vDSP_vclip(v9, 1, &__B, &__C, (float *)objc_msgSend(v10, "bytes"), 1, v5);
  v11 = objc_retainAutorelease(v10);
  v12 = (const float *)objc_msgSend(v11, "bytes");
  v13 = objc_retainAutorelease(v11);
  vDSP_vsmul(v12, 1, &v20, (float *)objc_msgSend(v13, "bytes"), 1, v5);
  v14 = objc_retainAutorelease(v13);
  v15 = (const float *)objc_msgSend(v14, "bytes");
  v16 = objc_retainAutorelease(v7);
  vDSP_vfix16(v15, 1, (__int16 *)objc_msgSend(v16, "bytes"), 1, v5);

  return v16;
}

+ (void)applyGain:(float)a3 toShortBuffer:(id)a4
{
  id v5;
  vDSP_Length v6;
  void *v7;
  id v8;
  const __int16 *v9;
  id v10;
  id v11;
  const float *v12;
  id v13;
  id v14;
  const float *v15;
  id v16;
  id v17;
  const float *v18;
  id v19;
  __int16 *v20;
  float __C;
  float v22;
  float __B;

  v5 = a4;
  v6 = (unint64_t)objc_msgSend(v5, "length") >> 1;
  __B = a3;
  __C = 32767.0;
  v22 = -32768.0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * v6);
  v8 = objc_retainAutorelease(v5);
  v9 = (const __int16 *)objc_msgSend(v8, "bytes");
  v10 = objc_retainAutorelease(v7);
  vDSP_vflt16(v9, 1, (float *)objc_msgSend(v10, "bytes"), 1, v6);
  v11 = objc_retainAutorelease(v10);
  v12 = (const float *)objc_msgSend(v11, "bytes");
  v13 = objc_retainAutorelease(v11);
  vDSP_vsmul(v12, 1, &__B, (float *)objc_msgSend(v13, "bytes"), 1, v6);
  v14 = objc_retainAutorelease(v13);
  v15 = (const float *)objc_msgSend(v14, "bytes");
  v16 = objc_retainAutorelease(v14);
  vDSP_vclip(v15, 1, &v22, &__C, (float *)objc_msgSend(v16, "bytes"), 1, v6);
  v17 = objc_retainAutorelease(v16);
  v18 = (const float *)objc_msgSend(v17, "bytes");
  v19 = objc_retainAutorelease(v8);
  v20 = (__int16 *)objc_msgSend(v19, "bytes");

  vDSP_vfix16(v18, 1, v20, 1, v6);
}

+ (void)applyGain:(float)a3 toFloatBuffer:(id)a4
{
  id v5;
  vDSP_Length v6;
  id v7;
  const float *v8;
  id v9;
  id v10;
  const float *v11;
  id v12;
  float *v13;
  float __C;
  float v15;
  float __B;

  v5 = a4;
  v6 = (unint64_t)objc_msgSend(v5, "length") >> 2;
  __B = a3;
  __C = 1.0;
  v15 = -1.0;
  v7 = objc_retainAutorelease(v5);
  v8 = (const float *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v7);
  vDSP_vsmul(v8, 1, &__B, (float *)objc_msgSend(v9, "bytes"), 1, v6);
  v10 = objc_retainAutorelease(v9);
  v11 = (const float *)objc_msgSend(v10, "bytes");
  v12 = objc_retainAutorelease(v10);
  v13 = (float *)objc_msgSend(v12, "bytes");

  vDSP_vclip(v11, 1, &v15, &__C, v13, 1, v6);
}

+ (void)apply12dBGainToShortBuffer:(id)a3
{
  double v3;

  LODWORD(v3) = 4.0;
  objc_msgSend(a1, "applyGain:toShortBuffer:", a3, v3);
}

+ (void)apply12dBGainToFloatBuffer:(id)a3
{
  double v3;

  LODWORD(v3) = 4.0;
  objc_msgSend(a1, "applyGain:toFloatBuffer:", a3, v3);
}

+ (void)applyNegative32dBGainToShortBuffer:(id)a3
{
  double v3;

  LODWORD(v3) = 1020054733;
  objc_msgSend(a1, "applyGain:toShortBuffer:", a3, v3);
}

+ (void)applyNegative32dBGainToFloatBuffer:(id)a3
{
  double v3;

  LODWORD(v3) = 1020054733;
  objc_msgSend(a1, "applyGain:toFloatBuffer:", a3, v3);
}

+ (void)applyNegative20dBGainToShortBuffer:(id)a3
{
  double v3;

  LODWORD(v3) = 1036831949;
  objc_msgSend(a1, "applyGain:toShortBuffer:", a3, v3);
}

+ (void)applyNegative20dBGainToFloatBuffer:(id)a3
{
  double v3;

  LODWORD(v3) = 1036831949;
  objc_msgSend(a1, "applyGain:toFloatBuffer:", a3, v3);
}

@end
