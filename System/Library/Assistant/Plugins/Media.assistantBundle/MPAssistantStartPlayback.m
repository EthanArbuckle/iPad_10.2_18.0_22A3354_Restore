@implementation MPAssistantStartPlayback

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *requestAceHash;
  NSObject *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[11];
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantStartPlayback aceId](self, "aceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Start Playback"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    -[MPAssistantStartPlayback hashedRouteUIDs](self, "hashedRouteUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v10;
    v32 = 2048;
    v33 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Start Playback (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);

  }
  v12 = self->_requestAceHash;
  -[MPAssistantStartPlayback hashedRouteUIDs](self, "hashedRouteUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Start Playback"), v12, v13);

  v28[0] = *MEMORY[0x1E0D4CBD0];
  -[MPAssistantStartPlayback refId](self, "refId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = *MEMORY[0x1E0D4CCC0];
  v29[0] = v14;
  v29[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPAssistantStartPlayback hashedRouteUIDs](self, "hashedRouteUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("LOCAL_DEVICE"));

  if ((v17 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    -[MPAssistantStartPlayback hashedRouteUIDs](self, "hashedRouteUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1CC97D060;
  v27[3] = &unk_1E88E2778;
  v27[4] = v20;
  v27[5] = v18;
  v27[6] = v19;
  v27[7] = v15;
  v27[8] = v5;
  v27[9] = self;
  v27[10] = v4;
  v21 = v4;
  v22 = v5;
  v23 = v15;
  v24 = v19;
  v25 = v18;
  v26 = v20;
  sub_1CC97D060((uint64_t)v27, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
