@implementation MPAssistantMusicPlaybackImminent

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantMusicPlaybackImminent aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Music Playback Imminent"), v5);
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
    v20 = v9;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  sub_1CC995B9C();
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v10);
  v11 = self->_requestAceHash;
  -[SAMPMusicPlaybackImminent preloadedUserSharedUserId](self, "preloadedUserSharedUserId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMPMusicPlaybackImminent preloadedUserSharedUserId](self, "preloadedUserSharedUserId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1CC9A4AF4;
  v16[3] = &unk_1E88E3950;
  v17 = v10;
  v18 = v4;
  v16[4] = self;
  v14 = v10;
  v15 = v4;
  sub_1CC995BFC(CFSTR("Music Playback Imminent"), v11, v12, v13, v16);

}

- (void)_perform:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ICUserIdentity *userIdentity;
  void *v11;
  id v12;
  void *v13;
  NSString *v14;
  NSString *requestAceHash;
  NSObject *v16;
  NSString *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  NSNumber *privateListeningEnabled;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  MPAssistantMusicPlaybackImminent *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  NSString *v34;
  __int16 v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D4B338], "systemMediaApplicationDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  v37[0] = *MEMORY[0x1E0D4CBD0];
  -[MPAssistantMusicPlaybackImminent refId](self, "refId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = *MEMORY[0x1E0D4CCC0];
  v38[0] = v7;
  v38[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  userIdentity = self->_userIdentity;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", userIdentity, 1, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  if (v12)
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantMusicPlaybackImminent aceId](self, "aceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Music Playback Imminent"), v13);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v14;

    }
    _MPLogCategoryAssistant();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v34 = v17;
      v35 = 2114;
      v36 = v12;
      v18 = "Music Playback Imminent (perform) <%{public}@>: user identity encoding failed %{public}@";
      v19 = v16;
      v20 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1CC97B000, v19, v20, v18, buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v9, "setObject:forKey:", v11, *MEMORY[0x1E0D4CD30]);
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantMusicPlaybackImminent aceId](self, "aceId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Music Playback Imminent"), v21);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = self->_requestAceHash;
      self->_requestAceHash = v22;

    }
    _MPLogCategoryAssistant();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_requestAceHash;
      *(_DWORD *)buf = 138543619;
      v34 = v24;
      v35 = 2113;
      v36 = v11;
      v18 = "Music Playback Imminent (perform) <%{public}@>: user identity %{private}@";
      v19 = v16;
      v20 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", privateListeningEnabled, *MEMORY[0x1E0D4CCA0]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1CC9A4958;
  v28[3] = &unk_1E88E3978;
  v30 = self;
  v31 = v4;
  v29 = v6;
  v26 = v4;
  v27 = v6;
  objc_msgSend(v27, "sendCommand:toDestination:withOptions:completion:", 132, v5, v9, v28);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
