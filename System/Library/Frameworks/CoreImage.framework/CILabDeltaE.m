@implementation CILabDeltaE

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorEffect");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryInterlaced");
  v3[3] = CFSTR("CICategoryNonSquarePixels");
  v3[4] = CFSTR("CICategoryStillImage");
  v3[5] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v5[1] = CFSTR("11");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.13");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *v3;
  CIImage *inputImage;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CIImage **p_inputImage2;
  CIImage *inputImage2;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double x;
  double y;
  double width;
  double height;
  CIColorKernel *v27;
  CIImage *v28;
  CIImage *v29;
  _QWORD v31[3];
  CGRect v32;
  CGRect v33;

  v31[2] = *MEMORY[0x1E0C80C00];
  v3 = +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  if (!inputImage)
  {
    p_inputImage2 = &self->inputImage2;
    inputImage2 = self->inputImage2;
    if (!inputImage2)
      return v3;
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_6;
  }
  -[CIImage extent](inputImage, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  p_inputImage2 = &self->inputImage2;
  inputImage2 = self->inputImage2;
  if (inputImage2)
  {
LABEL_6:
    -[CIImage extent](inputImage2, "extent");
    v15 = v19;
    v16 = v20;
    v17 = v21;
    v18 = v22;
    goto LABEL_7;
  }
  v15 = *MEMORY[0x1E0C9D628];
  v16 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  v17 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  v18 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
LABEL_7:
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  v33 = CGRectUnion(v32, *(CGRect *)&v15);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  v27 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_LabDeltaE);
  v28 = self->inputImage;
  if (!v28)
    v28 = v3;
  v31[0] = v28;
  v29 = *p_inputImage2;
  if (!*p_inputImage2)
    v29 = v3;
  v31[1] = v29;
  return -[CIImage imageByTaggingWithColorSpace:](-[CIColorKernel applyWithExtent:arguments:](v27, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2), x, y, width, height), "imageByTaggingWithColorSpace:", 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputImage2
{
  return self->inputImage2;
}

- (void)setInputImage2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
