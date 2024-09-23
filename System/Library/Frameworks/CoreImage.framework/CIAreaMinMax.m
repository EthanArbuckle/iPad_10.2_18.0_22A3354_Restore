@implementation CIAreaMinMax

- (id)outputImageMPS:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  int64x2_t v16[5];
  _QWORD v17[8];
  _QWORD v18[8];
  double __src;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "extent");
  v8 = v7;
  v10 = v9;
  *(float *)&v7 = v5;
  *(float *)&v9 = v6;
  if (fmaxf(*(float *)&v7, *(float *)&v9) > 4096.0)
    return 0;
  v12 = v5;
  v13 = v6;
  v20[0] = CFSTR("kCIImageProcessorSynchronizeInputs");
  v20[1] = CFSTR("kCIImageProcessorAllowPartialOutputRegion");
  v21[0] = MEMORY[0x1E0C9AAA0];
  v21[1] = MEMORY[0x1E0C9AAA0];
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke;
  v18[3] = &__block_descriptor_64_e62_v24__0___CIImageProcessorInput__8___CIImageProcessorOutput__16l;
  *(double *)&v18[4] = v8;
  *(double *)&v18[5] = v10;
  *(double *)&v18[6] = v12;
  *(double *)&v18[7] = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke_2;
  v17[3] = &__block_descriptor_64_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  *(double *)&v17[4] = v8;
  *(double *)&v17[5] = v10;
  *(double *)&v17[6] = v12;
  *(double *)&v17[7] = v13;
  XXH64_reset(v16, 0);
  __src = v8;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  __src = v10;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  __src = v12;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  __src = v13;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CIAreaMinMax %@"), self->super.inputExtent);
  return (id)objc_msgSend(a3, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v15, XXH64_digest((uint64_t)v16), kCIFormatAllowSRGB, kCIFormatAllowSRGB, v14, v17, 0.0, 0.0, 2.0, 1.0, v18);
}

void __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke(double *a1, void *a2, void *a3)
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  unint64_t v28;
  int v29;
  int v30;
  _QWORD v31[2];
  __int128 v32;
  int64x2_t v33;
  _QWORD v34[6];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = (void *)objc_msgSend(a3, "metalCommandBuffer");
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6EA8]), "initWithDevice:", objc_msgSend(v9, "device"));
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(a2, "region");
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
      if (CGRectIsNull(v35))
      {
        LODWORD(v17) = 0;
        v18 = 0x7FFFFFFF;
        v19 = 0x7FFFFFFF;
      }
      else
      {
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        if (CGRectIsInfinite(v36))
        {
          v18 = -2147483647;
          LODWORD(v17) = -1;
          v19 = -2147483647;
        }
        else
        {
          v37.origin.x = x;
          v37.origin.y = y;
          v37.size.width = width;
          v37.size.height = height;
          v38 = CGRectInset(v37, 0.000001, 0.000001);
          v39 = CGRectIntegral(v38);
          v19 = (int)v39.origin.x;
          v18 = (int)v39.origin.y;
          v17 = (unint64_t)v39.size.height;
        }
      }
      v40.origin.x = v5;
      v40.origin.y = v6;
      v40.size.width = v7;
      v40.size.height = v8;
      if (CGRectIsNull(v40))
      {
        v20 = 0;
        v21 = 0;
        v22 = 0x7FFFFFFF;
        v23 = 0x7FFFFFFF;
      }
      else
      {
        v41.origin.x = v5;
        v41.origin.y = v6;
        v41.size.width = v7;
        v41.size.height = v8;
        if (CGRectIsInfinite(v41))
        {
          v22 = -2147483647;
          v20 = 0xFFFFFFFFLL;
          v21 = 0xFFFFFFFFLL;
          v23 = -2147483647;
        }
        else
        {
          v42.origin.x = v5;
          v42.origin.y = v6;
          v42.size.width = v7;
          v42.size.height = v8;
          v43 = CGRectInset(v42, 0.000001, 0.000001);
          v44 = CGRectIntegral(v43);
          v23 = (int)v44.origin.x;
          v22 = (int)v44.origin.y;
          v21 = (unint64_t)v44.size.width;
          v20 = (unint64_t)v44.size.height;
        }
      }
      v34[0] = v19 - v23;
      v34[1] = (int)v20 - v18 - (int)v17 + v22;
      v34[2] = 0;
      v34[3] = v21;
      v34[4] = v20;
      v34[5] = 1;
      objc_msgSend(v12, "setClipRectSource:", v34);
      objc_msgSend(v12, "setOptions:", 2);
      objc_msgSend(v12, "setEdgeMode:", 1);
      objc_msgSend(a3, "region");
      v24 = v45.origin.x;
      v25 = v45.origin.y;
      v26 = v45.size.width;
      v27 = v45.size.height;
      if (CGRectIsNull(v45))
      {
        LODWORD(v28) = 0;
        v29 = 2147483646;
        v30 = 0x7FFFFFFF;
      }
      else
      {
        v46.origin.x = v24;
        v46.origin.y = v25;
        v46.size.width = v26;
        v46.size.height = v27;
        if (CGRectIsInfinite(v46))
        {
          LODWORD(v28) = -1;
          v29 = 0x80000000;
          v30 = -2147483647;
        }
        else
        {
          v47.origin.x = v24;
          v47.origin.y = v25;
          v47.size.width = v26;
          v47.size.height = v27;
          v48 = CGRectInset(v47, 0.000001, 0.000001);
          v49 = CGRectIntegral(v48);
          v30 = (int)v49.origin.x;
          v28 = (unint64_t)v49.size.height;
          v29 = (int)v49.origin.y - 1;
        }
      }
      v31[0] = -v30;
      v31[1] = (int)v28 + v29;
      v32 = xmmword_1924976C0;
      v33 = vdupq_n_s64(1uLL);
      objc_msgSend(v12, "setClipRect:", v31);
      objc_msgSend(v12, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v10, objc_msgSend(a2, "metalTexture"), objc_msgSend(a3, "metalTexture"));

    }
  }
}

double __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryReduction");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryHighDynamicRange");
  v3[4] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("12");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.14");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImageNonMPS
{
  CIFilter *v3;
  CIImage *v4;
  CIFilter *v5;

  v3 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMaximum"));
  -[CIFilter setInputImage:](v3, "setInputImage:", self->super.inputImage);
  -[CIFilter setInputExtent:](v3, "setInputExtent:", self->super.inputExtent);
  v4 = -[CIImage imageByCroppingToRect:](-[CIImage imageByClampingToExtent](-[CIFilter outputImage](v3, "outputImage"), "imageByClampingToExtent"), "imageByCroppingToRect:", 1.0, 0.0, 1.0, 1.0);
  v5 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIAreaMinimum"));
  -[CIFilter setInputImage:](v5, "setInputImage:", self->super.inputImage);
  -[CIFilter setInputExtent:](v5, "setInputExtent:", self->super.inputExtent);
  return -[CIImage imageByCompositingOverImage:](v4, "imageByCompositingOverImage:", -[CIImage imageByCroppingToRect:](-[CIImage imageByClampingToExtent](-[CIFilter outputImage](v5, "outputImage"), "imageByClampingToExtent"), "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0));
}

- (id)outputImage
{
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  CGRect v9;
  CGRect v10;

  v3 = -[CIReductionFilter offsetAndCrop](self, "offsetAndCrop");
  if (!v3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = v3;
  objc_msgSend(v3, "extent");
  if (CGRectIsEmpty(v9))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v6 = -[CIAreaMinMax outputImageNonMPS](self, "outputImageNonMPS");
  if (CI_ENABLE_MPS()
    && (v7 = -[CIAreaMinMax outputImageMPS:](self, "outputImageMPS:", v4)) != 0
    && (v8 = v7, objc_msgSend(v7, "extent"), !CGRectIsEmpty(v10)))
  {
    return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", v8, v6);
  }
  else
  {
    return v6;
  }
}

@end
