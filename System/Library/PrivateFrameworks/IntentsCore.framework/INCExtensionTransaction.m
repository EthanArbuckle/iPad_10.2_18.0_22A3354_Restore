@implementation INCExtensionTransaction

- (INCExtensionTransaction)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5
{
  id v9;
  id v10;
  INCExtensionTransaction *v11;
  INCExtensionTransaction *v12;
  uint64_t v13;
  NSString *groupIdentifier;
  NSMutableDictionary *v15;
  NSMutableDictionary *userActivitiesByIdentifier;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)INCExtensionTransaction;
  v11 = -[INCExtensionTransaction init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_currentIntent, a3);
    v12->_donateInteraction = a4;
    v13 = objc_msgSend(v10, "copy");
    groupIdentifier = v12->_groupIdentifier;
    v12->_groupIdentifier = (NSString *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userActivitiesByIdentifier = v12->_userActivitiesByIdentifier;
    v12->_userActivitiesByIdentifier = v15;

    v12->_shouldResetRequestAfterHandle = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.intents.INCExtensionTransaction.internal-queue", v17);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v18;

  }
  return v12;
}

- (INCExtensionRequest)request
{
  INCExtensionRequest *request;
  INCExtensionRequest *v4;
  void *v5;
  INCExtensionRequest *v6;
  INCExtensionRequest *v7;

  request = self->_request;
  if (!request)
  {
    v4 = [INCExtensionRequest alloc];
    -[INIntent identifier](self->_currentIntent, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[INCExtensionRequest initWithIdentifier:](v4, "initWithIdentifier:", v5);
    v7 = self->_request;
    self->_request = v6;

    request = self->_request;
  }
  return request;
}

- (INIntent)currentIntent
{
  return self->_currentIntent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_currentIntentResponse, 0);
  objc_storeStrong((id *)&self->_currentIntent, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userActivitiesByIdentifier, 0);
}

- (void)setState:(id)a3
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_state, a3);
  v6 = (os_log_t *)MEMORY[0x1E0CBD670];
  v7 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[INCExtensionTransaction setState:]";
    v18 = 2112;
    v19 = (unint64_t)v5;
    _os_log_impl(&dword_1B727D000, v7, OS_LOG_TYPE_INFO, "%s state = %@", (uint8_t *)&v16, 0x16u);
  }
  if (v5)
  {
    v8 = objc_msgSend(v5, "type");
    if (v8 - 1 >= 5)
    {
      v12 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        if (v8 > 5)
          v14 = 0;
        else
          v14 = off_1E6BC4158[v8];
        v15 = v14;
        v16 = 136315650;
        v17 = "-[INCExtensionTransaction setState:]";
        v18 = 2048;
        v19 = v8;
        v20 = 2112;
        v21 = v15;
        _os_log_error_impl(&dword_1B727D000, v13, OS_LOG_TYPE_ERROR, "%s %ld (%@) is not an expected state type and therefore not handled.", (uint8_t *)&v16, 0x20u);

      }
    }
    else
    {
      objc_msgSend(v5, "intent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "intentResponse");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCExtensionTransaction _setCurrentIntent:](self, "_setCurrentIntent:", v9);
      -[INCExtensionTransaction _setCurrentIntentResponse:](self, "_setCurrentIntentResponse:", v10);
      -[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:](self, "_updateCurrentUserActivityForType:intent:intentResponse:", v8, v9, v10);
      objc_msgSend(v5, "userActivities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCExtensionTransaction _addUserActivities:](self, "_addUserActivities:", v11);

      if (v8 == 5 && -[INCExtensionTransaction shouldResetRequestAfterHandle](self, "shouldResetRequestAfterHandle"))
        -[INCExtensionRequest reset](self->_request, "reset");
    }
  }

}

- (void)_setCurrentIntent:(id)a3
{
  INIntent *v5;
  INIntent **p_currentIntent;
  INIntent *currentIntent;
  INIntent *v8;

  v5 = (INIntent *)a3;
  currentIntent = self->_currentIntent;
  p_currentIntent = &self->_currentIntent;
  if (currentIntent != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_currentIntent, a3);
    v5 = v8;
  }

}

- (void)_setCurrentIntentResponse:(id)a3
{
  objc_storeStrong((id *)&self->_currentIntentResponse, a3);
}

- (void)_updateCurrentUserActivityForType:(int64_t)a3 intent:(id)a4 intentResponse:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  NSObject *queue;
  char *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  INCExtensionTransaction *v39;
  _QWORD v40[4];
  char *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "userActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_intents_copy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[INCExtensionTransaction currentUserActivity](self, "currentUserActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0CA5920]);
      objc_msgSend(v9, "_className");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v13, "initWithActivityType:", v14);

    }
  }
  v15 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "_init");
  objc_storeStrong((id *)&v15[*MEMORY[0x1E0CBDD50]], a4);
  objc_storeStrong((id *)&v15[*MEMORY[0x1E0CBDD58]], a5);
  -[INCExtensionTransaction groupIdentifier](self, "groupIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setGroupIdentifier:", v16);

  objc_msgSend(v15, "setIntentHandlingStatus:", objc_msgSend(v10, "_intentHandlingStatus"));
  v17 = MEMORY[0x1E0C809B0];
  if (a3 <= 4)
  {
    objc_msgSend(v15, "setIntentHandlingStatus:", 5);
    goto LABEL_20;
  }
  if (a3 != 5)
  {
    v21 = (void *)*MEMORY[0x1E0CBD670];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = v21;
    objc_msgSend(v22, "numberWithInteger:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v43 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]";
    v44 = 2112;
    v45 = v24;
    _os_log_error_impl(&dword_1B727D000, v23, OS_LOG_TYPE_ERROR, "%s Unknown INCExtensionTransactionStateType %@", buf, 0x16u);

LABEL_19:
    goto LABEL_20;
  }
  v18 = objc_msgSend(v10, "_intentResponseCode");
  if (v18 > 8)
    goto LABEL_20;
  v19 = v18;
  if (((1 << v18) & 0x163) != 0)
  {
    v20 = (void *)*MEMORY[0x1E0CBD670];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      goto LABEL_20;
    goto LABEL_18;
  }
  v25 = -[INCExtensionTransaction donateInteraction](self, "donateInteraction");
  v20 = (void *)*MEMORY[0x1E0CBD670];
  v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO);
  if (!v25)
  {
    if (!v26)
      goto LABEL_20;
LABEL_18:
    v30 = (void *)MEMORY[0x1E0CB37E8];
    v23 = v20;
    objc_msgSend(v30, "numberWithInteger:", v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v32 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v43 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]";
    v44 = 2112;
    v45 = v31;
    v46 = 2112;
    v47 = v32;
    _os_log_impl(&dword_1B727D000, v23, OS_LOG_TYPE_INFO, "%s _intentResponseCode = %@, NOT donating interaction with identifier %@", buf, 0x20u);

    goto LABEL_19;
  }
  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = v20;
    objc_msgSend(v27, "numberWithInteger:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v43 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]";
    v44 = 2112;
    v45 = v29;
    v46 = 2112;
    v47 = v15;
    _os_log_impl(&dword_1B727D000, v28, OS_LOG_TYPE_INFO, "%s _intentResponseCode = %@, donating interaction %@", buf, 0x20u);

  }
  v40[0] = v17;
  v40[1] = 3221225472;
  v40[2] = __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke;
  v40[3] = &unk_1E6BC49F0;
  v41 = v15;
  objc_msgSend(v41, "donateInteractionWithCompletion:", v40);

LABEL_20:
  queue = self->_queue;
  v36[0] = v17;
  v36[1] = 3221225472;
  v36[2] = __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke_11;
  v36[3] = &unk_1E6BC4120;
  v37 = v12;
  v38 = v15;
  v39 = self;
  v34 = v15;
  v35 = v12;
  dispatch_sync(queue, v36);

}

- (NSUserActivity)currentUserActivity
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__INCExtensionTransaction_currentUserActivity__block_invoke;
  v5[3] = &unk_1E6BC3FB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUserActivity *)v3;
}

void __46__INCExtensionTransaction_currentUserActivity__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

void __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setInteraction:donate:", *(_QWORD *)(a1 + 40), 0);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 32), *(id *)(a1 + 32));
}

- (void)_addUserActivities:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CBD670];
  v6 = (void *)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    *(_DWORD *)buf = 136315394;
    v23 = "-[INCExtensionTransaction _addUserActivities:]";
    v24 = 2048;
    v25 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B727D000, v7, OS_LOG_TYPE_INFO, "%s Adding %tu user activities...", buf, 0x16u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    *(_QWORD *)&v10 = 136315650;
    v17 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "_intentsIdentifier", v17, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSMutableDictionary setObject:forKey:](self->_userActivitiesByIdentifier, "setObject:forKey:", v14, v15);
          v16 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            v23 = "-[INCExtensionTransaction _addUserActivities:]";
            v24 = 2112;
            v25 = (uint64_t)v14;
            v26 = 2112;
            v27 = v15;
            _os_log_impl(&dword_1B727D000, v16, OS_LOG_TYPE_INFO, "%s Added user activity %@ with identifier %@.", buf, 0x20u);
          }
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v11);
  }

}

- (INCExtensionTransactionState)state
{
  return self->_state;
}

- (INIntentResponse)currentIntentResponse
{
  return self->_currentIntentResponse;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  INIntent *currentIntent;
  NSUserActivity *currentUserActivity;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INCExtensionTransaction;
  -[INCExtensionTransaction description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent identifier](self->_currentIntent, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentIntent = self->_currentIntent;
  currentUserActivity = self->_currentUserActivity;
  -[NSMutableDictionary allKeys](self->_userActivitiesByIdentifier, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {identifier = %@, currentIntent = %@, currentUserActivity = %@, userActivitiesIdentifiers = %@}"), v4, v5, currentIntent, currentUserActivity, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)userActivityWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKey:](self->_userActivitiesByIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CBD670];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v7)
    {
      v9 = 136315394;
      v10 = "-[INCExtensionTransaction userActivityWithIdentifier:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Unable to find user activity with identifier %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_7;
  }
  if (v7)
  {
    v9 = 136315650;
    v10 = "-[INCExtensionTransaction userActivityWithIdentifier:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Found user activity %@ with identifier %@.", (uint8_t *)&v9, 0x20u);
  }
LABEL_8:

  return v5;
}

- (BOOL)donateInteraction
{
  return self->_donateInteraction;
}

- (BOOL)shouldResetRequestAfterHandle
{
  return self->_shouldResetRequestAfterHandle;
}

- (void)setShouldResetRequestAfterHandle:(BOOL)a3
{
  self->_shouldResetRequestAfterHandle = a3;
}

void __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0CBD670];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315650;
      v10 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]_block_invoke";
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_1B727D000, v6, OS_LOG_TYPE_ERROR, "%s Unable to donate interaction with identifier %@, error %@", (uint8_t *)&v9, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Successfully donated interaction with identifier %@", (uint8_t *)&v9, 0x16u);
    goto LABEL_6;
  }

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
