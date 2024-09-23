@implementation MPAssistantSkipToNextItem

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *requestAceHash;
  NSObject *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[10];
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = *MEMORY[0x1E0D4CBD0];
  -[MPAssistantSkipToNextItem refId](self, "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = *MEMORY[0x1E0D4CCC0];
  v29[0] = v6;
  v29[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSkipToNextItem aceId](self, "aceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Skip To Next Item"), v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v9;

  }
  _MPLogCategoryAssistant();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_requestAceHash;
    -[MPAssistantSkipToNextItem hashedRouteUIDs](self, "hashedRouteUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    v26 = 2048;
    v27 = objc_msgSend(v13, "count");
    _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Skip To Next Item (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);

  }
  v14 = self->_requestAceHash;
  -[MPAssistantSkipToNextItem hashedRouteUIDs](self, "hashedRouteUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Skip To Next Item"), v14, v15);

  v16 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1CC99EDE4;
  v23[3] = &unk_1E88E3DE8;
  v23[4] = v17;
  v23[5] = self;
  v23[6] = v16;
  v23[7] = v7;
  v23[8] = v5;
  v23[9] = v4;
  v18 = v4;
  v19 = v5;
  v20 = v7;
  v21 = v16;
  v22 = v17;
  sub_1CC99EDE4((uint64_t)v23, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
