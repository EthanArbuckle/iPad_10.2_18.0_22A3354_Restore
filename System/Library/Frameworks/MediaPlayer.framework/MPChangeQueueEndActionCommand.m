@implementation MPChangeQueueEndActionCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v8 = *MEMORY[0x1E0D4C790];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentQueueEndAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSArray count](self->_supportedQueueEndActions, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_supportedQueueEndActions, *MEMORY[0x1E0D4C888]);
  return v6;
}

- (void)setSupportedQueueEndActions:(id)a3
{
  NSArray *v4;
  NSArray *supportedQueueEndActions;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_supportedQueueEndActions, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    supportedQueueEndActions = self->_supportedQueueEndActions;
    self->_supportedQueueEndActions = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (void)setCurrentQueueEndAction:(int64_t)a3
{
  if (self->_currentQueueEndAction != a3)
  {
    self->_currentQueueEndAction = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (int64_t)currentQueueEndAction
{
  return self->_currentQueueEndAction;
}

- (NSArray)supportedQueueEndActions
{
  return self->_supportedQueueEndActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedQueueEndActions, 0);
}

@end
