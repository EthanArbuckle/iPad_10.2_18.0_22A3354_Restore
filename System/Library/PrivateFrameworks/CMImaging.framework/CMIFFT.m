@implementation CMIFFT

+ (id)CMIFFT1DTransform:(id)a3 figMetalContext:(id)a4 width:(unsigned int)a5 layout:(int64_t)a6 precision:(int64_t)a7
{
  uint64_t v9;
  unint64_t v11;
  unint64_t v12;
  CMIFFTContext *v13;
  uint64_t v14;
  void *v15;
  CMIFFTTransformInternal *v16;
  void *v17;
  void *v18;
  CMIFFTTransformInternal *v19;
  _QWORD v21[2];

  v9 = *(_QWORD *)&a5;
  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  if (v11 | v12)
  {
    v13 = [CMIFFTContext alloc];
    if (v12)
      v14 = -[CMIFFTContext initWithFigMetalContext:](v13, "initWithFigMetalContext:", v12);
    else
      v14 = -[CMIFFTContext initWithDevice:](v13, "initWithDevice:", v11);
    v15 = (void *)v14;
    v16 = [CMIFFTTransformInternal alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CMIFFTTransformInternal initWithContext:nDim:sizes:istrides:ostrides:layout:precision:batchsize:](v16, "initWithContext:nDim:sizes:istrides:ostrides:layout:precision:batchsize:", v15, 1, v18, &unk_1E9514228, &unk_1E9514240, a6, a7, 1);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)CMIFFT1DTransformBatched:(id)a3 figMetalContext:(id)a4 width:(unsigned int)a5 layout:(int64_t)a6 precision:(int64_t)a7 batchSize:(unsigned int)a8
{
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;
  CMIFFTContext *v15;
  uint64_t v16;
  void *v17;
  CMIFFTTransformInternal *v18;
  void *v19;
  void *v20;
  CMIFFTTransformInternal *v21;
  _QWORD v23[2];

  v11 = *(_QWORD *)&a5;
  v23[1] = *MEMORY[0x1E0C80C00];
  v13 = (unint64_t)a3;
  v14 = (unint64_t)a4;
  if (v13 | v14)
  {
    v15 = [CMIFFTContext alloc];
    if (v14)
      v16 = -[CMIFFTContext initWithFigMetalContext:](v15, "initWithFigMetalContext:", v14);
    else
      v16 = -[CMIFFTContext initWithDevice:](v15, "initWithDevice:", v13);
    v17 = (void *)v16;
    v18 = [CMIFFTTransformInternal alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CMIFFTTransformInternal initWithContext:nDim:sizes:istrides:ostrides:layout:precision:batchsize:](v18, "initWithContext:nDim:sizes:istrides:ostrides:layout:precision:batchsize:", v17, 1, v20, &unk_1E9514258, &unk_1E9514270, a6, a7, a8);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)CMIFFT2DTransform:(id)a3 figMetalContext:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6 layout:(int64_t)a7 precision:(int64_t)a8
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;
  CMIFFTContext *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CMIFFTTransformInternal *v24;
  void *v26;
  CMIFFTTransformInternal *v27;
  int64_t v28;
  unint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v32[2] = *MEMORY[0x1E0C80C00];
  v13 = (unint64_t)a3;
  v14 = (unint64_t)a4;
  if (v13 | v14)
  {
    v15 = [CMIFFTContext alloc];
    v28 = a7;
    v29 = v13;
    if (v14)
      v16 = -[CMIFFTContext initWithFigMetalContext:](v15, "initWithFigMetalContext:", v14);
    else
      v16 = -[CMIFFTContext initWithDevice:](v15, "initWithDevice:", v13);
    v26 = (void *)v16;
    v27 = [CMIFFTTransformInternal alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = &unk_1E9513A50;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = &unk_1E9513A50;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[CMIFFTTransformInternal initWithContext:nDim:sizes:istrides:ostrides:layout:precision:batchsize:](v27, "initWithContext:nDim:sizes:istrides:ostrides:layout:precision:batchsize:", v26, 2, v19, v21, v23, v28, a8, 1);

    v13 = v29;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
