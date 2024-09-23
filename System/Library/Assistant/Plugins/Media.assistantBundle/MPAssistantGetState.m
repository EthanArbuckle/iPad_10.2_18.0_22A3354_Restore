@implementation MPAssistantGetState

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int);
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  dispatch_group_t v31;
  uint8_t buf[4];
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetState aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v33 = v9;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0D88240]);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = MEMORY[0x1E0C809B0];
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = sub_1CC98315C;
  v29 = &unk_1E88E2930;
  v30 = v10;
  v31 = v12;
  MRMediaRemoteGetNowPlayingInfo();
  dispatch_group_enter(v31);
  v20 = v13;
  v21 = 3221225472;
  v22 = sub_1CC983274;
  v23 = &unk_1E88E2958;
  v24 = v30;
  v25 = v31;
  v14 = v31;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = sub_1CC9832BC;
  block[3] = &unk_1E88E3CA8;
  block[4] = self;
  v18 = v24;
  v19 = v4;
  v15 = v4;
  v16 = v24;
  dispatch_group_notify(v14, v11, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
