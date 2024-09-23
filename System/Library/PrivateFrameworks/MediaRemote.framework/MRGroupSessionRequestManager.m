@implementation MRGroupSessionRequestManager

void __45__MRGroupSessionRequestManager_sharedManager__block_invoke()
{
  MRGroupSessionRequestManager *v0;
  void *v1;
  id v2;

  +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportGroupSession"))
    v0 = objc_alloc_init(MRGroupSessionRequestManager);
  else
    v0 = 0;
  v1 = (void *)sharedManager___shared;
  sharedManager___shared = (uint64_t)v0;

}

- (MRGroupSessionRequestManager)init
{
  MRGroupSessionRequestManager *v2;
  MRGroupSessionRequestManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRGroupSessionRequestManager;
  v2 = -[MRGroupSessionRequestManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    -[MRGroupSessionRequestManager registerObservers](v2, "registerObservers");
  }
  return v3;
}

- (void)registerObservers
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSessionNearbyContactDiscoveryDidChangeNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleGroupSessionNearbyContactDiscoveryDidChange_, v4, 0);

}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_17);
  return (id)sharedManager___shared;
}

- (MRGroupSessionInfo)groupSessionInfo
{
  os_unfair_lock_s *p_lock;
  MRGroupSessionInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_groupSessionInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateGroupSessionInfo:(id)a3
{
  MRGroupSessionInfo *v4;
  NSObject *v5;
  MRGroupSessionInfo *groupSessionInfo;
  int v7;
  MRGroupSessionInfo *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (MRGroupSessionInfo *)a3;
  _MRLogForCategory(0xCuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Updating group session info: %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  groupSessionInfo = self->_groupSessionInfo;
  self->_groupSessionInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)updateGroupSessionEligibility:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  MRGroupSessionEligibilityStatus *v7;
  MRGroupSessionEligibilityStatus **p_eligibilityStatus;
  MRGroupSessionEligibilityStatus *eligibilityStatus;
  MRGroupSessionEligibilityStatus *v10;
  MRGroupSessionEligibilityStatus *v11;
  char v12;
  NSObject *v13;
  int v15;
  MRGroupSessionEligibilityStatus *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eligibilityStatus = self->_eligibilityStatus;
  p_eligibilityStatus = &self->_eligibilityStatus;
  v7 = eligibilityStatus;
  v10 = (MRGroupSessionEligibilityStatus *)v5;
  v11 = v10;
  if (eligibilityStatus == v10)
    v12 = 1;
  else
    v12 = -[MRGroupSessionEligibilityStatus isEqual:](v10, "isEqual:", v7);

  objc_storeStrong((id *)p_eligibilityStatus, a3);
  os_unfair_lock_unlock(p_lock);
  if ((v12 & 1) == 0)
  {
    _MRLogForCategory(0xCuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Updating group session eligibility: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  return v12 ^ 1;
}

- (void)restoreState
{
  os_unfair_lock_s *p_lock;
  MRUserIdentity *localUserIdentity;
  MRGroupSessionEligibilityStatus *eligibilityStatus;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasPopulatedIdentity = 0;
  localUserIdentity = self->_localUserIdentity;
  self->_localUserIdentity = 0;

  eligibilityStatus = self->_eligibilityStatus;
  self->_eligibilityStatus = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)augmentLocalCommandOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MRGroupSessionRequestManager localUserIdentity](self, "localUserIdentity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:withRandomData:](MRPlaybackQueueParticipant, "expectedIdentifierForUserIdentity:withRandomData:", v6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kMRMediaRemoteOptionAssociatedParticipantIdentifier"));

}

- (MRUserIdentity)localUserIdentity
{
  os_unfair_lock_s *p_lock;
  MRUserIdentity *localUserIdentity;
  void *v5;
  MRUserIdentity *v6;
  MRUserIdentity *v7;
  MRUserIdentity *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  localUserIdentity = self->_localUserIdentity;
  if (!localUserIdentity)
  {
    if (self->_hasPopulatedIdentity)
    {
      localUserIdentity = 0;
    }
    else
    {
      MRGetSharedService();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "applicationUserIdentity");
      v6 = (MRUserIdentity *)objc_claimAutoreleasedReturnValue();
      v7 = self->_localUserIdentity;
      self->_localUserIdentity = v6;

      self->_hasPopulatedIdentity = 1;
      localUserIdentity = self->_localUserIdentity;
    }
  }
  v8 = localUserIdentity;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (MRGroupSessionEligibilityStatus)eligibilityStatus
{
  os_unfair_lock_s *p_lock;
  MRGroupSessionEligibilityStatus *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_eligibilityStatus;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateLocalIdentity:(id)a3
{
  MRUserIdentity *v4;
  NSObject *v5;
  MRUserIdentity *localUserIdentity;
  int v7;
  MRUserIdentity *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (MRUserIdentity *)a3;
  _MRLogForCategory(0xCuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Updating local identity: %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  localUserIdentity = self->_localUserIdentity;
  self->_localUserIdentity = v4;

  self->_hasPopulatedIdentity = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)handleGroupSessionNearbyContactDiscoveryDidChange:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _MRLogForCategory(0xCuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Nearby contact discovery preference changed.", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MRGroupSessionNearbyContactDiscoveryPreferenceDidChangeNotification"), 0);

}

- (void)setLocalUserIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_localUserIdentity, a3);
}

- (void)setEligibilityStatus:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityStatus, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)hasPopulatedIdentity
{
  return self->_hasPopulatedIdentity;
}

- (void)setHasPopulatedIdentity:(BOOL)a3
{
  self->_hasPopulatedIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityStatus, 0);
  objc_storeStrong((id *)&self->_localUserIdentity, 0);
  objc_storeStrong((id *)&self->_groupSessionInfo, 0);
}

@end
