@implementation MPInsertIntoPlaybackQueueCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (-[NSArray count](self->_supportedInsertionPositions, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_supportedInsertionPositions, *MEMORY[0x1E0D4C860]);
  if (-[NSMutableSet count](self->_registeredQueueTypes, "count"))
  {
    -[NSMutableSet allObjects](self->_registeredQueueTypes, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D4C868]);

  }
  if (-[NSMutableSet count](self->_registeredCustomQueueIdentifiers, "count"))
  {
    -[NSMutableSet allObjects](self->_registeredCustomQueueIdentifiers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D4C858]);

  }
  if (-[NSString length](self->_lastSectionContentItemID, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_lastSectionContentItemID, *MEMORY[0x1E0D4C7A8]);
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (MPInsertIntoPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  MPInsertIntoPlaybackQueueCommand *v3;
  NSMutableSet *v4;
  NSMutableSet *registeredQueueTypes;
  NSMutableSet *v6;
  NSMutableSet *registeredCustomQueueIdentifiers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPInsertIntoPlaybackQueueCommand;
  v3 = -[MPRemoteCommand initWithMediaRemoteCommandType:](&v9, sel_initWithMediaRemoteCommandType_, *(_QWORD *)&a3);
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredQueueTypes = v3->_registeredQueueTypes;
    v3->_registeredQueueTypes = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredCustomQueueIdentifiers = v3->_registeredCustomQueueIdentifiers;
    v3->_registeredCustomQueueIdentifiers = v6;

    v3->_lock._os_unfair_lock_opaque = 0;
    -[MPInsertIntoPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 1);
    -[MPInsertIntoPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 2);
    -[MPInsertIntoPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 3);
    -[MPInsertIntoPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 5);
    -[MPInsertIntoPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 6);
  }
  return v3;
}

- (void)registerSupportedQueueType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *registeredQueueTypes;
  uint64_t v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  registeredQueueTypes = self->_registeredQueueTypes;
  if ((unint64_t)(a3 - 1) > 7)
    v7 = 0;
  else
    v7 = dword_193F0BE58[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](registeredQueueTypes, "addObject:", v8);

  os_unfair_lock_unlock(p_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
}

- (void)registerSupportedCustomQueueIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableSet *registeredQueueTypes;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  registeredQueueTypes = self->_registeredQueueTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](registeredQueueTypes, "addObject:", v7);

  -[NSMutableSet addObject:](self->_registeredCustomQueueIdentifiers, "addObject:", v5);
  os_unfair_lock_unlock(p_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
}

- (void)setSupportedInsertionPositions:(id)a3
{
  NSArray *v4;
  NSArray *supportedInsertionPositions;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((objc_msgSend(v6, "isEqual:", self->_supportedInsertionPositions) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    supportedInsertionPositions = self->_supportedInsertionPositions;
    self->_supportedInsertionPositions = v4;

    os_unfair_lock_unlock(&self->_lock);
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (void)setLastSectionContentItemID:(id)a3
{
  NSString *v4;
  NSString *v5;
  char v6;
  NSString *v7;
  NSString *lastSectionContentItemID;
  NSString *v9;

  v9 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastSectionContentItemID;
  if (v4 == v9)
  {

    goto LABEL_5;
  }
  v5 = v4;
  v6 = -[NSString isEqual:](v4, "isEqual:");

  if ((v6 & 1) != 0)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_6;
  }
  v7 = (NSString *)-[NSString copy](v9, "copy");
  lastSectionContentItemID = self->_lastSectionContentItemID;
  self->_lastSectionContentItemID = v7;

  os_unfair_lock_unlock(&self->_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
LABEL_6:

}

- (void)unregisterSupportedQueueType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *registeredQueueTypes;
  uint64_t v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  registeredQueueTypes = self->_registeredQueueTypes;
  if ((unint64_t)(a3 - 1) > 7)
    v7 = 0;
  else
    v7 = dword_193F0BE58[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](registeredQueueTypes, "removeObject:", v8);

  os_unfair_lock_unlock(p_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
}

- (void)unregisterSupportedCustomQueueIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_registeredCustomQueueIdentifiers, "removeObject:", v5);

  if (!-[NSMutableSet count](self->_registeredCustomQueueIdentifiers, "count"))
    -[NSMutableSet removeObject:](self->_registeredQueueTypes, "removeObject:", &unk_1E31E4DB0);
  os_unfair_lock_unlock(p_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
}

- (NSArray)supportedInsertionPositions
{
  return self->_supportedInsertionPositions;
}

- (NSString)lastSectionContentItemID
{
  return self->_lastSectionContentItemID;
}

- (NSString)tailInsertionContentItemID
{
  return self->_tailInsertionContentItemID;
}

- (void)setTailInsertionContentItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailInsertionContentItemID, 0);
  objc_storeStrong((id *)&self->_lastSectionContentItemID, 0);
  objc_storeStrong((id *)&self->_supportedInsertionPositions, 0);
  objc_storeStrong((id *)&self->_registeredCustomQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_registeredQueueTypes, 0);
}

@end
