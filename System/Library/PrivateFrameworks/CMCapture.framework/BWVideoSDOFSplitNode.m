@implementation BWVideoSDOFSplitNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWVideoSDOFSplitNode)init
{
  BWVideoSDOFSplitNode *v2;
  BWVideoSDOFSplitNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWVideoSDOFSplitNode;
  v2 = -[BWFanOutNode initWithFanOutCount:mediaType:](&v5, sel_initWithFanOutCount_mediaType_, 2, 1986618469);
  v3 = v2;
  if (v2)
  {
    v2->_originalOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v2, "outputs"), "objectAtIndexedSubscript:", 0);
    v3->_sdofOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v3, "outputs"), "objectAtIndexedSubscript:", 1);
  }
  return v3;
}

- (void)dealloc
{
  opaqueCMFormatDescription *originalVideoFormatDescription;
  objc_super v4;

  originalVideoFormatDescription = self->_originalVideoFormatDescription;
  if (originalVideoFormatDescription)
    CFRelease(originalVideoFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWVideoSDOFSplitNode;
  -[BWFanOutNode dealloc](&v4, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("VideoSDOFSplitNode");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  CFTypeRef v9;
  CFTypeRef cf;

  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    -[BWNodeOutput emitSampleBuffer:](self->_originalOutput, "emitSampleBuffer:", a3);
    v6 = 152;
LABEL_9:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "emitSampleBuffer:", a3);
    return;
  }
  v7 = (__CVBuffer *)CMGetAttachment(a3, CFSTR("UnfilteredPixelBuffer"), 0);
  if (!v7)
  {
    v6 = 144;
    goto LABEL_9;
  }
  v8 = v7;
  CFRetain(v7);
  CMRemoveAttachment(a3, CFSTR("UnfilteredPixelBuffer"));
  cf = 0;
  BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v8, (CFTypeRef *)&self->_originalVideoFormatDescription, (CMSampleBufferRef *)&cf);
  CFRelease(v8);
  if (cf)
  {
    v9 = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)cf, (CMSampleBufferRef *)&v9);
    CFRelease(cf);
    if (v9)
    {
      -[BWNodeOutput emitSampleBuffer:](self->_originalOutput, "emitSampleBuffer:");
      CFRelease(v9);
    }
  }
  -[BWNodeOutput emitSampleBuffer:](self->_sdofOutput, "emitSampleBuffer:", a3);
}

- (BWNodeOutput)originalOutput
{
  return self->_originalOutput;
}

- (BWNodeOutput)sdofOutput
{
  return self->_sdofOutput;
}

@end
