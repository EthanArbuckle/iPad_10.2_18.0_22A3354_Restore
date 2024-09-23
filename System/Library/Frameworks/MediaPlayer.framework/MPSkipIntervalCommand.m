@implementation MPSkipIntervalCommand

- (id)_mediaRemoteCommandInfoOptions
{
  NSArray *preferredIntervals;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  preferredIntervals = self->_preferredIntervals;
  if (preferredIntervals)
  {
    v5 = *MEMORY[0x1E0D4C7F0];
    v6[0] = preferredIntervals;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (MPSkipIntervalCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  MPSkipIntervalCommand *v3;
  MPSkipIntervalCommand *v4;
  NSArray *preferredIntervals;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPSkipIntervalCommand;
  v3 = -[MPRemoteCommand initWithMediaRemoteCommandType:](&v7, sel_initWithMediaRemoteCommandType_, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
  {
    preferredIntervals = v3->_preferredIntervals;
    v3->_preferredIntervals = (NSArray *)&unk_1E31E64F0;

  }
  return v4;
}

- (void)setPreferredIntervals:(NSArray *)preferredIntervals
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;

  v6 = preferredIntervals;
  if (!-[NSArray isEqualToArray:](self->_preferredIntervals, "isEqualToArray:"))
  {
    v4 = (NSArray *)-[NSArray copy](v6, "copy");
    v5 = self->_preferredIntervals;
    self->_preferredIntervals = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (id)newCommandEventWithInterval:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v10 = *MEMORY[0x1E0D4CCF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", v5, v7);

  return v8;
}

- (NSArray)preferredIntervals
{
  return self->_preferredIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredIntervals, 0);
}

@end
