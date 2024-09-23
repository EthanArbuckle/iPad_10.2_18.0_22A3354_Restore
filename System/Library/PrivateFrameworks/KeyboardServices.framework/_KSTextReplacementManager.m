@implementation _KSTextReplacementManager

- (_KSTextReplacementManager)initWithDirectoryPath:(id)a3
{
  id v5;
  _KSTextReplacementManager *v6;
  void *v7;
  _KSTextReplacementCKStore *v8;
  _KSTextReplacementCKStore *ckStore;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_KSTextReplacementManager;
  v6 = -[_KSTextReplacementManager init](&v13, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x2207A8B6C]();
    v8 = -[_KSTextReplacementCKStore initWithDirectoryPath:]([_KSTextReplacementCKStore alloc], "initWithDirectoryPath:", v5);
    ckStore = v6->_ckStore;
    v6->_ckStore = v8;

    objc_storeStrong((id *)&v6->_directoryPath, a3);
    KSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[_KSTextReplacementManager initWithDirectoryPath:]";
      _os_log_impl(&dword_21DFEB000, v10, OS_LOG_TYPE_INFO, "%s  >>> using cloudkit store", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_textReplacementStore, v6->_ckStore);
    +[_KSAggdLogger setValue:forScalarKey:](_KSAggdLogger, "setValue:forScalarKey:", 1, CFSTR("com.apple.keyboard.textReplacement.usingCloudKitSyncing"));
    -[_KSTextReplacementManager pushAllLocalRecordsOnceIfNeeded](v6, "pushAllLocalRecordsOnceIfNeeded");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_notifyTextReplacementDidChange, CFSTR("_KSTRCKStoreDidReceiveChangesNotification"), 0);

    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

- (_KSTextReplacementSyncProtocol)textReplacementStore
{
  return self->_textReplacementStore;
}

- (void)pushAllLocalRecordsOnceIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  if (pushAllLocalRecordsOnceIfNeeded_onceToken != -1)
    dispatch_once(&pushAllLocalRecordsOnceIfNeeded_onceToken, block);
}

+ (id)textReplacementStoreWithTestDirectory:(id)a3 withDelegate:(id)a4
{
  id v4;
  _KSTextReplacementManager *v5;
  void *v6;

  v4 = a3;
  v5 = -[_KSTextReplacementManager initWithDirectoryPath:]([_KSTextReplacementManager alloc], "initWithDirectoryPath:", v4);

  -[_KSTextReplacementManager ckStore](v5, "ckStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementManager setTextReplacementStore:](v5, "setTextReplacementStore:", v6);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_KSTextReplacementManager;
  -[_KSTextReplacementManager dealloc](&v4, sel_dealloc);
}

- (void)notifyTextReplacementDidChange
{
  id v2;

  if (notify_post((const char *)objc_msgSend(CFSTR("KSTextReplacementDidChangeNotification"), "UTF8String")))
    NSLog(CFSTR("!!!ERROR Sending darwin notification failed.\n"));
  NSLog(CFSTR(">>> sending out shortcut changes notif"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("KSTextReplacementDidChangeNotification"), 0);

}

- (void)requestSyncWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_KSTextReplacementManager textReplacementStore](self, "textReplacementStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestSyncWithCompletionBlock:", v4);

}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[_KSTextReplacementManager textReplacementStore](self, "textReplacementStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSync:withCompletionBlock:", a3, v6);

}

- (double)minimumUptimeRemaining
{
  return 0.0;
}

- (void)recordSyncStatus
{
  id v2;

  -[_KSTextReplacementManager ckStore](self, "ckStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordSyncStatus");

}

- (_KSTextReplacementCKStore)ckStore
{
  return self->_ckStore;
}

- (void)setCkStore:(id)a3
{
  objc_storeStrong((id *)&self->_ckStore, a3);
}

- (void)setTextReplacementStore:(id)a3
{
  objc_storeStrong((id *)&self->_textReplacementStore, a3);
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_textReplacementStore, 0);
  objc_storeStrong((id *)&self->_ckStore, 0);
}

@end
