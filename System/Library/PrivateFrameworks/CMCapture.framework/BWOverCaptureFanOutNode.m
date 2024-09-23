@implementation BWOverCaptureFanOutNode

+ (void)initialize
{
  objc_opt_class();
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v10;

  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    v7 = (void *)CMGetAttachment(a3, CFSTR("RecordingSettings"), 0);
    if (v7)
    {
      v8 = objc_msgSend(v7, "spatialOverCaptureMovieURL");
      if (-[NSArray count](-[BWNode outputs](self, "outputs"), "count") >= 2)
      {
        v9 = 1;
        do
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9++), "setDiscardsSampleData:", v8 == 0);
        while (-[NSArray count](-[BWNode outputs](self, "outputs"), "count") > v9);
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWOverCaptureFanOutNode;
  -[BWFanOutNode renderSampleBuffer:forInput:](&v10, sel_renderSampleBuffer_forInput_, a3, a4);
}

@end
