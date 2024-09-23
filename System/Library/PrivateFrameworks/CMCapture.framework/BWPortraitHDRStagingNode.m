@implementation BWPortraitHDRStagingNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWPortraitHDRStagingNode)init
{
  BWPortraitHDRStagingNode *v2;
  BWNodeInput *v3;
  BWVideoFormatRequirements *v4;
  BWNodeOutput *v5;
  BWVideoFormatRequirements *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWPortraitHDRStagingNode;
  v2 = -[BWNode init](&v8, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v3, "setFormatRequirements:", v4);

    -[BWNodeInput setPassthroughMode:](v3, "setPassthroughMode:", 1);
    -[BWNode addInput:](v2, "addInput:", v3);

    v5 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v2);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v5, "setFormatRequirements:", v6);
    -[BWNodeOutput setPassthroughMode:](v5, "setPassthroughMode:", 1);

    -[BWNode addOutput:](v2, "addOutput:", v5);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  opaqueCMSampleBuffer *stagedBuffer;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  stagedBuffer = self->_stagedBuffer;
  if (stagedBuffer)
    CFRelease(stagedBuffer);
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWPortraitHDRStagingNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Coordinator");
}

- (id)nodeSubType
{
  return CFSTR("PortraitHDRStagingNode");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)bufferReceivedWithFlags:(unsigned int)a3 error:(int)a4
{
  char v5;
  os_unfair_lock_s *p_lock;
  opaqueCMSampleBuffer *v8;
  CFTypeRef v9;
  opaqueCMSampleBuffer *stagedBuffer;

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v5 & 0x40 | a4 && (self->_passthroughBuffer = 1, (v8 = self->_stagedBuffer) != 0))
  {
    v9 = CFRetain(v8);
    stagedBuffer = self->_stagedBuffer;
    if (stagedBuffer)
    {
      CFRelease(stagedBuffer);
      self->_stagedBuffer = 0;
    }
    os_unfair_lock_unlock(p_lock);
    if (v9)
    {
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v9);
      CFRelease(v9);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  int v6;
  void *v7;
  int64_t settingsID;
  CFTypeRef v9;
  void *v10;
  opaqueCMSampleBuffer *stagedBuffer;

  v6 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntegerValue");
  v7 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  os_unfair_lock_lock(&self->_lock);
  settingsID = self->_settingsID;
  if (settingsID != objc_msgSend(v7, "settingsID"))
  {
    self->_passthroughBuffer = 0;
    self->_settingsID = objc_msgSend(v7, "settingsID");
  }
  v9 = CMGetAttachment(a3, CFSTR("PhotoManifest"), 0);
  if (v6
    && (v10 = (void *)v9, objc_msgSend(v7, "deliverOriginalImage"))
    && (objc_msgSend(v7, "captureFlags") & 0x800) != 0
    && (unint64_t)objc_msgSend((id)objc_msgSend(v10, "photoDescriptors"), "count") >= 3
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "photoDescriptors"), "objectAtIndexedSubscript:", 2), "processingFlags") ^ v6) & 3) == 0&& !self->_passthroughBuffer)
  {
    stagedBuffer = self->_stagedBuffer;
    self->_stagedBuffer = a3;
    if (a3)
      CFRetain(a3);
    if (stagedBuffer)
      CFRelease(stagedBuffer);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWPortraitHDRStagingNode bufferReceivedWithFlags:error:](self, "bufferReceivedWithFlags:error:", 0, objc_msgSend(a3, "errorCode"));
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
}

@end
