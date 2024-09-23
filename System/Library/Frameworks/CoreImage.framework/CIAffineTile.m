@implementation CIAffineTile

+ (id)customAttributes
{
  uint64_t v2;
  CGAffineTransform v4;
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformMakeScale(&v4, 0.4, 0.4);
  v2 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", MEMORY[0x1E0C9BAA8], "{CGAffineTransform=dddddd}");
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryTileEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputTransform");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeTransform");
  v6[1] = v2;
  v5[2] = CFSTR("CIAttributeIdentity");
  v6[2] = v2;
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_lowq_affine);
}

- (id)outputImage
{
  NSValue *inputTransform;
  const char *v4;
  __int128 v5;
  __int128 v6;
  _BOOL4 IsInfinite;
  CIImage *inputImage;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  NSObject *v22;
  uint64_t v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _QWORD v28[4];
  CGRect v29;

  v28[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputTransform = self->inputTransform;
  if (!inputTransform)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v26.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v26.c = v5;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
LABEL_10:
    *(_OWORD *)&v26.tx = v6;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[NSValue objCType](inputTransform, "objCType");
    if (!strcmp(v4, "{CGAffineTransform=dddddd}") || !strcmp(v4, "{?=dddddd}"))
    {
      -[NSValue getValue:size:](inputTransform, "getValue:size:", &v26, 48);
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(&v27, 0, sizeof(v27));
    -[NSValue transformStruct](inputTransform, "transformStruct");
    memset(&v26, 0, 32);
    v6 = 0u;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || -[NSValue count](inputTransform, "count") != 6)
  {
LABEL_17:
    v22 = ci_logger_filter();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CIAffineClamp outputImage].cold.1((uint64_t)self, v22);
    return 0;
  }
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 0), "doubleValue");
  v26.a = v16;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 1), "doubleValue");
  v26.b = v17;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 2), "doubleValue");
  v26.c = v18;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 3), "doubleValue");
  v26.d = v19;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 4), "doubleValue");
  v26.tx = v20;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 5), "doubleValue");
  v26.ty = v21;
LABEL_11:
  -[CIImage extent](self->inputImage, "extent");
  IsInfinite = CGRectIsInfinite(v29);
  inputImage = self->inputImage;
  if (IsInfinite)
  {
    v25 = v26;
    return -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v25);
  }
  else
  {
    v10 = -[CIImage filteredImage:keysAndValues:](inputImage, "filteredImage:keysAndValues:", CFSTR("CISimpleTile"), 0);
    v24 = v26;
    CGAffineTransformInvert(&v27, &v24);
    v26 = v27;
    v11 = -[CIAffineTile _kernel](self, "_kernel");
    v12 = *MEMORY[0x1E0C9D5E0];
    v13 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v28[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(_OWORD *)&v26.tx, MEMORY[0x1E0C809B0], 3221225472, __27__CIAffineTile_outputImage__block_invoke, &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, *(_OWORD *)&v26.a, *(_OWORD *)&v26.c, *(_OWORD *)&v26.tx);
    v28[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v26.a, v26.c);
    v28[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v26.b, v26.d);
    return (id)objc_msgSend(v11, "applyWithExtent:roiCallback:inputImage:arguments:", &v23, v10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3), v12, v13, v14, v15);
  }
}

double __27__CIAffineTile_outputImage__block_invoke(_OWORD *a1, double a2, double a3, double a4, double a5)
{
  __int128 v5;
  double result;
  CGAffineTransform v7;

  v5 = a1[3];
  *(_OWORD *)&v7.a = a1[2];
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = a1[4];
  *(_QWORD *)&result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a2, &v7);
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

- (NSValue)inputTransform
{
  return self->inputTransform;
}

- (void)setInputTransform:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
