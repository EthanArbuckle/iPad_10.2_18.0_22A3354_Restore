@implementation BWFlexGTCNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWFlexGTCNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 metalCommandQueue:(id)a5
{
  BWFlexGTCNode *v8;
  BWFlexGTCNode *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BWNodeInput *v14;
  BWVideoFormatRequirements *v15;
  void *v16;
  BWNodeOutput *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)BWFlexGTCNode;
  v8 = -[BWNode init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_enableHighlightAdjustment = 1;
    v8->_commandQueue = (MTLCommandQueue *)a5;
    if (a3 && (v9->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3, a4))
    {
      v9->_sensorIDDictionaryByPortType = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a4, "count"));
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(a4);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_sensorIDDictionaryByPortType, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i)), "sensorIDDictionary"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          }
          v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }
      v14 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v9);
      v15 = objc_alloc_init(BWVideoFormatRequirements);
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E49FFFC0);
      objc_msgSend(v16, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 3));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", v16);
      -[BWNodeInput setFormatRequirements:](v14, "setFormatRequirements:", v15);
      -[BWNodeInput setPassthroughMode:](v14, "setPassthroughMode:", 1);
      -[BWNode addInput:](v9, "addInput:", v14);
      v17 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v9);
      -[BWNodeOutput setFormatRequirements:](v17, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeOutput setPassthroughMode:](v17, "setPassthroughMode:", 1);
      -[BWNode addOutput:](v9, "addOutput:", v17);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BWFlexGTCNode _releaseResources]((id *)&self->super.super.isa);

  v3.receiver = self;
  v3.super_class = (Class)BWFlexGTCNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  if (a1)
  {

    a1[17] = 0;
    a1[12] = 0;

    a1[13] = 0;
    a1[14] = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWFlexGTCNode _releaseResources]((id *)&self->super.super.isa);
  v5.receiver = self;
  v5.super_class = (Class)BWFlexGTCNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v3;
  FigMetalContext *v4;
  CMIFlexGTCStage *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWFlexGTCNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v6, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_metalContext
    && ((v3 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class())) == 0
     || (v4 = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", v3, 0), (self->_metalContext = v4) == 0))|| !self->_cmiFlexGTCStage&& (v5 = (CMIFlexGTCStage *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08A98]), "initWithOptionalCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue")), (self->_cmiFlexGTCStage = v5) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v6;
  opaqueCMSampleBuffer *v7;
  CVImageBufferRef v8;
  __CVBuffer *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  uint64_t i;
  void *v28;
  float v29;
  CFTypeRef v30;
  void *v31;
  size_t Width;
  size_t Height;
  size_t v34;
  size_t v35;
  CFTypeRef v36;
  const void *v37;
  uint64_t v38;
  void *v39;
  double FinalCropRect;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  CGFloat x;
  CGFloat y;
  CGFloat v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CMIFlexGTCStage *cmiFlexGTCStage;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  const __CFString *key;
  opaqueCMSampleBuffer *sbuf;
  CGSize v72;
  CGPoint v73;
  CGRect rect;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  int v80;
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v82 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_49;
  sbuf = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E4936818);
  if (!sbuf)
    goto LABEL_42;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  if (!ImageBuffer)
    goto LABEL_49;
  v6 = ImageBuffer;
  v7 = a3;
  v8 = CMSampleBufferGetImageBuffer(a3);
  if (!v8)
    goto LABEL_49;
  v9 = v8;
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v10 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v10)
    goto LABEL_49;
  v11 = v10;
  v80 = 1;
  v79 = 0x424800003C03126FLL;
  if (!self->_enableHighlightAdjustment)
    goto LABEL_34;
  v12 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A40]);
  if (!v12)
    goto LABEL_49;
  objc_msgSend(v12, "floatValue");
  v14 = v13;
  v15 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06920]);
  if (!v15
    || (objc_msgSend(v15, "floatValue"),
        v17 = v16,
        v18 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]),
        v19 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D064A0]),
        (v20 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0])) == 0))
  {
LABEL_49:
    fig_log_get_emitter();
    v67 = v4;
    LODWORD(v66) = 0;
    goto LABEL_50;
  }
  v21 = v20;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v76;
    v25 = *MEMORY[0x1E0D06D58];
    v26 = 0.0;
    v72 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v73 = (CGPoint)*MEMORY[0x1E0C9D628];
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v76 != v24)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        rect.origin = v73;
        rect.size = v72;
        if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v28, "objectForKeyedSubscript:", v25), &rect))
        {
          v26 = v26 + rect.size.height * rect.size.width;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v23);
  }
  else
  {
    v26 = 0.0;
  }
  if (v14 < 2.21)
  {
    v7 = a3;
    if (v14 >= 1.67)
    {
      if (v26 < 0.0195 || v17 < 0.37)
      {
        v29 = 50.0;
        if (v26 < 0.01 || v17 < 0.65)
          goto LABEL_33;
      }
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  v7 = a3;
  if (v17 < 2.9)
  {
LABEL_31:
    v29 = 50.0;
    goto LABEL_33;
  }
  v29 = 5.0;
  if (v26 < 0.0225)
  {
    if (v26 >= 0.0197)
    {
LABEL_32:
      v29 = 15.0;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
LABEL_33:
  LODWORD(v79) = 994352038;
  *((float *)&v79 + 1) = v29;
LABEL_34:
  v30 = CMGetAttachment(v7, CFSTR("StillSettings"), 0);
  if (!v30)
    goto LABEL_46;
  v31 = (void *)v30;
  Width = CVPixelBufferGetWidth(v9);
  Height = CVPixelBufferGetHeight(v9);
  v34 = CVPixelBufferGetWidth(v6);
  v35 = CVPixelBufferGetHeight(v6);
  v36 = CMGetAttachment(sbuf, key, 0);
  if (!v36 || !self->_cmiFlexGTCStage)
    goto LABEL_46;
  v37 = v36;
  v38 = objc_msgSend(v31, "requestedSettings");
  if (!v38)
    goto LABEL_42;
  v39 = (void *)v38;
  FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v47 = (double)objc_msgSend(v39, "outputWidth");
  v48 = v47 / (double)objc_msgSend(v39, "outputHeight");
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((unint64_t)(double)Width, (unint64_t)(double)Height, FinalCropRect, v42, v44, v46, v48);
  x = v83.origin.x;
  y = v83.origin.y;
  v51 = v83.size.width;
  v52 = v83.size.height;
  if (CGRectIsNull(v83)
    || (v53 = FigCaptureMetadataUtilitiesGetFinalCropRect(),
        FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((unint64_t)(double)v34, (unint64_t)(double)v35, v53, v54, v55, v56, v48), v57 = v84.origin.x, v58 = v84.origin.y, v59 = v84.size.width, v60 = v84.size.height, CGRectIsNull(v84)))
  {
LABEL_46:
    fig_log_get_emitter();
    v67 = v4;
    LODWORD(v66) = 0;
LABEL_50:
    FigDebugAssert3();
    goto LABEL_42;
  }
  cmiFlexGTCStage = self->_cmiFlexGTCStage;
  v85.origin.x = x;
  v85.origin.y = y;
  v85.size.width = v51;
  v85.size.height = v52;
  v86 = CGRectIntegral(v85);
  v62 = v86.origin.x;
  v63 = v86.origin.y;
  v64 = v86.size.width;
  v65 = v86.size.height;
  v86.origin.x = v57;
  v86.origin.y = v58;
  v86.size.width = v59;
  v86.size.height = v60;
  v87 = CGRectIntegral(v86);
  if (!-[CMIFlexGTCStage computeFlexGTCWithSDRImage:gainMap:gainMapMetadata:config:cropRect:gainMapCropRect:](cmiFlexGTCStage, "computeFlexGTCWithSDRImage:gainMap:gainMapMetadata:config:cropRect:gainMapCropRect:", v9, v6, v37, &v79, v62, v63, v64, v65, v87.origin.x, v87.origin.y, v87.size.width, v87.size.height))CMSetAttachment(sbuf, key, v37, 1u);
LABEL_42:
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v66, v67);
}

@end
