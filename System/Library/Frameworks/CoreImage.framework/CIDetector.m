@implementation CIDetector

- (CIDetector)init
{
  CIDetector *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIDetector;
  v2 = -[CIDetector init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return 0;
    }
  }
  return v2;
}

+ (CIDetector)detectorOfType:(NSString *)type context:(CIContext *)context options:(NSDictionary *)options
{
  int v8;
  char v9;
  char v10;
  int v11;
  int v12;
  int v13;
  __objc2_class *v14;

  if (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("CIDetectorTypeFace")))
  {
    v8 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIDetectorAccuracy")), "isEqualToString:", CFSTR("CIDetectorAccuracyLow"));
    v9 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("ForceVision")), "BOOLValue");
    v10 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("ForceFaceCore")), "BOOLValue");
    v11 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIDetectorBetterEyeLocs")), "BOOLValue");
    v12 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIDetectorTracking")), "BOOLValue");
    v13 = dyld_program_sdk_at_least();
    if ((v9 & 1) == 0 && ((v10 & 1) != 0 || ((v8 & (v11 ^ 1) | v12) & 1) != 0 || v13 != 1))
      v14 = CIFaceCoreDetector;
    else
      v14 = CIVNFaceDetector;
    return (CIDetector *)(id)objc_msgSend([v14 alloc], "initWithContext:options:", context, options);
  }
  if (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("CIDetectorTypeRectangle")))
  {
    v14 = CIRectangleDetector;
    return (CIDetector *)(id)objc_msgSend([v14 alloc], "initWithContext:options:", context, options);
  }
  if (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("CIDetectorTypeQRCode")))
  {
    v14 = CIBarcodeDetector;
    return (CIDetector *)(id)objc_msgSend([v14 alloc], "initWithContext:options:", context, options);
  }
  if (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("CIDetectorTypeText")))
  {
    v14 = CITextDetector;
    return (CIDetector *)(id)objc_msgSend([v14 alloc], "initWithContext:options:", context, options);
  }
  NSLog(CFSTR("[CIDetector detectorOfType:context:options:] failed because type %@ is unknown.\n"), type);
  return 0;
}

- (NSArray)featuresInImage:(CIImage *)image
{
  return -[CIDetector featuresInImage:options:](self, "featuresInImage:options:", image, 0);
}

- (NSArray)featuresInImage:(CIImage *)image options:(NSDictionary *)options
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array", image, options);
}

@end
