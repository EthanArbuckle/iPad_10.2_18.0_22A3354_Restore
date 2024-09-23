@implementation AMSFollowUpNotification

- (AMSFollowUpNotification)init
{
  AMSFollowUpNotification *v2;
  uint64_t v3;
  NSSet *options;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSFollowUpNotification;
  v2 = -[AMSFollowUpNotification init](&v6, sel_init);
  if (v2)
  {
    +[AMSFollowUpNotification defaultOptions](AMSFollowUpNotification, "defaultOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    options = v2->_options;
    v2->_options = (NSSet *)v3;

  }
  return v2;
}

- (AMSFollowUpNotification)initWithJSONDictionary:(id)a3 parentIdentifier:(id)a4 logKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSFollowUpNotification *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  AMSFollowUpAction *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSSet *options;
  AMSFollowUpAction *activateAction;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[AMSFollowUpNotification init](self, "init");
  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("options"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activateAction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    v16 = -[AMSFollowUpAction initWithJSONDictionary:parentIdentifier:]([AMSFollowUpAction alloc], "initWithJSONDictionary:parentIdentifier:", v15, v9);
    -[AMSFollowUpAction setLogKey:](v16, "setLogKey:", v10);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v28 = v15;
      v29 = v13;
      v30 = v10;
      v31 = v9;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            +[AMSFollowUpNotification optionForString:](AMSFollowUpNotification, "optionForString:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v22), v28, v29, v30, v31, (_QWORD)v32);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v17, "addObject:", v23);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v20);
      }

      v10 = v30;
      v9 = v31;
      v15 = v28;
      v13 = v29;
      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v17);
        v24 = objc_claimAutoreleasedReturnValue();
        options = v11->_options;
        v11->_options = (NSSet *)v24;

      }
    }
    activateAction = v11->_activateAction;
    v11->_activateAction = v16;

  }
  return v11;
}

- (id)generateNotification
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v3 = (void *)getFLFollowUpNotificationClass_softClass;
  v17 = getFLFollowUpNotificationClass_softClass;
  if (!getFLFollowUpNotificationClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getFLFollowUpNotificationClass_block_invoke;
    v13[3] = &unk_1E253DDB8;
    v13[4] = &v14;
    __getFLFollowUpNotificationClass_block_invoke((uint64_t)v13);
    v3 = (void *)v15[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v14, 8);
  v5 = objc_alloc_init(v4);
  -[AMSFollowUpNotification title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  -[AMSFollowUpNotification informativeText](self, "informativeText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInformativeText:", v7);

  -[AMSFollowUpNotification options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOptions:", v8);

  objc_msgSend(v5, "setFirstNotificationDelay:", 0.0);
  -[AMSFollowUpNotification activateAction](self, "activateAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSFollowUpNotification activateAction](self, "activateAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generateAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setActivateAction:", v11);
  }
  return v5;
}

+ (id)defaultOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  getFLNotificationOptionLockscreen();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionNotificationCenter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getFLNotificationOptionBannerAlert();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)optionForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[2];
  id v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = CFSTR("bannerAlert");
  getFLNotificationOptionBannerAlert();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = CFSTR("lockScreen");
  getFLNotificationOptionLockscreen();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  v17[2] = CFSTR("keepOnLockscreen");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v6 = (id *)getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr;
  v16 = getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr;
  if (!getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr)
  {
    v7 = (void *)CoreFollowUpLibrary_0();
    v6 = (id *)dlsym(v7, "FLNotificationOptionKeepOnLockscreen");
    v14[3] = (uint64_t)v6;
    getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v19 = *v6;
  v17[3] = CFSTR("notificationCenter");
  v8 = v19;
  getFLNotificationOptionNotificationCenter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_storeStrong((id *)&self->_informativeText, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (AMSFollowUpAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
  objc_storeStrong((id *)&self->_activateAction, a3);
}

- (NSSet)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
}

@end
