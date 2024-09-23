@implementation MPPreloadPlaybackSessionCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_supportedSessionTypes, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_supportedSessionTypes, *MEMORY[0x1E0D4C880]);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSessionTypes, 0);
}

- (void)setSupportedSessionTypes:(id)a3
{
  NSArray *v4;
  NSArray *supportedSessionTypes;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_supportedSessionTypes, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    supportedSessionTypes = self->_supportedSessionTypes;
    self->_supportedSessionTypes = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (NSArray)supportedSessionTypes
{
  return self->_supportedSessionTypes;
}

@end
