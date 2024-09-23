@implementation MPAssistantDecreasePlaybackSpeed

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
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[10];
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantDecreasePlaybackSpeed aceId](self, "aceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Decrease Playback Speed"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    -[MPAssistantDecreasePlaybackSpeed hashedRouteUIDs](self, "hashedRouteUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2048;
    v29 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Decrease Playback Speed (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);

  }
  v12 = self->_requestAceHash;
  -[MPAssistantDecreasePlaybackSpeed hashedRouteUIDs](self, "hashedRouteUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Decrease Playback Speed"), v12, v13);

  v14 = *MEMORY[0x1E0D4CCC0];
  v24[0] = *MEMORY[0x1E0D4CC88];
  v24[1] = v14;
  v25[0] = &unk_1E88E9D18;
  v25[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1CC986AF0;
  v23[3] = &unk_1E88E3DE8;
  v23[4] = v17;
  v23[5] = self;
  v23[6] = v16;
  v23[7] = v15;
  v23[8] = v5;
  v23[9] = v4;
  v18 = v4;
  v19 = v5;
  v20 = v15;
  v21 = v16;
  v22 = v17;
  sub_1CC986AF0((uint64_t)v23, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
