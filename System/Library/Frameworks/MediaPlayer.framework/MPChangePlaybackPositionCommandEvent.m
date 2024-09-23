@implementation MPChangePlaybackPositionCommandEvent

- (MPChangePlaybackPositionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPChangePlaybackPositionCommandEvent *v9;
  void *v10;
  double v11;
  uint64_t v12;
  NSNumber *referenceTime;
  objc_super v15;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPChangePlaybackPositionCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v15, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CC28]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v9->_positionTime = v11;

    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CCB8]);
    v12 = objc_claimAutoreleasedReturnValue();
    referenceTime = v9->_referenceTime;
    v9->_referenceTime = (NSNumber *)v12;

  }
  return v9;
}

- (NSTimeInterval)positionTime
{
  return self->_positionTime;
}

- (NSNumber)referenceTime
{
  return self->_referenceTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTime, 0);
}

@end
