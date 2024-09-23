@implementation DDAction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fallBackView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_associatedVisualResults, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_ics, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (DDAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v9;
  id v10;
  DDAction *v11;
  DDAction *v12;
  __DDResult *v13;
  uint64_t v14;
  CNContact *contact;
  uint64_t v16;
  NSString *ics;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DDAction;
  v11 = -[DDAction init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_context, a5);
    if (a4)
    {
      v13 = (__DDResult *)DDCreateUpdatedResultWithContext(a4, v10);
      if (!v13)
        v13 = (__DDResult *)CFRetain(a4);
    }
    else
    {
      v13 = 0;
    }
    v12->_result = v13;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Contact"));
    v14 = objc_claimAutoreleasedReturnValue();
    contact = v12->_contact;
    v12->_contact = (CNContact *)v14;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ICS"));
    v16 = objc_claimAutoreleasedReturnValue();
    ics = v12->_ics;
    v12->_ics = (NSString *)v16;

    DDTrackEventCreationInHostApplication(&v12->_hostApplication);
  }

  return v12;
}

- (void)dealloc
{
  __DDResult *result;
  __DDResult *coalescedResult;
  __CFArray *associatedResults;
  objc_super v6;

  result = self->_result;
  if (result)
    CFRelease(result);
  coalescedResult = self->_coalescedResult;
  if (coalescedResult)
    CFRelease(coalescedResult);
  associatedResults = self->_associatedResults;
  if (associatedResults)
    CFRelease(associatedResults);
  v6.receiver = self;
  v6.super_class = (Class)DDAction;
  -[DDAction dealloc](&v6, sel_dealloc);
}

+ (BOOL)isAvailable
{
  return 1;
}

+ (void)setClientActionsDelegate:(id)a3
{
  id v4;
  id obj;

  obj = a1;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak(&_clientActionsDelegate, v4);

  objc_sync_exit(obj);
}

+ (id)clientActionsDelegate
{
  id v2;
  id WeakRetained;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&_clientActionsDelegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)matchingScheme
{
  return &stru_1E4259460;
}

+ (id)contextByAddingValue:(id)a3 toKey:(id)a4 inContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = (id)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v8);
  }
  else if (v7)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v7, v8, 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)encodableContextWithContext:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[15];

  v18[14] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18[0] = CFSTR("EventTitle");
  v18[1] = CFSTR("SelectedText");
  v18[2] = CFSTR("ReferenceDate");
  v18[3] = CFSTR("SpecialURL");
  v18[4] = CFSTR("IsAccountManaged");
  v18[5] = CFSTR("CoreRecents");
  v18[6] = CFSTR("EventComponents");
  v18[7] = CFSTR("ICS");
  v18[8] = CFSTR("Contact");
  v18[9] = CFSTR("LeadingText");
  v18[10] = CFSTR("MiddleText");
  v18[11] = CFSTR("TrailingText");
  v18[12] = CFSTR("GroupTranscript");
  v18[13] = CFSTR("CoreSpotlightUniqueIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *associatedVisualResults;
  CNContact *contact;
  NSString *ics;
  void *v11;
  id v12;

  v12 = a3;
  +[DDAction encodableContextWithContext:](DDAction, "encodableContextWithContext:", self->_context);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("context"));

  if (self->_result)
  {
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("result"));

  }
  if (-[DDAction coalescedResult](self, "coalescedResult"))
  {
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", -[DDAction coalescedResult](self, "coalescedResult"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("coalescedResult"));

  }
  else if (-[DDAction associatedResults](self, "associatedResults"))
  {
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultsFromCoreResults:", -[DDAction associatedResults](self, "associatedResults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("associatedResults"));

    associatedVisualResults = self->_associatedVisualResults;
    if (associatedVisualResults)
      objc_msgSend(v12, "encodeObject:forKey:", associatedVisualResults, CFSTR("associatedVisualResults"));
  }
  contact = self->_contact;
  if (contact)
    objc_msgSend(v12, "encodeObject:forKey:", contact, CFSTR("contact"));
  ics = self->_ics;
  v11 = v12;
  if (ics)
  {
    objc_msgSend(v12, "encodeObject:forKey:", ics, CFSTR("event"));
    v11 = v12;
  }
  objc_msgSend(v11, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isDefaultAction, CFSTR("isDefault"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_hostApplication, CFSTR("hostApplication"));

}

- (DDAction)initWithCoder:(id)a3
{
  id v4;
  DDAction *v5;
  uint64_t v6;
  NSURL *url;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *context;
  uint64_t v20;
  CNContact *contact;
  uint64_t v22;
  NSString *ics;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *associatedVisualResults;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)DDAction;
  v5 = -[DDAction init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = v8;
    v39 = objc_opt_class();
    v38 = objc_opt_class();
    v37 = objc_opt_class();
    v36 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v39, v38, v37, v36, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("context"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v41, "initWithDictionary:", v17);
    context = v5->_context;
    v5->_context = (NSDictionary *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v20 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
    v22 = objc_claimAutoreleasedReturnValue();
    ics = v5->_ics;
    v5->_ics = (NSString *)v22;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("result")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_result = (__DDResult *)CFRetain((CFTypeRef)objc_msgSend(v24, "coreResult"));

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("coalescedResult")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coalescedResult"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_coalescedResult = (__DDResult *)CFRetain((CFTypeRef)objc_msgSend(v25, "coreResult"));

      v5->_cachedCoalescedResult = 1;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("associatedResults")))
    {
      v26 = (void *)MEMORY[0x1E0C99E60];
      v27 = objc_opt_class();
      objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("associatedResults"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_associatedResults = (__CFArray *)copyCoreResultsArray(v29);
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("associatedVisualResults")))
      {
        v30 = (void *)MEMORY[0x1E0C99E60];
        v31 = objc_opt_class();
        objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("associatedVisualResults"));
        v33 = objc_claimAutoreleasedReturnValue();
        associatedVisualResults = v5->_associatedVisualResults;
        v5->_associatedVisualResults = (NSArray *)v33;

      }
      v5->_cachedAssociatedResults = 1;

    }
    v5->_isDefaultAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefault"));
    v5->_hostApplication = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hostApplication"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:result:context:", v9, a4, v8);

  return v10;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:result:context:", v9, a4, v8);

  objc_msgSend(v10, "companionAction");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v19 = v10;
    v20 = v11;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v19;
    v15 = 2;
  }
  else
  {
    v18 = v10;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v18;
    v15 = 1;
  }
  objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)defaultActionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(a1, "isAvailable"))
  {
    objc_msgSend(a1, "actionWithURL:result:context:", v8, a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsDefaultAction:", 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateSourceRect:(CGRect)a3
{
  NSDictionary *v4;
  NSDictionary *context;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", v6, CFSTR("SourceRect"), self->_context);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v4;

}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDAction viewController](self, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action:viewControllerReady:", self, v5);
  objc_msgSend(v4, "action:presentationShouldBeModal:", self, 1);

}

- (int)interactionType
{
  return 0;
}

- (BOOL)hasUserInterface
{
  return -[DDAction interactionType](self, "interactionType") != 0;
}

- (BOOL)canBePerformedByOpeningURL
{
  return 0;
}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  return 0;
}

- (void)perform
{
  -[DDAction performFromView:](self, "performFromView:", 0);
}

- (void)performFromView:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[DDAction performFromView:].cold.1();
}

- (void)_openURL:(id)a3 options:(id)a4 fallbackURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  DDAction *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(33, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke;
  v15[3] = &unk_1E42582F8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __41__DDAction__openURL_options_fallbackURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke_2;
  v7[3] = &unk_1E4258918;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  objc_msgSend(v2, "openURL:options:completionHandler:", v3, v4, v7);

}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  if ((a2 & 1) == 0)
  {
    dispatch_get_global_queue(33, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke_3;
    v6[3] = &unk_1E42582F8;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v9 = v4;
    v10 = v5;
    dispatch_async(v3, v6);

  }
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke_4;
    v13[3] = &unk_1E42588F0;
    v14 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    v15 = v5;
    v16 = v6;
    objc_msgSend(v2, "openURL:options:completionHandler:", v3, v4, v13);

    v7 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *MEMORY[0x1E0D22D88];
    v17[0] = *MEMORY[0x1E0D22DA8];
    v17[1] = v10;
    v18[0] = MEMORY[0x1E0C9AAB0];
    v18[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v8, "openSensitiveURL:withOptions:error:", v9, v11, &v12);
    v7 = v12;

    if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __41__DDAction__openURL_options_fallbackURL___block_invoke_3_cold_1((id *)(a1 + 48));
  }

}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __41__DDAction__openURL_options_fallbackURL___block_invoke_4_cold_1(a1);
}

- (void)_openURL:(id)a3 fromView:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  DDAction *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__DDAction__openURL_fromView_options___block_invoke;
  v15[3] = &unk_1E4258918;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "_openURL:originatingView:options:completionHandler:", v14, v13, v12, v15);

}

void __38__DDAction__openURL_fromView_options___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  if ((a2 & 1) == 0)
  {
    if (dd_isInternalInstall())
    {
      objc_msgSend(*(id *)(a1 + 32), "radarWebURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __38__DDAction__openURL_fromView_options___block_invoke_2;
        v7[3] = &unk_1E4258918;
        v5 = *(_QWORD *)(a1 + 48);
        v7[4] = *(_QWORD *)(a1 + 56);
        v6 = *(_QWORD *)(a1 + 40);
        v8 = *(id *)(a1 + 32);
        v9 = *(id *)(a1 + 48);
        v10 = v3;
        objc_msgSend(v4, "_openURL:originatingView:options:completionHandler:", v10, v6, v5, v7);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "_openURL:options:fallbackURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "_openURL:options:fallbackURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0);
    }
  }
}

uint64_t __38__DDAction__openURL_fromView_options___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_openURL:options:fallbackURL:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56));
  return result;
}

- (void)_performFromView:(id)a3 byOpeningURL:(id)a4
{
  -[DDAction _performFromView:byOpeningURL:disableAppLink:](self, "_performFromView:byOpeningURL:disableAppLink:", a3, a4, 0);
}

- (void)_performFromView:(id)a3 byOpeningURL:(id)a4 disableAppLink:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v5 = a5;
  v15[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9 && -[DDAction canBePerformedByOpeningURL](self, "canBePerformedByOpeningURL"))
  {
    v10 = *MEMORY[0x1E0D22D88];
    v14[0] = *MEMORY[0x1E0D22DA8];
    v14[1] = v10;
    v15[0] = MEMORY[0x1E0C9AAB0];
    v15[1] = MEMORY[0x1E0C9AAB0];
    v15[2] = &unk_1E4269D78;
    v11 = *MEMORY[0x1E0CEBEE8];
    v14[2] = *MEMORY[0x1E0D22D50];
    v14[3] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[DDAction _openURL:fromView:options:](self, "_openURL:fromView:options:", v9, v8, v13);
  }

}

- (DDAction)companionAction
{
  return 0;
}

- (id)localizedName
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[DDAction localizedName].cold.1();
  return &stru_1E4259460;
}

- (id)subtitle
{
  return 0;
}

- (unint64_t)menuItemattributes
{
  return 0;
}

- (unint64_t)groupDisplayOption
{
  return 0;
}

- (id)oneLinerLocalizedSubItemName
{
  return -[DDAction localizedSubItemName:](self, "localizedSubItemName:", 1);
}

- (id)localizedSubItemName
{
  return -[DDAction localizedSubItemName:](self, "localizedSubItemName:", 0);
}

- (id)localizedSubItemName:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  -[DDAction context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContactLabel"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_6:
    -[DDAction context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContactValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[DDAction context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ContactValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[DDAction localizedName](self, "localizedName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    return v16;
  }
  v7 = (void *)v6;
  -[DDAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ContactValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_6;
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    DDLocalizedString(CFSTR("%@: %@"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDAction context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ContactLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDAction context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ContactValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[DDAction context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ContactLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDAction context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ContactValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@\n%@"), v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)isPlaceholderAction
{
  return 0;
}

- (id)notificationIconBundleIdentifier
{
  return 0;
}

- (id)notificationURL
{
  return 0;
}

- (id)url
{
  return self->_url;
}

- (__DDResult)result
{
  return self->_result;
}

- (__DDResult)coalescedResult
{
  __DDResult *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const void *SignatureContainingResult;

  if (self->_cachedCoalescedResult)
    return self->_coalescedResult;
  -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("GroupAllResultsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = copyCoreResultsArray(v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("AllResults"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v3 = 0;
  if (self->_result && v8)
  {
    SignatureContainingResult = (const void *)DDResultGetSignatureContainingResult();
    if (SignatureContainingResult)
      v3 = (__DDResult *)CFRetain(SignatureContainingResult);
    else
      v3 = 0;
    self->_coalescedResult = v3;
    self->_cachedCoalescedResult = 1;
  }

  return v3;
}

- (__CFArray)associatedResults
{
  __CFArray *associatedResults;
  __DDResult *v4;
  NSDictionary *context;
  __CFArray *v6;
  id v7;
  id v8;
  id v10;

  if (self->_cachedAssociatedResults)
    return self->_associatedResults;
  v4 = self->_result;
  context = self->_context;
  v10 = 0;
  v6 = (__CFArray *)copyAssociatedResultsFromResultWithContext(v4, context, &v10);
  v7 = v10;
  v8 = v10;
  self->_associatedResults = v6;
  if (v6)
  {
    objc_storeStrong((id *)&self->_associatedVisualResults, v7);
    self->_cachedAssociatedResults = 1;
    associatedResults = self->_associatedResults;
  }
  else
  {
    associatedResults = 0;
  }

  return associatedResults;
}

- (NSArray)associatedVisualResults
{
  -[DDAction associatedResults](self, "associatedResults");
  return self->_associatedVisualResults;
}

- (id)generateIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.datadetectors.%@.%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)feedbackIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)ambiguousIcon
{
  void *v2;
  void *v3;
  char v4;

  -[DDAction iconName](self, "iconName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isEqualToString:", CFSTR("phone")) & 1) == 0)
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("video"));
  else
    v4 = 1;

  return v4;
}

- (id)iconName
{
  return 0;
}

- (id)variantIconName
{
  void *v2;
  void *v3;

  -[DDAction iconName](self, "iconName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIImage)icon
{
  void *v2;
  void *v3;

  -[DDAction iconName](self, "iconName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIImage *)v3;
}

- (UIImage)compactIcon
{
  void *v3;
  void *v4;

  -[DDAction variantIconName](self, "variantIconName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[DDAction icon](self, "icon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return (UIImage *)v4;
}

- (id)context
{
  return self->_context;
}

- (void)addToRecents
{
  id v3;

  if (self->_result)
  {
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    +[DDCoreRecents addResultToRecents:associatedResults:weight:context:userInitiated:](DDCoreRecents, "addResultToRecents:associatedResults:weight:context:userInitiated:", v3, -[DDAction associatedResults](self, "associatedResults"), 0, self->_context, 1);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p result:%@ URL:%@>"), v5, self, self->_result, self->_url);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  return 0;
}

- (id)displayNameForEmails:(id)a3 phoneNumbers:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v20;
  id v21;
  id obj;
  id obja;
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v20 = a4;
  if ((dd_isDeviceLocked() & 1) != 0
    || objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
  {
    goto LABEL_21;
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v5 = objc_alloc(MEMORY[0x1E0C97210]);
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v45[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v7);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v21;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v6), v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPredicate:", v12);

        v31[4] = &v37;
        v32 = 0;
        v31[0] = v11;
        v31[1] = 3221225472;
        v31[2] = __46__DDAction_displayNameForEmails_phoneNumbers___block_invoke;
        v31[3] = &unk_1E42588C8;
        objc_msgSend(v24, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, &v32, v31);
        ++v6;
      }
      while (v9 != v6);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v9);
  }

  v13 = v38[5];
  if (v13)
    goto LABEL_19;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obja = v20;
  v14 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obja);
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v6), v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPredicate:", v17);

        v25[4] = &v37;
        v26 = 0;
        v25[0] = v16;
        v25[1] = 3221225472;
        v25[2] = __46__DDAction_displayNameForEmails_phoneNumbers___block_invoke_2;
        v25[3] = &unk_1E42588C8;
        objc_msgSend(v24, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, &v26, v25);
        ++v6;
      }
      while (v14 != v6);
      v14 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v14);
  }

  v13 = v38[5];
  if (v13)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v13, 0, v20);
    v6 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }

  _Block_object_dispose(&v37, 8);
  if ((v18 & 1) != 0)
LABEL_21:
    v6 = 0;

  return (id)v6;
}

void __46__DDAction_displayNameForEmails_phoneNumbers___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __46__DDAction_displayNameForEmails_phoneNumbers___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (void)setupPopoverPresentationController:(id)a3 view:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", CFSTR("SourceRect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v6;
    v10 = v9;
    if (!v9)
      goto LABEL_10;
    v11 = v9;
    while (!objc_msgSend(v11, "isHidden"))
    {
      objc_msgSend(v11, "superview");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
      if (!v12)
        goto LABEL_10;
    }
    -[DDAction fallBackView](self, "fallBackView");
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = v7;
    v7 = v11;
    v10 = (void *)v13;
  }
  else
  {
    -[DDAction fallBackView](self, "fallBackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v7 = 0;
LABEL_10:
  objc_msgSend(v10, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {

    v10 = 0;
  }
  objc_msgSend(v15, "setSourceView:", v10);
  objc_msgSend(v15, "_setCentersPopoverIfSourceViewNotSet:", 1);
  if (v7)
    objc_msgSend(v7, "CGRectValue");
  else
    objc_msgSend(v10, "bounds");
  objc_msgSend(v15, "setSourceRect:");

}

- (BOOL)isDefaultAction
{
  return self->_isDefaultAction;
}

- (void)setIsDefaultAction:(BOOL)a3
{
  self->_isDefaultAction = a3;
}

- (BOOL)companion
{
  return self->_isCompanion;
}

- (void)setCompanion:(BOOL)a3
{
  self->_isCompanion = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (int)hostApplication
{
  return self->_hostApplication;
}

- (void)setHostApplication:(int)a3
{
  self->_hostApplication = a3;
}

- (CNContact)contact
{
  return (CNContact *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContact:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (DDActionDelegate)delegate
{
  return (DDActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)fallBackView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_fallBackView);
}

- (void)setFallBackView:(id)a3
{
  objc_storeWeak((id *)&self->_fallBackView, a3);
}

- (BOOL)treatAsMenu
{
  return self->_treatAsMenu;
}

- (void)setTreatAsMenu:(BOOL)a3
{
  self->_treatAsMenu = a3;
}

- (void)setAssociatedVisualResults:(id)a3
{
  objc_storeStrong((id *)&self->_associatedVisualResults, a3);
}

- (void)performFromView:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  objc_opt_class();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Please override -performFromView: in the DDAction subclass %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_3_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_8_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Attempts to open %@ url failed (%@ - %@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_4_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v4, "Attempts to open %@ url failed, including with fallback %@ url (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_1();
}

- (void)localizedName
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_10_0(v0);
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Please override -localizedName in your DDAction subclass %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

@end
