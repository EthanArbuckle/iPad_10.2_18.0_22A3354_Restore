@implementation AFBulletin

- (id)_displayNameForBulletin:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.cmas")))
  {

LABEL_4:
    objc_msgSend(v3, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v3, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ReplayKitNotifications"));

  if (v6)
    goto LABEL_4;
  objc_msgSend(v3, "sectionDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v3, "sectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getLSApplicationProxyClass_30434(), "applicationProxyForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedName");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
LABEL_5:

  return v7;
}

- (void)setBulletin:(id)a3
{
  -[AFBulletin setBulletin:forFeed:](self, "setBulletin:forFeed:", a3, 0);
}

- (id)actions
{
  NSArray *actionsStore;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *actionsByIdentifier;
  NSArray *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  actionsStore = self->_actionsStore;
  if (actionsStore)
    return actionsStore;
  if (!self->_bbBulletin)
  {
    actionsStore = 0;
    return actionsStore;
  }
  +[AFBulletin _createAssistantActionsForBulletin:](AFBulletin, "_createAssistantActionsForBulletin:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "bbActionID", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v13 = (NSDictionary *)objc_msgSend(v5, "copy");
  actionsByIdentifier = self->_actionsByIdentifier;
  self->_actionsByIdentifier = v13;

  v15 = (NSArray *)objc_msgSend(v6, "copy");
  v16 = self->_actionsStore;
  self->_actionsStore = v15;

  return self->_actionsStore;
}

- (id)actionForIdentifier:(id)a3
{
  id v4;
  NSDictionary *actionsByIdentifier;
  id v6;
  void *v7;

  v4 = a3;
  actionsByIdentifier = self->_actionsByIdentifier;
  if (!actionsByIdentifier)
  {
    v6 = -[AFBulletin actions](self, "actions");
    actionsByIdentifier = self->_actionsByIdentifier;
  }
  -[NSDictionary objectForKey:](actionsByIdentifier, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setBulletin:(id)a3 forFeed:(unint64_t)a4
{
  NSString *v7;
  NSString *bulletinID;
  NSString *v9;
  NSString *recordID;
  NSString *v11;
  NSString *sectionID;
  NSDate *v13;
  NSDate *date;
  NSDate *v15;
  NSDate *endDate;
  NSDate *v17;
  NSDate *recencyDate;
  void *v19;
  NSString *v20;
  NSString *timeZone;
  NSString *v22;
  NSString *title;
  NSString *v24;
  NSString *message;
  void *v26;
  NSString *v27;
  NSString *modalAlertContentMessage;
  NSString *v29;
  NSString *subtitle;
  NSString *v31;
  NSString *publisherBulletinID;
  NSArray *v33;
  NSArray *intentIDs;
  NSString *v35;
  NSString *threadID;
  NSString *v37;
  NSString *displayName;
  NSString *v39;
  NSString *internalID;
  id v41;

  objc_storeStrong((id *)&self->_bbBulletin, a3);
  v41 = a3;
  self->_feed = a4;
  objc_msgSend(v41, "bulletinID");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  bulletinID = self->_bulletinID;
  self->_bulletinID = v7;

  objc_msgSend(v41, "recordID");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  recordID = self->_recordID;
  self->_recordID = v9;

  objc_msgSend(v41, "sectionID");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  sectionID = self->_sectionID;
  self->_sectionID = v11;

  self->_sectionSubtype = objc_msgSend(v41, "sectionSubtype");
  objc_msgSend(v41, "date");
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v13;

  self->_allDay = objc_msgSend(v41, "dateIsAllDay");
  objc_msgSend(v41, "endDate");
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v15;

  objc_msgSend(v41, "recencyDate");
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  recencyDate = self->_recencyDate;
  self->_recencyDate = v17;

  objc_msgSend(v41, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  self->_timeZone = v20;

  objc_msgSend(v41, "title");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v22;

  objc_msgSend(v41, "message");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  message = self->_message;
  self->_message = v24;

  objc_msgSend(v41, "modalAlertContent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "message");
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  modalAlertContentMessage = self->_modalAlertContentMessage;
  self->_modalAlertContentMessage = v27;

  objc_msgSend(v41, "subtitle");
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitle = self->_subtitle;
  self->_subtitle = v29;

  objc_msgSend(v41, "publisherBulletinID");
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  publisherBulletinID = self->_publisherBulletinID;
  self->_publisherBulletinID = v31;

  objc_msgSend(v41, "intentIDs");
  v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  intentIDs = self->_intentIDs;
  self->_intentIDs = v33;

  self->_previewRestricted = (objc_msgSend(v41, "contentPreviewSetting") & 0xFFFFFFFFFFFFFFFELL) == 2;
  objc_msgSend(v41, "threadID");
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  threadID = self->_threadID;
  self->_threadID = v35;

  -[AFBulletin _displayNameForBulletin:](self, "_displayNameForBulletin:", v41);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  self->_displayName = v37;

  objc_msgSend((id)objc_opt_class(), "internalIDForBBBulletinID:", self->_bulletinID);
  v39 = (NSString *)objc_claimAutoreleasedReturnValue();
  internalID = self->_internalID;
  self->_internalID = v39;

}

- (void)setNotification:(id)a3 fromSourceApp:(id)a4
{
  id v6;
  NSDate *v7;
  NSDate *date;
  NSDate *v9;
  NSDate *recencyDate;
  void *v11;
  NSString *v12;
  NSString *displayName;
  void *v14;
  NSString *v15;
  NSString *bulletinID;
  NSString *v17;
  NSString *publisherBulletinID;
  void *v19;
  NSString *v20;
  NSString *title;
  NSString *v22;
  NSString *subtitle;
  NSString *v24;
  NSString *message;
  NSString *v26;
  NSString *threadID;
  NSString *v28;
  NSString *internalID;
  id v30;

  v30 = a3;
  v6 = a4;
  objc_msgSend(v30, "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v7;

  objc_msgSend(v30, "date");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  recencyDate = self->_recencyDate;
  self->_recencyDate = v9;

  if (objc_opt_class())
  {
    objc_msgSend(getLSApplicationProxyClass_30434(), "applicationProxyForIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedNameForContext:", 0);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    displayName = self->_displayName;
    self->_displayName = v12;

    objc_msgSend(v30, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    bulletinID = self->_bulletinID;
    self->_bulletinID = v15;

    objc_msgSend(v14, "identifier");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    publisherBulletinID = self->_publisherBulletinID;
    self->_publisherBulletinID = v17;

    objc_storeStrong((id *)&self->_sectionID, a4);
    objc_msgSend(v14, "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "title");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v20;

    objc_msgSend(v19, "subtitle");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle = self->_subtitle;
    self->_subtitle = v22;

    objc_msgSend(v19, "body");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    message = self->_message;
    self->_message = v24;

    self->_allDay = objc_msgSend(v19, "shouldHideTime");
    objc_msgSend(v19, "threadIdentifier");
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    threadID = self->_threadID;
    self->_threadID = v26;

    self->_supportsSpokenNotification = (objc_msgSend(v14, "destinations") & 0x10) != 0;
    v28 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UN://%@"), self->_bulletinID);
    internalID = self->_internalID;
    self->_internalID = v28;

  }
}

- (void)wasRemovedFromFeed:(unint64_t)a3
{
  self->_feed &= ~a3;
}

- (AFBulletin)initWithCoder:(id)a3
{
  id v4;
  AFBulletin *v5;
  uint64_t v6;
  NSString *bulletinID;
  uint64_t v8;
  NSString *recordID;
  uint64_t v10;
  NSString *sectionID;
  uint64_t v12;
  NSDate *date;
  uint64_t v14;
  NSDate *endDate;
  uint64_t v16;
  NSDate *recencyDate;
  uint64_t v18;
  NSString *timeZone;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *message;
  uint64_t v24;
  NSString *displayName;
  uint64_t v26;
  NSString *subtitle;
  uint64_t v28;
  NSString *publisherBulletinID;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *intentIDs;
  uint64_t v35;
  NSString *internalID;
  uint64_t v37;
  NSString *threadID;
  void *v39;
  objc_super v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AFBulletin;
  v5 = -[AFBulletin init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bulletinID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bulletinID = v5->_bulletinID;
    v5->_bulletinID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordID"));
    v8 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionID"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v10;

    v5->_sectionSubtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sectionSubtype"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v12 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    v5->_allDay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allDay"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recencyDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    recencyDate = v5->_recencyDate;
    v5->_recencyDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timeZone"));
    v18 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v20 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_message"));
    v22 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
    v24 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subtitle"));
    v26 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_publisherBulletinID"));
    v28 = objc_claimAutoreleasedReturnValue();
    publisherBulletinID = v5->_publisherBulletinID;
    v5->_publisherBulletinID = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("_intentIDs"));
    v33 = objc_claimAutoreleasedReturnValue();
    intentIDs = v5->_intentIDs;
    v5->_intentIDs = (NSArray *)v33;

    v5->_availableOnLockScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_availableOnLockScreen"));
    v5->_supportsSpokenNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsSpokenNotification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_internalID"));
    v35 = objc_claimAutoreleasedReturnValue();
    internalID = v5->_internalID;
    v5->_internalID = (NSString *)v35;

    v5->_previewRestricted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_previewRestricted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_threadID"));
    v37 = objc_claimAutoreleasedReturnValue();
    threadID = v5->_threadID;
    v5->_threadID = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_feed"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_feed = objc_msgSend(v39, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bulletinID;
  id v5;
  id v6;

  bulletinID = self->_bulletinID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bulletinID, CFSTR("_bulletinID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordID, CFSTR("_recordID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionID, CFSTR("_sectionID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sectionSubtype, CFSTR("_sectionSubtype"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("_date"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allDay, CFSTR("_allDay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("_endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recencyDate, CFSTR("_recencyDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("_timeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("_message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("_subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publisherBulletinID, CFSTR("_publisherBulletinID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentIDs, CFSTR("_intentIDs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_availableOnLockScreen, CFSTR("_availableOnLockScreen"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsSpokenNotification, CFSTR("_supportsSpokenNotification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_internalID, CFSTR("_internalID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_previewRestricted, CFSTR("_previewRestricted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_threadID, CFSTR("_threadID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_feed);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_feed"));

}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)availableOnLockScreen
{
  return self->_availableOnLockScreen;
}

- (void)setAvailableOnLockScreen:(BOOL)a3
{
  self->_availableOnLockScreen = a3;
}

- (BOOL)supportsSpokenNotification
{
  return self->_supportsSpokenNotification;
}

- (void)setSupportsSpokenNotification:(BOOL)a3
{
  self->_supportsSpokenNotification = a3;
}

- (int64_t)announcementType
{
  return self->_announcementType;
}

- (void)setAnnouncementType:(int64_t)a3
{
  self->_announcementType = a3;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UNNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setNotificationRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isRead
{
  return self->_read;
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (BBBulletin)bbBulletin
{
  return self->_bbBulletin;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)modalAlertContentMessage
{
  return self->_modalAlertContentMessage;
}

- (NSDate)recencyDate
{
  return self->_recencyDate;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (int64_t)sectionSubtype
{
  return self->_sectionSubtype;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)intentIDs
{
  return self->_intentIDs;
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (BOOL)previewRestricted
{
  return self->_previewRestricted;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSString)internalID
{
  return self->_internalID;
}

- (NSArray)actionsStore
{
  return self->_actionsStore;
}

- (void)setActionsStore:(id)a3
{
  objc_storeStrong((id *)&self->_actionsStore, a3);
}

- (NSDictionary)actionsByIdentifier
{
  return self->_actionsByIdentifier;
}

- (void)setActionsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionsByIdentifier, a3);
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_actionsStore, 0);
  objc_storeStrong((id *)&self->_internalID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_intentIDs, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recencyDate, 0);
  objc_storeStrong((id *)&self->_modalAlertContentMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong((id *)&self->_bbBulletin, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (id)_createAssistantActionsForBulletin:(id)a3
{
  id v3;
  id v4;
  void *v5;
  AFBulletinAction *v6;
  void *v7;
  AFBulletinAction *v8;
  void *v9;
  AFBulletinAction *v10;
  void *v11;
  AFBulletinAction *v12;
  void *v13;
  AFBulletinAction *v14;
  void *v15;
  AFBulletinAction *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  AFBulletinAction *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "defaultAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [AFBulletinAction alloc];
    objc_msgSend(v3, "defaultAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AFBulletinAction initWithBulletinAction:](v6, "initWithBulletinAction:", v7);

    objc_msgSend(v4, "addObject:", v8);
  }
  objc_msgSend(v3, "dismissAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [AFBulletinAction alloc];
    objc_msgSend(v3, "dismissAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AFBulletinAction initWithBulletinAction:](v10, "initWithBulletinAction:", v11);

    -[AFBulletinAction addTitleVariant:](v12, "addTitleVariant:", CFSTR("Dismiss"));
    objc_msgSend(v4, "addObject:", v12);

  }
  objc_msgSend(v3, "snoozeAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [AFBulletinAction alloc];
    objc_msgSend(v3, "dismissAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[AFBulletinAction initWithBulletinAction:](v14, "initWithBulletinAction:", v15);

    -[AFBulletinAction addTitleVariant:](v16, "addTitleVariant:", CFSTR("Snooze"));
    objc_msgSend(v4, "addObject:", v16);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "supplementaryActions", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = -[AFBulletinAction initWithBulletinAction:]([AFBulletinAction alloc], "initWithBulletinAction:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21));
        objc_msgSend(v4, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }

  return v4;
}

+ (id)internalIDForBBBulletinID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("BB://%@"), v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
