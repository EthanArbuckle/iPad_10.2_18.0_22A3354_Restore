@implementation BWDepthRotatorNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWDepthRotatorNode)initWithRotationDegrees:(int)a3 separateDepthComponentsEnabled:(BOOL)a4 depthProvidedAsAttachedMedia:(BOOL)a5
{
  _BOOL8 v5;
  BWDepthRotatorNode *v8;
  BWDepthRotatorNode *v9;
  BWNodeInput *v10;
  BWNodeInput *v11;
  BWVideoFormatRequirements *v12;
  BWVideoFormatRequirements *v13;
  BWNodeInputMediaConfiguration *v14;
  BWNodeOutput *v15;
  BWVideoFormatRequirements *v16;
  __CFString **v17;
  objc_super v19;

  v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BWDepthRotatorNode;
  v8 = -[BWNode init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_separateDepthComponentsEnabled = a4;
    v8->_depthProvidedAsAttachedMedia = v5;
    v10 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v8);
    v11 = v10;
    if (v5)
    {
      -[BWNodeInput setPassthroughMode:](v10, "setPassthroughMode:", 1);
      v12 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeInput setFormatRequirements:](v11, "setFormatRequirements:", v12);

    }
    else
    {
      -[BWNodeInput setPassthroughMode:](v10, "setPassthroughMode:", 0);
    }
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A008D8);
    if (v5)
    {
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", v13);
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v14, "setPassthroughMode:", 0);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v11, "setMediaConfiguration:forAttachedMediaKey:", v14, CFSTR("Depth"));
    }
    else
    {
      -[BWNodeInput setFormatRequirements:](v11, "setFormatRequirements:", v13);
    }
    -[BWNode addInput:](v9, "addInput:", v11);

    v15 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v9);
    v16 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v15, "setFormatRequirements:", v16);

    -[BWNodeOutput setPassthroughMode:](v15, "setPassthroughMode:", v5);
    if (v5)
    {
      if (v9->_separateDepthComponentsEnabled)
        v17 = BWAttachedMediaKey_DepthData_DX;
      else
        v17 = BWAttachedMediaKey_Depth;
      -[BWDepthRotatorNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:]((uint64_t)v9, v15, (uint64_t)*v17);
    }
    if (v9->_separateDepthComponentsEnabled)
      -[BWDepthRotatorNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:]((uint64_t)v9, v15, (uint64_t)CFSTR("DepthData_DY"));
    -[BWNode addOutput:](v9, "addOutput:", v15);

    v9->_rotationDegrees = a3;
  }
  return v9;
}

- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:
{
  BWNodeOutputMediaConfiguration *v5;

  if (result)
  {
    v5 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v5, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v5, "setProvidesPixelBufferPool:", 1);
    return objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v5, a3);
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputDepthFormatDescription;
  opaqueCMFormatDescription *outputDYFormatDescription;
  objc_super v5;

  outputDepthFormatDescription = self->_outputDepthFormatDescription;
  if (outputDepthFormatDescription)
    CFRelease(outputDepthFormatDescription);
  outputDYFormatDescription = self->_outputDYFormatDescription;
  if (outputDYFormatDescription)
    CFRelease(outputDYFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)BWDepthRotatorNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("DepthRotator");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  __CFString **v9;
  objc_super v10;

  if (self->_depthProvidedAsAttachedMedia)
  {
    if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
    {
      -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
      return;
    }
    if (!objc_msgSend(a5, "isEqualToString:", CFSTR("Depth")))
    {
      v10.receiver = self;
      v10.super_class = (Class)BWDepthRotatorNode;
      -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v10, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
      return;
    }
    if (!self->_separateDepthComponentsEnabled)
    {
      -[BWDepthRotatorNode _updateDepthOutputFormatRequirementsForInputFormat:pixelFormat:attachedMediaKey:]((uint64_t)self, a3, objc_msgSend(a3, "pixelFormat"), (uint64_t)CFSTR("Depth"));
      return;
    }
    v9 = BWAttachedMediaKey_DepthData_DX;
  }
  else
  {
    if (!self->_separateDepthComponentsEnabled)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("At this point CTM excepts separate depth components enabled when source nodes depth output are enabled."), 0));
    v9 = BWAttachedMediaKey_PrimaryFormat;
  }
  -[BWDepthRotatorNode _updateDepthOutputFormatRequirementsForInputFormat:pixelFormat:attachedMediaKey:]((uint64_t)self, a3, 825306677, (uint64_t)*v9);
  -[BWDepthRotatorNode _updateDepthOutputFormatRequirementsForInputFormat:pixelFormat:attachedMediaKey:]((uint64_t)self, a3, 1932996149, (uint64_t)CFSTR("DepthData_DY"));
}

- (uint64_t)_updateDepthOutputFormatRequirementsForInputFormat:(uint64_t)a3 pixelFormat:(uint64_t)a4 attachedMediaKey:
{
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "mediaConfigurationForAttachedMediaKey:", a4), "formatRequirements");
    v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    objc_msgSend(v7, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
    v8 = *(_DWORD *)(v6 + 124);
    if (v8 == 270 || v8 == 90)
    {
      objc_msgSend(v7, "setWidth:", objc_msgSend(a2, "height"));
      v9 = objc_msgSend(a2, "width");
    }
    else
    {
      objc_msgSend(v7, "setWidth:", objc_msgSend(a2, "width"));
      v9 = objc_msgSend(a2, "height");
    }
    return objc_msgSend(v7, "setHeight:", v9);
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *v4;
  opaqueCMSampleBuffer *AttachedMedia;
  __CVBuffer *ImageBuffer;
  __CFString **v8;
  __CVBuffer *v9;
  int rotationDegrees;
  size_t Width;
  size_t Height;
  size_t v13;
  __CVBuffer *v14;
  size_t v15;
  size_t v16;
  int v18;
  const __CFString *v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  __CVBuffer *v23;
  void *v24;
  uint64_t v25;
  CMAttachmentBearerRef *p_target;
  id v27;
  const __CFString *v28;
  CMAttachmentBearerRef v29;
  CMAttachmentBearerRef v30;
  CFTypeRef v31;
  int v32;
  __CVBuffer *v33;
  opaqueCMSampleBuffer *v34;
  CMTime v35;
  CMAttachmentBearerRef cf;
  CMAttachmentBearerRef target;

  v4 = a3;
  cf = 0;
  target = 0;
  ++self->_bufferSerialNumber;
  AttachedMedia = a3;
  if (self->_depthProvidedAsAttachedMedia)
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
  if (!AttachedMedia)
  {
    v9 = 0;
    ImageBuffer = 0;
    goto LABEL_47;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = 0;
    goto LABEL_40;
  }
  if (self->_depthProvidedAsAttachedMedia)
  {
    if (self->_separateDepthComponentsEnabled)
      v8 = BWAttachedMediaKey_DepthData_DX;
    else
      v8 = BWAttachedMediaKey_Depth;
  }
  else
  {
    v8 = BWAttachedMediaKey_PrimaryFormat;
  }
  v9 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", *v8), "livePixelBufferPool"), "newPixelBuffer");
  if (!v9)
  {
LABEL_39:
    ImageBuffer = 0;
LABEL_40:
    if (target)
    {
      CFRelease(target);
      target = 0;
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    CMSampleBufferGetPresentationTimeStamp(&v35, v4);
    v27 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F0D8, &v35);
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v27);

    goto LABEL_57;
  }
  rotationDegrees = self->_rotationDegrees;
  if (rotationDegrees <= 179)
  {
    if (rotationDegrees)
    {
      if (rotationDegrees != 90)
        goto LABEL_38;
      goto LABEL_18;
    }
LABEL_17:
    v34 = v4;
    Width = CVPixelBufferGetWidth(ImageBuffer);
    Height = CVPixelBufferGetHeight(ImageBuffer);
    goto LABEL_19;
  }
  if (rotationDegrees != 270)
  {
    if (rotationDegrees != 180)
    {
LABEL_38:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_39;
    }
    goto LABEL_17;
  }
LABEL_18:
  v34 = v4;
  Width = CVPixelBufferGetHeight(ImageBuffer);
  Height = CVPixelBufferGetWidth(ImageBuffer);
LABEL_19:
  v13 = Height;
  v14 = v9;
  v15 = CVPixelBufferGetWidth(v9);
  v16 = CVPixelBufferGetHeight(v14);
  if (Width == v15 && v13 == v16)
  {
    v18 = FigDepthConvertRotationAndMirroringToExifOrientation(self->_rotationDegrees, 0);
    FigDepthRotateBuffer(ImageBuffer, v14, v18);
    v9 = v14;
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer(AttachedMedia, v14, (CFTypeRef *)&self->_outputDepthFormatDescription, (CMSampleBufferRef *)&target))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      ImageBuffer = 0;
      v4 = v34;
      goto LABEL_40;
    }
    v33 = v14;
    v19 = (const __CFString *)*MEMORY[0x1E0D05C28];
    CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C28]);
    v20 = (void *)CMGetAttachment(AttachedMedia, v19, 0);
    v21 = (const void *)*MEMORY[0x1E0D06398];
    v22 = objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D06398]);
    v23 = (__CVBuffer *)v22;
    if (self->_separateDepthComponentsEnabled && !v22)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      ImageBuffer = 0;
    }
    else
    {
      if (!v22)
      {
        ImageBuffer = 0;
        v4 = v34;
        goto LABEL_37;
      }
      ImageBuffer = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("DepthData_DY")), "livePixelBufferPool"), "newPixelBuffer");
      if (ImageBuffer)
      {
        if (!FigDepthRotateBuffer(v23, ImageBuffer, v18))
        {
          v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v25 = *MEMORY[0x1E0D06390];
          if (objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D06390]))
            objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", v25), v25);
          if (!self->_separateDepthComponentsEnabled)
          {
            objc_msgSend(v24, "setObject:forKeyedSubscript:", ImageBuffer, v21);
            p_target = &target;
            v4 = v34;
            goto LABEL_46;
          }
          v4 = v34;
          if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(AttachedMedia, ImageBuffer, (CFTypeRef *)&self->_outputDYFormatDescription, (CMSampleBufferRef *)&cf))
          {
            CMRemoveAttachment(cf, v19);
            CMSetAttachment(cf, CFSTR("DepthPixelBufferType"), v21, 1u);
            if (objc_msgSend(v24, "count"))
            {
              p_target = &cf;
LABEL_46:
              v9 = v33;
              CMSetAttachment(*p_target, v19, v24, 1u);
              goto LABEL_47;
            }
LABEL_37:
            v9 = v33;
            goto LABEL_47;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
LABEL_77:
          v9 = v33;
          goto LABEL_40;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    v4 = v34;
    goto LABEL_77;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v32 = FigSignalErrorAt();
  ImageBuffer = 0;
  v9 = v14;
  v4 = v34;
  if (v32)
    goto LABEL_40;
LABEL_47:
  if (!self->_depthProvidedAsAttachedMedia)
  {
    if (!target
      || (BWSampleBufferSetAttachedMedia(target, (uint64_t)CFSTR("DepthData_DY"), (uint64_t)cf), (v30 = target) == 0))
    {
      v31 = 0;
      goto LABEL_60;
    }
    goto LABEL_56;
  }
  v28 = CFSTR("Depth");
  if (self->_separateDepthComponentsEnabled)
  {
    BWSampleBufferRemoveAttachedMedia(v4, (uint64_t)CFSTR("Depth"));
    BWSampleBufferSetAttachedMedia(v4, (uint64_t)CFSTR("DepthData_DX"), (uint64_t)target);
    v28 = CFSTR("DepthData_DY");
    v29 = cf;
  }
  else
  {
    v29 = target;
  }
  BWSampleBufferSetAttachedMedia(v4, (uint64_t)v28, (uint64_t)v29);
  if (v4)
  {
    v30 = v4;
LABEL_56:
    v31 = CFRetain(v30);
    goto LABEL_58;
  }
LABEL_57:
  v31 = 0;
LABEL_58:
  if (target)
    CFRelease(target);
LABEL_60:
  if (v9)
    CFRelease(v9);
  if (cf)
    CFRelease(cf);
  if (ImageBuffer)
    CFRelease(ImageBuffer);
  if (v31)
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v4);
    CFRelease(v31);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDepthRotatorNode;
  -[BWNode didReachEndOfDataForInput:](&v3, sel_didReachEndOfDataForInput_, a3);
}

@end
