@implementation MPAssistantCreateRadioStation

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  MPAssistantCreateRadioStation *v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[8];
  _QWORD v56[5];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  MPAssistantCreateRadioStation *v61;
  id v62;
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  uint8_t buf[4];
  NSString *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantCreateRadioStation aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Create Radio Station"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v47 = v4;
    v9 = self->_requestAceHash;
    -[MPAssistantCreateRadioStation hashedRouteUIDs](self, "hashedRouteUIDs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v46, "count");
    -[MPAssistantCreateRadioStation assetInfo](self, "assetInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      v12 = CFSTR("present");
    else
      v12 = CFSTR("not present");
    -[MPAssistantCreateRadioStation startPlaying](self, "startPlaying");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAssistantCreateRadioStation stationUrl](self, "stationUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v67 = v9;
    v4 = v47;
    v68 = 2048;
    v69 = v10;
    v70 = 2114;
    v71 = v12;
    v72 = 2114;
    v73 = v13;
    v74 = 2114;
    v75 = v14;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Create Radio Station (invoke) <%{public}@>: %lu UIDs, asset info %{public}@, start %{public}@, station %{public}@", buf, 0x34u);

  }
  v15 = self->_requestAceHash;
  -[MPAssistantCreateRadioStation hashedRouteUIDs](self, "hashedRouteUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Create Radio Station"), v15, v16);

  -[MPAssistantCreateRadioStation stationUrl](self, "stationUrl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v64[0] = *MEMORY[0x1E0D4CCE0];
  -[MPAssistantCreateRadioStation startPlaying](self, "startPlaying");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = MEMORY[0x1E0C9AAA0];
  if (v19)
    v21 = v19;
  v64[1] = *MEMORY[0x1E0D4CCC0];
  v65[0] = v21;
  v65[1] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  if (v18)
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D4CD18]);
  -[MPAssistantCreateRadioStation refId](self, "refId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D4CBD0]);
  v25 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = sub_1CC99D6E4;
  v59[3] = &unk_1E88E3518;
  v26 = v23;
  v60 = v26;
  v27 = v4;
  v63 = v27;
  v61 = self;
  v28 = v18;
  v62 = v28;
  v56[0] = v25;
  v56[1] = 3221225472;
  v56[2] = sub_1CC99D7C8;
  v56[3] = &unk_1E88E3568;
  v56[4] = self;
  v29 = (id)MEMORY[0x1D17B0600](v59);
  v57 = v29;
  v30 = v27;
  v58 = v30;
  v31 = (void *)MEMORY[0x1D17B0600](v56);
  -[MPAssistantCreateRadioStation hashedRouteUIDs](self, "hashedRouteUIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    v34 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
    objc_msgSend(MEMORY[0x1E0D4B318], "systemMediaApplicationDestination");
    v49[0] = v25;
    v49[1] = 3221225472;
    v49[2] = sub_1CC99D92C;
    v49[3] = &unk_1E88E3608;
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v51 = self;
    v52 = v34;
    v35 = v26;
    v53 = v35;
    v36 = v30;
    v48 = v30;
    v37 = v29;
    v38 = v26;
    v39 = v31;
    v40 = v24;
    v41 = v28;
    v42 = v36;
    v54 = v36;
    v43 = v34;
    v44 = v50;
    sub_1CC99D92C((uint64_t)v49, 0);

    v28 = v41;
    v24 = v40;
    v31 = v39;
    v26 = v38;
    v29 = v37;
    v30 = v48;

    v45 = v44;
  }
  else
  {
    v55[0] = v25;
    v55[1] = 3221225472;
    v55[2] = sub_1CC99D880;
    v55[3] = &unk_1E88E35B8;
    v55[4] = self;
    v45 = v31;
    v55[5] = v45;
    v43 = v30;
    v55[6] = v43;
    v44 = v29;
    v55[7] = v44;
    sub_1CC99D880((uint64_t)v55, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
