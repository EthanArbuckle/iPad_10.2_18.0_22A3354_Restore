@implementation BWDeepZoomProcessorControllerConfiguration

- (int)type
{
  return self->_type;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setOutputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (void)setInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeepZoomProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

+ (BOOL)doDeepZoomStandardOrLiteForSampleBuffer:(opaqueCMSampleBuffer *)a3 type:(int)a4 sensorConfiguration:(id)a5 intermediateZoomSrcRectOut:(CGRect *)a6 intermediateZoomDstRectOut:(CGRect *)a7
{
  uint64_t v10;
  void *ImageBuffer;
  CGSize v13;
  void *v14;
  void *v15;
  unint64_t v16;
  CGPoint *v17;
  CGPoint *v18;
  CGSize v19;
  CGSize v20;
  CGPoint v22;
  CGSize v23;
  CGPoint v24;
  CGSize v25;

  v10 = *(_QWORD *)&a4;
  if (dzpc_initializeTrace_sInitializeTraceOnceToken != -1)
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_119);
  LOBYTE(ImageBuffer) = 0;
  v13 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v24 = (CGPoint)*MEMORY[0x1E0C9D628];
  v25 = v13;
  v22 = v24;
  v23 = v13;
  if (a5)
  {
    if (a3)
    {
      if ((v10 - 3) >= 0xFFFFFFFE)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        if (ImageBuffer)
        {
          ImageBuffer = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          if (ImageBuffer)
          {
            v14 = ImageBuffer;
            ImageBuffer = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
            if (ImageBuffer)
            {
              v15 = ImageBuffer;
              v16 = BWPixelBufferDimensionsFromSampleBuffer(a3);
              if (a6)
                v17 = &v24;
              else
                v17 = 0;
              v18 = &v22;
              if (!a7)
                v18 = 0;
              LOBYTE(ImageBuffer) = +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", v10, a5, v16, v14, v15, v17, v18);
            }
          }
        }
      }
    }
  }
  if (a6)
  {
    v19 = v25;
    a6->origin = v24;
    a6->size = v19;
  }
  if (a7)
  {
    v20 = v23;
    a7->origin = v22;
    a7->size = v20;
  }
  return (char)ImageBuffer;
}

+ (BOOL)doDeepZoomStandardOrLiteForType:(int)a3 sensorConfiguration:(id)a4 dimensions:(id)a5 metadata:(id)a6 stillImageSettings:(id)a7 intermediateZoomSrcRectOut:(CGRect *)a8 intermediateZoomDstRectOut:(CGRect *)a9
{
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double width;
  double height;
  void *v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  double v30;
  float v31;
  double v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  int v41;
  float v42;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char v45;
  NSObject *v51;
  double v52;
  double v53;
  int v54;
  int v55;
  char v56;
  NSObject *v57;
  float v58;
  float v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  NSObject *v66;
  uint64_t v68;
  uint64_t v69;
  double v70;
  __int128 v71;
  double rect1;
  double x;
  double y;
  int v75;
  id v76;
  int v77;
  __int128 v78;
  __int128 v79;
  CGRect v80;
  CGPoint v81;
  CGSize v82;
  _QWORD v83[2];
  _QWORD v84[5];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v14 = *(_QWORD *)&a3;
  v84[2] = *MEMORY[0x1E0C80C00];
  if (dzpc_initializeTrace_sInitializeTraceOnceToken != -1)
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_119);
  LOBYTE(v15) = 0;
  v81 = (CGPoint)*MEMORY[0x1E0C9D628];
  v82 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v80.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v80.size = v82;
  if ((v14 - 3) < 0xFFFFFFFE)
    goto LABEL_67;
  if (!a4)
    goto LABEL_67;
  if (!a6)
    goto LABEL_67;
  v71 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  if (!a7)
    goto LABEL_67;
  v15 = (void *)objc_msgSend((id)objc_msgSend(a4, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("DeepZoomParameters"));
  if (!v15)
    goto LABEL_67;
  v16 = v15;
  LOBYTE(v15) = 0;
  if (!a5.var0)
    goto LABEL_67;
  if (!a5.var1)
    goto LABEL_67;
  v15 = (void *)objc_msgSend(a7, "requestedSettings");
  if (!v15)
    goto LABEL_67;
  v17 = v15;
  v77 = +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:sensorConfiguration:](BWDeepZoomProcessorControllerConfiguration, "deepZoomProcessingModeForType:sensorConfiguration:", v14, a4);
  if (!v77)
  {
    FigDebugAssert3();
    goto LABEL_85;
  }
  v78 = *MEMORY[0x1E0C9D648];
  v79 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  FigCFDictionaryGetCGRectIfPresent();
  v18 = (double)objc_msgSend(v17, "outputWidth");
  v19 = v18 / (double)objc_msgSend(v17, "outputHeight");
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(a5.var0, *(uint64_t *)&a5 >> 32, *(CGFloat *)&v78, *((CGFloat *)&v78 + 1), *(CGFloat *)&v79, *((CGFloat *)&v79 + 1), v19);
  width = v85.size.width;
  height = v85.size.height;
  x = v85.origin.x;
  y = v85.origin.y;
  if (CGRectIsEmpty(v85))
  {
LABEL_85:
    LOBYTE(v15) = 0;
    goto LABEL_67;
  }
  v83[0] = &unk_1E49FC9D8;
  v83[1] = &unk_1E49FC9F0;
  v84[0] = CFSTR("Lite");
  v84[1] = CFSTR("Standard");
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
  v15 = (void *)objc_msgSend(v22, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14));
  if (!v15)
    goto LABEL_67;
  v15 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", v15);
  if (!v15)
    goto LABEL_67;
  v23 = v15;
  v70 = v19;
  objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("RequiredExtraPaddingForGDC")), "floatValue");
  v25 = v24;
  objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("MinScaleFactor")), "floatValue");
  v27 = v26;
  objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("MaxScaleFactor")), "floatValue");
  v29 = v28;
  v30 = (double)objc_msgSend(v17, "outputWidth") / width;
  if (v30 < 1.0)
    v30 = 1.0;
  v31 = v30;
  rect1 = height;
  v32 = (double)objc_msgSend(v17, "outputHeight") / height;
  if (v32 < 1.0)
    v32 = 1.0;
  v33 = v32;
  if ((float)(v31 - v25) >= 1.0)
    v34 = v31 - v25;
  else
    v34 = 1.0;
  if ((float)(v33 - v25) >= 1.0)
    v35 = v33 - v25;
  else
    v35 = 1.0;
  if ((objc_msgSend((id)objc_msgSend(a7, "captureSettings"), "captureFlags") & 0x10) != 0
    && objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("QSub")))
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("QSub")), "objectForKeyedSubscript:", CFSTR("MinScaleFactor")), "floatValue");
    v27 = v36;
  }
  v37 = v25 + v29;
  v76 = a6;
  v38 = objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F80]);
  v39 = v38;
  v40 = v34 > 0.0;
  if (v35 <= 0.0)
    v40 = 0;
  if (v38)
    v40 = 1;
  v41 = v77 != 2 || v40;
  if (v31 >= v33)
    v42 = v33;
  else
    v42 = v31;
  if (v42 < v27 && v38 == 0)
    LODWORD(v15) = 0;
  else
    LODWORD(v15) = v41;
  if (dword_1EE6BE838)
  {
    v75 = (int)v15;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    LODWORD(v15) = v75;
  }
  if (v39)
  {
    if (a8 && a9)
    {
      v45 = (char)v15;
      if (!FigCFDictionaryGetCGRectIfPresent())
      {
        v81 = (CGPoint)0;
        __asm { FMOV            V0.2D, #1.0 }
        v82 = _Q0;
      }
      if (!FigCFDictionaryGetCGRectIfPresent())
      {
        v80.origin = 0uLL;
        __asm { FMOV            V0.2D, #1.0 }
        v80.size = _Q0;
      }
      if (dword_1EE6BE838)
      {
        v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      LOBYTE(v15) = v45;
      goto LABEL_83;
    }
LABEL_67:
    if (!a8)
      return (char)v15;
    goto LABEL_83;
  }
  if ((v77 - 3) < 3)
  {
LABEL_70:
    v56 = (char)v15;
    v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    LOBYTE(v15) = v56;
    goto LABEL_67;
  }
  if (v77 == 1)
  {
    if (!dword_1EE6BE838)
      goto LABEL_67;
    goto LABEL_70;
  }
  if (v77 != 2)
    goto LABEL_67;
  if (!(_DWORD)v15)
    goto LABEL_67;
  LOBYTE(v15) = 1;
  if (!a8 || !a9)
    goto LABEL_67;
  if (!objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]))
  {
    v52 = x;
    v53 = y;
    goto LABEL_72;
  }
  v52 = x;
  v53 = y;
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
LABEL_72:
    if (v31 < v33)
      v31 = v33;
    if (v31 <= v37)
      v58 = v34;
    else
      v58 = v37;
    if (v31 <= v37)
      v59 = v35;
    else
      v59 = v37;
    v60 = (float)((float)objc_msgSend(v17, "outputWidth", v68, v69) / v58);
    v61 = (float)((float)objc_msgSend(v17, "outputHeight") / v59);
    v88.size.width = (double)a5.var0;
    v88.size.height = (double)a5.var1;
    v88.origin.x = 0.0;
    v88.origin.y = 0.0;
    v86.origin.x = v52 - (v60 - width) * 0.5;
    v86.origin.y = v53 - (v61 - rect1) * 0.5;
    v86.size.width = v60;
    v86.size.height = v61;
    v87 = CGRectIntersection(v86, v88);
    v81.x = v87.origin.x;
    v81.y = v87.origin.y;
    v82.width = v87.size.width;
    v82.height = v87.size.height;
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(a5.var0, *(uint64_t *)&a5 >> 32, 0.0, 0.0, 1.0, 1.0, v70);
    v80.origin.x = v62;
    v80.origin.y = v63;
    v80.size.width = v64;
    v80.size.height = v65;
    if (dword_1EE6BE838)
    {
      v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_82;
  }
  v54 = objc_msgSend((id)objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40]), "intValue");
  v55 = objc_msgSend((id)objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), "intValue");
  if (v54 && v55)
  {
    v52 = x + ((double)v54 - *(double *)&v71) * 0.5;
    v53 = y + ((double)v55 - *((double *)&v71 + 1)) * 0.5;
    goto LABEL_72;
  }
  FigDebugAssert3();
LABEL_82:
  LOBYTE(v15) = 1;
LABEL_83:
  a8->origin = v81;
  a8->size = v82;
  *a9 = v80;
  return (char)v15;
}

+ (BOOL)doDeepZoomTransferForSampleBuffer:(opaqueCMSampleBuffer *)a3 sensorConfiguration:(id)a4 intermediateZoomSrcRectOut:(CGRect *)a5
{
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CFTypeRef v12;
  void *v13;
  CFTypeRef v14;
  void *v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL result;

  if (dzpc_initializeTrace_sInitializeTraceOnceToken != -1)
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_119);
  v8 = *MEMORY[0x1E0C9D628];
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (a3
    && a4
    && (v12 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0
    && (v13 = (void *)v12, (v14 = CMGetAttachment(a3, CFSTR("StillSettings"), 0)) != 0))
  {
    if (a5)
    {
      v15 = (void *)v14;
      if (objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1)
      {
        v16 = BWPixelBufferDimensionsFromSampleBuffer(a3);
        v8 = +[BWDeepZoomProcessorControllerConfiguration quadraQSubIntermediateZoomRectForDimensions:metadata:sensorConfiguration:stillImageSettings:]((uint64_t)BWDeepZoomProcessorControllerConfiguration, v16, v13, a4, v15);
        v9 = v17;
        v10 = v18;
        v11 = v19;
        v20 = 1;
        if (!CGRectIsNull(*a5))
        {
          if (dword_1EE6BE838)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            v20 = 1;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      else
      {
        v20 = 1;
      }
      goto LABEL_13;
    }
    return 1;
  }
  else
  {
    v20 = 0;
    result = 0;
    if (a5)
    {
LABEL_13:
      a5->origin.x = v8;
      a5->origin.y = v9;
      result = v20;
      a5->size.width = v10;
      a5->size.height = v11;
    }
  }
  return result;
}

+ (double)quadraQSubIntermediateZoomRectForDimensions:(void *)a3 metadata:(void *)a4 sensorConfiguration:(void *)a5 stillImageSettings:
{
  double v9;
  int v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double width;
  double height;
  float v19;
  float v20;
  double v21;
  __int128 v23;
  __int128 v24;
  CGRect v25;

  objc_opt_self();
  v9 = *MEMORY[0x1E0C9D628];
  if (a3 && a4 && a5)
  {
    v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
    v11 = objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "captureFlags") & 0x200000000;
    if (v10 == 1 && v11 != 0)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("DeepZoomParameters")))
      {
        if ((_DWORD)a2)
        {
          if (HIDWORD(a2))
          {
            v13 = objc_msgSend(a5, "requestedSettings");
            if (v13)
            {
              v14 = (void *)v13;
              v23 = *MEMORY[0x1E0C9D648];
              v24 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
              FigCFDictionaryGetCGRectIfPresent();
              v15 = (double)objc_msgSend(v14, "outputWidth");
              v16 = v15 / (double)objc_msgSend(v14, "outputHeight");
              FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a2, a2 >> 32, *(CGFloat *)&v23, *((CGFloat *)&v23 + 1), *(CGFloat *)&v24, *((CGFloat *)&v24 + 1), v16);
              width = v25.size.width;
              height = v25.size.height;
              if (!CGRectIsEmpty(v25)
                && width <= (double)objc_msgSend(v14, "outputWidth")
                && height <= (double)objc_msgSend(v14, "outputHeight"))
              {
                v19 = (double)(int)a2 / width;
                v20 = (double)SHIDWORD(a2) / height;
                if (v19 < v20)
                  v19 = (double)SHIDWORD(a2) / height;
                if (v19 < 2.0)
                {
                  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a2, a2 >> 32, 0.125, 0.125, 0.75, 0.75, v16);
                  return v21;
                }
              }
            }
          }
        }
      }
    }
  }
  return v9;
}

+ (int)deepZoomProcessingModeForType:(int)a3 sensorConfiguration:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if ((a3 - 4) < 0xFFFFFFFD || a4 == 0)
  {
    LODWORD(v6) = 0;
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("DeepZoomParameters"));
    if (v6)
    {
      v7 = v6;
      v10[0] = &unk_1E49FC9D8;
      v10[1] = &unk_1E49FC9F0;
      v11[0] = CFSTR("Lite");
      v11[1] = CFSTR("Standard");
      v10[2] = &unk_1E49FCA08;
      v11[2] = CFSTR("Transfer");
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
      v6 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5));
      if (v6)
      {
        if ((_DWORD)v5 == 3)
        {
          LODWORD(v6) = 3;
        }
        else
        {
          v6 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", v6);
          if (v6)
          {
            if (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UpsamplingDisabled")), "BOOLValue"))LODWORD(v6) = 2;
            else
              LODWORD(v6) = 1;
          }
        }
      }
    }
  }
  return (int)v6;
}

- (BWVideoFormat)inputFormat
{
  return self->_inputFormat;
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

- (int)version
{
  return self->_version;
}

- (int)mode
{
  return self->_mode;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end
