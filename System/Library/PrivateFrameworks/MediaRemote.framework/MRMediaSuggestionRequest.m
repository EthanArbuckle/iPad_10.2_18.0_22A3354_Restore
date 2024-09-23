@implementation MRMediaSuggestionRequest

- (MRMediaSuggestionRequest)initWithBlock:(id)a3
{
  void (**v4)(id, MRMediaSuggestionRequest *);
  MRMediaSuggestionRequest *v5;
  uint64_t v6;
  NSUUID *requestIdentifier;
  objc_super v9;

  v4 = (void (**)(id, MRMediaSuggestionRequest *))a3;
  v9.receiver = self;
  v9.super_class = (Class)MRMediaSuggestionRequest;
  v5 = -[MRMediaSuggestionRequest init](&v9, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    if (!v5->_requestIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = objc_claimAutoreleasedReturnValue();
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSUUID *)v6;

    }
  }

  return v5;
}

+ (id)defaultRequest
{
  return -[MRMediaSuggestionRequest initWithBlock:]([MRMediaSuggestionRequest alloc], "initWithBlock:", &__block_literal_global_29);
}

void __42__MRMediaSuggestionRequest_defaultRequest__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setIncludeArtwork:", 0);
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaxResults:", objc_msgSend(v2, "maximumNumberOfMediaSuggestions"));

  objc_msgSend(v3, "setUseDirectAccess:", 0);
}

+ (id)defaultRequestWithArtwork
{
  void *v2;

  +[MRMediaSuggestionRequest defaultRequest](MRMediaSuggestionRequest, "defaultRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeArtwork:", 1);
  return v2;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRMediaSuggestionRequest requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRMediaSuggestionRequest includeArtwork](self, "includeArtwork"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: requestIdentifier=%@ includeArtwork=%@ maxResults=%ld>"), v4, v5, v6, -[MRMediaSuggestionRequest maxResults](self, "maxResults"));

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIncludeArtwork:", -[MRMediaSuggestionRequest includeArtwork](self, "includeArtwork"));
  objc_msgSend(v4, "setMaxResults:", -[MRMediaSuggestionRequest maxResults](self, "maxResults"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestIdentifier:", v5);

  objc_msgSend(v4, "setUseDirectAccess:", -[MRMediaSuggestionRequest useDirectAccess](self, "useDirectAccess"));
  objc_msgSend(v4, "setIncludeArtwork:", -[MRMediaSuggestionRequest includeArtwork](self, "includeArtwork"));
  return v4;
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__MRMediaSuggestionRequest_performWithCompletion___block_invoke;
  v6[3] = &unk_1E30C7260;
  v7 = v4;
  v5 = v4;
  -[MRMediaSuggestionRequest performWithPreferences:completion:](self, "performWithPreferences:completion:", 0, v6);

}

void __50__MRMediaSuggestionRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("HomeScreen"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)performWithPreferences:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[MRMediaSuggestionRequestOptions defaultOptions](MRMediaSuggestionRequestOptions, "defaultOptions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MRMediaSuggestionRequest performWithPreferences:options:completion:](self, "performWithPreferences:options:completion:", v7, v8, v6);

}

- (void)performWithPreferences:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  objc_class *v38;
  void *v39;
  dispatch_group_t v40;
  void *v41;
  id v42;
  void *v43;
  unint64_t v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void (**v58)(id, void *, _QWORD);
  id v60;
  id v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  MRMediaSuggestionRequest *v65;
  NSObject *v66;
  id v67;
  id v68;
  id v69;
  _BYTE *v70;
  unint64_t v71;
  _QWORD v72[4];
  NSObject *v73;
  MRMediaSuggestionRequest *v74;
  id v75;
  id v76;
  void (**v77)(id, void *, _QWORD);
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  _BYTE v90[128];
  const __CFString *v91;
  _BYTE buf[24];
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v61 = a4;
  v58 = (void (**)(id, void *, _QWORD))a5;
  v50 = v7;
  -[MRMediaSuggestionPreferences snapshot](v7);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v62;
    *(_WORD *)&buf[22] = 2112;
    v93 = v61;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestionRequest] Performing preference-respecting request %{public}@ with preferences %@, options: %@.", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  -[MRMediaSuggestionPreferences globalDisplayPreferencesForContexts](v62);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "contexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v53 = v10;
  }
  else
  {
    +[MRMediaSuggestionPreferences allContexts](MRMediaSuggestionPreferences, "allContexts");
    v53 = (id)objc_claimAutoreleasedReturnValue();
  }

  v12 = MEMORY[0x1E0C809B0];
  if (v62)
  {
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke;
    v88[3] = &unk_1E30C85A8;
    v89 = v54;
    objc_msgSend(v53, "msv_filter:", v88);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v91 = CFSTR("HomeScreen");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MRMediaSuggestionPreferences disabledBundlesForContexts](v62);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v55 = v14;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C99E08];
    v17 = (void *)objc_opt_new();
    objc_msgSend(v16, "dictionaryWithObject:forKey:", v17, CFSTR("HomeScreen"));
    v55 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[MRMediaSuggestionPreferences bundlesDisabledInAllContexts](v62);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v60 = v18;
  else
    v60 = (id)objc_opt_new();

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v85 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
        v25 = (void *)objc_opt_new();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, v24);

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    }
    while (v21);
  }

  objc_msgSend(v61, "bundleIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (v27)
  {
    v31 = 0;
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v61, "bundleIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v12;
    v82[1] = 3221225472;
    v82[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2;
    v82[3] = &unk_1E30C85A8;
    v83 = v60;
    objc_msgSend(v29, "msv_filter:", v82);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v31, "count"))
    {
      v58[2](v58, v9, 0);
      v47 = v83;
      goto LABEL_28;
    }

  }
  softLinkBiomeLibrary[0]();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "App");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "Intent");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)objc_msgSend(objc_alloc((Class)getBMPublisherOptionsClass[0]()), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
  v49 = v32;
  v34 = v12;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v93 = 0;
  v35 = objc_msgSend(v20, "count");
  v36 = -[MRMediaSuggestionRequest maxResults](self, "maxResults");
  v37 = v31;
  v38 = (Class)getINPlayMediaIntentClass[0]();
  NSStringFromClass(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = dispatch_group_create();
  objc_msgSend(v52, "publisherWithOptions:", v51);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v34;
  v78[1] = 3221225472;
  v78[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_3;
  v78[3] = &unk_1E30C85D0;
  v48 = v39;
  v79 = v48;
  v42 = v37;
  v80 = v42;
  v81 = v60;
  objc_msgSend(v41, "filterWithIsIncluded:", v78);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v36 * v35;
  v72[0] = v34;
  v72[1] = 3221225472;
  v72[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_4;
  v72[3] = &unk_1E30C85F8;
  v73 = v40;
  v74 = self;
  v75 = v57;
  v77 = v58;
  v76 = v9;
  v63[0] = v34;
  v63[1] = 3221225472;
  v63[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_89;
  v63[3] = &unk_1E30C8620;
  v64 = v56;
  v65 = self;
  v45 = v73;
  v66 = v45;
  v67 = v20;
  v68 = v55;
  v69 = v76;
  v70 = buf;
  v71 = v44;
  v46 = (id)objc_msgSend(v43, "sinkWithCompletion:shouldContinue:", v72, v63);

  v47 = v49;
  v31 = v42;

  _Block_object_dispose(buf, 8);
LABEL_28:

}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (!v6)
    goto LABEL_6;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

    if (!v10)
      goto LABEL_6;
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "count"))
    goto LABEL_7;
  v11 = *(void **)(a1 + 48);
  objc_msgSend(v3, "eventBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v11, "containsObject:", v13);

  if ((v11 & 1) != 0)
LABEL_6:
    v14 = 0;
  else
LABEL_7:
    v14 = 1;

  return v14;
}

void __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.MediaRemote.MRMediaSuggestionRequest.notifyQueue", v2);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_5;
  v5[3] = &unk_1E30C7B88;
  v4 = *(NSObject **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  dispatch_group_notify(v4, v3, v5);

}

uint64_t __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_5(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", a1[5]);
    v7 = 138543618;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestionRequest] Request %{public}@ finished in %lf seconds.", (uint8_t *)&v7, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

BOOL __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MRMediaSuggestion *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  MRMediaSuggestion *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  MRMediaSuggestion *v54;
  id v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x194036A64]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", getINInteractionClass_0(), v6, &v56);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v56;
  if (v8)
  {
    v9 = 1;
    goto LABEL_28;
  }
  objc_msgSend(v7, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getINPlayMediaIntentClass[0]();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v11, "mediaContainer");
    v48 = (MRMediaSuggestion *)objc_claimAutoreleasedReturnValue();
    -[MRMediaSuggestion identifier](v48, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsObject:", v13) & 1) != 0)
    {

    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "eventBody");
      v46 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleID");
      v45 = v4;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = -[MRMediaSuggestionRequest _intentIsValidSuggestion:sourceBundleID:](v14, v46, v16);

      v4 = v45;
      v11 = v46;

      if (!(_DWORD)v14)
      {
LABEL_26:

        v9 = 0;
        goto LABEL_27;
      }
      v44 = v10;
      v17 = -[MRMediaSuggestion initWithIntent:]([MRMediaSuggestion alloc], "initWithIntent:", v46);
      objc_msgSend(v3, "eventBody");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v17;
      -[MRMediaSuggestion setBundleID:]((uint64_t)v17, v19);

      if (objc_msgSend(*(id *)(a1 + 40), "includeArtwork"))
      {
        objc_msgSend(v46, "mediaContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "artwork");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          v22 = *(_QWORD *)(a1 + 40);
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_92;
          v53[3] = &unk_1E30C7AE8;
          v54 = v17;
          v55 = *(id *)(a1 + 48);
          -[MRMediaSuggestionRequest _artworkForIntent:completion:](v22, v46, v53);

        }
      }
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = *(id *)(a1 + 56);
      v23 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v23)
      {
        v24 = v23;
        v41 = v7;
        v42 = v6;
        v43 = v3;
        v25 = *(_QWORD *)v50;
        v26 = v47;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v50 != v25)
              objc_enumerationMutation(v26);
            v28 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[MRMediaSuggestion bundleID](v17, "bundleID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v29, "containsObject:", v30))
            {

            }
            else
            {
              objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v28);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "count");
              v33 = objc_msgSend(*(id *)(a1 + 40), "maxResults");

              v34 = v32 >= v33;
              v26 = v47;
              v17 = v48;
              if (!v34)
              {
                v35 = *(void **)(a1 + 32);
                objc_msgSend(v46, "mediaContainer");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObject:", v37);

                objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v28);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v48);

                ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
              }
            }
          }
          v24 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v24);
        v6 = v42;
        v3 = v43;
        v10 = v44;
        v4 = v45;
        v8 = 0;
        v7 = v41;
      }
      else
      {
        v4 = v45;
      }
      v11 = v46;

    }
    goto LABEL_26;
  }
  v9 = 1;
LABEL_27:

LABEL_28:
  objc_autoreleasePoolPop(v4);
  if (v9)
    v39 = 1;
  else
    v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) < *(_QWORD *)(a1 + 88);

  return v39;
}

- (uint64_t)_intentIsValidSuggestion:(void *)a3 sourceBundleID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v5 = a2;
  v6 = a3;
  if (a1
    && (objc_msgSend(v5, "mediaContainer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v7,
        v9))
  {
    objc_msgSend(v5, "mediaContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    v12 = 0;
    if (v11 <= 0x13 && ((1 << v11) & 0xF87FE) != 0)
    {
      if ((-[MRMediaSuggestionRequest _bundleIdentifierIsSystemMediaApplication:](a1, v6) & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        v20 = 0;
        objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v20;
        v12 = 0;
        if (v14 || !v13)
        {
          v15 = v13;
          v13 = v14;
        }
        else
        {
          -[objc_class schemaWithBundleRecord:fallbackToSystemSchema:](getINSchemaClass(), "schemaWithBundleRecord:fallbackToSystemSchema:", v13, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v5, "_validParameterCombinationsWithSchema:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "allKeys");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("mediaContainer"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v17, "containsObject:", v18);

          }
          else
          {
            v12 = 0;
          }
        }

      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_92_cold_1(a1, (uint64_t)v5, v6);

  }
  else
  {
    -[MRMediaSuggestion setArtwork:](*(_QWORD *)(a1 + 32), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)_artworkForIntent:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  MRArtwork *v24;
  void *v25;
  MRArtwork *v26;
  _QWORD v27[4];
  id v28;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "mediaContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "artwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_requiresRetrieval");

    objc_msgSend(v5, "mediaContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "artwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __57__MRMediaSuggestionRequest__artworkForIntent_completion___block_invoke;
      v27[3] = &unk_1E30C8648;
      v28 = v6;
      objc_msgSend(v12, "_retrieveImageDataWithReply:", v27);

    }
    else
    {
      objc_msgSend(v11, "_imageData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v26 = [MRArtwork alloc];
        objc_msgSend(v5, "mediaContainer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "artwork");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_imageData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mediaContainer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "artwork");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_imageSize");
        v20 = (uint64_t)v19;
        objc_msgSend(v5, "mediaContainer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "artwork");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_imageSize");
        v24 = -[MRArtwork initWithImageData:height:width:](v26, "initWithImageData:height:width:", v16, v20, (uint64_t)v23);

        (*((void (**)(id, MRArtwork *, _QWORD))v6 + 2))(v6, v24, 0);
      }
      else
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 1, CFSTR("Intent artwork does not require retrieval but has no data."));
        (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v25);

      }
    }
  }

}

- (uint64_t)_bundleIdentifierIsSystemMediaApplication:(uint64_t)IsSystemPodcastApplication
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (IsSystemPodcastApplication)
  {
    if ((MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v3) & 1) != 0)
      IsSystemPodcastApplication = 1;
    else
      IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v4);
  }

  return IsSystemPodcastApplication;
}

void __57__MRMediaSuggestionRequest__artworkForIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  MRArtwork *v5;
  id v6;
  MRArtwork *v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  if (v13)
  {
    v5 = 0;
  }
  else
  {
    v6 = a2;
    v7 = [MRArtwork alloc];
    objc_msgSend(v6, "_imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_imageSize");
    v10 = (uint64_t)v9;
    objc_msgSend(v6, "_imageSize");
    v12 = v11;

    v5 = -[MRArtwork initWithImageData:height:width:](v7, "initWithImageData:height:width:", v8, v10, (uint64_t)v12);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (void)setMaxResults:(unint64_t)a3
{
  self->_maxResults = a3;
}

- (BOOL)includeArtwork
{
  return self->_includeArtwork;
}

- (void)setIncludeArtwork:(BOOL)a3
{
  self->_includeArtwork = a3;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)useDirectAccess
{
  return self->_useDirectAccess;
}

- (void)setUseDirectAccess:(BOOL)a3
{
  self->_useDirectAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

void __70__MRMediaSuggestionRequest_performWithPreferences_options_completion___block_invoke_2_92_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[MRMediaSuggestionRequest] %@ failed to retrieve artwork with error %@", (uint8_t *)&v4, 0x16u);
}

@end
