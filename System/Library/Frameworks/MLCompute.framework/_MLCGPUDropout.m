@implementation _MLCGPUDropout

- (_MLCGPUDropout)initWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  id v8;
  _MLCGPUDropout *v9;
  _MLCGPUDropout *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _MLCGPUDropout *v33;
  void *v34;
  int64x2_t v35;
  objc_super v36;
  int64x2_t v37;
  uint64_t v38;
  objc_super v39;

  v8 = a3;
  v39.receiver = self;
  v39.super_class = (Class)_MLCGPUDropout;
  v9 = -[_MLCGPUDropout init](&v39, sel_init);
  v10 = v9;
  if (v9)
  {
    v33 = v9;
    objc_msgSend(v8, "deviceList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v34 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v12)
    {
      v13 = 0;
      v14 = 1.0 - a4;
      v15 = 0x1E0CC6000uLL;
      v35 = vdupq_n_s64(1uLL);
      v16 = 0x1E0CC6000uLL;
      do
      {
        objc_msgSend(v8, "deviceList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_alloc(*(Class *)(v15 + 3312));
        v37 = v35;
        v38 = 1;
        v20 = (void *)objc_msgSend(v19, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v18, a5, &v37, COERCE_DOUBLE(__PAIR64__(v35.u32[1], LODWORD(v14))));
        v21 = objc_alloc(*(Class *)(v16 + 3320));
        v37 = v35;
        v38 = 1;
        v22 = objc_msgSend(v21, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v18, a5, &v37, COERCE_DOUBLE(__PAIR64__(v35.u32[1], LODWORD(v14))));
        v23 = (void *)v22;
        if (v20)
          v24 = v22 == 0;
        else
          v24 = 1;
        if (!v24)
        {
          v25 = v12;
          v26 = v8;
          v27 = v16;
          v28 = v15;
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v20, v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v29)
          {
            objc_msgSend(v29, "setSourceOfForwardNeededForGradient:", 1);
            objc_msgSend(v30, "setResultOfForwardNeededForGradient:", 0);
            objc_msgSend(v34, "addObject:", v30);
          }

          v15 = v28;
          v16 = v27;
          v8 = v26;
          v12 = v25;
        }

        ++v13;
      }
      while (v12 != v13);
    }
    v31 = (void *)objc_msgSend(v34, "copy");
    v10 = v33;
    v36.receiver = v33;
    v36.super_class = (Class)_MLCGPUDropout;
    -[_MLCGPULayer setDeviceOps:](&v36, sel_setDeviceOps_, v31);

  }
  return v10;
}

+ (id)layerWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  void *v11;

  v8 = a3;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = a4;
  v11 = (void *)objc_msgSend(v9, "initWithDevice:rate:seed:", v8, a5, v10);

  return v11;
}

@end
