@implementation MPAssistantGetVolumeLevel

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
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  MPAssistantGetVolumeLevel *v19;
  id v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetVolumeLevel aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Volume Level"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[MPAssistantGetVolumeLevel hashedRouteUIDs](self, "hashedRouteUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2048;
    v24 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get Volume Level (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);

  }
  v11 = self->_requestAceHash;
  -[MPAssistantGetVolumeLevel hashedRouteUIDs](self, "hashedRouteUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Get Volume Level"), v11, v12);

  v13 = objc_alloc_init(MEMORY[0x1E0D4B310]);
  -[MPAssistantGetVolumeLevel hashedRouteUIDs](self, "hashedRouteUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1CC9AC338;
  v17[3] = &unk_1E88E3F78;
  v18 = v13;
  v19 = self;
  v20 = v4;
  v15 = v4;
  v16 = v13;
  objc_msgSend(v16, "decodeHashedRouteUIDs:completion:", v14, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
