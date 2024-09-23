@implementation MPChangeShuffleModeCommandEvent

- (MPChangeShuffleModeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPChangeShuffleModeCommandEvent *v9;
  void *v10;
  unsigned int v11;
  int64_t v12;
  void *v13;
  objc_super v15;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPChangeShuffleModeCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v15, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CCE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v11 > 3)
      v12 = 0;
    else
      v12 = qword_193F0BDD0[v11];
    v9->_shuffleType = v12;
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4C818]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_preservesShuffleMode = objc_msgSend(v13, "BOOLValue");

  }
  return v9;
}

- (MPShuffleType)shuffleType
{
  return self->_shuffleType;
}

- (BOOL)preservesShuffleMode
{
  return self->_preservesShuffleMode;
}

@end
