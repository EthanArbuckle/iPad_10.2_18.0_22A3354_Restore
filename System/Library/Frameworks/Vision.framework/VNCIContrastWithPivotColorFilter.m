@implementation VNCIContrastWithPivotColorFilter

- (VNCIContrastWithPivotColorFilter)init
{
  VNCIContrastWithPivotColorFilter *v2;
  VNCIContrastWithPivotColorFilter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNCIContrastWithPivotColorFilter;
  v2 = -[VNCIFilter initWithKernelName:](&v5, sel_initWithKernelName_, CFSTR("contrastWithPivot"));
  v3 = v2;
  if (v2)
    -[VNCIContrastWithPivotColorFilter _initProperties]((uint64_t)v2);
  return v3;
}

- (VNCIContrastWithPivotColorFilter)initWithInputParameters:(id)a3
{
  VNCIContrastWithPivotColorFilter *v3;
  VNCIContrastWithPivotColorFilter *v4;

  v3 = -[VNCIFilter initWithKernelName:inputParameters:](self, "initWithKernelName:inputParameters:", CFSTR("contrastWithPivot"), a3);
  v4 = v3;
  if (v3)
    -[VNCIContrastWithPivotColorFilter _initProperties]((uint64_t)v3);
  return v4;
}

- (void)setInputPivot:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSNumber *v7;
  NSNumber *inputPivot;
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v9 = v4;
  objc_msgSend(v4, "floatValue");
  *(float *)&v6 = fminf(*(float *)&v6, 1.0);
  if (*(float *)&v6 < 0.0)
    *(float *)&v6 = 0.0;
  objc_msgSend(v5, "numberWithFloat:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  inputPivot = self->_inputPivot;
  self->_inputPivot = v7;

}

- (id)outputImage
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[VNCIContrastWithPivotColorFilter inputContrast](self, "inputContrast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  if (v5 == 1.0)
  {
    -[VNCIFilter inputImage](self, "inputImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VNCIContrastWithPivotColorFilter inputPivot](self, "inputPivot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[VNCIContrastWithPivotColorFilter inputContrast](self, "inputContrast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNCIFilter applyWithArguments:]((id *)&self->super.super.super.isa, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSNumber)inputContrast
{
  return self->_inputContrast;
}

- (void)setInputContrast:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputPivot
{
  return self->_inputPivot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPivot, 0);
  objc_storeStrong((id *)&self->_inputContrast, 0);
}

- (void)_initProperties
{
  if (!*(_QWORD *)(a1 + 96))
    *(_QWORD *)(a1 + 96) = &unk_1E459E528;
  if (!*(_QWORD *)(a1 + 104))
  {
    *(_QWORD *)(a1 + 104) = &unk_1E459E538;

  }
}

@end
