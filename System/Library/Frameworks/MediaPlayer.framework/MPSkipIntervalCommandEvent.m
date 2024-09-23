@implementation MPSkipIntervalCommandEvent

- (MPSkipIntervalCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPSkipIntervalCommandEvent *v9;
  void *v10;
  double v11;
  objc_super v13;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPSkipIntervalCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v13, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CCF0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v9->_interval = v11;

  }
  return v9;
}

- (NSTimeInterval)interval
{
  return self->_interval;
}

@end
