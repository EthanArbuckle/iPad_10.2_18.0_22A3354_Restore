@implementation CIAffineTransform

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[3];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", MEMORY[0x1E0C9BAA8], "{CGAffineTransform=dddddd}");
  v7[0] = CFSTR("CIAttributeFilterCategories");
  v6[0] = CFSTR("CICategoryGeometryAdjustment");
  v6[1] = CFSTR("CICategoryVideo");
  v6[2] = CFSTR("CICategoryStillImage");
  v6[3] = CFSTR("CICategoryBuiltIn");
  v8[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v8[1] = CFSTR("5");
  v7[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v7[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v8[2] = CFSTR("10.4");
  v7[3] = CFSTR("inputTransform");
  v4[0] = CFSTR("CIAttributeDefault");
  v4[1] = CFSTR("CIAttributeIdentity");
  v5[0] = v2;
  v5[1] = v2;
  v4[2] = CFSTR("CIAttributeType");
  v5[2] = CFSTR("CIAttributeTypeTransform");
  v8[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
}

- (id)outputImage
{
  CIImage *inputImage;
  NSObject *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  if (self->inputImage)
  {
    if ((CGAffineTransformFromObject((objc_object *)self->inputTransform, &v7) & 1) != 0)
    {
      inputImage = self->inputImage;
      v6 = v7;
      return -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v6);
    }
    v5 = ci_logger_filter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CIAffineClamp outputImage].cold.1((uint64_t)self, v5);
  }
  return 0;
}

- (id)_outputProperties
{
  CGAffineTransform v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  if (!CGAffineTransformFromObject((objc_object *)self->inputTransform, &v3))
    return (id)MEMORY[0x1E0C9AA60];
  v4[0] = metadataPropertyWithDouble(v3.a);
  v4[1] = metadataPropertyWithDouble(v3.b);
  v4[2] = metadataPropertyWithDouble(v3.c);
  v4[3] = metadataPropertyWithDouble(v3.d);
  v4[4] = metadataPropertyWithDouble(v3.tx);
  v4[5] = metadataPropertyWithDouble(v3.ty);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
}

- (id)_initFromProperties:(id)a3
{
  _QWORD v6[6];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("AffineA"), (double *)&v12)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("AffineB"), (double *)&v11)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("AffineC"), (double *)&v10)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("AffineD"), (double *)&v9)
    && metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("AffineX"), (double *)&v8)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("AffineY"), (double *)&v7))
  {
    v6[0] = v12;
    v6[1] = v11;
    v6[2] = v10;
    v6[3] = v9;
    v6[4] = v8;
    v6[5] = v7;
    -[CIAffineTransform setInputTransform:](self, "setInputTransform:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v6, "{CGAffineTransform=dddddd}"));
  }
  else
  {

    return 0;
  }
  return self;
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
