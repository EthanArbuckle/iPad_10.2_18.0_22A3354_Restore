@implementation _CDInteractionStoreNotificationReceiver

- (_CDInteractionStoreNotificationReceiver)init
{
  id v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_CDInteractionStoreNotificationReceiver;
  v2 = -[_CDInteractionStoreNotificationReceiver init](&v17, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    objc_initWeak(&location, v2);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __47___CDInteractionStoreNotificationReceiver_init__block_invoke;
    v14 = &unk_1E26E4DC0;
    objc_copyWeak(&v15, &location);
    v9 = (void *)MEMORY[0x193FEEAF4](&v11);
    notify_register_dispatch((const char *)objc_msgSend(CFSTR("PSStoreChangedNotificationInternal"), "UTF8String", v11, v12, v13, v14), (int *)v2 + 2, *((dispatch_queue_t *)v2 + 2), v9);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return (_CDInteractionStoreNotificationReceiver *)v2;
}

- (void)dealloc
{
  int notifierToken;
  objc_super v4;

  notifierToken = self->_notifierToken;
  if (notifierToken)
    notify_cancel(notifierToken);
  v4.receiver = self;
  v4.super_class = (Class)_CDInteractionStoreNotificationReceiver;
  -[_CDInteractionStoreNotificationReceiver dealloc](&v4, sel_dealloc);
}

- (void)postPackedMechanisms:(unint64_t)a3
{
  int v3;
  _CDInteractionStoreNotificationReceiver *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 0x10000) != 0)
    objc_msgSend(v5, "addObject:", &unk_1E272AF78);
  if ((v3 & 2) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272AF90);
  if ((v3 & 4) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272AFA8);
  if ((v3 & 8) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272AFC0);
  if ((v3 & 0x10) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272AFD8);
  if ((v3 & 0x20) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272AFF0);
  if ((v3 & 0x40) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272B008);
  if ((v3 & 0x80) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272B020);
  if ((v3 & 0x100) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272B038);
  if ((v3 & 0x200) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272B050);
  if ((v3 & 0x400) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272B068);
  if ((v3 & 0x800) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272B080);
  if ((v3 & 0x20000) != 0)
    objc_msgSend(v6, "addObject:", &unk_1E272B098);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("kPSStoreChangedMechanismsKey");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PSStoreChangedNotification"), 0, v8);

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
