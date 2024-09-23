@implementation MPAssistantSkipToPreviousItem

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *requestAceHash;
  NSObject *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  MPCAssistantCommand *v18;
  MPCAssistantCommand *command;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[9];
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  uint64_t v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = *MEMORY[0x1E0D4CBD0];
  -[MPAssistantSkipToPreviousItem refId](self, "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D4CCD0];
  v31[0] = v6;
  v31[1] = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0D4CCC0];
  v30[1] = v7;
  v30[2] = v8;
  v31[2] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSkipToPreviousItem aceId](self, "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Seek To Previous Item"), v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v11;

  }
  _MPLogCategoryAssistant();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_requestAceHash;
    -[MPAssistantSkipToPreviousItem hashedRouteUIDs](self, "hashedRouteUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    v28 = 2048;
    v29 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_DEFAULT, "Seek To Previous Item (invoke) <%{public}@>: %lu UIDs", buf, 0x16u);

  }
  v16 = self->_requestAceHash;
  -[MPAssistantSkipToPreviousItem hashedRouteUIDs](self, "hashedRouteUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Seek To Previous Item"), v16, v17);

  v18 = (MPCAssistantCommand *)objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  command = self->command;
  self->command = v18;

  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1CC99161C;
  v25[3] = &unk_1E88E3608;
  v25[4] = v20;
  v25[5] = self;
  v25[6] = v9;
  v25[7] = v5;
  v25[8] = v4;
  v21 = v4;
  v22 = v5;
  v23 = v9;
  v24 = v20;
  sub_1CC99161C((uint64_t)v25, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->command, 0);
}

@end
