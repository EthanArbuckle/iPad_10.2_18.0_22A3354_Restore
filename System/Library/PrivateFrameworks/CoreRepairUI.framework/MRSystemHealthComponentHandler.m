@implementation MRSystemHealthComponentHandler

- (MRSystemHealthComponentHandler)initWithComponentName:(id)a3
{
  id v4;
  MRSystemHealthComponentHandler *v5;
  MRSystemHealthComponentHandler *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  dispatch_queue_t v47;
  void *v48;
  void *v49;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)MRSystemHealthComponentHandler;
  v5 = -[MRBaseComponentHandler init](&v51, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MRBaseComponentHandler setComponentName:](v5, "setComponentName:", v4);
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("SUcaseFor%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentSUCaseKey:](v6, "setComponentSUCaseKey:", v9);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler componentSUCaseKey](v6, "componentSUCaseKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v6, "setIsSUCaseForComponent:", objc_msgSend(v10, "BOOLForKey:", v11));

    -[MRBaseComponentHandler setDisplayNotification:](v6, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v6, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v6, "isSUCaseForComponent") ^ 1);
    v12 = (void *)MEMORY[0x24BDBCF48];
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v6, "setLinkedSensitiveURL:", v16);

    v17 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("com.apple.mobilerepair.%@Repair"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentFollowupClientID:](v6, "setComponentFollowupClientID:", v19);

    -[MRBaseComponentHandler componentFollowupClientID](v6, "componentFollowupClientID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", CFSTR("FINISH_REPAIR"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setFinishRepairKey:](v6, "setFinishRepairKey:", v21);

    v22 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("unlockCheckCountFor%@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v6, "setComponentUnLockCheckCountKey:", v24);

    v25 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("retriggerCheckCountFor%@"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v6, "setComponentRetriggerCountKey:", v27);

    v28 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("lastCheckTimeFor%@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v6, "setComponentLastCheckTimeKey:", v30);

    v31 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("hasDisplayedFollowupForSHC%@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v6, "setComponentHasDisplayedFollowUpKey:", v33);

    v34 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("com.apple.mobilerepair.%@unlockchecker"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v6, "setComponentUnlockCheckerActivityName:", v36);

    -[MRBaseComponentHandler setComponentId:](v6, "setComponentId:", 0);
    -[MRBaseComponentHandler setNotifyServer:](v6, "setNotifyServer:", 0);
    v37 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("firstUIDisplayedTimeFor%@"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v6, "setComponentFirstUIDisplayedTimeKey:", v39);

    v40 = (void *)MEMORY[0x24BDD17C8];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("lastKnownIDFor%@"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v6, "setLastKnownComponentIdentifierKey:", v42);

    v43 = (void *)MEMORY[0x24BE27E68];
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v43, "copySealingManifestDataInstanceForComponent:", v44);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v6, "setLastKnownComponentIdentifierValue:", v45);

    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v6, "setUnlockCheckActivityRequired:", 0);
    -[MRBaseComponentHandler componentName](v6, "componentName");
    v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = dispatch_queue_create((const char *)objc_msgSend(v46, "UTF8String"), 0);
    -[MRSystemHealthComponentHandler setComponentEventQueue:](v6, "setComponentEventQueue:", v47);

    -[MRBaseComponentHandler componentName](v6, "componentName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringByAppendingString:", CFSTR("Failed"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setComponentStatusKey:](v6, "setComponentStatusKey:", v49);

  }
  return v6;
}

- (void)postComponentStatus:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  sub_22AC82A9C(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MRBaseComponentHandler componentName](self, "componentName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v7;
    v20 = 2048;
    v21 = a3;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_22AC64000, v6, OS_LOG_TYPE_DEFAULT, "postComponentStatus name:%@ status:%llu connection:%@", buf, 0x20u);

  }
  -[MRBaseComponentHandler componentAuthHandler](self, "componentAuthHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyComponentStatus");

  sub_22AC82A9C(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 != -3)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AC64000, v11, OS_LOG_TYPE_DEFAULT, "Processing componentStatus", buf, 2u);
    }

    if (a3 == 1)
    {
      -[MRBaseComponentHandler componentStatusKey](self, "componentStatusKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5;
      v15 = 0;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_14:
        objc_msgSend(v5, "synchronize");
        -[MRSystemHealthComponentHandler componentEventQueue](self, "componentEventQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_22AC7D2E0;
        block[3] = &unk_24F4D4AF0;
        block[4] = self;
        dispatch_async(v16, block);

        goto LABEL_15;
      }
      -[MRBaseComponentHandler componentStatusKey](self, "componentStatusKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5;
      v15 = 1;
    }
    objc_msgSend(v14, "setBool:forKey:", v15, v13);

    goto LABEL_14;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AC64000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring componentStatus for pending repair case", buf, 2u);
  }

LABEL_15:
}

- (OS_dispatch_queue)componentEventQueue
{
  return self->_componentEventQueue;
}

- (void)setComponentEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_componentEventQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentEventQueue, 0);
}

@end
