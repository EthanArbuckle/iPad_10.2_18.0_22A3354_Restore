@implementation ShortcutsCloudKitAccountNotifier

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  unint64_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  _BOOL4 v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = (unint64_t)a3;
  v10 = a5;
  v11 = (unint64_t)a6;
  v12 = (void *)v11;
  v13 = (v9 | v11) != 0;
  v14 = (_QWORD *)MEMORY[0x24BDB4020];
  if (v9)
  {
    objc_msgSend((id)v9, "accountType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *v14);

    if (v12)
    {
LABEL_3:
      objc_msgSend(v12, "accountType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", *v14);

      goto LABEL_6;
    }
  }
  else
  {
    v17 = 0;
    if (v11)
      goto LABEL_3;
  }
  v20 = 0;
LABEL_6:
  if ((v13 & (v17 | v20)) == 1)
  {
    switch(a4)
    {
      case 1:
        getWFVoiceShortcutClientLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v26 = 136315138;
          v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
          _os_log_impl(&dword_230F63000, v21, OS_LOG_TYPE_INFO, "%s CloudKit account was added. Resetting all local sync state and requesting a resync.", (uint8_t *)&v26, 0xCu);
        }

        v22 = (id *)MEMORY[0x24BEC17C0];
        goto LABEL_14;
      case 2:
        getWFVoiceShortcutClientLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v26 = 136315138;
          v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
          _os_log_impl(&dword_230F63000, v23, OS_LOG_TYPE_INFO, "%s CloudKit account was modified. Requesting a resync.", (uint8_t *)&v26, 0xCu);
        }

        v22 = (id *)MEMORY[0x24BEC17C8];
LABEL_14:
        notify_post((const char *)objc_msgSend(*v22, "UTF8String"));
        goto LABEL_23;
      case 3:
        getWFVoiceShortcutClientLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_22;
        v26 = 136315138;
        v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
        v25 = "%s CloudKit account was deleted. Nothing to do.";
        break;
      case 4:
        getWFVoiceShortcutClientLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_22;
        v26 = 136315138;
        v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
        v25 = "%s CloudKit account save failed. Nothing to do.";
        break;
      case 5:
        getWFVoiceShortcutClientLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_22;
        v26 = 136315138;
        v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
        v25 = "%s CloudKit warming up. Nothing to do.";
        break;
      default:
        goto LABEL_23;
    }
    _os_log_impl(&dword_230F63000, v24, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v26, 0xCu);
LABEL_22:

  }
LABEL_23:

}

@end
