@implementation VCAudioUnitSpatialContext

- (VCAudioUnitSpatialContext)initWithAudioSessionId:(unsigned int)a3 maxChannelCountMic:(unsigned int)a4 maxChannelCountSpeaker:(unsigned int)a5 spatialMetadata:(OpaqueCMBlockBuffer *)a6
{
  VCAudioUnitSpatialContext *v10;
  VCAudioUnitSpatialContext *v11;
  OpaqueCMBlockBuffer *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCAudioUnitSpatialContext;
  v10 = -[VCAudioUnitSpatialContext init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_audioSessionId = a3;
    v10->_maxChannelCountMic = a4;
    v10->_maxChannelCountSpeaker = a5;
    if (a6)
      v12 = (OpaqueCMBlockBuffer *)CFRetain(a6);
    else
      v12 = 0;
    v11->_spatialMetadata = v12;
  }
  return v11;
}

- (OpaqueCMBlockBuffer)spatialMetadata
{
  return self->_spatialMetadata;
}

- (void)setSpatialMetadata:(OpaqueCMBlockBuffer *)a3
{
  OpaqueCMBlockBuffer *spatialMetadata;
  OpaqueCMBlockBuffer *v6;

  spatialMetadata = self->_spatialMetadata;
  if (spatialMetadata != a3)
  {
    if (spatialMetadata)
      CFRelease(spatialMetadata);
    if (a3)
      v6 = (OpaqueCMBlockBuffer *)CFRetain(a3);
    else
      v6 = 0;
    self->_spatialMetadata = v6;
  }
}

- (void)dealloc
{
  OpaqueCMBlockBuffer *spatialMetadata;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  spatialMetadata = self->_spatialMetadata;
  if (spatialMetadata)
    CFRelease(spatialMetadata);
  v4.receiver = self;
  v4.super_class = (Class)VCAudioUnitSpatialContext;
  -[VCAudioUnitSpatialContext dealloc](&v4, sel_dealloc);
}

- (unsigned)audioSessionId
{
  return self->_audioSessionId;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  self->_audioSessionId = a3;
}

- (unsigned)maxChannelCountMic
{
  return self->_maxChannelCountMic;
}

- (void)setMaxChannelCountMic:(unsigned int)a3
{
  self->_maxChannelCountMic = a3;
}

- (unsigned)maxChannelCountSpeaker
{
  return self->_maxChannelCountSpeaker;
}

- (void)setMaxChannelCountSpeaker:(unsigned int)a3
{
  self->_maxChannelCountSpeaker = a3;
}

@end
