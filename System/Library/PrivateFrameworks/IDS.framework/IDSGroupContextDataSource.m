@implementation IDSGroupContextDataSource

- (IDSGroupContextDataSource)initWithQueue:(id)a3
{
  id v4;
  NSObject *v5;
  IDSGroupContextDataSource *v6;
  IDSGroupContextDataSource *v7;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v4 = a3;
  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D1F458], "groupContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v5);

    v6 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSGroupContextDataSource;
    v7 = -[IDSGroupContextDataSource init](&v11, sel_init);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D1F458], "groupContext");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_INFO, "Daemon Interfaced Group context controller starting up", v10, 2u);
      }

      -[IDSGroupContextDataSource setQueue:](v7, "setQueue:", v4);
    }
    self = v7;
    v6 = self;
  }

  return v6;
}

- (void)groupContext:(id)a3 upsertGroupWithInfo:(id)a4 previousGroup:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[IDSGroupContextDataSource _groupContextDataSource](self, "_groupContextDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1907DF178;
  v14[3] = &unk_1E2C651B8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "upsertGroupWithInfo:previousGroup:completion:", v11, v10, v14);

}

- (void)groupContext:(id)a3 fetchGroupWithID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  v8 = a4;
  -[IDSGroupContextDataSource _groupContextDataSource](self, "_groupContextDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907DF304;
  v11[3] = &unk_1E2C651B8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "fetchGroupWithID:completion:", v8, v11);

}

- (void)publicDataRepresentationForGroup:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  v8 = a3;
  -[IDSGroupContextDataSource _groupContextDataSource](self, "_groupContextDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907DF490;
  v11[3] = &unk_1E2C651E0;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "publicDataRepresentationForGroup:completion:", v8, v11);

}

- (void)groupFromPublicDataRepresentation:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  v8 = a3;
  -[IDSGroupContextDataSource _groupContextDataSource](self, "_groupContextDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907DF61C;
  v11[3] = &unk_1E2C651B8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "groupFromPublicDataRepresentation:completion:", v8, v11);

}

- (void)participantsForCypher:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[IDSGroupContextDataSource _groupContextDataSource](self, "_groupContextDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1907DF7A8;
  v10[3] = &unk_1E2C65208;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "participantsForCypher:completion:", v7, v10);

}

- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IDSGroupContextDataSource _groupContextDataSource](self, "_groupContextDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1907DF934;
  v13[3] = &unk_1E2C65230;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "validateCachedGroup:isParentOfGroup:completion:", v10, v9, v13);

}

- (int64_t)middlewareCacheCostForContext:(id)a3
{
  return 200;
}

- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5
{
  (*((void (**)(id))a5 + 2))(a5);
}

- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  v8 = a4;
  -[IDSGroupContextDataSource _groupContextCacheMiddleware](self, "_groupContextCacheMiddleware");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907DFAC8;
  v11[3] = &unk_1E2C65258;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "latestCachedGroupWithStableID:completion:", v8, v11);

}

- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[IDSGroupContextDataSource _groupContextCacheMiddleware](self, "_groupContextCacheMiddleware");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907DFC18;
  v8[3] = &unk_1E2C62808;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "fetchAllKnownGroups:", v8);

}

- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[IDSGroupContextDataSource _groupContextCacheMiddleware](self, "_groupContextCacheMiddleware");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907DFD68;
  v8[3] = &unk_1E2C60820;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "deleteAllKnownGroupsWithCompletion:", v8);

}

- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  v8 = a4;
  -[IDSGroupContextDataSource _groupContextCacheMiddleware](self, "_groupContextCacheMiddleware");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907DFEA4;
  v11[3] = &unk_1E2C60820;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deleteAllCachedValuesForGroupWithID:WithCompletion:", v8, v11);

}

- (id)_groupContextDataSource
{
  void *v2;
  void *v3;

  +[IDSDaemonProtocolController sharedInstance](IDSDaemonProtocolController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupContextDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_groupContextCacheMiddleware
{
  void *v2;
  void *v3;

  +[IDSDaemonProtocolController sharedInstance](IDSDaemonProtocolController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupContextCacheMiddleware");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
