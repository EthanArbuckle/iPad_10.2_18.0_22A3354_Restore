@implementation VNTorsoprintGeneratorFaceBased

- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGSize v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  objc_super v48;
  CGRect v49;
  _QWORD v50[2];
  CGRect v51;
  CGRect v52;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v50[1] = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a6;
  v19 = a8;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v17, a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_8;
    objc_msgSend(v20, "orientation");
    if ((VNSetFaceOrientationInOptionsDictionary(v21, v17, a7) & 1) == 0)
      goto LABEL_8;
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = a3;
    v23 = objc_msgSend(v22, "integerValue");

    v24 = objc_msgSend(v20, "width");
    v25 = objc_msgSend(v20, "height");
    objc_msgSend(v21, "unalignedBoundingBox");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend((id)objc_opt_class(), "magnifiedBBoxScaleFactor");
    v35 = (float)(v34 + -1.0);
    v36 = -(v31 * v35) * 0.5;
    v37 = -(v33 * v35) * 0.5;
    v51.origin.x = v27;
    v51.origin.y = v29;
    v51.size.width = v31;
    v51.size.height = v33;
    v52 = CGRectInset(v51, v36, v37);
    v38 = *(CGSize *)(MEMORY[0x1E0C9D5E0] + 16);
    v49.origin = (CGPoint)*MEMORY[0x1E0C9D5E0];
    v49.size = v38;
    if (-[VNTorsoprintGeneratorFaceBased _calculateTorsoBBoxFromFaceBBox:insideImageWithSize:faceOrientationRelativeToUpright:torsoBBox:error:](self, "_calculateTorsoBBoxFromFaceBBox:insideImageWithSize:faceOrientationRelativeToUpright:torsoBBox:error:", v23, &v49, a7, v52.origin.x, v52.origin.y, v52.size.width, v52.size.height, (double)v24, (double)v25))
    {
      if (CGRectIsNull(v49))
      {
        VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        if (v39)
        {
          v50[0] = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v41 = 0;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49.origin.x);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v43, CFSTR("VNDetectorInternalProcessOption_TorsoBBox_X"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49.origin.y);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v44, CFSTR("VNDetectorInternalProcessOption_TorsoBBox_Y"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49.size.width);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v45, CFSTR("VNDetectorInternalProcessOption_TorsoBBox_Width"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49.size.height);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v46, CFSTR("VNDetectorInternalProcessOption_TorsoBBox_Height"));

        v48.receiver = self;
        v48.super_class = (Class)VNTorsoprintGeneratorFaceBased;
        -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v48, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v47, v17, v18, a7, v19, x, y, width, height);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
LABEL_8:
      v41 = 0;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  __CVBuffer *v32;
  BOOL v33;

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend((id)objc_opt_class(), "torsoprintInputImageSizeForFaceOrientation:", v15);
    v17 = v16;
    v19 = v18;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNDetectorInternalProcessOption_TorsoBBox_X"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNDetectorInternalProcessOption_TorsoBBox_Y"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNDetectorInternalProcessOption_TorsoBBox_Width"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNDetectorInternalProcessOption_TorsoBBox_Height"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
    v32 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v17, (unint64_t)v19, 1111970369, v12, a8, v22, v25, v28, v31);
    *a7 = v32;
    v33 = v32 != 0;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    VNCloneFaceObservationFromOptions((uint64_t)v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[VNTorsoprintGeneratorFaceBased torsoprintForImageBuffer:requestRevision:error:](self, "torsoprintForImageBuffer:requestRevision:error:", a4, objc_msgSend(v13, "requestRevision"), a8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "setTorsoprint:", v15);
        v18[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_calculateTorsoBBoxFromFaceBBox:(CGRect)a3 insideImageWithSize:(CGSize)a4 faceOrientationRelativeToUpright:(int)a5 torsoBBox:(CGRect *)a6 error:(id *)a7
{
  CGFloat *v8;
  CGFloat height;
  double width;
  float v12;
  const __CFString *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  double v18;
  float v19;
  float v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  float v27;
  CGFloat *p_x;
  float v29;
  CGSize v30;
  BOOL result;
  id v32;
  CGFloat x;
  CGFloat y;
  double v35;
  double v36;
  CGRect v37;

  if (a6)
  {
    v8 = (CGFloat *)MEMORY[0x1E0C9D628];
    x = *MEMORY[0x1E0C9D628];
    height = a4.height;
    width = a4.width;
    switch(a5)
    {
      case 1:
        v12 = (a3.origin.x + a3.size.width * -0.5) * a4.width;
        a3.origin.x = roundf(v12);
        a3.origin.y = a3.origin.y + a3.size.height * -3.0;
        goto LABEL_9;
      case 3:
        v15 = (a3.origin.x + a3.size.width * -0.5) * a4.width;
        a3.origin.x = roundf(v15);
LABEL_9:
        v16 = a3.origin.y * a4.height;
        v17 = roundf(v16);
        a3.size.width = (a3.size.width + a3.size.width) * a4.width;
        *(float *)&a3.size.width = a3.size.width;
        *(float *)&a3.size.width = roundf(*(float *)&a3.size.width);
        a4.width = 4.0;
        v18 = a3.size.height * 4.0;
        goto LABEL_12;
      case 6:
        goto LABEL_11;
      case 8:
        a3.origin.x = a3.origin.x + a3.size.width * -3.0;
LABEL_11:
        v19 = a3.origin.x * a4.width;
        a3.origin.x = roundf(v19);
        v20 = (a3.origin.y + a3.size.height * -0.5) * a4.height;
        v17 = roundf(v20);
        a4.width = 4.0;
        a3.size.width = a3.size.width * 4.0 * width;
        *(float *)&a3.size.width = a3.size.width;
        *(float *)&a3.size.width = roundf(*(float *)&a3.size.width);
        v18 = a3.size.height + a3.size.height;
LABEL_12:
        a3.size.height = v18 * a4.height;
        *(float *)&a3.size.height = a3.size.height;
        *(float *)&a3.size.height = roundf(*(float *)&a3.size.height);
        v21 = *(float *)&a3.size.height;
        v22 = *(float *)&a3.size.width;
        a3.origin.y = v17;
        x = a3.origin.x;
        y = a3.origin.y;
        v35 = *(float *)&a3.size.width;
        v36 = *(float *)&a3.size.height;
        if (*(float *)&a3.size.width != 0.0 && *(float *)&a3.size.height != 0.0)
        {
          v23 = 0;
          v24 = 0;
          v25 = *(float *)&a3.size.width;
          v26 = *(float *)&a3.size.height;
          v37 = CGRectIntersection(a3, *(CGRect *)(&width - 2));
          v27 = v37.size.width * v37.size.height / (v22 * v21);
          objc_msgSend((id)objc_opt_class(), "minimumTorsoInsideInputImageThreshold", *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&v35, *(_QWORD *)&v36);
          p_x = &x;
          if (v29 > v27)
            p_x = v8;
          v30 = (CGSize)*((_OWORD *)p_x + 1);
          a6->origin = *(CGPoint *)p_x;
          a6->size = v30;
          return 1;
        }
        if (!a7)
          return 0;
        v13 = CFSTR("Error in calculating torso bounding box dimensions");
        break;
      default:
        if (a7)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, a4.width, a4.height, *(_QWORD *)&x);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v14, CFSTR("faceOrientationRelativeToUpright"));
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
        return 0;
    }
    goto LABEL_19;
  }
  if (a7)
  {
    v13 = CFSTR("Memory for torso bouding box is not allocated");
LABEL_19:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&v35, *(_QWORD *)&v36);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a7 = v32;
    return result;
  }
  return 0;
}

+ (CGSize)torsoprintInputImageSizeForFaceOrientation:(int)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 128.0;
  if (a3 <= 4)
    v4 = 128.0;
  else
    v4 = 256.0;
  if (a3 <= 4)
    v3 = 256.0;
  result.height = v3;
  result.width = v4;
  return result;
}

+ (CGSize)torsoprintDescriptorSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 128.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (float)minimumTorsoInsideInputImageThreshold
{
  return 0.5;
}

+ (float)magnifiedBBoxScaleFactor
{
  return 1.7647;
}

@end
