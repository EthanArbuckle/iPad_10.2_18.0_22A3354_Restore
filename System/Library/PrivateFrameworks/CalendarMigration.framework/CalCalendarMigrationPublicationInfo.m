@implementation CalCalendarMigrationPublicationInfo

- (CalCalendarMigrationPublicationInfo)initWithPublishedURL:(id)a3 calendarDirectory:(id)a4 calendarUUID:(id)a5
{
  id v9;
  id v10;
  id v11;
  CalCalendarMigrationPublicationInfo *v12;
  CalCalendarMigrationPublicationInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalCalendarMigrationPublicationInfo;
  v12 = -[CalCalendarMigrationPublicationInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_publishedURL, a3);
    objc_storeStrong((id *)&v13->_calendarDirectory, a4);
    objc_storeStrong((id *)&v13->_calendarUUID, a5);
  }

  return v13;
}

- (id)dictionaryForAccountProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL lastPathComponent](self->_publishedURL, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE141D0]);
  -[NSURL scheme](self->_publishedURL, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("http")) != 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE140A0]);

  -[NSURL absoluteString](self->_publishedURL, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasPrefix:", CFSTR("http://")) & 1) != 0)
  {
    v10 = 7;
LABEL_7:
    objc_msgSend(v9, "substringFromIndex:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("https://")))
  {
    v10 = 8;
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE14098]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationPublicationInfo automaticallyPublishChanges](self, "automaticallyPublishChanges"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE141C8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationPublicationInfo filterAlarms](self, "filterAlarms"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE141D8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationPublicationInfo filterAttachments](self, "filterAttachments"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE141E0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationPublicationInfo filterTitleAndNotes](self, "filterTitleAndNotes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE141F0]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE141E8]);
  -[CalCalendarMigrationPublicationInfo calendarUUID](self, "calendarUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE141F8]);

  return v3;
}

- (NSURL)calendarDirectory
{
  return self->_calendarDirectory;
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)setPublishedURL:(id)a3
{
  objc_storeStrong((id *)&self->_publishedURL, a3);
}

- (NSString)calendarUUID
{
  return self->_calendarUUID;
}

- (void)setCalendarUUID:(id)a3
{
  objc_storeStrong((id *)&self->_calendarUUID, a3);
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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSDate)refreshDate
{
  return self->_refreshDate;
}

- (void)setRefreshDate:(id)a3
{
  objc_storeStrong((id *)&self->_refreshDate, a3);
}

- (BOOL)automaticallyPublishChanges
{
  return self->_automaticallyPublishChanges;
}

- (void)setAutomaticallyPublishChanges:(BOOL)a3
{
  self->_automaticallyPublishChanges = a3;
}

- (BOOL)filterAlarms
{
  return self->_filterAlarms;
}

- (void)setFilterAlarms:(BOOL)a3
{
  self->_filterAlarms = a3;
}

- (BOOL)filterAttachments
{
  return self->_filterAttachments;
}

- (void)setFilterAttachments:(BOOL)a3
{
  self->_filterAttachments = a3;
}

- (BOOL)filterTitleAndNotes
{
  return self->_filterTitleAndNotes;
}

- (void)setFilterTitleAndNotes:(BOOL)a3
{
  self->_filterTitleAndNotes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_calendarUUID, 0);
  objc_storeStrong((id *)&self->_publishedURL, 0);
  objc_storeStrong((id *)&self->_calendarDirectory, 0);
}

@end
