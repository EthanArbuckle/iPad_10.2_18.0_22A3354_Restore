@implementation MPStoreSocialServiceTransientStatesSnapshot

- (MPStoreSocialServiceTransientStatesSnapshot)init
{
  MPStoreSocialServiceTransientStatesSnapshot *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *transientFollowStatesPerProfileID;
  NSMutableDictionary *v5;
  NSMutableDictionary *transientFollowPendingRequestStatesPerProfileID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPStoreSocialServiceTransientStatesSnapshot;
  v2 = -[MPStoreSocialServiceTransientStatesSnapshot init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transientFollowStatesPerProfileID = v2->_transientFollowStatesPerProfileID;
    v2->_transientFollowStatesPerProfileID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transientFollowPendingRequestStatesPerProfileID = v2->_transientFollowPendingRequestStatesPerProfileID;
    v2->_transientFollowPendingRequestStatesPerProfileID = v5;

  }
  return v2;
}

- (int64_t)transientFollowStateForPerson:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "socialProfileID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_transientFollowStatesPerProfileID, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "integerValue");
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)transientFollowPendingRequestStateForPerson:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "socialProfileID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_transientFollowPendingRequestStatesPerProfileID, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "integerValue");
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_addTransientFollowState:(int64_t)a3 transientFollowPendingRequestState:(int64_t)a4 forPerson:(id)a5
{
  void *v8;
  void *v9;
  NSMutableDictionary *transientFollowStatesPerProfileID;
  void *v11;
  NSMutableDictionary *transientFollowPendingRequestStatesPerProfileID;
  void *v13;
  id v14;

  objc_msgSend(a5, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "universalStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "socialProfileID");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    transientFollowStatesPerProfileID = self->_transientFollowStatesPerProfileID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](transientFollowStatesPerProfileID, "setObject:forKey:", v11, v14);

    transientFollowPendingRequestStatesPerProfileID = self->_transientFollowPendingRequestStatesPerProfileID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](transientFollowPendingRequestStatesPerProfileID, "setObject:forKey:", v13, v14);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientFollowPendingRequestStatesPerProfileID, 0);
  objc_storeStrong((id *)&self->_transientFollowStatesPerProfileID, 0);
}

@end
