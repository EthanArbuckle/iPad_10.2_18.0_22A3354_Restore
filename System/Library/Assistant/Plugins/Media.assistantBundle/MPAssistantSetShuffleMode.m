@implementation MPAssistantSetShuffleMode

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  NSString *v7;
  NSString *requestAceHash;
  NSObject *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void (**v28)(id, id);
  id v29;
  id v30;
  id v31;
  _QWORD v32[10];
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetShuffleMode aceId](self, "aceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Shuffle Mode"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    -[MPAssistantSetShuffleMode hashedRouteUIDs](self, "hashedRouteUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    -[MPAssistantSetShuffleMode shuffleMode](self, "shuffleMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v10;
    v37 = 2048;
    v38 = v12;
    v39 = 2114;
    v40 = v13;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Set Shuffle Mode (invoke) <%{public}@>: %lu UIDs, %{public}@ mode", buf, 0x20u);

  }
  v14 = self->_requestAceHash;
  -[MPAssistantSetShuffleMode hashedRouteUIDs](self, "hashedRouteUIDs");
  v15 = objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Set Shuffle Mode"), v14, (void *)v15);

  -[MPAssistantSetShuffleMode shuffleMode](self, "shuffleMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D88EE0]);

  if ((v15 & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    -[MPAssistantSetShuffleMode shuffleMode](self, "shuffleMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D88ED8]);

    if ((v19 & 1) != 0)
    {
      v17 = 2;
    }
    else
    {
      -[MPAssistantSetShuffleMode shuffleMode](self, "shuffleMode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D88EE8]);

      if ((v21 & 1) == 0)
      {
        v31 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
        objc_msgSend(v31, "dictionary");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v30);
        goto LABEL_12;
      }
      v17 = 3;
    }
  }
  v33[0] = *MEMORY[0x1E0D4CCE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v22;
  v33[1] = *MEMORY[0x1E0D4CBD0];
  -[MPAssistantSetShuffleMode refId](self, "refId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = *MEMORY[0x1E0D4CCC0];
  v34[1] = v23;
  v34[2] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1CC985AEC;
  v32[3] = &unk_1E88E3DE8;
  v32[4] = v26;
  v32[5] = self;
  v32[6] = v25;
  v32[7] = v24;
  v27 = v5;
  v32[8] = v27;
  v28 = v4;
  v32[9] = v28;
  v29 = v24;
  v30 = v25;
  v31 = v26;
  sub_1CC985AEC((uint64_t)v32, 0);

LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
