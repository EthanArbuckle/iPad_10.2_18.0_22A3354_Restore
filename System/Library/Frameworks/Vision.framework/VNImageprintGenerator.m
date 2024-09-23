@implementation VNImageprintGenerator

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  __CVBuffer *v21;
  _QWORD v23[5];

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_15;
  v15 = objc_msgSend(v13, "width");
  v16 = (v15 & 0xFFFFFFFFFFFFFFFELL) != 0 ? v15 & 0xFFFFFFFFFFFFFFFELL : 2;
  v17 = objc_msgSend(v14, "height");
  v18 = (v17 & 0xFFFFFFFFFFFFFFFELL) != 0 ? v17 & 0xFFFFFFFFFFFFFFFELL : 2;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __119__VNImageprintGenerator_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
  v23[3] = &unk_1E4548D28;
  v23[4] = self;
  if (+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", v16, v18, v23, a8))
  {
    if (v16 <= v18)
      v19 = v18;
    else
      v19 = v16;
    if (v19 >= 0x191)
    {
      if (v16 <= v18)
      {
        v18 = vcvtms_u32_f32((float)((float)v16 * 400.0) / (float)v18);
        v16 = 400;
      }
      else
      {
        v16 = vcvtms_u32_f32((float)((float)v18 * 400.0) / (float)v16);
        v18 = 400;
      }
    }
    v21 = (__CVBuffer *)objc_msgSend(v14, "bufferWithWidth:height:format:options:error:", v18, v16, 32, v12, a8);
    *a7 = v21;
    v20 = v21 != 0;
  }
  else
  {
LABEL_15:
    v20 = 0;
  }

  return v20;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v11;
  void *v12;
  VNImageprintObservation *v13;
  VNMPImageData *v14;
  void *v15;
  void *v16;
  VNMPImageData *v17;
  VNMPContext *v18;
  VNMPImageDescriptor *v19;
  double v20;
  VNMPImageDescriptor *v21;
  VNImageprint *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v25 = 0;
  if (+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v25, CFSTR("VNImageprintGeneratorProcessOption_Timestamp"), v11, a8))
  {
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v11, a8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNImageprintObservation alloc], "initWithOriginatingRequestSpecifier:", v12);
      v14 = [VNMPImageData alloc];
      -[VNObservation uuid](v13, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[VNMPImageData initWithCVPixelBufferImage:externalImageId:andExifTimestampValue:error:](v14, "initWithCVPixelBufferImage:externalImageId:andExifTimestampValue:error:", a4, v16, v25, a8);

      if (v17)
      {
        v18 = objc_alloc_init(VNMPContext);
        v19 = [VNMPImageDescriptor alloc];
        LODWORD(v20) = 0;
        v21 = -[VNMPImageDescriptor initWithImageData:andCustomQualityScore:context:error:](v19, "initWithImageData:andCustomQualityScore:context:error:", v17, v18, a8, v20);
        if (v21)
        {
          v22 = -[VNImageprint initWithImageDescriptor:type:originatingRequestSpecifier:]([VNImageprint alloc], "initWithImageDescriptor:type:originatingRequestSpecifier:", v21, 0, v12);
          -[VNImageprintObservation setImageprint:](v13, "setImageprint:", v22);
          v26[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

NSString *__119__VNImageprintGenerator_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
