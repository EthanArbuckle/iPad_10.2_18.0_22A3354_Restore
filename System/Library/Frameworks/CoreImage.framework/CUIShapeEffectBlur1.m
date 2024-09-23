@implementation CUIShapeEffectBlur1

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[8];
  _QWORD v22[9];

  v22[8] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("inputOffset");
  v19[0] = CFSTR("CIAttributeDefault");
  v19[1] = CFSTR("CIAttributeType");
  v20[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v20[1] = CFSTR("CIAttributeTypeOffset");
  v22[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v21[1] = CFSTR("inputRadius");
  v17[0] = CFSTR("CIAttributeMin");
  v17[1] = CFSTR("CIAttributeSliderMin");
  v18[0] = &unk_1E2F1B2D0;
  v18[1] = &unk_1E2F1B2D0;
  v17[2] = CFSTR("CIAttributeSliderMax");
  v17[3] = CFSTR("CIAttributeMax");
  v18[2] = &unk_1E2F1B2E0;
  v18[3] = &unk_1E2F1B310;
  v17[4] = CFSTR("CIAttributeDefault");
  v17[5] = CFSTR("CIAttributeType");
  v18[4] = &unk_1E2F1B320;
  v18[5] = CFSTR("CIAttributeTypeScalar");
  v22[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v21[2] = CFSTR("inputGlowColorInner");
  v15[0] = CFSTR("CIAttributeDefault");
  v15[1] = CFSTR("CIAttributeType");
  v16[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v16[1] = CFSTR("CIAttributeTypeColor");
  v22[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v21[3] = CFSTR("inputGlowOuterOuter");
  v13[0] = CFSTR("CIAttributeDefault");
  v13[1] = CFSTR("CIAttributeType");
  v14[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v14[1] = CFSTR("CIAttributeTypeColor");
  v22[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v21[4] = CFSTR("inputShadowColorInner");
  v11[0] = CFSTR("CIAttributeDefault");
  v11[1] = CFSTR("CIAttributeType");
  v12[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v12[1] = CFSTR("CIAttributeTypeColor");
  v22[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v21[5] = CFSTR("inputShadowOuterOuter");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v10[1] = CFSTR("CIAttributeTypeColor");
  v22[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v21[6] = CFSTR("inputShadowBlurInner");
  v2 = MEMORY[0x1E0C9AAB0];
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeMin");
  v3 = MEMORY[0x1E0C9AAA0];
  v8[0] = MEMORY[0x1E0C9AAB0];
  v8[1] = MEMORY[0x1E0C9AAA0];
  v7[2] = CFSTR("CIAttributeMax");
  v7[3] = CFSTR("CIAttributeType");
  v8[2] = MEMORY[0x1E0C9AAB0];
  v8[3] = CFSTR("CIAttributeTypeBoolean");
  v22[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v21[7] = CFSTR("inputShadowBlurOuter");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = v2;
  v6[1] = v3;
  v5[2] = CFSTR("CIAttributeMax");
  v5[3] = CFSTR("CIAttributeType");
  v6[2] = v2;
  v6[3] = CFSTR("CIAttributeTypeBoolean");
  v22[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_shapeEffectBlur_1);
}

- (id)outputImage
{
  double v3;
  id result;
  float v5;
  CIImage *v6;
  CIImage *inputImage;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CIImage *v13;
  CIImage *v14;
  CIVector *v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CIColor *inputGlowColorInner;
  CIColor *inputShadowColorInner;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  _QWORD v34[11];
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34[10] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  result = self->inputImage;
  if (result)
  {
    if (self->inputFill)
    {
      v5 = fmin(fmax(v3, 0.0), 50.0);
      v6 = _CUIMappedBlurImageWithSize((CIImage *)result, vcvtms_u32_f32(v5 / 2.853), 0);
      inputImage = self->inputImage;
      -[CIVector X](self->inputOffset, "X");
      if (v8 == 0.0 && (-[CIVector Y](self->inputOffset, "Y"), v9 == 0.0))
      {
        v13 = v6;
      }
      else
      {
        memset(&v33, 0, sizeof(v33));
        -[CIVector X](self->inputOffset, "X");
        v11 = -v10;
        -[CIVector Y](self->inputOffset, "Y");
        CGAffineTransformMakeTranslation(&v33, v11, -v12);
        v32 = v33;
        v13 = -[CIImage imageByApplyingTransform:](v6, "imageByApplyingTransform:", &v32);
        v14 = self->inputImage;
        v31 = v33;
        inputImage = -[CIImage imageByApplyingTransform:](v14, "imageByApplyingTransform:", &v31);
      }
      v15 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (double)-[NSNumber intValue](self->inputShadowBlurInner, "intValue"), (double)-[NSNumber intValue](self->inputShadowBlurOuter, "intValue"));
      v16 = -[CUIShapeEffectBlur1 _kernel](self, "_kernel");
      -[CIImage extent](v6, "extent");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[CIImage extent](v13, "extent");
      v37.origin.x = v25;
      v37.origin.y = v26;
      v37.size.width = v27;
      v37.size.height = v28;
      v35.origin.x = v18;
      v35.origin.y = v20;
      v35.size.width = v22;
      v35.size.height = v24;
      v36 = CGRectUnion(v35, v37);
      v34[0] = self->inputImage;
      v34[1] = inputImage;
      v34[2] = v6;
      v34[3] = v13;
      inputGlowColorInner = self->inputGlowColorInner;
      v34[4] = self->inputFill;
      v34[5] = inputGlowColorInner;
      inputShadowColorInner = self->inputShadowColorInner;
      v34[6] = self->inputGlowColorOuter;
      v34[7] = inputShadowColorInner;
      v34[8] = self->inputShadowColorOuter;
      v34[9] = v15;
      return (id)objc_msgSend(v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 10), v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputFill
{
  return self->inputFill;
}

- (void)setInputFill:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputOffset
{
  return self->inputOffset;
}

- (void)setInputOffset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIColor)inputGlowColorInner
{
  return self->inputGlowColorInner;
}

- (void)setInputGlowColorInner:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CIColor)inputGlowColorOuter
{
  return self->inputGlowColorOuter;
}

- (void)setInputGlowColorOuter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CIColor)inputShadowColorInner
{
  return self->inputShadowColorInner;
}

- (void)setInputShadowColorInner:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (CIColor)inputShadowColorOuter
{
  return self->inputShadowColorOuter;
}

- (void)setInputShadowColorOuter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputShadowBlurInner
{
  return self->inputShadowBlurInner;
}

- (void)setInputShadowBlurInner:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSNumber)inputShadowBlurOuter
{
  return self->inputShadowBlurOuter;
}

- (void)setInputShadowBlurOuter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

@end
