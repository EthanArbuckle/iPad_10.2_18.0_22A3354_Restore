@implementation MPAssistantAddMediaEntityToAcousticIDHistory

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaEntityToAcousticIDHistory aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Entity To Acoustic ID History"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[SAMPAddMediaEntityToAcousticIdHistory adamId](self, "adamId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMPAddMediaEntityToAcousticIdHistory affiliateId](self, "affiliateId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Acoustic ID History (invoke) <%{public}@>: adam ID %{public}@, affiliate ID %{public}@", buf, 0x20u);

  }
  -[SAMPAddMediaEntityToAcousticIdHistory adamId](self, "adamId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  -[SAMPAddMediaEntityToAcousticIdHistory affiliateId](self, "affiliateId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithIdentity:", v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC058]), "initWithRequestContext:storeItemID:affiliateIdentifier:", v17, v13, v14);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1CC9ABF90;
  v20[3] = &unk_1E88E3ED8;
  v20[4] = self;
  v21 = v4;
  v19 = v4;
  objc_msgSend(v18, "performRequestWithCompletionHandler:", v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
