@implementation BWInferenceScalingRequirement

- (NSArray)orderedVideoRequirements
{
  return self->_orderedVideoRequirements;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceScalingRequirement;
  -[BWInferenceScalingRequirement dealloc](&v3, sel_dealloc);
}

- (BWInferenceScalingRequirement)initWithInputVideoRequirement:(id)a3 requestedOutputVideoRequirements:(id)a4 intermediatePixelBufferCompressionType:(int)a5
{
  BWInferenceScalingRequirement *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWInferenceScalingRequirement;
  v8 = -[BWInferenceScalingRequirement init](&v12, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(a4, "firstObject");
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3);
    -[BWInferenceScalingRequirement _appendIntermediateRequirementsToList:forSatisfyingOutputRequirement:intermediatePixelBufferCompressionType:]((uint64_t)v8, v10, v9, a5);
    objc_msgSend(v10, "addObjectsFromArray:", a4);
    v8->_orderedVideoRequirements = (NSArray *)objc_msgSend(v10, "copy");
  }
  return v8;
}

- (void)_appendIntermediateRequirementsToList:(void *)a3 forSatisfyingOutputRequirement:(unsigned int)a4 intermediatePixelBufferCompressionType:
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  float v20;
  float v21;
  _BOOL4 v22;
  float v23;
  _BOOL4 v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const __CFAllocator *v32;
  OSType v33;
  const __CFDictionary *v34;
  const __CFDictionary *v35;
  const __CFAllocator *v36;
  OSType v37;
  const __CFDictionary *v38;
  const __CFDictionary *v39;
  int v40;
  _BOOL4 v41;
  void *v42;
  unint64_t v43;
  char v44;
  BWInferenceVideoFormatRequirements *v45;
  signed int LossyCompressionLevel;
  unint64_t v47;
  BWInferenceVideoFormatRequirements **v48;
  unint64_t v49;
  unsigned int v50;
  unsigned int v51;
  BWInferenceVideoFormatRequirements *v52;
  unint64_t v53;
  char v54;
  signed int v55;
  uint64_t *v56;
  signed int v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  BWInferenceVideoRequirement *v62;
  int v63;
  int v64;
  int v68;
  BWInferenceVideoFormatRequirements *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BWInferenceVideoFormatRequirements *v73;
  uint64_t v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "lastObject"), "videoFormat");
    v6 = (void *)objc_msgSend(a3, "videoFormat");
    v7 = objc_msgSend(v6, "width");
    v8 = objc_msgSend(v6, "height");
    if (objc_msgSend(v6, "deviceOriented"))
    {
      v9 = objc_msgSend(v5, "deviceOriented");
      v68 = v9 ^ 1;
      if ((v9 & 1) == 0 && v7 != v8)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Requesting deviceOriented video for a non-square output size is invalid"), 0));
    }
    else
    {
      v68 = 0;
    }
    v10 = objc_msgSend(v6, "rotationDegrees");
    v11 = (int)(v10 - objc_msgSend(v5, "rotationDegrees") + 360) % 360;
    if (v11 == 180 || v11 == 0)
    {
      v15 = objc_msgSend(v6, "width");
      v63 = v15;
      v64 = objc_msgSend(v6, "height");
      v16 = v64;
    }
    else
    {
      v13 = objc_msgSend(v6, "width");
      v14 = objc_msgSend(v6, "height");
      v15 = objc_msgSend(v6, "height");
      v16 = objc_msgSend(v6, "width");
      v63 = v13;
      v64 = v14;
    }
    if (!objc_msgSend(v6, "cropDescriptor")
      || (v17 = objc_msgSend((id)objc_msgSend(v6, "cropDescriptor"), "maxCropForDimensions:", objc_msgSend(v5, "width") | ((unint64_t)objc_msgSend(v5, "height") << 32)), !(_DWORD)v17)|| (v18 = HIDWORD(v17), !HIDWORD(v17)))
    {
      v19 = objc_msgSend(v5, "extendedWidth");
      LODWORD(v18) = objc_msgSend(v5, "extendedHeight");
      LODWORD(v17) = v19;
    }
    v20 = (float)v15 / (float)(int)v17;
    v21 = (float)v16;
    v22 = v20 >= 0.25;
    v23 = v21 / (float)(int)v18;
    v24 = v23 >= 0.25;
    if (v68)
    {
      v22 = v20 >= 0.25 && (float)(v21 / (float)(unint64_t)objc_msgSend(v5, "width")) >= 0.25;
      v24 = v23 >= 0.25 && (float)((float)v15 / (float)(unint64_t)objc_msgSend(v5, "height")) >= 0.25;
    }
    v25 = objc_msgSend(v6, "videoContentMode");
    v26 = v22 || v24;
    if (v25 != 1)
      v26 = 0;
    v27 = v26 | v22;
    v28 = v26 | v24;
    v29 = objc_msgSend(v5, "pixelFormat");
    v30 = objc_msgSend(v6, "pixelFormat");
    if ((_DWORD)v29 == (_DWORD)v30)
      goto LABEL_36;
    v31 = 0;
    if ((_DWORD)v29 != 1380411457 && (_DWORD)v29 != 1815162994)
    {
      v32 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v33 = FigCaptureUncompressedPixelFormatForPixelFormat(v29);
      v34 = CVPixelFormatDescriptionCreateWithPixelFormatType(v32, v33);
      if (v34)
      {
        v35 = v34;
        v31 = CFDictionaryGetValue(v34, (const void *)*MEMORY[0x1E0CA91B0]) != 0;
        CFRelease(v35);
      }
      else
      {
        v31 = 0;
      }
    }
    if ((_DWORD)v30 == 1380411457
      || (_DWORD)v30 == 1815162994
      || (v36 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
          v37 = FigCaptureUncompressedPixelFormatForPixelFormat(v30),
          (v38 = CVPixelFormatDescriptionCreateWithPixelFormatType(v36, v37)) == 0))
    {
      if ((v31 & 1) == 0)
        goto LABEL_36;
    }
    else
    {
      v39 = v38;
      v40 = CFDictionaryGetValue(v38, (const void *)*MEMORY[0x1E0CA91B0]) != 0;
      CFRelease(v39);
      if (v31 == v40)
      {
LABEL_36:
        v41 = 0;
        goto LABEL_37;
      }
    }
    v43 = objc_msgSend(v5, "width");
    if (v43 > objc_msgSend(v6, "width"))
    {
      v44 = v27 & v28;
      v42 = a2;
      if ((v44 & 1) != 0)
      {
LABEL_43:
        v45 = -[BWInferenceVideoFormatRequirements initWithFormat:]([BWInferenceVideoFormatRequirements alloc], "initWithFormat:", v6);
        LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel(v29);
        v75[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", FigCaptureCompressedPixelFormatForPixelFormat(v29, a4, LossyCompressionLevel));
        v47 = 0x1E0C99000uLL;
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v45, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1));
        v74 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
        -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v45, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1));
        -[BWInferenceVideoFormatRequirements setHistogramRequest:](v45, "setHistogramRequest:", objc_msgSend(v6, "histogramRequest"));
        v73 = v45;
        v48 = &v73;
LABEL_67:
        v62 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", objc_msgSend(a3, "attachedMediaKey"), +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(*(id *)(v47 + 3360), "arrayWithObjects:count:", v48, 1)), objc_msgSend(a3, "count"));
        if (v62)
        {
          objc_msgSend(v42, "addObject:", v62);
          -[BWInferenceScalingRequirement _appendIntermediateRequirementsToList:forSatisfyingOutputRequirement:intermediatePixelBufferCompressionType:](a1, v42, a3, a4);
        }
        return;
      }
      v41 = 1;
LABEL_46:
      v50 = vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v5, "extendedWidth") * 0.25 * 0.5);
      v51 = vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v5, "extendedHeight") * 0.25 * 0.5);
      v52 = -[BWInferenceVideoFormatRequirements initWithFormat:]([BWInferenceVideoFormatRequirements alloc], "initWithFormat:", v6);
      v53 = (unint64_t)FigCapturePixelFormatBytesPerPixel(v29);
      if (v53)
      {
        v54 = FigCapturePixelFormatBytesPerPixel(v30) > (float)v53 || v41;
        if ((v54 & 1) != 0)
          goto LABEL_51;
      }
      else if (v41)
      {
LABEL_51:
        v55 = FigCapturePixelFormatGetLossyCompressionLevel(v29);
        v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", FigCaptureCompressedPixelFormatForPixelFormat(v29, a4, v55));
        v56 = &v72;
        v47 = 0x1E0C99000;
        goto LABEL_55;
      }
      v47 = 0x1E0C99000uLL;
      if (!a4)
      {
LABEL_56:
        v58 = 2 * v50;
        v59 = 2 * v51;
        if (v68)
        {
          if (v58 <= v59)
            v58 = 2 * v51;
          v60 = v58;
          -[BWVideoFormatRequirements setWidth:](v52, "setWidth:", v58);
        }
        else
        {
          if (v63 > v58)
            v58 = v63;
          -[BWVideoFormatRequirements setWidth:](v52, "setWidth:", v58);
          if (v64 <= v59)
            v61 = 2 * v51;
          else
            v61 = v64;
          v60 = v61;
        }
        -[BWVideoFormatRequirements setHeight:](v52, "setHeight:", v60);
        v70 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
        -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v52, "setSupportedColorSpaceProperties:", objc_msgSend(*(id *)(v47 + 3360), "arrayWithObjects:count:", &v70, 1));
        -[BWInferenceVideoFormatRequirements setCropDescriptor:](v52, "setCropDescriptor:", 0);
        -[BWInferenceVideoFormatRequirements setHistogramRequest:](v52, "setHistogramRequest:", objc_msgSend(v6, "histogramRequest"));
        -[BWInferenceVideoFormatRequirements setRotationDegrees:](v52, "setRotationDegrees:", objc_msgSend(v5, "rotationDegrees"));
        v69 = v52;
        v48 = &v69;
        v42 = a2;
        goto LABEL_67;
      }
      v57 = FigCapturePixelFormatGetLossyCompressionLevel(v30);
      v71 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", FigCaptureCompressedPixelFormatForPixelFormat(v30, a4, v57));
      v56 = &v71;
LABEL_55:
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v52, "setSupportedPixelFormats:", objc_msgSend(*(id *)(v47 + 3360), "arrayWithObjects:count:", v56, 1));
      goto LABEL_56;
    }
    v49 = objc_msgSend(v5, "height");
    v41 = v49 > objc_msgSend(v6, "height");
LABEL_37:
    if ((v27 & v28 & 1) != 0)
    {
      v42 = a2;
      if (!v41)
        return;
      goto LABEL_43;
    }
    goto LABEL_46;
  }
}

@end
