@implementation HMAssistantAccessControl(HFAdditions)

- (uint64_t)hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages:()HFAdditions currentUserIsOwner:
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int v38;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  _BYTE v45[20];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v43 = v9;
    v44 = 1024;
    *(_DWORD *)v45 = a4;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@ Is Current User the Owner?: %{BOOL}d", buf, 0x12u);

  }
  if (objc_msgSend(a1, "isEnabled"))
  {
    objc_msgSend(a1, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") != 0;

    if (!a4)
      goto LABEL_5;
LABEL_11:
    HFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accessories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    v23 = objc_msgSend(a1, "isEnabled");
    *(_DWORD *)buf = 138413058;
    v43 = v20;
    v44 = 1024;
    *(_DWORD *)v45 = v11;
    *(_WORD *)&v45[4] = 2048;
    *(_QWORD *)&v45[6] = v22;
    *(_WORD *)&v45[14] = 1024;
    *(_DWORD *)&v45[16] = v23;
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@ = %{BOOL}d because (owner case) Owner has Siri (Assistant) accessories count = %lu, self.enabled = %{BOOL}d", buf, 0x22u);

LABEL_25:
    goto LABEL_26;
  }
  v11 = 0;
  if (a4)
    goto LABEL_11;
LABEL_5:
  objc_msgSend(a1, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    HFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v24;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@ No Siri accessories available for this user", buf, 0xCu);

    }
    v25 = 0;
    goto LABEL_23;
  }
  objc_msgSend(a1, "accessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_filter:", &__block_literal_global_127);
  v15 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject count](v15, "count"))
  {
    objc_msgSend(a1, "accessories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_filter:", &__block_literal_global_2_19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[NSObject count](v15, "count");
      v31 = objc_msgSend(v27, "count");
      objc_msgSend(a1, "accessories");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");
      *(_DWORD *)buf = 138413570;
      v43 = v29;
      v44 = 2048;
      *(_QWORD *)v45 = v30;
      *(_WORD *)&v45[8] = 2112;
      *(_QWORD *)&v45[10] = v15;
      *(_WORD *)&v45[18] = 2048;
      v46 = v31;
      v47 = 2112;
      v48 = v27;
      v49 = 2048;
      v50 = v33;
      _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "%@ (non-owner case) Siri Accessories NOT Supporting Voice Recognition (%lu) = [%@] / Supporting Multi-User (%lu) = [%@] (Total Siri Accessory count: (%lu)", buf, 0x3Eu);

    }
    if (!objc_msgSend(v27, "count"))
      NSLog(CFSTR("This should not happen - we can't get here if we have NO Siri accessories that support VR"));
    v34 = objc_msgSend(v27, "count");
    v35 = -[NSObject count](v15, "count") + v34;
    objc_msgSend(a1, "accessories");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v35 != v37)
      NSLog(CFSTR("This should not happen. non VR Siri accessories + VR Siri accessories must = all Siri accessories"));
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __119__HMAssistantAccessControl_HFAdditions__hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages_currentUserIsOwner___block_invoke_6;
    v40[3] = &unk_1EA727840;
    v41 = v7;
    v25 = objc_msgSend(v27, "na_any:", v40);

LABEL_23:
    v11 = objc_msgSend(a1, "isEnabled") & v25;
    HFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(a1, "isEnabled");
    *(_DWORD *)buf = 138413058;
    v43 = v20;
    v44 = 1024;
    *(_DWORD *)v45 = v11;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v25;
    *(_WORD *)&v45[10] = 1024;
    *(_DWORD *)&v45[12] = v38;
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@ = %{BOOL}d (non-owner case) At least one Siri accessory is on a supported Voice Recognition language = %{BOOL}d, & self.enabled = %{BOOL}d", buf, 0x1Eu);
    goto LABEL_25;
  }
  HFLogForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(a1, "isEnabled");
    v19 = -[NSObject count](v15, "count");
    *(_DWORD *)buf = 138412802;
    v43 = v17;
    v44 = 1024;
    *(_DWORD *)v45 = v18;
    *(_WORD *)&v45[4] = 2048;
    *(_QWORD *)&v45[6] = v19;
    _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "%@ = %{BOOL}d (non-owner case) Some Siri accessories don't support Voice Recognition (%lu), so we'll rely on self.enabled", buf, 0x1Cu);

  }
  v11 = objc_msgSend(a1, "isEnabled");
LABEL_26:

  return v11;
}

@end
