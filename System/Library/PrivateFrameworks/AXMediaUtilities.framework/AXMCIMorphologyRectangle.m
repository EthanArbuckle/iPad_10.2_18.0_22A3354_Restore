@implementation AXMCIMorphologyRectangle

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[4];
  _QWORD v27[5];
  _QWORD v28[7];

  v28[5] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v26[0] = *MEMORY[0x1E0C9DEF0];
  v26[1] = v2;
  v3 = *MEMORY[0x1E0C9DEF8];
  v26[2] = *MEMORY[0x1E0C9DF30];
  v26[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9DE28];
  v28[0] = v17;
  v28[1] = CFSTR("13");
  v5 = *MEMORY[0x1E0C9DE20];
  v27[1] = v4;
  v27[2] = v5;
  v28[2] = CFSTR("10.15");
  v27[3] = *MEMORY[0x1E0C9E290];
  v7 = *MEMORY[0x1E0C9DEA0];
  v8 = *MEMORY[0x1E0C9DE50];
  v20[0] = *MEMORY[0x1E0C9DE68];
  v6 = v20[0];
  v20[1] = v8;
  v25[0] = v7;
  v25[1] = &unk_1E6288AF8;
  v10 = *MEMORY[0x1E0C9DE58];
  v21 = *MEMORY[0x1E0C9DE60];
  v9 = v21;
  v22 = v10;
  v25[2] = &unk_1E6288AF8;
  v25[3] = &unk_1E6288B08;
  v12 = *MEMORY[0x1E0C9DE40];
  v23 = *MEMORY[0x1E0C9DE10];
  v11 = v23;
  v24 = v12;
  v25[4] = &unk_1E6288B18;
  v25[5] = &unk_1E6288AF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v20, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v13;
  v27[4] = CFSTR("inputHeight");
  v18[0] = v6;
  v18[1] = v8;
  v19[0] = v7;
  v19[1] = &unk_1E6288AF8;
  v18[2] = v9;
  v18[3] = v10;
  v19[2] = &unk_1E6288AF8;
  v19[3] = &unk_1E6288B08;
  v18[4] = v11;
  v18[5] = v12;
  v19[4] = &unk_1E6288B18;
  v19[5] = &unk_1E6288AF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)_isIdentity
{
  return -[NSNumber intValue](self->inputWidth, "intValue") <= 2
      && -[NSNumber intValue](self->inputHeight, "intValue") < 3;
}

- (BOOL)_doMinimum
{
  return 0;
}

- (id)outputImage
{
  CIImage *v3;
  CIImage *v4;
  float v5;
  signed int v6;
  float v7;
  signed int v8;
  double v9;
  double v10;
  int v11;
  uint64_t *v12;
  id v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  double x;
  double y;
  double width;
  double height;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v38;
  int v39;
  _QWORD v40[4];
  int v41;
  _QWORD v42[4];
  int v43;
  _QWORD v44[3];
  _QWORD v45[5];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45[3] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    if (-[AXMCIMorphologyRectangle _isIdentity](self, "_isIdentity"))
    {
      v3 = self->inputImage;
LABEL_27:
      v4 = v3;
      return v4;
    }
    -[NSNumber floatValue](self->inputWidth, "floatValue");
    v6 = 1;
    if (v5 > 2.0)
      v6 = (2 * vcvtms_s32_f32(v5 * 0.5)) | 1;
    -[NSNumber floatValue](self->inputHeight, "floatValue");
    v8 = 1;
    if (v7 > 2.0)
      v8 = (2 * vcvtms_s32_f32(v7 * 0.5)) | 1;
    if (-[AXMCIMorphologyRectangle _doMinimum](self, "_doMinimum"))
    {
      -[CIImage extent](self->inputImage, "extent");
      if (v9 <= (double)(v6 - 1) || (-[CIImage extent](self->inputImage, "extent"), v10 <= (double)(v8 - 1)))
      {
        objc_msgSend(MEMORY[0x1E0C9DDC8], "emptyImage");
        v3 = (CIImage *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      v4 = self->inputImage;
      if (kernel_morphmin_once != -1)
        dispatch_once(&kernel_morphmin_once, &__block_literal_global_4);
      v11 = 1;
      v12 = &kernel_morphmin_singleton;
    }
    else
    {
      v4 = self->inputImage;
      if (kernel_morphmax_once != -1)
        dispatch_once(&kernel_morphmax_once, &__block_literal_global_60);
      v11 = -1;
      v12 = &kernel_morphmax_singleton;
    }
    v13 = (id)*v12;
    if (v8 >= 0)
      v14 = v8;
    else
      v14 = v8 + 1;
    if (v11 * v8 >= 0)
      v15 = v11 * v8;
    else
      v15 = v11 * v8 + 1;
    v16 = MEMORY[0x1E0C809B0];
    if (v6 >= 3)
    {
      v17 = v11 * v6 / 2;
      v18 = v6 >> 1;
      v38 = v15;
      v39 = v14;
      -[CIImage extent](v4, "extent");
      v47 = CGRectInset(v46, (double)v17, 0.0);
      x = v47.origin.x;
      y = v47.origin.y;
      width = v47.size.width;
      height = v47.size.height;
      v42[0] = v16;
      v42[1] = 3221225472;
      v42[2] = __39__AXMCIMorphologyRectangle_outputImage__block_invoke;
      v42[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v43 = v18;
      v45[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v23;
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 1.0, 0.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", v42, v25, x, y, width, height);
      v26 = objc_claimAutoreleasedReturnValue();

      v15 = v38;
      v14 = v39;
      v4 = (CIImage *)v26;
    }
    if (v8 >= 3)
    {
      v27 = (v14 >> 1);
      v28 = v15 >> 1;
      -[CIImage extent](v4, "extent");
      v49 = CGRectInset(v48, 0.0, (double)v28);
      v29 = v49.origin.x;
      v30 = v49.origin.y;
      v31 = v49.size.width;
      v32 = v49.size.height;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __39__AXMCIMorphologyRectangle_outputImage__block_invoke_2;
      v40[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v41 = v27;
      v44[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v33;
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, 1.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", v40, v35, v29, v30, v31, v32);
      v36 = objc_claimAutoreleasedReturnValue();

      v4 = (CIImage *)v36;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

double __39__AXMCIMorphologyRectangle_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (double)-*(_DWORD *)(a1 + 32), 0.0);
  return result;
}

double __39__AXMCIMorphologyRectangle_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (double)-*(_DWORD *)(a1 + 32));
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->inputImage, a3);
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_storeStrong((id *)&self->inputWidth, a3);
}

- (NSNumber)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(id)a3
{
  objc_storeStrong((id *)&self->inputHeight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputHeight, 0);
  objc_storeStrong((id *)&self->inputWidth, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
