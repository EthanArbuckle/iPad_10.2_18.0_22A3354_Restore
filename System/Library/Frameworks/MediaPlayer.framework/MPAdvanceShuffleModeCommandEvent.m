@implementation MPAdvanceShuffleModeCommandEvent

- (MPAdvanceShuffleModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPAdvanceShuffleModeCommandEvent *v9;
  void *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MPAdvanceShuffleModeCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v12, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4C818]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_preservesShuffleMode = objc_msgSend(v10, "BOOLValue");

  }
  return v9;
}

- (BOOL)preservesShuffleMode
{
  return self->_preservesShuffleMode;
}

@end
