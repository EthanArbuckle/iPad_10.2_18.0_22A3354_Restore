@implementation MPSkipTrackCommandEvent

- (MPSkipTrackCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPSkipTrackCommandEvent *v9;
  void *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MPSkipTrackCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v12, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CCD0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_requestingDefermentToPlaybackQueuePosition = objc_msgSend(v10, "BOOLValue");

  }
  return v9;
}

- (BOOL)isRequestingDefermentToPlaybackQueuePosition
{
  return self->_requestingDefermentToPlaybackQueuePosition;
}

@end
