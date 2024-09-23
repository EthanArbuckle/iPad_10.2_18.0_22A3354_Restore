@implementation MPAssistantSetVolumeLevel

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
  NSString *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  MPAssistantSetVolumeLevel *v22;
  id v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetVolumeLevel aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Volume Level"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[MPAssistantSetVolumeLevel hashedRouteUIDs](self, "hashedRouteUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[MPAssistantSetVolumeLevel actionType](self, "actionType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAssistantSetVolumeLevel volumeValue](self, "volumeValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v25 = v9;
    v26 = 2048;
    v27 = v11;
    v28 = 2114;
    v29 = v12;
    v30 = 2114;
    v31 = v13;
    v32 = 1024;
    v33 = -[MPAssistantSetVolumeLevel acknowledgedExceedingVolumeLimit](self, "acknowledgedExceedingVolumeLimit");
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Set Volume Level (invoke) <%{public}@>: %lu UIDs, %{public}@ action, %{public}@ volume, %{BOOL}u ack", buf, 0x30u);

  }
  v14 = self->_requestAceHash;
  -[MPAssistantSetVolumeLevel hashedRouteUIDs](self, "hashedRouteUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Set Volume Level"), v14, v15);

  v16 = objc_alloc_init(MEMORY[0x1E0D4B310]);
  -[MPAssistantSetVolumeLevel hashedRouteUIDs](self, "hashedRouteUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1CC99F688;
  v20[3] = &unk_1E88E3F78;
  v21 = v16;
  v22 = self;
  v23 = v4;
  v18 = v4;
  v19 = v16;
  objc_msgSend(v19, "decodeHashedRouteUIDs:completion:", v17, v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
}

@end
