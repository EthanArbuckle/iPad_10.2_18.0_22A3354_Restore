@implementation _DPGaussianPRNG

+ (id)randomFloatVectorFromSeed:(id)a3 length:(unint64_t)a4 mean:(double)a5 stddev:(double)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  const void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  CCCryptorRef cryptorRef;

  v10 = a3;
  v11 = objc_msgSend(v10, "length");
  if (v11 == objc_msgSend(a1, "seedLength"))
  {
    objc_msgSend(v10, "subdataWithRange:", 0, 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subdataWithRange:", 16, 16);
    cryptorRef = 0;
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const void *)objc_msgSend(v13, "bytes");
    v15 = objc_retainAutorelease(v12);
    v16 = CCCryptorCreateWithMode(0, 4u, 0, 0, v14, (const void *)-[NSObject bytes](v15, "bytes"), 0x10uLL, 0, 0, 0, 2u, &cryptorRef);
    if ((_DWORD)v16)
    {
      v17 = v16;
      +[_DPLog framework](_DPLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
      v25 = 0;
    }
    else
    {
      v49 = v13;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * a4);
      v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = -[NSObject mutableBytes](v48, "mutableBytes");
      v27 = (a4 >> 2) & 0xFFFFFFFFFFFFFFFLL;
      if (v27 >= 0xFFF)
        v27 = 4095;
      v28 = 16 * v27 + 16;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v28);
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v47, "mutableBytes");
      if (a4)
      {
        v30 = (char *)v29;
        v31 = 0;
        while (1)
        {
          bzero(v30, v28);
          v32 = CCCryptorUpdate(cryptorRef, v30, v28, v30, v28, 0);
          if ((_DWORD)v32)
            break;
          if (v31 < a4)
          {
            v33 = 0;
            do
            {
              v34 = &v30[4 * v33];
              v35 = *(unsigned int *)v34;
              v36 = *((unsigned int *)v34 + 1);
              v50 = 0;
              if (objc_msgSend(a1, "generateGaussianFloatsWithMean:stddev:x:y:out1:out2:", v35, v36, (char *)&v50 + 4, &v50, a5, a6))
              {
                v37 = v31 + 1;
                *(_DWORD *)(v26 + 4 * v31) = HIDWORD(v50);
                if (v31 + 1 >= a4)
                {
                  ++v31;
                }
                else
                {
                  v31 += 2;
                  *(_DWORD *)(v26 + 4 * v37) = v50;
                }
              }
              v33 += 2;
            }
            while (v33 < (v28 >> 2) - 1 && v31 < a4);
          }
          if (v31 >= a4)
            goto LABEL_23;
        }
        v38 = v32;
        +[_DPLog framework](_DPLog, "framework");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);

        CCCryptorRelease(cryptorRef);
        v25 = 0;
        v18 = v48;
        v13 = v49;
      }
      else
      {
LABEL_23:
        CCCryptorRelease(cryptorRef);
        v18 = v48;
        v25 = v48;
        v13 = v49;
      }

    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:].cold.3(v10, a1, v15);
    v25 = 0;
  }

  return v25;
}

+ (id)generateSeed
{
  size_t v2;
  id v3;

  v2 = +[_DPGaussianPRNG seedLength](_DPGaussianPRNG, "seedLength");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  arc4random_buf((void *)objc_msgSend(v3, "mutableBytes"), v2);
  return v3;
}

+ (unint64_t)seedLength
{
  return 32;
}

+ (BOOL)generateGaussianFloatsWithMean:(double)a3 stddev:(double)a4 x:(int)a5 y:(int)a6 out1:(float *)a7 out2:(float *)a8
{
  unsigned int v8;
  unsigned int v9;
  int64_t v10;
  int v15;
  int v16;
  double v17;
  float v18;

  v8 = a5 & 0x7FFFFFFF;
  v9 = a6 & 0x7FFFFFFF;
  v10 = v9 * (unint64_t)v9 + v8 * (unint64_t)v8;
  if ((unint64_t)(v10 - 1) > 0x3FFFFFFFFFFFFFFELL)
    return 0;
  v15 = (a6 != 0) | (a6 >> 31);
  v16 = (a5 != 0) | (a5 >> 31);
  v17 = sqrt(log((double)v10 * 2.16840434e-19) * -2.0 / ((double)v10 * 2.16840434e-19));
  v18 = a3 + a4 * ((double)(int)v8 * (double)v16 / 2147483650.0 * v17);
  *a7 = v18;
  *(float *)&v17 = a3 + a4 * ((double)(int)v9 * (double)v15 / 2147483650.0 * v17);
  *a8 = *(float *)&v17;
  return 1;
}

+ (void)randomFloatVectorFromSeed:(uint64_t)a3 length:(uint64_t)a4 mean:(uint64_t)a5 stddev:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D3FAA000, a2, a3, "Failed call to CCCryptorUpdate %d", a5, a6, a7, a8, 0);
}

+ (void)randomFloatVectorFromSeed:(uint64_t)a3 length:(uint64_t)a4 mean:(uint64_t)a5 stddev:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D3FAA000, a2, a3, "Failed to create cryptor %d", a5, a6, a7, a8, 0);
}

+ (void)randomFloatVectorFromSeed:(NSObject *)a3 length:mean:stddev:.cold.3(void *a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "length");
  v7 = 2048;
  v8 = objc_msgSend(a2, "seedLength");
  _os_log_error_impl(&dword_1D3FAA000, a3, OS_LOG_TYPE_ERROR, "_DPGaussianPRNG's seed is with wrong length %lu, should be %lu", (uint8_t *)&v5, 0x16u);
}

@end
