@implementation MPSetPlaybackSessionCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_currentPlaybackSessionIdentifier, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_currentPlaybackSessionIdentifier, *MEMORY[0x1E0D4C7D8]);
  if (-[NSArray count](self->_exportableSessionTypes, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_exportableSessionTypes, *MEMORY[0x1E0D4C788]);
  if (-[NSArray count](self->_supportedSessionTypes, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_supportedSessionTypes, *MEMORY[0x1E0D4C880]);
  return v3;
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

- (void)setExportableSessionTypes:(id)a3
{
  NSArray *v4;
  NSArray *exportableSessionTypes;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_exportableSessionTypes, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    exportableSessionTypes = self->_exportableSessionTypes;
    self->_exportableSessionTypes = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSessionTypes, 0);
  objc_storeStrong((id *)&self->_exportableSessionTypes, 0);
  objc_storeStrong((id *)&self->_currentPlaybackSessionRevision, 0);
  objc_storeStrong((id *)&self->_currentPlaybackSessionIdentifier, 0);
}

- (void)setCurrentPlaybackSessionIdentifier:(id)a3
{
  NSString *v4;
  NSString *currentPlaybackSessionIdentifier;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_currentPlaybackSessionIdentifier, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    currentPlaybackSessionIdentifier = self->_currentPlaybackSessionIdentifier;
    self->_currentPlaybackSessionIdentifier = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (NSString)currentPlaybackSessionIdentifier
{
  return self->_currentPlaybackSessionIdentifier;
}

- (NSString)currentPlaybackSessionRevision
{
  return self->_currentPlaybackSessionRevision;
}

- (void)setCurrentPlaybackSessionRevision:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)exportableSessionTypes
{
  return self->_exportableSessionTypes;
}

- (NSArray)supportedSessionTypes
{
  return self->_supportedSessionTypes;
}

@end
