@implementation VNOpticalFlowGeneratorRevision1

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUAndGPUComputeDevices](VNComputeDeviceUtilities, "allCPUAndGPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v28;
  id obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _BYTE v36[128];
  uint64_t v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __129__VNOpticalFlowGeneratorRevision1_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
  v35[3] = &unk_1E4548D28;
  v35[4] = self;
  if (+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", (unint64_t)width & 0xFFFFFFFFFFFFFFFELL, (unint64_t)height & 0xFFFFFFFFFFFFFFFELL, v35, a8))
  {
    -[VNOpticalFlowGenerator validatedImageBuffersFromOptions:error:](self, "validatedImageBuffersFromOptions:error:", v15, a8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v28;
      v16 = 0;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v32;
        while (2)
        {
          v19 = 0;
          v20 = v16;
          do
          {
            if (*(_QWORD *)v32 != v18)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v19);
            if (v20)
            {
              v22 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v19), "width");
              if (v22 != objc_msgSend(v20, "width")
                || (v23 = objc_msgSend(v21, "height"), v23 != objc_msgSend(v20, "height")))
              {
                if (a8)
                {
                  +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("Optical flow cannot be performed on images with different dimensions"));
                  v26 = 0;
                  *a8 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v26 = 0;
                }
                goto LABEL_21;
              }
            }
            v16 = v21;

            v24 = (void *)objc_msgSend(v16, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width & 0xFFFFFFFFFFFFFFFELL, (unint64_t)height & 0xFFFFFFFFFFFFFFFELL, 1111970369, v15, a8, x, y, width, height);
            if (!v24)
            {
              v26 = 0;
              goto LABEL_20;
            }
            objc_msgSend(v30, "addObject:", v24);

            ++v19;
            v20 = v16;
          }
          while (v17 != v19);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v17)
            continue;
          break;
        }
      }

      objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, CFSTR("VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (unint64_t)width & 0xFFFFFFFFFFFFFFFELL);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("VNOpticalFlowGeneratorProcessOption_ROIWidth"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (unint64_t)height & 0xFFFFFFFFFFFFFFFELL);
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:");
      v26 = 1;
LABEL_20:
      v20 = v16;
LABEL_21:

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  void *v14;
  size_t v15;
  void *v16;
  size_t v17;
  id v18;
  void *v19;
  BOOL v20;
  __CVBuffer *v21;
  __CVBuffer *v22;
  float v23;
  float v24;
  float v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  __CVBuffer *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  void *v41;
  _BOOL4 v43;
  size_t Height;
  VNLKTOpticalFlowCPU *v45;
  uint64_t v46;
  VNLKTOpticalFlowGPU *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  VNOpticalFlowObservation *v53;
  size_t Width;
  void *v55;
  void *v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  void *v60;
  __CVBuffer *texture;
  __CVBuffer *v62;
  id v63;
  id v64;
  __CVBuffer *v65;
  __CVBuffer *v66;
  CVPixelBufferRef pixelBuffer;
  uint64_t v68;
  uint64_t v69;
  CVPixelBufferRef v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v63 = a7;
  v64 = a9;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VNOpticalFlowGeneratorProcessOption_ROIWidth"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VNOpticalFlowGeneratorProcessOption_ROIHeight"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v18 = v13;
  v19 = v18;
  if (!self)
  {

    goto LABEL_34;
  }
  v70 = 0;
  v20 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v70, objc_opt_class(), CFSTR("VNOpticalFlowGeneratorProcessOption_PreviousObservation"), v18, a8);
  v21 = v70;
  v22 = v21;
  if (!v20)
  {

    goto LABEL_34;
  }
  v69 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v69, CFSTR("VNOpticalFlowGeneratorProcessOption_OutputPixelFormat"), v19, a8))
  {
LABEL_15:

    goto LABEL_34;
  }
  if (v69 != 843264102 && v69 != 843264104)
  {
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v29, CFSTR("outputPixelFormat"));
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  v68 = 0;
  if (+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v68, CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"), v19, a8))
  {
    v23 = ceilf(logf(8.0 / (float)v17) / -0.69315);
    v24 = ceilf(logf(8.0 / (float)v15) / -0.69315);
    if (v23 >= v24)
      v25 = v24;
    else
      v25 = v23;
    v26 = 0;
    v27 = 2;
    v28 = 3;
    switch(v68)
    {
      case 0:
        break;
      case 1:
        v26 = 0;
        goto LABEL_17;
      case 2:
        v26 = 1;
LABEL_17:
        v28 = 5;
        break;
      case 3:
        v26 = 1;
        v28 = 7;
        v27 = 1;
        break;
      default:
        if (a8)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v41, CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"));
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_33;
    }
    v58 = v26;
    v59 = v28;
    v57 = v27;
    v30 = v22;
    v31 = v69;
    v62 = v30;

    texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v15, v17, v31, a8);
    if (!texture)
    {
      v40 = 0;
LABEL_62:

      goto LABEL_35;
    }
    +[VNValidationUtilities requiredArrayForKey:inOptions:withElementsOfClass:error:](VNValidationUtilities, "requiredArrayForKey:inOptions:withElementsOfClass:error:", CFSTR("VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers"), v19, 0, a8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v32;
    if (!v32)
    {
      v40 = 0;
LABEL_61:

      CVPixelBufferRelease(texture);
      goto LABEL_62;
    }
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_msgSend(v32, "count") == 2, CFSTR("Unexpected number of buffers for optical flow processing"));
    objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v19, a8);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56)
    {
      v40 = 0;
LABEL_60:

      goto LABEL_61;
    }
    -[VNDetector computeDeviceForComputeStage:processingOptions:error:](self, "computeDeviceForComputeStage:processingOptions:error:", CFSTR("VNComputeStageMain"), v19, a8);
    v35 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v35;
    if (!v35)
    {
      v40 = 0;
LABEL_59:

      goto LABEL_60;
    }
    v36 = +[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", v35);
    pixelBuffer = texture;
    CVPixelBufferRetain(texture);
    v66 = (__CVBuffer *)v33;
    if (v33)
      CVPixelBufferRetain((CVPixelBufferRef)v33);
    v65 = (__CVBuffer *)v34;
    if (v34)
      CVPixelBufferRetain((CVPixelBufferRef)v34);
    -[__CVBuffer opticalFlow](v62, "opticalFlow");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37 && (unint64_t)v25 == (int)objc_msgSend(v37, "levelCount"))
    {
      v39 = 1;
    }
    else
    {
      -[__CVBuffer setOpticalFlow:](v62, "setOpticalFlow:", 0);
      v70 = pixelBuffer;
      CVPixelBufferRetain(pixelBuffer);
      v43 = v36;
      Width = CVPixelBufferGetWidth(v70);
      Height = CVPixelBufferGetHeight(v70);
      if (v43)
      {
        v45 = -[VNLKTOpticalFlowCPU initWithWidth:height:numScales:]([VNLKTOpticalFlowCPU alloc], "initWithWidth:height:numScales:", Width, Height, (unint64_t)v25);
        v46 = (uint64_t)v45;
        if (a8 && !v45)
        {
          +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
          v46 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v47 = [VNLKTOpticalFlowGPU alloc];
        -[VNDetector metalContext](self, "metalContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[VNLKTOpticalFlowGPU initWithMetalContext:width:height:numScales:error:](v47, "initWithMetalContext:width:height:numScales:error:", v48, Width, Height, (unint64_t)v25, a8);

      }
      apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v70);
      if (!v46)
      {
        v38 = 0;
        goto LABEL_54;
      }
      v39 = 0;
      v38 = (id)v46;
    }
    objc_msgSend(v38, "setOutputPixelFormat:", v31);
    objc_msgSend(v38, "setNumWarpings:", v59);
    objc_msgSend(v38, "setUseNonLocalRegularization:", v58);
    objc_msgSend(v38, "setNlreg_radius:", 4);
    objc_msgSend(v38, "setNlreg_padding:", v57);
    LODWORD(v49) = 6.0;
    objc_msgSend(v38, "setNlreg_sigma_l:", v49);
    LODWORD(v50) = 2.0;
    objc_msgSend(v38, "setNlreg_sigma_c:", v50);
    LODWORD(v51) = 1045220557;
    objc_msgSend(v38, "setNlreg_sigma_w:", v51);
    if (objc_msgSend(v38, "setOutputUV:error:", pixelBuffer, a8))
    {
      if (v39)
      {
        if ((objc_msgSend(v38, "estimateFlowStream:error:", v65, a8) & 1) == 0)
          goto LABEL_54;
LABEL_53:
        objc_msgSend(v38, "waitUntilCompleted");
        v38 = v38;
        v52 = v38;
LABEL_55:

        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v65);
        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v66);
        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&pixelBuffer);
        if (v52)
        {
          v53 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:]([VNOpticalFlowObservation alloc], "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v56, 0, texture);
          -[VNOpticalFlowObservation setOpticalFlow:](v53, "setOpticalFlow:", v52);
          v71[0] = v53;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v40 = 0;
        }

        goto LABEL_59;
      }
      if (objc_msgSend(v38, "estimateFlowFromReference:target:error:", v66, v65, a8))
        goto LABEL_53;
    }
LABEL_54:
    v52 = 0;
    goto LABEL_55;
  }
LABEL_33:

LABEL_34:
  v40 = 0;
LABEL_35:

  return v40;
}

NSString *__129__VNOpticalFlowGeneratorRevision1_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
