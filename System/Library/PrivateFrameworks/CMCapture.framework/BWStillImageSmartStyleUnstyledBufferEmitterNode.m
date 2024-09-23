@implementation BWStillImageSmartStyleUnstyledBufferEmitterNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageSmartStyleUnstyledBufferEmitterNode)init
{
  BWStillImageSmartStyleUnstyledBufferEmitterNode *v2;
  BWNodeInput *v3;
  BWNodeOutput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWStillImageSmartStyleUnstyledBufferEmitterNode;
  v2 = -[BWNode init](&v6, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    -[BWNodeInput setFormatRequirements:](v3, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v3, "setPassthroughMode:", 1);
    -[BWNode addInput:](v2, "addInput:", v3);

    v4 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v2);
    -[BWNodeOutput setFormatRequirements:](v4, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v4, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v2, "addOutput:", v4);

  }
  return v2;
}

- (id)nodeType
{
  return CFSTR("Coordinator");
}

- (id)nodeSubType
{
  return CFSTR("StillImageSmartStyleUnstyledBufferEmitter");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *AttachedMedia;
  uint64_t CopyIncludingMetadata;
  id v8;
  CMAttachmentBearerRef destination;

  destination = 0;
  if ((BWStillImageProcessingFlagsForSampleBuffer(a3) & 0x200000) != 0)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B278);
    if (AttachedMedia)
    {
      CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata(AttachedMedia, (CMSampleBufferRef *)&destination);
      if ((_DWORD)CopyIncludingMetadata)
      {
        v8 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", CopyIncludingMetadata, self, CMGetAttachment(a3, CFSTR("StillSettings"), 0), 0);
        -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v8);

      }
      else
      {
        CMPropagateAttachments(a3, destination);
        BWSampleBufferRemoveAttachedMedia(destination, 0x1E495B278);
        BWSampleBufferRemoveAttachedMedia(destination, 0x1E495B238);
        BWStillImageUnsetProcessingFlagsForSampleBuffer(destination, 0x200000);
        CMSetAttachment(destination, CFSTR("StillImageBufferFrameType"), &unk_1E49F8838, 1u);
        -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", destination);
      }
      if (destination)
        CFRelease(destination);
    }
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

@end
