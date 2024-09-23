@implementation BWLearnedMattingInferenceProvider

id __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_2(uint64_t a1, void *a2)
{
  int v4;
  unint64_t v5;
  float v6;
  unint64_t v7;
  float v8;
  unsigned int v10;

  v4 = objc_msgSend(a2, "width");
  LODWORD(v5) = objc_msgSend(a2, "height");
  v6 = *(float *)(a1 + 32);
  if (v6 != 0.0)
  {
    v7 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v4 | ((unint64_t)v5 << 32), v6);
    v4 = v7;
    v5 = HIDWORD(v7);
  }
  v8 = *(float *)(a1 + 36);
  HIWORD(v10) = (int)(float)((float)(int)v5 / v8);
  LOWORD(v10) = (int)(float)((float)v4 / v8);
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226488, v10);
}

id __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke(uint64_t a1, void *a2)
{
  int v4;
  unint64_t v5;
  float v6;
  unint64_t v7;
  float v8;
  unsigned int v10;

  v4 = objc_msgSend(a2, "width");
  LODWORD(v5) = objc_msgSend(a2, "height");
  v6 = *(float *)(a1 + 32);
  if (v6 != 0.0)
  {
    v7 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v4 | ((unint64_t)v5 << 32), v6);
    v4 = v7;
    v5 = HIDWORD(v7);
  }
  v8 = *(float *)(a1 + 36);
  HIWORD(v10) = (int)(float)((float)(int)v5 / v8);
  LOWORD(v10) = (int)(float)((float)v4 / v8);
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:appliesFinalCropRect:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:appliesFinalCropRect:", 1111970369, v10, *(unsigned __int8 *)(a1 + 40));
}

- (BWLearnedMattingInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4
{
  float v7;
  float v8;
  int v9;
  int v10;
  char v11;
  BWInferenceVideoRequirement *v12;
  BWInferenceLazyVideoRequirement *v13;
  uint64_t v14;
  BWInferenceVideoRequirement *v15;
  BWInferenceLazyVideoRequirement *v16;
  BWInferenceCloneVideoRequirement *v17;
  uint64_t v18;
  void *v19;
  BWInferenceLazyVideoRequirement **v20;
  uint64_t v21;
  id v22;
  BWLearnedMattingInferenceProvider *v23;
  FigLearnedMattingMetalStage *v24;
  opaqueCMFormatDescription *v25;
  opaqueCMFormatDescription *v26;
  objc_super v28;
  _QWORD v29[4];
  int v30;
  float v31;
  _QWORD v32[4];
  int v33;
  float v34;
  char v35;
  BWInferenceLazyVideoRequirement *v36;
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  if (!a3 || (objc_msgSend(a3, "mainImageDownscalingFactor"), v7 <= 0.0))
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v12 = 0;
LABEL_34:
    v23 = 0;
LABEL_20:

    v23 = self;
    self = 0;
    goto LABEL_26;
  }
  v8 = v7;
  objc_msgSend(a3, "targetAspectRatio");
  v10 = v9;
  v11 = objc_msgSend(a3, "appliesFinalCropRect");
  v12 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E49511B8, +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226536, 25166336));
  if (!v12)
  {
    FigSignalErrorAt();
    v15 = 0;
LABEL_30:
    v16 = 0;
LABEL_32:
    v17 = 0;
    goto LABEL_34;
  }
  v13 = [BWInferenceLazyVideoRequirement alloc];
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke;
  v32[3] = &__block_descriptor_41_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
  v33 = v10;
  v34 = v8;
  v35 = v11;
  v15 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:](v13, "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v32);
  if (!v15)
  {
    FigSignalErrorAt();
    goto LABEL_30;
  }
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_2;
  v29[3] = &__block_descriptor_40_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
  v30 = v10;
  v31 = v8;
  v16 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", 0x1E495AF38, CFSTR("PrimaryFormat"), v29);
  if (!v16)
  {
    FigSignalErrorAt();
    goto LABEL_32;
  }
  if (objc_msgSend(a3, "produceLowResPersonMaskClone"))
  {
    v17 = -[BWInferenceCloneVideoRequirement initWithAttachedMediaKey:sourceVideoRequirement:]([BWInferenceCloneVideoRequirement alloc], "initWithAttachedMediaKey:sourceVideoRequirement:", 0x1E495B0D8, v12);
    if (!v17)
      goto LABEL_34;
  }
  else
  {
    v17 = 0;
  }
  v38[0] = v15;
  v38[1] = v12;
  v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  if (v17)
  {
    v37[0] = v16;
    v37[1] = v17;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = (BWInferenceLazyVideoRequirement **)v37;
    v21 = 2;
  }
  else
  {
    v36 = v16;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v36;
    v21 = 1;
  }
  v28.receiver = self;
  v28.super_class = (Class)BWLearnedMattingInferenceProvider;
  self = -[BWTiledEspressoInferenceProvider initWithConfiguration:inputVideoRequirements:outputVideoRequirements:resourceProvider:](&v28, sel_initWithConfiguration_inputVideoRequirements_outputVideoRequirements_resourceProvider_, a3, v18, objc_msgSend(v19, "arrayWithObjects:count:", v20, v21), a4);
  if (!self)
  {
    FigSignalErrorAt();
    goto LABEL_34;
  }
  if (objc_msgSend(a3, "metalCommandQueue"))
  {
    v22 = objc_alloc(MEMORY[0x1E0D08B28]);
    v23 = (BWLearnedMattingInferenceProvider *)objc_msgSend(v22, "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), objc_msgSend(a3, "metalCommandQueue"));
  }
  else
  {
    v23 = 0;
  }
  v24 = -[FigLearnedMattingMetalStage initWithMetalContext:]([FigLearnedMattingMetalStage alloc], "initWithMetalContext:", v23);
  self->_metalProcessor = v24;
  if (!v24)
  {
    FigSignalErrorAt();
    goto LABEL_20;
  }
  if (objc_msgSend(a3, "produceLowResPersonMaskClone")
    && VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_lowResSegmentationCloneCopySession))
  {
    goto LABEL_20;
  }
  self->_inputAlphaVideoRequirement = v12;
  self->_inputImageVideoRequirement = v15;
  self->_outputAlphaVideoRequirement = &v16->super;
  self->_outputLowResSegmentationCloneVideoRequirement = &v17->super;
  v25 = -[BWVideoFormat formatDescription](-[BWInferenceVideoFormat underlyingVideoFormat](-[BWInferenceVideoRequirement videoFormat](self->_outputAlphaVideoRequirement, "videoFormat"), "underlyingVideoFormat"), "formatDescription");
  if (v25)
    v25 = (opaqueCMFormatDescription *)CFRetain(v25);
  self->_outputFormatDescription = v25;
  v26 = -[BWVideoFormat formatDescription](-[BWInferenceVideoFormat underlyingVideoFormat](-[BWInferenceVideoRequirement videoFormat](self->_outputLowResSegmentationCloneVideoRequirement, "videoFormat"), "underlyingVideoFormat"), "formatDescription");
  if (v26)
    v26 = (opaqueCMFormatDescription *)CFRetain(v26);
  self->_outputLowResSegmentationCloneFormatDescription = v26;
  self->_appliesFinalCropRect = v11;
LABEL_26:

  return self;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *outputLowResSegmentationCloneFormatDescription;
  objc_super v5;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  outputLowResSegmentationCloneFormatDescription = self->_outputLowResSegmentationCloneFormatDescription;
  if (outputLowResSegmentationCloneFormatDescription)
    CFRelease(outputLowResSegmentationCloneFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)BWLearnedMattingInferenceProvider;
  -[BWTiledEspressoInferenceProvider dealloc](&v5, sel_dealloc);
}

- (int)type
{
  return 107;
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  int v7;
  int result;

  v7 = objc_msgSend(a4, "isEqualToString:", 0x1E495AF38);
  if (v7 | objc_msgSend(a4, "isEqualToString:", 0x1E495B0D8))
    result = 0;
  else
    result = -31710;
  if (v7)
    return -[FigLearnedMattingMetalStage clearBuffer:](self->_metalProcessor, "clearBuffer:", a3);
  return result;
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
  _QWORD *v5;
  _QWORD *v6;
  unsigned __int32 v7;
  uint64_t v11;
  float32x2_t v12;
  float32x2_t v13;
  uint64_t v15;
  uint16x4_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int result;
  unsigned int v21;

  v6 = v5;
  v7 = a5;
  if (objc_msgSend(a3, "count") != 2)
    return FigSignalErrorAt();
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("alpha"));
  if (!v11)
    return FigSignalErrorAt();
  v12.f32[0] = (float)(unsigned __int16)*(_DWORD *)self->_inputTileSize;
  v12.f32[1] = (float)HIWORD(*(_DWORD *)self->_inputTileSize);
  v13.f32[0] = (float)(unsigned __int16)v7;
  v13.f32[1] = (float)HIWORD(v7);
  if (-[FigLearnedMattingMetalStage createTileFrom:to:withStart:withScale:outCommandBuffer:](self->_metalProcessor, "createTileFrom:to:withStart:withScale:outCommandBuffer:", objc_msgSend(a4, "objectForKeyedSubscript:", 0x1E49511B8), v11, v6, COERCE_DOUBLE(vmul_f32(v13, vmul_f32(*(float32x2_t *)self->_inputAlphaScale, vsub_f32(v12, *(float32x2_t *)&self->_inputTileOverlap[4])))), *(double *)self->_inputAlphaScale)|| v6 == 0)
  {
    return FigSignalErrorAt();
  }
  v15 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("image"));
  if (!v15)
    return FigSignalErrorAt();
  v16.i32[0] = v7;
  v17.i16[0] = *(_WORD *)self->_outputTileSize;
  v17.i16[2] = *(_WORD *)&self->_outputTileSize[2];
  v18.i16[0] = *(_WORD *)self->_outputTileOverlap;
  v18.i16[2] = *(_WORD *)&self->_outputTileOverlap[2];
  v19 = vmul_s32(vsub_s32(v17, v18), (int32x2_t)*(_OWORD *)&vmovl_u16(v16));
  HIWORD(v21) = v19.i16[2];
  LOWORD(v21) = v19.i16[0];
  result = -[FigLearnedMattingMetalStage createTileFrom:to:withStart:commandBuffer:](self->_metalProcessor, "createTileFrom:to:withStart:commandBuffer:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), v15, v21, *v6);
  if (result)
    return FigSignalErrorAt();
  return result;
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
  int v13;
  uint16x4_t v14;
  int32x2_t v15;
  int32x2_t v16;
  int result;
  int32x2_t v18;
  int32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int32x2_t v22;
  uint32x4_t v23;
  int32x2_t v24;
  unsigned int v25;
  int8x8_t v26;
  int8x8_t v27;
  int32x2_t v28;
  __int16 v29;
  __int16 v30;
  int32x2_t v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  __int32 v36;
  uint64_t v37;

  v13 = objc_msgSend(a3, "isEqualToString:", 0x1E495AF38, a4, a5, a6, a7, a8);
  if (v13 | objc_msgSend(a3, "isEqualToString:", 0x1E495B0D8))
    result = 0;
  else
    result = -31710;
  if (v13)
  {
    v14.i32[0] = (int)a9;
    v18 = (int32x2_t)vmovl_u16(v14).u64[0];
    v19 = (int32x2_t)vand_s8((int8x8_t)v18, (int8x8_t)0xFFFF0000FFFFLL);
    v15.i16[0] = *(_WORD *)self->_outputTileSize;
    v15.i16[2] = *(_WORD *)&self->_outputTileSize[2];
    v16.i16[0] = *(_WORD *)self->_outputTileOverlap;
    v16.i16[2] = *(_WORD *)&self->_outputTileOverlap[2];
    v20 = vsub_s32(v15, v16);
    v21 = vmul_s32(v20, v18);
    HIWORD(v34) = v21.i16[2];
    v22 = vadd_s32(v21, v15);
    LOWORD(v34) = v21.i16[0];
    v23.i64[0] = -1;
    v23.i64[1] = -1;
    v24 = vtst_s32(v18, (int32x2_t)0xFFFF0000FFFFLL);
    HIWORD(v36) = v24.i16[2];
    LOWORD(v36) = v24.i16[0];
    v25 = v24.u16[0];
    v24.i32[0] = 0;
    v24.i32[1] = v36;
    v26.i32[0] = vceq_s32(v24, (int32x2_t)(v25 | 0x1000000000000)).u32[0];
    v26.i32[1] = vcgt_u32((uint32x2_t)(v25 | 0x1000000000000), *(uint32x2_t *)&v24).i32[1];
    v27 = vbic_s8((int8x8_t)vmla_s32(v15, v20, (int32x2_t)*(_OWORD *)&vaddw_u16(v23, v14)), v26);
    HIWORD(v33) = v27.i16[2];
    LOWORD(v33) = v27.i16[0];
    v28 = vmul_s32(v20, (int32x2_t)*(_OWORD *)&vaddw_u16((uint32x4_t)0x100000001uLL, v14));
    v29 = v28.i16[0];
    v30 = v28.i16[2];
    v28.i16[0] = (__int16)self[1].super.super.isa;
    v28.i16[2] = WORD1(self[1].super.super.isa);
    v31 = vceq_s32((int32x2_t)vand_s8((int8x8_t)vadd_s32(v28, (int32x2_t)-1), (int8x8_t)0xFFFF0000FFFFLL), v19);
    HIWORD(v35) = v31.i16[2];
    LOWORD(v35) = v31.i16[0];
    if (v35 >= 0x10000)
      v30 = v22.i16[2];
    if (v31.i16[0])
      v29 = v22.i16[0];
    LOWORD(v32) = v29;
    HIWORD(v32) = v30;
    result = -[FigLearnedMattingMetalStage pasteTileFrom:to:withStart:withNoOverlapStart:withNoOverlapEnd:outCommandBuffer:](self->_metalProcessor, "pasteTileFrom:to:withStart:withNoOverlapStart:withNoOverlapEnd:outCommandBuffer:", objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("alpha_refined")), a4, v34, v33, v32, v37);
    if (result)
      return FigSignalErrorAt();
  }
  return result;
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  uint64_t v9;
  __CVBuffer *v10;
  int v11;
  int v12;
  const __CFString *v13;
  void *v14;
  const void *v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  __CVBuffer *v32;
  OpaqueVTPixelTransferSession *lowResSegmentationCloneCopySession;
  const __CFString *v34;
  void *v35;
  int v36;
  __int128 v38;
  __int128 v39;
  CMAttachmentBearerRef target;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  target = 0;
  v9 = objc_msgSend(a4, "pixelBufferForRequirement:");
  if (!v9)
    return FigSignalErrorAt();
  v10 = (__CVBuffer *)v9;
  v11 = objc_msgSend((id)objc_msgSend(a3, "attachedMediaKey"), "isEqualToString:", 0x1E495AF38);
  v12 = objc_msgSend((id)objc_msgSend(a3, "attachedMediaKey"), "isEqualToString:", 0x1E495B0D8);
  if ((v11 & 1) == 0 && !v12)
    goto LABEL_21;
  if (v11)
  {
    CVBufferSetAttachment(v10, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
    BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v10, 0, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target);
    if (target)
    {
      v13 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v14 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
      CMSetAttachment(target, v13, v14, 1u);

      v41 = *MEMORY[0x1E0D08660];
      v42[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 65537);
      v15 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D08730], v15, 1u);
      if (self->_appliesFinalCropRect)
      {
        v16 = BWPixelBufferDimensionsFromSampleBuffer(a5);
        CMGetAttachment(a5, v13, 0);
        v17 = *MEMORY[0x1E0C9D628];
        v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        v38 = *MEMORY[0x1E0C9D628];
        v39 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
        v21 = *MEMORY[0x1E0C9D628];
        v22 = v18;
        v23 = v19;
        v24 = v20;
        if (FigCFDictionaryGetCGRectIfPresent())
        {
          FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v38, *((double *)&v38 + 1), *(double *)&v39, *((double *)&v39 + 1));
          v21 = v25;
          v22 = v26;
          v23 = v27;
          v24 = v28;
        }
        v29 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)target);
        v30 = (void *)CMGetAttachment(target, v13, 0);
        FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v30, v16, v29, v21, v22, v23, v24, v17, v18, v19, v20);
      }
      BWSampleBufferSetAttachedMedia(a5, 0x1E495AF38, (uint64_t)target);
      BWSampleBufferRemoveAttachedMedia(a5, 0x1E49511B8);
      goto LABEL_17;
    }
LABEL_23:
    v36 = FigSignalErrorAt();
    goto LABEL_18;
  }
  if (v12)
  {
    v31 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputAlphaVideoRequirement);
    if (v31)
    {
      v32 = (__CVBuffer *)v31;
      lowResSegmentationCloneCopySession = self->_lowResSegmentationCloneCopySession;
      if (lowResSegmentationCloneCopySession)
      {
        if (!VTPixelTransferSessionTransferImage(lowResSegmentationCloneCopySession, v32, v10))
        {
          BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v10, 0, (CFTypeRef *)&self->_outputLowResSegmentationCloneFormatDescription, (CMSampleBufferRef *)&target);
          if (!target)
            goto LABEL_23;
          v34 = (const __CFString *)*MEMORY[0x1E0D05CB0];
          v35 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
          CMSetAttachment(target, v34, v35, 1u);

          BWSampleBufferSetAttachedMedia(a5, 0x1E495B0D8, (uint64_t)target);
          goto LABEL_17;
        }
LABEL_21:
        v36 = -31710;
        goto LABEL_18;
      }
    }
  }
LABEL_17:
  v36 = 0;
LABEL_18:
  if (target)
    CFRelease(target);
  return v36;
}

- (int)purgeIntermediateResources
{
  -[FigLearnedMattingMetalStage finishProcessing](self->_metalProcessor, "finishProcessing");
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  float32x2_t v7;
  unint64_t v13;
  float32x2_t v14;
  unsigned int *outputTileSize;
  unsigned __int8 *inputTileSize;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  BWLearnedMattingInferenceProvider *v20;
  int v21;
  int v22;
  int v23;
  FigCaptureCameraParameters *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t isa_low;
  float v34;
  float32x2_t v35;
  objc_super v36;
  objc_super v37;

  v5 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_outputAlphaVideoRequirement, "videoFormat"), "width");
  v6 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_outputAlphaVideoRequirement, "videoFormat"), "height");
  v7.f32[0] = (float)(unsigned __int16)v5;
  v7.f32[1] = (float)(unsigned __int16)v6;
  __asm { FMOV            V1.2S, #0.25 }
  v35 = vmul_f32(v7, _D1);
  v34 = (float)-[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_inputAlphaVideoRequirement, "videoFormat"), "width");
  v13 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_inputAlphaVideoRequirement, "videoFormat"), "height");
  v14.f32[0] = v34;
  v14.f32[1] = (float)v13;
  *(float32x2_t *)self->_inputAlphaScale = vdiv_f32(v14, v35);
  outputTileSize = (unsigned int *)self->_outputTileSize;
  *(_DWORD *)self->_outputTileSize = 54526720;
  inputTileSize = self->_inputTileSize;
  *(_DWORD *)self->_inputTileSize = 13631680;
  v17 = (int32x2_t)vand_s8((int8x8_t)__PAIR64__(v6, v5), (int8x8_t)0xFFFF0000FFFFLL);
  v18.i32[0] = *(unsigned __int16 *)self->_outputTileSize;
  v18.i32[1] = *(unsigned __int16 *)&self->_outputTileSize[2];
  v19 = vcvt_s32_f32(vrndp_f32(vdiv_f32(vcvt_f32_s32(vadd_s32(v17, (int32x2_t)0xF0000000FLL)), vcvt_f32_s32(vadd_s32(v18, (int32x2_t)0xF0000000FLL)))));
  v20 = self + 1;
  LOWORD(self[1].super.super.isa) = v19.i16[0];
  WORD1(self[1].super.super.isa) = v19.i16[2];
  if (v19.i32[0] == 1)
  {
    LOWORD(v21) = 0;
    *(_DWORD *)&self->_inputTileOverlap[4] = 0;
  }
  else
  {
    *(float *)&self->_inputTileOverlap[4] = (float)((float)(*(unsigned __int16 *)inputTileSize * v19.i32[0]) - v35.f32[0])
                                          / (float)(v19.i32[0] - 1);
    v21 = (*(unsigned __int16 *)outputTileSize * LOWORD(v20->super.super.isa) - v17.i32[0])
        / (LOWORD(v20->super.super.isa) - 1);
  }
  *(_WORD *)self->_outputTileOverlap = v21;
  v22 = WORD1(self[1].super.super.isa);
  v23 = v22 - 1;
  if (v22 == 1)
  {
    *(_DWORD *)self->_numTiles = 0;
  }
  else
  {
    *(float *)self->_numTiles = (float)((float)(*(unsigned __int16 *)&self->_inputTileSize[2] * v22) - v35.f32[1])
                              / (float)v23;
    v23 = (*(unsigned __int16 *)&self->_outputTileSize[2] * WORD1(self[1].super.super.isa) - v17.i32[1])
        / (WORD1(self[1].super.super.isa) - 1);
  }
  *(_WORD *)&self->_outputTileOverlap[2] = v23;
  v24 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v25 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("learnedmatting-f16-v%d"), -[FigCaptureCameraParameters learnedMattingVersion](v24, "learnedMattingVersion")), 1);
  v26 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1111970369, *outputTileSize);
  v27 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226536, *(unsigned int *)inputTileSize);
  v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v26, CFSTR("image"), v27, CFSTR("alpha"), 0);
  v29 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:", 1278226536, *outputTileSize);
  v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v29, CFSTR("alpha_refined"), 0);
  v31 = -[BWLearnedMattingInferenceProvider type](self, "type");
  isa_low = LODWORD(v20->super.super.isa);
  v37.receiver = self;
  v37.super_class = (Class)BWLearnedMattingInferenceProvider;
  if (-[BWTiledEspressoInferenceProvider loadNetworkWithURL:configName:inferenceType:maxTileCount:inputFormatsByBindingName:outputFormatsByBindingName:additionalVideoRequirements:](&v37, sel_loadNetworkWithURL_configName_inferenceType_maxTileCount_inputFormatsByBindingName_outputFormatsByBindingName_additionalVideoRequirements_, v25, CFSTR("832x768"), v31, isa_low, v28, v30, 0))
  {
    return FigSignalErrorAt();
  }
  v36.receiver = self;
  v36.super_class = (Class)BWLearnedMattingInferenceProvider;
  return -[BWTiledEspressoInferenceProvider prepareForSubmissionWithWorkQueue:](&v36, sel_prepareForSubmissionWithWorkQueue_, a3);
}

@end
