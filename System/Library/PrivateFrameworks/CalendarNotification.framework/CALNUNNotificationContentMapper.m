@implementation CALNUNNotificationContentMapper

- (CALNUNNotificationContentMapper)initWithNotificationIconMapper:(id)a3
{
  id v5;
  CALNUNNotificationContentMapper *v6;
  CALNUNNotificationContentMapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNNotificationContentMapper;
  v6 = -[CALNUNNotificationContentMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationIconMapper, a3);

  return v7;
}

- (id)unNotificationContentFromCALNNotificationContent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (objc_class *)MEMORY[0x24BDF8800];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend((id)objc_opt_class(), "_setBodyForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend(v5, "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategoryIdentifier:", v7);

  objc_msgSend(v5, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", v8);

  objc_msgSend(v5, "defaultActionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultActionURL:", v9);

  objc_msgSend(v5, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v10);

  -[CALNUNNotificationContentMapper _unNotificationIconFromCALNNotificationContent:](self, "_unNotificationIconFromCALNNotificationContent:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v11);

  objc_msgSend((id)objc_opt_class(), "_setPeopleIdentifiersForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend(v6, "setShouldHideTime:", objc_msgSend(v5, "shouldHideTime"));
  objc_msgSend(v6, "setShouldSuppressSyncDismissalWhenRemoved:", objc_msgSend(v5, "shouldSuppressSyncDismissalWhenRemoved"));
  objc_msgSend((id)objc_opt_class(), "_setSoundForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend((id)objc_opt_class(), "_setSubtitleForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend((id)objc_opt_class(), "_setThreadIdentifierForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend((id)objc_opt_class(), "_setTitleForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend((id)objc_opt_class(), "_setTopicIdentifiersForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend((id)objc_opt_class(), "_setUserInfoForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend(v6, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend((id)objc_opt_class(), "_setInterruptionLevelForUNMutableNotificationContent:usingCALNNotificationContent:", v6, v5);
  objc_msgSend(v5, "filterCriteria");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFilterCriteria:", v12);
  v13 = (void *)objc_msgSend(v6, "copy");

  return v13;
}

- (id)calnNotificationContentFromUNNotificationContent:(id)a3
{
  id v4;
  CALNMutableNotificationContent *v5;
  void *v6;
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

  v4 = a3;
  v5 = objc_alloc_init(CALNMutableNotificationContent);
  objc_msgSend(v4, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setBody:](v5, "setBody:", v6);

  objc_msgSend(v4, "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setCategoryIdentifier:](v5, "setCategoryIdentifier:", v7);

  objc_msgSend(v4, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setDate:](v5, "setDate:", v8);

  objc_msgSend(v4, "defaultActionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setDefaultActionURL:](v5, "setDefaultActionURL:", v9);

  objc_msgSend(v4, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setExpirationDate:](v5, "setExpirationDate:", v10);

  -[CALNUNNotificationContentMapper _iconIdentifierFromUNNotificationContent:](self, "_iconIdentifierFromUNNotificationContent:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setIconIdentifier:](v5, "setIconIdentifier:", v11);

  objc_msgSend(v4, "peopleIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setPeopleIdentifiers:](v5, "setPeopleIdentifiers:", v12);

  v13 = (void *)objc_opt_class();
  objc_msgSend(v4, "topicIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_sectionIdentifierFromTopicIdentifiers:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setSectionIdentifier:](v5, "setSectionIdentifier:", v15);

  -[CALNMutableNotificationContent setShouldHideTime:](v5, "setShouldHideTime:", objc_msgSend(v4, "shouldHideTime"));
  -[CALNMutableNotificationContent setShouldSuppressSyncDismissalWhenRemoved:](v5, "setShouldSuppressSyncDismissalWhenRemoved:", objc_msgSend(v4, "shouldSuppressSyncDismissalWhenRemoved"));
  objc_msgSend((id)objc_opt_class(), "_calnNotificationSoundFromUNNotificationContent:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setSound:](v5, "setSound:", v16);

  objc_msgSend(v4, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setSubtitle:](v5, "setSubtitle:", v17);

  objc_msgSend(v4, "threadIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setThreadIdentifier:](v5, "setThreadIdentifier:", v18);

  objc_msgSend(v4, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setTitle:](v5, "setTitle:", v19);

  objc_msgSend(v4, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setUserInfo:](v5, "setUserInfo:", v20);

  objc_msgSend((id)objc_opt_class(), "_setInterruptionLevelForCALNMutableNotificationContent:usingUNNotificationContent:", v5, v4);
  objc_msgSend(v4, "filterCriteria");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNMutableNotificationContent setFilterCriteria:](v5, "setFilterCriteria:", v21);
  v22 = (void *)-[CALNMutableNotificationContent copy](v5, "copy");

  return v22;
}

+ (void)_setInterruptionLevelForCALNMutableNotificationContent:(id)a3 usingUNNotificationContent:(id)a4
{
  unint64_t v5;
  id v6;

  v6 = a3;
  v5 = objc_msgSend(a4, "interruptionLevel");
  if (v5 <= 3)
    objc_msgSend(v6, "setInterruptionLevel:", v5);

}

+ (void)_setInterruptionLevelForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  unint64_t v5;
  id v6;

  v6 = a3;
  v5 = objc_msgSend(a4, "interruptionLevel");
  if (v5 <= 3)
    objc_msgSend(v6, "setInterruptionLevel:", v5);

}

+ (void)_setBodyForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setBody:", v5);

}

+ (void)_setPeopleIdentifiersForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "peopleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setPeopleIdentifiers:", v5);

}

+ (void)_setSoundForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a4, "sound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CALNUNNotificationSoundMapper unNotificationSoundFromCALNNotificationSound:](CALNUNNotificationSoundMapper, "unNotificationSoundFromCALNNotificationSound:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSound:", v6);

  }
}

+ (void)_setSubtitleForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setSubtitle:", v5);

}

+ (void)_setThreadIdentifierForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "threadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setThreadIdentifier:", v5);

}

+ (void)_setTitleForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setTitle:", v5);

}

+ (void)_setTopicIdentifiersForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "sectionIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBCF20];
  if (v6)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setTopicIdentifiers:", v10);

}

+ (void)_setUserInfoForUNMutableNotificationContent:(id)a3 usingCALNNotificationContent:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setUserInfo:", v5);

}

+ (id)_sectionIdentifierFromTopicIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[CALNUNNotificationContentMapper _sectionIdentifierFromTopicIdentifiers:].cold.1(v3, (uint64_t)v5, v6);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_unNotificationIconFromCALNNotificationContent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "iconIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CALNUNNotificationContentMapper notificationIconMapper](self, "notificationIconMapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unNotificationIconFromIconIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_iconIdentifierFromUNNotificationContent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CALNUNNotificationContentMapper notificationIconMapper](self, "notificationIconMapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconIdentifierFromUNNotificationIcon:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_calnNotificationSoundFromUNNotificationContent:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CALNUNNotificationSoundMapper calnNotificationSoundFromUNNotificationSound:](CALNUNNotificationSoundMapper, "calnNotificationSoundFromUNNotificationSound:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CALNUNNotificationIconMapper)notificationIconMapper
{
  return self->_notificationIconMapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationIconMapper, 0);
}

+ (void)_sectionIdentifierFromTopicIdentifiers:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = 134218498;
  v7 = objc_msgSend(a1, "count");
  v8 = 2114;
  v9 = a2;
  v10 = 2114;
  v11 = a1;
  _os_log_error_impl(&dword_215D9B000, a3, OS_LOG_TYPE_ERROR, "Unexpected number of topic identifiers. Expected: 1. Actual: %lu. Resolved section identifier: %{public}@. Topic identifiers: %{public}@.", (uint8_t *)&v6, 0x20u);
}

@end
