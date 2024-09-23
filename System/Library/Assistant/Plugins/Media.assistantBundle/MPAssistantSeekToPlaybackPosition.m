@implementation MPAssistantSeekToPlaybackPosition

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *requestAceHash;
  NSObject *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[10];
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = *MEMORY[0x1E0D4CC28];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[MPAssistantSeekToPlaybackPosition positionInMilliseconds](self, "positionInMilliseconds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longValue");
  if (v8 >= 0)
    v9 = v8;
  else
    v9 = -v8;
  objc_msgSend(v6, "numberWithDouble:", (double)v9 / 1000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = *MEMORY[0x1E0D4CCC0];
  v37[0] = v10;
  v37[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSeekToPlaybackPosition aceId](self, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Seek To Playback Position"), v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v13;

  }
  _MPLogCategoryAssistant();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_requestAceHash;
    -[MPAssistantSeekToPlaybackPosition hashedRouteUIDs](self, "hashedRouteUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    -[MPAssistantSeekToPlaybackPosition positionInMilliseconds](self, "positionInMilliseconds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v16;
    v32 = 2048;
    v33 = v18;
    v34 = 2114;
    v35 = v19;
    _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_DEFAULT, "Seek To Playback Position (invoke) <%{public}@>: %lu UIDs, %{public}@ position", buf, 0x20u);

  }
  v20 = self->_requestAceHash;
  -[MPAssistantSeekToPlaybackPosition hashedRouteUIDs](self, "hashedRouteUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Seek To Playback Position"), v20, v21);

  v22 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1CC994128;
  v29[3] = &unk_1E88E3DE8;
  v29[4] = v23;
  v29[5] = self;
  v29[6] = v22;
  v29[7] = v11;
  v29[8] = v5;
  v29[9] = v4;
  v24 = v4;
  v25 = v5;
  v26 = v11;
  v27 = v22;
  v28 = v23;
  sub_1CC994128((uint64_t)v29, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
