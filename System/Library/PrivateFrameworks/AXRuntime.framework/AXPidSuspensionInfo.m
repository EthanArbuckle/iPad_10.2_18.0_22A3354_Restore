@implementation AXPidSuspensionInfo

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_7);
  return (id)shared_Shared;
}

- (id)timeoutProbationPidsForDisplay:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *probationPids;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  probationPids = self->_probationPids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](probationPids, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = self->_probationPids;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = self->_probationPids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)suspendedPidsForDisplay:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *suspendsPids;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  suspendsPids = self->_suspendsPids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](suspendsPids, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = self->_suspendsPids;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = self->_suspendsPids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)tentativeSuspendedPidsForDisplay:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *tentativeSuspendedPids;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  tentativeSuspendedPids = self->_tentativeSuspendedPids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](tentativeSuspendedPids, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = self->_tentativeSuspendedPids;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = self->_tentativeSuspendedPids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)associatedRemotePidsForDisplay:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *associatedRemotePids;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  associatedRemotePids = self->_associatedRemotePids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](associatedRemotePids, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = self->_associatedRemotePids;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = self->_associatedRemotePids;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __29__AXPidSuspensionInfo_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_Shared;
  shared_Shared = v0;

}

- (AXPidSuspensionInfo)init
{
  AXPidSuspensionInfo *v2;
  uint64_t v3;
  NSMutableDictionary *probationPids;
  uint64_t v5;
  NSMutableDictionary *suspendsPids;
  uint64_t v7;
  NSMutableDictionary *tentativeSuspendedPids;
  uint64_t v9;
  NSMutableDictionary *associatedRemotePids;
  uint64_t v11;
  NSMutableDictionary *associatedRemotePidCache;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXPidSuspensionInfo;
  v2 = -[AXPidSuspensionInfo init](&v14, sel_init);
  v3 = objc_opt_new();
  probationPids = v2->_probationPids;
  v2->_probationPids = (NSMutableDictionary *)v3;

  v5 = objc_opt_new();
  suspendsPids = v2->_suspendsPids;
  v2->_suspendsPids = (NSMutableDictionary *)v5;

  v7 = objc_opt_new();
  tentativeSuspendedPids = v2->_tentativeSuspendedPids;
  v2->_tentativeSuspendedPids = (NSMutableDictionary *)v7;

  v9 = objc_opt_new();
  associatedRemotePids = v2->_associatedRemotePids;
  v2->_associatedRemotePids = (NSMutableDictionary *)v9;

  v11 = objc_opt_new();
  associatedRemotePidCache = v2->_associatedRemotePidCache;
  v2->_associatedRemotePidCache = (NSMutableDictionary *)v11;

  return v2;
}

- (id)associatedRemotePidCacheForDisplay:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *associatedRemotePidCache;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  associatedRemotePidCache = self->_associatedRemotePidCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](associatedRemotePidCache, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = self->_associatedRemotePidCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = self->_associatedRemotePidCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedRemotePids, 0);
  objc_storeStrong((id *)&self->_associatedRemotePidCache, 0);
  objc_storeStrong((id *)&self->_tentativeSuspendedPids, 0);
  objc_storeStrong((id *)&self->_probationPids, 0);
  objc_storeStrong((id *)&self->_suspendsPids, 0);
}

@end
