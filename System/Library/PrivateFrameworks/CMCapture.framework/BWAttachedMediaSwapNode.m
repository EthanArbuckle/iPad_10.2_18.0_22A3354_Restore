@implementation BWAttachedMediaSwapNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWAttachedMediaSwapNode)initWithPrimaryFormatToAttachedMediaKey:(id)a3 attachedMediaKeyToPrimaryFormat:(id)a4 sampleBufferAttachmentsToTransfer:(id)a5 generatesDroppedSampleMarkerBuffers:(BOOL)a6
{
  BWAttachedMediaSwapNode *v11;
  BWNodeInput *v12;
  BWNodeOutput *v13;
  BWNodeInputMediaConfiguration *v14;
  BWNodeOutputMediaConfiguration *v15;
  BWNodeInputMediaConfiguration *v16;
  BWNodeOutputMediaConfiguration *v17;
  BWNodeInputMediaConfiguration *v18;
  BWNodeOutputMediaConfiguration *v19;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  objc_super v24;

  if (!a3 || !a4)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("Neither attached media key may be nil");
    goto LABEL_13;
  }
  if (objc_msgSend(a3, "isEqualToString:", a4))
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("The primaryFormatToAttachedMediaKey must be different from the attachedMediaKeyToPrimaryFormat");
    goto LABEL_13;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("The primaryFormatToAttachedMediaKey cannot be BWAttachedMediaKey_PrimaryFormat");
    goto LABEL_13;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("The attachedMediaKeyToPrimaryFormat cannot be BWAttachedMediaKey_PrimaryFormat");
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0, a6));
  }
  v24.receiver = self;
  v24.super_class = (Class)BWAttachedMediaSwapNode;
  v11 = -[BWNode init](&v24, sel_init);
  if (v11)
  {
    v11->_primaryFormatToAttachedMediaKey = (NSString *)a3;
    v11->_attachedMediaKeyToPrimaryFormat = (NSString *)a4;
    v11->_sampleBufferAttachmentsToTransfer = (NSArray *)a5;
    v11->_generatesDroppedSampleMarkerBuffers = a6;
    v12 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v11);
    -[BWNode addInput:](v11, "addInput:", v12);

    v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v11);
    -[BWNode addOutput:](v11, "addOutput:", v13);

    v14 = -[BWNodeInput primaryMediaConfiguration](v11->super._input, "primaryMediaConfiguration");
    -[BWNodeInput formatRequirements](v11->super._input, "formatRequirements");
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", objc_alloc_init((Class)objc_opt_class()));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v14, "setPassthroughMode:", 1);
    v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v15, "setPassthroughMode:", 1);
    -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v15, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", CFSTR("PrimaryFormat"));
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v11->super._output, "setMediaConfiguration:forAttachedMediaKey:", v15, a3);
    v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInput formatRequirements](v11->super._input, "formatRequirements");
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", objc_alloc_init((Class)objc_opt_class()));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 1);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v11->super._input, "setMediaConfiguration:forAttachedMediaKey:", v16, a4);
    v17 = -[BWNodeOutput primaryMediaConfiguration](v11->super._output, "primaryMediaConfiguration");
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 1);
    -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v17, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", a4);
    v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v18, "setPassthroughMode:", 1);
    -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v11->super._input, "setUnspecifiedAttachedMediaConfiguration:", v18);
    v19 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v19, "setPassthroughMode:", 1);
    -[BWNodeOutput setUnspecifiedAttachedMediaConfiguration:](v11->super._output, "setUnspecifiedAttachedMediaConfiguration:", v19);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAttachedMediaSwapNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("AttachedMediaSplitNode");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  __CFString *primaryFormatToAttachedMediaKey;
  BWNodeOutputMediaProperties *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat"), a4))
  {
    primaryFormatToAttachedMediaKey = (__CFString *)self->_primaryFormatToAttachedMediaKey;
  }
  else if (objc_msgSend(a5, "isEqualToString:", self->_attachedMediaKeyToPrimaryFormat))
  {
    primaryFormatToAttachedMediaKey = CFSTR("PrimaryFormat");
  }
  else
  {
    primaryFormatToAttachedMediaKey = (__CFString *)a5;
  }
  v9 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", primaryFormatToAttachedMediaKey);
  v10 = -[__CFString isEqualToString:](primaryFormatToAttachedMediaKey, "isEqualToString:", CFSTR("PrimaryFormat"));
  if (v9)
  {
    if ((v10 & 1) == 0)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, primaryFormatToAttachedMediaKey, a5);
      goto LABEL_13;
    }
  }
  else
  {
    if (v10)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output unexpectedly has no mediaProperties for the primary format (provided media key was %@)"), self, a5, v12);
LABEL_13:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
    }
    v9 = objc_alloc_init(BWNodeOutputMediaProperties);
    -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](self->super._output, "_setMediaProperties:forAttachedMediaKey:", v9, primaryFormatToAttachedMediaKey);
  }
  -[BWNodeOutputMediaProperties setResolvedFormat:](v9, "setResolvedFormat:", a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  char v7;
  int v8;
  CMAttachmentBearerRef v9;
  const void *AttachedMedia;
  CFTypeRef v11;
  NSArray *sampleBufferAttachmentsToTransfer;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const __CFString *v17;
  CFTypeRef v18;
  __int128 v19;
  __int128 v20;
  OSStatus v21;
  opaqueCMSampleBuffer *v22;
  opaqueCMSampleBuffer *v23;
  OSStatus v24;
  CMSampleTimingInfo *sampleTimingArray;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMSampleTimingInfo attachmentModeOut;
  CMAttachmentBearerRef target;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("AttachedMediaSwapPlaceholderSampleBuffer"), 0), "BOOLValue");
  v8 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("FileWriterAction"), 0), "isEqualToString:", 0x1E495A158);
  if (!BWSampleBufferIsMarkerBuffer(a3) || (v7 & 1) != 0 || v8)
  {
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)self->_attachedMediaKeyToPrimaryFormat);
    if (AttachedMedia && (v11 = CFRetain(AttachedMedia)) != 0)
    {
      v9 = v11;
      BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)self->_attachedMediaKeyToPrimaryFormat);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      sampleBufferAttachmentsToTransfer = self->_sampleBufferAttachmentsToTransfer;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](sampleBufferAttachmentsToTransfer, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(sampleBufferAttachmentsToTransfer);
            v17 = *(const __CFString **)(*((_QWORD *)&v27 + 1) + 8 * i);
            LODWORD(attachmentModeOut.duration.value) = 0;
            v18 = CMGetAttachment(a3, v17, (CMAttachmentMode *)&attachmentModeOut);
            if (v18)
              CMSetAttachment(v9, v17, v18, attachmentModeOut.duration.value);
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](sampleBufferAttachmentsToTransfer, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v14);
      }
    }
    else
    {
      target = 0;
      v19 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
      *(_OWORD *)&attachmentModeOut.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
      *(_OWORD *)&attachmentModeOut.decodeTimeStamp.value = v19;
      attachmentModeOut.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
      v20 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
      *(_OWORD *)&attachmentModeOut.duration.value = *MEMORY[0x1E0CA2E90];
      *(_OWORD *)&attachmentModeOut.duration.epoch = v20;
      CMSampleBufferGetPresentationTimeStamp(&attachmentModeOut.presentationTimeStamp, a3);
      v21 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &attachmentModeOut, 0, 0, (CMSampleBufferRef *)&target);
      if (v21)
      {
        v24 = v21;
        fig_log_get_emitter();
        v26 = v4;
        LODWORD(sampleTimingArray) = v24;
        FigDebugAssert3();
      }
      else
      {
        CMSetAttachment(target, CFSTR("AttachedMediaSwapPlaceholderSampleBuffer"), (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
      }
      v9 = target;
      if (!target)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return;
      }
    }
    BWSampleBufferPropagateAttachedMedia(a3, v9);
    BWSampleBufferRemoveAllAttachedMedia(a3);
    if ((v7 & 1) == 0)
      BWSampleBufferSetAttachedMedia(v9, (uint64_t)self->_primaryFormatToAttachedMediaKey, (uint64_t)a3);
  }
  else
  {
    v9 = CFRetain(a3);
    if (!v9)
      return;
  }
  if (self->_generatesDroppedSampleMarkerBuffers
    && objc_msgSend((id)CMGetAttachment(v9, CFSTR("SampleDataToBeDropped"), 0), "BOOLValue"))
  {
    if (CMGetAttachment(v9, CFSTR("SampleDataToBeDroppedEmitSampleBufferSemaphores"), 0))
    {
      v22 = +[BWNodeInput newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:](BWNodeInput, "newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:", v9);
      if (v22)
      {
        v23 = v22;
        -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v22);
        CFRelease(v23);
      }
    }
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v9, sampleTimingArray, v26);
  }
  CFRelease(v9);
}

@end
