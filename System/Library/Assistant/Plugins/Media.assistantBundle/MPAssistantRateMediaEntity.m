@implementation MPAssistantRateMediaEntity

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
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[11];
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAssistantRateMediaEntity hashedRouteUID](self, "hashedRouteUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MPAssistantRateMediaEntity hashedRouteUID](self, "hashedRouteUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantRateMediaEntity aceId](self, "aceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Rate Media Entity"), v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v9;

  }
  _MPLogCategoryAssistant();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_requestAceHash;
    *(_DWORD *)buf = 138543874;
    v28 = v12;
    v29 = 2048;
    v30 = objc_msgSend(v6, "count");
    v31 = 2048;
    v32 = -[MPAssistantRateMediaEntity rating](self, "rating");
    _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Rate Media Entity (invoke) <%{public}@>: %lu UIDs rating %ld", buf, 0x20u);
  }

  sub_1CC994B48(CFSTR("Rate Media Entity"), self->_requestAceHash, v6);
  v13 = (double)-[MPAssistantRateMediaEntity rating](self, "rating") / 5.0;
  *(float *)&v13 = v13;
  v25[0] = *MEMORY[0x1E0D4CCB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = *MEMORY[0x1E0D4CCC0];
  v26[0] = v14;
  v26[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(MEMORY[0x1E0D4B318], "nowPlayingApplicationDestination");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1CC97C918;
  v24[3] = &unk_1E88E2778;
  v24[4] = v17;
  v24[5] = v6;
  v24[6] = v16;
  v24[7] = v15;
  v24[8] = v5;
  v24[9] = self;
  v24[10] = v4;
  v18 = v4;
  v19 = v5;
  v20 = v15;
  v21 = v16;
  v22 = v6;
  v23 = v17;
  sub_1CC97C918((uint64_t)v24, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
