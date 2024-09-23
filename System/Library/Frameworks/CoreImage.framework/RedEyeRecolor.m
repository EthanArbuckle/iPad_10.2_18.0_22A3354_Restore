@implementation RedEyeRecolor

- (id)kernelRepair
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_repair);
}

- (id)kernelRecovery
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_recovery);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIImage *inputSource;
  CIImage *inputImage;
  uint64_t v13;
  CIImage *v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double x;
  double y;
  double width;
  double height;
  id v32;
  CIImage *v33;
  id v34;
  NSNumber *inputBrightness;
  NSNumber *inputWhiteCutoff;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD v42[9];
  _QWORD v43[5];
  const __CFString *v44;
  CIVector *v45;
  const __CFString *v46;
  _QWORD v47[2];
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v47[1] = *MEMORY[0x1E0C80C00];
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  inputSource = self->inputSource;
  inputImage = self->inputImage;
  v46 = CFSTR("inputExtent");
  v47[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v13 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1)), "imageByClampingToExtent");
  v14 = self->inputImage;
  if (-[NSNumber BOOLValue](self->inputRecovery, "BOOLValue"))
  {
    v44 = CFSTR("inputExtent");
    v45 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v4, v6, v8, v10);
    v15 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputSource, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1)), "imageByClampingToExtent");
    -[CIImage extent](v14, "extent");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[CIImage extent](inputSource, "extent");
    v50.origin.x = v24;
    v50.origin.y = v25;
    v50.size.width = v26;
    v50.size.height = v27;
    v48.origin.x = v17;
    v48.origin.y = v19;
    v48.size.width = v21;
    v48.size.height = v23;
    v49 = CGRectUnion(v48, v50);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    v32 = -[RedEyeRecolor kernelRecovery](self, "kernelRecovery");
    v43[0] = v14;
    v43[1] = inputSource;
    v43[2] = v13;
    v43[3] = v15;
    v43[4] = self->inputRecovery;
    v14 = (CIImage *)objc_msgSend((id)objc_msgSend(v32, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5), x, y, width, height), "imageByCroppingToRect:", v4, v6, v8, v10);
  }
  v33 = -[CIFilter outputImage](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CheapRandomness"), &unk_1E2F1D530), "outputImage");
  v34 = -[RedEyeRecolor kernelRepair](self, "kernelRepair");
  -[CIImage extent](v14, "extent");
  v42[0] = v14;
  v42[1] = inputSource;
  v42[2] = self->inputMask;
  v42[3] = v13;
  inputBrightness = self->inputBrightness;
  v42[4] = v33;
  v42[5] = inputBrightness;
  inputWhiteCutoff = self->inputWhiteCutoff;
  v42[6] = self->inputNoiseAmount;
  v42[7] = inputWhiteCutoff;
  v42[8] = self->inputChroma;
  return (id)objc_msgSend(v34, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 9), v37, v38, v39, v40);
}

- (CIImage)inputSource
{
  return self->inputSource;
}

- (void)setInputSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIImage)inputMask
{
  return self->inputMask;
}

- (void)setInputMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputNoiseAmount
{
  return self->inputNoiseAmount;
}

- (void)setInputNoiseAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputRecovery
{
  return self->inputRecovery;
}

- (void)setInputRecovery:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)inputWhiteCutoff
{
  return self->inputWhiteCutoff;
}

- (void)setInputWhiteCutoff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputChroma
{
  return self->inputChroma;
}

- (void)setInputChroma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end
