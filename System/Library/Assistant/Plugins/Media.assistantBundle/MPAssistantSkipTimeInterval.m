@implementation MPAssistantSkipTimeInterval

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
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[10];
  int v35;
  _QWORD v36[3];
  _QWORD v37[3];
  uint8_t buf[4];
  NSString *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSkipTimeInterval aceId](self, "aceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Skip Time Interval"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    -[MPAssistantSkipTimeInterval hashedRouteUIDs](self, "hashedRouteUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    -[MPAssistantSkipTimeInterval adjustmentInMilliseconds](self, "adjustmentInMilliseconds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v10;
    v40 = 2048;
    v41 = v12;
    v42 = 2114;
    v43 = v13;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Skip Time Interval (invoke) <%{public}@>: %lu UIDs, %{public}@ milliseconds", buf, 0x20u);

  }
  v14 = self->_requestAceHash;
  -[MPAssistantSkipTimeInterval hashedRouteUIDs](self, "hashedRouteUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Skip Time Interval"), v14, v15);

  -[MPAssistantSkipTimeInterval adjustmentInMilliseconds](self, "adjustmentInMilliseconds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v18 >= 0.0)
    v19 = 17;
  else
    v19 = 18;
  v36[0] = *MEMORY[0x1E0D4CCF0];
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[MPAssistantSkipTimeInterval adjustmentInMilliseconds](self, "adjustmentInMilliseconds");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "longValue");
  if (v22 >= 0)
    v23 = v22;
  else
    v23 = -v22;
  objc_msgSend(v20, "numberWithDouble:", (double)v23 / 1000.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  v36[1] = *MEMORY[0x1E0D4CBD0];
  -[MPAssistantSkipTimeInterval refId](self, "refId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = *MEMORY[0x1E0D4CCC0];
  v37[1] = v25;
  v37[2] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1CC9A2690;
  v34[3] = &unk_1E88E38B0;
  v34[4] = v28;
  v34[5] = self;
  v35 = v19;
  v34[6] = v27;
  v34[7] = v26;
  v34[8] = v5;
  v34[9] = v4;
  v29 = v4;
  v30 = v5;
  v31 = v26;
  v32 = v27;
  v33 = v28;
  sub_1CC9A2690((uint64_t)v34, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
