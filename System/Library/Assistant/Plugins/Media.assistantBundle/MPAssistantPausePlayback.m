@implementation MPAssistantPausePlayback

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  MPAssistantPausePlayback *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantPausePlayback aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Pause Playback"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[MPAssistantPausePlayback hashedRouteUIDs](self, "hashedRouteUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2048;
    v27 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Pause Playback (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);

  }
  v11 = self->_requestAceHash;
  -[MPAssistantPausePlayback hashedRouteUIDs](self, "hashedRouteUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Pause Playback"), v11, v12);

  v13 = objc_alloc_init(MEMORY[0x1E0D4B320]);
  v14 = objc_alloc_init(MEMORY[0x1E0D4B310]);
  -[MPAssistantPausePlayback hashedRouteUIDs](self, "hashedRouteUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1CC982AF0;
  v19[3] = &unk_1E88E3D20;
  v20 = v13;
  v21 = self;
  v22 = v14;
  v23 = v4;
  v16 = v4;
  v17 = v14;
  v18 = v13;
  objc_msgSend(v17, "decodeHashedRouteUIDs:completion:", v15, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
