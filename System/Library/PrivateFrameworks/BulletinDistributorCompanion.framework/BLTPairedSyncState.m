@implementation BLTPairedSyncState

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__BLTPairedSyncState_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___sharedInstance;
}

void __36__BLTPairedSyncState_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

}

- (void)setState:(unint64_t)a3
{
  BLTPairedSyncStateChangedInfo *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (self->_state != a3)
  {
    v5 = objc_alloc_init(BLTPairedSyncStateChangedInfo);
    -[BLTPairedSyncStateChangedInfo setOldState:](v5, "setOldState:", self->_state);
    -[BLTPairedSyncStateChangedInfo setNewState:](v5, "setNewState:", a3);
    self->_state = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("info");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("BLTPairedSyncStateChanged"), self, v7);

  }
}

- (BOOL)isSyncRestricted
{
  return self->_state < 2;
}

- (BOOL)isTrafficRestricted
{
  return self->_state == 0;
}

- (void)setInitialSyncComplete:(BOOL)a3
{
  id v4;

  if (self->_initialSyncComplete != a3)
  {
    self->_initialSyncComplete = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("BLTPairedSyncStateInitialSyncCompleteChanged"), self);

  }
}

- (BOOL)becameTrafficUnrestricted:(id)a3
{
  return stateDidChange(a3, (uint64_t (*)(uint64_t))stateIsTrafficRestricted);
}

- (BOOL)becameSyncUnrestricted:(id)a3
{
  return stateDidChange(a3, (uint64_t (*)(uint64_t))stateIsSyncRestricted);
}

- (void)leaveState:(unint64_t)a3
{
  if (self->_state <= a3)
    -[BLTPairedSyncState setState:](self, "setState:", a3 + 1);
}

- (BOOL)isInitialSyncComplete
{
  return self->_initialSyncComplete;
}

- (unint64_t)state
{
  return self->_state;
}

@end
