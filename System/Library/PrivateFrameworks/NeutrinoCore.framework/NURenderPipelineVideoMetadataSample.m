@implementation NURenderPipelineVideoMetadataSample

- (id)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  time = (CMTime)self->_frameTime;
  v5 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p frameTime: %@, Metadata Group: %p>"), v4, self, v5, self->_metadataGroup);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NURenderPipelineVideoMetadataSample)initWithFrameTime:(id *)a3 metadataGroup:(id)a4
{
  id v7;
  NURenderPipelineVideoMetadataSample *v8;
  NURenderPipelineVideoMetadataSample *v9;
  __int128 v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NURenderPipelineVideoMetadataSample;
  v8 = -[NURenderPipelineVideoMetadataSample init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a3->var0;
    v8->_frameTime.epoch = a3->var3;
    *(_OWORD *)&v8->_frameTime.value = v10;
    objc_storeStrong((id *)&v8->_metadataGroup, a4);
  }

  return v9;
}

- (AVTimedMetadataGroup)metadataGroup
{
  return self->_metadataGroup;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataGroup, 0);
}

@end
