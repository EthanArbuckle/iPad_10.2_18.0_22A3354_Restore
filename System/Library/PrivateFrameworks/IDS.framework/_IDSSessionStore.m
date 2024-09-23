@implementation _IDSSessionStore

+ (id)sharedInstance
{
  if (qword_1ECDD6660 != -1)
    dispatch_once(&qword_1ECDD6660, &unk_1E2C5FA10);
  return (id)qword_1EE1E1FC8;
}

- (_IDSSessionStore)init
{
  _IDSSessionStore *v2;
  uint64_t v3;
  NSMapTable *sessionBySessionID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_IDSSessionStore;
  v2 = -[_IDSSessionStore init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    sessionBySessionID = v2->_sessionBySessionID;
    v2->_sessionBySessionID = (NSMapTable *)v3;

  }
  return v2;
}

- (id)sessionForAccount:(id)a3 fromID:(id)a4 identifier:(id)a5 transportType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  IDSSession *v18;
  void *v19;
  IDSSession *v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "assertQueueIsCurrent");

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1907EE8A0(v16);

    }
    if (!v12
      || (-[NSMapTable objectForKey:](self->_sessionBySessionID, "objectForKey:", v12),
          (v17 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v18 = [IDSSession alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[IDSSession _initWithAccount:destinations:transportType:uniqueID:](v18, "_initWithAccount:destinations:transportType:uniqueID:", v10, v19, objc_msgSend(v13, "integerValue"), v12);

      if (v12)
        -[NSMapTable setObject:forKey:](self->_sessionBySessionID, "setObject:forKey:", v17, v12);
    }
  }
  else
  {
    v20 = [IDSSession alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[IDSSession _initWithAccount:destinations:transportType:uniqueID:](v20, "_initWithAccount:destinations:transportType:uniqueID:", v10, v21, objc_msgSend(v13, "integerValue"), v12);

  }
  return v17;
}

- (NSMapTable)sessionBySessionID
{
  return self->_sessionBySessionID;
}

- (void)setSessionBySessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionBySessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionBySessionID, 0);
}

@end
