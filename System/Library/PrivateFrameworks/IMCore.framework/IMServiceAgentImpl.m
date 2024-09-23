@implementation IMServiceAgentImpl

+ (id)sharedAgent
{
  void *v2;
  IMServiceAgentImpl *v3;
  void *v4;

  v2 = (void *)qword_1EE65F4B8;
  if (!qword_1EE65F4B8)
  {
    v3 = objc_alloc_init(IMServiceAgentImpl);
    v4 = (void *)qword_1EE65F4B8;
    qword_1EE65F4B8 = (uint64_t)v3;

    v2 = (void *)qword_1EE65F4B8;
  }
  return v2;
}

- (IMServiceAgentImpl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMServiceAgentImpl;
  return -[IMServiceAgentImpl init](&v3, sel_init);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)IMServiceAgentImpl;
  -[IMServiceAgentImpl dealloc](&v4, sel_dealloc);
}

- (id)serviceWithName:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (__CFString *)a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockUntilConnected");

  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("Bonjour")))
  {

    v3 = CFSTR("SubNet");
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceWithName:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)notificationCenter
{
  return 0;
}

- (id)notificationCenter
{
  return 0;
}

+ (void)forgetStatusImageAppearance
{
  qword_1EE65CC80 = -1;
}

- (void)_statusImageAppearanceChanged:(id)a3
{
  id v4;

  objc_msgSend((id)objc_opt_class(), "forgetStatusImageAppearance");
  -[IMServiceAgentImpl notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMStatusImagesChangedAppearanceNotification"), 0);

}

+ (void)_determineStatusImageAppearance
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_IMAppObjectForKey:", CFSTR("UseAlternateStatusIndicators"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  qword_1EE65CC80 = objc_msgSend(v2, "BOOLValue");

}

+ (id)imageNameForStatus:(unint64_t)a3
{
  __CFString *v4;

  if (qword_1EE65CC80 == -1)
    objc_msgSend(a1, "_determineStatusImageAppearance");
  if (a3 - 1 > 3)
    v4 = CFSTR("NSStatusUnknown");
  else
    v4 = off_1E4720410[a3 - 1];
  if (qword_1EE65CC80)
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("Flat"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)imageURLForStatus:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  if (qword_1EE65CC80 == -1)
    objc_msgSend(a1, "_determineStatusImageAppearance");
  v4 = (void *)qword_1EE65F4C0;
  if (!qword_1EE65F4C0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)qword_1EE65F4C0;
    qword_1EE65F4C0 = (uint64_t)v5;

    v7 = (void *)MEMORY[0x1E0C99D80];
    _IMFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", CFSTR("OnlineStatuses"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", CFSTR("StatusList"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend(v11, "objectAtIndex:", IMPersonStatusFromFZPersonStatus(i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)qword_1EE65F4C0;
        objc_msgSend(v15, "objectForKey:", CFSTR("ImageName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

      }
    }

    v4 = (void *)qword_1EE65F4C0;
  }
  if (objc_msgSend(v4, "count") && objc_msgSend((id)qword_1EE65F4C0, "count") > a3)
  {
    objc_msgSend((id)qword_1EE65F4C0, "objectAtIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (qword_1EE65CC80 == 1)
    {
      objc_msgSend(v18, "stringByAppendingString:", CFSTR("_flat"));
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    if (v19)
    {
      v21 = (void *)MEMORY[0x1E0C99E98];
      _IMFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pathForResource:ofType:", v19, CFSTR("tiff"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fileURLWithPath:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  return v24;
}

- (void)_customMessagesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  IMSyncronizeAppPreferences();
  -[IMServiceAgentImpl notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = qword_1EE65F4B8;
  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "__mainThreadPostNotificationName:object:userInfo:", v6, v7, v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__mainThreadPostNotificationName:object:", CFSTR("__kIMCustomStatusMessagesChangedNotification"), 0);

}

- (id)myAvailableMessages
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = *MEMORY[0x1E0D36C70];
  IMGetCachedDomainValueForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_IMAppObjectForKey:", v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)myAwayMessages
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = *MEMORY[0x1E0D36C78];
  IMGetCachedDomainValueForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_IMAppObjectForKey:", v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)setMyAvailableMessages:(id)a3
{
  id v3;

  IMSetDomainValueForKey();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", CFSTR("__kIMCustomStatusMessagesChangedNotification"), 0);

}

- (void)setMyAwayMessages:(id)a3
{
  id v3;

  IMSetDomainValueForKey();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", CFSTR("__kIMCustomStatusMessagesChangedNotification"), 0);

}

- (void)setupComplete
{
  void *v2;
  void *v3;
  id v4;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_doneSetup);

}

- (unint64_t)vcCapabilities
{
  void *v2;
  void *v3;
  unint64_t v4;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "vcCapabilities");

  return v4;
}

@end
