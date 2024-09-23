@implementation BWPreviewHistogramNode

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (self->_msrHistogramsEnabled)
    -[BWPreviewHistogramNode _emitMSRHistogramFromSampleBuffer:]((uint64_t)self, a3);
  if (self->_ispHistogramsEnabled)
    -[BWPreviewHistogramNode _emitISPLumaHistogramFromSampleBuffer:]((uint64_t)self, a3);
}

- (void)_emitMSRHistogramFromSampleBuffer:(uint64_t)a1
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  const void *v8;
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef v10;

  if (a1)
  {
    v10 = 0;
    v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05DE0], 0);
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "length") / 3uLL;
      if (v6 < objc_msgSend(v5, "length")
        && (v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v5, "bytes"), v6)) != 0)
      {
        v8 = (const void *)v7;
        memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
        *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E18];
        sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, (CMSampleBufferRef)target);
        sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
        CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v10);
        if (v10)
        {
          CMSetAttachment(v10, (CFStringRef)*MEMORY[0x1E0D05DE8], v8, 1u);
          objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v10);
          if (v10)
            CFRelease(v10);
          return;
        }
        fig_log_get_emitter();
      }
      else
      {
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setMsrHistogramsEnabled:(BOOL)a3
{
  self->_msrHistogramsEnabled = a3;
}

- (void)setIspHistogramsEnabled:(BOOL)a3
{
  self->_ispHistogramsEnabled = a3;
}

- (BWPreviewHistogramNode)init
{
  BWPreviewHistogramNode *v2;
  BWPreviewHistogramNode *v3;
  BWNodeInput *v4;
  BWNodeOutput *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)BWPreviewHistogramNode;
  v2 = -[BWNode init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_msrHistogramsEnabled = 1;
    v2->_ispHistogramDownsamplingEnabled = 1;
    v4 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    -[BWNodeInput setFormatRequirements:](v4, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNode addInput:](v3, "addInput:", v4);
    v5 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v3);
    v8[0] = *MEMORY[0x1E0D085A0];
    -[BWNodeOutput setFormat:](v5, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1)));
    -[BWNode addOutput:](v3, "addOutput:", v5);
  }
  return v3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (id)nodeSubType
{
  return CFSTR("PreviewHistogram");
}

- (void)_emitISPLumaHistogramFromSampleBuffer:(uint64_t)a1
{
  void *v4;
  _DWORD *v5;
  uint64_t v6;
  _DWORD *v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  const void *v11;
  CMSampleTimingInfo sampleTimingArray;
  CMAttachmentBearerRef targeta;
  _BYTE v14[512];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06C38]);
    if (v4)
    {
      v5 = (_DWORD *)objc_msgSend(v4, "bytes");
      if (*v5 == 256)
      {
        if (*(_BYTE *)(a1 + 98))
        {
          v6 = 0;
          v7 = v5 + 2;
          do
          {
            *(_DWORD *)&v14[v6] = *v7 + *(v7 - 1);
            v6 += 4;
            v7 += 2;
          }
          while (v6 != 512);
          v8 = (void *)MEMORY[0x1E0C99D50];
          v9 = v14;
          v10 = 512;
        }
        else
        {
          v9 = v5 + 1;
          v8 = (void *)MEMORY[0x1E0C99D50];
          v10 = 1024;
        }
        v11 = (const void *)objc_msgSend(v8, "dataWithBytes:length:", v9, v10);
        targeta = 0;
        memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
        *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E18];
        sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, (CMSampleBufferRef)target);
        sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
        CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&targeta);
        if (targeta)
        {
          CMSetAttachment(targeta, (CFStringRef)*MEMORY[0x1E0D05DE8], v11, 1u);
          objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", targeta);
          if (targeta)
            CFRelease(targeta);
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
    }
  }
}

- (BOOL)msrHistogramsEnabled
{
  return self->_msrHistogramsEnabled;
}

- (BOOL)ispHistogramsEnabled
{
  return self->_ispHistogramsEnabled;
}

@end
