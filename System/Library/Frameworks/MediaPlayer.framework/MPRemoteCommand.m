@implementation MPRemoteCommand

- (void)setUnsupportedReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

uint64_t __29__MPRemoteCommand_hasTargets__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)addTarget:(id)target action:(SEL)action
{
  -[MPRemoteCommand addTarget:action:usingExtendedStatus:](self, "addTarget:action:usingExtendedStatus:", target, action, 0);
}

- (void)addTarget:(id)a3 action:(SEL)a4 usingExtendedStatus:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  int v17;
  _QWORD *v18;
  id *v19;
  void *v20;
  int v21;
  NSObject *serialQueue;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD block[5];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35[2];
  _QWORD v36[5];
  id v37[2];
  _QWORD v38[5];
  id v39[2];
  BOOL v40;
  id from;
  _QWORD v42[4];
  id v43;
  id v44;
  id location[2];

  v5 = a5;
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = v8;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%p:%s"), v10, sel_getName(a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "methodSignatureForSelector:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke;
  v42[3] = &unk_1E315F080;
  objc_copyWeak(&v44, location);
  v13 = v11;
  v43 = v13;
  v14 = (void *)MEMORY[0x19403A810](v42);
  if ((dyld_program_sdk_at_least() & 1) != 0)
    v15 = 1;
  else
    v15 = dyld_program_sdk_at_least();
  objc_initWeak(&from, v10);
  v16 = objc_retainAutorelease(v12);
  v17 = *(unsigned __int8 *)objc_msgSend(v16, "methodReturnType");
  if (objc_msgSend(v16, "numberOfArguments") == 4)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_3;
    v38[3] = &unk_1E315F0D0;
    v18 = v38;
    v19 = v39;
    objc_copyWeak(v39, &from);
    v38[4] = v14;
    v40 = v5;
LABEL_11:
    v18[6] = a4;
    v20 = (void *)MEMORY[0x19403A810](v18);

    objc_destroyWeak(v19);
LABEL_12:
    if (v20)
      v21 = 0;
    else
      v21 = v15;
    if (v21 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRemoteCommand.m"), 135, CFSTR("Unsupported action method signature. Must return MPRemoteCommandHandlerStatus or take a completion handler as the second argument."));

      v20 = 0;
    }
    goto LABEL_17;
  }
  if (v17 == 113 || v17 == 105)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRemoteCommand.m"), 110, CFSTR("Cannot use extended status with synchronous target/action"));

    }
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_5;
    v36[3] = &unk_1E315F0F8;
    v18 = v36;
    v19 = v37;
    objc_copyWeak(v37, &from);
    v36[4] = v14;
    goto LABEL_11;
  }
  if ((v15 & 1) != 0)
  {
    v20 = 0;
    goto LABEL_12;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRemoteCommand.m"), 122, CFSTR("Cannot use extended status with synchronous target/action"));

  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_6;
  v33[3] = &unk_1E315F0F8;
  objc_copyWeak(v35, &from);
  v34 = v14;
  v35[1] = (id)a4;
  v20 = (void *)MEMORY[0x19403A810](v33);

  objc_destroyWeak(v35);
LABEL_17:
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_29;
  block[3] = &unk_1E3161780;
  block[4] = self;
  v23 = v13;
  v31 = v23;
  v24 = v20;
  v32 = v24;
  dispatch_sync(serialQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:", CFSTR("MPRemoteCommandTargetsDidChangeNotification"), self);

  objc_destroyWeak(&from);
  objc_destroyWeak(&v44);
  objc_destroyWeak(location);

}

- (void)notifyPropagatablePropertyChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandCenter);
  objc_msgSend(WeakRetained, "remoteCommandDidMutatePropagatableProperty:", self);

}

- (unsigned)mediaRemoteCommandType
{
  return self->_mediaRemoteCommandType;
}

- (BOOL)hasTargets
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__MPRemoteCommand_hasTargets__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)commandInfoRepresentations
{
  uint64_t v3;
  void *v4;
  unsigned int mediaRemoteCommandType;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[MPRemoteCommand _mediaRemoteCommandInfo](self, "_mediaRemoteCommandInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  mediaRemoteCommandType = self->_mediaRemoteCommandType;
  if (mediaRemoteCommandType == 10)
  {
    -[MPRemoteCommand _mediaRemoteCommandInfo](self, "_mediaRemoteCommandInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCommand:", 11);
    v12[0] = v4;
    v12[1] = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v12;
  }
  else
  {
    if (mediaRemoteCommandType != 8)
    {
      v11 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[MPRemoteCommand _mediaRemoteCommandInfo](self, "_mediaRemoteCommandInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCommand:", 9);
    v13[0] = v4;
    v13[1] = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v13;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t mediaRemoteCommandType;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MRMediaRemoteCopyCommandDescription();
  mediaRemoteCommandType = self->_mediaRemoteCommandType;
  if (-[MPRemoteCommand isForceDisabled](self, "isForceDisabled"))
  {
    v7 = CFSTR("NO [FORCED]");
  }
  else if (self->_enabled)
  {
    v7 = CFSTR("YES");
  }
  else
  {
    v7 = CFSTR("NO");
  }
  -[NSMutableDictionary allKeys](self->_handlers, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "msv_compactDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type=%@ (%ld) enabled=%@ handlers=[%@]>"), v4, self, v5, mediaRemoteCommandType, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)_mediaRemoteCommandInfo
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0D4C518]);
  objc_msgSend(v3, "setCommand:", self->_mediaRemoteCommandType);
  if (self->_enabled)
    v4 = -[MPRemoteCommand isForceDisabled](self, "isForceDisabled") ^ 1;
  else
    v4 = 0;
  objc_msgSend(v3, "setEnabled:", v4);
  -[MPRemoteCommand _mediaRemoteCommandInfoOptions](self, "_mediaRemoteCommandInfoOptions");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA70];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  if ((objc_msgSend(v3, "isEnabled") & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v10 = -[MPRemoteCommand disabledReason](self, "disabledReason");
    if ((unint64_t)(v10 - 1) <= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D4C798]);

    }
  }
  objc_msgSend(v3, "setOptions:", v9);

  return v3;
}

- (BOOL)isForceDisabled
{
  return self->_forceDisabled;
}

- (id)_mediaRemoteCommandInfoOptions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (NSArray)unsupportedReasons
{
  return self->_unsupportedReasons;
}

- (NSArray)disabledReasons
{
  return self->_disabledReasons;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setDisabledReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MPRemoteCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  MPRemoteCommand *v4;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  uint64_t v8;
  NSMutableDictionary *handlers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPRemoteCommand;
  v4 = -[MPRemoteCommand init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MediaPlayer/%@"), objc_opt_class());
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    handlers = v4->_handlers;
    v4->_handlers = (NSMutableDictionary *)v8;

    v4->_mediaRemoteCommandType = a3;
    v4->_enabled = 1;
    v4->_timeout = 9.0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedReasons, 0);
  objc_storeStrong((id *)&self->_disabledReasons, 0);
  objc_destroyWeak((id *)&self->_commandCenter);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setSkipSerializedEventDelivery:(BOOL)a3
{
  self->_skipSerializedEventDelivery = a3;
}

- (void)setDisabledReason:(int64_t)a3
{
  if (self->_disabledReason != a3)
  {
    self->_disabledReason = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)removeTarget:(id)target action:(SEL)action
{
  id v6;
  NSObject *serialQueue;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  SEL v12;

  v6 = target;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MPRemoteCommand_removeTarget_action___block_invoke;
  block[3] = &unk_1E3162690;
  v11 = v6;
  v12 = action;
  block[4] = self;
  v9 = v6;
  dispatch_sync(serialQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MPRemoteCommandTargetsDidChangeNotification"), self);

}

- (void)removeTarget:(id)target
{
  NSObject *serialQueue;
  void *v5;
  _QWORD block[5];

  if (target)
  {
    -[MPRemoteCommand removeTarget:action:](self, "removeTarget:action:", target, 0);
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__MPRemoteCommand_removeTarget___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPRemoteCommandTargetsDidChangeNotification"), self);

  }
}

- (id)addTargetWithHandler:(void *)handler
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v16;
  void *v17;

  v4 = handler;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x19403A810]();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%p"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MPRemoteCommand_addTargetWithHandler___block_invoke;
  block[3] = &unk_1E3161780;
  block[4] = self;
  v9 = v7;
  v16 = v9;
  v17 = v4;
  v10 = v4;
  dispatch_sync(serialQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("MPRemoteCommandTargetsDidChangeNotification"), self);

  v12 = v17;
  v13 = v9;

  return v13;
}

- (BOOL)isSupportedAndEnabled
{
  _BOOL4 v3;

  v3 = -[MPRemoteCommand isSupported](self, "isSupported");
  if (v3)
  {
    v3 = -[MPRemoteCommand isEnabled](self, "isEnabled");
    if (v3)
      LOBYTE(v3) = !-[MPRemoteCommand isForceDisabled](self, "isForceDisabled");
  }
  return v3;
}

- (void)invokeCommandWithEvent:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *serialQueue;
  uint64_t v10;
  id v11;
  void *v12;
  dispatch_group_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  dispatch_block_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  MPRemoteCommand *v31;
  id v32;
  SEL v33;
  _QWORD block[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__41153;
  v39 = __Block_byref_object_dispose__41154;
  v40 = 0;
  serialQueue = self->_serialQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = &v35;
  dispatch_sync(serialQueue, block);
  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v12 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend((id)v36[5], "count"));
  v13 = dispatch_group_create();
  v14 = (void *)v36[5];
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2;
  v28[3] = &unk_1E315F210;
  v15 = v13;
  v29 = v15;
  v16 = v7;
  v30 = v16;
  v31 = self;
  v17 = v12;
  v32 = v17;
  v33 = a2;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v28);
  if (!objc_msgSend((id)v36[5], "count"))
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v41 = CFSTR("event");
    v42[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 5, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPRemoteCommandStatus statusWithCode:error:](MPRemoteCommandStatus, "statusWithCode:error:", 404, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v21);

  }
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_66;
  v25[3] = &unk_1E3162560;
  v26 = v17;
  v27 = v8;
  v22 = v17;
  v23 = v8;
  v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_INHERIT_QOS_CLASS, v25);
  dispatch_group_notify(v15, (dispatch_queue_t)self->_serialQueue, v24);

  _Block_object_dispose(&v35, 8);
}

- (id)newCommandEvent
{
  return -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", self->_mediaRemoteCommandType, MEMORY[0x1E0C9AA70]);
}

- (id)newCommandEventWithContentItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v8 = *MEMORY[0x1E0D4CBC8];
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", self->_mediaRemoteCommandType, v5);

  return v6;
}

- (id)newCommandEventWithPlaybackQueueOffset:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D4CC40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", self->_mediaRemoteCommandType, v5);
  return v6;
}

- (id)newCommandEventWithCommandType:(unsigned int)a3 options:(id)a4
{
  +[MPRemoteCommandEvent eventWithCommand:mediaRemoteType:options:](MPRemoteCommandEvent, "eventWithCommand:mediaRemoteType:options:", self, *(_QWORD *)&a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSeekCommandEventWithType:(unint64_t)a3
{
  unsigned int mediaRemoteCommandType;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  mediaRemoteCommandType = self->_mediaRemoteCommandType;
  if (mediaRemoteCommandType == 8)
    v4 = 9;
  else
    v4 = self->_mediaRemoteCommandType;
  if (mediaRemoteCommandType == 10)
    v5 = 11;
  else
    v5 = v4;
  if (a3 == 1)
    v6 = v5;
  else
    v6 = mediaRemoteCommandType;
  +[MPRemoteCommandEvent eventWithCommand:mediaRemoteType:options:](MPSeekCommandEvent, "eventWithCommand:mediaRemoteType:options:", self, v6, MEMORY[0x1E0C9AA70]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_stateDumpObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPRemoteCommand isEnabled](self, "isEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("forceDisabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPRemoteCommand isForceDisabled](self, "isForceDisabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("hasTargets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPRemoteCommand hasTargets](self, "hasTargets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("supported");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPRemoteCommand isSupported](self, "isSupported"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("options");
  -[MPRemoteCommand _mediaRemoteCommandInfoOptions](self, "_mediaRemoteCommandInfoOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = MEMORY[0x1E0C9AA70];
  if (v7)
    v9 = v7;
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MPRemoteCommandCenter)commandCenter
{
  return (MPRemoteCommandCenter *)objc_loadWeakRetained((id *)&self->_commandCenter);
}

- (void)setCommandCenter:(id)a3
{
  objc_storeWeak((id *)&self->_commandCenter, a3);
}

- (void)setForceDisabled:(BOOL)a3
{
  self->_forceDisabled = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)skipSerializedEventDelivery
{
  return self->_skipSerializedEventDelivery;
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *, uint64_t, _QWORD *);
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  v7 = a3;
  dispatch_group_enter(v6);
  v8 = objc_alloc(MEMORY[0x1E0D4D048]);
  objc_msgSend(*(id *)(a1 + 40), "timeout");
  v10 = v9;
  if (v9 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 48), "timeout");
    v10 = v11;
  }
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_3;
  v29[3] = &unk_1E315F1C0;
  v30 = *(id *)(a1 + 40);
  v31 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 48);
  v32 = v13;
  v33 = v15;
  v34 = v14;
  v16 = (void *)objc_msgSend(v8, "initWithTimeout:interruptionHandler:", v29, v10);
  v17 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2114;
    v38 = v18;
    _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "RCC: invokeCommandWithEvent: handler=%{public}@ event=%{public}@", buf, 0x16u);
  }

  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_63;
  v23[3] = &unk_1E315F1E8;
  v19 = *(_QWORD *)(a1 + 40);
  v23[4] = *(_QWORD *)(a1 + 48);
  v24 = *(id *)(a1 + 56);
  v25 = v16;
  v26 = *(id *)(a1 + 32);
  v27 = v5;
  v28 = *(id *)(a1 + 40);
  v20 = (void (*)(_QWORD *, uint64_t, _QWORD *))v7[2];
  v21 = v5;
  v22 = v16;
  v20(v7, v19, v23);

}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_66(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  intptr_t (*v31)(uint64_t);
  void *v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  void (**v36)(_QWORD, _QWORD);
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "command");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mediaRemoteCommandType");

      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = (void *)MRMediaRemoteCopyCommandDescription();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("command=%@"), v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = dispatch_semaphore_create(0);
      v8 = (void *)MEMORY[0x1E0D4D030];
      v9 = *MEMORY[0x1E0D4CE38];
      objc_msgSend(*(id *)(a1 + 32), "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_57;
      v32 = &unk_1E3163508;
      v12 = v7;
      v33 = v12;
      objc_msgSend(v8, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v9, CFSTR("Bug"), CFSTR("CommandHandlerNotCalledBug"), v6, 0, v11, &v29);

      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), CFSTR("MPRemoteCommand.m"), 281, CFSTR("Command handler completion deallocated without being called. event=%@"), *(_QWORD *)(a1 + 32), v29, v30, v31, v32);

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Command handler completion deallocated without being called -- assertion failed"), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_4;
    v41[3] = &unk_1E315F148;
    v42 = *(id *)(a1 + 32);
    v43 = *(id *)(a1 + 40);
    v44 = *(id *)(a1 + 48);
    v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v41);
    objc_msgSend(*(id *)(a1 + 32), "command");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commandCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = objc_alloc(MEMORY[0x1E0D4D048]);
      v37[0] = v15;
      v37[1] = 3221225472;
      v37[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_45;
      v37[3] = &unk_1E315F170;
      v21 = v16;
      v23 = *(_QWORD *)(a1 + 56);
      v22 = *(_QWORD *)(a1 + 64);
      v39 = v21;
      v40 = v22;
      v37[4] = v23;
      v38 = *(id *)(a1 + 32);
      v24 = (void *)objc_msgSend(v20, "initWithTimeout:interruptionHandler:", v37, 1.0);
      v25 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v47 = v26;
        _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_ERROR, "RCC: Command handler completion timeout. Calling delegate for status: event=%{public}@", buf, 0xCu);
      }

      v27 = *(_QWORD *)(a1 + 32);
      v34[0] = v15;
      v34[1] = 3221225472;
      v34[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_48;
      v34[3] = &unk_1E315F198;
      v35 = v24;
      v36 = v21;
      v28 = v24;
      objc_msgSend(v19, "commandCenter:didTimeoutCommandEvent:statusHandler:", v18, v27, v34);

    }
    else
    {
      v16[2](v16, 0);
    }

  }
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_64;
  v13 = &unk_1E31635F8;
  v14 = v4;
  v6 = v3;
  v15 = v6;
  dispatch_sync(v5, &v10);
  if (objc_msgSend(*(id *)(a1 + 48), "disarm", v10, v11, v12, v13))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "RCC: invokeCommandWithEvent: finished handler=%{public}@ event=%p", buf, 0x16u);
  }

}

uint64_t __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v19[0] = CFSTR("commandID");
    objc_msgSend(*(id *)(a1 + 32), "commandID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("event");
    v20[0] = v5;
    v20[1] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 7, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPRemoteCommandStatus statusWithCode:error:](MPRemoteCommandStatus, "statusWithCode:error:", 555, v7);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "RCC: Command handler completion timeout: event=%{public}@ status=%{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v13 = CFSTR("status");
  v14 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MPRemoteCommandEventDidTimeout"), v11, v12);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_45(_QWORD *a1, uint64_t a2)
{
  id v3;

  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPRemoteCommand.m"), 258, CFSTR("Command center delegate status handler deallocated without being called. event=%@"), a1[5]);

  }
  else if (!a2)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

intptr_t __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_57(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __40__MPRemoteCommand_addTargetWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MPRemoteCommand_addTargetWithHandler___block_invoke_2;
  v3[3] = &unk_1E315F120;
  v4 = *(id *)(a1 + 48);
  v2 = (void *)MEMORY[0x19403A810](v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __40__MPRemoteCommand_addTargetWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  +[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", v6(v5, a2));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a3)[2](v7, v8);

}

uint64_t __32__MPRemoteCommand_removeTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

void __39__MPRemoteCommand_removeTarget_action___block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(const char **)(a1 + 48);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%p:%s"), v4, sel_getName(v2));
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, v13);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 40));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "hasPrefix:", v11);

            if (!v12)
              continue;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD *WeakRetained;
  _QWORD block[4];
  _QWORD *v10;
  id v11;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_2;
    block[3] = &unk_1E31635F8;
    v10 = WeakRetained;
    v11 = *(id *)(a1 + 32);
    dispatch_sync(v5, block);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 6, CFSTR("Target was not available for command."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPRemoteCommandStatus statusWithCode:error:](MPRemoteCommandStatus, "statusWithCode:error:", 200, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  void (*v10)(void *, uint64_t, id, id);
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = *(unsigned __int8 *)(a1 + 56);
    v10 = (void (*)(void *, uint64_t, id, id))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(a1 + 48));
    v11 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10(v8, v11, v5, v6);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_4;
      v12[3] = &unk_1E315F0A8;
      v13 = v6;
      v10(v8, v11, v5, v12);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, void *);
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    +[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", ((uint64_t (*)(id, _QWORD, id))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(a1 + 48)))(WeakRetained, *(_QWORD *)(a1 + 48), v9));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *);
  id WeakRetained;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "Unsupported action method signature. Must return MPRemoteCommandHandlerStatus or take a completion handler as the second argument. ** This will break in a future release. **", v10, 2u);
    }

    ((void (*)(id, _QWORD, id))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(a1 + 48)))(WeakRetained, *(_QWORD *)(a1 + 48), v5);
    +[MPRemoteCommandStatus successStatus](MPRemoteCommandStatus, "successStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_29(_QWORD *a1)
{
  id v2;

  v2 = (id)MEMORY[0x19403A810](a1[6]);
  objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v2, a1[5]);

}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

@end
