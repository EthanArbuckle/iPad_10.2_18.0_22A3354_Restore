@implementation IMMessageItem

- (BOOL)isTypingMessage
{
  _BOOL4 v3;

  if (-[IMMessageItem wasDetonated](self, "wasDetonated"))
  {
    LOBYTE(v3) = 0;
  }
  else if (-[IMMessageItem isFinished](self, "isFinished"))
  {
    v3 = -[IMMessageItem isFinished](self, "isFinished");
    if (v3)
    {
      v3 = -[IMMessageItem isEmpty](self, "isEmpty");
      if (v3)
        LOBYTE(v3) = !-[IMMessageItem hasEditedParts](self, "hasEditedParts");
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isFinished
{
  return self->_flags & 1;
}

- (BOOL)wasDetonated
{
  return (BYTE4(self->_flags) >> 4) & 1;
}

- (BOOL)isEmpty
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)isLastMessageCandidate
{
  if (-[IMMessageItem scheduleType](self, "scheduleType") != 2)
    return 1;
  if (-[IMMessageItem scheduleState](self, "scheduleState") == 2)
    return 0;
  return -[IMMessageItem scheduleState](self, "scheduleState") != 1;
}

- (IMMessageItem)initWithDictionary:(id)a3
{
  return -[IMMessageItem initWithDictionary:hint:](self, "initWithDictionary:hint:", a3, 0);
}

- (void)_regenerateBodyText
{
  NSAttributedString *body;
  void *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;
  id v7;
  NSAttributedString *v8;
  NSAttributedString *v9;
  id v10;

  body = self->_body;
  self->_body = 0;

  if (-[NSData length](self->_bodyData, "length"))
  {
    v4 = (void *)MEMORY[0x1A1AE8394]();
    JWDecodeCodableObjectWithStandardAllowlist();
    v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_body;
    self->_body = v5;

    objc_autoreleasePoolPop(v4);
  }
  else if (self->_plainBody)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (qword_1ECFC71A0 != -1)
    {
      v10 = v7;
      dispatch_once(&qword_1ECFC71A0, &unk_1E3FB6AD8);
      v7 = v10;
    }
    v8 = (NSAttributedString *)objc_msgSend(v7, "initWithString:attributes:");
    v9 = self->_body;
    self->_body = v8;

  }
  -[IMMessageItem _recalculatePartCount](self, "_recalculatePartCount");
}

- (id)copyDictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  NSString *v5;
  void *v6;
  const __CFString **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
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
  int v23;
  void *v24;
  NSString *v25;
  NSArray *v26;
  void *v27;
  NSDate *timeRead;
  void *v29;
  NSDate *timeDelivered;
  void *v31;
  NSDate *timePlayed;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSDate *timeExpressiveSendPlayed;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSDictionary *bizIntent;
  NSDictionary *v44;
  NSString *locale;
  NSString *v46;
  NSString *biaReferenceID;
  NSString *v48;
  void *v49;
  NSString *notificationIDSTokenURI;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  NSString *retryToParticipant;
  NSString *v56;
  NSString *threadIdentifier;
  IMMessageItem *threadOriginator;
  id v59;
  NSDictionary *replyCountsByPart;
  void *v61;
  void *v62;
  NSDate *dateEdited;
  void *v64;
  TUConversationActivity *groupActivity;
  TUConversationActivity *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFDictionary *v71;
  objc_super v73;
  const __CFString *v74;
  _QWORD v75[3];

  v75[2] = *MEMORY[0x1E0C80C00];
  v73.receiver = self;
  v73.super_class = (Class)IMMessageItem;
  v3 = -[IMItem copyDictionaryRepresentation](&v73, sel_copyDictionaryRepresentation);
  v4 = (void *)MEMORY[0x1A1AE8394]();
  if (!self->_plainBody
    || self->_fileTransferGUIDs
    || -[IMMessageItem hasDataDetectorResults](self, "hasDataDetectorResults"))
  {
    goto LABEL_16;
  }
  v5 = self->_plainBody;
  if (v5)
    CFDictionarySetValue(v3, CFSTR("plainBody"), v5);

  if (-[IMMessageItem isStewie](self, "isStewie"))
  {
    v75[0] = CFSTR("__kIMMentionConfirmedMention");
    v75[1] = CFSTR("__kIMApplyBoldFont");
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = (const __CFString **)v75;
    v8 = 2;
  }
  else
  {
    v74 = CFSTR("__kIMMentionConfirmedMention");
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &v74;
    v8 = 1;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExpressiveTextEnabled");

  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
  {
    if (!v9)
      v9 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v9, "arrayByAddingObject:", CFSTR("__kIMTextEffectAttributeName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "arrayByAddingObject:", CFSTR("__kIMTextBoldAttributeName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "arrayByAddingObject:", CFSTR("__kIMTextItalicAttributeName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "arrayByAddingObject:", CFSTR("__kIMTextUnderlineAttributeName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "arrayByAddingObject:", CFSTR("__kIMTextStrikethroughAttributeName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
    v9 = v12;
  objc_msgSend(v9, "arrayByAddingObject:", CFSTR("__kIMRichCardsAttributeName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "arrayByAddingObject:", CFSTR("__kIMChipListAttributeName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "arrayByAddingObject:", CFSTR("__kIMSuggestedReplyAttributeName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "arrayByAddingObject:", CFSTR("__kIMSuggestedActionAttributeName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "arrayByAddingObject:", CFSTR("__kIMUrlToTransferMapAttributeName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMMessageItem body](self, "body");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "__im_containsAttributedValue:", v21);

  if (v23)
  {
LABEL_16:
    -[IMMessageItem bodyData](self, "bodyData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      CFDictionarySetValue(v3, CFSTR("bodyData"), v24);

  }
  v25 = self->_subject;
  if (v25)
    CFDictionarySetValue(v3, CFSTR("subject"), v25);

  v26 = self->_fileTransferGUIDs;
  if (v26)
    CFDictionarySetValue(v3, CFSTR("fileTransferGUIDs"), v26);

  -[IMMessageItem typingIndicatorIcon](self, "typingIndicatorIcon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("typingIndicatorIcon"), v27);

  timeRead = self->_timeRead;
  if (timeRead)
  {
    -[NSDate timeIntervalSinceReferenceDate](timeRead, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      CFDictionarySetValue(v3, CFSTR("timeRead"), v29);

  }
  timeDelivered = self->_timeDelivered;
  if (timeDelivered)
  {
    -[NSDate timeIntervalSinceReferenceDate](timeDelivered, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      CFDictionarySetValue(v3, CFSTR("timeDelivered"), v31);

  }
  timePlayed = self->_timePlayed;
  if (timePlayed)
  {
    -[NSDate timeIntervalSinceReferenceDate](timePlayed, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      CFDictionarySetValue(v3, CFSTR("timePlayed"), v33);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_flags);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    CFDictionarySetValue(v3, CFSTR("flags"), v34);

  if (self->_expireState)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      CFDictionarySetValue(v3, CFSTR("expireState"), v35);

  }
  if (self->_payloadData)
  {
    -[IMMessageItem payloadData](self, "payloadData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      CFDictionarySetValue(v3, CFSTR("payloadData"), v36);

  }
  if (-[NSString length](self->_expressiveSendStyleID, "length"))
  {
    -[IMMessageItem expressiveSendStyleID](self, "expressiveSendStyleID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      CFDictionarySetValue(v3, CFSTR("expressiveSendStyleID"), v37);

  }
  timeExpressiveSendPlayed = self->_timeExpressiveSendPlayed;
  if (timeExpressiveSendPlayed)
  {
    -[NSDate timeIntervalSinceReferenceDate](timeExpressiveSendPlayed, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      CFDictionarySetValue(v3, CFSTR("timeExpressiveSendPlayed"), v39);

  }
  if (self->_error)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      CFDictionarySetValue(v3, CFSTR("error"), v40);

  }
  if (self->_contactsAvatarRecipeData)
  {
    -[IMMessageItem contactsAvatarRecipeData](self, "contactsAvatarRecipeData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      CFDictionarySetValue(v3, CFSTR("contactsAvatarRecipeData"), v41);

  }
  if (self->_messageSummaryInfo)
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      CFDictionarySetValue(v3, CFSTR("messageSummaryInfo"), v42);

  }
  bizIntent = self->_bizIntent;
  if (bizIntent)
  {
    v44 = bizIntent;
    CFDictionarySetValue(v3, CFSTR("bizIntent"), v44);

  }
  locale = self->_locale;
  if (locale)
  {
    v46 = locale;
    CFDictionarySetValue(v3, CFSTR("locale"), v46);

  }
  biaReferenceID = self->_biaReferenceID;
  if (biaReferenceID)
  {
    v48 = biaReferenceID;
    CFDictionarySetValue(v3, CFSTR("biaReferenceID"), v48);

  }
  if (self->_useStandalone)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
      CFDictionarySetValue(v3, CFSTR("useStandalone"), v49);

  }
  notificationIDSTokenURI = self->_notificationIDSTokenURI;
  if (notificationIDSTokenURI)
  {
    v51 = notificationIDSTokenURI;
    CFDictionarySetValue(v3, CFSTR("notificationnotificationIDSTokenURI"), v51);

  }
  if (self->_shouldSendMeCard)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
      CFDictionarySetValue(v3, CFSTR("shouldSendMeCard"), v52);

  }
  if (self->_shouldNotifyOnSend)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
      CFDictionarySetValue(v3, CFSTR("shouldNotifyOnSend"), v53);

  }
  if (self->_isBeingRetried)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      CFDictionarySetValue(v3, CFSTR("isBeingRetried"), v54);

  }
  retryToParticipant = self->_retryToParticipant;
  if (retryToParticipant)
  {
    v56 = retryToParticipant;
    CFDictionarySetValue(v3, CFSTR("retryToParticipant"), v56);

  }
  threadIdentifier = self->_threadIdentifier;
  if (threadIdentifier)
    -[__CFDictionary setValue:forKey:](v3, "setValue:forKey:", threadIdentifier, CFSTR("threadIdentifier"));
  threadOriginator = self->_threadOriginator;
  if (threadOriginator)
  {
    v59 = -[IMMessageItem copyDictionaryRepresentation](threadOriginator, "copyDictionaryRepresentation");
    -[__CFDictionary setValue:forKey:](v3, "setValue:forKey:", v59, CFSTR("threadOriginator"));

  }
  replyCountsByPart = self->_replyCountsByPart;
  if (replyCountsByPart)
    -[__CFDictionary setValue:forKey:](v3, "setValue:forKey:", replyCountsByPart, CFSTR("replyCountsByPart"));
  if (self->_syndicationRanges)
  {
    +[IMMessagePartSyndicationRange serializedStringFromArray:](IMMessagePartSyndicationRange, "serializedStringFromArray:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setValue:forKey:](v3, "setValue:forKey:", v61, CFSTR("syndicationRanges"));

  }
  if (self->_syncedSyndicationRanges)
  {
    +[IMMessagePartSyndicationRange serializedStringFromArray:](IMMessagePartSyndicationRange, "serializedStringFromArray:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setValue:forKey:](v3, "setValue:forKey:", v62, CFSTR("syncedSyndicationRanges"));

  }
  dateEdited = self->_dateEdited;
  if (dateEdited)
  {
    -[NSDate timeIntervalSinceReferenceDate](dateEdited, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
      CFDictionarySetValue(v3, CFSTR("dateEdited"), v64);

  }
  groupActivity = self->_groupActivity;
  if (groupActivity)
  {
    v66 = groupActivity;
    CFDictionarySetValue(v3, CFSTR("groupActivity"), v66);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_partCount);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v67, CFSTR("partCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_replaceID);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v68, CFSTR("replaceID"));

  -[__CFDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", self->_fallbackHash, CFSTR("fallbackHash"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_scheduleType);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v69, CFSTR("scheduleType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_scheduleState);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v70, CFSTR("scheduleState"));

  objc_autoreleasePoolPop(v4);
  v71 = v3;

  return v71;
}

- (NSData)typingIndicatorIcon
{
  return self->_typingIndicatorIcon;
}

- (BOOL)isStewie
{
  void *v3;
  int v4;
  _BOOL4 v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (v4)
  {
    if (-[IMMessageItem stewieConversationID](self, "stewieConversationID") < 0)
      return (BYTE4(self->_flags) >> 1) & 1;
    else
      LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (int64_t)stewieConversationID
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return -1;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("stid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || objc_msgSend(v6, "integerValue") < 0)
    v7 = -1;
  else
    v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (BOOL)hasDataDetectorResults
{
  return BYTE2(self->_flags) & 1;
}

- (NSAttributedString)body
{
  -[IMMessageItem _generateBodyTextIfNeeded](self, "_generateBodyTextIfNeeded");
  return self->_body;
}

- (void)_generateBodyTextIfNeeded
{
  if ((self->_bodyData || self->_plainBody) && !self->_body)
    MEMORY[0x1E0DE7D20](self, sel__regenerateBodyText);
}

- (IMMessageItem)initWithDictionary:(id)a3 hint:(id)a4
{
  id v6;
  id v7;
  IMMessageItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *plainBody;
  uint64_t v29;
  NSData *typingIndicatorIcon;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  IMMessageItem *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  objc_super v71;

  v6 = a3;
  v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)IMMessageItem;
  v8 = -[IMItem initWithDictionary:](&v71, sel_initWithDictionary_, v6);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("bodyData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setBodyData:](v8, "setBodyData:", v9);

    objc_msgSend(v6, "objectForKey:", CFSTR("subject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setSubject:](v8, "setSubject:", v10);

    objc_msgSend(v6, "objectForKey:", CFSTR("fileTransferGUIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setFileTransferGUIDs:](v8, "setFileTransferGUIDs:", v11);

    objc_msgSend(v6, "objectForKey:", CFSTR("timeRead"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (v14 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimeRead:](v8, "setTimeRead:", v15);

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("timeDelivered"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    if (v18 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimeDelivered:](v8, "setTimeDelivered:", v19);

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("timePlayed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    if (v22 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimePlayed:](v8, "setTimePlayed:", v23);

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("flags"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_flags = objc_msgSend(v24, "unsignedLongLongValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("expireState"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_expireState = objc_msgSend(v25, "longLongValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("error"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_error = objc_msgSend(v26, "unsignedIntValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("plainBody"));
    v27 = objc_claimAutoreleasedReturnValue();
    plainBody = v8->_plainBody;
    v8->_plainBody = (NSString *)v27;

    objc_msgSend(v6, "objectForKey:", CFSTR("typingIndicatorIcon"));
    v29 = objc_claimAutoreleasedReturnValue();
    typingIndicatorIcon = v8->_typingIndicatorIcon;
    v8->_typingIndicatorIcon = (NSData *)v29;

    objc_msgSend(v6, "objectForKey:", CFSTR("payloadData"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setPayloadData:](v8, "setPayloadData:", v31);

    objc_msgSend(v6, "objectForKey:", CFSTR("balloonBundleID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setBalloonBundleID:](v8, "setBalloonBundleID:", v32);

    objc_msgSend(v6, "objectForKey:", CFSTR("expressiveSendStyleID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setExpressiveSendStyleID:](v8, "setExpressiveSendStyleID:", v33);

    objc_msgSend(v6, "objectForKey:", CFSTR("timeExpressiveSendPlayed"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v35;

    if (v36 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimeExpressiveSendPlayed:](v8, "setTimeExpressiveSendPlayed:", v37);

    }
    if (-[IMMessageItem isEqual:](v8, "isEqual:", v7))
    {
      objc_msgSend(v7, "body");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setBody:](v8, "setBody:", v38);

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("contactsAvatarRecipeData"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setContactsAvatarRecipeData:](v8, "setContactsAvatarRecipeData:", v39);

    objc_msgSend(v6, "objectForKey:", CFSTR("messageSummaryInfo"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setMessageSummaryInfo:](v8, "setMessageSummaryInfo:", v40);

    objc_msgSend(v6, "objectForKey:", CFSTR("bizIntent"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setBizIntent:](v8, "setBizIntent:", v41);

    objc_msgSend(v6, "objectForKey:", CFSTR("locale"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setLocale:](v8, "setLocale:", v42);

    objc_msgSend(v6, "objectForKey:", CFSTR("biaReferenceID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setBiaReferenceID:](v8, "setBiaReferenceID:", v43);

    objc_msgSend(v6, "objectForKey:", CFSTR("useStandalone"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setUseStandalone:](v8, "setUseStandalone:", objc_msgSend(v44, "BOOLValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("notificationnotificationIDSTokenURI"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setNotificationIDSTokenURI:](v8, "setNotificationIDSTokenURI:", v45);

    objc_msgSend(v6, "objectForKey:", CFSTR("shouldSendMeCard"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setShouldSendMeCard:](v8, "setShouldSendMeCard:", objc_msgSend(v46, "BOOLValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("shouldNotifyOnSend"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setShouldNotifyOnSend:](v8, "setShouldNotifyOnSend:", objc_msgSend(v47, "BOOLValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("isBeingRetried"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setIsBeingRetried:](v8, "setIsBeingRetried:", objc_msgSend(v48, "BOOLValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("retryToParticipant"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setRetryToParticipant:](v8, "setRetryToParticipant:", v49);

    objc_msgSend(v6, "objectForKey:", CFSTR("threadIdentifier"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setThreadIdentifier:](v8, "setThreadIdentifier:", v50);

    -[IMMessageItem setThreadOriginator:](v8, "setThreadOriginator:", 0);
    if (-[IMMessageItem isReply](v8, "isReply"))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("threadOriginator"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        v52 = -[IMMessageItem initWithDictionary:hint:]([IMMessageItem alloc], "initWithDictionary:hint:", v51, 0);
        -[IMMessageItem setThreadOriginator:](v8, "setThreadOriginator:", v52);

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("replyCountsByPart"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setReplyCountsByPart:](v8, "setReplyCountsByPart:", v53);

    objc_msgSend(v6, "objectForKey:", CFSTR("syndicationRanges"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMMessagePartSyndicationRange rangesFromSerializedString:](IMMessagePartSyndicationRange, "rangesFromSerializedString:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setSyndicationRanges:](v8, "setSyndicationRanges:", v55);

    objc_msgSend(v6, "objectForKey:", CFSTR("syncedSyndicationRanges"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMMessagePartSyndicationRange rangesFromSerializedString:](IMMessagePartSyndicationRange, "rangesFromSerializedString:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setSyncedSyndicationRanges:](v8, "setSyncedSyndicationRanges:", v57);

    objc_msgSend(v6, "objectForKey:", CFSTR("dateEdited"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "doubleValue");
    v60 = v59;

    if (v60 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setDateEdited:](v8, "setDateEdited:", v61);

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("partCount"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setPartCount:](v8, "setPartCount:", objc_msgSend(v62, "unsignedIntegerValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("groupActivity"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setGroupActivity:](v8, "setGroupActivity:", v63);

    objc_msgSend(v6, "objectForKey:", CFSTR("replaceID"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setReplaceID:](v8, "setReplaceID:", objc_msgSend(v64, "longLongValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("fallbackHash"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setFallbackHash:](v8, "setFallbackHash:", v65);

    objc_msgSend(v6, "objectForKey:", CFSTR("scheduleType"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "doubleValue");
    -[IMMessageItem setScheduleType:](v8, "setScheduleType:", (unint64_t)v67);

    objc_msgSend(v6, "objectForKey:", CFSTR("scheduleState"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "doubleValue");
    -[IMMessageItem setScheduleState:](v8, "setScheduleState:", (unint64_t)v69);

  }
  return v8;
}

- (void)setUseStandalone:(BOOL)a3
{
  self->_useStandalone = a3;
}

- (void)setThreadOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_threadOriginator, a3);
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void)setSyndicationRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void)setSyncedSyndicationRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void)setSubject:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_subject != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subject, a3);
    -[IMMessageItem adjustIsEmptyFlag](self, "adjustIsEmptyFlag");
    v5 = v6;
  }

}

- (void)setShouldSendMeCard:(BOOL)a3
{
  self->_shouldSendMeCard = a3;
}

- (void)setShouldNotifyOnSend:(BOOL)a3
{
  self->_shouldNotifyOnSend = a3;
}

- (void)setRetryToParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_retryToParticipant, a3);
}

- (void)setReplyCountsByPart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void)setReplaceID:(int64_t)a3
{
  self->_replaceID = a3;
}

- (void)setPayloadData:(id)a3
{
  NSData *v5;
  NSData *v6;

  v5 = (NSData *)a3;
  if (self->_payloadData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_payloadData, a3);
    -[IMMessageItem adjustIsEmptyFlag](self, "adjustIsEmptyFlag");
    v5 = v6;
  }

}

- (void)setPartCount:(unint64_t)a3
{
  self->_partCount = a3;
}

- (void)setNotificationIDSTokenURI:(id)a3
{
  objc_storeStrong((id *)&self->_notificationIDSTokenURI, a3);
}

- (void)setMessageSummaryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_messageSummaryInfo, a3);
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setIsBeingRetried:(BOOL)a3
{
  self->_isBeingRetried = a3;
}

- (void)setGroupActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void)setFileTransferGUIDs:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_fileTransferGUIDs != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fileTransferGUIDs, a3);
    -[IMMessageItem adjustIsEmptyFlag](self, "adjustIsEmptyFlag");
    v5 = v6;
  }

}

- (void)setFallbackHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void)setExpressiveSendStyleID:(id)a3
{
  objc_storeStrong((id *)&self->_expressiveSendStyleID, a3);
}

- (void)setContactsAvatarRecipeData:(id)a3
{
  objc_storeStrong((id *)&self->_contactsAvatarRecipeData, a3);
}

- (void)setBodyData:(id)a3
{
  objc_storeStrong((id *)&self->_bodyData, a3);
}

- (void)setBizIntent:(id)a3
{
  objc_storeStrong((id *)&self->_bizIntent, a3);
}

- (void)setBiaReferenceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (BOOL)isReply
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IMMessageItem threadIdentifier](self, "threadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[IMMessageItem threadIdentifier](self, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  IMMessageItem *v5;
  IMMessageItem *v6;
  unint64_t flags;
  int64_t replaceID;
  NSString *subject;
  NSString *v10;
  NSString *v11;
  unsigned __int8 v12;
  NSData *bodyData;
  uint64_t v15;
  NSData *v16;
  NSData *v17;
  void *v18;
  NSData *v19;
  NSString *v20;
  NSDate *timeRead;
  NSDate *v22;
  NSDate *v23;
  uint64_t v24;
  NSDate *v25;
  void *v26;
  NSDate *timeDelivered;
  NSDate *v28;
  uint64_t v29;
  NSDate *v30;
  void *v31;
  NSDate *v32;
  void *v33;
  NSAttributedString *body;
  uint64_t v35;
  NSAttributedString *v36;
  void *v37;
  NSData *v38;
  char v39;
  NSDate *timePlayed;
  NSDate *v41;
  void *v42;
  NSArray *fileTransferGUIDs;
  NSArray *v44;
  NSData *v45;
  int64_t expireState;
  NSString *expressiveSendStyleID;
  NSString *v48;
  NSString *v49;
  NSDate *v50;
  NSArray *v51;
  void *v52;
  NSDate *timeExpressiveSendPlayed;
  NSDate *v54;
  void *v55;
  unsigned int error;
  NSString *threadIdentifier;
  NSString *v58;
  IMMessageItem *threadOriginator;
  uint64_t v60;
  IMMessageItem *v61;
  void *v62;
  NSDictionary *replyCountsByPart;
  NSDictionary *v64;
  NSDictionary *v65;
  NSArray *syndicationRanges;
  NSArray *v67;
  NSArray *v68;
  NSArray *syncedSyndicationRanges;
  NSArray *v70;
  void *v71;
  NSDate *dateEdited;
  NSDate *v73;
  NSDate *v74;
  NSString *fallbackHash;
  uint64_t v76;
  void *v77;
  NSString *v78;
  void *v79;
  void *v80;
  NSDate *v81;
  void *v82;
  NSArray *v83;
  void *v84;
  uint64_t v85;
  NSArray *v86;
  NSData *v87;
  NSString *v88;
  void *v89;
  NSDictionary *v90;
  void *v91;
  IMMessageItem *v92;
  IMMessageItem *v93;
  void *v94;
  NSString *v95;
  void *v96;
  NSDate *v97;
  void *v98;
  uint64_t v99;
  NSString *v100;
  NSString *v101;
  NSDate *v102;
  void *v103;
  void *v104;
  void *v105;
  NSArray *v106;
  void *v107;
  NSArray *v108;
  void *v109;
  NSDate *v110;
  void *v111;
  NSDate *v112;
  NSDate *v113;
  NSDate *v114;
  void *v115;
  uint64_t v116;
  NSData *v117;
  NSString *v118;
  objc_super v119;
  objc_super v120;

  v5 = (IMMessageItem *)a3;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v120.receiver = self;
      v120.super_class = (Class)IMMessageItem;
      if (!-[IMItem isEqual:](&v120, sel_isEqual_, v6)
        || (flags = self->_flags, flags != -[IMMessageItem flags](v6, "flags"))
        || (replaceID = self->_replaceID, replaceID != -[IMMessageItem replaceID](v6, "replaceID")))
      {
        v12 = 0;
LABEL_12:

        goto LABEL_13;
      }
      subject = self->_subject;
      -[IMMessageItem subject](v6, "subject");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (subject != v10)
      {
        v11 = self->_subject;
        -[IMMessageItem subject](v6, "subject");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v11, "isEqualToString:", v3))
        {
          v12 = 0;
          goto LABEL_60;
        }
      }
      bodyData = self->_bodyData;
      -[IMMessageItem bodyData](v6, "bodyData");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (NSData *)v15;
      v117 = bodyData;
      v118 = v10;
      if (bodyData == (NSData *)v15)
      {
        v19 = (NSData *)v15;
        v20 = subject;
        v116 = 0;
      }
      else
      {
        v17 = self->_bodyData;
        -[IMMessageItem bodyData](v6, "bodyData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSData isEqualToData:](v17, "isEqualToData:", v18))
        {
          v19 = v16;
          v20 = subject;
          v115 = v18;
          v116 = 0;
        }
        else
        {
          body = self->_body;
          -[IMMessageItem body](v6, "body");
          v35 = objc_claimAutoreleasedReturnValue();
          if (body == (NSAttributedString *)v35)
          {
            v19 = v16;
            v20 = subject;
            v115 = v18;
            v116 = 0x100000000;
            v111 = body;
          }
          else
          {
            v111 = (void *)v35;
            v36 = self->_body;
            -[IMMessageItem body](v6, "body");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[NSAttributedString isEqualToAttributedString:](v36, "isEqualToAttributedString:", v37))
            {

              v12 = 0;
              goto LABEL_59;
            }
            v19 = v16;
            v20 = subject;
            v107 = v37;
            v115 = v18;
            v116 = 0x100000001;
          }
        }
      }
      timeRead = self->_timeRead;
      -[IMMessageItem timeRead](v6, "timeRead");
      v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (timeRead != v22)
      {
        v23 = self->_timeRead;
        -[IMMessageItem timeRead](v6, "timeRead");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v23;
        v26 = (void *)v24;
        if (!-[NSDate isEqualToDate:](v25, "isEqualToDate:", v24))
        {

          v12 = 0;
          v38 = v117;
          v39 = v116;
          subject = v20;
          goto LABEL_65;
        }
        v109 = v26;
      }
      timeDelivered = self->_timeDelivered;
      -[IMMessageItem timeDelivered](v6, "timeDelivered");
      v113 = timeDelivered;
      v114 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (timeDelivered == v114)
      {
        v33 = v3;
        v32 = timeRead;
LABEL_29:
        timePlayed = self->_timePlayed;
        -[IMMessageItem timePlayed](v6, "timePlayed");
        v112 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v110 = timePlayed;
        if (timePlayed != v112)
        {
          v41 = self->_timePlayed;
          -[IMMessageItem timePlayed](v6, "timePlayed");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSDate isEqualToDate:](v41, "isEqualToDate:", v42))
          {

            v3 = v33;
            if (v113 == v114)
            {

            }
            else
            {

            }
            subject = v20;
            if (v32 != v22)

            v12 = 0;
            v45 = v19;
            v38 = v117;
            v10 = v118;
            if ((v116 & 1) != 0)
              goto LABEL_66;
LABEL_54:
            v52 = v115;
            if (!HIDWORD(v116))
            {
LABEL_56:
              if (v38 != v45)

LABEL_59:
              if (subject == v10)
              {
LABEL_61:

                goto LABEL_12;
              }
LABEL_60:

              goto LABEL_61;
            }
LABEL_55:

            goto LABEL_56;
          }
          v103 = v42;
        }
        fileTransferGUIDs = self->_fileTransferGUIDs;
        -[IMMessageItem fileTransferGUIDs](v6, "fileTransferGUIDs");
        v108 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v106 = fileTransferGUIDs;
        if (fileTransferGUIDs == v108)
        {
          subject = v20;
          v45 = v19;
          v10 = v118;
        }
        else
        {
          v44 = self->_fileTransferGUIDs;
          -[IMMessageItem fileTransferGUIDs](v6, "fileTransferGUIDs");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          subject = v20;
          v45 = v19;
          v10 = v118;
          if (!-[NSArray isEqualToArray:](v44, "isEqualToArray:"))
            goto LABEL_46;
        }
        expireState = self->_expireState;
        if (expireState != -[IMMessageItem expireState](v6, "expireState"))
        {
          if (v106 == v108)
          {
            v51 = v106;
LABEL_47:

            if (v110 != v112)
            v3 = v33;
            if (v113 != v114)

            if (v32 != v22)
            v12 = 0;
            v38 = v117;
            if ((v116 & 1) == 0)
              goto LABEL_54;
LABEL_66:

            v52 = v115;
            if ((v116 & 0x100000000) == 0)
              goto LABEL_56;
            goto LABEL_55;
          }
LABEL_46:

          v51 = v108;
          goto LABEL_47;
        }
        v102 = v32;
        expressiveSendStyleID = self->_expressiveSendStyleID;
        -[IMMessageItem expressiveSendStyleID](v6, "expressiveSendStyleID");
        v100 = expressiveSendStyleID;
        v101 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (expressiveSendStyleID != v101)
        {
          v48 = self->_expressiveSendStyleID;
          -[IMMessageItem expressiveSendStyleID](v6, "expressiveSendStyleID");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](v48, "isEqualToString:"))
          {
            v12 = 0;
            v3 = v33;
            v49 = v101;
            v50 = v102;
LABEL_118:

LABEL_119:
            if (v106 != v108)

            if (v110 != v112)
            if (v113 != v114)

            if (v50 != v22)
            v38 = v117;
            if ((v116 & 1) != 0)
              goto LABEL_66;
            goto LABEL_54;
          }
        }
        timeExpressiveSendPlayed = self->_timeExpressiveSendPlayed;
        -[IMMessageItem timeExpressiveSendPlayed](v6, "timeExpressiveSendPlayed");
        v99 = objc_claimAutoreleasedReturnValue();
        v97 = timeExpressiveSendPlayed;
        if (timeExpressiveSendPlayed == (NSDate *)v99)
        {
          v50 = v102;
        }
        else
        {
          v54 = self->_timeExpressiveSendPlayed;
          -[IMMessageItem timeExpressiveSendPlayed](v6, "timeExpressiveSendPlayed");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v102;
          if (!-[NSDate isEqualToDate:](v54, "isEqualToDate:"))
          {
            v12 = 0;
            v3 = v33;
            v55 = (void *)v99;
            goto LABEL_116;
          }
        }
        error = self->_error;
        if (error != -[IMMessageItem errorCode](v6, "errorCode"))
        {
          v3 = v33;
          if (v97 == (NSDate *)v99)
          {

            v12 = 0;
            goto LABEL_117;
          }
          v12 = 0;
          v55 = (void *)v99;
LABEL_116:

LABEL_117:
          v49 = v101;
          if (v100 == v101)
            goto LABEL_119;
          goto LABEL_118;
        }
        threadIdentifier = self->_threadIdentifier;
        -[IMMessageItem threadIdentifier](v6, "threadIdentifier");
        v58 = (NSString *)objc_claimAutoreleasedReturnValue();
        v3 = v33;
        if (threadIdentifier != v58)
        {

          v12 = 0;
          v55 = (void *)v99;
          v50 = v102;
          if (v97 != (NSDate *)v99)
            goto LABEL_116;
          goto LABEL_129;
        }
        v94 = v33;
        v95 = threadIdentifier;
        threadOriginator = self->_threadOriginator;
        -[IMMessageItem threadOriginator](v6, "threadOriginator");
        v60 = objc_claimAutoreleasedReturnValue();
        v93 = threadOriginator;
        if (threadOriginator != (IMMessageItem *)v60)
        {
          v61 = self->_threadOriginator;
          -[IMMessageItem threadOriginator](v6, "threadOriginator");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[IMMessageItem isEqual:](v61, "isEqual:"))
          {
            v12 = 0;
            v3 = v94;
            v62 = (void *)v60;
            v50 = v102;
LABEL_114:

LABEL_115:
            v55 = (void *)v99;
            if (v97 != (NSDate *)v99)
              goto LABEL_116;
LABEL_129:

            if (v100 != v101)
            if (v106 != v108)

            if (v110 != v112)
            if (v113 != v114)

            if (v50 != v22)
            v38 = v117;
            if ((_DWORD)v116)
              goto LABEL_66;
            goto LABEL_54;
          }
        }
        v92 = (IMMessageItem *)v60;
        replyCountsByPart = self->_replyCountsByPart;
        -[IMMessageItem replyCountsByPart](v6, "replyCountsByPart");
        v64 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        v90 = replyCountsByPart;
        if (replyCountsByPart == v64)
        {
          v87 = v45;
          v88 = subject;
        }
        else
        {
          v65 = self->_replyCountsByPart;
          -[IMMessageItem replyCountsByPart](v6, "replyCountsByPart");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSDictionary isEqualToDictionary:](v65, "isEqualToDictionary:"))
          {
            v12 = 0;
            v3 = v94;
            v50 = v102;
LABEL_112:

LABEL_113:
            v62 = v92;
            if (v93 == v92)
              goto LABEL_115;
            goto LABEL_114;
          }
          v87 = v45;
          v88 = subject;
        }
        syndicationRanges = self->_syndicationRanges;
        -[IMMessageItem syndicationRanges](v6, "syndicationRanges");
        v67 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v86 = syndicationRanges;
        if (syndicationRanges != v67)
        {
          v68 = self->_syndicationRanges;
          -[IMMessageItem syndicationRanges](v6, "syndicationRanges");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSArray isEqualToArray:](v68, "isEqualToArray:"))
          {
            v12 = 0;
LABEL_110:

LABEL_111:
            v3 = v94;
            v50 = v102;
            v45 = v87;
            subject = v88;
            v10 = v118;
            if (v90 == v64)
              goto LABEL_113;
            goto LABEL_112;
          }
        }
        syncedSyndicationRanges = self->_syncedSyndicationRanges;
        -[IMMessageItem syncedSyndicationRanges](v6, "syncedSyndicationRanges");
        v83 = syncedSyndicationRanges;
        v85 = objc_claimAutoreleasedReturnValue();
        if (syncedSyndicationRanges != (NSArray *)v85)
        {
          v70 = self->_syncedSyndicationRanges;
          -[IMMessageItem syncedSyndicationRanges](v6, "syncedSyndicationRanges");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSArray isEqualToArray:](v70, "isEqualToArray:"))
          {
            v12 = 0;
            v71 = (void *)v85;
LABEL_108:

LABEL_109:
            if (v86 == v67)
              goto LABEL_111;
            goto LABEL_110;
          }
        }
        dateEdited = self->_dateEdited;
        -[IMMessageItem dateEdited](v6, "dateEdited");
        v73 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v81 = dateEdited;
        if (dateEdited == v73
          || (v74 = self->_dateEdited,
              -[IMMessageItem dateEdited](v6, "dateEdited"),
              v80 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSDate isEqualToDate:](v74, "isEqualToDate:")))
        {
          fallbackHash = self->_fallbackHash;
          -[IMMessageItem fallbackHash](v6, "fallbackHash");
          v76 = objc_claimAutoreleasedReturnValue();
          if (fallbackHash == (NSString *)v76)
          {

            v12 = 1;
          }
          else
          {
            v77 = (void *)v76;
            v78 = self->_fallbackHash;
            -[IMMessageItem fallbackHash](v6, "fallbackHash");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[NSString isEqualToString:](v78, "isEqualToString:", v79);

          }
          if (v81 == v73)
          {
LABEL_107:

            v71 = (void *)v85;
            if (v83 == (NSArray *)v85)
              goto LABEL_109;
            goto LABEL_108;
          }
        }
        else
        {
          v12 = 0;
        }

        goto LABEL_107;
      }
      v28 = self->_timeDelivered;
      -[IMMessageItem timeDelivered](v6, "timeDelivered");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v28;
      v31 = (void *)v29;
      v32 = timeRead;
      if (-[NSDate isEqualToDate:](v30, "isEqualToDate:", v29))
      {
        v105 = v31;
        v33 = v3;
        goto LABEL_29;
      }

      subject = v20;
      if (v32 == v22)
      {

      }
      else
      {

      }
      v12 = 0;
      v38 = v117;
      v39 = v116;
LABEL_65:
      v45 = v19;
      v10 = v118;
      if ((v39 & 1) == 0)
        goto LABEL_54;
      goto LABEL_66;
    }
    v119.receiver = self;
    v119.super_class = (Class)IMMessageItem;
    v12 = -[IMItem isEqual:](&v119, sel_isEqual_, v5);
  }
LABEL_13:

  return v12;
}

- (void)setTimeRead:(id)a3
{
  objc_storeStrong((id *)&self->_timeRead, a3);
}

- (void)setTimeDelivered:(id)a3
{
  objc_storeStrong((id *)&self->_timeDelivered, a3);
}

- (BOOL)isFromMe
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSDate)timeRead
{
  return self->_timeRead;
}

- (NSDate)timePlayed
{
  return self->_timePlayed;
}

- (NSDate)timeExpressiveSendPlayed
{
  return self->_timeExpressiveSendPlayed;
}

- (NSDate)timeDelivered
{
  return self->_timeDelivered;
}

- (IMMessageItem)threadOriginator
{
  return self->_threadOriginator;
}

- (NSArray)syndicationRanges
{
  return self->_syndicationRanges;
}

- (NSArray)syncedSyndicationRanges
{
  return self->_syncedSyndicationRanges;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)plainBody
{
  return self->_plainBody;
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (id)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (NSString)expressiveSendStyleID
{
  return self->_expressiveSendStyleID;
}

- (unsigned)errorCode
{
  return self->_error;
}

- (NSDate)dateEdited
{
  return self->_dateEdited;
}

- (NSData)bodyData
{
  -[IMMessageItem _generateBodyDataIfNeeded](self, "_generateBodyDataIfNeeded");
  return self->_bodyData;
}

- (void)adjustIsEmptyFlag
{
  void *v3;
  unint64_t v4;
  id v5;

  if (self->_body || self->_subject || -[NSData length](self->_payloadData, "length"))
  {
    -[IMMessageItem body](self, "body");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (-[NSString length](self->_subject, "length")
      || objc_msgSend(v5, "length")
      || -[NSArray count](self->_fileTransferGUIDs, "count")
      || -[NSData length](self->_payloadData, "length"))
    {
      if (!-[IMMessageItem isEmpty](self, "isEmpty"))
      {
LABEL_11:

        return;
      }
      v4 = self->_flags & 0xFFFFFFFFFFFFFFF7;
    }
    else
    {
      v4 = self->_flags | 8;
    }
    self->_flags = v4;
    goto LABEL_11;
  }
  if (-[IMMessageItem wasDetonated](self, "wasDetonated") || -[NSArray count](self->_fileTransferGUIDs, "count"))
  {
    if (-[IMMessageItem isEmpty](self, "isEmpty"))
      self->_flags &= ~8uLL;
  }
}

- (void)_recalculatePartCount
{
  if (-[NSAttributedString length](self->_body, "length"))
  {
    self->_partCount = -[NSAttributedString __im_countMessageParts](self->_body, "__im_countMessageParts");
  }
  else if (-[NSString length](self->_plainBody, "length"))
  {
    self->_partCount = 1;
  }
  else
  {
    self->_partCount = 0;
  }
}

- (void)_generateBodyDataIfNeeded
{
  if (!self->_bodyData)
    MEMORY[0x1E0DE7D20](self, sel__regenerateBodyData);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyCountsByPart, 0);
  objc_storeStrong((id *)&self->_suggestedAuthorAvatarPath, 0);
  objc_storeStrong((id *)&self->_suggestedAuthorName, 0);
  objc_storeStrong((id *)&self->_notificationIDSTokenURI, 0);
  objc_storeStrong((id *)&self->_retryToParticipant, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_translatedText, 0);
  objc_storeStrong((id *)&self->_fallbackHash, 0);
  objc_storeStrong((id *)&self->_groupActivity, 0);
  objc_storeStrong((id *)&self->_dateEdited, 0);
  objc_storeStrong((id *)&self->_syncedSyndicationRanges, 0);
  objc_storeStrong((id *)&self->_syndicationRanges, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_biaReferenceID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_typingIndicatorIcon, 0);
  objc_storeStrong((id *)&self->_timeExpressiveSendPlayed, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleID, 0);
  objc_storeStrong((id *)&self->_contactsAvatarRecipeData, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_timePlayed, 0);
  objc_storeStrong((id *)&self->_timeDelivered, 0);
  objc_storeStrong((id *)&self->_timeRead, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_plainBody, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)IMMessageItem;
  v4 = -[IMItem copyWithZone:](&v33, sel_copyWithZone_, a3);
  -[IMMessageItem plainBody](self, "plainBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlainBody:", v5);

  -[IMMessageItem timeRead](self, "timeRead");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeRead:", v6);

  -[IMMessageItem timeDelivered](self, "timeDelivered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeDelivered:", v7);

  -[IMMessageItem timePlayed](self, "timePlayed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimePlayed:", v8);

  -[IMMessageItem body](self, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v9);

  -[IMMessageItem bodyData](self, "bodyData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyData:", v10);

  -[IMMessageItem subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubject:", v11);

  objc_msgSend(v4, "setErrorCode:", -[IMMessageItem errorCode](self, "errorCode"));
  -[IMMessageItem fileTransferGUIDs](self, "fileTransferGUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileTransferGUIDs:", v12);

  objc_msgSend(v4, "setReplaceID:", -[IMMessageItem replaceID](self, "replaceID"));
  objc_msgSend(v4, "setExpireState:", -[IMMessageItem expireState](self, "expireState"));
  -[IMMessageItem payloadData](self, "payloadData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadData:", v13);

  -[IMMessageItem expressiveSendStyleID](self, "expressiveSendStyleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpressiveSendStyleID:", v14);

  -[IMMessageItem timeExpressiveSendPlayed](self, "timeExpressiveSendPlayed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeExpressiveSendPlayed:", v15);

  -[IMMessageItem typingIndicatorIcon](self, "typingIndicatorIcon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypingIndicatorIcon:", v16);

  -[IMMessageItem contactsAvatarRecipeData](self, "contactsAvatarRecipeData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactsAvatarRecipeData:", v17);

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageSummaryInfo:", v18);

  -[IMMessageItem bizIntent](self, "bizIntent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBizIntent:", v19);

  -[IMMessageItem locale](self, "locale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v20);

  -[IMMessageItem biaReferenceID](self, "biaReferenceID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBiaReferenceID:", v21);

  objc_msgSend(v4, "setUseStandalone:", -[IMMessageItem useStandalone](self, "useStandalone"));
  -[IMMessageItem notificationIDSTokenURI](self, "notificationIDSTokenURI");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationIDSTokenURI:", v22);

  objc_msgSend(v4, "setIsCorrupt:", -[IMMessageItem isCorrupt](self, "isCorrupt"));
  objc_msgSend(v4, "setIsSpam:", -[IMMessageItem isSpam](self, "isSpam"));
  objc_msgSend(v4, "setHasUnseenMention:", -[IMMessageItem hasUnseenMention](self, "hasUnseenMention"));
  objc_msgSend(v4, "setShouldSendMeCard:", -[IMMessageItem shouldSendMeCard](self, "shouldSendMeCard"));
  objc_msgSend(v4, "setShouldNotifyOnSend:", -[IMMessageItem shouldNotifyOnSend](self, "shouldNotifyOnSend"));
  objc_msgSend(v4, "setIsBeingRetried:", -[IMMessageItem isBeingRetried](self, "isBeingRetried"));
  -[IMMessageItem retryToParticipant](self, "retryToParticipant");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRetryToParticipant:", v23);

  -[IMMessageItem threadIdentifier](self, "threadIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThreadIdentifier:", v24);

  -[IMMessageItem threadOriginator](self, "threadOriginator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThreadOriginator:", v25);

  -[IMMessageItem replyCountsByPart](self, "replyCountsByPart");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReplyCountsByPart:", v26);

  -[IMMessageItem syndicationRanges](self, "syndicationRanges");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSyndicationRanges:", v27);

  -[IMMessageItem syncedSyndicationRanges](self, "syncedSyndicationRanges");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSyncedSyndicationRanges:", v28);

  -[IMMessageItem dateEdited](self, "dateEdited");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateEdited:", v29);

  -[IMMessageItem groupActivity](self, "groupActivity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupActivity:", v30);

  -[IMMessageItem fallbackHash](self, "fallbackHash");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFallbackHash:", v31);

  objc_msgSend(v4, "setIsKeyTransparencyVerifiedMessage:", -[IMMessageItem isKeyTransparencyVerifiedMessage](self, "isKeyTransparencyVerifiedMessage"));
  objc_msgSend(v4, "setScheduleType:", -[IMMessageItem scheduleType](self, "scheduleType"));
  objc_msgSend(v4, "setScheduleState:", -[IMMessageItem scheduleState](self, "scheduleState"));
  objc_msgSend(v4, "setSelectedRichCardIndex:", -[IMMessageItem selectedRichCardIndex](self, "selectedRichCardIndex"));
  return v4;
}

- (id)copyWithFlags:(unint64_t)a3
{
  void *v4;

  v4 = (void *)-[IMMessageItem copy](self, "copy");
  objc_msgSend(v4, "_updateFlags:", a3);
  return v4;
}

- (id)copyAsReplied
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  IMChipList *v10;
  void *v11;
  void *v12;

  v3 = -[IMMessageItem copyWithFlags:](self, "copyWithFlags:", -[IMMessageItem flags](self, "flags"));
  -[IMMessageItem body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v4, "length") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("\uFFFF"));

    if (v7)
    {
      objc_msgSend(v4, "attributesAtIndex:effectiveRange:", objc_msgSend(v4, "length") - 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_arrayForKey:", CFSTR("__kIMChipListAttributeName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[IMChipList initWithChipArray:replied:]([IMChipList alloc], "initWithChipArray:replied:", v9, 1);
      v11 = (void *)objc_msgSend(v4, "mutableCopy");
      -[IMChipList dictionaryRepresentation](v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttributes:range:", v12, objc_msgSend(v11, "length") - 1, 1);

      objc_msgSend(v3, "setBody:", v11);
    }
  }

  return v3;
}

- (id)copyForBackwardsCompatibility
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v3 = (void *)-[IMMessageItem copy](self, "copy");
  objc_msgSend(v3, "setPayloadData:", 0);
  objc_msgSend(v3, "setBalloonBundleID:", 0);
  objc_msgSend(v3, "setExpressiveSendStyleID:", 0);
  objc_msgSend(v3, "setTimeExpressiveSendPlayed:", 0);
  objc_msgSend(v3, "setFlags:", -[IMMessageItem flags](self, "flags") & 0x200005 | objc_msgSend(v3, "flags"));
  objc_msgSend(v3, "setContactsAvatarRecipeData:", 0);
  objc_msgSend(v3, "setMessageSummaryInfo:", 0);
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", *MEMORY[0x1E0D36318]);
  v8 = v7;

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v3, "body");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithAttributedString:", v10);

    objc_msgSend(v11, "deleteCharactersInRange:", v6, v8);
    objc_msgSend(v3, "setBody:", v11);

  }
  objc_msgSend(v3, "setThreadIdentifier:", 0);
  objc_msgSend(v3, "setThreadOriginator:", 0);
  objc_msgSend(v3, "setReplyCountsByPart:", 0);
  objc_msgSend(v3, "setBackwardsCompatibleVersion:", 1);
  objc_msgSend(v3, "setSyndicationRanges:", 0);
  objc_msgSend(v3, "setSyncedSyndicationRanges:", 0);
  objc_msgSend(v3, "setDateEdited:", 0);
  return v3;
}

- (id)findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMItem guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem messageParts](self, "messageParts");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "transferGUID", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
        {
          IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex((uint64_t)v5, objc_msgSend(v11, "messagePartIndex"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v4))
          {
            IMLogHandleForCategory("IMMessageItem");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v21 = v12;
              v22 = 2112;
              v23 = v4;
              _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_DEFAULT, "Found transferGUID %@ matching potentially donated transferGUID %@.", buf, 0x16u);
            }

            goto LABEL_15;
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (unint64_t)messagePartIndexForAttachmentMessagePartWithTransferGUID:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[IMMessageItem body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "messagePartIndexForAttachmentMessagePartWithTransferGUID:inBody:", v4, v5);

  return v6;
}

+ (unint64_t)messagePartIndexForAttachmentMessagePartWithTransferGUID:(id)a3 inBody:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v5, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19E290F68;
    v9[3] = &unk_1E3FB6820;
    v10 = v5;
    v11 = &v12;
    objc_msgSend(v6, "__im_visitMessageParts:", v9);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

- (BOOL)_updateFileTransfersArrayReplacingTemporaryFileTransferGUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  -[IMMessageItem fileTransferGUIDs](self, "fileTransferGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_19E2910F8;
  v14 = &unk_1E3FB6848;
  v7 = v6;
  v15 = v7;
  v16 = &v17;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v8 = *((unsigned __int8 *)v18 + 24);
  if (*((_BYTE *)v18 + 24))
  {
    v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);
    -[IMMessageItem setFileTransferGUIDs:](self, "setFileTransferGUIDs:", v9);

  }
  _Block_object_dispose(&v17, 8);

  return v8 != 0;
}

- (BOOL)_updateMessageBodyReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[IMMessageItem body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_19E2475DC;
    v17 = sub_19E2474CC;
    v18 = 0;
    v18 = v5;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_19E2912B4;
    v8[3] = &unk_1E3FB6870;
    v8[4] = &v13;
    v8[5] = &v9;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
    if (*((_BYTE *)v10 + 24))
      -[IMMessageItem setBody:](self, "setBody:", v14[5]);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_updateMessageEditHistoryReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  IMMessagePartHistoricalContent *v15;
  NSObject *p_super;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  IMMessageItem *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  char v38;
  id v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  NSObject *v50;
  uint8_t v51;
  _BYTE v52[15];
  uint8_t v53;
  _BYTE v54[15];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v29 = self;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dictionaryForKey:", CFSTR("ec"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v31;
  if (objc_msgSend(v31, "count"))
  {
    v33 = (void *)objc_msgSend(v31, "mutableCopy");
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v31;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    v30 = v34 != 0;
    if (v34)
    {
      v38 = 0;
      v32 = *(_QWORD *)v60;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v60 != v32)
          {
            v7 = v6;
            objc_enumerationMutation(obj);
            v6 = v7;
          }
          v36 = v6;
          v37 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v6);
          objc_msgSend(obj, "_arrayForKey:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v56;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v56 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v15 = -[IMMessagePartHistoricalContent initWithMessageSummaryInfoDictionary:]([IMMessagePartHistoricalContent alloc], "initWithMessageSummaryInfoDictionary:", v14);
                  p_super = &v15->super;
                  if (v15)
                  {
                    -[IMMessagePartHistoricalContent messagePartText](v15, "messagePartText");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = 0;
                    v46 = &v45;
                    v47 = 0x3032000000;
                    v48 = sub_19E2475DC;
                    v49 = sub_19E2474CC;
                    v50 = 0;
                    v18 = v17;
                    v50 = v18;
                    v41 = 0;
                    v42 = &v41;
                    v43 = 0x2020000000;
                    v44 = 0;
                    v40[0] = MEMORY[0x1E0C809B0];
                    v40[1] = 3221225472;
                    v40[2] = sub_19E291860;
                    v40[3] = &unk_1E3FB6870;
                    v40[4] = &v45;
                    v40[5] = &v41;
                    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v40);
                    if (*((_BYTE *)v42 + 24))
                    {
                      v19 = (void *)-[NSObject copyWithUpdatedMessagePartText:](p_super, "copyWithUpdatedMessagePartText:", v46[5]);
                      objc_msgSend(v19, "messageSummaryInfoDictionaryRepresentation");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "addObject:", v20);

                      v38 = 1;
                    }
                    else
                    {
                      objc_msgSend(v9, "addObject:", v14);
                    }
                    _Block_object_dispose(&v41, 8);
                    _Block_object_dispose(&v45, 8);

                  }
                  else
                  {
                    IMLogHandleForCategory("IMMessageItem");
                    v18 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                      sub_19E36C388(&v51, v52, v18);
                  }

                }
                else
                {
                  IMLogHandleForCategory("IMMessageItem");
                  p_super = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
                    sub_19E36C3B8(&v53, v54, p_super);
                }

              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            }
            while (v11);
          }

          v21 = (void *)objc_msgSend(v9, "copy");
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v21, v37);

          v6 = v36 + 1;
        }
        while (v36 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v34);

      if ((v38 & 1) == 0)
      {
        v30 = 0;
LABEL_35:

        v5 = v31;
        goto LABEL_36;
      }
      obj = (id)objc_msgSend(v33, "copy");
      -[IMMessageItem messageSummaryInfo](v29, "messageSummaryInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopy");
      v24 = v23;
      if (v23)
        v25 = v23;
      else
        v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = v25;

      objc_msgSend(v26, "setObject:forKeyedSubscript:", obj, CFSTR("ec"));
      v27 = (void *)objc_msgSend(v26, "copy");
      -[IMMessageItem setMessageSummaryInfo:](v29, "setMessageSummaryInfo:", v27);

    }
    goto LABEL_35;
  }
  v30 = 0;
LABEL_36:

  return v30;
}

- (BOOL)updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  v5 = -[IMMessageItem _updateFileTransfersArrayReplacingTemporaryFileTransferGUIDs:](self, "_updateFileTransfersArrayReplacingTemporaryFileTransferGUIDs:", v4);
  v6 = -[IMMessageItem _updateMessageBodyReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:](self, "_updateMessageBodyReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:", v4);
  LOBYTE(self) = -[IMMessageItem _updateMessageEditHistoryReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:](self, "_updateMessageEditHistoryReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:", v4);

  return (v5 || v6) | self;
}

- (void)enumerateAttachmentGUIDsWithBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[IMMessageItem body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D366B8];
  v7 = objc_msgSend(v5, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19E291A28;
  v10[3] = &unk_1E3FB6898;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v10);

}

- (id)attachmentGUIDAtIndex:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  IMMessageItem *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_19E2475DC;
  v17 = sub_19E2474CC;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19E291CE8;
  v8[3] = &unk_1E3FB68C0;
  v8[5] = &v13;
  v8[6] = a3;
  v8[4] = &v9;
  -[IMMessageItem enumerateAttachmentGUIDsWithBlock:](self, "enumerateAttachmentGUIDsWithBlock:", v8);
  if (!*((_BYTE *)v10 + 24) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "IMMessageItem.attachmentGUIDAtIndex: Did not find an attachment in message %@ at partKey %lu", buf, 0x16u);
    }

  }
  v6 = (id)v14[5];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (IMMessageItem)initWithCoder:(id)a3
{
  id v4;
  IMMessageItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
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
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *context;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)IMMessageItem;
  v5 = -[IMItem initWithCoder:](&v48, sel_initWithCoder_, v4);
  if (v5)
  {
    context = (void *)MEMORY[0x1A1AE8394]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plainBody"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setPlainBody:](v5, "setPlainBody:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typingIndicatorIcon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setTypingIndicatorIcon:](v5, "setTypingIndicatorIcon:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setBodyData:](v5, "setBodyData:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setSubject:](v5, "setSubject:", v9);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("fileTransferGUIDs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setFileTransferGUIDs:](v5, "setFileTransferGUIDs:", v17);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeRead"));
    if (v18 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimeRead:](v5, "setTimeRead:", v19);

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeDelivered"));
    if (v20 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimeDelivered:](v5, "setTimeDelivered:", v21);

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timePlayed"));
    if (v22 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimePlayed:](v5, "setTimePlayed:", v23);

    }
    v5->_flags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flags"));
    v5->_error = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("error"));
    v5->_replaceID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("replaceID"));
    v5->_expireState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("expireState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadData"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setPayloadData:](v5, "setPayloadData:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expressiveSendStyleID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setExpressiveSendStyleID:](v5, "setExpressiveSendStyleID:", v25);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeExpressiveSendPlayed"));
    if (v26 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setTimeExpressiveSendPlayed:](v5, "setTimeExpressiveSendPlayed:", v27);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactsAvatarRecipeData"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setContactsAvatarRecipeData:](v5, "setContactsAvatarRecipeData:", v28);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("messageSummaryInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setMessageSummaryInfo:](v5, "setMessageSummaryInfo:", v29);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("bizIntent"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setBizIntent:](v5, "setBizIntent:", v30);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setLocale:](v5, "setLocale:", v31);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("biaReferenceID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setBiaReferenceID:](v5, "setBiaReferenceID:", v32);

    v5->_useStandalone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useStandalone"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationnotificationIDSTokenURI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setNotificationIDSTokenURI:](v5, "setNotificationIDSTokenURI:", v33);

    v5->_shouldSendMeCard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSendMeCard"));
    v5->_shouldNotifyOnSend = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldNotifyOnSend"));
    v5->_isBeingRetried = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBeingRetried"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("retryToParticipant"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setRetryToParticipant:](v5, "setRetryToParticipant:", v34);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setThreadIdentifier:](v5, "setThreadIdentifier:", v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadOriginator"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setThreadOriginator:](v5, "setThreadOriginator:", v36);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("replyCountsByPart"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setReplyCountsByPart:](v5, "setReplyCountsByPart:", v37);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syndicationRanges"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMMessagePartSyndicationRange rangesFromSerializedString:](IMMessagePartSyndicationRange, "rangesFromSerializedString:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setSyndicationRanges:](v5, "setSyndicationRanges:", v39);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncedSyndicationRanges"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMMessagePartSyndicationRange rangesFromSerializedString:](IMMessagePartSyndicationRange, "rangesFromSerializedString:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setSyncedSyndicationRanges:](v5, "setSyncedSyndicationRanges:", v41);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dateEdited"));
    if (v42 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessageItem setDateEdited:](v5, "setDateEdited:", v43);

    }
    v5->_partCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupActivity"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setGroupActivity:](v5, "setGroupActivity:", v44);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackHash"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageItem setFallbackHash:](v5, "setFallbackHash:", v45);

    -[IMMessageItem setScheduleType:](v5, "setScheduleType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduleType")));
    -[IMMessageItem setScheduleState:](v5, "setScheduleState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduleState")));

    objc_autoreleasePoolPop(context);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)messageContainsSurfDD:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E292618;
  v7[3] = &unk_1E3FB6910;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
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
  double v39;
  double v40;
  void *v41;
  void *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)IMMessageItem;
  v4 = a3;
  -[IMItem encodeWithCoder:](&v43, sel_encodeWithCoder_, v4);
  -[IMMessageItem plainBody](self, "plainBody", v43.receiver, v43.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("plainBody"));

  -[IMMessageItem typingIndicatorIcon](self, "typingIndicatorIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("typingIndicatorIcon"));

  -[IMMessageItem bodyData](self, "bodyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bodyData"));

  -[IMMessageItem subject](self, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("subject"));

  -[IMMessageItem fileTransferGUIDs](self, "fileTransferGUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("fileTransferGUIDs"));

  -[IMMessageItem timeRead](self, "timeRead");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeRead"), v12);
  -[IMMessageItem timeDelivered](self, "timeDelivered");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeDelivered"), v15);
  -[IMMessageItem timePlayed](self, "timePlayed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timePlayed"), v18);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_flags, CFSTR("flags"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_replaceID, CFSTR("replaceID"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_expireState, CFSTR("expireState"));
  -[IMMessageItem payloadData](self, "payloadData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("payloadData"));

  -[IMMessageItem expressiveSendStyleID](self, "expressiveSendStyleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("expressiveSendStyleID"));

  -[IMMessageItem timeExpressiveSendPlayed](self, "timeExpressiveSendPlayed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceReferenceDate");
  v23 = v22;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeExpressiveSendPlayed"), v23);
  -[IMMessageItem contactsAvatarRecipeData](self, "contactsAvatarRecipeData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("contactsAvatarRecipeData"));

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("messageSummaryInfo"));

  -[IMMessageItem bizIntent](self, "bizIntent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("bizIntent"));

  -[IMMessageItem locale](self, "locale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("locale"));

  -[IMMessageItem biaReferenceID](self, "biaReferenceID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("biaReferenceID"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_useStandalone, CFSTR("useStandalone"));
  -[IMMessageItem notificationIDSTokenURI](self, "notificationIDSTokenURI");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("notificationnotificationIDSTokenURI"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldSendMeCard, CFSTR("shouldSendMeCard"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldNotifyOnSend, CFSTR("shouldNotifyOnSend"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IMMessageItem isBeingRetried](self, "isBeingRetried"), CFSTR("isBeingRetried"));
  -[IMMessageItem retryToParticipant](self, "retryToParticipant");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("retryToParticipant"));

  -[IMMessageItem threadIdentifier](self, "threadIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("threadIdentifier"));

  -[IMMessageItem threadOriginator](self, "threadOriginator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("threadOriginator"));

  -[IMMessageItem replyCountsByPart](self, "replyCountsByPart");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("replyCountsByPart"));

  -[IMMessageItem syndicationRanges](self, "syndicationRanges");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMMessagePartSyndicationRange serializedStringFromArray:](IMMessagePartSyndicationRange, "serializedStringFromArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("syndicationRanges"));

  -[IMMessageItem syncedSyndicationRanges](self, "syncedSyndicationRanges");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMMessagePartSyndicationRange serializedStringFromArray:](IMMessagePartSyndicationRange, "serializedStringFromArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("syncedSyndicationRanges"));

  -[IMMessageItem dateEdited](self, "dateEdited");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "timeIntervalSinceReferenceDate");
  v40 = v39;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("dateEdited"), v40);
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMessageItem partCount](self, "partCount"), CFSTR("partCount"));
  -[IMMessageItem groupActivity](self, "groupActivity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("groupActivity"));

  -[IMMessageItem fallbackHash](self, "fallbackHash");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("fallbackHash"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMessageItem scheduleType](self, "scheduleType"), CFSTR("scheduleType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMessageItem scheduleState](self, "scheduleState"), CFSTR("scheduleState"));

}

- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 threadIdentifier:(id)a11
{
  return -[IMMessageItem initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:type:threadIdentifier:](self, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:type:threadIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11);
}

- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 type:(int64_t)a11 threadIdentifier:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  IMMessageItem *v25;
  uint64_t v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a12;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v16, *MEMORY[0x1E0D36D90]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  LODWORD(v27) = objc_msgSend(v21, "code");
  v25 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", v24, v17, 0, 0, 0, 0, v18, 0, v19, v20, a8, v22, 0, 0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          v27,
          a11,
          v23,
          0,
          0,
          objc_msgSend(v18, "__im_countMessageParts"),
          0,
          0,
          0);
  if (v16)

  return v25;
}

- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 type:(int64_t)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  IMMessageItem *v14;
  IMMessageItem *v15;
  id v16;
  id v17;
  IMMessageItem *v18;
  uint64_t v20;

  if (a3)
  {
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = *MEMORY[0x1E0D36D90];
    v11 = a5;
    v12 = a4;
    objc_msgSend(v9, "dictionaryWithObject:forKey:", a3, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = 0;
    v14 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", v13, v12, 0, 0, 0, 0, 0, 0, 0, 0, 0, v11, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            v20,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);

    v15 = v14;
  }
  else
  {
    v16 = a5;
    v17 = a4;
    LODWORD(v20) = 0;
    v18 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", 0, v17, 0, 0, 0, 0, 0, 0, 0, 0, 0, v16, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            v20,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);

    v15 = v18;
  }

  return v15;
}

- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 guid:(id)a5 messageID:(int64_t)a6 account:(id)a7 accountID:(id)a8 service:(id)a9 handle:(id)a10 roomName:(id)a11 unformattedID:(id)a12 countryCode:(id)a13
{
  uint64_t v14;

  LODWORD(v14) = 0;
  return -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, a5, a6, a8,
           a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v14,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 bizIntent:(id)a28 locale:(id)a29 biaReferenceID:(id)a30 errorType:(unsigned int)a31 threadIdentifier:(id)a32 syndicationRanges:(id)a33 syncedSyndicationRanges:(id)a34 partCount:(unint64_t)a35 dateEdited:(id)a36 scheduleType:(unint64_t)a37 scheduleState:(unint64_t)a38
{
  uint64_t v39;

  LODWORD(v39) = a31;
  return -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           v39,
           0,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 bizIntent:(id)a28 locale:(id)a29 biaReferenceID:(id)a30 errorType:(unsigned int)a31 type:(int64_t)a32 threadIdentifier:(id)a33 syndicationRanges:(id)a34 syncedSyndicationRanges:(id)a35 partCount:(unint64_t)a36 dateEdited:(id)a37 scheduleType:(unint64_t)a38 scheduleState:(unint64_t)a39
{
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  IMMessageItem *v51;
  IMMessageItem *v52;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;

  v63 = a5;
  v64 = a6;
  v62 = a7;
  v65 = a8;
  v58 = a9;
  v60 = a10;
  v57 = a12;
  v59 = a24;
  v61 = a25;
  v42 = a26;
  v43 = a27;
  v44 = a28;
  v45 = a29;
  v46 = a30;
  v47 = a33;
  v48 = a34;
  v49 = a35;
  v50 = a37;
  v66.receiver = self;
  v66.super_class = (Class)IMMessageItem;
  v51 = -[IMItem initWithSenderInfo:time:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:type:](&v66, sel_initWithSenderInfo_time_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_type_, a3, a4, a14, a15, a16, a17, a18, a19, a20, a21, a22, a32);
  v52 = v51;
  if (v51)
  {
    -[IMMessageItem setSubject:](v51, "setSubject:", v65);
    -[IMMessageItem setTimeRead:](v52, "setTimeRead:", v63);
    -[IMMessageItem setTimeDelivered:](v52, "setTimeDelivered:", v64);
    -[IMMessageItem setTimePlayed:](v52, "setTimePlayed:", v62);
    -[IMMessageItem _updateFlags:](v52, "_updateFlags:", a13);
    -[IMMessageItem setExpireState:](v52, "setExpireState:", a23);
    -[IMMessageItem setErrorCode:](v52, "setErrorCode:", a31);
    objc_storeStrong((id *)&v52->_fileTransferGUIDs, a12);
    objc_storeStrong((id *)&v52->_body, a9);
    -[IMMessageItem setPayloadData:](v52, "setPayloadData:", v61);
    -[IMItem setBalloonBundleID:](v52, "setBalloonBundleID:", v59);
    -[IMMessageItem setExpressiveSendStyleID:](v52, "setExpressiveSendStyleID:", v42);
    -[IMMessageItem setTimeExpressiveSendPlayed:](v52, "setTimeExpressiveSendPlayed:", v43);
    if (v60)
      objc_storeStrong((id *)&v52->_bodyData, a10);
    -[IMMessageItem adjustIsEmptyFlag](v52, "adjustIsEmptyFlag");
    -[IMMessageItem setContactsAvatarRecipeData:](v52, "setContactsAvatarRecipeData:", 0);
    -[IMMessageItem setBizIntent:](v52, "setBizIntent:", v44);
    -[IMMessageItem setLocale:](v52, "setLocale:", v45);
    -[IMMessageItem setBiaReferenceID:](v52, "setBiaReferenceID:", v46);
    -[IMMessageItem setThreadIdentifier:](v52, "setThreadIdentifier:", v47);
    -[IMMessageItem setThreadOriginator:](v52, "setThreadOriginator:", 0);
    -[IMMessageItem setSyndicationRanges:](v52, "setSyndicationRanges:", v48);
    -[IMMessageItem setSyncedSyndicationRanges:](v52, "setSyncedSyndicationRanges:", v49);
    -[IMMessageItem setPartCount:](v52, "setPartCount:", a36);
    -[IMMessageItem setDateEdited:](v52, "setDateEdited:", v50);
    -[IMMessageItem setScheduleType:](v52, "setScheduleType:", a38);
    -[IMMessageItem setScheduleState:](v52, "setScheduleState:", a39);
  }

  return v52;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[IMItem senderInfo](self, "senderInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36D90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAlert
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)isUnfinished
{
  return 0;
}

- (BOOL)isRead
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)isAudioMessage
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (BOOL)isExpirable
{
  return BYTE3(self->_flags) & 1;
}

- (BOOL)isPlayed
{
  return (BYTE2(self->_flags) >> 6) & 1;
}

- (BOOL)isDelivered
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)wasDeliveredQuietly
{
  return (BYTE4(self->_flags) >> 2) & 1;
}

- (BOOL)didNotifyRecipient
{
  return (BYTE4(self->_flags) >> 3) & 1;
}

- (BOOL)isAutoReply
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (BOOL)isSystemMessage
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)isPrepared
{
  return (BYTE1(self->_flags) >> 3) & 1;
}

- (BOOL)isLocatingMessage
{
  return BYTE2(self->_flags) >> 7;
}

- (BOOL)isEmote
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isSent
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)wasDowngraded
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)isFromExternalSource
{
  return (BYTE3(self->_flags) >> 1) & 1;
}

- (BOOL)isCorrupt
{
  return (BYTE3(self->_flags) >> 2) & 1;
}

- (BOOL)isSOS
{
  return BYTE4(self->_flags) >> 7;
}

- (BOOL)isCritical
{
  return (BYTE4(self->_flags) >> 6) & 1;
}

- (BOOL)isTapToRetry
{
  return BYTE5(self->_flags) & 1;
}

- (BOOL)isSuggestedActionResponse
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLazuliEnabled");

  if (!v4)
    return 0;
  -[IMMessageItem body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("__kIMSuggestedActionAttributeName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "__im_containsAttributedValue:", v6);

  return v7;
}

- (BOOL)isCMM
{
  return -[IMMessageItem getCMMState](self, "getCMMState") != 0;
}

- (BOOL)isFindMyPlugin
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isWaldoEnabled"))
  {
    -[IMItem balloonBundleID](self, "balloonBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[IMItem balloonBundleID](self, "balloonBundleID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsString:", CFSTR("com.apple.findmy.FindMyMessagesApp"));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFileAttachment
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSWYAttachmentsEnabled");

  if (v4)
  {
    -[IMItem balloonBundleID](self, "balloonBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[IMMessageItem fileTransferGUIDs](self, "fileTransferGUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "count")
        || -[IMMessageItem isAudioMessage](self, "isAudioMessage")
        || -[IMMessageItem isTypingMessage](self, "isTypingMessage"))
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        v6 = !-[IMMessageItem isLocatingMessage](self, "isLocatingMessage");
      }

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setIsTapToRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (void)setIsCorrupt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)isSpam
{
  return (BYTE3(self->_flags) >> 3) & 1;
}

- (void)setIsSpam:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (void)setIsSOS:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (void)setIsCritical:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)setIsStewie:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stewieEnabled");

  if (v6)
  {
    v7 = 0x200000000;
    if (!v3)
      v7 = 0;
    self->_flags = self->_flags & 0xFFFFFFFDFFFFFFFFLL | v7;
  }
}

- (int64_t)stewieSequenceNumber
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return -1;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("stsn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || objc_msgSend(v6, "integerValue") < 0)
    v7 = -1;
  else
    v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (void)setStewieSequenceNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("stsn"));

  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);
}

- (void)setStewieConversationID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("stid"));

  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);
}

- (NSUUID)stewieConversationUUID
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (v4)
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stcuuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  return (NSUUID *)v7;
}

- (void)setStewieConversationUUID:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stewieEnabled");

  if (v5)
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "mutableCopy");

    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }

    objc_msgSend(v10, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("stcuuid"));

    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);
  }

}

- (int64_t)transcriptSharingMessageType
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int64_t v7;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (!v4)
    return 0;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("tsmt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || objc_msgSend(v6, "integerValue") < 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (void)setTranscriptSharingMessageType:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranscriptSharingEnabled");

  if (v6)
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "mutableCopy");

    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("tsmt"));

    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v10);
  }
}

- (BOOL)isInitialTranscriptSharingItem
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (!v4)
    return 0;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("tsfirstitem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setInitialTranscriptSharingItem:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranscriptSharingEnabled");

  if (v6)
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "mutableCopy");

    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("tsfirstitem"));

    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v10);
  }
}

- (BOOL)isPendingSatelliteSend
{
  void *v3;
  int v4;
  _BOOL4 v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
    return (BYTE5(self->_flags) >> 1) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (void)setIsPendingSatelliteSend:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    v7 = 0x20000000000;
    if (!v3)
      v7 = 0;
    self->_flags = self->_flags & 0xFFFFFDFFFFFFFFFFLL | v7;
  }
}

- (BOOL)needsRelay
{
  void *v3;
  int v4;
  _BOOL4 v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
    return (BYTE5(self->_flags) >> 2) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (void)setNeedsRelay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    v7 = 0x40000000000;
    if (!v3)
      v7 = 0;
    self->_flags = self->_flags & 0xFFFFFBFFFFFFFFFFLL | v7;
  }
}

- (BOOL)sentOrReceivedOffGrid
{
  void *v3;
  int v4;
  _BOOL4 v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
    return (BYTE5(self->_flags) >> 3) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (void)setSentOrReceivedOffGrid:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    v7 = 0x80000000000;
    if (!v3)
      v7 = 0;
    self->_flags = self->_flags & 0xFFFFF7FFFFFFFFFFLL | v7;
  }
}

- (NSArray)replicatedFallbackGUIDs
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rfgs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setReplicatedFallbackGUIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("rfgs"));
  else
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("rfgs"));
  v6 = (void *)objc_msgSend(v5, "copy");
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v6);

}

- (BOOL)isKeyTransparencyVerifiedMessage
{
  return (BYTE4(self->_flags) >> 5) & 1;
}

- (void)setIsKeyTransparencyVerifiedMessage:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (NSAttributedString)translatedText
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("trt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (NSString)detectedLanguage
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lang"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)shouldSendPartIndexesInMessageBody
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  -[IMMessageItem body](self, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "__im_countMessageParts");

  if (v4 > 1)
    return 1;
  -[IMMessageItem editedPartIndexes](self, "editedPartIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 1;
  -[IMMessageItem retractedPartIndexes](self, "retractedPartIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "count") != 0;

  return v7;
}

- (unint64_t)replyCountForPartIndex:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[IMMessageItem replyCountsByPart](self, "replyCountsByPart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_19E2946C8;
    v7[3] = &unk_1E3FB6938;
    v7[4] = &v8;
    v7[5] = a3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)needsRepeatForRelayReplication
{
  void *v2;
  void *v3;
  char v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("nrr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setNeedsRepeatForRelayReplication:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  if (v3)
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = 0;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("nrr"));
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

}

- (BOOL)isSatelliteMessageRetry
{
  void *v2;
  void *v3;
  char v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ismr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setSatelliteMessageRetry:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  if (v3)
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = 0;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("ismr"));
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

}

- (unint64_t)expectedOffGridCapableDeliveries
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("eogcd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setExpectedOffGridCapableDeliveries:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("eogcd"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("eogcd"));
  }
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

}

- (NSString)expectedServiceForCrossServiceReplacement
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("acsr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setExpectedServiceForCrossServiceReplacement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("acsr"));
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v7);

}

- (NSDate)scheduledMessageLastModifiedTime
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("smlmt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setScheduledMessageLastModifiedTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("smlmt"));
    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v7);

  }
}

- (NSArray)scheduledMessageOriginalTransferGUIDs
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("smotg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setScheduledMessageOriginalTransferGUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("smotg"));
    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v7);

  }
}

- (NSDictionary)messageSummaryInfoForSending
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (qword_1EE503E80 != -1)
    dispatch_once(&qword_1EE503E80, &unk_1E3FB6AB8);
  v4 = (id)qword_1EE503E78;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19E294E20;
  v11[3] = &unk_1E3FB6960;
  v12 = v4;
  v6 = v3;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  v8 = v13;
  v9 = (NSDictionary *)v6;

  return v9;
}

+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 retractedPartIndex:(int64_t)a4 shouldRetractSubject:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CB36B8];
  v9 = a3;
  objc_msgSend(v8, "indexSetWithIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "editedMessageItemWithOriginalMessageItem:retractedPartIndexes:shouldRetractSubject:", v9, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 retractedPartIndexes:(id)a4 shouldRetractSubject:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "plainBody");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_1E3FBBA48;
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_19E2475DC;
  v30 = sub_19E2474CC;
  v31 = 0;
  v14 = v9;
  v15 = 0;
  v31 = v14;
  if (!a5)
  {
    objc_msgSend(v7, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)objc_msgSend(v7, "copyWithFlags:", objc_msgSend(v7, "flags"));
  objc_msgSend(v16, "_setMessageID:", objc_msgSend(v7, "messageID"));
  objc_msgSend(v16, "setPlainBody:", 0);
  objc_msgSend(v16, "setSubject:", v15);
  objc_msgSend(v16, "setSortID:", 0);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_19E295110;
  v23 = &unk_1E3FB6988;
  v25 = &v26;
  v17 = v16;
  v24 = v17;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", &v20);
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime", v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDateEdited:", v18);

  objc_msgSend(v17, "setBody:", v27[5]);
  _Block_object_dispose(&v26, 8);

  return v17;
}

+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 editedPartIndex:(int64_t)a4 newPartText:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "plainBody");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_1E3FBBA48;
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
  }
  if (a4 == -1)
  {
    objc_msgSend(v8, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
  }
  else
  {
    objc_msgSend(v7, "subject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "__im_messageTextByReplacingMessagePartIndex:withNewPartText:", a4, v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  v17 = (void *)objc_msgSend(v7, "copyWithFlags:", objc_msgSend(v7, "flags"));
  objc_msgSend(v17, "_setMessageID:", objc_msgSend(v7, "messageID"));
  objc_msgSend(v17, "setBody:", v16);
  objc_msgSend(v17, "setPlainBody:", 0);
  objc_msgSend(v17, "setSubject:", v14);
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDateEdited:", v18);

  objc_msgSend(v17, "addEditedPartIndex:", a4);
  objc_msgSend(v17, "setSortID:", 0);

  return v17;
}

- (NSIndexSet)editedPartIndexes
{
  void *v2;
  void *v3;
  void *v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0CB36B8], "__im_indexSetFromNumberArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (void)setEditedPartIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(v4, "__im_numberArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("ep"));
  v8 = (void *)objc_msgSend(v9, "copy");
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

}

- (void)addEditedPartIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[IMMessageItem editedPartIndexes](self, "editedPartIndexes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "addIndex:", a3);
  v6 = (void *)objc_msgSend(v5, "copy");
  -[IMMessageItem setEditedPartIndexes:](self, "setEditedPartIndexes:", v6);

}

- (NSIndexSet)retractedPartIndexes
{
  void *v2;
  void *v3;
  void *v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("rp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0CB36B8], "__im_indexSetFromNumberArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (void)setRetractedPartIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(v4, "__im_numberArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("rp"));
  v8 = (void *)objc_msgSend(v9, "copy");
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

}

- (void)addRetractedPartIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[IMMessageItem retractedPartIndexes](self, "retractedPartIndexes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "addIndex:", a3);
  v6 = (void *)objc_msgSend(v5, "copy");
  -[IMMessageItem setRetractedPartIndexes:](self, "setRetractedPartIndexes:", v6);

}

- (NSIndexSet)failedEditPartIndexes
{
  void *v2;
  void *v3;
  void *v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("edfp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0CB36B8], "__im_indexSetFromNumberArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (void)setFailedEditPartIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(v4, "__im_numberArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("edfp"));
  v8 = (void *)objc_msgSend(v9, "copy");
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

}

- (void)addFailedEditPartIndex:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[IMItem guid](self, "guid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = a3;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Adding failed edit part index %ld to message %@", (uint8_t *)&v10, 0x16u);

    }
  }
  -[IMMessageItem failedEditPartIndexes](self, "failedEditPartIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "addIndex:", a3);
  v9 = (void *)objc_msgSend(v8, "copy");
  -[IMMessageItem setFailedEditPartIndexes:](self, "setFailedEditPartIndexes:", v9);

}

- (NSIndexSet)failedRetractPartIndexes
{
  void *v2;
  void *v3;
  void *v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("rdfp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0CB36B8], "__im_indexSetFromNumberArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (void)setFailedRetractPartIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(v4, "__im_numberArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("rdfp"));
  v8 = (void *)objc_msgSend(v9, "copy");
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

}

- (void)addFailedRetractPartIndex:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[IMItem guid](self, "guid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = a3;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Adding failed retract part index %ld to message %@", (uint8_t *)&v10, 0x16u);

    }
  }
  -[IMMessageItem failedRetractPartIndexes](self, "failedRetractPartIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "addIndex:", a3);
  v9 = (void *)objc_msgSend(v8, "copy");
  -[IMMessageItem setFailedRetractPartIndexes:](self, "setFailedRetractPartIndexes:", v9);

}

- (id)historyForMessagePart:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  IMMessagePartHistoricalContent *v16;
  IMMessagePartHistoricalContent *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dictionaryForKey:", CFSTR("ec"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_arrayForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = [IMMessagePartHistoricalContent alloc];
            v17 = -[IMMessagePartHistoricalContent initWithMessageSummaryInfoDictionary:](v16, "initWithMessageSummaryInfoDictionary:", v15, (_QWORD)v20);
            if (v17)
              objc_msgSend(v9, "addObject:", v17);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    v18 = (void *)objc_msgSend(v9, "copy");
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

- (void)setHistory:(id)a3 forMessagePart:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "messageSummaryInfoDictionaryRepresentation", (_QWORD)v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = v18;

  objc_msgSend(v19, "_dictionaryForKey:", CFSTR("ec"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = v23;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v24, "setObject:forKey:", v14, v26);
  else
    objc_msgSend(v24, "removeObjectForKey:", v26);
  v27 = (void *)objc_msgSend(v24, "copy", (_QWORD)v29);
  if (objc_msgSend(v27, "count"))
    objc_msgSend(v19, "setObject:forKey:", v27, CFSTR("ec"));
  else
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("ec"));
  v28 = (void *)objc_msgSend(v19, "copy");
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v28);

}

- (NSDictionary)originalTextRangesByPartIndex
{
  void *v3;
  void *v4;
  void *v5;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("otr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    -[IMMessageItem _partRangeByIndexFromPlistSerializable:](self, "_partRangeByIndexFromPlistSerializable:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (void)setOriginalTextRangesByPartIndex:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[IMMessageItem _partRangeByIndexToPlistSerializable:](self, "_partRangeByIndexToPlistSerializable:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("otr"));
  v7 = (void *)objc_msgSend(v6, "copy");
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v7);

}

- (id)_partRangeByIndexToPlistSerializable:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19E29616C;
  v9[3] = &unk_1E3FB69B0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)_partRangeByIndexFromPlistSerializable:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19E296324;
  v9[3] = &unk_1E3FB69D8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (NSArray)editUnsupportedByHandleIDs
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("euh"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  return (NSArray *)v6;
}

- (BOOL)hasEditedParts
{
  void *v2;
  BOOL v3;

  -[IMMessageItem dateEdited](self, "dateEdited");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isFullyRetracted
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  -[IMMessageItem dateEdited](self, "dateEdited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[IMMessageItem body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "__im_countMessageParts");

  if (v5 > 0)
    return 0;
  -[IMMessageItem subject](self, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "length") == 0;

  return v6;
}

- (unint64_t)eligibilityForEditType:(unint64_t)a3 messagePartIndex:(int64_t)a4
{
  void *v7;
  int v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  unint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  char v28;
  char v29;
  char v30;
  NSObject *v31;
  double v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  int v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (-[IMMessageItem isFromMe](self, "isFromMe"))
  {
    if (-[IMMessageItem isSent](self, "isSent"))
    {
      +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPriusEnabled");

      if (v8)
      {
        if (a3 == 2)
        {
          -[IMItem service](self, "service");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", IMServiceNameiMessage[0]);

          if ((v10 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                LOWORD(v44) = 0;
                _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Message cannot be edited, message service is not iMessage", (uint8_t *)&v44, 2u);
              }
LABEL_45:

              return 2;
            }
            return 2;
          }
        }
      }
      else
      {
        -[IMItem service](self, "service");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", IMServiceNameiMessage[0]);

        if ((v16 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Message cannot be edited, message service is not iMessage", (uint8_t *)&v44, 2u);
            }
            goto LABEL_45;
          }
          return 2;
        }
      }
      -[IMItem handle](self, "handle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length") && MEMORY[0x1A1AE7CF8](v17))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Message cannot be edited, message is in a business chat", (uint8_t *)&v44, 2u);
          }

        }
        v13 = 2;
        goto LABEL_67;
      }
      +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isScheduledMessagesCoreEnabled");

      if (v20)
      {
        if (-[IMMessageItem scheduleType](self, "scheduleType") == 2)
        {
          v21 = -[IMMessageItem scheduleState](self, "scheduleState") - 1;
          if (v21 < 5 && ((0x1Du >> v21) & 1) != 0)
          {
            v13 = qword_19E3814E8[v21];
            goto LABEL_67;
          }
        }
      }
      -[IMItem time](self, "time");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v22);
      v25 = v24;
      -[IMMessageItem _timeoutIntervalForEditType:](self, "_timeoutIntervalForEditType:", a3);
      if (v25 >= v26)
      {
        v32 = v26;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v44 = 134218754;
            v45 = (uint64_t)v25;
            v46 = 2048;
            v47 = (uint64_t)v32;
            v48 = 2112;
            v49 = v22;
            v50 = 2112;
            v51 = v23;
            _os_log_impl(&dword_19E239000, v33, OS_LOG_TYPE_INFO, "Message cannot be edited, message was sent %ld seconds ago, which is greater than timeout of %ld seconds. Sent: %@ Now: %@", (uint8_t *)&v44, 0x2Au);
          }

        }
        v13 = 3;
        goto LABEL_66;
      }
      -[IMItem balloonBundleID](self, "balloonBundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "length"))
      {
        if (a3 != 2)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_19E239000, v31, OS_LOG_TYPE_INFO, "Message cannot be edited, message is a balloon plugin message", (uint8_t *)&v44, 2u);
            }
            goto LABEL_63;
          }
LABEL_64:
          v13 = 4;
          goto LABEL_65;
        }
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.messages.URLBalloonProvider"));
        v29 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.DigitalTouchBalloonProvider"));
        v30 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.Jellyfish.Animoji"));
        if ((v28 & 1) == 0 && (v29 & 1) == 0 && (v30 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_19E239000, v31, OS_LOG_TYPE_INFO, "Message cannot be retracted, message is a balloon plugin message", (uint8_t *)&v44, 2u);
            }
LABEL_63:

            goto LABEL_64;
          }
          goto LABEL_64;
        }
      }
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", CFSTR("amab"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v35, "containsString:", CFSTR("com.apple.PassbookUIService.PeerPaymentMessagesExtension")) & 1) != 0
        || objc_msgSend(v35, "containsString:", CFSTR("com.apple.Passbook.PeerPaymentMessagesExtension")))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_19E239000, v36, OS_LOG_TYPE_INFO, "Message cannot be edited or retracted, message is a memo associated with an Apple Cash payment or request", (uint8_t *)&v44, 2u);
          }

        }
        v13 = 4;
        goto LABEL_59;
      }
      if (a3 == 1)
      {
        -[IMMessageItem historyForMessagePart:](self, "historyForMessagePart:", a4);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count") - 1;
        -[IMMessageItem _messageEditHistoryLimit](self, "_messageEditHistoryLimit");
        v41 = (uint64_t)v40;
        if (v39 >= (uint64_t)v40)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              v44 = 134218240;
              v45 = v39;
              v46 = 2048;
              v47 = v41;
              _os_log_impl(&dword_19E239000, v43, OS_LOG_TYPE_INFO, "Message cannot be edited, message has already been edited %ld times. Maximum is %ld edits.", (uint8_t *)&v44, 0x16u);
            }

          }
          v13 = 5;
          goto LABEL_59;
        }

        if (!IMOSLoggingEnabled())
          goto LABEL_80;
        OSLogHandleForIMFoundationCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          LOWORD(v44) = 0;
          _os_log_impl(&dword_19E239000, v42, OS_LOG_TYPE_INFO, "Message can be edited", (uint8_t *)&v44, 2u);
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
        {
LABEL_80:
          v13 = 0;
LABEL_59:

LABEL_65:
LABEL_66:

LABEL_67:
          return v13;
        }
        OSLogHandleForIMFoundationCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          LOWORD(v44) = 0;
          _os_log_impl(&dword_19E239000, v42, OS_LOG_TYPE_INFO, "Message can be retracted", (uint8_t *)&v44, 2u);
        }
      }

      goto LABEL_80;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v44) = 0;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Message cannot be edited, message is currently sending", (uint8_t *)&v44, 2u);
      }

    }
    return 6;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v44) = 0;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Message cannot be edited, message is not from me", (uint8_t *)&v44, 2u);
      }

    }
    return 1;
  }
}

- (double)_timeoutIntervalForEditType:(unint64_t)a3
{
  double result;

  if (a3 == 2)
  {
    MEMORY[0x1E0DE7D20](self, sel__messageRetractionTimeout);
  }
  else if (a3 == 1)
  {
    MEMORY[0x1E0DE7D20](self, sel__messageEditTimeout);
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)_messageEditTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("message-edit-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "doubleValue"), v4 > 0.0))
  {
    v5 = v4;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 134218240;
        v9 = (uint64_t)v5;
        v10 = 2048;
        v11 = (uint64_t)900.0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Server bag override for message edit timeout. Server: %ld Default: %ld", (uint8_t *)&v8, 0x16u);
      }

    }
  }
  else
  {
    v5 = 900.0;
  }

  return v5;
}

- (double)_messageEditHistoryLimit
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("message-edit-history-limit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v4 = objc_msgSend(v3, "intValue"), v4 >= 1))
  {
    v5 = v4;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Server bag override for message edit history limit. Server: %@ Default: %@", (uint8_t *)&v10, 0x16u);

      }
    }
  }
  else
  {
    v5 = 5;
  }

  return (double)v5;
}

- (double)_messageRetractionTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("message-retraction-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "doubleValue"), v4 > 0.0))
  {
    v5 = v4;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 134218240;
        v9 = (uint64_t)v5;
        v10 = 2048;
        v11 = (uint64_t)120.0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Server bag override for message retraction timeout. Server: %ld Default: %ld", (uint8_t *)&v8, 0x16u);
      }

    }
  }
  else
  {
    v5 = 120.0;
  }

  return v5;
}

- (BOOL)canRetryFailedRetraction
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IMItem time](self, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  v6 = v5;
  -[IMMessageItem _timeoutIntervalForEditType:](self, "_timeoutIntervalForEditType:", 2);
  v8 = v7;
  if (v6 >= v7 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 134218754;
      v12 = (uint64_t)v6;
      v13 = 2048;
      v14 = (uint64_t)120.0;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Cannot retry retraction, message was sent %ld seconds ago, which is greater than timeout of %ld seconds. Sent: %@ Now: %@", (uint8_t *)&v11, 0x2Au);
    }

  }
  return v6 < v8;
}

- (BOOL)hasUnseenMention
{
  return (BYTE3(self->_flags) >> 4) & 1;
}

- (void)setHasUnseenMention:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (void)setHasDataDetectorResults:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (-[IMMessageItem hasDataDetectorResults](self, "hasDataDetectorResults") != a3)
  {
    v5 = 0x10000;
    if (!v3)
      v5 = 0;
    self->_flags = self->_flags & 0xFFFFFFFFFFFEFFFFLL | v5;
  }
}

- (BOOL)wasDataDetected
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (BOOL)containsRichLink
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  -[IMMessageItem body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v4 = v2 && (objc_msgSend(v2, "attribute:existsInRange:", *MEMORY[0x1E0D365F0], 0, v3) & 1) != 0;

  return v4;
}

- (NSArray)richLinkURLs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_19E2475DC;
  v13 = sub_19E2474CC;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem body](self, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = *MEMORY[0x1E0D365F0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19E2975B8;
  v8[3] = &unk_1E3FB6A00;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v8);
  v6 = (void *)objc_msgSend((id)v10[5], "copy");

  _Block_object_dispose(&v9, 8);
  return (NSArray *)v6;
}

- (NSString)swyAppName
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("swyan"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSwyAppName:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }

    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("swyan"));
    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v6);

  }
}

- (NSString)swyBundleID
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("swybid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSwyBundleID:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }

    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("swybid"));
    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v6);

  }
}

- (void)setWasDataDetected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (NSString)originalUnformattedID
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("oui"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setOriginalUnformattedID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11
    || (-[IMMessageItem originalUnformattedID](self, "originalUnformattedID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = v8;

    if (v11)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("oui"));
    else
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("oui"));
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v10);

  }
}

- (void)setCMMStateToRegisteredAndAssetOffsetTo:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("cmmS\x10"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("cmmAO"));

  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v9);
}

- (unint64_t)getCMMState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cmmS\x10"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setCMMState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("cmmS\x10"));

  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);
}

- (void)setCMMAssetOffset:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("cmmAO"));

  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);
}

- (unint64_t)getCMMAssetOffset
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cmmAO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)_updateFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)setFlags:(unint64_t)a3
{
  -[IMMessageItem _updateFlags:](self, "_updateFlags:", a3 & 0xFFFFFFFFFFFFFFF7 | (8 * ((self->_flags >> 3) & 1)));
}

- (void)_regenerateBodyData
{
  NSData *bodyData;
  void *v4;
  NSData *v5;
  NSData *v6;

  bodyData = self->_bodyData;
  self->_bodyData = 0;

  if (-[NSAttributedString length](self->_body, "length"))
  {
    v4 = (void *)MEMORY[0x1A1AE8394]();
    JWEncodeCodableObject();
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v6 = self->_bodyData;
    self->_bodyData = v5;

    objc_autoreleasePoolPop(v4);
  }
}

- (void)_clearBodyData
{
  NSData *bodyData;

  bodyData = self->_bodyData;
  self->_bodyData = 0;

}

- (void)setBody:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString *v6;

  v5 = (NSAttributedString *)a3;
  if (self->_body != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_body, a3);
    -[IMMessageItem _clearBodyData](self, "_clearBodyData");
    -[IMMessageItem _recalculatePartCount](self, "_recalculatePartCount");
    -[IMMessageItem adjustIsEmptyFlag](self, "adjustIsEmptyFlag");
    v5 = v6;
  }

}

- (void)setPlainBody:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_plainBody != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_plainBody, a3);
    -[IMMessageItem _recalculatePartCount](self, "_recalculatePartCount");
    v5 = v6;
  }

}

- (void)eraseMessageContent
{
  NSAttributedString *body;
  NSString *plainBody;
  NSString *subject;

  body = self->_body;
  self->_body = 0;

  plainBody = self->_plainBody;
  self->_plainBody = 0;

  subject = self->_subject;
  self->_subject = 0;

  -[IMMessageItem _clearBodyData](self, "_clearBodyData");
  self->_flags &= ~8uLL;
  self->_partCount = 0;
}

- (NSAttributedString)breadcrumbText
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[IMMessageItem body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_19E2475DC;
  v24 = sub_19E2474CC;
  v25 = 0;
  v3 = objc_msgSend(v2, "length");
  v4 = MEMORY[0x1E0C809B0];
  v5 = *MEMORY[0x1E0D36320];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19E298154;
  v19[3] = &unk_1E3FB5448;
  v19[4] = &v20;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v3, 0x100000, v19);
  if (v21[5])
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v6 = objc_msgSend(v2, "length");
    v7 = *MEMORY[0x1E0D36328];
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = sub_19E2981B8;
    v14[3] = &unk_1E3FB5448;
    v14[4] = &v15;
    objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0x100000, v14);
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    v9 = v21[5];
    v26 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v16 + 6));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v11);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return (NSAttributedString *)v12;
}

- (id)description
{
  objc_class *v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  NSDictionary *replyCountsByPart;
  IMMessageItem *threadOriginator;
  void *v45;
  NSString *threadIdentifier;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int64_t v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  unint64_t v67;
  unint64_t v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  NSArray *fileTransferGUIDs;
  void *v75;
  int64_t v76;
  void *v77;
  void *v78;
  unint64_t flags;
  void *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;

  if (qword_1ECFC7180 != -1)
    dispatch_once(&qword_1ECFC7180, &unk_1E3FB3568);
  v84 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("YES");
  if (-[IMMessageItem isFromMe](self, "isFromMe"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v82 = v5;
  -[IMMessageItem sender](self, "sender");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem service](self, "service");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem handle](self, "handle");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem destinationCallerID](self, "destinationCallerID");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem unformattedID](self, "unformattedID");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem countryCode](self, "countryCode");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem roomName](self, "roomName");
  v6 = objc_claimAutoreleasedReturnValue();
  flags = self->_flags;
  v80 = (void *)v6;
  off_1ECFC7178(self->_subject);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void (*)(void))off_1ECFC7178;
  -[NSAttributedString string](self->_body, "string");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v7();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[IMItem messageID](self, "messageID");
  -[IMItem guid](self, "guid");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMItem sortID](self, "sortID"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem time](self, "time");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "timeIntervalSinceReferenceDate");
  v9 = v8;
  -[NSDate timeIntervalSinceReferenceDate](self->_timeDelivered, "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[NSDate timeIntervalSinceReferenceDate](self->_timeRead, "timeIntervalSinceReferenceDate");
  v13 = v12;
  -[NSDate timeIntervalSinceReferenceDate](self->_timePlayed, "timeIntervalSinceReferenceDate");
  v15 = v14;
  fileTransferGUIDs = self->_fileTransferGUIDs;
  if (-[IMMessageItem isEmpty](self, "isEmpty"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v73 = v16;
  if (-[IMMessageItem isFinished](self, "isFinished"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v72 = v17;
  if (-[IMMessageItem isSent](self, "isSent"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v71 = v18;
  if (-[IMMessageItem isRead](self, "isRead"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v70 = v19;
  if (-[IMMessageItem isDelivered](self, "isDelivered"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v69 = v20;
  v68 = -[IMMessageItem scheduleType](self, "scheduleType");
  v67 = -[IMMessageItem scheduleState](self, "scheduleState");
  if (-[IMMessageItem isAudioMessage](self, "isAudioMessage"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v66 = v21;
  if (-[IMMessageItem isPlayed](self, "isPlayed"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  v65 = v22;
  if (-[IMMessageItem isFromMe](self, "isFromMe"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  v64 = v23;
  if (-[IMMessageItem hasDataDetectorResults](self, "hasDataDetectorResults"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  v63 = v24;
  if (-[IMMessageItem wasDataDetected](self, "wasDataDetected"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v62 = v25;
  if (-[IMMessageItem wasDowngraded](self, "wasDowngraded"))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  v61 = v26;
  if (-[IMMessageItem isEmote](self, "isEmote"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  v60 = v27;
  if (-[IMMessageItem isExpirable](self, "isExpirable"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  v59 = v28;
  v58 = -[IMMessageItem expireState](self, "expireState");
  -[IMItem balloonBundleID](self, "balloonBundleID");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem expressiveSendStyleID](self, "expressiveSendStyleID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem timeExpressiveSendPlayed](self, "timeExpressiveSendPlayed");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem bizIntent](self, "bizIntent");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem locale](self, "locale");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem biaReferenceID](self, "biaReferenceID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[IMMessageItem errorCode](self, "errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IMItem cloudKitSyncState](self, "cloudKitSyncState"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMMessageItem isCorrupt](self, "isCorrupt"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  v50 = v29;
  if (-[IMMessageItem shouldSendMeCard](self, "shouldSendMeCard"))
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  v49 = v30;
  if (-[IMMessageItem isSpam](self, "isSpam"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  v48 = v31;
  if (-[IMMessageItem hasUnseenMention](self, "hasUnseenMention"))
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  v47 = v32;
  threadIdentifier = self->_threadIdentifier;
  threadOriginator = self->_threadOriginator;
  replyCountsByPart = self->_replyCountsByPart;
  if (-[IMMessageItem isStewie](self, "isStewie"))
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMMessageItem stewieConversationID](self, "stewieConversationID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_syndicationRanges, "componentsJoinedByString:", CFSTR(","));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_syncedSyndicationRanges, "componentsJoinedByString:", CFSTR(","));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_dateEdited, "timeIntervalSinceReferenceDate");
  v38 = v37;
  -[IMMessageItem groupActivity](self, "groupActivity");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    v39 = CFSTR("YES");
  else
    v39 = CFSTR("NO");
  if (-[IMMessageItem wasDetonated](self, "wasDetonated"))
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  if (-[IMMessageItem isSOS](self, "isSOS"))
    v41 = CFSTR("YES");
  else
    v41 = CFSTR("NO");
  if (!-[IMMessageItem isCritical](self, "isCritical"))
    v4 = CFSTR("NO");
  -[NSString length](self->_fallbackHash, "length");
  objc_msgSend(v84, "stringWithFormat:", CFSTR("%@[outgoing: %@ sender=%@; service=%@; handle=%@; destinationCallerID= %@, unformatted=%@; country=%@; roomName='%@'; flags=0x%llx; subject='%@' text='%@' messageID: %lld GUID:'%@' sortID: %@ date:'%f' date-delivered:'%f' date-read:'%f' date-played:'%f' transfer guids: '%@' empty: %@ finished: %@ sent: %@ read: %@ delivered: %@ scheduleType: %lu, scheduleState: %lu, audio: %@ played: %@ from-me: %@ DD results: %@ DD Scanned: %@ Downgraded: %@ emote: %@ expirable: %@ expire-state: %d balloon-bundle-id: %@ expressive-send-style-id: %@ time-expressive-send-played: %@ bizIntent: %@ locale: %@ biaReferenceID: %@ error: %d sync-state %@ corrupt: %@ shouldSendMeCard: %@ isSpam: %@ hasUnseenMention: %@ threadIdentifier: %@, threadOriginator: %@, replyCountsByPart: %@, isChoros: %@, chorosConversationID: %@, syndicationRanges: %@, syncedSyndicationRanges: %@, dateEdited: '%f', hasGroupActivity: %@, wasDetonated: %@, isSOS: %@, isCritical %@, fallbackHash (len): %llu]"),
    v94,
    v82,
    v93,
    v92,
    v91,
    v90,
    v89,
    v88,
    v80,
    flags,
    v78,
    v77,
    v76,
    v87,
    v75,
    v9,
    v11,
    v13,
    v15,
    fileTransferGUIDs,
    v73,
    v72,
    v71,
    v70,
    v69,
    v68,
    v67,
    v66,
    v65,
    v64,
    v63,
    v62,
    v61,
    v60,
    v59,
    v58,
    v86,
    v57,
    v56,
    v55,
    v54,
    v53,
    v52,
    v51,
    v50,
    v49,
    v48,
    v47,
    threadIdentifier,
    threadOriginator,
    replyCountsByPart,
    v33,
    v34,
    v35,
    v36,
    v38,
    v39,
    v40,
    v41,
    v4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  return v85;
}

- (BOOL)isFirstMessageCandidate
{
  return 1;
}

- (BOOL)unsentIsFromMeItem
{
  void *v3;
  int v4;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScheduledMessagesCoreEnabled");

  if (v4)
  {
    v5 = -[IMMessageItem isFromMe](self, "isFromMe");
    if (v5)
    {
      v6 = -[IMMessageItem scheduleType](self, "scheduleType");
      LOBYTE(v5) = (v6 >= 2
                 && (v6 != 2
                  || (v7 = -[IMMessageItem scheduleState](self, "scheduleState"), v7 > 5)
                  || ((1 << v7) & 0x39) == 0)
                 || !-[IMMessageItem isSent](self, "isSent"))
                && -[IMMessageItem errorCode](self, "errorCode") == 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IMMessageItem;
    LOBYTE(v5) = -[IMItem unsentIsFromMeItem](&v9, sel_unsentIsFromMeItem);
  }
  return v5;
}

- (id)_localizedBackwardsCompatibleExpressiveSendText
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;

  if (!-[NSString length](self->_expressiveSendStyleID, "length"))
    goto LABEL_36;
  if (-[NSString isEqualToString:](self->_expressiveSendStyleID, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("IMPACT_INVISIBLE");
LABEL_4:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v9 = -[NSString rangeOfString:](self->_expressiveSendStyleID, "rangeOfString:", CFSTR("com.apple.MobileSMS.expressivesend"));
  if (!v10)
  {
    -[NSString rangeOfString:](self->_expressiveSendStyleID, "rangeOfString:", CFSTR("com.apple.messages.effect"));
    if (v15)
    {
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKConfettiEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_CONFETTI");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKHappyBirthdayEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_BALLOONS");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKLasersEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_LASERS");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKFireworksEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_FIREWORKS");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKShootingStarEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_SHOOTING_STAR");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKSparklesEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_CELEBRATION");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKHeartEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_LOVE");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKEchoEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_ECHO");
        goto LABEL_4;
      }
      if (-[NSString hasSuffix:](self->_expressiveSendStyleID, "hasSuffix:", CFSTR("CKSpotlightEffect")))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("FSM_SENT_WITH_SPOTLIGHT");
        goto LABEL_4;
      }
    }
LABEL_36:
    v8 = 0;
    return v8;
  }
  v11 = v9 + v10 + 1;
  if (v11 >= -[NSString length](self->_expressiveSendStyleID, "length"))
    goto LABEL_36;
  -[NSString substringFromIndex:](self->_expressiveSendStyleID, "substringFromIndex:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("gentle")))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v14 = CFSTR("IMPACT_GENTLE");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("loud")))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v14 = CFSTR("IMPACT_LOUD");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("impact")))
    {
      v8 = 0;
      goto LABEL_6;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v14 = CFSTR("IMPACT_IMPACT");
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v16, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
LABEL_6:

  return v8;
}

- (BOOL)isDeviceActionMessage
{
  void *v2;
  void *v3;
  char v4;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("dam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (id)_messageItemWithIndexesDeleted:(id)a3 subRangesToDeleteMapping:(id)a4 deleteSubject:(BOOL)a5 deleteTransferCallback:(id)a6 createItemCallback:(id)a7 fromMessageItem:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v44;
  id v45;
  id v46;
  _BOOL4 v47;
  id v48;
  void (**v49)(id, id, id, _QWORD, id);
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  BOOL v63;
  _BYTE v64[128];
  uint64_t v65;

  v11 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v45 = a4;
  v14 = a6;
  v49 = (void (**)(id, id, id, _QWORD, id))a7;
  v15 = a8;
  objc_msgSend(v15, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = *MEMORY[0x1E0D366B8];
  v21 = objc_msgSend(v17, "length");
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_19E299254;
  v56[3] = &unk_1E3FB6A50;
  v47 = v11;
  v63 = v11;
  v48 = v13;
  v57 = v48;
  v46 = v45;
  v58 = v46;
  v22 = v17;
  v59 = v22;
  v44 = v14;
  v62 = v44;
  v23 = v19;
  v60 = v23;
  v24 = v18;
  v61 = v24;
  objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v21, 0, v56);
  objc_msgSend(v24, "sortedArrayUsingComparator:", &unk_1E3FB4328);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v53 != v28)
          objc_enumerationMutation(v25);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "rangeValue");
        v32 = v31;
        if (v30 < objc_msgSend(v22, "length"))
        {
          v33 = objc_msgSend(v22, "length");
          if (v32 >= v33 - v30 ? v33 - v30 : v32)
            objc_msgSend(v22, "deleteCharactersInRange:", v30);
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v27);
  }
  objc_msgSend(v15, "fileTransferGUIDs");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");

  v37 = *MEMORY[0x1E0D36430];
  v38 = objc_msgSend(v22, "length");
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_19E29967C;
  v50[3] = &unk_1E3FB6A98;
  v39 = v36;
  v51 = v39;
  objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v37, 0, v38, 0, v50);
  if (objc_msgSend(v23, "count"))
    objc_msgSend(v39, "removeObjectsInArray:", v23);
  if (v49)
  {
    ((void (**)(id, id, id, _BOOL4, id))v49)[2](v49, v15, v22, v47, v39);
    v40 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = objc_msgSend(a1, "newMessageItemFrom:withText:deleteSubject:withFileTransferGUIDs:", v15, v22, v47, v39);
  }
  v41 = (void *)v40;

  return v41;
}

+ (id)newMessageItemFrom:(id)a3 withText:(id)a4 deleteSubject:(BOOL)a5 withFileTransferGUIDs:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  IMMessageItem *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  IMMessageItem *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v9 = a3;
  v36 = a6;
  v35 = a4;
  v34 = [IMMessageItem alloc];
  objc_msgSend(v9, "senderInfo");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "time");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeRead");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeDelivered");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timePlayed");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v10;
  if (a5)
  {
    v37 = 0;
  }
  else
  {
    objc_msgSend(v9, "subject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = objc_msgSend(v9, "flags");
  objc_msgSend(v9, "guid");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v9, "messageID");
  objc_msgSend(v9, "account");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unformattedID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "countryCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonBundleID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressiveSendStyleID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeExpressiveSendPlayed");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bizIntent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locale");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "biaReferenceID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v9, "errorCode");
  v21 = objc_msgSend(v9, "type");
  objc_msgSend(v9, "threadIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syndicationRanges");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncedSyndicationRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "partCount");
  objc_msgSend(v9, "dateEdited");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = v23;
  v15 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](v34, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", v48, v11, v47, v46, v45, v37, v35, 0, 0, v36, v33, v42, v32, v44,
          v40,
          v31,
          v43,
          0,
          v41,
          v30,
          0,
          v39,
          v29,
          v38,
          v27,
          v28,
          v26,
          v25,
          v20,
          v21,
          v24,
          v22,
          v12,
          v13,
          v14,
          objc_msgSend(v9, "scheduleType"),
          objc_msgSend(v9, "scheduleState"));

  if (!a5)
  -[IMMessageItem setUseStandalone:](v15, "setUseStandalone:", objc_msgSend(v9, "useStandalone"));
  objc_msgSend(v9, "messageSummaryInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem setMessageSummaryInfo:](v15, "setMessageSummaryInfo:", v16);

  -[IMItem setSortID:](v15, "setSortID:", objc_msgSend(v9, "sortID"));
  objc_msgSend(v9, "replyCountsByPart");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem setReplyCountsByPart:](v15, "setReplyCountsByPart:", v17);

  objc_msgSend(v9, "fallbackHash");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageItem setFallbackHash:](v15, "setFallbackHash:", v18);

  return v15;
}

- (void)setErrorCode:(unsigned int)a3
{
  self->_error = a3;
}

- (int64_t)replaceID
{
  return self->_replaceID;
}

- (void)setTimePlayed:(id)a3
{
  objc_storeStrong((id *)&self->_timePlayed, a3);
}

- (int64_t)expireState
{
  return self->_expireState;
}

- (void)setExpireState:(int64_t)a3
{
  self->_expireState = a3;
}

- (NSData)contactsAvatarRecipeData
{
  return self->_contactsAvatarRecipeData;
}

- (void)setTimeExpressiveSendPlayed:(id)a3
{
  objc_storeStrong((id *)&self->_timeExpressiveSendPlayed, a3);
}

- (void)setTypingIndicatorIcon:(id)a3
{
  objc_storeStrong((id *)&self->_typingIndicatorIcon, a3);
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)biaReferenceID
{
  return self->_biaReferenceID;
}

- (void)setDateEdited:(id)a3
{
  objc_storeStrong((id *)&self->_dateEdited, a3);
}

- (TUConversationActivity)groupActivity
{
  return self->_groupActivity;
}

- (NSString)fallbackHash
{
  return self->_fallbackHash;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

- (void)setScheduleState:(unint64_t)a3
{
  self->_scheduleState = a3;
}

- (unint64_t)partCount
{
  return self->_partCount;
}

- (BOOL)blockingRichLinks
{
  return self->_blockingRichLinks;
}

- (void)setBlockingRichLinks:(BOOL)a3
{
  self->_blockingRichLinks = a3;
}

- (void)setTranslatedText:(id)a3
{
  objc_storeStrong((id *)&self->_translatedText, a3);
}

- (void)setDetectedLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_detectedLanguage, a3);
}

- (void)setShouldSendPartIndexesInMessageBody:(BOOL)a3
{
  self->_shouldSendPartIndexesInMessageBody = a3;
}

- (unint64_t)editEligibility
{
  return self->_editEligibility;
}

- (void)setEditEligibility:(unint64_t)a3
{
  self->_editEligibility = a3;
}

- (BOOL)isBeingRetried
{
  return self->_isBeingRetried;
}

- (NSString)retryToParticipant
{
  return self->_retryToParticipant;
}

- (NSString)notificationIDSTokenURI
{
  return self->_notificationIDSTokenURI;
}

- (BOOL)isUpdatingDataSourcePayload
{
  return self->_updatingDataSourcePayload;
}

- (void)setUpdatingDataSourcePayload:(BOOL)a3
{
  self->_updatingDataSourcePayload = a3;
}

- (BOOL)backwardsCompatibleVersion
{
  return self->_backwardsCompatibleVersion;
}

- (void)setBackwardsCompatibleVersion:(BOOL)a3
{
  self->_backwardsCompatibleVersion = a3;
}

- (BOOL)useStandalone
{
  return self->_useStandalone;
}

- (BOOL)NicknameRequested
{
  return self->_NicknameRequested;
}

- (void)setNicknameRequested:(BOOL)a3
{
  self->_NicknameRequested = a3;
}

- (BOOL)shouldSendMeCard
{
  return self->_shouldSendMeCard;
}

- (BOOL)shouldNotifyOnSend
{
  return self->_shouldNotifyOnSend;
}

- (NSString)suggestedAuthorName
{
  return self->_suggestedAuthorName;
}

- (void)setSuggestedAuthorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSString)suggestedAuthorAvatarPath
{
  return self->_suggestedAuthorAvatarPath;
}

- (void)setSuggestedAuthorAvatarPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSDictionary)replyCountsByPart
{
  return self->_replyCountsByPart;
}

- (BOOL)wasDetectedAsSWYSpam
{
  return self->_wasDetectedAsSWYSpam;
}

- (void)setWasDetectedAsSWYSpam:(BOOL)a3
{
  self->_wasDetectedAsSWYSpam = a3;
}

- (int64_t)selectedRichCardIndex
{
  return self->_selectedRichCardIndex;
}

- (void)setSelectedRichCardIndex:(int64_t)a3
{
  self->_selectedRichCardIndex = a3;
}

- (NSArray)messageParts
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[IMMessageItem body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_19E2D12C0;
    v7[3] = &unk_1E3FB5510;
    v8 = v3;
    v4 = v3;
    objc_msgSend(v2, "__im_visitMessageParts:", v7);
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)messagePartMatchingPartIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[IMMessageItem body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "__im_messagePartMatchingPartIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)powerLogMessageType
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (-[IMMessageItem isTypingMessage](self, "isTypingMessage"))
    return 0;
  if (-[IMMessageItem isAudioMessage](self, "isAudioMessage"))
    return 3;
  -[IMMessageItem expressiveSendStyleID](self, "expressiveSendStyleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19E319650;
  v9[3] = &unk_1E3FBA5A8;
  v9[4] = &v10;
  -[IMMessageItem enumerateAttachmentGUIDsWithBlock:](self, "enumerateAttachmentGUIDsWithBlock:", v9);
  v6 = 4;
  if (v5)
    v6 = 5;
  v7 = 1;
  if (v5)
    v7 = 2;
  if (*((_BYTE *)v11 + 24))
    v3 = v6;
  else
    v3 = v7;
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (BOOL)isAvailabilityReplySupported
{
  IMMessageItem *v2;
  char v3;

  v2 = self;
  v3 = sub_19E323578();

  return v3 & 1;
}

- (BOOL)hasLegacyUrgentTriggerMatchInText
{
  IMMessageItem *v2;
  char v3;

  v2 = self;
  v3 = sub_19E323B74();

  return v3 & 1;
}

@end
