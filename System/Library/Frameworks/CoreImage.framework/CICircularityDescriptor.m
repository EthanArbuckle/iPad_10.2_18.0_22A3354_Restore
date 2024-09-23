@implementation CICircularityDescriptor

- (id)outputImage
{
  CIImage *inputCentroid;
  CIImage *inputImage;
  CIVector *inputExtent;
  double v6;
  double v7;
  double v8;
  double v9;
  CIImage *v10;
  CIVector *v11;
  uint64_t v12;
  CIColorKernel *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CIImage *v22;
  CIVector *v23;
  uint64_t v24;
  CIColorKernel *v25;
  _QWORD v27[2];
  const __CFString *v28;
  CIVector *v29;
  _QWORD v30[4];
  const __CFString *v31;
  CIVector *v32;
  const __CFString *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  inputCentroid = self->inputCentroid;
  if (!inputCentroid)
  {
    inputImage = self->inputImage;
    inputExtent = self->inputExtent;
    v33 = CFSTR("inputExtent");
    v34[0] = inputExtent;
    inputCentroid = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaRedCentroid"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1));
  }
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v10 = self->inputImage;
  v11 = self->inputExtent;
  v31 = CFSTR("inputExtent");
  v32 = v11;
  v12 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1)), "imageByClampingToExtent");
  v13 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_cdintersect);
  *(float *)&v7 = v7 * v9 / 3.14159265;
  -[CIImage extent](self->inputImage, "extent");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v30[0] = self->inputImage;
  v30[1] = inputCentroid;
  v30[2] = v12;
  LODWORD(v14) = LODWORD(v7);
  v30[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v22 = -[CIColorKernel applyWithExtent:arguments:](v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4), v15, v17, v19, v21);
  v23 = self->inputExtent;
  v28 = CFSTR("inputExtent");
  v29 = v23;
  v24 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1)), "imageByClampingToExtent");
  v25 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_cdmeasure);
  v27[0] = v12;
  v27[1] = v24;
  return -[CIColorKernel applyWithExtent:arguments:](v25, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2), 0.0, 0.0, 1.0, 1.0);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIImage)inputCentroid
{
  return self->inputCentroid;
}

- (void)setInputCentroid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
