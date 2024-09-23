@implementation CIPhotoEffect3D

- (void)setInputThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setInputDepthMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIPhotoEffect3D;
  -[CIFilter setDefaults](&v3, sel_setDefaults);
  -[CIPhotoEffect3D setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIPhotoEffect3D _defaultVersion](self, "_defaultVersion")), CFSTR("__inputVersion"));
}

- (CIPhotoEffect3D)init
{
  CIPhotoEffect3D *v2;
  CIPhotoEffect3D *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIPhotoEffect3D;
  v2 = -[CIPhotoEffect3D init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CIPhotoEffect3D setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIPhotoEffect3D _defaultVersion](v2, "_defaultVersion")), CFSTR("__inputVersion"));
  return v3;
}

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[6];
  _QWORD v11[8];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryInterlaced");
  v9[3] = CFSTR("CICategoryNonSquarePixels");
  v9[4] = CFSTR("CICategoryStillImage");
  v9[5] = CFSTR("CICategoryBuiltIn");
  v9[6] = CFSTR("CICategoryXMPSerializable");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v11[1] = CFSTR("10");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.11");
  v10[3] = CFSTR("inputThreshold");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F1A670;
  v8[1] = &unk_1E2F1A680;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F1A670;
  v8[3] = &unk_1E2F1A680;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeIdentity");
  v8[4] = &unk_1E2F1A690;
  v8[5] = &unk_1E2F1A6A0;
  v7[6] = CFSTR("CIAttributeType");
  v8[6] = CFSTR("CIAttributeTypeScalar");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v10[4] = CFSTR("inputGrainAmount");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F1A670;
  v6[1] = &unk_1E2F1A680;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F1A670;
  v6[3] = &unk_1E2F1A680;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F1A670;
  v6[5] = &unk_1E2F1A670;
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v10[5] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F1A670;
  v4[1] = &unk_1E2F1A6B0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F1A670;
  v4[3] = &unk_1E2F1A6B0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1A680;
  v4[5] = &unk_1E2F1A680;
  v3[6] = CFSTR("CIAttributeType");
  v4[6] = CFSTR("CIAttributeTypeScalar");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (void)setInputGrainAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputThreshold
{
  return self->inputThreshold;
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (NSNumber)inputGrainAmount
{
  return self->inputGrainAmount;
}

- (CIImage)inputDepthMap
{
  return self->inputDepthMap;
}

- (id)backgroundCubeName
{
  uint64_t v3;
  objc_class *v4;
  id result;

  v3 = objc_msgSend((id)-[CIPhotoEffect3D valueForKey:](self, "valueForKey:", CFSTR("__inputVersion")), "intValue");
  if ((int)v3 >= -[CIPhotoEffect3D _maxVersionBG](self, "_maxVersionBG"))
    v3 = -[CIPhotoEffect3D _maxVersionBG](self, "_maxVersionBG");
  v4 = (objc_class *)objc_opt_class();
  result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@BG"), NSStringFromClass(v4));
  if ((int)v3 >= 1)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%d"), result, v3);
  return result;
}

- (int)_maxVersionBG
{
  return 1;
}

- (id)backgroundCubePath
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", -[CIPhotoEffect3D backgroundCubeName](self, "backgroundCubeName"), CFSTR("scube"));
}

- (id)cubePath
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", -[CIPhotoEffect3D cubeName](self, "cubeName"), CFSTR("scube"));
}

- (id)cubeName
{
  uint64_t v3;
  objc_class *v4;
  id result;

  v3 = objc_msgSend((id)-[CIPhotoEffect3D valueForKey:](self, "valueForKey:", CFSTR("__inputVersion")), "intValue");
  if ((int)v3 >= -[CIPhotoEffect3D _maxVersion](self, "_maxVersion"))
    v3 = -[CIPhotoEffect3D _maxVersion](self, "_maxVersion");
  v4 = (objc_class *)objc_opt_class();
  result = NSStringFromClass(v4);
  if ((int)v3 >= 1)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%d"), result, v3);
  return result;
}

- (int)_defaultVersion
{
  return 0;
}

- (id)_CIPhotoEffectDepthBlend
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_photoEffectDepthBlend);
}

- (id)cubeColorSpaceName
{
  return (id)*MEMORY[0x1E0C9D908];
}

- (id)applyCubeWithName:(id)a3 toImage:(id)a4
{
  void *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  if (-[CIPhotoEffect3D applyCubeWithName:toImage:]::once != -1)
    dispatch_once(&-[CIPhotoEffect3D applyCubeWithName:toImage:]::once, &__block_literal_global_56);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__CIPhotoEffect3D_applyCubeWithName_toImage___block_invoke_33;
  v9[3] = &unk_1E2EC4B90;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = a4;
  v9[7] = &v10;
  dispatch_sync((dispatch_queue_t)-[CIPhotoEffect3D applyCubeWithName:toImage:]::isolationQueue, v9);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

id __45__CIPhotoEffect3D_applyCubeWithName_toImage___block_invoke()
{
  NSObject *v0;
  id result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  -[CIPhotoEffect3D applyCubeWithName:toImage:]::isolationQueue = (uint64_t)dispatch_queue_create("com.apple.coreimage.photoEffects3DIsolation", v0);
  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CIPhotoEffect3D applyCubeWithName:toImage:]::cubes = (uint64_t)result;
  return result;
}

uint64_t __45__CIPhotoEffect3D_applyCubeWithName_toImage___block_invoke_33(_QWORD *a1)
{
  CIFilter *v2;
  void *v3;
  uint64_t v4;
  CGColorSpace *v5;

  v2 = (CIFilter *)objc_msgSend((id)-[CIPhotoEffect3D applyCubeWithName:toImage:]::cubes, "objectForKey:", a1[4]);
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", a1[4], CFSTR("scube")));
    v4 = (int)cbrt((double)((unint64_t)objc_msgSend(v3, "length") >> 2));
    v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    v2 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIColorCube"), CFSTR("inputCubeData"), v3, CFSTR("inputCubeDimension"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4), 0);
    CGColorSpaceRelease(v5);
    objc_msgSend((id)-[CIPhotoEffect3D applyCubeWithName:toImage:]::cubes, "setObject:forKey:", v2, a1[4]);
  }
  -[CIFilter setValue:forKey:](v2, "setValue:forKey:", a1[6], CFSTR("inputImage"));
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = -[CIFilter outputImage](v2, "outputImage");
  return -[CIFilter setValue:forKey:](v2, "setValue:forKey:", 0, CFSTR("inputImage"));
}

- (id)outputImage
{
  double width;
  double height;
  void *v5;
  id v6;
  CGColorSpace *v7;
  CIImage *inputImage;
  id v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  CIImage *inputDepthMap;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  id v21;
  NSNumber *inputThreshold;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  double v33;
  uint64_t v34;
  CGAffineTransform v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[5];
  CGRect v40;
  CGRect v41;

  v39[4] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  width = v40.size.width;
  height = v40.size.height;
  if (CGRectIsEmpty(v40))
    return 0;
  v6 = -[CIPhotoEffect3D cubeName](self, "cubeName");
  v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  inputImage = self->inputImage;
  if (v7)
  {
    inputImage = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v7);
    v9 = (id)objc_msgSend(-[CIPhotoEffect3D applyCubeWithName:toImage:](self, "applyCubeWithName:toImage:", v6, inputImage), "imageByColorMatchingColorSpaceToWorkingSpace:", v7);
  }
  else
  {
    v9 = -[CIPhotoEffect3D applyCubeWithName:toImage:](self, "applyCubeWithName:toImage:", v6, inputImage);
  }
  v5 = v9;
  -[CIImage extent](self->inputDepthMap, "extent");
  v10 = v41.size.width;
  v11 = v41.size.height;
  if (!CGRectIsEmpty(v41))
  {
    v12 = -[CIPhotoEffect3D applyCubeWithName:toImage:](self, "applyCubeWithName:toImage:", -[CIPhotoEffect3D backgroundCubeName](self, "backgroundCubeName"), inputImage);
    v13 = (uint64_t)v12;
    if (v7)
      v13 = objc_msgSend(v12, "imageByColorMatchingColorSpaceToWorkingSpace:", v7);
    inputDepthMap = self->inputDepthMap;
    if (width != v10 || height != v11)
    {
      v16 = width;
      v17 = v10;
      v18 = v16 / v17;
      v19 = height;
      v20 = v11;
      CGAffineTransformMakeScale(&v36, v18, (float)(v19 / v20));
      inputDepthMap = -[CIImage imageByApplyingTransform:](inputDepthMap, "imageByApplyingTransform:", &v36);
    }
    v21 = -[CIPhotoEffect3D _CIPhotoEffectDepthBlend](self, "_CIPhotoEffectDepthBlend");
    objc_msgSend(v5, "extent");
    v39[0] = v5;
    v39[1] = v13;
    inputThreshold = self->inputThreshold;
    v39[2] = inputDepthMap;
    v39[3] = inputThreshold;
    v5 = (void *)objc_msgSend(v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4), v23, v24, v25, v26);
    -[NSNumber floatValue](self->inputGrainAmount, "floatValue");
    v28 = v27;
    -[NSNumber floatValue](self->inputScale, "floatValue");
    v30 = v28 * v29;
    if (fabsf(v30) < 0.001)
    {
      v37[0] = CFSTR("inputAmount");
      v31 = (void *)MEMORY[0x1E0CB37E8];
      -[NSNumber floatValue](self->inputScale, "floatValue");
      *(float *)&v33 = v30 * v32;
      v34 = objc_msgSend(v31, "numberWithFloat:", v33);
      v37[1] = CFSTR("inputISO");
      v38[0] = v34;
      v38[1] = &unk_1E2F1BC50;
      v5 = (void *)objc_msgSend(v5, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPhotoGrain"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
    }
  }
  CGColorSpaceRelease(v7);
  return v5;
}

- (int)_maxVersion
{
  return 0;
}

@end
