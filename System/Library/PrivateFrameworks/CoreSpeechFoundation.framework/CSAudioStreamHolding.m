@implementation CSAudioStreamHolding

- (CSAudioStreamHolding)initWithName:(id)a3 clientIdentity:(unint64_t)a4
{
  id v7;
  CSAudioStreamHolding *v8;
  CSAudioStreamHolding *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSAudioStreamHolding;
  v8 = -[CSAudioStreamHolding init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_clientIdentity = a4;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSAudioStreamHolding name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAudioStreamHolding dealloc]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Dealloc audioStreamHolding : %{public}@", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)CSAudioStreamHolding;
  -[CSAudioStreamHolding dealloc](&v6, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (NSString)recordModeLockUUIDString
{
  return self->_recordModeLockUUIDString;
}

- (void)setRecordModeLockUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_recordModeLockUUIDString, a3);
}

- (NSString)listeningMicIndicatorLockUUIDString
{
  return self->_listeningMicIndicatorLockUUIDString;
}

- (void)setListeningMicIndicatorLockUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_listeningMicIndicatorLockUUIDString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningMicIndicatorLockUUIDString, 0);
  objc_storeStrong((id *)&self->_recordModeLockUUIDString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
