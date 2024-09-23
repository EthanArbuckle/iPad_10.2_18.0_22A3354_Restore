@implementation JFXAVMediaVideoTrackReaderSample

- (JFXAVMediaVideoTrackReaderSample)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 duration:(id *)a4
{
  JFXAVMediaVideoTrackReaderSample *v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)JFXAVMediaVideoTrackReaderSample;
  v6 = -[JFXAVMediaVideoTrackReaderSample init](&v9, sel_init);
  if (v6)
  {
    if (a3)
      CFRetain(a3);
    v7 = *(_OWORD *)&a4->var0;
    v6->_duration.epoch = a4->var3;
    *(_OWORD *)&v6->_duration.value = v7;
    v6->_sampleBufferRef = a3;
  }
  return v6;
}

- (JFXAVMediaVideoTrackReaderSample)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x24BDC0D88];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  return -[JFXAVMediaVideoTrackReaderSample initWithSampleBuffer:duration:](self, "initWithSampleBuffer:duration:", a3, &v4);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_sampleBufferRef);
  v3.receiver = self;
  v3.super_class = (Class)JFXAVMediaVideoTrackReaderSample;
  -[JFXAVMediaVideoTrackReaderSample dealloc](&v3, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp((CMTime *)retstr, -[JFXAVMediaVideoTrackReaderSample sampleBufferRef](self, "sampleBufferRef"));
}

- ($70930193D4F448A53BB9343C0237EB5F)timeRange
{
  CMTime v6;
  CMTime start;

  -[JFXAVMediaVideoTrackReaderSample presentationTimeStamp](self, "presentationTimeStamp");
  -[JFXAVMediaVideoTrackReaderSample duration](self, "duration");
  return ($70930193D4F448A53BB9343C0237EB5F *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v6);
}

- (opaqueCMSampleBuffer)sampleBufferRef
{
  return self->_sampleBufferRef;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

@end
