@implementation CIPhotoEffect

- (void)setInputExtrapolate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIPhotoEffect;
  -[CIFilter setDefaults](&v3, sel_setDefaults);
  -[CIPhotoEffect setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIPhotoEffect _defaultVersion](self, "_defaultVersion")), CFSTR("__inputVersion"));
}

- (CIPhotoEffect)init
{
  CIPhotoEffect *v2;
  CIPhotoEffect *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIPhotoEffect;
  v2 = -[CIPhotoEffect init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CIPhotoEffect setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIPhotoEffect _defaultVersion](v2, "_defaultVersion")), CFSTR("__inputVersion"));
  return v3;
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[8];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryInterlaced");
  v5[3] = CFSTR("CICategoryNonSquarePixels");
  v5[4] = CFSTR("CICategoryStillImage");
  v5[5] = CFSTR("CICategoryHighDynamicRange");
  v5[6] = CFSTR("CICategoryBuiltIn");
  v5[7] = CFSTR("CICategoryXMPSerializable");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 8);
  v7[1] = CFSTR("7");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.9");
  v6[3] = CFSTR("inputExtrapolate");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAA0];
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)cubePath
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", -[CIPhotoEffect cubeName](self, "cubeName"), CFSTR("scube"));
}

- (id)cubeName
{
  uint64_t v3;
  objc_class *v4;
  id result;

  v3 = objc_msgSend((id)-[CIPhotoEffect valueForKey:](self, "valueForKey:", CFSTR("__inputVersion")), "intValue");
  if ((int)v3 >= -[CIPhotoEffect _maxVersion](self, "_maxVersion"))
    v3 = -[CIPhotoEffect _maxVersion](self, "_maxVersion");
  v4 = (objc_class *)objc_opt_class();
  result = NSStringFromClass(v4);
  if ((int)v3 >= 1)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%d"), result, v3);
  return result;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (int)_defaultVersion
{
  return 0;
}

- (id)cubeColorSpaceName
{
  return (id)*MEMORY[0x1E0C9DA10];
}

- (id)outputImage
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  if (!self->inputImage)
    return 0;
  if (-[CIPhotoEffect outputImage]::once != -1)
    dispatch_once(&-[CIPhotoEffect outputImage]::once, &__block_literal_global_55);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CIPhotoEffect_outputImage__block_invoke_18;
  v5[3] = &unk_1E2EC3D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)-[CIPhotoEffect outputImage]::isolationQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __28__CIPhotoEffect_outputImage__block_invoke()
{
  NSObject *v0;
  id result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  -[CIPhotoEffect outputImage]::isolationQueue = (uint64_t)dispatch_queue_create("com.apple.coreimage.photoEffectsIsolation", v0);
  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CIPhotoEffect outputImage]::cubes = (uint64_t)result;
  return result;
}

uint64_t __28__CIPhotoEffect_outputImage__block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  CIFilter *v3;
  void *v4;
  uint64_t v5;
  CGColorSpace *DeviceRGB;

  v2 = objc_msgSend(*(id *)(a1 + 32), "cubeName");
  v3 = (CIFilter *)objc_msgSend((id)-[CIPhotoEffect outputImage]::cubes, "objectForKey:", v2);
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", v2, CFSTR("scube")));
    v5 = (int)cbrt((double)((unint64_t)objc_msgSend(v4, "length") >> 2));
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v3 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIColorCubeWithColorSpace"), CFSTR("inputCubeData"), v4, CFSTR("inputColorSpace"), DeviceRGB, CFSTR("inputCubeDimension"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5), 0);
    CGColorSpaceRelease(DeviceRGB);
    objc_msgSend((id)-[CIPhotoEffect outputImage]::cubes, "setObject:forKey:", v3, v2);
  }
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), CFSTR("inputExtrapolate"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[CIFilter outputImage](v3, "outputImage");
  return -[CIFilter setValue:forKey:](v3, "setValue:forKey:", 0, CFSTR("inputImage"));
}

- (int)_maxVersion
{
  return 0;
}

@end
