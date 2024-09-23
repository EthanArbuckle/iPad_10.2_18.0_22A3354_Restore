@implementation BLTPBBulletin

- (BOOL)hasBulletinID
{
  return self->_bulletinID != 0;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (BOOL)hasSectionDisplayName
{
  return self->_sectionDisplayName != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasMessageTitle
{
  return self->_messageTitle != 0;
}

- (void)setDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasAttachment
{
  return self->_attachment != 0;
}

- (void)clearSupplementaryActions
{
  -[NSMutableArray removeAllObjects](self->_supplementaryActions, "removeAllObjects");
}

- (void)addSupplementaryActions:(id)a3
{
  id v4;
  NSMutableArray *supplementaryActions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supplementaryActions = self->_supplementaryActions;
  v8 = v4;
  if (!supplementaryActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_supplementaryActions;
    self->_supplementaryActions = v6;

    v4 = v8;
    supplementaryActions = self->_supplementaryActions;
  }
  -[NSMutableArray addObject:](supplementaryActions, "addObject:", v4);

}

- (unint64_t)supplementaryActionsCount
{
  return -[NSMutableArray count](self->_supplementaryActions, "count");
}

- (id)supplementaryActionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supplementaryActions, "objectAtIndex:", a3);
}

+ (Class)supplementaryActionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSnoozeAction
{
  return self->_snoozeAction != 0;
}

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
}

- (BOOL)hasPublisherBulletinID
{
  return self->_publisherBulletinID != 0;
}

- (BOOL)hasDismissAction
{
  return self->_dismissAction != 0;
}

- (void)setSectionSubtype:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sectionSubtype = a3;
}

- (void)setHasSectionSubtype:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSectionSubtype
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasSockPuppetAppBundleID
{
  return self->_sockPuppetAppBundleID != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setPublicationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_publicationDate = a3;
}

- (void)setHasPublicationDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPublicationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasTeamID
{
  return self->_teamID != 0;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasUniversalSectionID
{
  return self->_universalSectionID != 0;
}

- (BOOL)hasAlertSuppressionContexts
{
  return self->_alertSuppressionContexts != 0;
}

- (void)setSoundAlertType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_soundAlertType = a3;
}

- (void)setHasSoundAlertType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSoundAlertType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasSoundAccountIdentifier
{
  return self->_soundAccountIdentifier != 0;
}

- (BOOL)hasSoundToneIdentifier
{
  return self->_soundToneIdentifier != 0;
}

- (void)setAttachmentType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_attachmentType = a3;
}

- (void)setHasAttachmentType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAttachmentType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setContainsUpdatedAttachment:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_containsUpdatedAttachment = a3;
}

- (void)setHasContainsUpdatedAttachment:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasContainsUpdatedAttachment
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLoading:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_loading = a3;
}

- (void)setHasLoading:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasLoading
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTurnsOnDisplay:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_turnsOnDisplay = a3;
}

- (void)setHasTurnsOnDisplay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTurnsOnDisplay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)clearSubsectionIDs
{
  -[NSMutableArray removeAllObjects](self->_subsectionIDs, "removeAllObjects");
}

- (void)addSubsectionIDs:(id)a3
{
  id v4;
  NSMutableArray *subsectionIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subsectionIDs = self->_subsectionIDs;
  v8 = v4;
  if (!subsectionIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subsectionIDs;
    self->_subsectionIDs = v6;

    v4 = v8;
    subsectionIDs = self->_subsectionIDs;
  }
  -[NSMutableArray addObject:](subsectionIDs, "addObject:", v4);

}

- (unint64_t)subsectionIDsCount
{
  return -[NSMutableArray count](self->_subsectionIDs, "count");
}

- (id)subsectionIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subsectionIDs, "objectAtIndex:", a3);
}

+ (Class)subsectionIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDismissalID
{
  return self->_dismissalID != 0;
}

- (BOOL)hasAttachmentURL
{
  return self->_attachmentURL != 0;
}

- (void)clearPeopleIDs
{
  -[NSMutableArray removeAllObjects](self->_peopleIDs, "removeAllObjects");
}

- (void)addPeopleIDs:(id)a3
{
  id v4;
  NSMutableArray *peopleIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  peopleIDs = self->_peopleIDs;
  v8 = v4;
  if (!peopleIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_peopleIDs;
    self->_peopleIDs = v6;

    v4 = v8;
    peopleIDs = self->_peopleIDs;
  }
  -[NSMutableArray addObject:](peopleIDs, "addObject:", v4);

}

- (unint64_t)peopleIDsCount
{
  return -[NSMutableArray count](self->_peopleIDs, "count");
}

- (id)peopleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_peopleIDs, "objectAtIndex:", a3);
}

+ (Class)peopleIDsType
{
  return (Class)objc_opt_class();
}

- (void)setIgnoresQuietMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_ignoresQuietMode = a3;
}

- (void)setHasIgnoresQuietMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIgnoresQuietMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasCategoryID
{
  return self->_categoryID != 0;
}

- (BOOL)hasContextNulls
{
  return self->_contextNulls != 0;
}

- (BOOL)hasAlertSuppressionContextsNulls
{
  return self->_alertSuppressionContextsNulls != 0;
}

- (BOOL)hasThreadID
{
  return self->_threadID != 0;
}

- (BOOL)hasAttachmentID
{
  return self->_attachmentID != 0;
}

- (void)clearAdditionalAttachments
{
  -[NSMutableArray removeAllObjects](self->_additionalAttachments, "removeAllObjects");
}

- (void)addAdditionalAttachments:(id)a3
{
  id v4;
  NSMutableArray *additionalAttachments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  additionalAttachments = self->_additionalAttachments;
  v8 = v4;
  if (!additionalAttachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_additionalAttachments;
    self->_additionalAttachments = v6;

    v4 = v8;
    additionalAttachments = self->_additionalAttachments;
  }
  -[NSMutableArray addObject:](additionalAttachments, "addObject:", v4);

}

- (unint64_t)additionalAttachmentsCount
{
  return -[NSMutableArray count](self->_additionalAttachments, "count");
}

- (id)additionalAttachmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_additionalAttachments, "objectAtIndex:", a3);
}

+ (Class)additionalAttachmentsType
{
  return (Class)objc_opt_class();
}

- (void)setRequiredExpirationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_requiredExpirationDate = a3;
}

- (void)setHasRequiredExpirationDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasRequiredExpirationDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasReplyToken
{
  return self->_replyToken != 0;
}

- (void)setSoundMaximumDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_soundMaximumDuration = a3;
}

- (void)setHasSoundMaximumDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasSoundMaximumDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSoundShouldRepeat:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_soundShouldRepeat = a3;
}

- (void)setHasSoundShouldRepeat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSoundShouldRepeat
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSoundShouldIgnoreRingerSwitch:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_soundShouldIgnoreRingerSwitch = a3;
}

- (void)setHasSoundShouldIgnoreRingerSwitch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSoundShouldIgnoreRingerSwitch
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasCriticalIcon:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hasCriticalIcon = a3;
}

- (void)setHasHasCriticalIcon:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHasCriticalIcon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSoundAudioVolume:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_soundAudioVolume = a3;
}

- (void)setHasSoundAudioVolume:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasSoundAudioVolume
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPreemptsPresentedAlert:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_preemptsPresentedAlert = a3;
}

- (void)setHasPreemptsPresentedAlert:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPreemptsPresentedAlert
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSuppressDelayForForwardedBulletins:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_suppressDelayForForwardedBulletins = a3;
}

- (void)setHasSuppressDelayForForwardedBulletins:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSuppressDelayForForwardedBulletins
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setContainsUpdateIcon:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_containsUpdateIcon = a3;
}

- (void)setHasContainsUpdateIcon:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasContainsUpdateIcon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (void)setInterruptionLevel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_interruptionLevel = a3;
}

- (void)setHasInterruptionLevel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasInterruptionLevel
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasCommunicationContext
{
  return self->_communicationContext != 0;
}

- (BOOL)hasContentType
{
  return self->_contentType != 0;
}

- (BOOL)hasFilterCriteria
{
  return self->_filterCriteria != 0;
}

- (BOOL)hasFollowActivityAction
{
  return self->_followActivityAction != 0;
}

- (void)setHasSubordinateIcon:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hasSubordinateIcon = a3;
}

- (void)setHasHasSubordinateIcon:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($A2F97DD622F7BFDC59BCDE95D20A8287)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHasSubordinateIcon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (BOOL)hasThreadSummary
{
  return self->_threadSummary != 0;
}

- (BOOL)hasAttributedMessage
{
  return self->_attributedMessage != 0;
}

- (BOOL)hasEventBehavior
{
  return self->_eventBehavior != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBBulletin;
  -[BLTPBBulletin description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bulletinID;
  NSString *sectionID;
  NSString *sectionDisplayName;
  NSString *title;
  NSString *subtitle;
  NSString *messageTitle;
  void *v11;
  NSData *attachment;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  BLTPBAction *snoozeAction;
  void *v22;
  NSString *recordID;
  NSString *publisherBulletinID;
  BLTPBAction *dismissAction;
  void *v26;
  void *v27;
  NSString *sockPuppetAppBundleID;
  NSString *category;
  void *v30;
  void *v31;
  NSString *teamID;
  NSData *context;
  NSString *universalSectionID;
  NSData *alertSuppressionContexts;
  void *v36;
  NSString *soundAccountIdentifier;
  NSString *soundToneIdentifier;
  $A2F97DD622F7BFDC59BCDE95D20A8287 has;
  void *v40;
  NSMutableArray *subsectionIDs;
  NSString *dismissalID;
  NSString *attachmentURL;
  NSMutableArray *peopleIDs;
  void *v45;
  NSString *categoryID;
  NSData *contextNulls;
  NSData *alertSuppressionContextsNulls;
  NSString *threadID;
  NSString *attachmentID;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  NSString *replyToken;
  $A2F97DD622F7BFDC59BCDE95D20A8287 v60;
  void *v61;
  BLTPBSectionIcon *icon;
  void *v63;
  void *v64;
  NSString *header;
  void *v66;
  BLTPBCommunicationContext *communicationContext;
  void *v68;
  NSString *contentType;
  NSString *filterCriteria;
  BLTPBAction *followActivityAction;
  void *v72;
  void *v73;
  NSData *summary;
  NSData *threadSummary;
  NSData *attributedMessage;
  NSData *eventBehavior;
  id v78;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bulletinID = self->_bulletinID;
  if (bulletinID)
    objc_msgSend(v3, "setObject:forKey:", bulletinID, CFSTR("bulletinID"));
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v4, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  sectionDisplayName = self->_sectionDisplayName;
  if (sectionDisplayName)
    objc_msgSend(v4, "setObject:forKey:", sectionDisplayName, CFSTR("sectionDisplayName"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  messageTitle = self->_messageTitle;
  if (messageTitle)
    objc_msgSend(v4, "setObject:forKey:", messageTitle, CFSTR("messageTitle"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_date);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("date"));

  }
  attachment = self->_attachment;
  if (attachment)
    objc_msgSend(v4, "setObject:forKey:", attachment, CFSTR("attachment"));
  if (-[NSMutableArray count](self->_supplementaryActions, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_supplementaryActions, "count"));
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v14 = self->_supplementaryActions;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v94 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("supplementaryActions"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_feed);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("feed"));

  snoozeAction = self->_snoozeAction;
  if (snoozeAction)
  {
    -[BLTPBAction dictionaryRepresentation](snoozeAction, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("snoozeAction"));

  }
  recordID = self->_recordID;
  if (recordID)
    objc_msgSend(v4, "setObject:forKey:", recordID, CFSTR("recordID"));
  publisherBulletinID = self->_publisherBulletinID;
  if (publisherBulletinID)
    objc_msgSend(v4, "setObject:forKey:", publisherBulletinID, CFSTR("publisherBulletinID"));
  dismissAction = self->_dismissAction;
  if (dismissAction)
  {
    -[BLTPBAction dictionaryRepresentation](dismissAction, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("dismissAction"));

  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sectionSubtype);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("sectionSubtype"));

  }
  sockPuppetAppBundleID = self->_sockPuppetAppBundleID;
  if (sockPuppetAppBundleID)
    objc_msgSend(v4, "setObject:forKey:", sockPuppetAppBundleID, CFSTR("sockPuppetAppBundleID"));
  category = self->_category;
  if (category)
    objc_msgSend(v4, "setObject:forKey:", category, CFSTR("category"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_publicationDate);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("publicationDate"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_includesSound);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("includesSound"));

  teamID = self->_teamID;
  if (teamID)
    objc_msgSend(v4, "setObject:forKey:", teamID, CFSTR("teamID"));
  context = self->_context;
  if (context)
    objc_msgSend(v4, "setObject:forKey:", context, CFSTR("context"));
  universalSectionID = self->_universalSectionID;
  if (universalSectionID)
    objc_msgSend(v4, "setObject:forKey:", universalSectionID, CFSTR("universalSectionID"));
  alertSuppressionContexts = self->_alertSuppressionContexts;
  if (alertSuppressionContexts)
    objc_msgSend(v4, "setObject:forKey:", alertSuppressionContexts, CFSTR("alertSuppressionContexts"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_soundAlertType);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("soundAlertType"));

  }
  soundAccountIdentifier = self->_soundAccountIdentifier;
  if (soundAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", soundAccountIdentifier, CFSTR("soundAccountIdentifier"));
  soundToneIdentifier = self->_soundToneIdentifier;
  if (soundToneIdentifier)
    objc_msgSend(v4, "setObject:forKey:", soundToneIdentifier, CFSTR("soundToneIdentifier"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_attachmentType);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("attachmentType"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_58:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_59;
      goto LABEL_131;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_58;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_containsUpdatedAttachment);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("containsUpdatedAttachment"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_loading);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("loading"));

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_60:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_turnsOnDisplay);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("turnsOnDisplay"));

  }
LABEL_61:
  subsectionIDs = self->_subsectionIDs;
  if (subsectionIDs)
    objc_msgSend(v4, "setObject:forKey:", subsectionIDs, CFSTR("subsectionIDs"));
  dismissalID = self->_dismissalID;
  if (dismissalID)
    objc_msgSend(v4, "setObject:forKey:", dismissalID, CFSTR("dismissalID"));
  attachmentURL = self->_attachmentURL;
  if (attachmentURL)
    objc_msgSend(v4, "setObject:forKey:", attachmentURL, CFSTR("attachmentURL"));
  peopleIDs = self->_peopleIDs;
  if (peopleIDs)
    objc_msgSend(v4, "setObject:forKey:", peopleIDs, CFSTR("peopleIDs"));
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ignoresQuietMode);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("ignoresQuietMode"));

  }
  categoryID = self->_categoryID;
  if (categoryID)
    objc_msgSend(v4, "setObject:forKey:", categoryID, CFSTR("categoryID"));
  contextNulls = self->_contextNulls;
  if (contextNulls)
    objc_msgSend(v4, "setObject:forKey:", contextNulls, CFSTR("contextNulls"));
  alertSuppressionContextsNulls = self->_alertSuppressionContextsNulls;
  if (alertSuppressionContextsNulls)
    objc_msgSend(v4, "setObject:forKey:", alertSuppressionContextsNulls, CFSTR("alertSuppressionContextsNulls"));
  threadID = self->_threadID;
  if (threadID)
    objc_msgSend(v4, "setObject:forKey:", threadID, CFSTR("threadID"));
  attachmentID = self->_attachmentID;
  if (attachmentID)
    objc_msgSend(v4, "setObject:forKey:", attachmentID, CFSTR("attachmentID"));
  if (-[NSMutableArray count](self->_additionalAttachments, "count"))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_additionalAttachments, "count"));
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v52 = self->_additionalAttachments;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v54; ++j)
        {
          if (*(_QWORD *)v90 != v55)
            objc_enumerationMutation(v52);
          objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v89);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v57);

        }
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
      }
      while (v54);
    }

    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("additionalAttachments"));
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_requiredExpirationDate);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("requiredExpirationDate"));

  }
  replyToken = self->_replyToken;
  if (replyToken)
    objc_msgSend(v4, "setObject:forKey:", replyToken, CFSTR("replyToken"));
  v60 = self->_has;
  if ((*(_BYTE *)&v60 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_soundMaximumDuration);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("soundMaximumDuration"));

    v60 = self->_has;
    if ((*(_DWORD *)&v60 & 0x20000) == 0)
    {
LABEL_96:
      if ((*(_DWORD *)&v60 & 0x10000) == 0)
        goto LABEL_97;
      goto LABEL_135;
    }
  }
  else if ((*(_DWORD *)&v60 & 0x20000) == 0)
  {
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_soundShouldRepeat, (_QWORD)v89);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("soundShouldRepeat"));

  v60 = self->_has;
  if ((*(_DWORD *)&v60 & 0x10000) == 0)
  {
LABEL_97:
    if ((*(_WORD *)&v60 & 0x800) == 0)
      goto LABEL_98;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_soundShouldIgnoreRingerSwitch, (_QWORD)v89);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("soundShouldIgnoreRingerSwitch"));

  v60 = self->_has;
  if ((*(_WORD *)&v60 & 0x800) == 0)
  {
LABEL_98:
    if ((*(_BYTE *)&v60 & 8) == 0)
      goto LABEL_99;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasCriticalIcon, (_QWORD)v89);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("hasCriticalIcon"));

  v60 = self->_has;
  if ((*(_BYTE *)&v60 & 8) == 0)
  {
LABEL_99:
    if ((*(_WORD *)&v60 & 0x8000) == 0)
      goto LABEL_100;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_soundAudioVolume, (_QWORD)v89);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("soundAudioVolume"));

  v60 = self->_has;
  if ((*(_WORD *)&v60 & 0x8000) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&v60 & 0x40000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_preemptsPresentedAlert, (_QWORD)v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("preemptsPresentedAlert"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_101:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_suppressDelayForForwardedBulletins, (_QWORD)v89);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("suppressDelayForForwardedBulletins"));

  }
LABEL_102:
  icon = self->_icon;
  if (icon)
  {
    -[BLTPBSectionIcon dictionaryRepresentation](icon, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("icon"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_containsUpdateIcon);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("containsUpdateIcon"));

  }
  header = self->_header;
  if (header)
    objc_msgSend(v4, "setObject:forKey:", header, CFSTR("header"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_interruptionLevel);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("interruptionLevel"));

  }
  communicationContext = self->_communicationContext;
  if (communicationContext)
  {
    -[BLTPBCommunicationContext dictionaryRepresentation](communicationContext, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("communicationContext"));

  }
  contentType = self->_contentType;
  if (contentType)
    objc_msgSend(v4, "setObject:forKey:", contentType, CFSTR("contentType"));
  filterCriteria = self->_filterCriteria;
  if (filterCriteria)
    objc_msgSend(v4, "setObject:forKey:", filterCriteria, CFSTR("filterCriteria"));
  followActivityAction = self->_followActivityAction;
  if (followActivityAction)
  {
    -[BLTPBAction dictionaryRepresentation](followActivityAction, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("followActivityAction"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasSubordinateIcon);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("hasSubordinateIcon"));

  }
  summary = self->_summary;
  if (summary)
    objc_msgSend(v4, "setObject:forKey:", summary, CFSTR("summary"));
  threadSummary = self->_threadSummary;
  if (threadSummary)
    objc_msgSend(v4, "setObject:forKey:", threadSummary, CFSTR("threadSummary"));
  attributedMessage = self->_attributedMessage;
  if (attributedMessage)
    objc_msgSend(v4, "setObject:forKey:", attributedMessage, CFSTR("attributedMessage"));
  eventBehavior = self->_eventBehavior;
  if (eventBehavior)
    objc_msgSend(v4, "setObject:forKey:", eventBehavior, CFSTR("eventBehavior"));
  v78 = v4;

  return v78;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBBulletinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $A2F97DD622F7BFDC59BCDE95D20A8287 has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  $A2F97DD622F7BFDC59BCDE95D20A8287 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_bulletinID)
    PBDataWriterWriteStringField();
  if (self->_sectionID)
    PBDataWriterWriteStringField();
  if (self->_sectionDisplayName)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_messageTitle)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_attachment)
    PBDataWriterWriteDataField();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_supplementaryActions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
  if (self->_snoozeAction)
    PBDataWriterWriteSubmessage();
  if (self->_recordID)
    PBDataWriterWriteStringField();
  if (self->_publisherBulletinID)
    PBDataWriterWriteStringField();
  if (self->_dismissAction)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_sockPuppetAppBundleID)
    PBDataWriterWriteStringField();
  if (self->_category)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteBOOLField();
  if (self->_teamID)
    PBDataWriterWriteStringField();
  if (self->_context)
    PBDataWriterWriteDataField();
  if (self->_universalSectionID)
    PBDataWriterWriteStringField();
  if (self->_alertSuppressionContexts)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_soundAccountIdentifier)
    PBDataWriterWriteStringField();
  if (self->_soundToneIdentifier)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_57;
      goto LABEL_137;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_56;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
LABEL_137:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
LABEL_58:
    PBDataWriterWriteBOOLField();
LABEL_59:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = self->_subsectionIDs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v13);
  }

  if (self->_dismissalID)
    PBDataWriterWriteStringField();
  if (self->_attachmentURL)
    PBDataWriterWriteStringField();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = self->_peopleIDs;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v18);
  }

  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_categoryID)
    PBDataWriterWriteStringField();
  if (self->_contextNulls)
    PBDataWriterWriteDataField();
  if (self->_alertSuppressionContextsNulls)
    PBDataWriterWriteDataField();
  if (self->_threadID)
    PBDataWriterWriteStringField();
  if (self->_attachmentID)
    PBDataWriterWriteStringField();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = self->_additionalAttachments;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v23);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_replyToken)
    PBDataWriterWriteStringField();
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v26 = self->_has;
    if ((*(_DWORD *)&v26 & 0x20000) == 0)
    {
LABEL_102:
      if ((*(_DWORD *)&v26 & 0x10000) == 0)
        goto LABEL_103;
      goto LABEL_141;
    }
  }
  else if ((*(_DWORD *)&v26 & 0x20000) == 0)
  {
    goto LABEL_102;
  }
  PBDataWriterWriteBOOLField();
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x10000) == 0)
  {
LABEL_103:
    if ((*(_WORD *)&v26 & 0x800) == 0)
      goto LABEL_104;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x800) == 0)
  {
LABEL_104:
    if ((*(_BYTE *)&v26 & 8) == 0)
      goto LABEL_105;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteBOOLField();
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 8) == 0)
  {
LABEL_105:
    if ((*(_WORD *)&v26 & 0x8000) == 0)
      goto LABEL_106;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteDoubleField();
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x8000) == 0)
  {
LABEL_106:
    if ((*(_DWORD *)&v26 & 0x40000) == 0)
      goto LABEL_108;
    goto LABEL_107;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
LABEL_107:
    PBDataWriterWriteBOOLField();
LABEL_108:
  if (self->_icon)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_header)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_communicationContext)
    PBDataWriterWriteSubmessage();
  if (self->_contentType)
    PBDataWriterWriteStringField();
  if (self->_filterCriteria)
    PBDataWriterWriteStringField();
  if (self->_followActivityAction)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_summary)
    PBDataWriterWriteDataField();
  if (self->_threadSummary)
    PBDataWriterWriteDataField();
  if (self->_attributedMessage)
    PBDataWriterWriteDataField();
  if (self->_eventBehavior)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _DWORD *v9;
  $A2F97DD622F7BFDC59BCDE95D20A8287 has;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  _QWORD *v23;
  $A2F97DD622F7BFDC59BCDE95D20A8287 v24;
  id v25;

  v4 = a3;
  v25 = v4;
  if (self->_bulletinID)
  {
    objc_msgSend(v4, "setBulletinID:");
    v4 = v25;
  }
  if (self->_sectionID)
  {
    objc_msgSend(v25, "setSectionID:");
    v4 = v25;
  }
  if (self->_sectionDisplayName)
  {
    objc_msgSend(v25, "setSectionDisplayName:");
    v4 = v25;
  }
  if (self->_title)
  {
    objc_msgSend(v25, "setTitle:");
    v4 = v25;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v25, "setSubtitle:");
    v4 = v25;
  }
  if (self->_messageTitle)
  {
    objc_msgSend(v25, "setMessageTitle:");
    v4 = v25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_date;
    *((_DWORD *)v4 + 107) |= 1u;
  }
  if (self->_attachment)
    objc_msgSend(v25, "setAttachment:");
  if (-[BLTPBBulletin supplementaryActionsCount](self, "supplementaryActionsCount"))
  {
    objc_msgSend(v25, "clearSupplementaryActions");
    v5 = -[BLTPBBulletin supplementaryActionsCount](self, "supplementaryActionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BLTPBBulletin supplementaryActionsAtIndex:](self, "supplementaryActionsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSupplementaryActions:", v8);

      }
    }
  }
  v9 = v25;
  *((_DWORD *)v25 + 48) = self->_feed;
  if (self->_snoozeAction)
  {
    objc_msgSend(v25, "setSnoozeAction:");
    v9 = v25;
  }
  if (self->_recordID)
  {
    objc_msgSend(v25, "setRecordID:");
    v9 = v25;
  }
  if (self->_publisherBulletinID)
  {
    objc_msgSend(v25, "setPublisherBulletinID:");
    v9 = v25;
  }
  if (self->_dismissAction)
  {
    objc_msgSend(v25, "setDismissAction:");
    v9 = v25;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    v9[74] = self->_sectionSubtype;
    v9[107] |= 0x80u;
  }
  if (self->_sockPuppetAppBundleID)
  {
    objc_msgSend(v25, "setSockPuppetAppBundleID:");
    v9 = v25;
  }
  if (self->_category)
  {
    objc_msgSend(v25, "setCategory:");
    v9 = v25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v9 + 2) = *(_QWORD *)&self->_publicationDate;
    v9[107] |= 2u;
  }
  *((_BYTE *)v9 + 421) = self->_includesSound;
  if (self->_teamID)
  {
    objc_msgSend(v25, "setTeamID:");
    v9 = v25;
  }
  if (self->_context)
  {
    objc_msgSend(v25, "setContext:");
    v9 = v25;
  }
  if (self->_universalSectionID)
  {
    objc_msgSend(v25, "setUniversalSectionID:");
    v9 = v25;
  }
  if (self->_alertSuppressionContexts)
  {
    objc_msgSend(v25, "setAlertSuppressionContexts:");
    v9 = v25;
  }
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    v9[82] = self->_soundAlertType;
    v9[107] |= 0x100u;
  }
  if (self->_soundAccountIdentifier)
  {
    objc_msgSend(v25, "setSoundAccountIdentifier:");
    v9 = v25;
  }
  if (self->_soundToneIdentifier)
  {
    objc_msgSend(v25, "setSoundToneIdentifier:");
    v9 = v25;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v9[22] = self->_attachmentType;
    v9[107] |= 0x20u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_53:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_54;
LABEL_125:
      *((_BYTE *)v9 + 422) = self->_loading;
      v9[107] |= 0x4000u;
      if ((*(_DWORD *)&self->_has & 0x80000) == 0)
        goto LABEL_56;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_53;
  }
  *((_BYTE *)v9 + 417) = self->_containsUpdatedAttachment;
  v9[107] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
    goto LABEL_125;
LABEL_54:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_55:
    *((_BYTE *)v9 + 427) = self->_turnsOnDisplay;
    v9[107] |= 0x80000u;
  }
LABEL_56:
  if (-[BLTPBBulletin subsectionIDsCount](self, "subsectionIDsCount"))
  {
    objc_msgSend(v25, "clearSubsectionIDs");
    v11 = -[BLTPBBulletin subsectionIDsCount](self, "subsectionIDsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[BLTPBBulletin subsectionIDsAtIndex:](self, "subsectionIDsAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSubsectionIDs:", v14);

      }
    }
  }
  if (self->_dismissalID)
    objc_msgSend(v25, "setDismissalID:");
  if (self->_attachmentURL)
    objc_msgSend(v25, "setAttachmentURL:");
  if (-[BLTPBBulletin peopleIDsCount](self, "peopleIDsCount"))
  {
    objc_msgSend(v25, "clearPeopleIDs");
    v15 = -[BLTPBBulletin peopleIDsCount](self, "peopleIDsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[BLTPBBulletin peopleIDsAtIndex:](self, "peopleIDsAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addPeopleIDs:", v18);

      }
    }
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *((_BYTE *)v25 + 420) = self->_ignoresQuietMode;
    *((_DWORD *)v25 + 107) |= 0x2000u;
  }
  if (self->_categoryID)
    objc_msgSend(v25, "setCategoryID:");
  if (self->_contextNulls)
    objc_msgSend(v25, "setContextNulls:");
  if (self->_alertSuppressionContextsNulls)
    objc_msgSend(v25, "setAlertSuppressionContextsNulls:");
  if (self->_threadID)
    objc_msgSend(v25, "setThreadID:");
  if (self->_attachmentID)
    objc_msgSend(v25, "setAttachmentID:");
  if (-[BLTPBBulletin additionalAttachmentsCount](self, "additionalAttachmentsCount"))
  {
    objc_msgSend(v25, "clearAdditionalAttachments");
    v19 = -[BLTPBBulletin additionalAttachmentsCount](self, "additionalAttachmentsCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        -[BLTPBBulletin additionalAttachmentsAtIndex:](self, "additionalAttachmentsAtIndex:", m);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addAdditionalAttachments:", v22);

      }
    }
  }
  v23 = v25;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v25 + 3) = *(_QWORD *)&self->_requiredExpirationDate;
    *((_DWORD *)v25 + 107) |= 4u;
  }
  if (self->_replyToken)
  {
    objc_msgSend(v25, "setReplyToken:");
    v23 = v25;
  }
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 0x10) != 0)
  {
    v23[5] = *(_QWORD *)&self->_soundMaximumDuration;
    *((_DWORD *)v23 + 107) |= 0x10u;
    v24 = self->_has;
    if ((*(_DWORD *)&v24 & 0x20000) == 0)
    {
LABEL_90:
      if ((*(_DWORD *)&v24 & 0x10000) == 0)
        goto LABEL_91;
      goto LABEL_129;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x20000) == 0)
  {
    goto LABEL_90;
  }
  *((_BYTE *)v23 + 425) = self->_soundShouldRepeat;
  *((_DWORD *)v23 + 107) |= 0x20000u;
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x10000) == 0)
  {
LABEL_91:
    if ((*(_WORD *)&v24 & 0x800) == 0)
      goto LABEL_92;
    goto LABEL_130;
  }
LABEL_129:
  *((_BYTE *)v23 + 424) = self->_soundShouldIgnoreRingerSwitch;
  *((_DWORD *)v23 + 107) |= 0x10000u;
  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x800) == 0)
  {
LABEL_92:
    if ((*(_BYTE *)&v24 & 8) == 0)
      goto LABEL_93;
    goto LABEL_131;
  }
LABEL_130:
  *((_BYTE *)v23 + 418) = self->_hasCriticalIcon;
  *((_DWORD *)v23 + 107) |= 0x800u;
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 8) == 0)
  {
LABEL_93:
    if ((*(_WORD *)&v24 & 0x8000) == 0)
      goto LABEL_94;
    goto LABEL_132;
  }
LABEL_131:
  v23[4] = *(_QWORD *)&self->_soundAudioVolume;
  *((_DWORD *)v23 + 107) |= 8u;
  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x8000) == 0)
  {
LABEL_94:
    if ((*(_DWORD *)&v24 & 0x40000) == 0)
      goto LABEL_96;
    goto LABEL_95;
  }
LABEL_132:
  *((_BYTE *)v23 + 423) = self->_preemptsPresentedAlert;
  *((_DWORD *)v23 + 107) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_95:
    *((_BYTE *)v23 + 426) = self->_suppressDelayForForwardedBulletins;
    *((_DWORD *)v23 + 107) |= 0x40000u;
  }
LABEL_96:
  if (self->_icon)
  {
    objc_msgSend(v25, "setIcon:");
    v23 = v25;
  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    *((_BYTE *)v23 + 416) = self->_containsUpdateIcon;
    *((_DWORD *)v23 + 107) |= 0x200u;
  }
  if (self->_header)
  {
    objc_msgSend(v25, "setHeader:");
    v23 = v25;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v23 + 58) = self->_interruptionLevel;
    *((_DWORD *)v23 + 107) |= 0x40u;
  }
  if (self->_communicationContext)
  {
    objc_msgSend(v25, "setCommunicationContext:");
    v23 = v25;
  }
  if (self->_contentType)
  {
    objc_msgSend(v25, "setContentType:");
    v23 = v25;
  }
  if (self->_filterCriteria)
  {
    objc_msgSend(v25, "setFilterCriteria:");
    v23 = v25;
  }
  if (self->_followActivityAction)
  {
    objc_msgSend(v25, "setFollowActivityAction:");
    v23 = v25;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *((_BYTE *)v23 + 419) = self->_hasSubordinateIcon;
    *((_DWORD *)v23 + 107) |= 0x1000u;
  }
  if (self->_summary)
  {
    objc_msgSend(v25, "setSummary:");
    v23 = v25;
  }
  if (self->_threadSummary)
  {
    objc_msgSend(v25, "setThreadSummary:");
    v23 = v25;
  }
  if (self->_attributedMessage)
  {
    objc_msgSend(v25, "setAttributedMessage:");
    v23 = v25;
  }
  if (self->_eventBehavior)
  {
    objc_msgSend(v25, "setEventBehavior:");
    v23 = v25;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  $A2F97DD622F7BFDC59BCDE95D20A8287 has;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  NSMutableArray *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  $A2F97DD622F7BFDC59BCDE95D20A8287 v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bulletinID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  v8 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v8;

  v10 = -[NSString copyWithZone:](self->_sectionDisplayName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v10;

  v12 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v12;

  v14 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v14;

  v16 = -[NSString copyWithZone:](self->_messageTitle, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_DWORD *)(v5 + 428) |= 1u;
  }
  v18 = -[NSData copyWithZone:](self->_attachment, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v20 = self->_supplementaryActions;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v119, v126, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v120;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v120 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSupplementaryActions:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v119, v126, 16);
    }
    while (v22);
  }

  *(_DWORD *)(v5 + 192) = self->_feed;
  v26 = -[BLTPBAction copyWithZone:](self->_snoozeAction, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v26;

  v28 = -[NSString copyWithZone:](self->_recordID, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v28;

  v30 = -[NSString copyWithZone:](self->_publisherBulletinID, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v30;

  v32 = -[BLTPBAction copyWithZone:](self->_dismissAction, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v32;

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_sectionSubtype;
    *(_DWORD *)(v5 + 428) |= 0x80u;
  }
  v34 = -[NSString copyWithZone:](self->_sockPuppetAppBundleID, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v34;

  v36 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v36;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_publicationDate;
    *(_DWORD *)(v5 + 428) |= 2u;
  }
  *(_BYTE *)(v5 + 421) = self->_includesSound;
  v38 = -[NSString copyWithZone:](self->_teamID, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v38;

  v40 = -[NSData copyWithZone:](self->_context, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v40;

  v42 = -[NSString copyWithZone:](self->_universalSectionID, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v42;

  v44 = -[NSData copyWithZone:](self->_alertSuppressionContexts, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v44;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_DWORD *)(v5 + 328) = self->_soundAlertType;
    *(_DWORD *)(v5 + 428) |= 0x100u;
  }
  v46 = -[NSString copyWithZone:](self->_soundAccountIdentifier, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v46;

  v48 = -[NSString copyWithZone:](self->_soundToneIdentifier, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v48;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_attachmentType;
    *(_DWORD *)(v5 + 428) |= 0x20u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_19;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_18;
  }
  *(_BYTE *)(v5 + 417) = self->_containsUpdatedAttachment;
  *(_DWORD *)(v5 + 428) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_63:
  *(_BYTE *)(v5 + 422) = self->_loading;
  *(_DWORD *)(v5 + 428) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_20:
    *(_BYTE *)(v5 + 427) = self->_turnsOnDisplay;
    *(_DWORD *)(v5 + 428) |= 0x80000u;
  }
LABEL_21:
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v51 = self->_subsectionIDs;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v115, v125, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v116;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v116 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * v55), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSubsectionIDs:", v56);

        ++v55;
      }
      while (v53 != v55);
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v115, v125, 16);
    }
    while (v53);
  }

  v57 = -[NSString copyWithZone:](self->_dismissalID, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v57;

  v59 = -[NSString copyWithZone:](self->_attachmentURL, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v59;

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v61 = self->_peopleIDs;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v112;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v112 != v64)
          objc_enumerationMutation(v61);
        v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v65), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPeopleIDs:", v66);

        ++v65;
      }
      while (v63 != v65);
      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
    }
    while (v63);
  }

  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 420) = self->_ignoresQuietMode;
    *(_DWORD *)(v5 + 428) |= 0x2000u;
  }
  v67 = -[NSString copyWithZone:](self->_categoryID, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v67;

  v69 = -[NSData copyWithZone:](self->_contextNulls, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v69;

  v71 = -[NSData copyWithZone:](self->_alertSuppressionContextsNulls, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v71;

  v73 = -[NSString copyWithZone:](self->_threadID, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v73;

  v75 = -[NSString copyWithZone:](self->_attachmentID, "copyWithZone:", a3);
  v76 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v75;

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v77 = self->_additionalAttachments;
  v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v108;
    do
    {
      v81 = 0;
      do
      {
        if (*(_QWORD *)v108 != v80)
          objc_enumerationMutation(v77);
        v82 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v81), "copyWithZone:", a3, (_QWORD)v107);
        objc_msgSend((id)v5, "addAdditionalAttachments:", v82);

        ++v81;
      }
      while (v79 != v81);
      v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
    }
    while (v79);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_requiredExpirationDate;
    *(_DWORD *)(v5 + 428) |= 4u;
  }
  v83 = -[NSString copyWithZone:](self->_replyToken, "copyWithZone:", a3, (_QWORD)v107);
  v84 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v83;

  v85 = self->_has;
  if ((*(_BYTE *)&v85 & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_soundMaximumDuration;
    *(_DWORD *)(v5 + 428) |= 0x10u;
    v85 = self->_has;
    if ((*(_DWORD *)&v85 & 0x20000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v85 & 0x10000) == 0)
        goto LABEL_49;
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v85 & 0x20000) == 0)
  {
    goto LABEL_48;
  }
  *(_BYTE *)(v5 + 425) = self->_soundShouldRepeat;
  *(_DWORD *)(v5 + 428) |= 0x20000u;
  v85 = self->_has;
  if ((*(_DWORD *)&v85 & 0x10000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v85 & 0x800) == 0)
      goto LABEL_50;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v5 + 424) = self->_soundShouldIgnoreRingerSwitch;
  *(_DWORD *)(v5 + 428) |= 0x10000u;
  v85 = self->_has;
  if ((*(_WORD *)&v85 & 0x800) == 0)
  {
LABEL_50:
    if ((*(_BYTE *)&v85 & 8) == 0)
      goto LABEL_51;
    goto LABEL_69;
  }
LABEL_68:
  *(_BYTE *)(v5 + 418) = self->_hasCriticalIcon;
  *(_DWORD *)(v5 + 428) |= 0x800u;
  v85 = self->_has;
  if ((*(_BYTE *)&v85 & 8) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v85 & 0x8000) == 0)
      goto LABEL_52;
    goto LABEL_70;
  }
LABEL_69:
  *(double *)(v5 + 32) = self->_soundAudioVolume;
  *(_DWORD *)(v5 + 428) |= 8u;
  v85 = self->_has;
  if ((*(_WORD *)&v85 & 0x8000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v85 & 0x40000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_70:
  *(_BYTE *)(v5 + 423) = self->_preemptsPresentedAlert;
  *(_DWORD *)(v5 + 428) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_53:
    *(_BYTE *)(v5 + 426) = self->_suppressDelayForForwardedBulletins;
    *(_DWORD *)(v5 + 428) |= 0x40000u;
  }
LABEL_54:
  v86 = -[BLTPBSectionIcon copyWithZone:](self->_icon, "copyWithZone:", a3);
  v87 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v86;

  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    *(_BYTE *)(v5 + 416) = self->_containsUpdateIcon;
    *(_DWORD *)(v5 + 428) |= 0x200u;
  }
  v88 = -[NSString copyWithZone:](self->_header, "copyWithZone:", a3);
  v89 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v88;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_interruptionLevel;
    *(_DWORD *)(v5 + 428) |= 0x40u;
  }
  v90 = -[BLTPBCommunicationContext copyWithZone:](self->_communicationContext, "copyWithZone:", a3);
  v91 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v90;

  v92 = -[NSString copyWithZone:](self->_contentType, "copyWithZone:", a3);
  v93 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v92;

  v94 = -[NSString copyWithZone:](self->_filterCriteria, "copyWithZone:", a3);
  v95 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v94;

  v96 = -[BLTPBAction copyWithZone:](self->_followActivityAction, "copyWithZone:", a3);
  v97 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v96;

  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 419) = self->_hasSubordinateIcon;
    *(_DWORD *)(v5 + 428) |= 0x1000u;
  }
  v98 = -[NSData copyWithZone:](self->_summary, "copyWithZone:", a3);
  v99 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v98;

  v100 = -[NSData copyWithZone:](self->_threadSummary, "copyWithZone:", a3);
  v101 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v100;

  v102 = -[NSData copyWithZone:](self->_attributedMessage, "copyWithZone:", a3);
  v103 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v102;

  v104 = -[NSData copyWithZone:](self->_eventBehavior, "copyWithZone:", a3);
  v105 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v104;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bulletinID;
  NSString *sectionID;
  NSString *sectionDisplayName;
  NSString *title;
  NSString *subtitle;
  NSString *messageTitle;
  int v11;
  NSData *attachment;
  NSMutableArray *supplementaryActions;
  BLTPBAction *snoozeAction;
  NSString *recordID;
  NSString *publisherBulletinID;
  BLTPBAction *dismissAction;
  int v18;
  NSString *sockPuppetAppBundleID;
  NSString *category;
  int v21;
  NSString *teamID;
  NSData *context;
  NSString *universalSectionID;
  NSData *alertSuppressionContexts;
  int v26;
  NSString *soundAccountIdentifier;
  NSString *soundToneIdentifier;
  $A2F97DD622F7BFDC59BCDE95D20A8287 has;
  int v30;
  NSMutableArray *subsectionIDs;
  NSString *dismissalID;
  NSString *attachmentURL;
  NSMutableArray *peopleIDs;
  int v35;
  NSString *categoryID;
  NSData *contextNulls;
  NSData *alertSuppressionContextsNulls;
  NSString *threadID;
  NSString *attachmentID;
  NSMutableArray *additionalAttachments;
  $A2F97DD622F7BFDC59BCDE95D20A8287 v42;
  int v43;
  NSString *replyToken;
  int v45;
  BLTPBSectionIcon *icon;
  int v47;
  NSString *header;
  int v49;
  BLTPBCommunicationContext *communicationContext;
  NSString *contentType;
  NSString *filterCriteria;
  BLTPBAction *followActivityAction;
  int v54;
  NSData *summary;
  NSData *threadSummary;
  NSData *attributedMessage;
  NSData *eventBehavior;
  char v59;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_225;
  bulletinID = self->_bulletinID;
  if ((unint64_t)bulletinID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](bulletinID, "isEqual:"))
      goto LABEL_225;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:"))
      goto LABEL_225;
  }
  sectionDisplayName = self->_sectionDisplayName;
  if ((unint64_t)sectionDisplayName | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](sectionDisplayName, "isEqual:"))
      goto LABEL_225;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 50))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_225;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_225;
  }
  messageTitle = self->_messageTitle;
  if ((unint64_t)messageTitle | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](messageTitle, "isEqual:"))
      goto LABEL_225;
  }
  v11 = *((_DWORD *)v4 + 107);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_225;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_225;
  }
  attachment = self->_attachment;
  if ((unint64_t)attachment | *((_QWORD *)v4 + 9) && !-[NSData isEqual:](attachment, "isEqual:"))
    goto LABEL_225;
  supplementaryActions = self->_supplementaryActions;
  if ((unint64_t)supplementaryActions | *((_QWORD *)v4 + 46))
  {
    if (!-[NSMutableArray isEqual:](supplementaryActions, "isEqual:"))
      goto LABEL_225;
  }
  if (self->_feed != *((_DWORD *)v4 + 48))
    goto LABEL_225;
  snoozeAction = self->_snoozeAction;
  if ((unint64_t)snoozeAction | *((_QWORD *)v4 + 38))
  {
    if (!-[BLTPBAction isEqual:](snoozeAction, "isEqual:"))
      goto LABEL_225;
  }
  recordID = self->_recordID;
  if ((unint64_t)recordID | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](recordID, "isEqual:"))
      goto LABEL_225;
  }
  publisherBulletinID = self->_publisherBulletinID;
  if ((unint64_t)publisherBulletinID | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](publisherBulletinID, "isEqual:"))
      goto LABEL_225;
  }
  dismissAction = self->_dismissAction;
  if ((unint64_t)dismissAction | *((_QWORD *)v4 + 21))
  {
    if (!-[BLTPBAction isEqual:](dismissAction, "isEqual:"))
      goto LABEL_225;
  }
  v18 = *((_DWORD *)v4 + 107);
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_sectionSubtype != *((_DWORD *)v4 + 74))
      goto LABEL_225;
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_225;
  }
  sockPuppetAppBundleID = self->_sockPuppetAppBundleID;
  if ((unint64_t)sockPuppetAppBundleID | *((_QWORD *)v4 + 39)
    && !-[NSString isEqual:](sockPuppetAppBundleID, "isEqual:"))
  {
    goto LABEL_225;
  }
  category = self->_category;
  if ((unint64_t)category | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](category, "isEqual:"))
      goto LABEL_225;
  }
  v21 = *((_DWORD *)v4 + 107);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_publicationDate != *((double *)v4 + 2))
      goto LABEL_225;
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_225;
  }
  if (self->_includesSound)
  {
    if (!*((_BYTE *)v4 + 421))
      goto LABEL_225;
  }
  else if (*((_BYTE *)v4 + 421))
  {
    goto LABEL_225;
  }
  teamID = self->_teamID;
  if ((unint64_t)teamID | *((_QWORD *)v4 + 47) && !-[NSString isEqual:](teamID, "isEqual:"))
    goto LABEL_225;
  context = self->_context;
  if ((unint64_t)context | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](context, "isEqual:"))
      goto LABEL_225;
  }
  universalSectionID = self->_universalSectionID;
  if ((unint64_t)universalSectionID | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](universalSectionID, "isEqual:"))
      goto LABEL_225;
  }
  alertSuppressionContexts = self->_alertSuppressionContexts;
  if ((unint64_t)alertSuppressionContexts | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](alertSuppressionContexts, "isEqual:"))
      goto LABEL_225;
  }
  v26 = *((_DWORD *)v4 + 107);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    if ((v26 & 0x100) == 0 || self->_soundAlertType != *((_DWORD *)v4 + 82))
      goto LABEL_225;
  }
  else if ((v26 & 0x100) != 0)
  {
    goto LABEL_225;
  }
  soundAccountIdentifier = self->_soundAccountIdentifier;
  if ((unint64_t)soundAccountIdentifier | *((_QWORD *)v4 + 40)
    && !-[NSString isEqual:](soundAccountIdentifier, "isEqual:"))
  {
    goto LABEL_225;
  }
  soundToneIdentifier = self->_soundToneIdentifier;
  if ((unint64_t)soundToneIdentifier | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](soundToneIdentifier, "isEqual:"))
      goto LABEL_225;
  }
  has = self->_has;
  v30 = *((_DWORD *)v4 + 107);
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v30 & 0x20) == 0 || self->_attachmentType != *((_DWORD *)v4 + 22))
      goto LABEL_225;
  }
  else if ((v30 & 0x20) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v30 & 0x400) == 0)
      goto LABEL_225;
    if (self->_containsUpdatedAttachment)
    {
      if (!*((_BYTE *)v4 + 417))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 417))
    {
      goto LABEL_225;
    }
  }
  else if ((v30 & 0x400) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v30 & 0x4000) == 0)
      goto LABEL_225;
    if (self->_loading)
    {
      if (!*((_BYTE *)v4 + 422))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 422))
    {
      goto LABEL_225;
    }
  }
  else if ((v30 & 0x4000) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v30 & 0x80000) == 0)
      goto LABEL_225;
    if (self->_turnsOnDisplay)
    {
      if (!*((_BYTE *)v4 + 427))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 427))
    {
      goto LABEL_225;
    }
  }
  else if ((v30 & 0x80000) != 0)
  {
    goto LABEL_225;
  }
  subsectionIDs = self->_subsectionIDs;
  if ((unint64_t)subsectionIDs | *((_QWORD *)v4 + 43)
    && !-[NSMutableArray isEqual:](subsectionIDs, "isEqual:"))
  {
    goto LABEL_225;
  }
  dismissalID = self->_dismissalID;
  if ((unint64_t)dismissalID | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](dismissalID, "isEqual:"))
      goto LABEL_225;
  }
  attachmentURL = self->_attachmentURL;
  if ((unint64_t)attachmentURL | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](attachmentURL, "isEqual:"))
      goto LABEL_225;
  }
  peopleIDs = self->_peopleIDs;
  if ((unint64_t)peopleIDs | *((_QWORD *)v4 + 31))
  {
    if (!-[NSMutableArray isEqual:](peopleIDs, "isEqual:"))
      goto LABEL_225;
  }
  v35 = *((_DWORD *)v4 + 107);
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    if ((v35 & 0x2000) == 0)
      goto LABEL_225;
    if (self->_ignoresQuietMode)
    {
      if (!*((_BYTE *)v4 + 420))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 420))
    {
      goto LABEL_225;
    }
  }
  else if ((v35 & 0x2000) != 0)
  {
    goto LABEL_225;
  }
  categoryID = self->_categoryID;
  if ((unint64_t)categoryID | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](categoryID, "isEqual:"))
  {
    goto LABEL_225;
  }
  contextNulls = self->_contextNulls;
  if ((unint64_t)contextNulls | *((_QWORD *)v4 + 20))
  {
    if (!-[NSData isEqual:](contextNulls, "isEqual:"))
      goto LABEL_225;
  }
  alertSuppressionContextsNulls = self->_alertSuppressionContextsNulls;
  if ((unint64_t)alertSuppressionContextsNulls | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](alertSuppressionContextsNulls, "isEqual:"))
      goto LABEL_225;
  }
  threadID = self->_threadID;
  if ((unint64_t)threadID | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](threadID, "isEqual:"))
      goto LABEL_225;
  }
  attachmentID = self->_attachmentID;
  if ((unint64_t)attachmentID | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](attachmentID, "isEqual:"))
      goto LABEL_225;
  }
  additionalAttachments = self->_additionalAttachments;
  if ((unint64_t)additionalAttachments | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](additionalAttachments, "isEqual:"))
      goto LABEL_225;
  }
  v42 = self->_has;
  v43 = *((_DWORD *)v4 + 107);
  if ((*(_BYTE *)&v42 & 4) != 0)
  {
    if ((v43 & 4) == 0 || self->_requiredExpirationDate != *((double *)v4 + 3))
      goto LABEL_225;
  }
  else if ((v43 & 4) != 0)
  {
    goto LABEL_225;
  }
  replyToken = self->_replyToken;
  if ((unint64_t)replyToken | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](replyToken, "isEqual:"))
      goto LABEL_225;
    v42 = self->_has;
  }
  v45 = *((_DWORD *)v4 + 107);
  if ((*(_BYTE *)&v42 & 0x10) != 0)
  {
    if ((v45 & 0x10) == 0 || self->_soundMaximumDuration != *((double *)v4 + 5))
      goto LABEL_225;
  }
  else if ((v45 & 0x10) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_DWORD *)&v42 & 0x20000) != 0)
  {
    if ((v45 & 0x20000) == 0)
      goto LABEL_225;
    if (self->_soundShouldRepeat)
    {
      if (!*((_BYTE *)v4 + 425))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 425))
    {
      goto LABEL_225;
    }
  }
  else if ((v45 & 0x20000) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_DWORD *)&v42 & 0x10000) != 0)
  {
    if ((v45 & 0x10000) == 0)
      goto LABEL_225;
    if (self->_soundShouldIgnoreRingerSwitch)
    {
      if (!*((_BYTE *)v4 + 424))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 424))
    {
      goto LABEL_225;
    }
  }
  else if ((v45 & 0x10000) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_WORD *)&v42 & 0x800) != 0)
  {
    if ((v45 & 0x800) == 0)
      goto LABEL_225;
    if (self->_hasCriticalIcon)
    {
      if (!*((_BYTE *)v4 + 418))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 418))
    {
      goto LABEL_225;
    }
  }
  else if ((v45 & 0x800) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_BYTE *)&v42 & 8) != 0)
  {
    if ((v45 & 8) == 0 || self->_soundAudioVolume != *((double *)v4 + 4))
      goto LABEL_225;
  }
  else if ((v45 & 8) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_WORD *)&v42 & 0x8000) != 0)
  {
    if ((v45 & 0x8000) == 0)
      goto LABEL_225;
    if (self->_preemptsPresentedAlert)
    {
      if (!*((_BYTE *)v4 + 423))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 423))
    {
      goto LABEL_225;
    }
  }
  else if ((v45 & 0x8000) != 0)
  {
    goto LABEL_225;
  }
  if ((*(_DWORD *)&v42 & 0x40000) != 0)
  {
    if ((v45 & 0x40000) == 0)
      goto LABEL_225;
    if (self->_suppressDelayForForwardedBulletins)
    {
      if (!*((_BYTE *)v4 + 426))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 426))
    {
      goto LABEL_225;
    }
  }
  else if ((v45 & 0x40000) != 0)
  {
    goto LABEL_225;
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((_QWORD *)v4 + 28))
  {
    if (!-[BLTPBSectionIcon isEqual:](icon, "isEqual:"))
      goto LABEL_225;
    v42 = self->_has;
  }
  v47 = *((_DWORD *)v4 + 107);
  if ((*(_WORD *)&v42 & 0x200) != 0)
  {
    if ((v47 & 0x200) == 0)
      goto LABEL_225;
    if (self->_containsUpdateIcon)
    {
      if (!*((_BYTE *)v4 + 416))
        goto LABEL_225;
    }
    else if (*((_BYTE *)v4 + 416))
    {
      goto LABEL_225;
    }
  }
  else if ((v47 & 0x200) != 0)
  {
    goto LABEL_225;
  }
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](header, "isEqual:"))
      goto LABEL_225;
    v42 = self->_has;
  }
  v49 = *((_DWORD *)v4 + 107);
  if ((*(_BYTE *)&v42 & 0x40) != 0)
  {
    if ((v49 & 0x40) == 0 || self->_interruptionLevel != *((_DWORD *)v4 + 58))
      goto LABEL_225;
  }
  else if ((v49 & 0x40) != 0)
  {
    goto LABEL_225;
  }
  communicationContext = self->_communicationContext;
  if ((unint64_t)communicationContext | *((_QWORD *)v4 + 17)
    && !-[BLTPBCommunicationContext isEqual:](communicationContext, "isEqual:"))
  {
    goto LABEL_225;
  }
  contentType = self->_contentType;
  if ((unint64_t)contentType | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](contentType, "isEqual:"))
      goto LABEL_225;
  }
  filterCriteria = self->_filterCriteria;
  if ((unint64_t)filterCriteria | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](filterCriteria, "isEqual:"))
      goto LABEL_225;
  }
  followActivityAction = self->_followActivityAction;
  if ((unint64_t)followActivityAction | *((_QWORD *)v4 + 26))
  {
    if (!-[BLTPBAction isEqual:](followActivityAction, "isEqual:"))
      goto LABEL_225;
  }
  v54 = *((_DWORD *)v4 + 107);
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    if ((v54 & 0x1000) != 0)
    {
      if (self->_hasSubordinateIcon)
      {
        if (!*((_BYTE *)v4 + 419))
          goto LABEL_225;
        goto LABEL_217;
      }
      if (!*((_BYTE *)v4 + 419))
        goto LABEL_217;
    }
LABEL_225:
    v59 = 0;
    goto LABEL_226;
  }
  if ((v54 & 0x1000) != 0)
    goto LABEL_225;
LABEL_217:
  summary = self->_summary;
  if ((unint64_t)summary | *((_QWORD *)v4 + 45) && !-[NSData isEqual:](summary, "isEqual:"))
    goto LABEL_225;
  threadSummary = self->_threadSummary;
  if ((unint64_t)threadSummary | *((_QWORD *)v4 + 49))
  {
    if (!-[NSData isEqual:](threadSummary, "isEqual:"))
      goto LABEL_225;
  }
  attributedMessage = self->_attributedMessage;
  if ((unint64_t)attributedMessage | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](attributedMessage, "isEqual:"))
      goto LABEL_225;
  }
  eventBehavior = self->_eventBehavior;
  if ((unint64_t)eventBehavior | *((_QWORD *)v4 + 23))
    v59 = -[NSData isEqual:](eventBehavior, "isEqual:");
  else
    v59 = 1;
LABEL_226:

  return v59;
}

- (unint64_t)hash
{
  unint64_t v3;
  double date;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  double publicationDate;
  double v10;
  long double v11;
  double v12;
  $A2F97DD622F7BFDC59BCDE95D20A8287 has;
  unint64_t v14;
  double requiredExpirationDate;
  double v16;
  long double v17;
  double v18;
  $A2F97DD622F7BFDC59BCDE95D20A8287 v19;
  unint64_t v20;
  double soundMaximumDuration;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  double soundAudioVolume;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  uint64_t v34;
  unint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  NSUInteger v50;
  unint64_t v51;
  NSUInteger v52;
  NSUInteger v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSUInteger v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v60;
  NSUInteger v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  NSUInteger v68;
  uint64_t v69;
  uint64_t v70;
  NSUInteger v71;
  uint64_t v72;
  _BOOL4 includesSound;
  NSUInteger v74;
  unint64_t v75;
  NSUInteger v76;
  NSUInteger v77;
  uint64_t v78;
  unint64_t v79;
  NSUInteger v80;
  NSUInteger v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unsigned int feed;
  unint64_t v86;
  NSUInteger v87;
  NSUInteger v88;
  NSUInteger v89;
  NSUInteger v90;
  NSUInteger v91;
  NSUInteger v92;

  v92 = -[NSString hash](self->_bulletinID, "hash");
  v91 = -[NSString hash](self->_sectionID, "hash");
  v90 = -[NSString hash](self->_sectionDisplayName, "hash");
  v89 = -[NSString hash](self->_title, "hash");
  v88 = -[NSString hash](self->_subtitle, "hash");
  v87 = -[NSString hash](self->_messageTitle, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    date = self->_date;
    v5 = -date;
    if (date >= 0.0)
      v5 = self->_date;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v86 = v3;
  v84 = -[NSData hash](self->_attachment, "hash");
  v82 = -[NSMutableArray hash](self->_supplementaryActions, "hash");
  feed = self->_feed;
  v83 = -[BLTPBAction hash](self->_snoozeAction, "hash");
  v81 = -[NSString hash](self->_recordID, "hash");
  v80 = -[NSString hash](self->_publisherBulletinID, "hash");
  v79 = -[BLTPBAction hash](self->_dismissAction, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v78 = 2654435761 * self->_sectionSubtype;
  else
    v78 = 0;
  v77 = -[NSString hash](self->_sockPuppetAppBundleID, "hash");
  v76 = -[NSString hash](self->_category, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    publicationDate = self->_publicationDate;
    v10 = -publicationDate;
    if (publicationDate >= 0.0)
      v10 = self->_publicationDate;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  v75 = v8;
  includesSound = self->_includesSound;
  v74 = -[NSString hash](self->_teamID, "hash");
  v72 = -[NSData hash](self->_context, "hash");
  v71 = -[NSString hash](self->_universalSectionID, "hash");
  v70 = -[NSData hash](self->_alertSuppressionContexts, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v69 = 2654435761 * self->_soundAlertType;
  else
    v69 = 0;
  v68 = -[NSString hash](self->_soundAccountIdentifier, "hash");
  v67 = -[NSString hash](self->_soundToneIdentifier, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v66 = 2654435761 * self->_attachmentType;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_25:
      v65 = 2654435761 * self->_containsUpdatedAttachment;
      if ((*(_WORD *)&has & 0x4000) != 0)
        goto LABEL_26;
LABEL_30:
      v64 = 0;
      if ((*(_DWORD *)&has & 0x80000) != 0)
        goto LABEL_27;
      goto LABEL_31;
    }
  }
  else
  {
    v66 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_25;
  }
  v65 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0)
    goto LABEL_30;
LABEL_26:
  v64 = 2654435761 * self->_loading;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_27:
    v63 = 2654435761 * self->_turnsOnDisplay;
    goto LABEL_32;
  }
LABEL_31:
  v63 = 0;
LABEL_32:
  v62 = -[NSMutableArray hash](self->_subsectionIDs, "hash");
  v61 = -[NSString hash](self->_dismissalID, "hash");
  v60 = -[NSString hash](self->_attachmentURL, "hash");
  v59 = -[NSMutableArray hash](self->_peopleIDs, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v58 = 2654435761 * self->_ignoresQuietMode;
  else
    v58 = 0;
  v57 = -[NSString hash](self->_categoryID, "hash");
  v55 = -[NSData hash](self->_contextNulls, "hash");
  v54 = -[NSData hash](self->_alertSuppressionContextsNulls, "hash");
  v53 = -[NSString hash](self->_threadID, "hash");
  v52 = -[NSString hash](self->_attachmentID, "hash");
  v56 = -[NSMutableArray hash](self->_additionalAttachments, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    requiredExpirationDate = self->_requiredExpirationDate;
    v16 = -requiredExpirationDate;
    if (requiredExpirationDate >= 0.0)
      v16 = self->_requiredExpirationDate;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v51 = v14;
  v50 = -[NSString hash](self->_replyToken, "hash");
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x10) != 0)
  {
    soundMaximumDuration = self->_soundMaximumDuration;
    v22 = -soundMaximumDuration;
    if (soundMaximumDuration >= 0.0)
      v22 = self->_soundMaximumDuration;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((*(_DWORD *)&v19 & 0x20000) == 0)
  {
    v48 = 0;
    if ((*(_DWORD *)&v19 & 0x10000) != 0)
      goto LABEL_53;
LABEL_56:
    v47 = 0;
    if ((*(_WORD *)&v19 & 0x800) != 0)
      goto LABEL_54;
    goto LABEL_57;
  }
  v48 = 2654435761 * self->_soundShouldRepeat;
  if ((*(_DWORD *)&v19 & 0x10000) == 0)
    goto LABEL_56;
LABEL_53:
  v47 = 2654435761 * self->_soundShouldIgnoreRingerSwitch;
  if ((*(_WORD *)&v19 & 0x800) != 0)
  {
LABEL_54:
    v46 = 2654435761 * self->_hasCriticalIcon;
    goto LABEL_58;
  }
LABEL_57:
  v46 = 0;
LABEL_58:
  v49 = v20;
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    soundAudioVolume = self->_soundAudioVolume;
    v27 = -soundAudioVolume;
    if (soundAudioVolume >= 0.0)
      v27 = self->_soundAudioVolume;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((*(_WORD *)&v19 & 0x8000) != 0)
  {
    v45 = 2654435761 * self->_preemptsPresentedAlert;
    if ((*(_DWORD *)&v19 & 0x40000) != 0)
      goto LABEL_68;
  }
  else
  {
    v45 = 0;
    if ((*(_DWORD *)&v19 & 0x40000) != 0)
    {
LABEL_68:
      v30 = -[BLTPBSectionIcon hash](self->_icon, "hash", 2654435761 * self->_suppressDelayForForwardedBulletins);
      goto LABEL_71;
    }
  }
  v30 = -[BLTPBSectionIcon hash](self->_icon, "hash", 0);
LABEL_71:
  v31 = v30;
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    v32 = 2654435761 * self->_containsUpdateIcon;
  else
    v32 = 0;
  v33 = -[NSString hash](self->_header, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v34 = 2654435761 * self->_interruptionLevel;
  else
    v34 = 0;
  v35 = -[BLTPBCommunicationContext hash](self->_communicationContext, "hash");
  v36 = -[NSString hash](self->_contentType, "hash");
  v37 = -[NSString hash](self->_filterCriteria, "hash");
  v38 = -[BLTPBAction hash](self->_followActivityAction, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v39 = 2654435761 * self->_hasSubordinateIcon;
  else
    v39 = 0;
  v40 = v91 ^ v92 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v84 ^ v82 ^ (2654435761 * feed) ^ v83 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ (2654435761 * includesSound) ^ v74 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v56 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v25 ^ v45 ^ v44 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ -[NSData hash](self->_summary, "hash");
  v41 = -[NSData hash](self->_threadSummary, "hash");
  v42 = v41 ^ -[NSData hash](self->_attributedMessage, "hash");
  return v40 ^ v42 ^ -[NSData hash](self->_eventBehavior, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BLTPBAction *snoozeAction;
  uint64_t v11;
  BLTPBAction *dismissAction;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  int v30;
  BLTPBSectionIcon *icon;
  uint64_t v32;
  BLTPBCommunicationContext *communicationContext;
  uint64_t v34;
  BLTPBAction *followActivityAction;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 14))
    -[BLTPBBulletin setBulletinID:](self, "setBulletinID:");
  if (*((_QWORD *)v4 + 36))
    -[BLTPBBulletin setSectionID:](self, "setSectionID:");
  if (*((_QWORD *)v4 + 35))
    -[BLTPBBulletin setSectionDisplayName:](self, "setSectionDisplayName:");
  if (*((_QWORD *)v4 + 50))
    -[BLTPBBulletin setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 44))
    -[BLTPBBulletin setSubtitle:](self, "setSubtitle:");
  if (*((_QWORD *)v4 + 30))
    -[BLTPBBulletin setMessageTitle:](self, "setMessageTitle:");
  if ((*((_BYTE *)v4 + 428) & 1) != 0)
  {
    self->_date = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 9))
    -[BLTPBBulletin setAttachment:](self, "setAttachment:");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = *((id *)v4 + 46);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        -[BLTPBBulletin addSupplementaryActions:](self, "addSupplementaryActions:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v7);
  }

  self->_feed = *((_DWORD *)v4 + 48);
  snoozeAction = self->_snoozeAction;
  v11 = *((_QWORD *)v4 + 38);
  if (snoozeAction)
  {
    if (v11)
      -[BLTPBAction mergeFrom:](snoozeAction, "mergeFrom:");
  }
  else if (v11)
  {
    -[BLTPBBulletin setSnoozeAction:](self, "setSnoozeAction:");
  }
  if (*((_QWORD *)v4 + 33))
    -[BLTPBBulletin setRecordID:](self, "setRecordID:");
  if (*((_QWORD *)v4 + 32))
    -[BLTPBBulletin setPublisherBulletinID:](self, "setPublisherBulletinID:");
  dismissAction = self->_dismissAction;
  v13 = *((_QWORD *)v4 + 21);
  if (dismissAction)
  {
    if (v13)
      -[BLTPBAction mergeFrom:](dismissAction, "mergeFrom:");
  }
  else if (v13)
  {
    -[BLTPBBulletin setDismissAction:](self, "setDismissAction:");
  }
  if ((*((_BYTE *)v4 + 428) & 0x80) != 0)
  {
    self->_sectionSubtype = *((_DWORD *)v4 + 74);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 39))
    -[BLTPBBulletin setSockPuppetAppBundleID:](self, "setSockPuppetAppBundleID:");
  if (*((_QWORD *)v4 + 15))
    -[BLTPBBulletin setCategory:](self, "setCategory:");
  if ((*((_BYTE *)v4 + 428) & 2) != 0)
  {
    self->_publicationDate = *((double *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
  }
  self->_includesSound = *((_BYTE *)v4 + 421);
  if (*((_QWORD *)v4 + 47))
    -[BLTPBBulletin setTeamID:](self, "setTeamID:");
  if (*((_QWORD *)v4 + 19))
    -[BLTPBBulletin setContext:](self, "setContext:");
  if (*((_QWORD *)v4 + 51))
    -[BLTPBBulletin setUniversalSectionID:](self, "setUniversalSectionID:");
  if (*((_QWORD *)v4 + 7))
    -[BLTPBBulletin setAlertSuppressionContexts:](self, "setAlertSuppressionContexts:");
  if ((*((_BYTE *)v4 + 429) & 1) != 0)
  {
    self->_soundAlertType = *((_DWORD *)v4 + 82);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 40))
    -[BLTPBBulletin setSoundAccountIdentifier:](self, "setSoundAccountIdentifier:");
  if (*((_QWORD *)v4 + 42))
    -[BLTPBBulletin setSoundToneIdentifier:](self, "setSoundToneIdentifier:");
  v14 = *((_DWORD *)v4 + 107);
  if ((v14 & 0x20) != 0)
  {
    self->_attachmentType = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x20u;
    v14 = *((_DWORD *)v4 + 107);
    if ((v14 & 0x400) == 0)
    {
LABEL_62:
      if ((v14 & 0x4000) == 0)
        goto LABEL_63;
      goto LABEL_119;
    }
  }
  else if ((v14 & 0x400) == 0)
  {
    goto LABEL_62;
  }
  self->_containsUpdatedAttachment = *((_BYTE *)v4 + 417);
  *(_DWORD *)&self->_has |= 0x400u;
  v14 = *((_DWORD *)v4 + 107);
  if ((v14 & 0x4000) == 0)
  {
LABEL_63:
    if ((v14 & 0x80000) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_119:
  self->_loading = *((_BYTE *)v4 + 422);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 107) & 0x80000) != 0)
  {
LABEL_64:
    self->_turnsOnDisplay = *((_BYTE *)v4 + 427);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_65:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = *((id *)v4 + 43);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v15);
        -[BLTPBBulletin addSubsectionIDs:](self, "addSubsectionIDs:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v4 + 22))
    -[BLTPBBulletin setDismissalID:](self, "setDismissalID:");
  if (*((_QWORD *)v4 + 12))
    -[BLTPBBulletin setAttachmentURL:](self, "setAttachmentURL:");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v20 = *((id *)v4 + 31);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v20);
        -[BLTPBBulletin addPeopleIDs:](self, "addPeopleIDs:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v22);
  }

  if ((*((_BYTE *)v4 + 429) & 0x20) != 0)
  {
    self->_ignoresQuietMode = *((_BYTE *)v4 + 420);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 16))
    -[BLTPBBulletin setCategoryID:](self, "setCategoryID:");
  if (*((_QWORD *)v4 + 20))
    -[BLTPBBulletin setContextNulls:](self, "setContextNulls:");
  if (*((_QWORD *)v4 + 8))
    -[BLTPBBulletin setAlertSuppressionContextsNulls:](self, "setAlertSuppressionContextsNulls:");
  if (*((_QWORD *)v4 + 48))
    -[BLTPBBulletin setThreadID:](self, "setThreadID:");
  if (*((_QWORD *)v4 + 10))
    -[BLTPBBulletin setAttachmentID:](self, "setAttachmentID:");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = *((id *)v4 + 6);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        -[BLTPBBulletin addAdditionalAttachments:](self, "addAdditionalAttachments:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * m), (_QWORD)v37);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v27);
  }

  if ((*((_BYTE *)v4 + 428) & 4) != 0)
  {
    self->_requiredExpirationDate = *((double *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 34))
    -[BLTPBBulletin setReplyToken:](self, "setReplyToken:");
  v30 = *((_DWORD *)v4 + 107);
  if ((v30 & 0x10) != 0)
  {
    self->_soundMaximumDuration = *((double *)v4 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
    v30 = *((_DWORD *)v4 + 107);
    if ((v30 & 0x20000) == 0)
    {
LABEL_108:
      if ((v30 & 0x10000) == 0)
        goto LABEL_109;
      goto LABEL_123;
    }
  }
  else if ((v30 & 0x20000) == 0)
  {
    goto LABEL_108;
  }
  self->_soundShouldRepeat = *((_BYTE *)v4 + 425);
  *(_DWORD *)&self->_has |= 0x20000u;
  v30 = *((_DWORD *)v4 + 107);
  if ((v30 & 0x10000) == 0)
  {
LABEL_109:
    if ((v30 & 0x800) == 0)
      goto LABEL_110;
    goto LABEL_124;
  }
LABEL_123:
  self->_soundShouldIgnoreRingerSwitch = *((_BYTE *)v4 + 424);
  *(_DWORD *)&self->_has |= 0x10000u;
  v30 = *((_DWORD *)v4 + 107);
  if ((v30 & 0x800) == 0)
  {
LABEL_110:
    if ((v30 & 8) == 0)
      goto LABEL_111;
    goto LABEL_125;
  }
LABEL_124:
  self->_hasCriticalIcon = *((_BYTE *)v4 + 418);
  *(_DWORD *)&self->_has |= 0x800u;
  v30 = *((_DWORD *)v4 + 107);
  if ((v30 & 8) == 0)
  {
LABEL_111:
    if ((v30 & 0x8000) == 0)
      goto LABEL_112;
    goto LABEL_126;
  }
LABEL_125:
  self->_soundAudioVolume = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v30 = *((_DWORD *)v4 + 107);
  if ((v30 & 0x8000) == 0)
  {
LABEL_112:
    if ((v30 & 0x40000) == 0)
      goto LABEL_114;
    goto LABEL_113;
  }
LABEL_126:
  self->_preemptsPresentedAlert = *((_BYTE *)v4 + 423);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v4 + 107) & 0x40000) != 0)
  {
LABEL_113:
    self->_suppressDelayForForwardedBulletins = *((_BYTE *)v4 + 426);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_114:
  icon = self->_icon;
  v32 = *((_QWORD *)v4 + 28);
  if (icon)
  {
    if (v32)
      -[BLTPBSectionIcon mergeFrom:](icon, "mergeFrom:");
  }
  else if (v32)
  {
    -[BLTPBBulletin setIcon:](self, "setIcon:");
  }
  if ((*((_BYTE *)v4 + 429) & 2) != 0)
  {
    self->_containsUpdateIcon = *((_BYTE *)v4 + 416);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)v4 + 27))
    -[BLTPBBulletin setHeader:](self, "setHeader:");
  if ((*((_BYTE *)v4 + 428) & 0x40) != 0)
  {
    self->_interruptionLevel = *((_DWORD *)v4 + 58);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  communicationContext = self->_communicationContext;
  v34 = *((_QWORD *)v4 + 17);
  if (communicationContext)
  {
    if (v34)
      -[BLTPBCommunicationContext mergeFrom:](communicationContext, "mergeFrom:");
  }
  else if (v34)
  {
    -[BLTPBBulletin setCommunicationContext:](self, "setCommunicationContext:");
  }
  if (*((_QWORD *)v4 + 18))
    -[BLTPBBulletin setContentType:](self, "setContentType:");
  if (*((_QWORD *)v4 + 25))
    -[BLTPBBulletin setFilterCriteria:](self, "setFilterCriteria:");
  followActivityAction = self->_followActivityAction;
  v36 = *((_QWORD *)v4 + 26);
  if (followActivityAction)
  {
    if (v36)
      -[BLTPBAction mergeFrom:](followActivityAction, "mergeFrom:");
  }
  else if (v36)
  {
    -[BLTPBBulletin setFollowActivityAction:](self, "setFollowActivityAction:");
  }
  if ((*((_BYTE *)v4 + 429) & 0x10) != 0)
  {
    self->_hasSubordinateIcon = *((_BYTE *)v4 + 419);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)v4 + 45))
    -[BLTPBBulletin setSummary:](self, "setSummary:");
  if (*((_QWORD *)v4 + 49))
    -[BLTPBBulletin setThreadSummary:](self, "setThreadSummary:");
  if (*((_QWORD *)v4 + 13))
    -[BLTPBBulletin setAttributedMessage:](self, "setAttributedMessage:");
  if (*((_QWORD *)v4 + 23))
    -[BLTPBBulletin setEventBehavior:](self, "setEventBehavior:");

}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinID, a3);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (NSString)sectionDisplayName
{
  return self->_sectionDisplayName;
}

- (void)setSectionDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_sectionDisplayName, a3);
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

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (void)setMessageTitle:(id)a3
{
  objc_storeStrong((id *)&self->_messageTitle, a3);
}

- (double)date
{
  return self->_date;
}

- (NSData)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (NSMutableArray)supplementaryActions
{
  return self->_supplementaryActions;
}

- (void)setSupplementaryActions:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryActions, a3);
}

- (unsigned)feed
{
  return self->_feed;
}

- (void)setFeed:(unsigned int)a3
{
  self->_feed = a3;
}

- (BLTPBAction)snoozeAction
{
  return self->_snoozeAction;
}

- (void)setSnoozeAction:(id)a3
{
  objc_storeStrong((id *)&self->_snoozeAction, a3);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
  objc_storeStrong((id *)&self->_publisherBulletinID, a3);
}

- (BLTPBAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAction, a3);
}

- (int)sectionSubtype
{
  return self->_sectionSubtype;
}

- (NSString)sockPuppetAppBundleID
{
  return self->_sockPuppetAppBundleID;
}

- (void)setSockPuppetAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_sockPuppetAppBundleID, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (double)publicationDate
{
  return self->_publicationDate;
}

- (BOOL)includesSound
{
  return self->_includesSound;
}

- (void)setIncludesSound:(BOOL)a3
{
  self->_includesSound = a3;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_storeStrong((id *)&self->_teamID, a3);
}

- (NSData)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_universalSectionID, a3);
}

- (NSData)alertSuppressionContexts
{
  return self->_alertSuppressionContexts;
}

- (void)setAlertSuppressionContexts:(id)a3
{
  objc_storeStrong((id *)&self->_alertSuppressionContexts, a3);
}

- (int)soundAlertType
{
  return self->_soundAlertType;
}

- (NSString)soundAccountIdentifier
{
  return self->_soundAccountIdentifier;
}

- (void)setSoundAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_soundAccountIdentifier, a3);
}

- (NSString)soundToneIdentifier
{
  return self->_soundToneIdentifier;
}

- (void)setSoundToneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_soundToneIdentifier, a3);
}

- (unsigned)attachmentType
{
  return self->_attachmentType;
}

- (BOOL)containsUpdatedAttachment
{
  return self->_containsUpdatedAttachment;
}

- (BOOL)loading
{
  return self->_loading;
}

- (BOOL)turnsOnDisplay
{
  return self->_turnsOnDisplay;
}

- (NSMutableArray)subsectionIDs
{
  return self->_subsectionIDs;
}

- (void)setSubsectionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subsectionIDs, a3);
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (void)setDismissalID:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalID, a3);
}

- (NSString)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURL, a3);
}

- (NSMutableArray)peopleIDs
{
  return self->_peopleIDs;
}

- (void)setPeopleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_peopleIDs, a3);
}

- (BOOL)ignoresQuietMode
{
  return self->_ignoresQuietMode;
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
  objc_storeStrong((id *)&self->_categoryID, a3);
}

- (NSData)contextNulls
{
  return self->_contextNulls;
}

- (void)setContextNulls:(id)a3
{
  objc_storeStrong((id *)&self->_contextNulls, a3);
}

- (NSData)alertSuppressionContextsNulls
{
  return self->_alertSuppressionContextsNulls;
}

- (void)setAlertSuppressionContextsNulls:(id)a3
{
  objc_storeStrong((id *)&self->_alertSuppressionContextsNulls, a3);
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
  objc_storeStrong((id *)&self->_threadID, a3);
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentID, a3);
}

- (NSMutableArray)additionalAttachments
{
  return self->_additionalAttachments;
}

- (void)setAdditionalAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_additionalAttachments, a3);
}

- (double)requiredExpirationDate
{
  return self->_requiredExpirationDate;
}

- (NSString)replyToken
{
  return self->_replyToken;
}

- (void)setReplyToken:(id)a3
{
  objc_storeStrong((id *)&self->_replyToken, a3);
}

- (double)soundMaximumDuration
{
  return self->_soundMaximumDuration;
}

- (BOOL)soundShouldRepeat
{
  return self->_soundShouldRepeat;
}

- (BOOL)soundShouldIgnoreRingerSwitch
{
  return self->_soundShouldIgnoreRingerSwitch;
}

- (BOOL)hasCriticalIcon
{
  return self->_hasCriticalIcon;
}

- (double)soundAudioVolume
{
  return self->_soundAudioVolume;
}

- (BOOL)preemptsPresentedAlert
{
  return self->_preemptsPresentedAlert;
}

- (BOOL)suppressDelayForForwardedBulletins
{
  return self->_suppressDelayForForwardedBulletins;
}

- (BLTPBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)containsUpdateIcon
{
  return self->_containsUpdateIcon;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (unsigned)interruptionLevel
{
  return self->_interruptionLevel;
}

- (BLTPBCommunicationContext)communicationContext
{
  return self->_communicationContext;
}

- (void)setCommunicationContext:(id)a3
{
  objc_storeStrong((id *)&self->_communicationContext, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_filterCriteria, a3);
}

- (BLTPBAction)followActivityAction
{
  return self->_followActivityAction;
}

- (void)setFollowActivityAction:(id)a3
{
  objc_storeStrong((id *)&self->_followActivityAction, a3);
}

- (BOOL)hasSubordinateIcon
{
  return self->_hasSubordinateIcon;
}

- (NSData)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSData)threadSummary
{
  return self->_threadSummary;
}

- (void)setThreadSummary:(id)a3
{
  objc_storeStrong((id *)&self->_threadSummary, a3);
}

- (NSData)attributedMessage
{
  return self->_attributedMessage;
}

- (void)setAttributedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_attributedMessage, a3);
}

- (NSData)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_eventBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadSummary, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_supplementaryActions, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_subsectionIDs, 0);
  objc_storeStrong((id *)&self->_soundToneIdentifier, 0);
  objc_storeStrong((id *)&self->_soundAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_sockPuppetAppBundleID, 0);
  objc_storeStrong((id *)&self->_snoozeAction, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_sectionDisplayName, 0);
  objc_storeStrong((id *)&self->_replyToken, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_peopleIDs, 0);
  objc_storeStrong((id *)&self->_messageTitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_followActivityAction, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_contextNulls, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContextsNulls, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContexts, 0);
  objc_storeStrong((id *)&self->_additionalAttachments, 0);
}

+ (id)bulletinWithBBBulletin:(id)a3 sockPuppetAppBundleID:(id)a4 observer:(id)a5 feed:(unint64_t)a6 teamID:(id)a7 universalSectionID:(id)a8 shouldUseExpirationDate:(BOOL)a9 replyToken:(id)a10 gizmoLegacyPublisherBulletinID:(id)a11 gizmoLegacyCategoryID:(id)a12 gizmoSectionID:(id)a13 gizmoSectionSubtype:(id)a14 useUserInfoForContext:(BOOL)a15 removeSubtitleForOlderWatches:(BOOL)a16
{
  id v20;
  id v21;
  id v22;
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
  BLTPBBulletin *v35;
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
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  NSObject *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  NSObject *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  unint64_t v119;
  unint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  float v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t k;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t m;
  NSObject *v143;
  id v144;
  NSObject *v145;
  id v146;
  unint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  NSObject *v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t n;
  void *v160;
  NSObject *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t ii;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  char isKindOfClass;
  NSObject *v175;
  _BOOL4 v176;
  void *v177;
  void *v178;
  void *v179;
  int v180;
  int v181;
  id *v182;
  id *v183;
  uint64_t v184;
  id v185;
  id v186;
  NSObject *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  int v193;
  int v194;
  id *v195;
  void *v196;
  id v197;
  id v198;
  NSObject *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  BLTPBBulletin *v214;
  unint64_t v216;
  void *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  id v227;
  id v228;
  id v230;
  void *v231;
  void *v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  id v242;
  _QWORD v243[4];
  id v244;
  uint64_t v245;
  uint64_t v246;
  id v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  id v264;
  id v265;
  id v266;
  id v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  _BYTE v276[128];
  uint8_t v277[128];
  uint8_t buf[4];
  id v279;
  __int16 v280;
  uint64_t v281;
  __int16 v282;
  id v283;
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  uint64_t v288;

  v288 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v237 = a4;
  v227 = a5;
  v236 = a7;
  v235 = a8;
  v228 = a10;
  v21 = a11;
  v234 = a12;
  v22 = a13;
  v233 = a14;
  +[BLTPBActionFactory sharedInstance](BLTPBActionFactory, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v20, "supplementaryActions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithCapacity:", objc_msgSend(v25, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v274 = 0u;
  v275 = 0u;
  v272 = 0u;
  v273 = 0u;
  objc_msgSend(v20, "supplementaryActions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v272, v287, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v273;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v273 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(v23, "actionWithBBAction:", *(_QWORD *)(*((_QWORD *)&v272 + 1) + 8 * i));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend(v26, "addObject:", v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v272, v287, 16);
    }
    while (v29);
  }

  objc_msgSend(v20, "snoozeAction");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "actionWithBBAction:", v33);
  v232 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "dismissAction");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "actionWithBBAction:", v34);
  v231 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_alloc_init(BLTPBBulletin);
  objc_msgSend(v20, "bulletinID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setBulletinID:](v35, "setBulletinID:", v37);

  v38 = v22;
  if (!v22)
  {
    objc_msgSend(v20, "sectionID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  nilForNSNull(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setSectionID:](v35, "setSectionID:", v39);

  if (!v22)
  objc_msgSend(v20, "sectionDisplayName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setSectionDisplayName:](v35, "setSectionDisplayName:", v41);

  objc_msgSend(v20, "recordID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setRecordID:](v35, "setRecordID:", v43);

  v44 = v21;
  if (!v21)
  {
    objc_msgSend(v20, "publisherBulletinID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  nilForNSNull(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setPublisherBulletinID:](v35, "setPublisherBulletinID:", v45);

  if (!v21)
  v226 = v21;
  if (v233)
    v46 = objc_msgSend(v233, "integerValue");
  else
    v46 = objc_msgSend(v20, "sectionSubtype");
  -[BLTPBBulletin setSectionSubtype:](v35, "setSectionSubtype:", v46);
  -[BLTPBBulletin setFeed:](v35, "setFeed:", a6);
  objc_msgSend(v20, "dismissalID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setDismissalID:](v35, "setDismissalID:", v48);

  if (v234)
  {
    nilForNSNull(v234);
    v49 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v20, "categoryID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    nilForNSNull(v50);
    v49 = objc_claimAutoreleasedReturnValue();

  }
  -[BLTPBBulletin setCategoryID:](v35, "setCategoryID:", v49);
  if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsSendingOnlyCategoryID") & 1) == 0)
    -[BLTPBBulletin setCategory:](v35, "setCategory:", v49);
  v224 = (void *)v49;
  objc_msgSend(v20, "threadID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setThreadID:](v35, "setThreadID:", v52);

  if (a9)
  {
    objc_msgSend(v20, "expirationDate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "timeIntervalSince1970");
    -[BLTPBBulletin setRequiredExpirationDate:](v35, "setRequiredExpirationDate:");

  }
  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAddBulletinReplyToken"))
    -[BLTPBBulletin setReplyToken:](v35, "setReplyToken:", v228);
  objc_msgSend(v20, "subsectionIDs");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "count");

  v225 = v22;
  if (v55)
  {
    v56 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v20, "subsectionIDs");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "arrayWithCapacity:", objc_msgSend(v57, "count"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v270 = 0u;
    v271 = 0u;
    v268 = 0u;
    v269 = 0u;
    objc_msgSend(v20, "subsectionIDs");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v268, v286, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v269;
      do
      {
        for (j = 0; j != v61; ++j)
        {
          if (*(_QWORD *)v269 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(v58, "addObject:", *(_QWORD *)(*((_QWORD *)&v268 + 1) + 8 * j));
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v268, v286, 16);
      }
      while (v61);
    }

    -[BLTPBBulletin setSubsectionIDs:](v35, "setSubsectionIDs:", v58);
  }
  objc_msgSend(v20, "peopleIDs");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v64, "mutableCopy");
  -[BLTPBBulletin setPeopleIDs:](v35, "setPeopleIDs:", v65);

  objc_msgSend(v20, "date");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    objc_msgSend(v20, "date");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "timeIntervalSince1970");
    -[BLTPBBulletin setDate:](v35, "setDate:");

  }
  objc_msgSend(v20, "title");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "subtitle");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsDisplayingSubtitle") & 1) != 0)
  {
    v230 = v69;
  }
  else
  {
    if (v69 && v71)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v69, v71);
      v72 = (id)objc_claimAutoreleasedReturnValue();

      v230 = v72;
      v69 = v72;
    }
    else
    {
      if (v69)
        v73 = v69;
      else
        v73 = v71;
      v230 = v73;
    }

    if (a16)
    {

      v71 = 0;
    }
  }
  objc_msgSend(v20, "summary");
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    v75 = (void *)v74;
    v76 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v20, "summary");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = 0;
    objc_msgSend(v76, "archivedDataWithRootObject:requiringSecureCoding:error:", v77, 1, &v267);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v267;
    v80 = v78;

    if (v79)
    {
      blt_ids_log();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:].cold.5();

    }
    if (v80)
    {
      -[BLTPBBulletin setSummary:](v35, "setSummary:", v80);

    }
  }
  objc_msgSend(v20, "threadSummary");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    v84 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v20, "threadSummary");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = 0;
    objc_msgSend(v84, "archivedDataWithRootObject:requiringSecureCoding:error:", v85, 1, &v266);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v266;
    v88 = v86;

    if (v87)
    {
      blt_ids_log();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:].cold.4();

    }
    if (v88)
    {
      -[BLTPBBulletin setThreadSummary:](v35, "setThreadSummary:", v88);

    }
  }
  objc_msgSend(v20, "attributedMessage");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    v92 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v20, "attributedMessage");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v265 = 0;
    objc_msgSend(v92, "archivedDataWithRootObject:requiringSecureCoding:error:", v93, 1, &v265);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v265;
    v96 = v94;

    if (v95)
    {
      blt_ids_log();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:].cold.3();

    }
    if (v96)
    {
      -[BLTPBBulletin setAttributedMessage:](v35, "setAttributedMessage:", v96);

    }
  }
  objc_msgSend(v20, "eventBehavior");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    v100 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v20, "eventBehavior");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = 0;
    objc_msgSend(v100, "archivedDataWithRootObject:requiringSecureCoding:error:", v101, 1, &v264);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v264;
    v104 = v102;

    if (v103)
    {
      blt_ids_log();
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:].cold.2();

    }
    if (v104)
    {
      -[BLTPBBulletin setEventBehavior:](v35, "setEventBehavior:", v104);

    }
  }
  objc_msgSend(v20, "header");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setHeader:](v35, "setHeader:", v107);

  -[BLTPBBulletin setTitle:](v35, "setTitle:", v230);
  -[BLTPBBulletin setSubtitle:](v35, "setSubtitle:", v71);
  objc_msgSend(v20, "message");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setMessageTitle:](v35, "setMessageTitle:", v109);

  -[BLTPBBulletin setLoading:](v35, "setLoading:", objc_msgSend(v20, "isLoading"));
  -[BLTPBBulletin setTurnsOnDisplay:](v35, "setTurnsOnDisplay:", objc_msgSend(v20, "turnsOnDisplay"));
  -[BLTPBBulletin setSnoozeAction:](v35, "setSnoozeAction:", v232);
  -[BLTPBBulletin setDismissAction:](v35, "setDismissAction:", v231);
  -[BLTPBBulletin setSupplementaryActions:](v35, "setSupplementaryActions:", v26);
  -[BLTPBBulletin setSockPuppetAppBundleID:](v35, "setSockPuppetAppBundleID:", v237);
  if (objc_msgSend(v20, "suppressDelayForForwardedBulletins"))
    -[BLTPBBulletin setSuppressDelayForForwardedBulletins:](v35, "setSuppressDelayForForwardedBulletins:", 1);
  objc_msgSend(v20, "publishDate");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "timeIntervalSince1970");
  -[BLTPBBulletin setPublicationDate:](v35, "setPublicationDate:");
  objc_msgSend(v20, "sound");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setIncludesSound:](v35, "setIncludesSound:", v110 != 0);
  objc_msgSend(v110, "alertConfiguration");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setSoundAlertType:](v35, "setSoundAlertType:", objc_msgSend(v111, "type"));

  objc_msgSend(v110, "alertConfiguration");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "topic");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setSoundAccountIdentifier:](v35, "setSoundAccountIdentifier:", v114);

  objc_msgSend(v110, "alertConfiguration");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "toneIdentifier");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  nilForNSNull(v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setSoundToneIdentifier:](v35, "setSoundToneIdentifier:", v117);

  objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "bltVersion");

  if (v119 >= 6)
  {
    v120 = v119;
    objc_msgSend(v110, "alertConfiguration");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v121, "shouldRepeat"))
      v122 = objc_msgSend(v20, "blt_isVOIPCall") ^ 1;
    else
      v122 = 0;

    -[BLTPBBulletin setSoundShouldRepeat:](v35, "setSoundShouldRepeat:", v122);
    objc_msgSend(v110, "alertConfiguration");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBBulletin setSoundShouldIgnoreRingerSwitch:](v35, "setSoundShouldIgnoreRingerSwitch:", objc_msgSend(v123, "shouldIgnoreRingerSwitch"));

    objc_msgSend(v110, "alertConfiguration");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "maximumDuration");
    -[BLTPBBulletin setSoundMaximumDuration:](v35, "setSoundMaximumDuration:");

    v119 = v120;
  }
  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsCriticalAndGroupingSettings"))
  {
    -[BLTPBBulletin setHasCriticalIcon:](v35, "setHasCriticalIcon:", objc_msgSend(v20, "hasCriticalIcon"));
    objc_msgSend(v110, "alertConfiguration");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "audioVolume");
    -[BLTPBBulletin setSoundAudioVolume:](v35, "setSoundAudioVolume:", v126);

  }
  -[BLTPBBulletin setTeamID:](v35, "setTeamID:", v236);
  -[BLTPBBulletin setIgnoresQuietMode:](v35, "setIgnoresQuietMode:", objc_msgSend(v20, "ignoresQuietMode"));
  -[BLTPBBulletin setPreemptsPresentedAlert:](v35, "setPreemptsPresentedAlert:", objc_msgSend(v20, "preemptsPresentedAlert"));
  objc_msgSend(v20, "bltContext");
  v223 = v71;
  v221 = v110;
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  if (v238 && v119 <= 7)
  {
    v127 = (void *)objc_msgSend(v238, "mutableCopy");
    objc_msgSend(v127, "removeObjectForKey:", CFSTR("userInfo"));
    if (v119 == 7)
    {
      objc_msgSend(MEMORY[0x24BDF8818], "notificationForBulletin:", v20);
      v260 = 0u;
      v261 = 0u;
      v262 = 0u;
      v263 = 0u;
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "request");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "content");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "attachments");
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v260, v285, 16);
      if (v131)
      {
        v132 = v131;
        v133 = *(_QWORD *)v261;
        do
        {
          for (k = 0; k != v132; ++k)
          {
            if (*(_QWORD *)v261 != v133)
              objc_enumerationMutation(v130);
            objc_msgSend(*(id *)(*((_QWORD *)&v260 + 1) + 8 * k), "blt_preEncodeShouldAddNotificationAttachmentOptions");
          }
          v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v260, v285, 16);
        }
        while (v132);
      }

      objc_msgSend(v217, "bs_secureEncoded");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v256 = 0u;
      v257 = 0u;
      v258 = 0u;
      v259 = 0u;
      objc_msgSend(v217, "request");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "content");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "attachments");
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v256, v284, 16);
      if (v139)
      {
        v140 = v139;
        v141 = *(_QWORD *)v257;
        do
        {
          for (m = 0; m != v140; ++m)
          {
            if (*(_QWORD *)v257 != v141)
              objc_enumerationMutation(v138);
            objc_msgSend(*(id *)(*((_QWORD *)&v256 + 1) + 8 * m), "blt_postEncodeNotificationAttachmentOptions");
          }
          v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v256, v284, 16);
        }
        while (v140);
      }

      v119 = 7;
      if (v217 && v135)
        goto LABEL_111;
      blt_ids_log();
      v143 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v279 = v20;
        v280 = 2112;
        v281 = (uint64_t)v217;
        v282 = 2112;
        v283 = v135;
        _os_log_error_impl(&dword_2173D9000, v143, OS_LOG_TYPE_ERROR, "Error getting a plist serialazable UNNotification from BBBulletin,  bulletin=%@ UNNotification=%@  plistSeriazableData=%@", buf, 0x20u);
      }

      if (v135)
LABEL_111:
        objc_msgSend(v127, "setObject:forKeyedSubscript:", v135, CFSTR("UNBulletinContextArchivedUserNotification"));

    }
    v144 = v127;

    if (a15
      || !objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsUserNotificationListDestination")
      || (v238 = v144,
          (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsNoLocalRemoteNotificationInBulletinContext") & 1) == 0))
    {
      if (v144
        && (objc_msgSend(MEMORY[0x24BDF8818], "notificationForBulletin:", v20),
            v145 = (id)objc_claimAutoreleasedReturnValue(),
            v145,
            v145))
      {
        if (a15)
        {
          -[NSObject request](v145, "request");
          v146 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "content");
          v147 = v119;
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "userInfo");
          v238 = (void *)objc_claimAutoreleasedReturnValue();

          v119 = v147;
        }
        else
        {
          v149 = (void *)objc_msgSend(v144, "mutableCopy");
          v216 = v119;
          if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsUserNotificationListDestination") & 1) == 0)
          {
            -[NSObject request](v145, "request");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "content");
            v151 = (void *)objc_claimAutoreleasedReturnValue();

            if (v151)
            {
              v239 = v149;
              -[NSObject request](v145, "request");
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              v153 = objc_msgSend(v152, "destinations") & 6;

              blt_ids_log();
              v154 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v279) = v153 != 0;
                _os_log_impl(&dword_2173D9000, v154, OS_LOG_TYPE_DEFAULT, "Adding back shouldAddToNotificationsList: %{BOOL}u", buf, 8u);
              }
              v218 = v153;

              v254 = 0u;
              v255 = 0u;
              v252 = 0u;
              v253 = 0u;
              v219 = v151;
              objc_msgSend(v151, "attachments");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v252, v277, 16);
              if (v156)
              {
                v157 = v156;
                v158 = *(_QWORD *)v253;
                do
                {
                  for (n = 0; n != v157; ++n)
                  {
                    if (*(_QWORD *)v253 != v158)
                      objc_enumerationMutation(v155);
                    objc_msgSend(*(id *)(*((_QWORD *)&v252 + 1) + 8 * n), "blt_preEncodeShouldAddNotificationAttachmentOptions");
                  }
                  v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v252, v277, 16);
                }
                while (v157);
              }

              v151 = v219;
              objc_msgSend(v219, "blt_preEncodeShouldAddToNotificationsList:", v218 != 0);
              -[NSObject bs_secureEncoded](v145, "bs_secureEncoded");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v239, "setObject:forKeyedSubscript:", v160, CFSTR("UNBulletinContextArchivedUserNotification"));

              objc_msgSend(v219, "blt_postEncode");
              v250 = 0u;
              v251 = 0u;
              v248 = 0u;
              v249 = 0u;
              objc_msgSend(v219, "attachments");
              v161 = objc_claimAutoreleasedReturnValue();
              v162 = -[NSObject countByEnumeratingWithState:objects:count:](v161, "countByEnumeratingWithState:objects:count:", &v248, v276, 16);
              if (v162)
              {
                v163 = v162;
                v164 = *(_QWORD *)v249;
                do
                {
                  for (ii = 0; ii != v163; ++ii)
                  {
                    if (*(_QWORD *)v249 != v164)
                      objc_enumerationMutation(v161);
                    objc_msgSend(*(id *)(*((_QWORD *)&v248 + 1) + 8 * ii), "blt_postEncodeNotificationAttachmentOptions");
                  }
                  v163 = -[NSObject countByEnumeratingWithState:objects:count:](v161, "countByEnumeratingWithState:objects:count:", &v248, v276, 16);
                }
                while (v163);
                v149 = v239;
                v151 = v219;
              }
              else
              {
                v149 = v239;
              }
            }
            else
            {
              blt_ids_log();
              v161 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
                +[BLTPBBulletin(BBBulletin) bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:].cold.1((uint64_t)v145, v161, v166, v167, v168, v169, v170, v171);
            }

            v119 = v216;
          }
          if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsNoLocalRemoteNotificationInBulletinContext") & 1) == 0)
          {
            v240 = v149;
            -[NSObject request](v145, "request");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "trigger");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            blt_ids_log();
            v175 = objc_claimAutoreleasedReturnValue();
            v176 = os_log_type_enabled(v175, OS_LOG_TYPE_INFO);
            if ((isKindOfClass & 1) != 0)
            {
              if (v176)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2173D9000, v175, OS_LOG_TYPE_INFO, "Adding back remoteNotification to bulletin context for paired watch", buf, 2u);
              }

              -[NSObject request](v145, "request");
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v177, "content");
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v178, "userInfo");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              v149 = v240;
              objc_msgSend(v240, "setObject:forKey:", v179, CFSTR("remoteNotification"));

            }
            else
            {
              if (v176)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2173D9000, v175, OS_LOG_TYPE_INFO, "Adding back localNotification to bulletin context for paired watch", buf, 2u);
              }

              (*(void (**)(void))(*MEMORY[0x24BDF8038] + 16))();
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v177, 1, 0);
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              v149 = v240;
              objc_msgSend(v240, "setObject:forKey:", v178, CFSTR("localNotification"));
            }

            v119 = v216;
          }
          v146 = v149;

          v238 = v146;
        }

      }
      else
      {
        blt_ids_log();
        v145 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2173D9000, v145, OS_LOG_TYPE_DEFAULT, "Changes to bulletin context were requested but context does not contain a valid UNNotification. No changes will be made to bulletin context.", buf, 2u);
        }
        v238 = v144;
      }

    }
  }
  if (v119 > 7)
  {
    v245 = 0;
    v183 = (id *)&v245;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v238, 1, &v245);
    v184 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v180 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsNSNullPListExtenion");
    v181 = v180;
    if (v180)
      v182 = &v247;
    else
      v182 = 0;
    if (v180)
      v247 = 0;
    v246 = 0;
    v183 = (id *)&v246;
    +[BLTObjectSerializer serializeObject:nulls:error:](BLTObjectSerializer, "serializeObject:nulls:error:", v238, v182, &v246);
    v184 = objc_claimAutoreleasedReturnValue();
    if (v181)
    {
      v185 = v247;
      v183 = (id *)&v246;
      goto LABEL_169;
    }
  }
  v185 = 0;
LABEL_169:
  v186 = *v183;
  v220 = (void *)v184;
  if (v186)
  {
    blt_ids_log();
    v187 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v279 = v186;
      v280 = 2112;
      v281 = v184;
      v282 = 2112;
      v283 = v20;
      _os_log_error_impl(&dword_2173D9000, v187, OS_LOG_TYPE_ERROR, "Error serializing bulletin context: %@, %@, %@", buf, 0x20u);
    }

  }
  else
  {
    -[BLTPBBulletin setContext:](v35, "setContext:", v184);
    -[BLTPBBulletin setContextNulls:](v35, "setContextNulls:", v185);
  }
  v188 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v20, "alertSuppressionContexts");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "arrayWithCapacity:", objc_msgSend(v189, "count"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "alertSuppressionContexts");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v243[0] = MEMORY[0x24BDAC760];
  v243[1] = 3221225472;
  v243[2] = __289__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches___block_invoke;
  v243[3] = &unk_24D763AD8;
  v192 = v190;
  v244 = v192;
  objc_msgSend(v191, "enumerateObjectsUsingBlock:", v243);

  v193 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsNSNullPListExtenion");
  v194 = v193;
  if (v193)
    v195 = &v242;
  else
    v195 = 0;
  if (v193)
    v242 = 0;
  v241 = v186;
  +[BLTObjectSerializer serializeObject:nulls:error:](BLTObjectSerializer, "serializeObject:nulls:error:", v192, v195, &v241);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  if (v194)
    v197 = v242;
  else
    v197 = 0;
  v198 = v241;

  if (v198)
  {
    blt_ids_log();
    v199 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v279 = v198;
      v280 = 2112;
      v281 = (uint64_t)v196;
      v282 = 2112;
      v283 = v20;
      _os_log_error_impl(&dword_2173D9000, v199, OS_LOG_TYPE_ERROR, "Error serializing alert suppression contexts: %@, %@, %@", buf, 0x20u);
    }

  }
  else
  {
    -[BLTPBBulletin setAlertSuppressionContexts:](v35, "setAlertSuppressionContexts:", v196);
    -[BLTPBBulletin setAlertSuppressionContextsNulls:](v35, "setAlertSuppressionContextsNulls:", v197);
  }
  -[BLTPBBulletin sectionDisplayName](v35, "sectionDisplayName");
  v200 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v200)
  {
    v201 = (void *)MEMORY[0x24BDC1550];
    -[BLTPBBulletin sectionID](v35, "sectionID");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "bundleProxyForIdentifier:", v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();

    if (v203)
    {
      objc_msgSend(v203, "localizedName");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTPBBulletin setSectionDisplayName:](v35, "setSectionDisplayName:", v204);

    }
  }
  -[BLTPBBulletin setUniversalSectionID:](v35, "setUniversalSectionID:", v235);
  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsIconsPerNotification"))
  {
    objc_msgSend(v20, "icon");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    BLTPBSectionIconFromBBSectionIcon(v205, 0);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBBulletin setIcon:](v35, "setIcon:", v206);

  }
  objc_msgSend(v20, "contentType");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setContentType:](v35, "setContentType:", v207);

  -[BLTPBBulletin setInterruptionLevel:](v35, "setInterruptionLevel:", objc_msgSend(v20, "interruptionLevel"));
  objc_msgSend(v20, "communicationContext");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "blt_protobuf");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setCommunicationContext:](v35, "setCommunicationContext:", v209);

  objc_msgSend(v20, "filterCriteria");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin setFilterCriteria:](v35, "setFilterCriteria:", v210);

  objc_msgSend(v20, "followActivityAction");
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  if (v211)
  {
    objc_msgSend(v20, "followActivityAction");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionWithBBAction:", v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBBulletin setFollowActivityAction:](v35, "setFollowActivityAction:", v213);

  }
  -[BLTPBBulletin setHasSubordinateIcon:](v35, "setHasSubordinateIcon:", objc_msgSend(v20, "hasSubordinateIcon"));
  v214 = v35;

  return v214;
}

uint64_t __289__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (void)bulletinWithBBBulletin:(id)a3 sockPuppetAppBundleID:(id)a4 observer:(id)a5 feed:(unint64_t)a6 teamID:(id)a7 universalSectionID:(id)a8 shouldUseExpirationDate:(BOOL)a9 replyToken:(id)a10 gizmoLegacyPublisherBulletinID:(id)a11 gizmoLegacyCategoryID:(id)a12 gizmoSectionID:(id)a13 gizmoSectionSubtype:(id)a14 useUserInfoForContext:(BOOL)a15 removeSubtitleForOlderWatches:(BOOL)a16 attachOption:(unint64_t)a17 completion:(id)a18
{
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v32[4];
  id v33;

  v23 = a18;
  v24 = a5;
  v25 = a3;
  LOWORD(v29) = __PAIR16__(a16, a15);
  LOBYTE(v28) = a9;
  objc_msgSend(a1, "bulletinWithBBBulletin:sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:", v25, a4, v24, a6, a7, a8, v28, a10, a11, a12, a13, a14, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __313__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches_attachOption_completion___block_invoke;
  v32[3] = &unk_24D763B00;
  v33 = v23;
  v27 = v23;
  objc_msgSend(a1, "_addAttachmentsFromBBBulletin:toBLTPBBulletin:observer:attachOption:completion:", v25, v26, v24, a17, v32);

}

uint64_t __313__BLTPBBulletin_BBBulletin__bulletinWithBBBulletin_sockPuppetAppBundleID_observer_feed_teamID_universalSectionID_shouldUseExpirationDate_replyToken_gizmoLegacyPublisherBulletinID_gizmoLegacyCategoryID_gizmoSectionID_gizmoSectionSubtype_useUserInfoForContext_removeSubtitleForOlderWatches_attachOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)publisherMatchID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BLTPBBulletin publisherBulletinID](self, "publisherBulletinID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BLTPBBulletin recordID](self, "recordID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)attachmentKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[BLTPBBulletin sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletin publisherMatchID](self, "publisherMatchID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4)
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@--%@--%@"), v6, v7, v4);
  else
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@--%@"), v6, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attachmentURLURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BLTPBBulletin attachmentURL](self, "attachmentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[BLTPBBulletin attachmentURL](self, "attachmentURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_attachmentFromBBAttachmentMetadata:(id)a3 bulletin:(id)a4 observer:(id)a5 fileOption:(unint64_t)a6 attachOption:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  NSObject *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  float v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  BOOL v90;
  void *v91;
  void *v92;
  NSObject *v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  id v98;
  void (**v99)(_QWORD, _QWORD);
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  void (**v104)(_QWORD, _QWORD);
  id v105;
  BOOL v106;
  _QWORD v107[4];
  id v108;
  NSObject *v109;
  id v110;
  void (**v111)(_QWORD, _QWORD);
  id v112;
  BOOL v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  unint64_t v119;
  BOOL v120;
  _BYTE buf[12];
  __int16 v122;
  NSObject *v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (!v17)
    +[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:].cold.1();
  v18 = v17;
  v19 = objc_msgSend(v14, "type");
  v20 = a7 == 1;
  v114[0] = MEMORY[0x24BDAC760];
  v114[1] = 3221225472;
  v114[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke;
  v114[3] = &unk_24D763B28;
  v118 = v19;
  v21 = v14;
  v115 = v21;
  v120 = a7 == 2;
  v22 = v15;
  v116 = v22;
  v23 = v18;
  v117 = v23;
  v119 = a6;
  v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0C15C](v114);
  if (a7 == 2)
    goto LABEL_39;
  if (v19 == 1)
  {
    blt_ids_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_2173D9000, v25, OS_LOG_TYPE_INFO, "%@ Image attachment processing", buf, 0xCu);
    }

    if (!a6)
      goto LABEL_39;
    objc_msgSend(v21, "URL");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_39;
    v27 = (id)v26;
    objc_msgSend(v21, "URL");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v28 == v29)
    {

    }
    else
    {
      v30 = (void *)v29;
      objc_msgSend(v21, "URL");
      v94 = v16;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "path");
      v92 = v27;
      v32 = v20;
      v33 = a1;
      v34 = v28;
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v94;
      v36 = v33;
      v37 = v32;

      if (!v35)
      {
LABEL_39:
        v24[2](v24, 0);
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v21, "URL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "path");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "fileURLWithPath:", v40);
      v41 = objc_claimAutoreleasedReturnValue();

      BLTFileURLInAttachmentsPath(v22, v21);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v41;
      +[BLTImageAttachmentInfo imageAttachmentInfoForImageURL:](BLTImageAttachmentInfo, "imageAttachmentInfoForImageURL:", v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (!v43
        || (objc_msgSend(v43, "contentType"), v45 = (void *)objc_claimAutoreleasedReturnValue(), v45, !v45))
      {
        blt_ids_log();
        v77 = objc_claimAutoreleasedReturnValue();
        v64 = v93;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          +[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:].cold.2();

        (*((void (**)(id, _QWORD, _QWORD))v23 + 2))(v23, 0, 0);
        goto LABEL_44;
      }
      v91 = v42;
      blt_ids_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v22, "publisherBulletinID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v47;
        v122 = 2112;
        v123 = v93;
        _os_log_impl(&dword_2173D9000, v46, OS_LOG_TYPE_INFO, "%@ Image attachment processing: %@", buf, 0x16u);

      }
      if (v27 && v91)
      {
        objc_msgSend(v27, "valueForProperty:", *MEMORY[0x24BE6B3C0]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "floatValue");
        v50 = v49;

        objc_msgSend(v27, "valueForProperty:", *MEMORY[0x24BE6B3C8]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "CGSizeValue");
        v53 = v52;
        v55 = v54;

        v56 = v53 / v50;
        v57 = v55 / v50;
        objc_msgSend(v44, "size");
        if (v58 <= 0.0
          || (objc_msgSend(v44, "size"), v56 <= v59)
          || (objc_msgSend(v44, "size"), v60 <= 0.0)
          || (objc_msgSend(v44, "size"), v57 <= v61))
        {
          v89 = v44;
          v90 = v37;
          blt_ids_log();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "publisherBulletinID");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v85;
            v122 = 2112;
            v123 = v93;
            _os_log_impl(&dword_2173D9000, v84, OS_LOG_TYPE_INFO, "%@ Image attachment will be sent scaled: %@", buf, 0x16u);

          }
          v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5EF0]), "initWithFileAtURL:size:scale:representationTypes:", v93, 4, v56, v57, v50);
          objc_msgSend(v86, "setMinimumDimension:", 50.0);
          objc_msgSend(MEMORY[0x24BDE5EF8], "sharedGenerator");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "contentType");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v100[0] = MEMORY[0x24BDAC760];
          v100[1] = 3221225472;
          v100[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_83;
          v100[3] = &unk_24D763BA0;
          v105 = v36;
          v101 = v21;
          v102 = v91;
          v106 = v90;
          v103 = v89;
          v104 = v24;
          objc_msgSend(v87, "saveBestRepresentationForRequest:toFileAtURL:withContentType:completionHandler:", v86, v102, v88, v100);

          v64 = v93;
          v44 = v89;
          v42 = v91;

        }
        else
        {
          blt_ids_log();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "publisherBulletinID");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v63;
            v122 = 2112;
            v123 = v93;
            _os_log_impl(&dword_2173D9000, v62, OS_LOG_TYPE_INFO, "%@ Image attachment will be sent without scaling: %@", buf, 0x16u);

          }
          v107[0] = MEMORY[0x24BDAC760];
          v107[1] = 3221225472;
          v107[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_80;
          v107[3] = &unk_24D763B50;
          v112 = v36;
          v108 = v21;
          v64 = v93;
          v109 = v93;
          v113 = v37;
          v110 = v44;
          v111 = v24;
          BLTDispatchWorkQueue(v107);

          v42 = v91;
        }
LABEL_44:

        v16 = v94;
        goto LABEL_40;
      }

      v28 = v93;
      v16 = v94;
    }
    goto LABEL_37;
  }
  objc_msgSend(v21, "URL");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v65;
  if ((v19 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_38:

    goto LABEL_39;
  }

  objc_msgSend(v21, "URL");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    v27 = v66;
    goto LABEL_38;
  }
  v95 = v16;
  v67 = (void *)MEMORY[0x24BDD1580];
  v27 = v66;
  objc_msgSend(v67, "defaultManager");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "absoluteURL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "path");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  objc_msgSend(v68, "attributesOfItemAtPath:error:", v70, buf);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "fileSize");

  if (v72 <= 0x100000)
  {
    v16 = v95;
    goto LABEL_38;
  }
  BLTFileURLInAttachmentsPath(v22, v21);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v95;
  if (!v73)
  {
    blt_general_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:].cold.3((uint64_t)v22, v28, v78, v79, v80, v81, v82, v83);
LABEL_37:

    goto LABEL_38;
  }
  v74 = v73;
  v96[0] = MEMORY[0x24BDAC760];
  v96[1] = 3221225472;
  v96[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_86;
  v96[3] = &unk_24D763BC8;
  v97 = v27;
  v98 = v73;
  v99 = v24;
  v75 = v74;
  v76 = v27;
  +[BLTAVUtil transcodeURL:outURL:maxBytes:completion:](BLTAVUtil, "transcodeURL:outURL:maxBytes:completion:", v76, v75, 0x100000, v96);

LABEL_40:
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  NSObject *v7;
  BLTPBBulletinAttachment *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void (*v22)(void);
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  int v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v4 - 1) <= 2)
  {
    v5 = "Video";
    if (v4 == 3)
      v5 = "Sound";
    if (v4 == 1)
      v6 = "Image";
    else
      v6 = v5;
    blt_ids_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v35 = 136315138;
      v36 = v6;
      _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_INFO, "%s attachment will be sent with bulletin", (uint8_t *)&v35, 0xCu);
    }

    v8 = objc_alloc_init(BLTPBBulletinAttachment);
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBBulletinAttachment setIdentifier:](v8, "setIdentifier:", v10);

    -[BLTPBBulletinAttachment setType:](v8, "setType:", *(unsigned int *)(a1 + 56));
    if (!*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 != v14)
        {
          blt_ids_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v35 = 136315138;
            v36 = v6;
            _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_INFO, "%s retrieved url", (uint8_t *)&v35, 0xCu);
          }

          BLTTranscodedFileURLForBulletin(*(void **)(a1 + 40), *(void **)(a1 + 32));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "absoluteString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLTPBBulletinAttachment setURL:](v8, "setURL:", v18);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "URL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "absoluteString");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLTPBBulletinAttachment setURL:](v8, "setURL:", v21);

          }
        }
      }
      if (!*(_BYTE *)(a1 + 72))
      {
        v23 = *(_QWORD *)(a1 + 64);
        if (v23 != 2)
        {
          if (v23 != 1
            || (-[BLTPBBulletinAttachment uRL](v8, "uRL"),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v24,
                !v24))
          {
            v25 = *(_QWORD *)(a1 + 56);
            if (v25 == 3)
            {
              blt_ids_log();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                v35 = 136315138;
                v36 = v6;
                _os_log_impl(&dword_2173D9000, v26, OS_LOG_TYPE_INFO, "%s retrieving data", (uint8_t *)&v35, 0xCu);
              }

              objc_msgSend(*(id *)(a1 + 32), "URL");
              v27 = objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v28 = (void *)v27;
                objc_msgSend(*(id *)(a1 + 32), "URL");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29 != v30)
                {
                  v31 = (void *)MEMORY[0x24BDBCE50];
                  objc_msgSend(*(id *)(a1 + 32), "URL");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "dataWithContentsOfURL:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
                }
              }
              goto LABEL_24;
            }
            if (v25 == 1)
            {
              v22 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
              goto LABEL_23;
            }
            if (!v8)
            {
              blt_ids_log();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
                __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_cold_1((uint64_t)v6, v34);

            }
          }
        }
      }
    }
    v22 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_23:
    v22();
LABEL_24:

    goto LABEL_25;
  }
  blt_ids_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = *(const char **)(a1 + 56);
    v35 = 134217984;
    v36 = v20;
    _os_log_impl(&dword_2173D9000, v19, OS_LOG_TYPE_INFO, "Attachment data will be ignored for attachment type %ld", (uint8_t *)&v35, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_25:

}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_80(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 48), "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleThumbnailResponse:attachmentMetadata:transcodedAttachmentSaveURL:wantsData:imageContentType:", 0, v3, v4, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_2;
  v5[3] = &unk_24D763B78;
  v11 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 72);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v4 = v3;
  BLTDispatchWorkQueue(v5);

}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleThumbnailResponse:attachmentMetadata:transcodedAttachmentSaveURL:wantsData:imageContentType:", v3, v4, v6, v5, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    blt_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_86_cold_1(a1, (uint64_t)v3, v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)_handleThumbnailResponse:(id)a3 attachmentMetadata:(id)a4 transcodedAttachmentSaveURL:(id)a5 wantsData:(BOOL)a6 imageContentType:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  UIImage *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  UIImage *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  int v25;
  UIImage *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v8 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = (UIImage *)a5;
  v14 = a7;
  if (v11)
  {
    blt_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[BLTPBBulletin(BBBulletin) _handleThumbnailResponse:attachmentMetadata:transcodedAttachmentSaveURL:wantsData:imageContentType:].cold.1((uint64_t)v11, v12);
    v16 = 0;
LABEL_17:

    goto LABEL_18;
  }
  blt_ids_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v25 = 138412290;
    v26 = v13;
    _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_INFO, "_handleThumbnailResponse: Image attachment generated and saved to file URL %@", (uint8_t *)&v25, 0xCu);
  }

  if (v8)
  {
    -[UIImage path](v13, "path");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithContentsOfFile:", v15);
    v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "isEqualToString:", v19);

    blt_ids_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v22)
      {
        v25 = 138412802;
        v26 = v18;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_2173D9000, v21, OS_LOG_TYPE_INFO, "_handleThumbnailResponse: PNG is being added manually, backwards compatibility for older watches image: %@ filepath: %@ imageContentType: %@", (uint8_t *)&v25, 0x20u);
      }

      UIImagePNGRepresentation(v18);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v22)
      {
        v25 = 138412802;
        v26 = v18;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_2173D9000, v21, OS_LOG_TYPE_INFO, "_handleThumbnailResponse: JPEG attachment is being added manually, backwards compatibility for older watches image: %@ filepath: %@ imageContentType: %@", (uint8_t *)&v25, 0x20u);
      }

      UIImageJPEGRepresentation(v18, 0.899999976);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v23;

    goto LABEL_17;
  }
  v16 = 0;
LABEL_18:

  return v16;
}

+ (void)_addAttachmentsFromBBBulletin:(id)a3 toBLTPBBulletin:(id)a4 observer:(id)a5 attachOption:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned int v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  BOOL v29;
  char v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsMultipleAttachments");
  objc_msgSend(v12, "primaryAttachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke;
  v22[3] = &unk_24D763C18;
  v29 = a6 == 1;
  v30 = v16;
  v23 = v13;
  v24 = v12;
  v27 = a1;
  v28 = a6;
  v25 = v14;
  v26 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v12;
  v21 = v13;
  objc_msgSend(a1, "_attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:", v17, v20, v19, v16, a6, v22);

}

void __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  id obj;
  _QWORD block[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttachmentID:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setAttachmentType:", objc_msgSend(v5, "type"));
  if (*(_BYTE *)(a1 + 80))
  {
    if (!v6)
    {
      objc_msgSend(v5, "uRL");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v9 = (void *)MEMORY[0x24BDBCE50];
        v10 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v5, "uRL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dataWithContentsOfURL:", v12);
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 81))
  {
    objc_msgSend(v5, "uRL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

LABEL_10:
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v5, "uRL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAttachmentURL:", v15);

      goto LABEL_11;
    }
  }
  if (!v6)
    goto LABEL_10;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "setAttachment:", v6);
LABEL_11:
  if (*(_BYTE *)(a1 + 81)
    && (objc_msgSend(*(id *)(a1 + 40), "additionalAttachments"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "count"),
        v16,
        v17))
  {
    v29 = v6;
    v30 = v5;
    v18 = dispatch_group_create();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "additionalAttachments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          dispatch_group_enter(v18);
          v24 = *(_QWORD *)(a1 + 40);
          v25 = *(_QWORD *)(a1 + 48);
          v26 = *(void **)(a1 + 64);
          v27 = *(_QWORD *)(a1 + 72);
          v35[0] = MEMORY[0x24BDAC760];
          v35[1] = 3221225472;
          v35[2] = __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_2;
          v35[3] = &unk_24D763BF0;
          v36 = *(id *)(a1 + 32);
          v37 = v18;
          objc_msgSend(v26, "_attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:", v23, v24, v25, 2, v27, v35);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v20);
    }

    BLTWorkQueue();
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_3;
    block[3] = &unk_24D761B20;
    v34 = *(id *)(a1 + 56);
    v33 = *(id *)(a1 + 32);
    dispatch_group_notify(v18, v28, block);

    v6 = v29;
    v5 = v30;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addAdditionalAttachments:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __108__BLTPBBulletin_BBBulletin___addAttachmentsFromBBBulletin_toBLTPBBulletin_observer_attachOption_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_fault_impl(&dword_2173D9000, a2, OS_LOG_TYPE_FAULT, "%s could not be retrieved from BulletinBoard!", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __118__BLTPBBulletin_BBBulletin___attachmentFromBBAttachmentMetadata_bulletin_observer_fileOption_attachOption_completion___block_invoke_86_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Error transcoding %@ to %@: %@", (uint8_t *)&v5, 0x20u);
}

@end
