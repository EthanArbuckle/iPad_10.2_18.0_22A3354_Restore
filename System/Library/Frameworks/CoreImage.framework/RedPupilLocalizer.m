@implementation RedPupilLocalizer

- (id)outputImage
{
  CIImage *inputImage;
  int v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  CIImage *v24;
  CIImage *v25;
  float v27;
  CIImage *v28;
  CIImage *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  CIImage *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  float v39;
  _QWORD v40[5];
  _QWORD v41[5];
  const __CFString *v42;
  CIVector *v43;
  _QWORD v44[2];
  _QWORD v45[4];
  CGRect v46;

  v45[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  v4 = -[NSNumber intValue](self->inputIterations, "intValue");
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v39 = v5;
  -[NSNumber floatValue](self->inputDecay, "floatValue");
  v7 = v6;
  -[NSNumber floatValue](self->inputGamma, "floatValue");
  v9 = v8;
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[NSNumber floatValue](self->inputLocalizationRadius, "floatValue");
  v19 = v18;
  -[NSNumber floatValue](self->inputSearchAxisLong, "floatValue");
  v21 = v19 * v20;
  -[NSNumber floatValue](self->inputSearchAxisShort, "floatValue");
  v23 = v19 * v22;
  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  v24 = RRradialEllipticalMask(v46, self->inputAxisLong, (objc_object *)self->inputPupilCenter, v21, v23, 0.25, 1.0);
  v25 = RRmultiplyRh(inputImage, v24);
  if (-[NSNumber BOOLValue](self->inputDebug, "BOOLValue"))
  {
    -[CIImage extent](self->inputImage, "extent");
    return -[CIImage imageByCroppingToRect:](v25, "imageByCroppingToRect:");
  }
  else
  {
    -[NSNumber floatValue](self->inputClip, "floatValue");
    v28 = RRclip(v25, v27);
    v44[0] = CFSTR("inputMinComponents");
    v44[1] = CFSTR("inputMaxComponents");
    v45[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v45[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 2.0, 2.0, 2.0, 1.0);
    v29 = -[CIImage _imageByApplyingGamma:](-[CIImage imageByApplyingFilter:withInputParameters:](v28, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorClamp"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2)), "_imageByApplyingGamma:", v9);
    if (!-[NSNumber BOOLValue](self->inputDebug, "BOOLValue"))
    {
      v42 = CFSTR("inputExtent");
      v43 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v11, v13, v15, v17);
      v29 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v29, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaRedCentroid"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1)), "imageByClampingToExtent");
      -[CIVector _norm](self->inputAxisLong, "_norm");
      v31 = v30;
      -[CIVector _norm](self->inputAxisShort, "_norm");
      if (v4 >= 1)
      {
        v33 = (v31 * 0.75 + v32 * 0.25) * v39;
        v34 = self->inputImage;
        v35 = 1.0 - v7;
        do
        {
          v36 = v35 * v33;
          if (v36 < 0.0)
            v36 = 0.0;
          v33 = v36;
          v40[0] = CFSTR("inputExtent");
          v41[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v11, v13, v15, v17);
          v41[1] = v29;
          v40[1] = CFSTR("inputCenter");
          v40[2] = CFSTR("inputRadialMode");
          v41[2] = &unk_1E2F1B740;
          v40[3] = CFSTR("inputRadius");
          *(float *)&v37 = v33;
          v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
          v40[4] = CFSTR("inputMinWeight");
          v41[3] = v38;
          v41[4] = &unk_1E2F196C0;
          v29 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v34, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaRedRadialCentroid"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 5)), "imageByClampingToExtent");
          --v4;
        }
        while (v4);
      }
    }
    return v29;
  }
}

- (NSNumber)inputIterations
{
  return self->inputIterations;
}

- (void)setInputIterations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputDecay
{
  return self->inputDecay;
}

- (void)setInputDecay:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputGamma
{
  return self->inputGamma;
}

- (void)setInputGamma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputClip
{
  return self->inputClip;
}

- (void)setInputClip:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputLocalizationRadius
{
  return self->inputLocalizationRadius;
}

- (void)setInputLocalizationRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputDebug
{
  return self->inputDebug;
}

- (void)setInputDebug:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (CIVector)inputAxisLong
{
  return self->inputAxisLong;
}

- (void)setInputAxisLong:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (CIVector)inputAxisShort
{
  return self->inputAxisShort;
}

- (void)setInputAxisShort:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (CIVector)inputPupilCenter
{
  return self->inputPupilCenter;
}

- (void)setInputPupilCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSNumber)inputSearchAxisLong
{
  return self->inputSearchAxisLong;
}

- (void)setInputSearchAxisLong:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSNumber)inputSearchAxisShort
{
  return self->inputSearchAxisShort;
}

- (void)setInputSearchAxisShort:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

@end
