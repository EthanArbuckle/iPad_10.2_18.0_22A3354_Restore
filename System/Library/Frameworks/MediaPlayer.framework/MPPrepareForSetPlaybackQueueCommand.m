@implementation MPPrepareForSetPlaybackQueueCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  NSDictionary *proactiveCommandOptions;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  proactiveCommandOptions = self->_proactiveCommandOptions;
  if (proactiveCommandOptions)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", proactiveCommandOptions, *MEMORY[0x1E0D4C820]);
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (MPPrepareForSetPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  MPPrepareForSetPlaybackQueueCommand *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPPrepareForSetPlaybackQueueCommand;
  result = -[MPRemoteCommand initWithMediaRemoteCommandType:](&v4, sel_initWithMediaRemoteCommandType_, *(_QWORD *)&a3);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveCommandOptions, 0);
}

- (void)setProactiveCommandOptions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *proactiveCommandOptions;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((objc_msgSend(v6, "isEqual:", self->_proactiveCommandOptions) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v4 = (NSDictionary *)objc_msgSend(v6, "copy");
    proactiveCommandOptions = self->_proactiveCommandOptions;
    self->_proactiveCommandOptions = v4;

    os_unfair_lock_unlock(&self->_lock);
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (NSDictionary)proactiveCommandOptions
{
  return self->_proactiveCommandOptions;
}

@end
