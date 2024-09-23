@implementation BWStillImagePortraitMetadataNode

- (BWStillImagePortraitMetadataNode)initWithNodeConfiguration:(id)a3 sdofRenderingVersion:(int)a4 sensorConfigurationsByPortType:(id)a5 defaultPortType:(id)a6 defaultZoomFactor:(float)a7
{
  BWStillImagePortraitMetadataNode *v12;
  BWStillImagePortraitMetadataNode *v13;
  void *v14;
  BWNodeInput *v15;
  BWVideoFormatRequirements *v16;
  BWNodeOutput *v17;
  BWVideoFormatRequirements *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BWStillImagePortraitMetadataNode;
  v12 = -[BWNode init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    if (a4 && a5)
    {
      v12->_sdofRenderingVersion = a4;
      v12->_sensorConfigurationsByPortType = (NSDictionary *)a5;
      v13->_defaultPortType = (NSString *)a6;
      v13->_defaultZoomFactor = a7;
      if (FigCapturePlatformSupportsUniversalCompression())
        v14 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A01730, objc_msgSend(a3, "maxLossyCompressionLevel"));
      else
        v14 = &unk_1E4A01730;
      v15 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v13);
      v16 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v16, "setSupportedPixelFormats:", v14);
      -[BWNodeInput setFormatRequirements:](v15, "setFormatRequirements:", v16);

      -[BWNodeInput setPassthroughMode:](v15, "setPassthroughMode:", 1);
      -[BWNode addInput:](v13, "addInput:", v15);

      v17 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v13);
      v18 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v17, "setFormatRequirements:", v18);

      -[BWNodeOutput setPassthroughMode:](v17, "setPassthroughMode:", 1);
      -[BWNode addOutput:](v13, "addOutput:", v17);

    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v13;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImagePortraitMetadataNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImagePortraitMetadataNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (-[BWStillImagePortraitMetadataNode _loadSDOFRenderingBundle]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadSDOFRenderingBundle
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 96);
    if (v2 >= 5)
      v3 = 5;
    else
      v3 = v2;
    v4 = BWLoadProcessorBundle((uint64_t)CFSTR("SDOFRendering"), v3);
    if (v4)
    {
      *(_QWORD *)(v1 + 128) = objc_msgSend(v4, "classNamed:", CFSTR("FigSDOFRenderingTuningParameters"));
      v1 = -[BWStillImagePortraitMetadataNode _loadSDOFRenderingTuningParametersForPortType:zoomFactorForPortType:](v1, *(void **)(v1 + 112), *(float *)(v1 + 120));
      if ((_DWORD)v1)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      return 4294954510;
    }
  }
  return v1;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  const __CFString *v6;
  void *v7;
  CFTypeRef v8;
  void *v9;
  void *v10;
  NSString *defaultPortType;
  int64_t v12;
  double height;
  float v19;
  int v20;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;

  if (BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth")))
  {
    v6 = (const __CFString *)*MEMORY[0x1E0D086F0];
    v7 = (void *)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D086F0], 0), "mutableCopy");
    if (!v7)
      goto LABEL_23;
    v8 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
    if (!v8)
      goto LABEL_23;
    v9 = (void *)v8;
    v10 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (-[NSDictionary count](self->_sensorConfigurationsByPortType, "count") < 2)
      defaultPortType = self->_defaultPortType;
    else
      defaultPortType = (NSString *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v12 = BWPixelBufferDimensionsFromSampleBuffer(a3);
    v27 = *MEMORY[0x1E0C9D628];
    v28 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    if (!FigCFDictionaryGetCGRectIfPresent())
    {
      v27 = 0uLL;
      __asm { FMOV            V0.2D, #1.0 }
      v28 = _Q0;
    }
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v12, v12 >> 32, *(CGFloat *)&v27, *((CGFloat *)&v27 + 1), *(CGFloat *)&v28, *((CGFloat *)&v28 + 1), (double)objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "outputWidth")/ (double)objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "outputHeight"));
    height = v29.size.height;
    if (CGRectIsNull(v29))
      goto LABEL_23;
    v19 = (float)objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "outputHeight") / height;
    v20 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
    if (v20)
      v19 = v19 / (float)((float)v20 * 0.5);
    objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D069C0]), "floatValue");
    if (v21 == 0.0)
      v21 = 1.0;
    v22 = v19 * v21;
    v23 = v22 >= 1.0 ? v22 : 1.0;
    if (-[NSString isEqualToString:](defaultPortType, "isEqualToString:", self->_currentPortType)
      && v23 == self->_currentZoomFactorForSDOFRenderingParameters
      || !-[BWStillImagePortraitMetadataNode _loadSDOFRenderingTuningParametersForPortType:zoomFactorForPortType:]((uint64_t)self, defaultPortType, v23))
    {
      BWPortraitUtilitiesAttachLumaNoiseLevelToSampleBuffer(a3, self->_sdofRenderingParameters);
      BWPortraitUtilitiesAttachSyntheticFocusRectangleToSampleBuffer(a3);
      v24 = -[FigSDOFRenderingTuningParameters encodeParametersForSampleBuffer:captureType:](self->_sdofRenderingTuningParameters, "encodeParametersForSampleBuffer:captureType:", a3, objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureType") == 11);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D08358]);
      v25 = (void *)MEMORY[0x1E0CB37E8];
      -[FigSDOFRenderingTuningParameters simulatedAperture](self->_sdofRenderingTuningParameters, "simulatedAperture");
      v26 = objc_msgSend(v25, "numberWithFloat:");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D08360]);
      -[BWStillImagePortraitMetadataNode _attachPortraitLightingEffectMetadataToDepthMetadata:portType:]((uint64_t)self, v7);
      CMSetAttachment(a3, v6, v7, 1u);
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D087C0], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sdofRenderingVersion), 1u);
    }
    else
    {
LABEL_23:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    v7 = 0;
  }

  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

- (uint64_t)_loadSDOFRenderingTuningParametersForPortType:(float)a3 zoomFactorForPortType:
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  double v8;
  id v9;
  uint64_t v10;
  id v11;

  if (result)
  {
    v5 = result;
    v6 = *(id *)(result + 136);

    *(_QWORD *)(v5 + 136) = 0;
    *(_DWORD *)(v5 + 144) = 0;

    *(_QWORD *)(v5 + 152) = 0;
    *(_QWORD *)(v5 + 160) = 0;
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 104), "objectForKeyedSubscript:", a2), "sensorIDDictionary");
    *(float *)&v8 = a3;
    v9 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v7, v8);
    *(_QWORD *)(v5 + 152) = v9;
    if (v9
      && (v10 = objc_msgSend(objc_alloc(*(Class *)(v5 + 128)), "initWithTuningDictionary:", *(_QWORD *)(v5 + 152)),
          (*(_QWORD *)(v5 + 160) = v10) != 0))
    {
      v11 = a2;
      result = 0;
      *(_QWORD *)(v5 + 136) = v11;
      *(float *)(v5 + 144) = a3;
    }
    else
    {
      return 4294954510;
    }
  }
  return result;
}

- (uint64_t)_attachPortraitLightingEffectMetadataToDepthMetadata:(uint64_t)result portType:(void *)a2
{
  double v3;
  uint64_t v4;

  if (result)
  {
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 104), "objectForKeyedSubscript:"), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("PortraitLightingParameters")), "objectForKeyedSubscript:", CFSTR("effectStrength")), "doubleValue");
    if (v3 != 0.0)
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      return objc_msgSend(a2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D08668]);
    }
  }
  return result;
}

@end
