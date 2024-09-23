@implementation IMAssociatedMessageItem

- (BOOL)isLastMessageCandidate
{
  return -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") != 3;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (BOOL)isEqual:(id)a3
{
  IMAssociatedMessageItem *v4;
  IMAssociatedMessageItem *v5;
  uint64_t v6;
  NSString *associatedMessageGUID;
  NSString *v8;
  NSString *v9;
  unsigned __int8 v10;
  int64_t associatedMessageType;
  uint64_t v12;
  BOOL v13;
  NSArray *consumedSessionPayloads;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  void *v19;
  objc_super v20;
  objc_super v21;

  v4 = (IMAssociatedMessageItem *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v21.receiver = self;
      v21.super_class = (Class)IMAssociatedMessageItem;
      if (!-[IMMessageItem isEqual:](&v21, sel_isEqual_, v5))
      {
        v10 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v6 = 536;
      associatedMessageGUID = self->_associatedMessageGUID;
      -[IMAssociatedMessageItem associatedMessageGUID](v5, "associatedMessageGUID");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (associatedMessageGUID == v8
        || (v9 = self->_associatedMessageGUID,
            -[IMAssociatedMessageItem associatedMessageGUID](v5, "associatedMessageGUID"),
            v6 = objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v9, "isEqualToString:", v6)))
      {
        associatedMessageType = self->_associatedMessageType;
        if (associatedMessageType == -[IMAssociatedMessageItem associatedMessageType](v5, "associatedMessageType")
          && (self->_associatedMessageRange.location == -[IMAssociatedMessageItem associatedMessageRange](v5, "associatedMessageRange")? (v13 = self->_associatedMessageRange.length == v12): (v13 = 0), v13))
        {
          consumedSessionPayloads = self->_consumedSessionPayloads;
          -[IMAssociatedMessageItem consumedSessionPayloads](v5, "consumedSessionPayloads");
          v16 = objc_claimAutoreleasedReturnValue();
          if (consumedSessionPayloads == (NSArray *)v16)
          {

            v10 = 1;
          }
          else
          {
            v17 = (void *)v16;
            v18 = self->_consumedSessionPayloads;
            -[IMAssociatedMessageItem consumedSessionPayloads](v5, "consumedSessionPayloads");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[NSArray isEqualToArray:](v18, "isEqualToArray:", v19);

          }
        }
        else
        {
          v10 = 0;
        }
        if (associatedMessageGUID == v8)
          goto LABEL_18;
      }
      else
      {
        v10 = 0;
      }

LABEL_18:
      goto LABEL_19;
    }
    v20.receiver = self;
    v20.super_class = (Class)IMAssociatedMessageItem;
    v10 = -[IMMessageItem isEqual:](&v20, sel_isEqual_, v4);
  }
LABEL_20:

  return v10;
}

- (IMAssociatedMessageItem)initWithDictionary:(id)a3 hint:(id)a4
{
  id v6;
  IMAssociatedMessageItem *v7;
  IMAssociatedMessageItem *v8;
  void *v9;
  uint64_t v10;
  NSString *associatedMessageGUID;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *associatedMessageEmoji;
  void *v18;
  uint64_t v19;
  NSArray *consumedSessionPayloads;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IMAssociatedMessageItem;
  v7 = -[IMMessageItem initWithDictionary:hint:](&v22, sel_initWithDictionary_hint_, v6, a4);
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("associatedMessageGUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    associatedMessageGUID = v8->_associatedMessageGUID;
    v8->_associatedMessageGUID = (NSString *)v10;

    objc_msgSend(v6, "objectForKey:", CFSTR("associatedMessageType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_associatedMessageType = objc_msgSend(v12, "longLongValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("associatedMessageRangeLocation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_associatedMessageRange.location = objc_msgSend(v13, "integerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("associatedMessageRangeLength"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_associatedMessageRange.length = objc_msgSend(v14, "integerValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("associatedMessageEmoji"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    associatedMessageEmoji = v8->_associatedMessageEmoji;
    v8->_associatedMessageEmoji = (NSString *)v16;

    objc_msgSend(v6, "objectForKey:", CFSTR("consumedSessionPayloads"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    consumedSessionPayloads = v8->_consumedSessionPayloads;
    v8->_consumedSessionPayloads = (NSArray *)v19;

  }
  return v8;
}

- (id)copyDictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *associatedMessageGUID;
  void *v6;
  void *v7;
  void *v8;
  NSString *associatedMessageEmoji;
  NSArray *consumedSessionPayloads;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMAssociatedMessageItem;
  v3 = -[IMMessageItem copyDictionaryRepresentation](&v13, sel_copyDictionaryRepresentation);
  v4 = v3;
  associatedMessageGUID = self->_associatedMessageGUID;
  if (associatedMessageGUID)
    CFDictionarySetValue(v3, CFSTR("associatedMessageGUID"), associatedMessageGUID);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_associatedMessageType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v4, CFSTR("associatedMessageType"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_associatedMessageRange.location);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v4, CFSTR("associatedMessageRangeLocation"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_associatedMessageRange.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v4, CFSTR("associatedMessageRangeLength"), v8);

  associatedMessageEmoji = self->_associatedMessageEmoji;
  if (associatedMessageEmoji)
    CFDictionarySetValue(v4, CFSTR("associatedMessageEmoji"), associatedMessageEmoji);
  consumedSessionPayloads = self->_consumedSessionPayloads;
  if (consumedSessionPayloads)
    CFDictionarySetValue(v4, CFSTR("consumedSessionPayloads"), consumedSessionPayloads);
  if (-[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") == 3)
  {
    -[IMMessageItem bodyData](self, "bodyData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      CFDictionarySetValue(v4, CFSTR("bodyData"), v11);

  }
  return v4;
}

- (_NSRange)associatedMessageRange
{
  _NSRange *p_associatedMessageRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_associatedMessageRange = &self->_associatedMessageRange;
  location = self->_associatedMessageRange.location;
  length = p_associatedMessageRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSticker, 0);
  objc_storeStrong((id *)&self->_tapback, 0);
  objc_storeStrong((id *)&self->_consumedSessionPayloads, 0);
  objc_storeStrong((id *)&self->_associatedMessageEmoji, 0);
  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
}

- (IMAssociatedMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 associatedMessageGUID:(id)a11 associatedMessageType:(int64_t)a12 associatedMessageRange:(_NSRange)a13 messageSummaryInfo:(id)a14 threadIdentifier:(id)a15
{
  id v20;
  id v21;
  IMAssociatedMessageItem *v22;
  uint64_t v23;
  NSString *associatedMessageGUID;
  objc_super v28;

  v20 = a11;
  v21 = a14;
  v28.receiver = self;
  v28.super_class = (Class)IMAssociatedMessageItem;
  v22 = -[IMMessageItem initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:type:threadIdentifier:](&v28, sel_initWithSender_time_body_attributes_fileTransferGUIDs_flags_error_guid_type_threadIdentifier_, a3, a4, a5, a6, a7, a8, a9, a10, 0, a15);
  if (v22)
  {
    v23 = objc_msgSend(v20, "copy");
    associatedMessageGUID = v22->_associatedMessageGUID;
    v22->_associatedMessageGUID = (NSString *)v23;

    v22->_associatedMessageType = a12;
    v22->_associatedMessageRange = a13;
    -[IMMessageItem setMessageSummaryInfo:](v22, "setMessageSummaryInfo:", v21);
  }

  return v22;
}

- (IMAssociatedMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 associatedMessageGUID:(id)a11 associatedMessageType:(int64_t)a12 associatedMessageRange:(_NSRange)a13 associatedMessageEmoji:(id)a14 messageSummaryInfo:(id)a15 threadIdentifier:(id)a16
{
  id v20;
  id v21;
  IMAssociatedMessageItem *v22;
  uint64_t v23;
  NSString *associatedMessageGUID;
  id v29;
  objc_super v30;

  v20 = a11;
  v29 = a14;
  v21 = a15;
  v30.receiver = self;
  v30.super_class = (Class)IMAssociatedMessageItem;
  v22 = -[IMMessageItem initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:type:threadIdentifier:](&v30, sel_initWithSender_time_body_attributes_fileTransferGUIDs_flags_error_guid_type_threadIdentifier_, a3, a4, a5, a6, a7, a8, a9, a10, 0, a16);
  if (v22)
  {
    v23 = objc_msgSend(v20, "copy");
    associatedMessageGUID = v22->_associatedMessageGUID;
    v22->_associatedMessageGUID = (NSString *)v23;

    v22->_associatedMessageType = a12;
    v22->_associatedMessageRange = a13;
    objc_storeStrong((id *)&v22->_associatedMessageEmoji, a14);
    -[IMMessageItem setMessageSummaryInfo:](v22, "setMessageSummaryInfo:", v21);
  }

  return v22;
}

- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 bizIntent:(id)a32 locale:(id)a33 biaReferenceID:(id)a34 messageSummaryInfo:(id)a35 partCount:(unint64_t)a36 threadIdentifier:(id)a37
{
  id v38;
  id v39;
  IMAssociatedMessageItem *v40;
  uint64_t v41;
  NSString *associatedMessageGUID;
  objc_super v50;

  v38 = a29;
  v39 = a35;
  v50.receiver = self;
  v50.super_class = (Class)IMAssociatedMessageItem;
  v40 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](&v50, sel_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_bizIntent_locale_biaReferenceID_errorType_type_threadIdentifier_syndicationRanges_syncedSyndicationRanges_partCount_dateEdited_scheduleType_scheduleState_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          a32,
          a33,
          a34,
          a28,
          0,
          a37,
          0,
          0,
          a36,
          0,
          0,
          0);
  if (v40)
  {
    v41 = objc_msgSend(v38, "copy");
    associatedMessageGUID = v40->_associatedMessageGUID;
    v40->_associatedMessageGUID = (NSString *)v41;

    v40->_associatedMessageType = a30;
    v40->_associatedMessageRange = a31;
    -[IMMessageItem setMessageSummaryInfo:](v40, "setMessageSummaryInfo:", v39);
  }

  return v40;
}

- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 bizIntent:(id)a32 locale:(id)a33 biaReferenceID:(id)a34 messageSummaryInfo:(id)a35 partCount:(unint64_t)a36 threadIdentifier:(id)a37 scheduleType:(unint64_t)a38 scheduleState:(unint64_t)a39
{
  id v40;
  id v41;
  IMAssociatedMessageItem *v42;
  uint64_t v43;
  NSString *associatedMessageGUID;
  objc_super v52;

  v40 = a29;
  v41 = a35;
  v52.receiver = self;
  v52.super_class = (Class)IMAssociatedMessageItem;
  v42 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](&v52, sel_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_bizIntent_locale_biaReferenceID_errorType_type_threadIdentifier_syndicationRanges_syncedSyndicationRanges_partCount_dateEdited_scheduleType_scheduleState_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          a32,
          a33,
          a34,
          a28,
          0,
          a37,
          0,
          0,
          a36,
          0,
          a38,
          a39);
  if (v42)
  {
    v43 = objc_msgSend(v40, "copy");
    associatedMessageGUID = v42->_associatedMessageGUID;
    v42->_associatedMessageGUID = (NSString *)v43;

    v42->_associatedMessageType = a30;
    v42->_associatedMessageRange = a31;
    -[IMMessageItem setMessageSummaryInfo:](v42, "setMessageSummaryInfo:", v41);
  }

  return v42;
}

- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 associatedMessageEmoji:(id)a32 bizIntent:(id)a33 locale:(id)a34 biaReferenceID:(id)a35 messageSummaryInfo:(id)a36 partCount:(unint64_t)a37 threadIdentifier:(id)a38 scheduleType:(unint64_t)a39 scheduleState:(unint64_t)a40
{
  id v41;
  id v42;
  id v43;
  IMAssociatedMessageItem *v44;
  uint64_t v45;
  NSString *associatedMessageGUID;
  objc_super v54;

  v41 = a29;
  v42 = a32;
  v54.receiver = self;
  v54.super_class = (Class)IMAssociatedMessageItem;
  v43 = a36;
  v44 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](&v54, sel_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_bizIntent_locale_biaReferenceID_errorType_type_threadIdentifier_syndicationRanges_syncedSyndicationRanges_partCount_dateEdited_scheduleType_scheduleState_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          a33,
          a34,
          a35,
          a28,
          0,
          a38,
          0,
          0,
          a37,
          0,
          a39,
          a40);
  if (v44)
  {
    v45 = objc_msgSend(v41, "copy");
    associatedMessageGUID = v44->_associatedMessageGUID;
    v44->_associatedMessageGUID = (NSString *)v45;

    v44->_associatedMessageType = a30;
    v44->_associatedMessageRange = a31;
    objc_storeStrong((id *)&v44->_associatedMessageEmoji, a32);
    -[IMMessageItem setMessageSummaryInfo:](v44, "setMessageSummaryInfo:", v43);
  }

  return v44;
}

- (IMAssociatedMessageItem)initWithMessageItem:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  IMAssociatedMessageItem *v31;
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
  void *v46;
  void *v47;

  v3 = a3;
  objc_msgSend(v3, "senderInfo");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "time");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeRead");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeDelivered");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timePlayed");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "body");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bodyData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileTransferGUIDs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v3, "flags");
  objc_msgSend(v3, "guid");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v3, "messageID");
  objc_msgSend(v3, "account");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roomName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unformattedID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v3, "expireState");
  objc_msgSend(v3, "balloonBundleID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressiveSendStyleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeExpressiveSendPlayed");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "errorCode");
  objc_msgSend(v3, "associatedMessageGUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "associatedMessageType");
  v4 = objc_msgSend(v3, "associatedMessageRange");
  v17 = v5;
  v18 = v4;
  objc_msgSend(v3, "associatedMessageEmoji");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bizIntent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "biaReferenceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageSummaryInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "partCount");
  objc_msgSend(v3, "threadIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "scheduleType");
  v12 = objc_msgSend(v3, "scheduleState");

  LODWORD(v14) = v21;
  v31 = -[IMAssociatedMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:errorType:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:bizIntent:locale:biaReferenceID:messageSummaryInfo:partCount:threadIdentifier:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:errorType:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:bizIntent:locale:biaReferenceID:messageSummaryInfo:partCount:threadIdentifier:scheduleType:scheduleState:", v47, v46, v45, v44, v43, v41, v42, v40, 0, v39, v29, v37, v28,
          v38,
          v35,
          v34,
          v27,
          v36,
          v26,
          v25,
          v24,
          v33,
          v23,
          v22,
          v32,
          v14,
          v20,
          v19,
          v18,
          v17,
          v16,
          v15,
          v6,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12);

  return v31;
}

- (IMAssociatedMessageItem)initWithCoder:(id)a3
{
  id v4;
  IMAssociatedMessageItem *v5;
  void *v6;
  uint64_t v7;
  NSString *associatedMessageGUID;
  void *v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  NSString *associatedMessageEmoji;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *consumedSessionPayloads;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IMAssociatedMessageItem;
  v5 = -[IMMessageItem initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedMessageGUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    associatedMessageGUID = v5->_associatedMessageGUID;
    v5->_associatedMessageGUID = (NSString *)v7;

    v5->_associatedMessageType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("associatedMessageType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedMessageRange"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_associatedMessageRange.location = objc_msgSend(v9, "rangeValue");
    v5->_associatedMessageRange.length = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedMessageEmoji"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    associatedMessageEmoji = v5->_associatedMessageEmoji;
    v5->_associatedMessageEmoji = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("consumedSessionPayloads"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    consumedSessionPayloads = v5->_consumedSessionPayloads;
    v5->_consumedSessionPayloads = (NSArray *)v22;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMAssociatedMessageItem;
  v4 = a3;
  -[IMMessageItem encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedMessageGUID, CFSTR("associatedMessageGUID"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_associatedMessageType, CFSTR("associatedMessageType"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_associatedMessageRange.location, self->_associatedMessageRange.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("associatedMessageRange"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedMessageEmoji, CFSTR("associatedMessageEmoji"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_consumedSessionPayloads, CFSTR("consumedSessionPayloads"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMAssociatedMessageItem;
  v4 = -[IMMessageItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[IMAssociatedMessageItem associatedMessageGUID](self, "associatedMessageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssociatedMessageGUID:", v5);

  objc_msgSend(v4, "setAssociatedMessageType:", -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType"));
  v6 = -[IMAssociatedMessageItem associatedMessageRange](self, "associatedMessageRange");
  objc_msgSend(v4, "setAssociatedMessageRange:", v6, v7);
  -[IMAssociatedMessageItem associatedMessageEmoji](self, "associatedMessageEmoji");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssociatedMessageEmoji:", v8);

  return v4;
}

- (id)copyForBackwardsCompatibility
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMAssociatedMessageItem;
  v2 = -[IMMessageItem copyForBackwardsCompatibility](&v4, sel_copyForBackwardsCompatibility);
  objc_msgSend(v2, "setAssociatedMessageGUID:", 0);
  objc_msgSend(v2, "setAssociatedMessageRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v2, "setAssociatedMessageType:", 0);
  objc_msgSend(v2, "setAssociatedMessageEmoji:", 0);
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *associatedMessageGUID;
  int64_t associatedMessageType;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)IMAssociatedMessageItem;
  -[IMMessageItem description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  associatedMessageGUID = self->_associatedMessageGUID;
  associatedMessageType = self->_associatedMessageType;
  NSStringFromRange(self->_associatedMessageRange);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ associatedMessageGUID: %@, associatedMessageType: %lld, range: %@"), v4, associatedMessageGUID, associatedMessageType, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isAssociatedMessageItem
{
  return 1;
}

- (BOOL)isMessageAcknowledgment
{
  unint64_t v2;

  v2 = self->_associatedMessageType & 0xFFFFFFFFFFFFFFF8;
  return v2 == 3000 || v2 == 2000;
}

- (BOOL)isBreadcrumb
{
  return -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") == 2
      || -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") == 3;
}

- (BOOL)isSticker
{
  return (-[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") & 0xFFFFFFFFFFFFFFFELL) == 1000;
}

- (IMTapback)tapback
{
  int64_t v3;
  IMStickerTapback *v4;
  int64_t v6;
  IMEmojiTapback *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType");
  if ((unint64_t)(v3 - 3000) >= 6 && (unint64_t)(v3 - 2000) > 5)
  {
    v6 = -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType");
    if (v6 == 3006 || v6 == 2006)
    {
      v7 = [IMEmojiTapback alloc];
      -[IMAssociatedMessageItem associatedMessageEmoji](self, "associatedMessageEmoji");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[IMEmojiTapback initWithEmoji:isRemoved:](v7, "initWithEmoji:isRemoved:", v8, (-[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8) == 3000);

    }
    else
    {
      v9 = -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType");
      if (v9 == 3007 || v9 == 2007)
      {
        -[IMMessageItem fileTransferGUIDs](self, "fileTransferGUIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v4 = -[IMStickerTapback initWithTransferGUID:isRemoved:]([IMStickerTapback alloc], "initWithTransferGUID:isRemoved:", v11, (-[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8) == 3000);
        }
        else
        {
          IMLogHandleForCategory("IMAssociatedMessageItem");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            sub_19E36DF1C(v12, v13, v14, v15, v16, v17, v18, v19);

          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }
    }
  }
  else
  {
    v4 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType"));
  }
  return (IMTapback *)v4;
}

- (id)emojiString
{
  void *v3;
  void *v4;
  void *v5;

  if (-[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType") != 1001)
    goto LABEL_4;
  -[IMMessageItem body](self, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D362F8], &stru_1E3FBBA48);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "__im_hasEmoji") & 1) == 0)
  {

LABEL_4:
    v5 = 0;
  }
  return v5;
}

- (IMEmojiSticker)emojiSticker
{
  void *v2;
  IMEmojiSticker *v3;
  void *v4;
  IMEmojiSticker *v5;

  -[IMAssociatedMessageItem emojiString](self, "emojiString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [IMEmojiSticker alloc];
    +[IMEmojiSticker defaultEmojiStickerPackID](IMEmojiSticker, "defaultEmojiStickerPackID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[IMEmojiSticker initWithEmojiString:stickerPackID:](v3, "initWithEmojiString:stickerPackID:", v2, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEmojiSticker
{
  void *v2;
  BOOL v3;

  -[IMAssociatedMessageItem emojiString](self, "emojiString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSAttributedString)associatedMessagePartText
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imami_attributedStringForKey:", CFSTR("ampt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setAssociatedMessagePartText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (objc_msgSend(v4, "count"))
      v5 = (id)objc_msgSend(v4, "mutableCopy");
    else
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v5;
    objc_msgSend(v5, "__imami_setAttributedString:forKey:", v9, CFSTR("ampt"));
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ampt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("ampt"));
LABEL_8:
    v8 = (void *)objc_msgSend(v7, "copy");
    -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v8);

  }
}

- (NSString)associatedMessageEffect
{
  void *v2;
  void *v3;

  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ame"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAssociatedMessageEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[IMMessageItem messageSummaryInfo](self, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("ame"));
  -[IMMessageItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", v9);

}

- (void)setNeedsReloadForTransferStatusChangeWithType:(int64_t)a3
{
  self->_fileTransferReloadStatus = a3;
}

- (BOOL)_updateAssociatedMessagePartTextReplacingTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3
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
  -[IMAssociatedMessageItem associatedMessagePartText](self, "associatedMessagePartText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_19E24769C;
    v17 = sub_19E247534;
    v18 = 0;
    v18 = v5;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_19E2E8108;
    v8[3] = &unk_1E3FB6870;
    v8[4] = &v13;
    v8[5] = &v9;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
    if (*((_BYTE *)v10 + 24))
      -[IMAssociatedMessageItem setAssociatedMessagePartText:](self, "setAssociatedMessagePartText:", v14[5]);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3
{
  IMAssociatedMessageItem *v3;
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v3 = self;
  v7.receiver = self;
  v7.super_class = (Class)IMAssociatedMessageItem;
  v4 = a3;
  v5 = -[IMMessageItem updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:](&v7, sel_updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs_, v4);
  LOBYTE(v3) = -[IMAssociatedMessageItem _updateAssociatedMessagePartTextReplacingTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:](v3, "_updateAssociatedMessagePartTextReplacingTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:", v4, v7.receiver, v7.super_class);

  return v5 | v3;
}

- (void)setAssociatedMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_associatedMessageGUID, a3);
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  self->_associatedMessageType = a3;
}

- (void)setAssociatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (NSString)associatedMessageEmoji
{
  return self->_associatedMessageEmoji;
}

- (void)setAssociatedMessageEmoji:(id)a3
{
  objc_storeStrong((id *)&self->_associatedMessageEmoji, a3);
}

- (NSArray)consumedSessionPayloads
{
  return self->_consumedSessionPayloads;
}

- (void)setConsumedSessionPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_consumedSessionPayloads, a3);
}

- (void)setTapback:(id)a3
{
  objc_storeStrong((id *)&self->_tapback, a3);
}

- (void)setEmojiSticker:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSticker, a3);
}

- (int64_t)fileTransferReloadStatus
{
  return self->_fileTransferReloadStatus;
}

- (void)setFileTransferReloadStatus:(int64_t)a3
{
  self->_fileTransferReloadStatus = a3;
}

- (BOOL)isAvailabilityReplySupported
{
  return 0;
}

@end
