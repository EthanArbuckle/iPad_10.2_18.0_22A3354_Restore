@implementation MPSetPlaybackQueueCommand

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

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableDictionary count](self->_registeredSpecializedQueues, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_registeredSpecializedQueues, *MEMORY[0x1E0D4C850]);
  if (-[NSMutableSet count](self->_registeredQueueTypes, "count"))
  {
    -[NSMutableSet allObjects](self->_registeredQueueTypes, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D4C868]);

  }
  if (-[NSMutableSet count](self->_registeredCustomQueueIdentifiers, "count"))
  {
    -[NSMutableSet allObjects](self->_registeredCustomQueueIdentifiers, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D4C858]);

  }
  if (self->_upNextItemCount >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D4C8A8]);

  }
  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (MPSetPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  MPSetPlaybackQueueCommand *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *registeredSpecializedQueues;
  NSMutableSet *v6;
  NSMutableSet *registeredQueueTypes;
  NSMutableSet *v8;
  NSMutableSet *registeredCustomQueueIdentifiers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPSetPlaybackQueueCommand;
  v3 = -[MPRemoteCommand initWithMediaRemoteCommandType:](&v11, sel_initWithMediaRemoteCommandType_, *(_QWORD *)&a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registeredSpecializedQueues = v3->_registeredSpecializedQueues;
    v3->_registeredSpecializedQueues = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredQueueTypes = v3->_registeredQueueTypes;
    v3->_registeredQueueTypes = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredCustomQueueIdentifiers = v3->_registeredCustomQueueIdentifiers;
    v3->_registeredCustomQueueIdentifiers = v8;

    v3->_lock._os_unfair_lock_opaque = 0;
    -[MPSetPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 1);
    -[MPSetPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 2);
    -[MPSetPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 3);
    -[MPSetPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 5);
    -[MPSetPlaybackQueueCommand registerSupportedQueueType:](v3, "registerSupportedQueueType:", 6);
  }
  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredCustomQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_registeredQueueTypes, 0);
  objc_storeStrong((id *)&self->_registeredSpecializedQueues, 0);
}

- (void)setUpNextItemCount:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_upNextItemCount == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_upNextItemCount = a3;
    os_unfair_lock_unlock(p_lock);
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)registerSpecializedQueueIdentifier:(id)a3 localizedName:(id)a4 queueType:(int64_t)a5 queueParameters:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(a6, "mutableCopy");
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v14;

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D4C7B8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D4C7D0]);

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredSpecializedQueues, "setObject:forKeyedSubscript:", v16, v11);

  os_unfair_lock_unlock(&self->_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");

}

- (void)unregisterSpecializedQueueIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_registeredSpecializedQueues, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
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
  NSMutableSet *registeredQueueTypes;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_registeredCustomQueueIdentifiers, "removeObject:", v5);

  if (!-[NSMutableSet count](self->_registeredCustomQueueIdentifiers, "count"))
  {
    registeredQueueTypes = self->_registeredQueueTypes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](registeredQueueTypes, "removeObject:", v7);

  }
  os_unfair_lock_unlock(p_lock);
  -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
}

- (int64_t)upNextItemCount
{
  return self->_upNextItemCount;
}

@end
