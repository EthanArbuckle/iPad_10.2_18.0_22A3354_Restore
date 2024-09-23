@implementation CalCalendarMigrationSubscriptionInfo

- (CalCalendarMigrationSubscriptionInfo)initWithCalendarDirectory:(id)a3 subscriptionURL:(id)a4 username:(id)a5 principalUid:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CalCalendarMigrationSubscriptionInfo *v15;
  CalCalendarMigrationSubscriptionInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *subscriptionURLWithUsername;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CalCalendarMigrationSubscriptionInfo;
  v15 = -[CalCalendarMigrationSubscriptionInfo init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_calendarDirectory, a3);
    objc_storeStrong((id *)&v16->_subscriptionURL, a4);
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "CDVURLWithUser:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "absoluteString");
        v20 = objc_claimAutoreleasedReturnValue();
        subscriptionURLWithUsername = v16->_subscriptionURLWithUsername;
        v16->_subscriptionURLWithUsername = (NSString *)v20;

      }
    }
    if (!v16->_subscriptionURLWithUsername)
      objc_storeStrong((id *)&v16->_subscriptionURLWithUsername, v16->_subscriptionURL);
    objc_storeStrong((id *)&v16->_principalUid, a6);
  }

  return v16;
}

- (id)_dictionaryForAccountProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalCalendarMigrationSubscriptionInfo subscriptionURL](self, "subscriptionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE14240]);
  -[CalCalendarMigrationSubscriptionInfo title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CalCalendarMigrationSubscriptionInfo title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE14248]);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationSubscriptionInfo filterAlarms](self, "filterAlarms"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE14208]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE14238]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationSubscriptionInfo filterAttachments](self, "filterAttachments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE14210]);

  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CalCalendarMigrationSubscriptionInfo refreshInterval](self, "refreshInterval");
  objc_msgSend(v9, "numberWithInt:", (int)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE14230]);

  if (-[CalCalendarMigrationSubscriptionInfo isManagedByServer](self, "isManagedByServer"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE14228]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationSubscriptionInfo insecureConnectionApproved](self, "insecureConnectionApproved"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE14220]);

  if ((unint64_t)objc_msgSend(v4, "length") >= 5
    && !objc_msgSend(v4, "compare:options:range:", CFSTR("ftp://"), 1, 0, 5))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE14258]);
  }
  v13 = (unint64_t)objc_msgSend(v4, "length") >= 8
     && objc_msgSend(v4, "compare:options:range:", CFSTR("https://"), 1, 0, 8) == 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE140A0]);

  v15 = (void *)MEMORY[0x24BE13FE8];
  -[CalCalendarMigrationSubscriptionInfo subscriptionURL](self, "subscriptionURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hostStringFromURLString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE14098]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE14250]);

  return v3;
}

- (id)dictionaryForParentAccountProperties
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CalCalendarMigrationSubscriptionInfo _dictionaryForAccountProperties](self, "_dictionaryForAccountProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE14240], *MEMORY[0x24BE14248], *MEMORY[0x24BE14208], *MEMORY[0x24BE14230], *MEMORY[0x24BE14210], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v9) & 1) == 0)
          objc_msgSend(v2, "removeObjectForKey:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v2;
}

- (NSURL)calendarDirectory
{
  return self->_calendarDirectory;
}

- (NSString)principalUid
{
  return self->_principalUid;
}

- (NSString)subscriptionURL
{
  return self->_subscriptionURL;
}

- (NSString)subscriptionURLWithUsername
{
  return self->_subscriptionURLWithUsername;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isManagedByServer
{
  return self->_isManagedByServer;
}

- (void)setIsManagedByServer:(BOOL)a3
{
  self->_isManagedByServer = a3;
}

- (BOOL)insecureConnectionApproved
{
  return self->_insecureConnectionApproved;
}

- (void)setInsecureConnectionApproved:(BOOL)a3
{
  self->_insecureConnectionApproved = a3;
}

- (NSString)calDAVPath
{
  return self->_calDAVPath;
}

- (void)setCalDAVPath:(id)a3
{
  objc_storeStrong((id *)&self->_calDAVPath, a3);
}

- (BOOL)filterAlarms
{
  return self->_filterAlarms;
}

- (void)setFilterAlarms:(BOOL)a3
{
  self->_filterAlarms = a3;
}

- (BOOL)disableAlarms
{
  return self->_disableAlarms;
}

- (void)setDisableAlarms:(BOOL)a3
{
  self->_disableAlarms = a3;
}

- (BOOL)filterAttachments
{
  return self->_filterAttachments;
}

- (void)setFilterAttachments:(BOOL)a3
{
  self->_filterAttachments = a3;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_calDAVPath, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subscriptionURLWithUsername, 0);
  objc_storeStrong((id *)&self->_subscriptionURL, 0);
  objc_storeStrong((id *)&self->_principalUid, 0);
  objc_storeStrong((id *)&self->_calendarDirectory, 0);
}

@end
