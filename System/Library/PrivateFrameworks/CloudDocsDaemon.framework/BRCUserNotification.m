@implementation BRCUserNotification

+ (id)defaultInstance
{
  if (defaultInstance_once != -1)
    dispatch_once(&defaultInstance_once, &__block_literal_global_14);
  return (id)defaultInstance_defaultInstance;
}

void __38__BRCUserNotification_defaultInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultInstance_defaultInstance;
  defaultInstance_defaultInstance = v0;

}

- (BRCUserNotification)init
{
  BRCUserNotification *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCUserNotification;
  result = -[BRCUserNotification init](&v3, sel_init);
  if (result)
    result->_nextDisplayBeginTime = 0;
  return result;
}

- (void)dealloc
{
  id progressSubscriber;
  __CFUserNotification *cfUserNotification;
  NSObject *displaySource;
  __CFRunLoopSource *source;
  objc_super v7;

  if (self->_progressSubscriber)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:");
    progressSubscriber = self->_progressSubscriber;
    self->_progressSubscriber = 0;

  }
  cfUserNotification = self->_cfUserNotification;
  if (cfUserNotification)
  {
    CFUserNotificationCancel(cfUserNotification);
    CFRelease(self->_cfUserNotification);
  }
  displaySource = self->_displaySource;
  if (displaySource)
    dispatch_source_cancel(displaySource);
  source = self->_source;
  if (source)
    CFRelease(source);
  v7.receiver = self;
  v7.super_class = (Class)BRCUserNotification;
  -[BRCUserNotification dealloc](&v7, sel_dealloc);
}

- (void)_hideCurrentDialog
{
  NSObject *displaySource;
  OS_dispatch_source *v4;
  __CFRunLoopSource *source;
  __CFUserNotification *v6;
  id v7;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  displaySource = self->_displaySource;
  if (displaySource)
  {
    dispatch_source_cancel(displaySource);
    v4 = self->_displaySource;
    self->_displaySource = 0;

  }
  source = self->_source;
  if (source)
  {
    CFRunLoopSourceInvalidate(source);
    CFRelease(self->_source);
    self->_source = 0;
  }
  if (self->_cfUserNotification)
  {
    userNotificationRefToCompletionBlock();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = self->_cfUserNotification;
    objc_msgSend(v7, "removeObjectForKey:", v6);
    CFUserNotificationCancel(self->_cfUserNotification);
    CFRelease(self->_cfUserNotification);

    self->_cfUserNotification = 0;
  }
}

- (void)_displayDialogWithType:(unint64_t)a3 dict:(id)a4 userReplyBlock:(id)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;

  v11 = a4;
  v8 = a5;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInSyncBubble");

  if ((v10 & 1) == 0)
    -[BRCUserNotification _displayDialogWithType:dict:options:userReplyBlock:](self, "_displayDialogWithType:dict:options:userReplyBlock:", a3, v11, 0, v8);

}

- (id)_logWrapUserReplyBlock:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v3 = a3;
  v19 = 0uLL;
  v20 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCUserNotification _logWrapUserReplyBlock:]", 187, &v19);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCUserNotification _logWrapUserReplyBlock:].cold.2();

  v21 = v19;
  v22 = v20;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_currentPersonaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCUserNotification _logWrapUserReplyBlock:].cold.1();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke;
  v14[3] = &unk_1E87600E8;
  v17 = v21;
  v18 = v22;
  v15 = v7;
  v16 = v3;
  v10 = v3;
  v11 = v7;
  v12 = (void *)MEMORY[0x1D17A6DB0](v14);

  return v12;
}

void __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  BRPerformWithPersonaAndError();

}

void __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = a2;
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke_2_cold_1();

  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), v6);
  __brc_leave_section((uint64_t *)&v7);

}

- (void)_displayDialogWithType:(unint64_t)a3 dict:(id)a4 options:(id)a5 userReplyBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a4;
  v11 = a5;
  -[BRCUserNotification _logWrapUserReplyBlock:](self, "_logWrapUserReplyBlock:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke;
  block[3] = &unk_1E8760138;
  block[4] = self;
  v17 = v10;
  v19 = v12;
  v20 = a3;
  v18 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_source_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  dispatch_block_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t v30;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(NSObject **)(v2 + 24);
  if (v5)
    dispatch_source_cancel(v5);
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v6;

  v9 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v9;

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("MinimalDisplayTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("WaitingTimeBeforeDisplay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(NSObject **)(v14 + 24);
  v16 = dispatch_time(*(_QWORD *)(v14 + 32), objc_msgSend(v13, "unsignedLongLongValue"));
  dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 24);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2;
  v27[3] = &unk_1E8760110;
  v20 = *(void **)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 64);
  v27[4] = v17;
  v30 = v19;
  v29 = v20;
  v21 = v12;
  v28 = v21;
  v22 = v18;
  v23 = v27;
  v24 = v23;
  v25 = v23;
  if (*MEMORY[0x1E0D11070])
  {
    ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v25);
  dispatch_source_set_event_handler(v22, v26);

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __CFUserNotification *v3;
  BOOL v4;
  void *v5;
  NSObject *v6;
  __CFRunLoop *Current;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SInt32 error;

  objc_msgSend(*(id *)(a1 + 32), "_hideCurrentDialog");
  error = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = CFUserNotificationCreate(0, 0.0, *(_QWORD *)(a1 + 56), &error, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(__CFUserNotification **)(v2 + 8);
  if (v3)
    v4 = error == 0;
  else
    v4 = 0;
  if (v4)
  {
    if (*(_QWORD *)(v2 + 16))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_2((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

      v3 = *(__CFUserNotification **)(*(_QWORD *)(a1 + 32) + 8);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = CFUserNotificationCreateRunLoopSource(0, v3, (CFUserNotificationCallBack)_notificationCallback, 0);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      Current = CFRunLoopGetCurrent();
      v8 = CFRunLoopCopyCurrentMode(Current);
      if (!v8)
        v8 = (const __CFString *)CFRetain((CFTypeRef)*MEMORY[0x1E0C9B270]);
      userNotificationRefToCompletionBlock();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      objc_msgSend(v9, "setObject:forKey:", v11, v10);

      CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(*(_QWORD *)(a1 + 32) + 16), v8);
      CFRelease(v8);
      v12 = *(void **)(a1 + 40);
      if (v12)
        v12 = (void *)dispatch_time(0, objc_msgSend(v12, "unsignedLongLongValue"));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v12;

    }
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_1(&error, (uint64_t)v5, v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)_updateDialogWithType:(unint64_t)a3 dict:(id)a4
{
  -[BRCUserNotification _updateDialogWithType:dict:userReplyBlock:](self, "_updateDialogWithType:dict:userReplyBlock:", a3, a4, 0);
}

- (void)_updateDialogWithType:(unint64_t)a3 dict:(id)a4 userReplyBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  -[BRCUserNotification _logWrapUserReplyBlock:](self, "_logWrapUserReplyBlock:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke;
  v12[3] = &unk_1E8760188;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (!*(_QWORD *)(v1 + 40))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] ignore user notification udate: no KVO observer registered%@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  v3 = (void *)a1[5];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_16;
  v14[3] = &unk_1E8760160;
  v14[4] = v1;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v14);
  v4 = CFUserNotificationUpdate(*(CFUserNotificationRef *)(a1[4] + 8), 0.0, a1[7], *(CFDictionaryRef *)(a1[4] + 48));
  if ((_DWORD)v4)
  {
    v5 = v4;
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_cold_1((uint64_t)v6, v5, v7);

LABEL_9:
    return;
  }
  if (a1[6])
  {
    userNotificationRefToCompletionBlock();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1[4] + 8);
    v11 = (void *)a1[6];
    v12 = v10;
    v13 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v9, "setObject:forKey:", v13, v12);

  }
}

uint64_t __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", a3, a2);
}

- (id)_localizationKey:(id)a3 forTypeOfShare:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  const __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("keynote"));

  if ((v8 & 1) != 0)
  {
    v9 = CFSTR("_KEYNOTE");
  }
  else
  {
    objc_msgSend(v6, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("numbers"));

    if ((v11 & 1) != 0)
    {
      v9 = CFSTR("_NUMBERS");
    }
    else
    {
      objc_msgSend(v6, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("pages"));

      if ((v13 & 1) != 0)
      {
        v9 = CFSTR("_PAGES");
      }
      else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D10FE0]))
      {
        v9 = CFSTR("_FOLDER");
      }
      else
      {
        v9 = CFSTR("_DEFAULT");
      }
    }
  }
  objc_msgSend(v5, "stringByAppendingString:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_localizationKeyForOS:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("_IOS"));
}

- (id)_localizationKey:(id)a3 forOSAndTypeOfShare:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("_IOS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  v3 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__BRCUserNotification_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __28__BRCUserNotification_close__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hideCurrentDialog");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return result;
}

- (void)showJoinDialogForShareMetadata:(id)a3 ckContainer:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BRCUserNotification *v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "share");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "brc_sharedRootDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasSuffix:", CFSTR(":nooverride")))
  {
    objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - objc_msgSend(CFSTR(":nooverride"), "length"));
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(v8, "share");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "brc_fixDocumentExtensionIfNeededForShareURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "br_displayFilenameWithExtensionHidden:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__11;
  v30[4] = __Block_byref_object_dispose__11;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__11;
  v28[4] = __Block_byref_object_dispose__11;
  v29 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke;
  v21[3] = &unk_1E87601D8;
  v18 = v10;
  v25 = v18;
  v26 = v30;
  v27 = v28;
  v19 = v8;
  v22 = v19;
  v20 = v17;
  v23 = v20;
  v24 = self;
  objc_msgSend(v9, "fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:", v21);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

}

void __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v41 = v8;
    if (v7)
    {
      objc_msgSend(v7, "br_formattedNameWithNonBreakingSpaces");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 32), "ownerIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nameComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "br_formattedNameWithNonBreakingSpaces");
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "share");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isFolderShare");

    objc_msgSend(*(id *)(a1 + 32), "share");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "brc_applicationName");
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)*MEMORY[0x1E0D10FE0];
    if (!v17)
      v21 = (void *)v20;
    v22 = v21;
    v39 = v22;
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
    {
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _BRLocalizedStringWithFormat();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        objc_msgSend(*(id *)(a1 + 32), "share");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "publicPermission");

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)v20;
        v38 = (void *)v15;
        v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        _BRLocalizedStringWithFormat();
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = *MEMORY[0x1E0C9B810];
        v44[0] = *MEMORY[0x1E0C9B800];
        v44[1] = v30;
        v45[0] = v24;
        v45[1] = v29;
        v44[2] = *MEMORY[0x1E0C9B830];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v15, v37);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _BRLocalizedStringWithFormat();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v45[2] = v32;
        v44[3] = *MEMORY[0x1E0C9B838];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        _BRLocalizedStringWithFormat();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45[3] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke_2;
        v42[3] = &unk_1E87601B0;
        v36 = *(void **)(a1 + 48);
        v43 = *(id *)(a1 + 56);
        objc_msgSend(v36, "_displayDialogWithType:dict:userReplyBlock:", 3, v35, v42);

        v8 = v41;
        goto LABEL_17;
      }
      v26 = *(void **)(a1 + 48);
      if (v20)
        objc_msgSend(v26, "_localizationKey:forTypeOfShare:", CFSTR("SHARING_JOIN_HEADER"), v20);
      else
        objc_msgSend(v26, "_localizationKeyForOS:", CFSTR("SHARING_JOIN_HEADER_DEFAULT_APP"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_JOIN_HEADER_NO_DOCUMENT_NAME"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _BRLocalizedStringWithFormat();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_17:

}

uint64_t __72__BRCUserNotification_showJoinDialogForShareMetadata_ckContainer_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorSignInToiCloudForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
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
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BRCUserNotification *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  _QWORD v33[7];

  v33[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  v28 = v6;
  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = v9;
  v32[0] = *MEMORY[0x1E0C9B800];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v26;
  v32[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("SHARING_ICLOUD_SETUP_MESSAGE_IOS"), v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v13;
  v32[2] = *MEMORY[0x1E0C9B830];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  v32[3] = *MEMORY[0x1E0C9B868];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("PREVIEW_BUTTON"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v18;
  v32[4] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __69__BRCUserNotification_showErrorSignInToiCloudForShareMetadata_reply___block_invoke;
  v30[3] = &unk_1E87601B0;
  v31 = v29;
  v22 = v29;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v24, "_displayDialogWithType:dict:userReplyBlock:", 3, v21, v30);

}

uint64_t __69__BRCUserNotification_showErrorSignInToiCloudForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorTurnOniCloudDriveForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  BRCUserNotification *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)MEMORY[0x1E0CB3858];
  objc_msgSend(v6, "ownerIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nameComponents");
  v33 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringFromPersonNameComponents:style:options:", v14, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = *MEMORY[0x1E0C9B800];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v30;
  v37[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("SHARING_ICLOUD_DRIVE_SETUP_MESSAGE_IOS"), v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v16;
  v37[2] = *MEMORY[0x1E0C9B830];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v32);
  v17 = v9;
  v29 = v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v19;
  v37[3] = *MEMORY[0x1E0C9B868];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("PREVIEW_BUTTON"), v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v22;
  v37[4] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __72__BRCUserNotification_showErrorTurnOniCloudDriveForShareMetadata_reply___block_invoke;
  v35[3] = &unk_1E87601B0;
  v36 = v34;
  v26 = v34;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v27, "_displayDialogWithType:dict:userReplyBlock:", 3, v25, v35);

}

uint64_t __72__BRCUserNotification_showErrorTurnOniCloudDriveForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorInstallNativeAppForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BRCUserNotification *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BRCUserNotification *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  _QWORD v47[7];

  v47[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "share");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFolderShare");

  if (v9)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[BRCUserNotification showErrorInstallNativeAppForShareMetadata:reply:].cold.1((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);

  }
  objc_msgSend(v6, "share");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "brc_applicationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3858];
    objc_msgSend(v6, "ownerIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nameComponents");
    v42 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringFromPersonNameComponents:style:options:", v15, 0, 0);
    v36 = objc_claimAutoreleasedReturnValue();

    v46[0] = *MEMORY[0x1E0C9B800];
    v43 = v6;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v40;
    v46[1] = *MEMORY[0x1E0C9B810];
    -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("SHARING_APP_NOT_INSTALLED_MESSAGE_IOS"), v12, v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v35;
    v46[2] = *MEMORY[0x1E0C9B830];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = self;
    v38 = self;
    v19 = (void *)v17;
    v47[2] = v17;
    v46[3] = *MEMORY[0x1E0C9B868];
    -[BRCUserNotification _localizationKey:forTypeOfShare:](v18, "_localizationKey:forTypeOfShare:", CFSTR("PREVIEW_BUTTON"), v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v22;
    v46[4] = *MEMORY[0x1E0C9B838];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v43;
    v7 = v42;

    v26 = (void *)v36;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __71__BRCUserNotification_showErrorInstallNativeAppForShareMetadata_reply___block_invoke;
    v44[3] = &unk_1E87601B0;
    v45 = v42;
    -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v38, "_displayDialogWithType:dict:userReplyBlock:", 3, v25, v44);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("shareMetadata"), v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v26);
  }

}

uint64_t __71__BRCUserNotification_showErrorInstallNativeAppForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorNativeAppDisabledByProfileForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
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
  void *v20;
  id v21;
  BRCUserNotification *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  v26 = v6;
  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v30[0] = *MEMORY[0x1E0C9B800];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("SHARING_PROFILE_DISABLED_HEADER_IOS"), v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v30[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("SHARING_PROFILE_DISABLED_MESSAGE_IOS"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  v30[2] = *MEMORY[0x1E0C9B868];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](self, "_localizationKey:forTypeOfShare:", CFSTR("PREVIEW_BUTTON"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v17;
  v30[3] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__BRCUserNotification_showErrorNativeAppDisabledByProfileForShareMetadata_reply___block_invoke;
  v28[3] = &unk_1E87601B0;
  v29 = v27;
  v21 = v27;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v22, "_displayDialogWithType:dict:userReplyBlock:", 3, v20, v28);

}

uint64_t __81__BRCUserNotification_showErrorNativeAppDisabledByProfileForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorReasonUnknownForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
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
  void *v20;
  id v21;
  BRCUserNotification *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  v23 = v6;
  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v27[0] = *MEMORY[0x1E0C9B800];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_GENERIC_ERROR_HEADER"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v27[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_GENERIC_ERROR_MESSAGE"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v17;
  v27[2] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__BRCUserNotification_showErrorReasonUnknownForShareMetadata_reply___block_invoke;
  v25[3] = &unk_1E87601B0;
  v26 = v24;
  v21 = v24;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v22, "_displayDialogWithType:dict:userReplyBlock:", 3, v20, v25);

}

uint64_t __68__BRCUserNotification_showErrorReasonUnknownForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorDeviceOfflineForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
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
  void *v20;
  id v21;
  BRCUserNotification *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  v23 = v6;
  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v27[0] = *MEMORY[0x1E0C9B800];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_DEVICE_OFFLINE_ERROR_HEADER"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v27[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_DEVICE_OFFLINE_ERROR_MESSAGE"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v17;
  v27[2] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__BRCUserNotification_showErrorDeviceOfflineForShareMetadata_reply___block_invoke;
  v25[3] = &unk_1E87601B0;
  v26 = v24;
  v21 = v24;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v22, "_displayDialogWithType:dict:userReplyBlock:", 3, v20, v25);

}

uint64_t __68__BRCUserNotification_showErrorDeviceOfflineForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorServerNotReachableForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
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
  void *v20;
  id v21;
  BRCUserNotification *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  v23 = v6;
  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v27[0] = *MEMORY[0x1E0C9B800];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_ICLOUD_NOT_REACHABLE_HEADER"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v27[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_ICLOUD_NOT_REACHABLE_MESSAGE"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v17;
  v27[2] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73__BRCUserNotification_showErrorServerNotReachableForShareMetadata_reply___block_invoke;
  v25[3] = &unk_1E87601B0;
  v26 = v24;
  v21 = v24;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v22, "_displayDialogWithType:dict:userReplyBlock:", 3, v20, v25);

}

uint64_t __73__BRCUserNotification_showErrorServerNotReachableForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorItemUnavailableOrAccessRestrictedForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
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
  void *v20;
  id v21;
  BRCUserNotification *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  v23 = v6;
  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v27[0] = *MEMORY[0x1E0C9B800];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_NO_LONGER_SHARED_HEADER"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v27[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_NO_LONGER_SHARED_MESSAGE"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v17;
  v27[2] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__BRCUserNotification_showErrorItemUnavailableOrAccessRestrictedForShareMetadata_reply___block_invoke;
  v25[3] = &unk_1E87601B0;
  v26 = v24;
  v21 = v24;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v22, "_displayDialogWithType:dict:userReplyBlock:", 3, v20, v25);

}

uint64_t __88__BRCUserNotification_showErrorItemUnavailableOrAccessRestrictedForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorParticipantLimitReachedForShareMetadata:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  BRCUserNotification *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  _QWORD v34[6];

  v34[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = a4;
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFolderShare");

  v29 = v6;
  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0D10FE0];
  }
  else
  {
    objc_msgSend(v6, "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_applicationName");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v33[0] = *MEMORY[0x1E0C9B800];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_PARTICIPANT_LIMIT_REACHED_HEADER"), v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v26;
  v33[1] = *MEMORY[0x1E0C9B810];
  -[BRCUserNotification _localizationKey:forOSAndTypeOfShare:](self, "_localizationKey:forOSAndTypeOfShare:", CFSTR("SHARING_PARTICIPANT_LIMIT_REACHED_MESSAGE"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v14;
  v33[2] = *MEMORY[0x1E0C9B830];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v9;
  v25 = v9;
  v18 = self;
  v19 = (void *)v16;
  v34[2] = v16;
  v33[3] = *MEMORY[0x1E0C9B838];
  -[BRCUserNotification _localizationKey:forTypeOfShare:](v18, "_localizationKey:forTypeOfShare:", CFSTR("PREVIEW_BUTTON"), v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __78__BRCUserNotification_showErrorParticipantLimitReachedForShareMetadata_reply___block_invoke;
  v31[3] = &unk_1E87601B0;
  v32 = v30;
  v24 = v30;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](v18, "_displayDialogWithType:dict:userReplyBlock:", 3, v23, v31);

}

uint64_t __78__BRCUserNotification_showErrorParticipantLimitReachedForShareMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showErrorDocumentsAppNotVisibleForShareURL:(id)a3 reply:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0DABB10];
  v17[0] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0C9B800];
  v16[0] = v6;
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  v16[2] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__BRCUserNotification_showErrorDocumentsAppNotVisibleForShareURL_reply___block_invoke;
  v14[3] = &unk_1E87601B0;
  v15 = v5;
  v13 = v5;
  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](self, "_displayDialogWithType:dict:userReplyBlock:", 3, v12, v14);

}

uint64_t __72__BRCUserNotification_showErrorDocumentsAppNotVisibleForShareURL_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showCloudDocsNotSupportedSimulatorRunningOnOldHost
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0C9B800];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E0C9B810];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCUserNotification _displayDialogWithType:dict:userReplyBlock:](self, "_displayDialogWithType:dict:userReplyBlock:", 3, v9, &__block_literal_global_137);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogInfo, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_displaySource, 0);
}

- (void)_logWrapUserReplyBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] User notification completion block should run with %@ persona%@");
  OUTLINED_FUNCTION_2();
}

- (void)_logWrapUserReplyBlock:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┣%llx updating dialog...%@");
  OUTLINED_FUNCTION_2();
}

void __46__BRCUserNotification__logWrapUserReplyBlock___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┳%llx sending user reply%@");
  OUTLINED_FUNCTION_2();
}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_1(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = *a1;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_15(&dword_1CBD43000, a2, a3, "[ERROR] can't create user notification: %d%@", v3, (_QWORD)v4, WORD4(v4));
  OUTLINED_FUNCTION_2();
}

void __74__BRCUserNotification__displayDialogWithType_dict_options_userReplyBlock___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: self->_source == NULL%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __65__BRCUserNotification__updateDialogWithType_dict_userReplyBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_15(&dword_1CBD43000, a2, a3, "[ERROR] can't update user notification: %d%@", v3, (_QWORD)v4, WORD4(v4));
  OUTLINED_FUNCTION_2();
}

- (void)showErrorInstallNativeAppForShareMetadata:(uint64_t)a3 reply:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: !shareMetadata.share.isFolderShare%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
