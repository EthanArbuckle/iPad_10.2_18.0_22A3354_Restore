@implementation ENGroupContext

- (ENGroupContext)initWithAccountIdentity:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  ENGroupContext *v12;
  ENGroupContext *v13;
  NSMutableArray *v14;
  NSMutableArray *middlewares;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ENGroupContext;
  v12 = -[ENGroupContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    middlewares = v13->_middlewares;
    v13->_middlewares = v14;

    objc_storeStrong((id *)&v13->_dataSource, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)createGroupWithParticipants:(id)a3 sharedApplicationData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v11 = a3;
  -[ENGroupContext queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[ENGroupContext _qUpsertGroupWithParticipants:previousGroup:sharedApplicationData:completion:](self, "_qUpsertGroupWithParticipants:previousGroup:sharedApplicationData:completion:", v11, 0, v9, v8);
}

- (void)updateGroup:(id)a3 withParticipants:(id)a4 sharedApplicationData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = a3;
  -[ENGroupContext queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[ENGroupContext _qUpsertGroupWithParticipants:previousGroup:sharedApplicationData:completion:](self, "_qUpsertGroupWithParticipants:previousGroup:sharedApplicationData:completion:", v12, v14, v11, v10);
}

- (void)fetchGroupWithGroupID:(id)a3 completion:(id)a4
{
  -[ENGroupContext _fetchGroupWithGroupID:skipCache:completion:](self, "_fetchGroupWithGroupID:skipCache:completion:", a3, 0, a4);
}

- (void)fetchLatestGroupWithStableID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  os_activity_scope_state_s state;
  NSObject *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v23 = _os_activity_create(&dword_1D4CF8000, "Fetch latest group by StableGroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v23, &state);
  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_DEFAULT, "!setState stableGroupID=%@", buf, 0xCu);
  }

  v10 = objc_alloc(MEMORY[0x1E0D131F8]);
  -[ENGroupContext _qCacheMiddlewares](self, "_qCacheMiddlewares");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithInput:initialValue:", v11, 0);

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D4CFDD3C;
  v20[3] = &unk_1E987B320;
  v20[4] = self;
  v14 = v6;
  v21 = v14;
  objc_msgSend(v12, "setReducerBlock:", v20);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = sub_1D4CFDF30;
  v17[3] = &unk_1E987B348;
  v15 = v7;
  v19 = v15;
  v16 = v14;
  v18 = v16;
  objc_msgSend(v12, "reduceWithCompletion:", v17);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)cacheIncomingGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  os_activity_scope_state_s state;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v18 = _os_activity_create(&dword_1D4CF8000, "Cache Incoming Group", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_DEFAULT, "!setState newGroup=%@", buf, 0xCu);
  }

  objc_msgSend(v6, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stableGroupID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D4CFE380;
  v14[3] = &unk_1E987B410;
  v14[4] = self;
  v12 = v6;
  v15 = v12;
  v13 = v7;
  v16 = v13;
  -[ENGroupContext fetchLatestGroupWithStableID:completion:](self, "fetchLatestGroupWithStableID:completion:", v11, v14);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)appendMiddleware:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ENGroupContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ENLog groupContext](ENLog, "groupContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1D4CF8000, v6, OS_LOG_TYPE_INFO, "Adding middleware {middleware: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[ENGroupContext middlewares](self, "middlewares");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removeMiddleware:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ENGroupContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ENLog groupContext](ENLog, "groupContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1D4CF8000, v6, OS_LOG_TYPE_INFO, "Removing middleware {middleware: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[ENGroupContext middlewares](self, "middlewares");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

}

- (NSArray)allMiddlewares
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[ENGroupContext queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ENGroupContext middlewares](self, "middlewares");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (void)_didCreateGroup:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[ENGroupContext queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ENGroupContext _qDidCreateGroup:](self, "_qDidCreateGroup:", v6);
  v8[2](v8, 0);

}

- (void)_didCacheGroup:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[ENGroupContext queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ENGroupContext _qDidCacheGroup:](self, "_qDidCacheGroup:", v6);
  v8[2](v8, 0);

}

- (void)_didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void (**v11)(id, _QWORD);

  v11 = (void (**)(id, _QWORD))a5;
  v8 = a4;
  v9 = a3;
  -[ENGroupContext queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[ENGroupContext _qDidUpdateGroup:withGroup:](self, "_qDidUpdateGroup:withGroup:", v9, v8);
  v11[2](v11, 0);

}

- (void)_didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[ENGroupContext queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ENGroupContext _qDidReceiveDecryptionFailureForGroup:](self, "_qDidReceiveDecryptionFailureForGroup:", v6);
  v8[2](v8, 0);

}

- (void)_didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3
{
  NSObject *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  -[ENGroupContext queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[ENGroupContext _qDidReceiveRegistrationIdentityUpdate](self, "_qDidReceiveRegistrationIdentityUpdate");
  v5[2](v5, 0);

}

- (void)_cacheGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ENGroupContext _qCacheMiddlewares](self, "_qCacheMiddlewares");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ENGroupContext _qCacheGroup:toMiddlewares:completion:](self, "_qCacheGroup:toMiddlewares:completion:", v7, v9, v6);

}

- (void)_fetchAllLocalKnownGroups:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  v4 = a3;
  -[ENGroupContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ENGroupContext _qCacheMiddlewaresContainedInCost:](self, "_qCacheMiddlewaresContainedInCost:", 300);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D131F8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = (void *)objc_msgSend(v7, "initWithInput:initialValue:", v6, v8);

  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D4CFEEB0;
  v14[3] = &unk_1E987B460;
  v14[4] = self;
  objc_msgSend(v9, "setReducerBlock:", v14);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = sub_1D4CFEFE0;
  v12[3] = &unk_1E987B488;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v9, "reduceWithCompletion:", v12);

}

- (void)_dropLocalCache:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v4 = a3;
  -[ENGroupContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ENGroupContext _qCacheMiddlewaresContainedInCost:](self, "_qCacheMiddlewaresContainedInCost:", 300);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D131F8]), "initWithInput:initialValue:", v6, &stru_1E987B990);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4CFF184;
  v12[3] = &unk_1E987B460;
  v12[4] = self;
  objc_msgSend(v7, "setReducerBlock:", v12);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = sub_1D4CFF260;
  v10[3] = &unk_1E987B488;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "reduceWithCompletion:", v10);

}

- (void)_dropLocalCacheForGroupID:(id)a3 compeltion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ENGroupContext _qCacheMiddlewaresContainedInCost:](self, "_qCacheMiddlewaresContainedInCost:", 300);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D131F8]), "initWithInput:initialValue:", v9, &stru_1E987B990);
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D4CFF3A0;
  v16[3] = &unk_1E987B320;
  v16[4] = self;
  v17 = v6;
  v12 = v6;
  objc_msgSend(v10, "setReducerBlock:", v16);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = sub_1D4CFF480;
  v14[3] = &unk_1E987B488;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v10, "reduceWithCompletion:", v14);

}

- (void)_publicDataRepresentationForGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ENGroupContext dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D4CFF554;
  v11[3] = &unk_1E987B4D8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "publicDataRepresentationForGroup:inContext:completion:", v7, self, v11);

}

- (void)_groupFromPublicDataRepresentation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "length"))
  {
    -[ENGroupContext dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D4CFF75C;
    v14[3] = &unk_1E987B3E8;
    v14[4] = self;
    v15 = v7;
    objc_msgSend(v9, "groupFromPublicDataRepresentation:inContext:completion:", v6, self, v14);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = ENGroupIDErrorDomain;
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Received group data is nil or empty");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, -4000, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);

  }
}

- (void)_fetchGroupWithGroupID:(id)a3 skipCache:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  os_activity_scope_state_s state;
  NSObject *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[ENGroupContext queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v26 = _os_activity_create(&dword_1D4CF8000, "Fetch group by GroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v26, &state);
  +[ENLog groupContext](ENLog, "groupContext");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl(&dword_1D4CF8000, v11, OS_LOG_TYPE_DEFAULT, "!setState groupID=%@", buf, 0xCu);
  }

  +[ENLog groupContext](ENLog, "groupContext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl(&dword_1D4CF8000, v12, OS_LOG_TYPE_DEFAULT, "!setState skipCache=%@", buf, 0xCu);

  }
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1D4CFFA98;
  v22[3] = &unk_1E987B528;
  v22[4] = self;
  v15 = v8;
  v23 = v15;
  v16 = v9;
  v24 = v16;
  v17 = MEMORY[0x1D826771C](v22);
  v18 = (void *)v17;
  if (v6)
  {
    (*(void (**)(uint64_t))(v17 + 16))(v17);
  }
  else
  {
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = sub_1D4CFFC94;
    v19[3] = &unk_1E987B550;
    v19[4] = self;
    v20 = v16;
    v21 = v18;
    -[ENGroupContext _qFetchCachedGroupWithGroupID:completion:](self, "_qFetchCachedGroupWithGroupID:completion:", v15, v19);

  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)_participantsForCypher:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ENGroupContext dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D4CFFE54;
  v11[3] = &unk_1E987B578;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "participantsForCypher:completion:", v7, v11);

}

- (void)_noteDecryptionFailureForGroup:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_DEFAULT, "Noting decryption failure", v10, 2u);
  }

  -[ENGroupContext _qDidReceiveDecryptionFailureForGroup:](self, "_qDidReceiveDecryptionFailureForGroup:", v7);
  v6[2](v6, 0);

}

- (void)_noteRegistrationIdentityUpdate
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[ENGroupContext queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[ENLog groupContext](ENLog, "groupContext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D4CF8000, v4, OS_LOG_TYPE_DEFAULT, "Noting registration identity update", v5, 2u);
  }

  -[ENGroupContext _qDidReceiveRegistrationIdentityUpdate](self, "_qDidReceiveRegistrationIdentityUpdate");
}

- (void)_validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ENGroupContext queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[ENGroupContext dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D4D000F4;
  v14[3] = &unk_1E987B5A0;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "validateCachedGroup:isParentOfGroup:completion:", v10, v9, v14);

}

- (void)_qCacheGroup:(id)a3 toMiddlewares:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  uint8_t *v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[5];
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[ENLog groupContext](ENLog, "groupContext");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4CF8000, v11, OS_LOG_TYPE_INFO, "Caching group", buf, 2u);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D131F8]), "initWithInput:initialValue:", v9, &stru_1E987B990);
  v13 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1D4D003E8;
  v37[3] = &unk_1E987B320;
  v37[4] = self;
  v14 = v8;
  v38 = v14;
  objc_msgSend(v12, "setReducerBlock:", v37);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x3032000000;
  v32 = sub_1D4D0054C;
  v33 = sub_1D4D0055C;
  v34 = 0;
  objc_msgSend(v14, "groupID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stableGroupID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = sub_1D4D00564;
  v25[3] = &unk_1E987B5C8;
  v17 = v14;
  v26 = v17;
  v27 = v35;
  v28 = buf;
  -[ENGroupContext fetchLatestGroupWithStableID:completion:](self, "fetchLatestGroupWithStableID:completion:", v16, v25);

  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = sub_1D4D006F4;
  v20[3] = &unk_1E987B5F0;
  v20[4] = self;
  v18 = v17;
  v21 = v18;
  v23 = v35;
  v24 = buf;
  v19 = v10;
  v22 = v19;
  objc_msgSend(v12, "reduceWithCompletion:", v20);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v35, 8);

}

- (id)_qCacheMiddlewares
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[ENGroupContext _middlwareConformingToProtocol:](self, "_middlwareConformingToProtocol:", &unk_1EFECA950);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D4D0088C;
  v6[3] = &unk_1E987B618;
  v6[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_qObserverMiddlewares
{
  return -[ENGroupContext _middlwareConformingToProtocol:](self, "_middlwareConformingToProtocol:", &unk_1EFECB1E0);
}

- (id)_middlwareConformingToProtocol:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ENGroupContext middlewares](self, "middlewares", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", v4))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_qCacheMiddlewaresContainedInCost:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ENGroupContext _qCacheMiddlewares](self, "_qCacheMiddlewares");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "middlewareCacheCostForContext:", self, (_QWORD)v14) <= a3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)_qUpsertGroupWithParticipants:(id)a3 previousGroup:(id)a4 sharedApplicationData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _ENGroupInfo *v23;
  void *v24;
  _ENGroupInfo *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  os_activity_scope_state_s state;
  NSObject *v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v33 = _os_activity_create(&dword_1D4CF8000, "Create Group", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v33, &state);
  +[ENLog groupContext](ENLog, "groupContext");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v15;
    _os_log_impl(&dword_1D4CF8000, v14, OS_LOG_TYPE_DEFAULT, "!setState applicationData.length=%@", buf, 0xCu);

  }
  +[ENLog groupContext](ENLog, "groupContext");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[ENGroupContext middlewares](self, "middlewares");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v19;
    _os_log_impl(&dword_1D4CF8000, v16, OS_LOG_TYPE_DEFAULT, "!setState middlewares.count=%@", buf, 0xCu);

  }
  +[ENLog groupContext](ENLog, "groupContext");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v21;
    _os_log_impl(&dword_1D4CF8000, v20, OS_LOG_TYPE_DEFAULT, "!setState participatns.count=%@", buf, 0xCu);

  }
  +[ENLog groupContext](ENLog, "groupContext");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v35 = v10;
    _os_log_impl(&dword_1D4CF8000, v22, OS_LOG_TYPE_INFO, "Creating group {participants: %{private}@}", buf, 0xCu);
  }

  v23 = [_ENGroupInfo alloc];
  -[ENGroupContext accountIdentity](self, "accountIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_ENGroupInfo initWithAccountIdentity:paricipants:sharedApplicationData:](v23, "initWithAccountIdentity:paricipants:sharedApplicationData:", v24, v10, v12);

  -[ENGroupContext dataSource](self, "dataSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1D4D00F84;
  v29[3] = &unk_1E987B660;
  v29[4] = self;
  v27 = v13;
  v31 = v27;
  v28 = v11;
  v30 = v28;
  objc_msgSend(v26, "groupContext:upsertGroupWithInfo:previousGroup:completion:", self, v25, v28, v29);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)_qFetchCachedGroupWithGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  +[ENLog groupContext](ENLog, "groupContext");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4CF8000, v8, OS_LOG_TYPE_INFO, "Fetching from Caches", buf, 2u);
  }

  -[ENGroupContext _qCacheMiddlewares](self, "_qCacheMiddlewares");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D131F8]), "initWithInput:initialValue:", v9, 0);
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D4D013B8;
  v16[3] = &unk_1E987B320;
  v16[4] = self;
  v17 = v6;
  v12 = v6;
  objc_msgSend(v10, "setReducerBlock:", v16);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = sub_1D4D015E0;
  v14[3] = &unk_1E987B488;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v10, "reduceWithCompletion:", v14);

}

- (void)_qFetchDataSourceGroupWithGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  -[ENGroupContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_INFO, "Fetching from DataSource", buf, 2u);
  }

  -[ENGroupContext dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4D01770;
  v12[3] = &unk_1E987B3E8;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "groupContext:fetchGroupWithID:completion:", self, v7, v12);

}

- (void)_qDidCreateGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ENGroupContext _qObserverMiddlewares](self, "_qObserverMiddlewares", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "groupContext:didCreateGroup:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_qDidCacheGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ENGroupContext _qObserverMiddlewares](self, "_qObserverMiddlewares", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "groupContext:didCacheGroup:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_qDidUpdateGroup:(id)a3 withGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ENGroupContext _qObserverMiddlewares](self, "_qObserverMiddlewares", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "groupContext:didUpdateGroup:withNewGroup:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_qDidReceiveDecryptionFailureForGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ENGroupContext _qObserverMiddlewares](self, "_qObserverMiddlewares", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "groupContext:didReceiveDecryptionFailureForGroup:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_qDidReceiveRegistrationIdentityUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[ENLog groupContext](ENLog, "groupContext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[ENGroupContext _qObserverMiddlewares](self, "_qObserverMiddlewares");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v4;
    _os_log_impl(&dword_1D4CF8000, v3, OS_LOG_TYPE_INFO, "Did receive registration identity update {observerMiddlewares: %{public}@}", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ENGroupContext _qObserverMiddlewares](self, "_qObserverMiddlewares", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "groupContextDidReceiveRegistrationIdentityUpdate:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

+ (id)_errorWithNotFoundItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  id v23;
  const __CFString *v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0CB35C8];
          v24 = CFSTR("ENGroupContextErrorItemKey");
          v25 = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ENGroupContextErrorDomain"), -2000, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "setObject:forKey:", v13, v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v7);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v22 = CFSTR("ENGroupContextErrorItemKey");
    v23 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ENGroupContextErrorDomain"), -3000, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_missingItemsInNotFoundError:(id)a3 remainingErrors:(id *)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  os_activity_scope_state_s state;
  NSObject *v44;
  const __CFString *v45;
  NSObject *v46;
  _BYTE v47[128];
  void *v48;
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v44 = _os_activity_create(&dword_1D4CF8000, "Find missing items in error", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v44, &state);
  v37 = v4;
  if (!v4)
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = 0;
      v13 = "No error -- Fail {error: %{public}@}";
LABEL_12:
      _os_log_impl(&dword_1D4CF8000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    }
LABEL_13:
    v38 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

    v10 = v38;
    v11 = v10;
    goto LABEL_15;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ENGroupContextErrorDomain"));

  if (!v6)
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = (uint64_t)v37;
      v13 = "Unexpected domain -- Fail {error: %{public}@}";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v37, "code") != -2000)
  {
    if (objc_msgSend(v37, "code") != -3000)
    {
      +[ENLog groupContext](ENLog, "groupContext");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 138543362;
      v50 = (uint64_t)v37;
      v13 = "Unexpected code -- Fail {error: %{public}@}";
      goto LABEL_12;
    }
    objc_msgSend(v37, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ENGroupContextErrorItemKey"));
    v35 = objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      +[ENLog groupContext](ENLog, "groupContext");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v50 = (uint64_t)v37;
        _os_log_impl(&dword_1D4CF8000, v16, OS_LOG_TYPE_DEFAULT, "No items -- Fail {error: %{public}@}", buf, 0xCu);
      }
      v38 = (void *)MEMORY[0x1E0C9AA60];
LABEL_55:

      v12 = v35;
      goto LABEL_14;
    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSObject count](v35, "count"));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = v35;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (!v18)
      goto LABEL_37;
    v19 = *(_QWORD *)v40;
LABEL_20:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v19)
        objc_enumerationMutation(v17);
      v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v20);
      objc_msgSend(v21, "domain", v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "isEqualToString:", CFSTR("ENGroupContextErrorDomain")))
        break;
      v23 = objc_msgSend(v21, "code") == -2000;

      if (!v23)
        goto LABEL_28;
      objc_msgSend(v21, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ENGroupContextErrorItemKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v38, "addObject:", v25);
      }
      else
      {
        +[ENLog groupContext](ENLog, "groupContext");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v50 = (uint64_t)v21;
          _os_log_impl(&dword_1D4CF8000, v27, OS_LOG_TYPE_DEFAULT, "Missing item -- Ignore {suberror: %{public}@}", buf, 0xCu);
        }

      }
LABEL_35:
      if (v18 == ++v20)
      {
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (!v18)
        {
LABEL_37:

          if (-[NSObject count](v16, "count"))
          {
            +[ENLog groupContext](ENLog, "groupContext");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = -[NSObject count](v16, "count");
              *(_DWORD *)buf = 134217984;
              v50 = v29;
              _os_log_impl(&dword_1D4CF8000, v28, OS_LOG_TYPE_DEFAULT, "Found remaining errors {remainingErrors.count: %ld}", buf, 0xCu);
            }

            if (a4)
            {
              v30 = (void *)MEMORY[0x1E0CB35C8];
              v45 = CFSTR("ENGroupContextErrorItemKey");
              v46 = v16;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
              v31 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("ENGroupContextErrorDomain"), -3000, v31);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              +[ENLog groupContext](ENLog, "groupContext");
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = -[NSObject count](v16, "count");
                *(_DWORD *)buf = 134217984;
                v50 = v32;
                _os_log_impl(&dword_1D4CF8000, v31, OS_LOG_TYPE_DEFAULT, "Ignorning remaining errors due to missing out error parameter {remainingErrors.count: %ld}", buf, 0xCu);
              }
            }

          }
          +[ENLog groupContext](ENLog, "groupContext", v35);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = objc_msgSend(v38, "count");
            *(_DWORD *)buf = 134217984;
            v50 = v34;
            _os_log_impl(&dword_1D4CF8000, v33, OS_LOG_TYPE_INFO, "Found missing items -- Done {items.count: %ld}", buf, 0xCu);
          }

          goto LABEL_55;
        }
        goto LABEL_20;
      }
    }

LABEL_28:
    +[ENLog groupContext](ENLog, "groupContext");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = (uint64_t)v21;
      _os_log_impl(&dword_1D4CF8000, v26, OS_LOG_TYPE_DEFAULT, "Unexpected error -- Collect {suberror: %{public}@}", buf, 0xCu);
    }

    -[NSObject addObject:](v16, "addObject:", v21);
    goto LABEL_35;
  }
  objc_msgSend(v37, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ENGroupContextErrorItemKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 138543362;
    v50 = (uint64_t)v37;
    v13 = "Missing item -- Fail {error: %{public}@";
    goto LABEL_12;
  }
  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v50 = (uint64_t)v8;
    _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_INFO, "Found one item {item: %{public}@}", buf, 0xCu);
  }

  v48 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_15:

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (ENAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (void)setAccountIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentity, a3);
}

- (NSMutableArray)middlewares
{
  return self->_middlewares;
}

- (void)setMiddlewares:(id)a3
{
  objc_storeStrong((id *)&self->_middlewares, a3);
}

- (ENGroupContextDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMiddlewares, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_middlewares, 0);
  objc_storeStrong((id *)&self->_accountIdentity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
