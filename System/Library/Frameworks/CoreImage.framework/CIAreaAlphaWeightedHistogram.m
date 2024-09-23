@implementation CIAreaAlphaWeightedHistogram

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryReduction");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("18");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("15.0");
  v8[3] = CFSTR("inputCount");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18B60;
  v6[1] = &unk_1E2F18B70;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F18B80;
  v6[3] = &unk_1E2F18B90;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18BA0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18BB0;
  v4[1] = &unk_1E2F18BB0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F18B60;
  v4[3] = &unk_1E2F18B60;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)outputData
{
  return 0;
}

- (id)outputImage
{
  CIImage *v3;
  CIColorKernel *v4;
  NSNumber *inputCount;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  unint64_t x;
  unint64_t width;
  unint64_t height;
  uint64_t v26;
  NSNumber *inputScale;
  uint64_t v28;
  NSNumber *v29;
  uint64_t v30;
  double v31;
  CIImage *v32;
  uint64_t v34;
  _QWORD v35[7];
  _QWORD v36[7];
  _QWORD v37[3];
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v37[2] = *MEMORY[0x1E0C80C00];
  if (!-[CIAreaHistogram _inputsAreOK](self, "_inputsAreOK"))
    return 0;
  v3 = -[CIImage imageByUnpremultiplyingAlpha](self->super.inputImage, "imageByUnpremultiplyingAlpha");
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_prepHistogram);
  -[CIImage extent](v3, "extent");
  inputCount = self->super.inputCount;
  v37[0] = v3;
  v37[1] = inputCount;
  v10 = -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2), v6, v7, v8, v9);
  -[CIImage extent](self->super.inputImage, "extent");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CIVector CGRectValue](self->super.inputExtent, "CGRectValue");
  v40.origin.x = v19;
  v40.origin.y = v20;
  v40.size.width = v21;
  v40.size.height = v22;
  v38.origin.x = v12;
  v38.origin.y = v14;
  v38.size.width = v16;
  v38.size.height = v18;
  v39 = CGRectIntersection(v38, v40);
  x = (unint64_t)v39.origin.x;
  width = (unint64_t)v39.size.width;
  height = (unint64_t)v39.size.height;
  v35[0] = CFSTR("areaX");
  v36[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (unint64_t)v39.origin.x);
  v35[1] = CFSTR("areaY");
  v36[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", x);
  v35[2] = CFSTR("areaW");
  v36[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", width);
  v35[3] = CFSTR("areaH");
  v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", height);
  inputScale = self->super.inputScale;
  v36[3] = v26;
  v36[4] = inputScale;
  v35[4] = CFSTR("scale");
  v35[5] = CFSTR("tileSize");
  v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 256);
  v35[6] = CFSTR("binCount");
  v29 = self->super.inputCount;
  v36[5] = v28;
  v36[6] = v29;
  v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 7);
  v31 = (double)-[NSNumber intValue](self->super.inputCount, "intValue");
  v34 = v10;
  v32 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](TiledHistogram, "applyWithExtent:inputs:arguments:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1), v30, 0, 0.0, 0.0, v31, 1.0);
  -[CIImage extent](v32, "extent");
  return -[CIImage imageBySettingAlphaOneInExtent:](v32, "imageBySettingAlphaOneInExtent:");
}

@end
