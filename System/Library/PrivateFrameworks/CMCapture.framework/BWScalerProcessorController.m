@implementation BWScalerProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWScalerProcessorController)initWithConfiguration:(id)a3
{
  BWScalerProcessorController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWScalerProcessorController;
  v3 = -[BWStillImageProcessorController initWithName:type:configuration:](&v5, sel_initWithName_type_configuration_, CFSTR("ScalerPC"), 18, a3);
  if (v3)
  {
    v3->_pixelTransferSessionByMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_formatDescriptionByMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BWScalerProcessorController reset](self, "reset");

  v3.receiver = self;
  v3.super_class = (Class)BWScalerProcessorController;
  -[BWStillImageProcessorController dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_pixelTransferSessionByMediaKey, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_formatDescriptionByMediaKey, "removeAllObjects");
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWScalerProcessorControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWScalerProcessorControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  return 0;
}

- (int)process
{
  uint64_t v2;
  BWStillImageProcessorControllerRequest *v3;
  BWStillImageProcessorControllerRequest *v4;
  BWStillImageProcessorControllerInput *v5;
  BWStillImageProcessorControllerInput *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  char v11;
  uint64_t v12;
  opaqueCMSampleBuffer *v13;
  unsigned int v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v16;
  const void *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BWStillImageProcessorControllerInput *v30;
  uint64_t v31;
  unsigned int v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  os_log_type_t type;
  int v40;
  CFTypeRef cf;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v3 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v4 = v3;
  if (!v3)
  {
    v28 = v2;
    LODWORD(v27) = 0;
    FigDebugAssert3();
    v24 = 0;
    v6 = 0;
LABEL_43:
    v7 = 0;
    v18 = 0;
    v25 = 4294954516;
    goto LABEL_39;
  }
  v5 = -[BWStillImageProcessorControllerRequest input](v3, "input");
  v6 = v5;
  if (!v5)
  {
    v24 = 0;
    goto LABEL_43;
  }
  if (-[BWStillImageProcessorControllerInput frame](v5, "frame"))
  {
    if (-[BWStillImageProcessorControllerInput bufferType](v6, "bufferType"))
    {
      v29 = -[BWStillImageProcessorControllerInput bufferType](v6, "bufferType");
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", -[BWStillImageProcessorControllerInput frame](v6, "frame"), CFSTR("PrimaryFormat"), 0);
      v30 = (BWStillImageProcessorControllerInput *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = (void *)BWSampleBufferCopyDictionaryOfAttachedMedia((const void *)-[BWStillImageProcessorControllerInput frame](v6, "frame"));
      objc_msgSend(v7, "addEntriesFromDictionary:", v8);

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v34)
      {
        v31 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v43 != v31)
              objc_enumerationMutation(v7);
            v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("PrimaryFormat"), v27, v28);
            if ((v11 & 1) != 0)
              v12 = 1;
            else
              v12 = BWStillImageBufferTypeForAttachedMediaKey(v10);
            v13 = (opaqueCMSampleBuffer *)objc_msgSend(v7, "objectForKeyedSubscript:", v10);
            cf = 0;
            v14 = -[BWScalerProcessorController _zoomSampleBuffer:settings:applyZoom:mediaKey:bufferType:request:newZoomedSampleBufferOut:](self, v13, -[BWStillImageProcessorControllerInput stillImageSettings](v6, "stillImageSettings"), -[BWStillImageProcessorControllerInput applyZoom](v6, "applyZoom"), v10, v12, v4, &cf);
            if (v14)
            {
              v33 = v14;
              v40 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              if ((v11 & 1) != 0)
              {
                v28 = v2;
                LODWORD(v27) = 0;
                FigDebugAssert3();
                v18 = 0;
                v24 = v29;
                v6 = v30;
                v25 = v33;
                goto LABEL_39;
              }
            }
            else
            {
              if (cf)
                v16 = cf;
              else
                v16 = v13;
              -[BWStillImageProcessorControllerInput setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v16, v10);
            }
            if (cf)
              CFRelease(cf);
          }
          v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v34)
            continue;
          break;
        }
      }
      v6 = v30;
      v17 = (const void *)-[BWStillImageProcessorControllerInput objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", CFSTR("PrimaryFormat"), v27);
      v18 = v17;
      if (v17)
      {
        BWSampleBufferRemoveAllAttachedMedia(v17);
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v19 = -[BWStillImageProcessorControllerInput countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v36 != v21)
                objc_enumerationMutation(v30);
              v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) == 0)
                BWSampleBufferSetAttachedMedia(v18, (uint64_t)v23, -[BWStillImageProcessorControllerInput objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v23));
            }
            v20 = -[BWStillImageProcessorControllerInput countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
          }
          while (v20);
        }
        v24 = v29;
        if (*MEMORY[0x1E0CA1FC0] == 1)
          kdebug_trace();
        v25 = 0;
      }
      else
      {
        v28 = v2;
        LODWORD(v27) = 0;
        FigDebugAssert3();
        v25 = 4294954516;
        v24 = v29;
      }
    }
    else
    {
      v28 = v2;
      LODWORD(v27) = 0;
      FigDebugAssert3();
      v24 = 0;
      v6 = 0;
      v7 = 0;
      v18 = 0;
      v25 = 4294894083;
    }
  }
  else
  {
    v25 = 4294894082;
    v28 = v2;
    LODWORD(v27) = 0;
    FigDebugAssert3();
    v24 = 0;
    v6 = 0;
    v7 = 0;
    v18 = 0;
  }
LABEL_39:
  -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v4, "delegate", v27, v28), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, v18, v24, -[BWStillImageProcessorControllerRequest input](v4, "input"), v25);

  -[BWScalerProcessorController reset](self, "reset");
  return v25;
}

- (uint64_t)_zoomSampleBuffer:(void *)a3 settings:(int)a4 applyZoom:(void *)a5 mediaKey:(uint64_t)a6 bufferType:(void *)a7 request:(CMAttachmentBearerRef *)a8 newZoomedSampleBufferOut:
{
  int v13;
  uint64_t v14;
  void *v15;
  __CVBuffer *ImageBuffer;
  int64_t v17;
  void *v18;
  float v19;
  float v20;
  uint64_t v21;
  double v22;
  double v23;
  double FinalCropRect;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  BOOL v42;
  uint64_t v43;
  _BOOL4 v44;
  _BOOL4 v45;
  _BOOL4 v46;
  uint64_t v47;
  _BOOL4 v48;
  _BOOL4 v49;
  int v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  VTPixelTransferSessionRef v57;
  OpaqueVTPixelTransferSession *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id *v62;
  uint64_t v63;
  __CVBuffer *v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  BOOL v69;
  __CVBuffer *v70;
  float v72;
  double v73;
  double v74;
  double v75;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v77;
  uint64_t v78;
  id v79;
  const char *v80;
  const __CFDictionary *v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v85;
  uint64_t v86;
  double v87;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  int v94;
  __CVBuffer *v95;
  uint64_t v96;
  uint64_t v97;
  _BOOL4 v98;
  unint64_t v99;
  double v100;
  double v101;
  opaqueCMSampleBuffer *v102;
  uint64_t v104;
  void *v105;
  CFTypeRef cf;
  CMAttachmentBearerRef target[27];
  CGSize v109;
  CGRect v110;
  CGRect v111;

  target[25] = *(CMAttachmentBearerRef *)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  cf = 0;
  target[0] = 0;
  v13 = objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat"));
  v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "mainImageDownscalingFactorByAttachedMediaKey"), "objectForKeyedSubscript:", a5);
  v15 = (void *)v14;
  if ((v13 & 1) != 0 || v14)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    if (!ImageBuffer)
    {
      v82 = 4294894082;
      FigDebugAssert3();
      v70 = 0;
      goto LABEL_66;
    }
    v104 = (uint64_t)a1;
    v95 = ImageBuffer;
    v17 = psn_pixelBufferDimensions(ImageBuffer);
    if (!CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0))
    {
      FigDebugAssert3();
      v70 = 0;
      v82 = 4294894083;
      goto LABEL_66;
    }
    v18 = (void *)objc_msgSend(a3, "requestedSettings");
    v19 = 1.0;
    if ((v13 & 1) == 0)
    {
      objc_msgSend(v15, "floatValue");
      v19 = v20;
    }
    v21 = (int)(float)((float)objc_msgSend(v18, "outputWidth") / v19);
    v96 = (int)(float)((float)objc_msgSend(v18, "outputHeight") / v19);
    v97 = v21;
    v22 = (double)(int)v21;
    v23 = (double)(int)v96;
    if (a4)
    {
      FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
      v26 = v25;
      v28 = v27;
      v30 = v29;
    }
    else
    {
      v28 = 1.0;
      FinalCropRect = 0.0;
      v26 = 0.0;
      v30 = 1.0;
    }
    v100 = v30;
    v101 = v26;
    v87 = v22 / v23;
    if (v13)
      FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v17, v17 >> 32, FinalCropRect, v26, v28, v30, v22 / v23);
    else
      v31 = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia((int)v17, v17 >> 32, FinalCropRect, v26, v28, v30, v22 / v23, (double)(int)objc_msgSend(v15, "intValue"));
    v35 = v31;
    v36 = v32;
    v37 = v33;
    v38 = v34;
    if (CGRectIsNull(*(CGRect *)&v31))
    {
      FigDebugAssert3();
      v70 = 0;
      v82 = 4294954516;
      goto LABEL_66;
    }
    v93 = (double)(int)v21;
    v102 = a2;
    LODWORD(a2) = llround(v37);
    LODWORD(v21) = llround(v38);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(FinalCropRect, v101, v28, v100);
    v105 = a5;
    if (!a4 || ((v41 = vabdd_f64(v40, v38), vabdd_f64(v39, v37) <= 2.0) ? (v42 = v41 <= 2.0) : (v42 = 0), v42))
    {
      v94 = 0;
    }
    else
    {
      FigCaptureMetadataUtilitiesNormalizeCropRect(v35, v36, v37, v38);
      v94 = 1;
    }
    v98 = FigCaptureVideoDimensionsAreEqual(v17, (unint64_t)a2 | (v21 << 32));
    v43 = v97 | (v96 << 32);
    v44 = FigCaptureVideoDimensionsAreEqual(v17, v43);
    v45 = FigCaptureVideoDimensionsAreEqual((unint64_t)a2 | (v21 << 32), v43);
    v46 = (llround(v35) & 1) == 0 && ((llround(v36) | a2) & 1) == 0 && (v21 & 1) == 0;
    v47 = a6;
    v48 = objc_msgSend(v18, "outputFormat") == 1785750887
       || objc_msgSend(v18, "outputFormat") == 1752589105;
    v49 = FigCapturePixelFormatIsDemosaicedRaw(objc_msgSend(v18, "rawOutputFormat"))
       && objc_msgSend(v18, "outputFormat") == 0;
    v50 = 0;
    if (v48 || v49)
    {
      v51 = v47;
      if (a4)
      {
        if (v98)
          v50 = v44;
        else
          v50 = v45 && v46;
      }
    }
    else
    {
      v51 = v47;
    }
    v52 = (void *)objc_msgSend(a7, "delegate");
    v53 = objc_msgSend(a7, "input");
    v54 = v51;
    if ((v13 & 1) == 0)
      v54 = BWStillImageBufferTypeForAttachedMediaKey(v105);
    v55 = objc_msgSend(v52, "processorController:outputPixelBufferDimensionsForProcessorInput:type:attachedMediaKey:", v104, v53, v54, v105);
    v56 = v55;
    v99 = HIDWORD(v55);
    if ((a4 & (v50 ^ 1) & 1) == 0 && (int)v17 <= (int)v55 && SHIDWORD(v17) <= SHIDWORD(v55))
    {
      v70 = 0;
      v82 = 0;
      goto LABEL_66;
    }
    v57 = -[BWScalerProcessorController _ensurePixelTransferSessionForMediaKey:](v104, (uint64_t)v105);
    if (v57)
    {
      v58 = v57;
      v59 = objc_msgSend(a7, "delegate");
      v60 = objc_msgSend(a7, "input");
      if ((v13 & 1) == 0)
        v51 = BWStillImageBufferTypeForAttachedMediaKey(v105);
      v61 = (void *)v59;
      v62 = (id *)v104;
      v63 = objc_msgSend(v61, "processorController:newOutputPixelBufferForProcessorInput:type:attachedMediaKey:", v104, v60, v51, v105);
      if (!v63)
      {
        v70 = 0;
        v82 = 4294954510;
        goto LABEL_66;
      }
      v64 = (__CVBuffer *)v63;
      v65 = *MEMORY[0x1E0C9D628];
      v66 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v67 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v68 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v69 = FigCaptureVideoDimensionsAreEqual(v43, v56);
      v91 = v66;
      v92 = v65;
      v89 = v68;
      v90 = v67;
      v70 = v64;
      if (!v69)
      {
        if ((int)v56 < (int)v97 || (int)v99 < (int)v96)
        {
          v82 = 4294954516;
          goto LABEL_66;
        }
        v65 = 0.0;
        v66 = 0.0;
        v68 = (double)(int)v96;
        v67 = v93;
        if ((a4 & 1) == 0)
        {
          v72 = v87;
          v65 = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(0.0, 0.0, (double)(int)v56, (double)(int)v99, v72);
          v66 = v73;
          v67 = v74;
          v68 = v75;
        }
      }
      if (dword_1ECFE9A10)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v62 = (id *)v104;
        v70 = v64;
      }
      v77 = BWScalePixelBuffer(v95, v70, v58, v35, v36, v37, v38, v65, v66, v67, v68);
      if ((_DWORD)v77)
      {
        v82 = v77;
        goto LABEL_66;
      }
      cf = (id)objc_msgSend(v62[8], "objectForKeyedSubscript:", v105);
      v78 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(v102, v70, &cf, (CMSampleBufferRef *)target);
      if ((_DWORD)v78)
      {
        v82 = v78;
        FigDebugAssert3();
        goto LABEL_66;
      }
      objc_msgSend(v62[8], "setObject:forKeyedSubscript:", cf, v105);
      v79 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target[0]);
      CVBufferRemoveAttachment(v70, (CFStringRef)*MEMORY[0x1E0CA8D50]);
      if (v94)
        FigCFDictionarySetCGRect();
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v79, v17, v56, v35, v36, v37, v38, v65, v66, v67, v68);
      FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v79, v17, v56);
      if (a4)
      {
        v110.origin.x = v65;
        v110.origin.y = v66;
        v110.size.width = v67;
        v110.size.height = v68;
        v111.origin.y = v91;
        v111.origin.x = v92;
        v111.size.height = v89;
        v111.size.width = v90;
        if (CGRectEqualToRect(v110, v111))
          FigCaptureMetadataUtilitiesPreventFurtherCropping(v79, v80);
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "configuration", v85, v86), "memoryAnalyticsPayload"), "setScaledStillCaptureTaken:", 1);
      if (CMGetAttachment(target[0], CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0))
      {
        v109.width = (double)(int)v56;
        v109.height = (double)(int)v99;
        v81 = CGSizeCreateDictionaryRepresentation(v109);
        CMSetAttachment(target[0], CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), v81, 1u);
        BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(target[0], CFSTR("OriginalCameraIntrinsicMatrix"), 0, 0, v35, v36, v37, v38, v65, v66, v67, v68);
      }
      goto LABEL_65;
    }
    FigDebugAssert3();
  }
  v70 = 0;
LABEL_65:
  v82 = 0;
LABEL_66:
  if (dword_1ECFE9A10)
  {
    v83 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)v82)
  {
    if (target[0])
      CFRelease(target[0]);
  }
  else if (a8)
  {
    *a8 = target[0];
  }
  CVPixelBufferRelease(v70);
  if (cf)
    CFRelease(cf);
  return v82;
}

- (VTPixelTransferSessionRef)_ensurePixelTransferSessionForMediaKey:(uint64_t)a1
{
  OpaqueVTPixelTransferSession *v4;
  OSStatus v5;
  VTPixelTransferSessionRef pixelTransferSessionOut;

  if (!a1)
    return 0;
  v4 = (OpaqueVTPixelTransferSession *)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", a2);
  pixelTransferSessionOut = v4;
  if (!v4)
  {
    v5 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &pixelTransferSessionOut);
    v4 = pixelTransferSessionOut;
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", pixelTransferSessionOut, a2);
      if (pixelTransferSessionOut)
      {
        CFRelease(pixelTransferSessionOut);
        return pixelTransferSessionOut;
      }
      else
      {
        return 0;
      }
    }
  }
  return v4;
}

@end
