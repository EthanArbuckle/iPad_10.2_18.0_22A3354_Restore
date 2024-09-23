@implementation ATXPBUserNotification

- (void)setTimestamp:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTimestamp
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (void)setBadge:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_badge = a3;
}

- (void)setHasBadge:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBadge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasThreadID
{
  return self->_threadID != 0;
}

- (BOOL)hasCategoryID
{
  return self->_categoryID != 0;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (void)clearContactIDs
{
  -[NSMutableArray removeAllObjects](self->_contactIDs, "removeAllObjects");
}

- (void)addContactIDs:(id)a3
{
  id v4;
  NSMutableArray *contactIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contactIDs = self->_contactIDs;
  v8 = v4;
  if (!contactIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contactIDs;
    self->_contactIDs = v6;

    v4 = v8;
    contactIDs = self->_contactIDs;
  }
  -[NSMutableArray addObject:](contactIDs, "addObject:", v4);

}

- (unint64_t)contactIDsCount
{
  return -[NSMutableArray count](self->_contactIDs, "count");
}

- (id)contactIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contactIDs, "objectAtIndex:", a3);
}

+ (Class)contactIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearRawIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_rawIdentifiers, "removeAllObjects");
}

- (void)addRawIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *rawIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rawIdentifiers = self->_rawIdentifiers;
  v8 = v4;
  if (!rawIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rawIdentifiers;
    self->_rawIdentifiers = v6;

    v4 = v8;
    rawIdentifiers = self->_rawIdentifiers;
  }
  -[NSMutableArray addObject:](rawIdentifiers, "addObject:", v4);

}

- (unint64_t)rawIdentifiersCount
{
  return -[NSMutableArray count](self->_rawIdentifiers, "count");
}

- (id)rawIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rawIdentifiers, "objectAtIndex:", a3);
}

+ (Class)rawIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)setIsMessage:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isMessage = a3;
}

- (void)setHasIsMessage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsMessage
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsGroupMessage:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsGroupMessage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)urgency
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_urgency;
  else
    return 0;
}

- (void)setUrgency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_urgency = a3;
}

- (void)setHasUrgency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasUrgency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)urgencyAsString:(int)a3
{
  if (a3 < 7)
    return off_1E4D59148[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUrgency:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Critical")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TimeSensitive")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Active")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Passive")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Priority")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)attachmentType
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_attachmentType;
  else
    return 0;
}

- (void)setAttachmentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_attachmentType = a3;
}

- (void)setHasAttachmentType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasAttachmentType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)attachmentTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E4D59180[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAttachmentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Image")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Video")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAppSpecifiedScore:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appSpecifiedScore = a3;
}

- (void)setHasAppSpecifiedScore:(BOOL)a3
{
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAppSpecifiedScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasDerivedData
{
  return self->_derivedData != 0;
}

- (BOOL)hasSharedEngagementTracker
{
  return self->_sharedEngagementTracker != 0;
}

- (BOOL)hasNotificationID
{
  return self->_notificationID != 0;
}

- (void)setRecordTimestamp:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_recordTimestamp = a3;
}

- (void)setHasRecordTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasRecordTimestamp
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBodyLength:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bodyLength = a3;
}

- (void)setHasBodyLength:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBodyLength
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTitleLength:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_titleLength = a3;
}

- (void)setHasTitleLength:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTitleLength
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSubtitleLength:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_subtitleLength = a3;
}

- (void)setHasSubtitleLength:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasSubtitleLength
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsSummarized:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isSummarized = a3;
}

- (void)setHasIsSummarized:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsSummarized
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (void)setSummaryLength:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_summaryLength = a3;
}

- (void)setHasSummaryLength:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSummaryLength
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsPartOfStack:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isPartOfStack = a3;
}

- (void)setHasIsPartOfStack:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsPartOfStack
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsStackSummary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isStackSummary = a3;
}

- (void)setHasIsStackSummary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsStackSummary
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPositionInStack:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_positionInStack = a3;
}

- (void)setHasPositionInStack:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPositionInStack
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNumberOfNotificationsInStack:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_numberOfNotificationsInStack = a3;
}

- (void)setHasNumberOfNotificationsInStack:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNumberOfNotificationsInStack
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsDeterminedUrgentByModel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isDeterminedUrgentByModel = a3;
}

- (void)setHasIsDeterminedUrgentByModel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsDeterminedUrgentByModel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)priorityStatus
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_priorityStatus;
  else
    return 0;
}

- (void)setPriorityStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_priorityStatus = a3;
}

- (void)setHasPriorityStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($FE5A2A2B207A7DB80055BB7F341D5824)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPriorityStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)priorityStatusAsString:(int)a3
{
  if (a3 < 5)
    return off_1E4D591B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPriorityStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsPriority")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IsNotPriority")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InferenceTimedOut")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotification;
  -[ATXPBUserNotification description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUserNotification dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  NSString *title;
  NSString *subtitle;
  NSString *body;
  void *v9;
  NSData *userInfo;
  NSString *bundleID;
  NSString *threadID;
  NSString *categoryID;
  NSString *sectionID;
  NSMutableArray *contactIDs;
  NSMutableArray *rawIdentifiers;
  $FE5A2A2B207A7DB80055BB7F341D5824 has;
  void *v18;
  ATXPBUserNotificationDerivedData *derivedData;
  void *v20;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  void *v22;
  NSString *notificationID;
  $FE5A2A2B207A7DB80055BB7F341D5824 v24;
  void *v25;
  NSString *summary;
  $FE5A2A2B207A7DB80055BB7F341D5824 v27;
  void *v28;
  void *v29;
  uint64_t urgency;
  __CFString *v31;
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
  uint64_t priorityStatus;
  __CFString *v43;
  uint64_t attachmentType;
  __CFString *v45;
  id v46;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v3, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  body = self->_body;
  if (body)
    objc_msgSend(v3, "setObject:forKey:", body, CFSTR("body"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_badge);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("badge"));

  }
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v3, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  threadID = self->_threadID;
  if (threadID)
    objc_msgSend(v3, "setObject:forKey:", threadID, CFSTR("threadID"));
  categoryID = self->_categoryID;
  if (categoryID)
    objc_msgSend(v3, "setObject:forKey:", categoryID, CFSTR("categoryID"));
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v3, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  contactIDs = self->_contactIDs;
  if (contactIDs)
    objc_msgSend(v3, "setObject:forKey:", contactIDs, CFSTR("contactIDs"));
  rawIdentifiers = self->_rawIdentifiers;
  if (rawIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", rawIdentifiers, CFSTR("rawIdentifiers"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMessage);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("isMessage"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_29:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_30;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGroupMessage);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("isGroupMessage"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_57:
  urgency = self->_urgency;
  if (urgency >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_urgency);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_1E4D59148[urgency];
  }
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("urgency"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_74:
  attachmentType = self->_attachmentType;
  if (attachmentType >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_attachmentType);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = off_1E4D59180[attachmentType];
  }
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("attachmentType"));

  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appSpecifiedScore);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("appSpecifiedScore"));

  }
LABEL_33:
  derivedData = self->_derivedData;
  if (derivedData)
  {
    -[ATXPBUserNotificationDerivedData dictionaryRepresentation](derivedData, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("derivedData"));

  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    -[ATXPBSharedDigestEngagementTrackingMetrics dictionaryRepresentation](sharedEngagementTracker, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sharedEngagementTracker"));

  }
  notificationID = self->_notificationID;
  if (notificationID)
    objc_msgSend(v3, "setObject:forKey:", notificationID, CFSTR("notificationID"));
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_recordTimestamp);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("recordTimestamp"));

    v24 = self->_has;
    if ((*(_BYTE *)&v24 & 4) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v24 & 0x200) == 0)
        goto LABEL_42;
      goto LABEL_61;
    }
  }
  else if ((*(_BYTE *)&v24 & 4) == 0)
  {
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_bodyLength);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("bodyLength"));

  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x200) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&v24 & 0x40) == 0)
      goto LABEL_43;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_titleLength);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("titleLength"));

  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 0x40) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v24 & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_subtitleLength);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("subtitleLength"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSummarized);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("isSummarized"));

  }
LABEL_45:
  summary = self->_summary;
  if (summary)
    objc_msgSend(v3, "setObject:forKey:", summary, CFSTR("summary"));
  v27 = self->_has;
  if ((*(_BYTE *)&v27 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_summaryLength);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("summaryLength"));

    v27 = self->_has;
    if ((*(_DWORD *)&v27 & 0x10000) == 0)
    {
LABEL_49:
      if ((*(_DWORD *)&v27 & 0x20000) == 0)
        goto LABEL_50;
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v27 & 0x10000) == 0)
  {
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPartOfStack);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("isPartOfStack"));

  v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x20000) == 0)
  {
LABEL_50:
    if ((*(_BYTE *)&v27 & 0x10) == 0)
      goto LABEL_51;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStackSummary);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("isStackSummary"));

  v27 = self->_has;
  if ((*(_BYTE *)&v27 & 0x10) == 0)
  {
LABEL_51:
    if ((*(_BYTE *)&v27 & 8) == 0)
      goto LABEL_52;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_positionInStack);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("positionInStack"));

  v27 = self->_has;
  if ((*(_BYTE *)&v27 & 8) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v27 & 0x2000) == 0)
      goto LABEL_53;
LABEL_69:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeterminedUrgentByModel);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("isDeterminedUrgentByModel"));

    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_78;
    goto LABEL_70;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numberOfNotificationsInStack);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("numberOfNotificationsInStack"));

  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x2000) != 0)
    goto LABEL_69;
LABEL_53:
  if ((*(_WORD *)&v27 & 0x800) == 0)
    goto LABEL_78;
LABEL_70:
  priorityStatus = self->_priorityStatus;
  if (priorityStatus >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_priorityStatus);
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = off_1E4D591B0[priorityStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("priorityStatus"));

LABEL_78:
  v46 = v3;

  return v46;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $FE5A2A2B207A7DB80055BB7F341D5824 has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $FE5A2A2B207A7DB80055BB7F341D5824 v16;
  $FE5A2A2B207A7DB80055BB7F341D5824 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_body)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_userInfo)
    PBDataWriterWriteDataField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_derivedData)
    PBDataWriterWriteSubmessage();
  if (self->_threadID)
    PBDataWriterWriteStringField();
  if (self->_categoryID)
    PBDataWriterWriteStringField();
  if (self->_sectionID)
    PBDataWriterWriteStringField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_contactIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_34:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_35;
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_36:
    PBDataWriterWriteInt32Field();
LABEL_37:
  if (self->_sharedEngagementTracker)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_rawIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  if (self->_notificationID)
    PBDataWriterWriteStringField();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    v16 = self->_has;
    if ((*(_BYTE *)&v16 & 4) == 0)
    {
LABEL_52:
      if ((*(_WORD *)&v16 & 0x200) == 0)
        goto LABEL_53;
      goto LABEL_73;
    }
  }
  else if ((*(_BYTE *)&v16 & 4) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteUint64Field();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) == 0)
  {
LABEL_53:
    if ((*(_BYTE *)&v16 & 0x40) == 0)
      goto LABEL_54;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x40) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v16 & 0x40000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
LABEL_55:
    PBDataWriterWriteBOOLField();
LABEL_56:
  if (self->_summary)
    PBDataWriterWriteStringField();
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
    {
LABEL_60:
      if ((*(_DWORD *)&v17 & 0x20000) == 0)
        goto LABEL_61;
      goto LABEL_78;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
    goto LABEL_60;
  }
  PBDataWriterWriteBOOLField();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) == 0)
  {
LABEL_61:
    if ((*(_BYTE *)&v17 & 0x10) == 0)
      goto LABEL_62;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x10) == 0)
  {
LABEL_62:
    if ((*(_BYTE *)&v17 & 8) == 0)
      goto LABEL_63;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 8) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&v17 & 0x2000) == 0)
      goto LABEL_64;
LABEL_81:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x2000) != 0)
    goto LABEL_81;
LABEL_64:
  if ((*(_WORD *)&v17 & 0x800) != 0)
LABEL_65:
    PBDataWriterWriteInt32Field();
LABEL_66:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  $FE5A2A2B207A7DB80055BB7F341D5824 has;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  $FE5A2A2B207A7DB80055BB7F341D5824 v15;
  _QWORD *v16;
  $FE5A2A2B207A7DB80055BB7F341D5824 v17;
  _QWORD *v18;

  v4 = a3;
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    v4[9] = *(_QWORD *)&self->_timestamp;
    *((_DWORD *)v4 + 60) |= 0x100u;
  }
  v18 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v18;
  }
  if (self->_title)
  {
    objc_msgSend(v18, "setTitle:");
    v4 = v18;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v18, "setSubtitle:");
    v4 = v18;
  }
  if (self->_body)
  {
    objc_msgSend(v18, "setBody:");
    v4 = v18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_badge;
    *((_DWORD *)v4 + 60) |= 2u;
  }
  if (self->_userInfo)
    objc_msgSend(v18, "setUserInfo:");
  if (self->_bundleID)
    objc_msgSend(v18, "setBundleID:");
  if (self->_derivedData)
    objc_msgSend(v18, "setDerivedData:");
  if (self->_threadID)
    objc_msgSend(v18, "setThreadID:");
  if (self->_categoryID)
    objc_msgSend(v18, "setCategoryID:");
  if (self->_sectionID)
    objc_msgSend(v18, "setSectionID:");
  if (-[ATXPBUserNotification contactIDsCount](self, "contactIDsCount"))
  {
    objc_msgSend(v18, "clearContactIDs");
    v5 = -[ATXPBUserNotification contactIDsCount](self, "contactIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBUserNotification contactIDsAtIndex:](self, "contactIDsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addContactIDs:", v8);

      }
    }
  }
  has = self->_has;
  v10 = v18;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    *((_BYTE *)v18 + 233) = self->_isGroupMessage;
    *((_DWORD *)v18 + 60) |= 0x4000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_32;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_31;
  }
  *((_DWORD *)v18 + 52) = self->_urgency;
  *((_DWORD *)v18 + 60) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_63:
  *((_BYTE *)v18 + 234) = self->_isMessage;
  *((_DWORD *)v18 + 60) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_33:
    *((_DWORD *)v18 + 22) = self->_attachmentType;
    *((_DWORD *)v18 + 60) |= 0x400u;
  }
LABEL_34:
  if (self->_sharedEngagementTracker)
  {
    objc_msgSend(v18, "setSharedEngagementTracker:");
    v10 = v18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10[1] = *(_QWORD *)&self->_appSpecifiedScore;
    *((_DWORD *)v10 + 60) |= 1u;
  }
  if (-[ATXPBUserNotification rawIdentifiersCount](self, "rawIdentifiersCount"))
  {
    objc_msgSend(v18, "clearRawIdentifiers");
    v11 = -[ATXPBUserNotification rawIdentifiersCount](self, "rawIdentifiersCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[ATXPBUserNotification rawIdentifiersAtIndex:](self, "rawIdentifiersAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addRawIdentifiers:", v14);

      }
    }
  }
  if (self->_notificationID)
    objc_msgSend(v18, "setNotificationID:");
  v15 = self->_has;
  v16 = v18;
  if ((*(_BYTE *)&v15 & 0x20) != 0)
  {
    v18[6] = *(_QWORD *)&self->_recordTimestamp;
    *((_DWORD *)v18 + 60) |= 0x20u;
    v15 = self->_has;
    if ((*(_BYTE *)&v15 & 4) == 0)
    {
LABEL_46:
      if ((*(_WORD *)&v15 & 0x200) == 0)
        goto LABEL_47;
      goto LABEL_67;
    }
  }
  else if ((*(_BYTE *)&v15 & 4) == 0)
  {
    goto LABEL_46;
  }
  v18[3] = self->_bodyLength;
  *((_DWORD *)v18 + 60) |= 4u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&v15 & 0x40) == 0)
      goto LABEL_48;
    goto LABEL_68;
  }
LABEL_67:
  v18[10] = self->_titleLength;
  *((_DWORD *)v18 + 60) |= 0x200u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x40) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v15 & 0x40000) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_68:
  v18[7] = self->_subtitleLength;
  *((_DWORD *)v18 + 60) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_49:
    *((_BYTE *)v18 + 237) = self->_isSummarized;
    *((_DWORD *)v18 + 60) |= 0x40000u;
  }
LABEL_50:
  if (self->_summary)
  {
    objc_msgSend(v18, "setSummary:");
    v16 = v18;
  }
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
    v16[8] = self->_summaryLength;
    *((_DWORD *)v16 + 60) |= 0x80u;
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
    {
LABEL_54:
      if ((*(_DWORD *)&v17 & 0x20000) == 0)
        goto LABEL_55;
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
    goto LABEL_54;
  }
  *((_BYTE *)v16 + 235) = self->_isPartOfStack;
  *((_DWORD *)v16 + 60) |= 0x10000u;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) == 0)
  {
LABEL_55:
    if ((*(_BYTE *)&v17 & 0x10) == 0)
      goto LABEL_56;
    goto LABEL_73;
  }
LABEL_72:
  *((_BYTE *)v16 + 236) = self->_isStackSummary;
  *((_DWORD *)v16 + 60) |= 0x20000u;
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x10) == 0)
  {
LABEL_56:
    if ((*(_BYTE *)&v17 & 8) == 0)
      goto LABEL_57;
    goto LABEL_74;
  }
LABEL_73:
  v16[5] = self->_positionInStack;
  *((_DWORD *)v16 + 60) |= 0x10u;
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 8) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v17 & 0x2000) == 0)
      goto LABEL_58;
LABEL_75:
    *((_BYTE *)v16 + 232) = self->_isDeterminedUrgentByModel;
    *((_DWORD *)v16 + 60) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_74:
  v16[4] = self->_numberOfNotificationsInStack;
  *((_DWORD *)v16 + 60) |= 8u;
  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x2000) != 0)
    goto LABEL_75;
LABEL_58:
  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
LABEL_59:
    *((_DWORD *)v16 + 36) = self->_priorityStatus;
    *((_DWORD *)v16 + 60) |= 0x800u;
  }
LABEL_60:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  $FE5A2A2B207A7DB80055BB7F341D5824 has;
  id v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  $FE5A2A2B207A7DB80055BB7F341D5824 v44;
  uint64_t v45;
  void *v46;
  $FE5A2A2B207A7DB80055BB7F341D5824 v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(double *)(v5 + 72) = self->_timestamp;
    *(_DWORD *)(v5 + 240) |= 0x100u;
  }
  v7 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v7;

  v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v9;

  v11 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v11;

  v13 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_badge;
    *(_DWORD *)(v6 + 240) |= 2u;
  }
  v15 = -[NSData copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v15;

  v17 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v17;

  v19 = -[ATXPBUserNotificationDerivedData copyWithZone:](self->_derivedData, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v19;

  v21 = -[NSString copyWithZone:](self->_threadID, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v21;

  v23 = -[NSString copyWithZone:](self->_categoryID, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v23;

  v25 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v25;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = self->_contactIDs;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v54;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v31), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addContactIDs:", v32);

        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v29);
  }

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    *(_BYTE *)(v6 + 233) = self->_isGroupMessage;
    *(_DWORD *)(v6 + 240) |= 0x4000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_15;
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 208) = self->_urgency;
  *(_DWORD *)(v6 + 240) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_43:
  *(_BYTE *)(v6 + 234) = self->_isMessage;
  *(_DWORD *)(v6 + 240) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 88) = self->_attachmentType;
    *(_DWORD *)(v6 + 240) |= 0x400u;
  }
LABEL_17:
  v34 = -[ATXPBSharedDigestEngagementTrackingMetrics copyWithZone:](self->_sharedEngagementTracker, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v34;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_appSpecifiedScore;
    *(_DWORD *)(v6 + 240) |= 1u;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v36 = self->_rawIdentifiers;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v50;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v50 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v40), "copyWithZone:", a3, (_QWORD)v49);
        objc_msgSend((id)v6, "addRawIdentifiers:", v41);

        ++v40;
      }
      while (v38 != v40);
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v38);
  }

  v42 = -[NSString copyWithZone:](self->_notificationID, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v42;

  v44 = self->_has;
  if ((*(_BYTE *)&v44 & 0x20) != 0)
  {
    *(double *)(v6 + 48) = self->_recordTimestamp;
    *(_DWORD *)(v6 + 240) |= 0x20u;
    v44 = self->_has;
    if ((*(_BYTE *)&v44 & 4) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v44 & 0x200) == 0)
        goto LABEL_29;
      goto LABEL_47;
    }
  }
  else if ((*(_BYTE *)&v44 & 4) == 0)
  {
    goto LABEL_28;
  }
  *(_QWORD *)(v6 + 24) = self->_bodyLength;
  *(_DWORD *)(v6 + 240) |= 4u;
  v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x200) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v44 & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_48;
  }
LABEL_47:
  *(_QWORD *)(v6 + 80) = self->_titleLength;
  *(_DWORD *)(v6 + 240) |= 0x200u;
  v44 = self->_has;
  if ((*(_BYTE *)&v44 & 0x40) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v44 & 0x40000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_48:
  *(_QWORD *)(v6 + 56) = self->_subtitleLength;
  *(_DWORD *)(v6 + 240) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_31:
    *(_BYTE *)(v6 + 237) = self->_isSummarized;
    *(_DWORD *)(v6 + 240) |= 0x40000u;
  }
LABEL_32:
  v45 = -[NSString copyWithZone:](self->_summary, "copyWithZone:", a3, (_QWORD)v49);
  v46 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v45;

  v47 = self->_has;
  if ((*(_BYTE *)&v47 & 0x80) != 0)
  {
    *(_QWORD *)(v6 + 64) = self->_summaryLength;
    *(_DWORD *)(v6 + 240) |= 0x80u;
    v47 = self->_has;
    if ((*(_DWORD *)&v47 & 0x10000) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v47 & 0x20000) == 0)
        goto LABEL_35;
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v47 & 0x10000) == 0)
  {
    goto LABEL_34;
  }
  *(_BYTE *)(v6 + 235) = self->_isPartOfStack;
  *(_DWORD *)(v6 + 240) |= 0x10000u;
  v47 = self->_has;
  if ((*(_DWORD *)&v47 & 0x20000) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v47 & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_53;
  }
LABEL_52:
  *(_BYTE *)(v6 + 236) = self->_isStackSummary;
  *(_DWORD *)(v6 + 240) |= 0x20000u;
  v47 = self->_has;
  if ((*(_BYTE *)&v47 & 0x10) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v47 & 8) == 0)
      goto LABEL_37;
    goto LABEL_54;
  }
LABEL_53:
  *(_QWORD *)(v6 + 40) = self->_positionInStack;
  *(_DWORD *)(v6 + 240) |= 0x10u;
  v47 = self->_has;
  if ((*(_BYTE *)&v47 & 8) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v47 & 0x2000) == 0)
      goto LABEL_38;
LABEL_55:
    *(_BYTE *)(v6 + 232) = self->_isDeterminedUrgentByModel;
    *(_DWORD *)(v6 + 240) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return (id)v6;
    goto LABEL_39;
  }
LABEL_54:
  *(_QWORD *)(v6 + 32) = self->_numberOfNotificationsInStack;
  *(_DWORD *)(v6 + 240) |= 8u;
  v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x2000) != 0)
    goto LABEL_55;
LABEL_38:
  if ((*(_WORD *)&v47 & 0x800) != 0)
  {
LABEL_39:
    *(_DWORD *)(v6 + 144) = self->_priorityStatus;
    *(_DWORD *)(v6 + 240) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *uuid;
  NSString *title;
  NSString *subtitle;
  NSString *body;
  int v10;
  NSData *userInfo;
  NSString *bundleID;
  ATXPBUserNotificationDerivedData *derivedData;
  NSString *threadID;
  NSString *categoryID;
  NSString *sectionID;
  NSMutableArray *contactIDs;
  $FE5A2A2B207A7DB80055BB7F341D5824 has;
  int v19;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  int v21;
  NSMutableArray *rawIdentifiers;
  NSString *notificationID;
  $FE5A2A2B207A7DB80055BB7F341D5824 v24;
  int v25;
  NSString *summary;
  int v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_147;
  v5 = *((_DWORD *)v4 + 60);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    if ((v5 & 0x100) == 0 || self->_timestamp != *((double *)v4 + 9))
      goto LABEL_147;
  }
  else if ((v5 & 0x100) != 0)
  {
    goto LABEL_147;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 28) && !-[NSString isEqual:](uuid, "isEqual:"))
    goto LABEL_147;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_147;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_147;
  }
  body = self->_body;
  if ((unint64_t)body | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](body, "isEqual:"))
      goto LABEL_147;
  }
  v10 = *((_DWORD *)v4 + 60);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_badge != *((_QWORD *)v4 + 2))
      goto LABEL_147;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_147;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((_QWORD *)v4 + 27) && !-[NSData isEqual:](userInfo, "isEqual:"))
    goto LABEL_147;
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_147;
  }
  derivedData = self->_derivedData;
  if ((unint64_t)derivedData | *((_QWORD *)v4 + 16))
  {
    if (!-[ATXPBUserNotificationDerivedData isEqual:](derivedData, "isEqual:"))
      goto LABEL_147;
  }
  threadID = self->_threadID;
  if ((unint64_t)threadID | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](threadID, "isEqual:"))
      goto LABEL_147;
  }
  categoryID = self->_categoryID;
  if ((unint64_t)categoryID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](categoryID, "isEqual:"))
      goto LABEL_147;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:"))
      goto LABEL_147;
  }
  contactIDs = self->_contactIDs;
  if ((unint64_t)contactIDs | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](contactIDs, "isEqual:"))
      goto LABEL_147;
  }
  has = self->_has;
  v19 = *((_DWORD *)v4 + 60);
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v19 & 0x4000) == 0)
      goto LABEL_147;
    if (self->_isGroupMessage)
    {
      if (!*((_BYTE *)v4 + 233))
        goto LABEL_147;
    }
    else if (*((_BYTE *)v4 + 233))
    {
      goto LABEL_147;
    }
  }
  else if ((v19 & 0x4000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v19 & 0x1000) == 0 || self->_urgency != *((_DWORD *)v4 + 52))
      goto LABEL_147;
  }
  else if ((v19 & 0x1000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v19 & 0x8000) == 0)
      goto LABEL_147;
    if (self->_isMessage)
    {
      if (!*((_BYTE *)v4 + 234))
        goto LABEL_147;
    }
    else if (*((_BYTE *)v4 + 234))
    {
      goto LABEL_147;
    }
  }
  else if ((v19 & 0x8000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v19 & 0x400) == 0 || self->_attachmentType != *((_DWORD *)v4 + 22))
      goto LABEL_147;
  }
  else if ((v19 & 0x400) != 0)
  {
    goto LABEL_147;
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((_QWORD *)v4 + 21))
  {
    if (!-[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:"))
      goto LABEL_147;
    has = self->_has;
  }
  v21 = *((_DWORD *)v4 + 60);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v21 & 1) == 0 || self->_appSpecifiedScore != *((double *)v4 + 1))
      goto LABEL_147;
  }
  else if ((v21 & 1) != 0)
  {
    goto LABEL_147;
  }
  rawIdentifiers = self->_rawIdentifiers;
  if ((unint64_t)rawIdentifiers | *((_QWORD *)v4 + 19)
    && !-[NSMutableArray isEqual:](rawIdentifiers, "isEqual:"))
  {
    goto LABEL_147;
  }
  notificationID = self->_notificationID;
  if ((unint64_t)notificationID | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](notificationID, "isEqual:"))
      goto LABEL_147;
  }
  v24 = self->_has;
  v25 = *((_DWORD *)v4 + 60);
  if ((*(_BYTE *)&v24 & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0 || self->_recordTimestamp != *((double *)v4 + 6))
      goto LABEL_147;
  }
  else if ((v25 & 0x20) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_bodyLength != *((_QWORD *)v4 + 3))
      goto LABEL_147;
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
    if ((v25 & 0x200) == 0 || self->_titleLength != *((_QWORD *)v4 + 10))
      goto LABEL_147;
  }
  else if ((v25 & 0x200) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&v24 & 0x40) != 0)
  {
    if ((v25 & 0x40) == 0 || self->_subtitleLength != *((_QWORD *)v4 + 7))
      goto LABEL_147;
  }
  else if ((v25 & 0x40) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    if ((v25 & 0x40000) == 0)
      goto LABEL_147;
    if (self->_isSummarized)
    {
      if (!*((_BYTE *)v4 + 237))
        goto LABEL_147;
    }
    else if (*((_BYTE *)v4 + 237))
    {
      goto LABEL_147;
    }
  }
  else if ((v25 & 0x40000) != 0)
  {
    goto LABEL_147;
  }
  summary = self->_summary;
  if ((unint64_t)summary | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](summary, "isEqual:"))
      goto LABEL_147;
    v24 = self->_has;
  }
  v27 = *((_DWORD *)v4 + 60);
  if ((*(_BYTE *)&v24 & 0x80) != 0)
  {
    if ((v27 & 0x80) == 0 || self->_summaryLength != *((_QWORD *)v4 + 8))
      goto LABEL_147;
  }
  else if ((v27 & 0x80) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    if ((v27 & 0x10000) == 0)
      goto LABEL_147;
    if (self->_isPartOfStack)
    {
      if (!*((_BYTE *)v4 + 235))
        goto LABEL_147;
    }
    else if (*((_BYTE *)v4 + 235))
    {
      goto LABEL_147;
    }
  }
  else if ((v27 & 0x10000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v24 & 0x20000) != 0)
  {
    if ((v27 & 0x20000) == 0)
      goto LABEL_147;
    if (self->_isStackSummary)
    {
      if (!*((_BYTE *)v4 + 236))
        goto LABEL_147;
    }
    else if (*((_BYTE *)v4 + 236))
    {
      goto LABEL_147;
    }
  }
  else if ((v27 & 0x20000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&v24 & 0x10) != 0)
  {
    if ((v27 & 0x10) == 0 || self->_positionInStack != *((_QWORD *)v4 + 5))
      goto LABEL_147;
  }
  else if ((v27 & 0x10) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&v24 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_numberOfNotificationsInStack != *((_QWORD *)v4 + 4))
      goto LABEL_147;
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v24 & 0x2000) != 0)
  {
    if ((v27 & 0x2000) != 0)
    {
      if (self->_isDeterminedUrgentByModel)
      {
        if (!*((_BYTE *)v4 + 232))
          goto LABEL_147;
        goto LABEL_142;
      }
      if (!*((_BYTE *)v4 + 232))
        goto LABEL_142;
    }
LABEL_147:
    v28 = 0;
    goto LABEL_148;
  }
  if ((v27 & 0x2000) != 0)
    goto LABEL_147;
LABEL_142:
  if ((*(_WORD *)&v24 & 0x800) != 0)
  {
    if ((v27 & 0x800) == 0 || self->_priorityStatus != *((_DWORD *)v4 + 36))
      goto LABEL_147;
    v28 = 1;
  }
  else
  {
    v28 = (*((_DWORD *)v4 + 60) & 0x800) == 0;
  }
LABEL_148:

  return v28;
}

- (unint64_t)hash
{
  double timestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  $FE5A2A2B207A7DB80055BB7F341D5824 has;
  unint64_t v12;
  double appSpecifiedScore;
  double v14;
  long double v15;
  double v16;
  NSUInteger v17;
  $FE5A2A2B207A7DB80055BB7F341D5824 v18;
  unint64_t v19;
  double recordTimestamp;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  $FE5A2A2B207A7DB80055BB7F341D5824 v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  unint64_t v48;
  NSUInteger v49;
  uint64_t v50;
  unint64_t v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  unint64_t v56;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    timestamp = self->_timestamp;
    v4 = -timestamp;
    if (timestamp >= 0.0)
      v4 = self->_timestamp;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v56 = v10;
  }
  else
  {
    v56 = 0;
  }
  v55 = -[NSString hash](self->_uuid, "hash");
  v54 = -[NSString hash](self->_title, "hash");
  v53 = -[NSString hash](self->_subtitle, "hash");
  v52 = -[NSString hash](self->_body, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v51 = 2654435761u * self->_badge;
  else
    v51 = 0;
  v50 = -[NSData hash](self->_userInfo, "hash");
  v49 = -[NSString hash](self->_bundleID, "hash");
  v48 = -[ATXPBUserNotificationDerivedData hash](self->_derivedData, "hash");
  v47 = -[NSString hash](self->_threadID, "hash");
  v46 = -[NSString hash](self->_categoryID, "hash");
  v45 = -[NSString hash](self->_sectionID, "hash");
  v44 = -[NSMutableArray hash](self->_contactIDs, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    v43 = 2654435761 * self->_isGroupMessage;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_15:
      v42 = 2654435761 * self->_urgency;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_16;
LABEL_20:
      v41 = 0;
      if ((*(_WORD *)&has & 0x400) != 0)
        goto LABEL_17;
      goto LABEL_21;
    }
  }
  else
  {
    v43 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_15;
  }
  v42 = 0;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_20;
LABEL_16:
  v41 = 2654435761 * self->_isMessage;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_17:
    v40 = 2654435761 * self->_attachmentType;
    goto LABEL_22;
  }
LABEL_21:
  v40 = 0;
LABEL_22:
  v39 = -[ATXPBSharedDigestEngagementTrackingMetrics hash](self->_sharedEngagementTracker, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    appSpecifiedScore = self->_appSpecifiedScore;
    v14 = -appSpecifiedScore;
    if (appSpecifiedScore >= 0.0)
      v14 = self->_appSpecifiedScore;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  v38 = -[NSMutableArray hash](self->_rawIdentifiers, "hash");
  v17 = -[NSString hash](self->_notificationID, "hash");
  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x20) != 0)
  {
    recordTimestamp = self->_recordTimestamp;
    v21 = -recordTimestamp;
    if (recordTimestamp >= 0.0)
      v21 = self->_recordTimestamp;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&v18 & 4) != 0)
  {
    v24 = 2654435761u * self->_bodyLength;
    if ((*(_WORD *)&v18 & 0x200) != 0)
    {
LABEL_40:
      v25 = 2654435761u * self->_titleLength;
      if ((*(_BYTE *)&v18 & 0x40) != 0)
        goto LABEL_41;
LABEL_45:
      v26 = 0;
      if ((*(_DWORD *)&v18 & 0x40000) != 0)
        goto LABEL_42;
      goto LABEL_46;
    }
  }
  else
  {
    v24 = 0;
    if ((*(_WORD *)&v18 & 0x200) != 0)
      goto LABEL_40;
  }
  v25 = 0;
  if ((*(_BYTE *)&v18 & 0x40) == 0)
    goto LABEL_45;
LABEL_41:
  v26 = 2654435761u * self->_subtitleLength;
  if ((*(_DWORD *)&v18 & 0x40000) != 0)
  {
LABEL_42:
    v27 = 2654435761 * self->_isSummarized;
    goto LABEL_47;
  }
LABEL_46:
  v27 = 0;
LABEL_47:
  v28 = -[NSString hash](self->_summary, "hash");
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x80) != 0)
  {
    v30 = 2654435761u * self->_summaryLength;
    if ((*(_DWORD *)&v29 & 0x10000) != 0)
    {
LABEL_49:
      v31 = 2654435761 * self->_isPartOfStack;
      if ((*(_DWORD *)&v29 & 0x20000) != 0)
        goto LABEL_50;
      goto LABEL_57;
    }
  }
  else
  {
    v30 = 0;
    if ((*(_DWORD *)&v29 & 0x10000) != 0)
      goto LABEL_49;
  }
  v31 = 0;
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
LABEL_50:
    v32 = 2654435761 * self->_isStackSummary;
    if ((*(_BYTE *)&v29 & 0x10) != 0)
      goto LABEL_51;
    goto LABEL_58;
  }
LABEL_57:
  v32 = 0;
  if ((*(_BYTE *)&v29 & 0x10) != 0)
  {
LABEL_51:
    v33 = 2654435761u * self->_positionInStack;
    if ((*(_BYTE *)&v29 & 8) != 0)
      goto LABEL_52;
    goto LABEL_59;
  }
LABEL_58:
  v33 = 0;
  if ((*(_BYTE *)&v29 & 8) != 0)
  {
LABEL_52:
    v34 = 2654435761u * self->_numberOfNotificationsInStack;
    if ((*(_WORD *)&v29 & 0x2000) != 0)
      goto LABEL_53;
LABEL_60:
    v35 = 0;
    if ((*(_WORD *)&v29 & 0x800) != 0)
      goto LABEL_54;
LABEL_61:
    v36 = 0;
    return v55 ^ v56 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v12 ^ v38 ^ v17 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36;
  }
LABEL_59:
  v34 = 0;
  if ((*(_WORD *)&v29 & 0x2000) == 0)
    goto LABEL_60;
LABEL_53:
  v35 = 2654435761 * self->_isDeterminedUrgentByModel;
  if ((*(_WORD *)&v29 & 0x800) == 0)
    goto LABEL_61;
LABEL_54:
  v36 = 2654435761 * self->_priorityStatus;
  return v55 ^ v56 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v12 ^ v38 ^ v17 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  ATXPBUserNotificationDerivedData *derivedData;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 241) & 1) != 0)
  {
    self->_timestamp = v4[9];
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 28))
    -[ATXPBUserNotification setUuid:](self, "setUuid:");
  if (*((_QWORD *)v5 + 25))
    -[ATXPBUserNotification setTitle:](self, "setTitle:");
  if (*((_QWORD *)v5 + 22))
    -[ATXPBUserNotification setSubtitle:](self, "setSubtitle:");
  if (*((_QWORD *)v5 + 12))
    -[ATXPBUserNotification setBody:](self, "setBody:");
  if (((_BYTE)v5[30] & 2) != 0)
  {
    self->_badge = (unint64_t)v5[2];
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 27))
    -[ATXPBUserNotification setUserInfo:](self, "setUserInfo:");
  if (*((_QWORD *)v5 + 13))
    -[ATXPBUserNotification setBundleID:](self, "setBundleID:");
  derivedData = self->_derivedData;
  v7 = *((_QWORD *)v5 + 16);
  if (derivedData)
  {
    if (v7)
      -[ATXPBUserNotificationDerivedData mergeFrom:](derivedData, "mergeFrom:");
  }
  else if (v7)
  {
    -[ATXPBUserNotification setDerivedData:](self, "setDerivedData:");
  }
  if (*((_QWORD *)v5 + 24))
    -[ATXPBUserNotification setThreadID:](self, "setThreadID:");
  if (*((_QWORD *)v5 + 14))
    -[ATXPBUserNotification setCategoryID:](self, "setCategoryID:");
  if (*((_QWORD *)v5 + 20))
    -[ATXPBUserNotification setSectionID:](self, "setSectionID:");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = *((id *)v5 + 15);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        -[ATXPBUserNotification addContactIDs:](self, "addContactIDs:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v13 = *((_DWORD *)v5 + 60);
  if ((v13 & 0x4000) != 0)
  {
    self->_isGroupMessage = *((_BYTE *)v5 + 233);
    *(_DWORD *)&self->_has |= 0x4000u;
    v13 = *((_DWORD *)v5 + 60);
    if ((v13 & 0x1000) == 0)
    {
LABEL_37:
      if ((v13 & 0x8000) == 0)
        goto LABEL_38;
      goto LABEL_45;
    }
  }
  else if ((v13 & 0x1000) == 0)
  {
    goto LABEL_37;
  }
  self->_urgency = *((_DWORD *)v5 + 52);
  *(_DWORD *)&self->_has |= 0x1000u;
  v13 = *((_DWORD *)v5 + 60);
  if ((v13 & 0x8000) == 0)
  {
LABEL_38:
    if ((v13 & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_45:
  self->_isMessage = *((_BYTE *)v5 + 234);
  *(_DWORD *)&self->_has |= 0x8000u;
  if (((_DWORD)v5[30] & 0x400) != 0)
  {
LABEL_39:
    self->_attachmentType = *((_DWORD *)v5 + 22);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_40:
  sharedEngagementTracker = self->_sharedEngagementTracker;
  v15 = *((_QWORD *)v5 + 21);
  if (sharedEngagementTracker)
  {
    if (v15)
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
  }
  else if (v15)
  {
    -[ATXPBUserNotification setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }
  if (((_BYTE)v5[30] & 1) != 0)
  {
    self->_appSpecifiedScore = v5[1];
    *(_DWORD *)&self->_has |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = *((id *)v5 + 19);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        -[ATXPBUserNotification addRawIdentifiers:](self, "addRawIdentifiers:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v5 + 17))
    -[ATXPBUserNotification setNotificationID:](self, "setNotificationID:");
  v21 = *((_DWORD *)v5 + 60);
  if ((v21 & 0x20) != 0)
  {
    self->_recordTimestamp = v5[6];
    *(_DWORD *)&self->_has |= 0x20u;
    v21 = *((_DWORD *)v5 + 60);
    if ((v21 & 4) == 0)
    {
LABEL_62:
      if ((v21 & 0x200) == 0)
        goto LABEL_63;
      goto LABEL_79;
    }
  }
  else if ((v21 & 4) == 0)
  {
    goto LABEL_62;
  }
  self->_bodyLength = (unint64_t)v5[3];
  *(_DWORD *)&self->_has |= 4u;
  v21 = *((_DWORD *)v5 + 60);
  if ((v21 & 0x200) == 0)
  {
LABEL_63:
    if ((v21 & 0x40) == 0)
      goto LABEL_64;
    goto LABEL_80;
  }
LABEL_79:
  self->_titleLength = (unint64_t)v5[10];
  *(_DWORD *)&self->_has |= 0x200u;
  v21 = *((_DWORD *)v5 + 60);
  if ((v21 & 0x40) == 0)
  {
LABEL_64:
    if ((v21 & 0x40000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_80:
  self->_subtitleLength = (unint64_t)v5[7];
  *(_DWORD *)&self->_has |= 0x40u;
  if (((_DWORD)v5[30] & 0x40000) != 0)
  {
LABEL_65:
    self->_isSummarized = *((_BYTE *)v5 + 237);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_66:
  if (*((_QWORD *)v5 + 23))
    -[ATXPBUserNotification setSummary:](self, "setSummary:");
  v22 = *((_DWORD *)v5 + 60);
  if ((v22 & 0x80) != 0)
  {
    self->_summaryLength = (unint64_t)v5[8];
    *(_DWORD *)&self->_has |= 0x80u;
    v22 = *((_DWORD *)v5 + 60);
    if ((v22 & 0x10000) == 0)
    {
LABEL_70:
      if ((v22 & 0x20000) == 0)
        goto LABEL_71;
      goto LABEL_84;
    }
  }
  else if ((v22 & 0x10000) == 0)
  {
    goto LABEL_70;
  }
  self->_isPartOfStack = *((_BYTE *)v5 + 235);
  *(_DWORD *)&self->_has |= 0x10000u;
  v22 = *((_DWORD *)v5 + 60);
  if ((v22 & 0x20000) == 0)
  {
LABEL_71:
    if ((v22 & 0x10) == 0)
      goto LABEL_72;
    goto LABEL_85;
  }
LABEL_84:
  self->_isStackSummary = *((_BYTE *)v5 + 236);
  *(_DWORD *)&self->_has |= 0x20000u;
  v22 = *((_DWORD *)v5 + 60);
  if ((v22 & 0x10) == 0)
  {
LABEL_72:
    if ((v22 & 8) == 0)
      goto LABEL_73;
    goto LABEL_86;
  }
LABEL_85:
  self->_positionInStack = (unint64_t)v5[5];
  *(_DWORD *)&self->_has |= 0x10u;
  v22 = *((_DWORD *)v5 + 60);
  if ((v22 & 8) == 0)
  {
LABEL_73:
    if ((v22 & 0x2000) == 0)
      goto LABEL_74;
LABEL_87:
    self->_isDeterminedUrgentByModel = *((_BYTE *)v5 + 232);
    *(_DWORD *)&self->_has |= 0x2000u;
    if (((_DWORD)v5[30] & 0x800) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_86:
  self->_numberOfNotificationsInStack = (unint64_t)v5[4];
  *(_DWORD *)&self->_has |= 8u;
  v22 = *((_DWORD *)v5 + 60);
  if ((v22 & 0x2000) != 0)
    goto LABEL_87;
LABEL_74:
  if ((v22 & 0x800) != 0)
  {
LABEL_75:
    self->_priorityStatus = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_76:

}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (unint64_t)badge
{
  return self->_badge;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
  objc_storeStrong((id *)&self->_threadID, a3);
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
  objc_storeStrong((id *)&self->_categoryID, a3);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (NSMutableArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactIDs, a3);
}

- (NSMutableArray)rawIdentifiers
{
  return self->_rawIdentifiers;
}

- (void)setRawIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_rawIdentifiers, a3);
}

- (BOOL)isMessage
{
  return self->_isMessage;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (double)appSpecifiedScore
{
  return self->_appSpecifiedScore;
}

- (ATXPBUserNotificationDerivedData)derivedData
{
  return self->_derivedData;
}

- (void)setDerivedData:(id)a3
{
  objc_storeStrong((id *)&self->_derivedData, a3);
}

- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker
{
  return self->_sharedEngagementTracker;
}

- (void)setSharedEngagementTracker:(id)a3
{
  objc_storeStrong((id *)&self->_sharedEngagementTracker, a3);
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationID, a3);
}

- (double)recordTimestamp
{
  return self->_recordTimestamp;
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (unint64_t)titleLength
{
  return self->_titleLength;
}

- (unint64_t)subtitleLength
{
  return self->_subtitleLength;
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (unint64_t)summaryLength
{
  return self->_summaryLength;
}

- (BOOL)isPartOfStack
{
  return self->_isPartOfStack;
}

- (BOOL)isStackSummary
{
  return self->_isStackSummary;
}

- (unint64_t)positionInStack
{
  return self->_positionInStack;
}

- (unint64_t)numberOfNotificationsInStack
{
  return self->_numberOfNotificationsInStack;
}

- (BOOL)isDeterminedUrgentByModel
{
  return self->_isDeterminedUrgentByModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sharedEngagementTracker, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_rawIdentifiers, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_derivedData, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUserNotification *v5;
  id v6;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  ATXPBUserNotificationDerivedData *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  ATXPBSharedDigestEngagementTrackingMetrics *v57;
  void *v58;
  void *v59;
  id v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXPBUserNotification init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      -[ATXPBUserNotification setTimestamp:](v5, "setTimestamp:");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setUuid:](v5, "setUuid:", v8);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setTitle:](v5, "setTitle:", v10);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setSubtitle:](v5, "setSubtitle:", v12);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setBody:](v5, "setBody:", v14);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("badge"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setBadge:](v5, "setBadge:", objc_msgSend(v15, "unsignedIntValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapData:](ATXJSONHelper, "unwrapData:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setUserInfo:](v5, "setUserInfo:", v17);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setBundleID:](v5, "setBundleID:", v19);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("threadID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setThreadID:](v5, "setThreadID:", v21);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("categoryID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setCategoryID:](v5, "setCategoryID:", v23);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactIDs"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactIDs"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactIDs"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v67;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v67 != v30)
                  objc_enumerationMutation(v27);
                -[ATXPBUserNotification addContactIDs:](v5, "addContactIDs:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
            }
            while (v29);
          }

        }
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawIdentifiers"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rawIdentifiers"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v35 = v34;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v63 != v38)
                  objc_enumerationMutation(v35);
                -[ATXPBUserNotification addRawIdentifiers:](v5, "addRawIdentifiers:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j), (_QWORD)v62);
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            }
            while (v37);
          }

        }
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMessage"), (_QWORD)v62);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setIsMessage:](v5, "setIsMessage:", objc_msgSend(v40, "BOOLValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isGroupMessage"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotification setIsGroupMessage:](v5, "setIsGroupMessage:", objc_msgSend(v41, "BOOLValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("urgency"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("urgency"));
        v43 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v43, "isEqualToString:", CFSTR("Critical")) & 1) != 0)
        {
          v44 = 0;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("TimeSensitive")) & 1) != 0)
        {
          v44 = 1;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("Active")) & 1) != 0)
        {
          v44 = 2;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("Passive")) & 1) != 0)
        {
          v44 = 3;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("None")) & 1) != 0)
        {
          v44 = 4;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("Priority")) & 1) != 0)
        {
          v44 = 5;
        }
        else if (objc_msgSend(v43, "isEqualToString:", CFSTR("Total")))
        {
          v44 = 6;
        }
        else
        {
          v44 = 0;
        }

        -[ATXPBUserNotification setUrgency:](v5, "setUrgency:", v44);
      }
      else
      {
        -[ATXPBUserNotification setUrgency:](v5, "setUrgency:", 4);
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attachmentType"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attachmentType"));
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v46, "isEqualToString:", CFSTR("None")) & 1) != 0)
        {
          v47 = 0;
        }
        else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("Image")) & 1) != 0)
        {
          v47 = 1;
        }
        else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
        {
          v47 = 2;
        }
        else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("Video")) & 1) != 0)
        {
          v47 = 3;
        }
        else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("Other")) & 1) != 0)
        {
          v47 = 4;
        }
        else if (objc_msgSend(v46, "isEqualToString:", CFSTR("Total")))
        {
          v47 = 5;
        }
        else
        {
          v47 = 0;
        }

        -[ATXPBUserNotification setAttachmentType:](v5, "setAttachmentType:", v47);
      }
      else
      {
        -[ATXPBUserNotification setAttachmentType:](v5, "setAttachmentType:", 0);
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appSpecifiedScore"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "doubleValue");
      -[ATXPBUserNotification setAppSpecifiedScore:](v5, "setAppSpecifiedScore:");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("derivedData"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        v51 = [ATXPBUserNotificationDerivedData alloc];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("derivedData"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[ATXPBUserNotificationDerivedData initFromJSON:](v51, "initFromJSON:", v53);
        -[ATXPBUserNotification setDerivedData:](v5, "setDerivedData:", v54);

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedDigestEngagementTracker"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        v57 = [ATXPBSharedDigestEngagementTrackingMetrics alloc];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedDigestEngagementTracker"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[ATXPBSharedDigestEngagementTrackingMetrics initFromJSON:](v57, "initFromJSON:", v59);
        -[ATXPBUserNotification setSharedEngagementTracker:](v5, "setSharedEngagementTracker:", v60);

      }
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  uint64_t urgency;
  __CFString *v4;
  void *v5;
  uint64_t attachmentType;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __CFString *v19;
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
  _QWORD v38[19];
  _QWORD v39[21];

  v39[19] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v36;
  v38[1] = CFSTR("uuid");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_uuid);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v35;
  v38[2] = CFSTR("title");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_title);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v34;
  v38[3] = CFSTR("subtitle");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_subtitle);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v33;
  v38[4] = CFSTR("body");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_body);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v32;
  v38[5] = CFSTR("badge");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_badge);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v30;
  v38[6] = CFSTR("userInfo");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_userInfo);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v29;
  v38[7] = CFSTR("bundleID");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_bundleID);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v28;
  v38[8] = CFSTR("threadID");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_threadID);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v27;
  v38[9] = CFSTR("categoryID");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_categoryID);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v26;
  v38[10] = CFSTR("contactIDs");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_contactIDs);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v25;
  v38[11] = CFSTR("rawIdentifiers");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_rawIdentifiers);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v24;
  v38[12] = CFSTR("isMessage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMessage);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v22;
  v38[13] = CFSTR("isGroupMessage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGroupMessage);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v20;
  v38[14] = CFSTR("urgency");
  urgency = self->_urgency;
  if (urgency >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_urgency);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4D5CC30[urgency];
  }
  v19 = v4;
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v5;
  v38[15] = CFSTR("attachmentType");
  attachmentType = self->_attachmentType;
  if (attachmentType >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_attachmentType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E4D5CC68[attachmentType];
  }
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v8;
  v38[16] = CFSTR("appSpecifiedScore");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPBUserNotification appSpecifiedScore](self, "appSpecifiedScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[16] = v11;
  v38[17] = CFSTR("derivedData");
  -[ATXPBUserNotificationDerivedData jsonRepresentation](self->_derivedData, "jsonRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[17] = v13;
  v38[18] = CFSTR("sharedDigestEngagementTracker");
  -[ATXPBUserNotification sharedEngagementTracker](self, "sharedEngagementTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[18] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 19);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
