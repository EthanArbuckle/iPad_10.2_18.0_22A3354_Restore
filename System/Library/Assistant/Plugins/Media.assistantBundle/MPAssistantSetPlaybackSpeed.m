@implementation MPAssistantSetPlaybackSpeed

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
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[10];
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetPlaybackSpeed aceId](self, "aceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Seek To Playback Speed"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    -[MPAssistantSetPlaybackSpeed hashedRouteUIDs](self, "hashedRouteUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    -[MPAssistantSetPlaybackSpeed scalingFactor](self, "scalingFactor");
    *(_DWORD *)buf = 138543874;
    v30 = v10;
    v31 = 2048;
    v32 = v12;
    v33 = 2048;
    v34 = v13;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Seek To Playback Speed (invoke) <%{public}@>: %lu UIDs, %f speed", buf, 0x20u);

  }
  v14 = self->_requestAceHash;
  -[MPAssistantSetPlaybackSpeed hashedRouteUIDs](self, "hashedRouteUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Seek To Playback Speed"), v14, v15);

  v27[0] = *MEMORY[0x1E0D4CC48];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[MPAssistantSetPlaybackSpeed scalingFactor](self, "scalingFactor");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = *MEMORY[0x1E0D4CCC0];
  v28[0] = v17;
  v28[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1CC98FE34;
  v26[3] = &unk_1E88E3DE8;
  v26[4] = v20;
  v26[5] = self;
  v26[6] = v19;
  v26[7] = v18;
  v26[8] = v5;
  v26[9] = v4;
  v21 = v4;
  v22 = v5;
  v23 = v18;
  v24 = v19;
  v25 = v20;
  sub_1CC98FE34((uint64_t)v26, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
