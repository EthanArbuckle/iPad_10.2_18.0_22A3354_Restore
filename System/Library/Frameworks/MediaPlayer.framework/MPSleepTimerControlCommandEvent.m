@implementation MPSleepTimerControlCommandEvent

- (MPSleepTimerControlCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPSleepTimerControlCommandEvent *v9;
  uint64_t v10;
  NSNumber *time;
  void *v12;
  uint64_t v13;
  int64_t v14;
  objc_super v16;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSleepTimerControlCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v16, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CD00]);
    v10 = objc_claimAutoreleasedReturnValue();
    time = v9->_time;
    v9->_time = (NSNumber *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCF8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue") - 1;
    if (v13 < 3)
      v14 = v13 + 1;
    else
      v14 = 0;
    v9->_stopMode = v14;

  }
  return v9;
}

- (NSNumber)time
{
  return self->_time;
}

- (NSNumber)fireDate
{
  return self->_fireDate;
}

- (int64_t)stopMode
{
  return self->_stopMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

@end
