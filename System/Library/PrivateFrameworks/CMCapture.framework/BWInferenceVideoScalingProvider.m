@implementation BWInferenceVideoScalingProvider

- (BWInferenceSubmittable)submittable
{
  return 0;
}

- (id)newStorage
{
  BWInferenceProviderStorage *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = [BWInferenceProviderStorage alloc];
  v5[0] = self->_inputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1), self->_outputRequirements);
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  id v6;

  if (self->_applyUprightExifOrientation
    && !CMGetAttachment(a3, CFSTR("UprightExifOrientation"), 0)
    && !objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]))
  {
    return CFSTR("MissingOrientationInformation");
  }
  if (self->_applyCustomCrop)
  {
    v6 = -[NSArray firstObject](self->_outputRequirements, "firstObject", a3, a4);
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "videoFormat"), "cropDescriptor"), "applicableToSampleBuffer:forMediaKey:", a3, objc_msgSend(v6, "attachedMediaKey")))return CFSTR("CropNotApplicable");
  }
  return 0;
}

- (int)type
{
  return 0;
}

- (NSArray)inputVideoRequirements
{
  BWInferenceVideoRequirement *derivedFromRequirement;
  void *v4;
  BWInferenceVideoRequirement **p_inputRequirement;
  uint64_t v6;
  BWInferenceVideoRequirement *v8;
  BWInferenceVideoRequirement *inputRequirement;
  BWInferenceVideoRequirement *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat"), "cropDescriptor")&& (derivedFromRequirement = self->_derivedFromRequirement) != 0)
  {
    inputRequirement = self->_inputRequirement;
    v10 = derivedFromRequirement;
    v4 = (void *)MEMORY[0x1E0C99D20];
    p_inputRequirement = &inputRequirement;
    v6 = 2;
  }
  else
  {
    v8 = self->_inputRequirement;
    v4 = (void *)MEMORY[0x1E0C99D20];
    p_inputRequirement = &v8;
    v6 = 1;
  }
  return (NSArray *)objc_msgSend(v4, "arrayWithObjects:count:", p_inputRequirement, v6, v8, inputRequirement, v10);
}

- (BWInferenceVideoScalingProvider)initWithInputRequirement:(id)a3 derivedFromRequirement:(id)a4 outputRequirements:(id)a5 enableFencing:(BOOL)a6
{
  BWInferenceVideoScalingProvider *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWInferenceVideoScalingProvider;
  v10 = -[BWInferenceVideoScalingProvider init](&v12, sel_init);
  if (v10)
  {
    v10->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v10->_outputRequirements = (NSArray *)a5;
    v10->_derivedFromRequirement = (BWInferenceVideoRequirement *)a4;
    v10->_enableFencing = a6;
    v10->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v10;
}

- (int)prepareForExecution
{
  _DWORD *v3;
  BWInferenceVideoFormat *v4;
  void *v5;
  int v6;
  int v7;
  _BOOL4 v8;
  BOOL v9;
  BOOL v10;
  int v11;
  float v12;

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v4 = -[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat");
  v5 = (void *)objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
  v6 = -[BWInferenceVideoFormat rotationDegrees](v4, "rotationDegrees");
  v7 = objc_msgSend(v5, "rotationDegrees");
  self->_offsetRotationDegrees = v6 - v7;
  if ((float)((float)((float)(v6 - v7) / 90.0) - (float)(int)(float)((float)(v6 - v7) / 90.0)) != 0.0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Rotations must be a multiple of 90"), 0));
  if (objc_msgSend(v5, "deviceOriented"))
    v8 = !-[BWInferenceVideoFormat deviceOriented](v4, "deviceOriented");
  else
    LOBYTE(v8) = 0;
  self->_applyUprightExifOrientation = v8;
  v9 = objc_msgSend(v5, "videoContentMode") == 1
    && -[BWInferenceVideoFormat videoContentMode](v4, "videoContentMode") != 1;
  self->_computeAndApplyAspectRatioCrop = v9;
  v10 = (objc_msgSend(v5, "includesInvalidContent") & 1) == 0
     && -[BWInferenceVideoFormat includesInvalidContent](v4, "includesInvalidContent");
  self->_applyValidBufferRect = v10;
  v11 = objc_msgSend((id)objc_msgSend(v5, "cropDescriptor"), "identifier");
  self->_applyCustomCrop = v11 != -[BWInferenceCropDescriptor identifier](-[BWInferenceVideoFormat cropDescriptor](v4, "cropDescriptor"), "identifier");
  v12 = (float)(unint64_t)objc_msgSend(v5, "width");
  self->_outputAspectRatio = v12 / (float)(unint64_t)objc_msgSend(v5, "height");
  self->_colorSpaceProperties = (NSDictionary *)+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", objc_msgSend(v5, "colorSpaceProperties"));
  self->_scalerController = (FigM2MController *)objc_alloc_init(MEMORY[0x1E0D08B00]);
  -[BWInferenceVideoScalingProvider _configureCustomFiltersForScalingFromSourceWidth:sourceHeight:destinationWidth:destinationHeight:pixelFormat:]((uint64_t)self, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), objc_msgSend(v5, "width"), objc_msgSend(v5, "height"), -[BWInferenceVideoFormat pixelFormat](v4, "pixelFormat"));
  if (*v3 == 1)
    kdebug_trace();
  return 0;
}

- (uint64_t)_configureCustomFiltersForScalingFromSourceWidth:(unint64_t)a3 sourceHeight:(unint64_t)a4 destinationWidth:(unint64_t)a5 destinationHeight:(int)a6 pixelFormat:
{
  uint64_t v11;
  double v12;
  double v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  float v17;
  float v18;

  if (!result)
    return result;
  v11 = result;
  if (FigCapturePixelFormatIs420(a6))
  {
    result = FigCapturePixelFormatIs420(a6);
LABEL_5:
    a4 &= ~1uLL;
    a2 &= ~1uLL;
    goto LABEL_6;
  }
  v14 = FigCapturePixelFormatIs422(a6);
  result = FigCapturePixelFormatIs420(a6);
  if (v14)
    goto LABEL_5;
LABEL_6:
  if ((_DWORD)result)
    v15 = a3 & 0xFFFFFFFFFFFFFFFELL;
  else
    v15 = a3;
  if ((_DWORD)result)
    v16 = a5 & 0xFFFFFFFFFFFFFFFELL;
  else
    v16 = a5;
  v17 = (float)v16 / (float)v15;
  v18 = (float)a4 / (float)a2;
  if (v17 != *(float *)(v11 + 68) || v18 != *(float *)(v11 + 64))
  {
    LODWORD(v12) = 1.0;
    LODWORD(v13) = 1.0;
    result = objc_msgSend(*(id *)(v11 + 56), "setCustomFilter:alignment:sourceWidth:sourceHeight:destinationWidth:destinationHeight:luma_param:chroma_param:", 3, 2, a2, v12, v13);
    *(float *)(v11 + 64) = v18;
    *(float *)(v11 + 68) = v17;
  }
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoScalingProvider;
  -[BWInferenceVideoScalingProvider dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoScalingProvider;
  return -[NSString stringByAppendingFormat:](-[BWInferenceVideoScalingProvider description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" applyUprightExifOrientation:%d applyValidBufferRect:%d computeAndApplyAspectRatioCrop:%d rotation:%d"), self->_applyUprightExifOrientation, self->_applyValidBufferRect, self->_computeAndApplyAspectRatioCrop, self->_offsetRotationDegrees);
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputRequirements;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)executionTarget
{
  return 5;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  __CVBuffer *v10;
  void *v11;
  id v12;
  __CVBuffer *v13;
  double v14;
  double v15;
  _DWORD *v16;
  size_t Width;
  size_t Height;
  int offsetRotationDegrees;
  _BOOL4 computeAndApplyAspectRatioCrop;
  CGFloat y;
  CGFloat x;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BWInferenceVideoRequirement *derivedFromRequirement;
  BWInferenceVideoFormat *v32;
  uint64_t v33;
  __CVBuffer *v34;
  int v35;
  size_t v36;
  size_t v37;
  void *v38;
  CGAffineTransform *v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGSize v51;
  int CGRectIfPresent;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  id v58;
  double v59;
  double v60;
  double v61;
  float v62;
  float outputAspectRatio;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double MaxX;
  double v70;
  double v71;
  double v72;
  double MaxY;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  id v78;
  void *v79;
  NSArray *outputRequirements;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  BWInferenceVideoFormat *v86;
  BWInferenceVideoFormat *v87;
  unsigned int v88;
  unint64_t v89;
  unint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  int applyUprightExifOrientation;
  double v97;
  _BOOL4 applyValidBufferRect;
  void *v99;
  id r1[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  CMSampleTimingInfo sampleTimingArray[21];
  CGRect rect2;
  CGAffineTransform cf;
  unsigned __int8 v107;
  _BYTE v108[128];
  uint64_t v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v109 = *MEMORY[0x1E0C80C00];
  v10 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputRequirement);
  v11 = (void *)objc_msgSend(a4, "inputSampleBufferAttachments");
  r1[0] = (id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D05CB0]);
  v12 = -[NSArray firstObject](self->_outputRequirements, "firstObject");
  v13 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v12), "newPixelBuffer");
  v14 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v12, "videoFormat"), "width");
  v15 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v12, "videoFormat"), "height");
  v16 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (v13)
  {
    CVBufferSetAttachments(v13, (CFDictionaryRef)self->_colorSpaceProperties, kCVAttachmentMode_ShouldPropagate);
    v95 = v14;
    if (*v16 == 1)
      kdebug_trace();
    v89 = (unint64_t)v15;
    v90 = (unint64_t)v14;
    r1[2] = -[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat");
    v99 = (void *)objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
    Width = CVPixelBufferGetWidth(v10);
    Height = CVPixelBufferGetHeight(v10);
    applyUprightExifOrientation = self->_applyUprightExifOrientation;
    offsetRotationDegrees = self->_offsetRotationDegrees;
    applyValidBufferRect = self->_applyValidBufferRect;
    computeAndApplyAspectRatioCrop = self->_computeAndApplyAspectRatioCrop;
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v91 = v23;
    v92 = v24;
    v93 = y;
    v94 = *MEMORY[0x1E0C9D628];
    if (self->_applyCustomCrop)
    {
      cf.a = 0.0;
      *(_OWORD *)&sampleTimingArray[0].decodeTimeStamp.timescale = 0u;
      *(_OWORD *)&sampleTimingArray[0].presentationTimeStamp.epoch = 0u;
      *(_OWORD *)&sampleTimingArray[0].presentationTimeStamp.value = 0u;
      *(_OWORD *)&sampleTimingArray[0].duration.value = *MEMORY[0x1E0CA2E18];
      sampleTimingArray[0].duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray[0].presentationTimeStamp, a3);
      sampleTimingArray[0].decodeTimeStamp = sampleTimingArray[0].duration;
      CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, sampleTimingArray, 0, 0, (CMSampleBufferRef *)&cf);
      CMSetAttachments(*(CMAttachmentBearerRef *)&cf.a, (CFDictionaryRef)objc_msgSend(a4, "inputSampleBufferAttachments"), 1u);
      v25 = (void *)objc_msgSend(v99, "cropDescriptor");
      objc_msgSend(v25, "rectForSampleBuffer:", *(_QWORD *)&cf.a);
      x = v26;
      y = v27;
      v24 = v28;
      v23 = v29;
      if (*(_QWORD *)&cf.a)
        CFRelease(*(CFTypeRef *)&cf.a);
    }
    *(double *)&r1[1] = (double)Width;
    v30 = (double)Height;
    v110.origin.x = x;
    v110.origin.y = y;
    v110.size.width = v24;
    v110.size.height = v23;
    if (!CGRectIsNull(v110))
    {
      derivedFromRequirement = self->_derivedFromRequirement;
      if (derivedFromRequirement)
      {
        v32 = -[BWInferenceVideoRequirement videoFormat](derivedFromRequirement, "videoFormat");
        v33 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_derivedFromRequirement);
        if (v33)
        {
          v34 = (__CVBuffer *)v33;
          if (v24 * *(double *)&r1[1] < (double)(unint64_t)objc_msgSend(v99, "width")
            && v23 * v30 < (double)(unint64_t)objc_msgSend(v99, "height"))
          {
            v87 = v32;
            v35 = -[BWInferenceVideoFormat rotationDegrees](v32, "rotationDegrees");
            if (v35 - objc_msgSend(v99, "rotationDegrees") == offsetRotationDegrees)
            {
              v36 = CVPixelBufferGetWidth(v34);
              v37 = CVPixelBufferGetHeight(v34);
              if (objc_msgSend(v99, "deviceOriented"))
                applyUprightExifOrientation = !-[BWInferenceVideoFormat deviceOriented](v87, "deviceOriented");
              else
                applyUprightExifOrientation = 0;
              computeAndApplyAspectRatioCrop = objc_msgSend(v99, "videoContentMode") == 1
                                            && -[BWInferenceVideoFormat videoContentMode](v87, "videoContentMode") != 1;
              if ((objc_msgSend(v99, "includesInvalidContent") & 1) != 0)
              {
                applyValidBufferRect = 0;
                v86 = v87;
              }
              else
              {
                v86 = v87;
                applyValidBufferRect = -[BWInferenceVideoFormat includesInvalidContent](v87, "includesInvalidContent");
              }
              *(double *)&r1[1] = (double)v36;
              v30 = (double)v37;
              r1[2] = v86;
              v10 = v34;
            }
          }
        }
      }
    }
    if (applyUprightExifOrientation
      && ((v38 = (void *)objc_msgSend((id)objc_msgSend(a4, "inputSampleBufferAttachments"), "objectForKeyedSubscript:", 0x1E495A618)) != 0|| (v38 = (void *)objc_msgSend(r1[0], "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50])) != 0))
    {
      v39 = (CGAffineTransform *)objc_msgSend(v38, "intValue");
      v107 = 0;
      v40 = FigCaptureRotationDegreesAndMirroringFromExifOrientation((int)v39, (char *)&v107);
      v41 = v40;
      v42 = v107;
      if (v107)
      {
        v43 = 0;
        v42 = 1;
        if (v40 != 90 && v40 != 270)
        {
          v42 = 0;
          v43 = 1;
        }
      }
      else
      {
        v43 = 0;
      }
      v88 = v42;
      v111.origin.x = x;
      v111.origin.y = y;
      v111.size.width = v24;
      v111.size.height = v23;
      if (!CGRectIsNull(v111))
      {
        memset(sampleTimingArray, 0, 48);
        FigCaptureExifOrientationGetAffineTransform(v39, 0x100000001, (uint64_t)sampleTimingArray);
        *(_OWORD *)&cf.a = *(_OWORD *)&sampleTimingArray[0].duration.value;
        *(_OWORD *)&cf.c = *(_OWORD *)&sampleTimingArray[0].duration.epoch;
        *(_OWORD *)&cf.tx = *(_OWORD *)&sampleTimingArray[0].presentationTimeStamp.timescale;
        v112.origin.x = x;
        v112.origin.y = y;
        v112.size.width = v24;
        v112.size.height = v23;
        v113 = CGRectApplyAffineTransform(v112, &cf);
        x = v113.origin.x;
        y = v113.origin.y;
        v24 = v113.size.width;
        v23 = v113.size.height;
      }
    }
    else
    {
      v88 = 0;
      v43 = 0;
      v41 = 0;
    }
    v44 = (int)fmodf((float)(v41 + offsetRotationDegrees), 360.0);
    if (v44 >= 0)
      v45 = v44;
    else
      v45 = v44 + 360;
    v46 = objc_msgSend(r1[2], "width");
    if (v46 == CVPixelBufferGetWidth(v10))
    {
      objc_msgSend(r1[2], "height");
      CVPixelBufferGetHeight(v10);
    }
    v47 = x;
    v48 = y;
    v49 = v24;
    v50 = v23;
    v97 = v15;
    v51 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    rect2.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    rect2.size = v51;
    CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
    v53 = 0;
    r1[0] = 0;
    v54 = v30;
    v55 = 0.0;
    if (applyValidBufferRect)
    {
      v56 = *(double *)&r1[1];
      if (CGRectIfPresent)
      {
        r1[0] = 0;
        v57 = 0;
        v56 = *(double *)&r1[1];
        v58 = r1[1];
        v59 = v30;
        if (CGRectContainsRect(*(CGRect *)&v53, rect2))
        {
          r1[0] = *(id *)&rect2.origin.x;
          v55 = rect2.origin.y;
          v56 = rect2.size.width;
          v30 = rect2.size.height;
        }
      }
    }
    else
    {
      v56 = *(double *)&r1[1];
    }
    v114.origin.x = v47;
    v114.origin.y = v48;
    v114.size.width = v49;
    v114.size.height = v50;
    if (CGRectIsNull(v114))
    {
      v60 = v95;
      v61 = *(double *)r1;
      if (!computeAndApplyAspectRatioCrop)
        goto LABEL_45;
    }
    else
    {
      v123.origin.x = round(*(double *)&r1[1] * v47);
      v123.origin.y = round(v54 * v48);
      v123.size.width = round(*(double *)&r1[1] * (v49 + v47)) - v123.origin.x;
      v123.size.height = round(v54 * (v50 + v48)) - v123.origin.y;
      *(id *)&v115.origin.x = r1[0];
      v115.origin.y = v55;
      v115.size.width = v56;
      v115.size.height = v30;
      v116 = CGRectIntersection(v115, v123);
      v61 = v116.origin.x;
      v55 = v116.origin.y;
      v56 = v116.size.width;
      v30 = v116.size.height;
      v60 = v95;
      if (!computeAndApplyAspectRatioCrop)
        goto LABEL_45;
    }
    outputAspectRatio = self->_outputAspectRatio;
    if (v45 == 270 || v45 == 90)
      outputAspectRatio = 1.0 / outputAspectRatio;
    v62 = v56 / v30;
    if (outputAspectRatio != v62)
    {
      v124.origin.x = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(v61, v55, v56, v30, outputAspectRatio);
      v124.origin.y = v64;
      v124.size.width = v65;
      v124.size.height = v66;
      v117.origin.x = v61;
      v117.origin.y = v55;
      v117.size.width = v56;
      v117.size.height = v30;
      v118 = CGRectIntersection(v117, v124);
      v61 = v118.origin.x;
      v55 = v118.origin.y;
      v56 = v118.size.width;
      v30 = v118.size.height;
    }
LABEL_45:
    -[FigM2MController maxUpscale](self->_scalerController, "maxUpscale");
    v68 = ceil(v60 / v67);
    if (v56 >= v68)
    {
      v68 = v56;
      v70 = v97;
    }
    else
    {
      v119.origin.x = v61;
      v119.origin.y = v55;
      v119.size.width = v56;
      v119.size.height = v30;
      v61 = round(CGRectGetMidX(v119) + v68 * -0.5);
      v120.origin.x = v61;
      v120.origin.y = v55;
      v120.size.width = v68;
      v120.size.height = v30;
      MaxX = CGRectGetMaxX(v120);
      if (MaxX > (double)CVPixelBufferGetWidth(v10))
        v61 = (double)CVPixelBufferGetWidth(v10) - v68;
      v70 = v97;
      if (v61 < 0.0)
        v61 = 0.0;
    }
    -[FigM2MController maxUpscale](self->_scalerController, "maxUpscale");
    v72 = ceil(v70 / v71);
    if (v30 >= v72)
    {
      v72 = v30;
    }
    else
    {
      v121.origin.x = v61;
      v121.origin.y = v55;
      v121.size.width = v68;
      v121.size.height = v30;
      v55 = round(CGRectGetMidY(v121) + v72 * -0.5);
      v122.origin.x = v61;
      v122.origin.y = v55;
      v122.size.width = v68;
      v122.size.height = v72;
      MaxY = CGRectGetMaxY(v122);
      if (MaxY > (double)CVPixelBufferGetHeight(v10))
        v55 = (double)CVPixelBufferGetHeight(v10) - v72;
      if (v55 < 0.0)
        v55 = 0.0;
    }
    v74 = 4294935550;
    if (v45 > 179)
    {
      if (v45 == 180)
      {
        v75 = 3;
        goto LABEL_66;
      }
      if (v45 == 270)
      {
        v75 = 8;
        goto LABEL_66;
      }
    }
    else
    {
      if (!v45)
      {
        v75 = 1;
        goto LABEL_66;
      }
      if (v45 == 90)
      {
        v75 = 6;
LABEL_66:
        -[BWInferenceVideoScalingProvider _configureCustomFiltersForScalingFromSourceWidth:sourceHeight:destinationWidth:destinationHeight:pixelFormat:]((uint64_t)self, (unint64_t)v68, (unint64_t)v72, v90, v89, objc_msgSend(r1[2], "pixelFormat"));
        v76 = objc_msgSend(v99, "histogramRequest");
        if (v76 && (*(unsigned int (**)(uint64_t, void *))(v76 + 16))(v76, v99))
        {
          v77 = 1;
          -[FigM2MController setHistogramMode:dstRect:](self->_scalerController, "setHistogramMode:dstRect:", 1, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v99, "width"), (double)(unint64_t)objc_msgSend(v99, "height"));
        }
        else
        {
          v77 = 0;
        }
        if (-[FigM2MController transform:srcRect:dst:dstRect:rotate:flipX:flipY:sync_m2m:](self->_scalerController, "transform:srcRect:dst:dstRect:rotate:flipX:flipY:sync_m2m:", v10, v13, v75, v43, v88, !self->_enableFencing, v61, v55, v68, v72, v94, v93, v92, v91))
        {
          v74 = 4294935556;
        }
        else
        {
          if (v77)
          {
            bzero(sampleTimingArray, 0x620uLL);
            -[FigM2MController copyHistogram:](self->_scalerController, "copyHistogram:", sampleTimingArray);
            v78 = objc_alloc(MEMORY[0x1E0C99D50]);
            v79 = (void *)objc_msgSend(v78, "initWithBytes:length:", (char *)&sampleTimingArray[0].duration.value + 4, 4 * (3 * LODWORD(sampleTimingArray[0].duration.value)));
            CMSetAttachment(v13, CFSTR("InferenceHistogramData"), v79, 1u);

            -[FigM2MController clearHistorgramMode](self->_scalerController, "clearHistorgramMode");
          }
          v102 = 0u;
          v103 = 0u;
          *(_OWORD *)&r1[3] = 0u;
          v101 = 0u;
          outputRequirements = self->_outputRequirements;
          v81 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &r1[3], v108, 16);
          if (v81)
          {
            v82 = v81;
            v83 = *(_QWORD *)v101;
            do
            {
              for (i = 0; i != v82; ++i)
              {
                if (*(_QWORD *)v101 != v83)
                  objc_enumerationMutation(outputRequirements);
                objc_msgSend(a4, "setPixelBuffer:forRequirement:", v13, *((_QWORD *)r1[4] + i));
              }
              v82 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &r1[3], v108, 16);
            }
            while (v82);
          }
          v74 = 0;
        }
      }
    }
    CFRelease(v13);
    v16 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_82;
  }
  v74 = 4294935553;
LABEL_82:
  if (*v16 == 1)
    kdebug_trace();
  if (a6)
    (*((void (**)(id, uint64_t, BWInferenceVideoScalingProvider *))a6 + 2))(a6, v74, self);
  return v74;
}

- (BOOL)mustExecuteWhenAllowed
{
  return 0;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  NSMutableArray *cloneVideoRequirements;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const void *v15;
  NSArray *outputRequirements;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t j;
  const void *v22;
  CFTypeRef v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(cloneVideoRequirements);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v15 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingCloneRequirement:", v14);
        BWSampleBufferSetAttachedMedia(a6, objc_msgSend(v14, "attachedMediaKey"), (uint64_t)v15);
        if (v15)
          CFRelease(v15);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cloneVideoRequirements, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  outputRequirements = self->_outputRequirements;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(outputRequirements);
        v22 = (const void *)objc_msgSend(a4, "pixelBufferForRequirement:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
        v23 = CMGetAttachment(v22, CFSTR("InferenceHistogramData"), 0);
        if (v23)
        {
          if ((v19 & 1) == 0)
            CMSetAttachment(a6, CFSTR("InferenceHistogramData"), v23, 1u);
          CMRemoveAttachment(v22, CFSTR("InferenceHistogramData"));
          v19 = 1;
        }
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v18);
  }
}

- (BOOL)allowsAsyncPropagation
{
  return self->_enableFencing;
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  BWInferenceCloneVideoRequirement *v5;

  v5 = -[BWInferenceCloneVideoRequirement initWithAttachedMediaKey:sourceVideoRequirement:]([BWInferenceCloneVideoRequirement alloc], "initWithAttachedMediaKey:sourceVideoRequirement:", a4, a3);
  -[NSMutableArray addObject:](self->_cloneVideoRequirements, "addObject:", v5);
  return v5;
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

@end
