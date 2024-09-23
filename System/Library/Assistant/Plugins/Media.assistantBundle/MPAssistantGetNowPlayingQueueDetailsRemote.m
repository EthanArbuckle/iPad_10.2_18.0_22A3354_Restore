@implementation MPAssistantGetNowPlayingQueueDetailsRemote

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  dispatch_group_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  NSObject *v27;
  NSString *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  MPAssistantGetNowPlayingQueueDetailsRemote *v32;
  dispatch_group_t v33;
  id v34;
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetNowPlayingQueueDetailsRemote aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Now Playing Queue Details Remote"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[MPAssistantGetNowPlayingQueueDetailsRemote hashedRouteUIDs](self, "hashedRouteUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[MPAssistantGetNowPlayingQueueDetailsRemote queueDetails](self, "queueDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAssistantGetNowPlayingQueueDetailsRemote routeTimeout](self, "routeTimeout");
    *(_DWORD *)buf = 138544130;
    v36 = v9;
    v37 = 2048;
    v38 = v11;
    v39 = 2114;
    v40 = v13;
    v41 = 2048;
    v42 = v14;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details Remote (invoke) <%{public}@>: %lu UIDs, queue %{public}@, timeout %f", buf, 0x2Au);

  }
  v15 = self->_requestAceHash;
  -[MPAssistantGetNowPlayingQueueDetailsRemote hashedRouteUIDs](self, "hashedRouteUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Get Now Playing Queue Details Remote"), v15, v16);

  -[MPAssistantGetNowPlayingQueueDetailsRemote hashedRouteUIDs](self, "hashedRouteUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 == 1)
  {
    v19 = dispatch_group_create();
    v20 = objc_alloc_init(MEMORY[0x1E0D4B310]);
    -[MPAssistantGetNowPlayingQueueDetailsRemote hashedRouteUIDs](self, "hashedRouteUIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1CC9A94D0;
    v30[3] = &unk_1E88E3D20;
    v31 = v20;
    v32 = self;
    v33 = v19;
    v34 = v4;
    v22 = v19;
    v23 = v20;
    objc_msgSend(v23, "decodeHashedRouteUIDs:completion:", v21, v30);

  }
  else
  {
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("Too many UIDs requested"));
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantGetNowPlayingQueueDetailsRemote aceId](self, "aceId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Now Playing Queue Details Remote"), v24);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_requestAceHash;
      self->_requestAceHash = v25;

    }
    _MPLogCategoryAssistant();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = self->_requestAceHash;
      objc_msgSend(v23, "dictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v28;
      v37 = 2114;
      v38 = (uint64_t)v29;
      _os_log_impl(&dword_1CC97B000, v27, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    objc_msgSend(v23, "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, NSObject *))v4 + 2))(v4, v22);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
