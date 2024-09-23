@implementation ASCAppLaunchTrampoline

+ (OS_os_log)log
{
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, &__block_literal_global_2);
  return (OS_os_log *)(id)log_log_0;
}

void __29__ASCAppLaunchTrampoline_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCAppLaunchTrampoline");
  v1 = (void *)log_log_0;
  log_log_0 = (uint64_t)v0;

}

- (ASCAppLaunchTrampoline)init
{
  void *v3;
  ASCAppLaunchTrampoline *v4;

  +[ASCWorkspace sharedWorkspace](ASCWorkspace, "sharedWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASCAppLaunchTrampoline initWithWorkspace:](self, "initWithWorkspace:", v3);

  return v4;
}

- (ASCAppLaunchTrampoline)initWithWorkspace:(id)a3
{
  id v5;
  ASCAppLaunchTrampoline *v6;
  ASCAppLaunchTrampoline *v7;
  objc_super v9;

  v5 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v9.receiver = self;
  v9.super_class = (Class)ASCAppLaunchTrampoline;
  v6 = -[ASCAppLaunchTrampoline init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workspace, a3);

  return v7;
}

- (id)handleURL:(id)a3
{
  return -[ASCAppLaunchTrampoline handleURL:workspace:](self, "handleURL:workspace:", a3, self->_workspace);
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return -[ASCAppLaunchTrampoline openApplicationWithBundleIdentifier:payloadURL:workspace:](self, "openApplicationWithBundleIdentifier:payloadURL:workspace:", a3, a4, self->_workspace);
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  return -[ASCAppLaunchTrampoline openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:workspace:](self, "openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:workspace:", a3, a4, a5, self->_workspace);
}

- (id)handleURL:(id)a3 workspace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  ASCAppLaunchTrampoline *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  _QWORD v78[5];
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  const __CFString *v93;
  _BYTE v94[128];
  uint64_t v95;
  const __CFString *v96;
  uint64_t v97;
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v72 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CFDBB8]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v6, 1);
  v71 = v8;
  if (!v8
    || (v9 = v8,
        objc_msgSend(v8, "queryItems"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        !v11))
  {
    v52 = (void *)MEMORY[0x1E0CB35C8];
    v97 = *MEMORY[0x1E0CB2D50];
    v98[0] = CFSTR("Failed while parsing input URL, URL components was nil or empty.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, &v97, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v52;
    v55 = 0;
LABEL_47:
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("ASCAppLaunchTrampolineErrorDomain"), v55, v53);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "finishWithError:", v18);
    v57 = v7;
    goto LABEL_48;
  }
  v70 = self;
  objc_msgSend(v6, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("launchapp"));

  if ((v14 & 1) == 0)
  {
    v56 = (void *)MEMORY[0x1E0CB35C8];
    v95 = *MEMORY[0x1E0CB2D50];
    v96 = CFSTR("Received URL unsuitable for app launch trampoline.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v56;
    v55 = 1;
    goto LABEL_47;
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v9, "queryItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (!v16)
  {

    v18 = 0;
    v73 = 0;
    v74 = 0;
    v75 = 0;
    v76 = 0;
    v77 = 0;
    goto LABEL_51;
  }
  v17 = v16;
  v68 = v6;
  v69 = v7;
  v76 = 0;
  v77 = 0;
  v74 = 0;
  v75 = 0;
  v73 = 0;
  v18 = 0;
  v19 = *(_QWORD *)v89;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v89 != v19)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lowercaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("appid")) & 1) != 0)
      {
        objc_msgSend(v21, "value");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = v21;

          v18 = v25;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v21, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lowercaseString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "isEqualToString:", CFSTR("bundleid")) & 1) != 0)
      {
        objc_msgSend(v21, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = v21;

          v77 = v29;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v21, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lowercaseString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "isEqualToString:", CFSTR("deeplink")) & 1) != 0)
      {
        objc_msgSend(v21, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v33 = v21;

          v76 = v33;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v21, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lowercaseString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v35, "isEqualToString:", CFSTR("eventid")) & 1) != 0)
      {
        objc_msgSend(v21, "value");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = v21;

          v74 = v37;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v21, "name");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lowercaseString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v39, "isEqualToString:", CFSTR("trampolinemetrics")) & 1) != 0)
      {
        objc_msgSend(v21, "value");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v41 = v21;

          v75 = v41;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v21, "name");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lowercaseString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v43, "isEqualToString:", CFSTR("sourceapplication")) & 1) != 0)
      {
        objc_msgSend(v21, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v45 = v21;

          v73 = v45;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v21, "name");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lowercaseString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v47, "isEqualToString:", CFSTR("metrics")) & 1) != 0)
      {
        objc_msgSend(v21, "value");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48 && !v75)
          v75 = v21;
      }
      else
      {

      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  }
  while (v17);

  if (!v18)
  {
    v6 = v68;
    goto LABEL_51;
  }
  v6 = v68;
  if (!v77)
  {
LABEL_51:
    v59 = (void *)MEMORY[0x1E0CB35C8];
    v92 = *MEMORY[0x1E0CB2D50];
    v93 = CFSTR("Missing required parameters for app launch.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("ASCAppLaunchTrampolineErrorDomain"), 2, v60);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "finishWithError:", v49);
    v61 = v7;
    goto LABEL_55;
  }
  objc_msgSend(v76, "value");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v76, "value");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringByRemovingPercentEncoding");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v51);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }

  }
  objc_msgSend(v77, "value");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "openApplicationWithBundleIdentifier:payloadURL:", v62, v49);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke;
  v86[3] = &unk_1E7560398;
  v65 = v69;
  v87 = v65;
  objc_msgSend(v63, "addSuccessBlock:", v86);
  v78[0] = v64;
  v7 = v69;
  v78[1] = 3221225472;
  v78[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_2;
  v78[3] = &unk_1E75603E8;
  v78[4] = v70;
  v18 = v18;
  v79 = v18;
  v76 = v76;
  v80 = v76;
  v74 = v74;
  v81 = v74;
  v75 = v75;
  v82 = v75;
  v73 = v73;
  v83 = v73;
  v66 = v65;
  v84 = v66;
  v85 = v72;
  objc_msgSend(v63, "addErrorBlock:", v78);
  v67 = v66;

LABEL_55:
LABEL_48:

  return v7;
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v2);

}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ASCAppLaunchTrampoline log](ASCAppLaunchTrampoline, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v3;
    _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "Unable to open application, reason %{public}@. Attempting to open product page URL", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productPageURLForAdamId:deeplink:eventId:encodedMetrics:sourceApplication:", v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 88), "openProductURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_34;
    v15[3] = &unk_1E75603C0;
    v16 = *(id *)(a1 + 80);
    objc_msgSend(v12, "addFinishBlock:", v15);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("Failed to construct product page URL.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ASCAppLaunchTrampolineErrorDomain"), 3, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 80), "finishWithError:", v12);
  }

}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_34(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v6);
  }
  else
  {
    +[ASCAppLaunchTrampoline log](ASCAppLaunchTrampoline, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_34_cold_1((uint64_t)v5, v7);

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Failed to open product page.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ASCAppLaunchTrampolineErrorDomain"), 4, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }

}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 workspace:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = (objc_class *)MEMORY[0x1E0CFDBB8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(v8, "openApplicationWithBundleIdentifier:payloadURL:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke;
  v21[3] = &unk_1E7560398;
  v14 = v11;
  v22 = v14;
  objc_msgSend(v12, "addSuccessBlock:", v21);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke_2;
  v19[3] = &unk_1E7560410;
  v15 = v14;
  v20 = v15;
  objc_msgSend(v12, "addErrorBlock:", v19);
  v16 = v20;
  v17 = v15;

  return v17;
}

void __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v2);

}

void __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Failed to open app.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ASCAppLaunchTrampolineErrorDomain"), 5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5 workspace:(id)a6
{
  _BOOL8 v6;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a5;
  v9 = (objc_class *)MEMORY[0x1E0CFDBB8];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v9);
  objc_msgSend(v10, "openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:", v12, v11, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke;
  v23[3] = &unk_1E7560398;
  v16 = v13;
  v24 = v16;
  objc_msgSend(v14, "addSuccessBlock:", v23);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke_2;
  v21[3] = &unk_1E7560410;
  v17 = v16;
  v22 = v17;
  objc_msgSend(v14, "addErrorBlock:", v21);
  v18 = v22;
  v19 = v17;

  return v19;
}

void __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v2);

}

void __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Failed to open app.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ASCAppLaunchTrampolineErrorDomain"), 5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4
{
  return -[ASCAppLaunchTrampoline productPageURLForAdamId:eventId:encodedMetrics:](self, "productPageURLForAdamId:eventId:encodedMetrics:", a3, a4, 0);
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5
{
  return -[ASCAppLaunchTrampoline productPageURLForAdamId:eventId:encodedMetrics:sourceApplication:](self, "productPageURLForAdamId:eventId:encodedMetrics:sourceApplication:", a3, a4, a5, 0);
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5 sourceApplication:(id)a6
{
  return -[ASCAppLaunchTrampoline productPageURLForAdamId:deeplink:eventId:encodedMetrics:sourceApplication:](self, "productPageURLForAdamId:deeplink:eventId:encodedMetrics:sourceApplication:", a3, 0, a4, a5, a6);
}

- (id)productPageURLForAdamId:(id)a3 deeplink:(id)a4 eventId:(id)a5 encodedMetrics:(id)a6 sourceApplication:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  ASCAdamID *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = -[ASCAdamID initWithStringValue:]([ASCAdamID alloc], "initWithStringValue:", v15);

  +[ASCLockupProductDetails URLForLockupID:ofKind:withOfferFlags:](ASCLockupProductDetails, "URLForLockupID:ofKind:withOfferFlags:", v16, CFSTR("app"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (v11 || v12 || v13))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v17, 0);
    objc_msgSend(v18, "queryItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "mutableCopy");

    if (!v20)
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v11)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("deeplink"), v11);
      objc_msgSend(v20, "addObject:", v21);

    }
    if (v12)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("eventid"), v12);
      objc_msgSend(v20, "addObject:", v22);

    }
    if (v13)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("trampolineMetrics"), v13);
      objc_msgSend(v20, "addObject:", v23);

    }
    if (v14)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("sourceApplication"), v14);
      objc_msgSend(v20, "addObject:", v24);

    }
    objc_msgSend(v18, "setQueryItems:", v20);
    objc_msgSend(v18, "URL");
    v25 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v25;
  }

  return v17;
}

- (ASCAppLaunchTrampolineWorkspace)workspace
{
  return self->_workspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_34_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1BCB7B000, a2, OS_LOG_TYPE_ERROR, "Unable to open product page, reason %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
