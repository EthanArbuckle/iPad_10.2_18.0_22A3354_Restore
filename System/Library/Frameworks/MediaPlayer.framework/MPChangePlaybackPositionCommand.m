@implementation MPChangePlaybackPositionCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0D4C780];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canBeControlledByScrubbing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0D4C8A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsReferencePosition);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPChangePlaybackPositionCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  MPChangePlaybackPositionCommand *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPChangePlaybackPositionCommand;
  result = -[MPRemoteCommand initWithMediaRemoteCommandType:](&v4, sel_initWithMediaRemoteCommandType_, *(_QWORD *)&a3);
  if (result)
  {
    result->_canBeControlledByScrubbing = 0;
    result->_supportsReferencePosition = 0;
  }
  return result;
}

- (void)setCanBeControlledByScrubbing:(BOOL)a3
{
  if (self->_canBeControlledByScrubbing != a3)
  {
    self->_canBeControlledByScrubbing = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setSupportsReferencePosition:(BOOL)a3
{
  if (self->_supportsReferencePosition != a3)
  {
    self->_supportsReferencePosition = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (id)newCommandEventWithPositionTime:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v10 = *MEMORY[0x1E0D4CC28];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", v5, v7);

  return v8;
}

- (BOOL)canBeControlledByScrubbing
{
  return self->_canBeControlledByScrubbing;
}

- (BOOL)supportsReferencePosition
{
  return self->_supportsReferencePosition;
}

@end
