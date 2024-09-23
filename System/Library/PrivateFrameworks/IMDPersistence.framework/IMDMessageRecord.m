@implementation IMDMessageRecord

+ (id)allocWithZone:(_NSZone *)a3
{
  IMDMessageRecordGetTypeID();
  return (id)_CFRuntimeCreateInstance();
}

- (_IMDMessageRecordStruct)cfMessageRecord
{
  CFTypeID v3;

  v3 = CFGetTypeID(self);
  if (v3 == IMDMessageRecordGetTypeID())
    return (_IMDMessageRecordStruct *)self;
  else
    return 0;
}

- (void)_fetchUpdatedRecord
{
  return (void *)IMDMessageRecordCopyMessageRecordUnlocked(-[IMDMessageRecord rowID](self, "rowID"));
}

- (__CFArray)_localCache
{
  return (__CFArray *)-[IMDMessageRecord cfMessageRecord](self, "cfMessageRecord")[24];
}

- ($3947A809542915F75EEFCF1F658B679C)_propertyDescriptorForProperty:(SEL)a3
{
  char **v4;
  __int128 v5;

  v4 = &(&off_1E5AAF650)[5 * a4];
  v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1ABB9C22C(a3);
}

- (int64_t)rowID
{
  return (uint64_t)-[IMDMessageRecord cfMessageRecord](self, "cfMessageRecord")[16];
}

- (NSData)attributedBodyData
{
  return (NSData *)(id)IMDBridgedRecordCopyPropertyValue(self, 7);
}

- (NSAttributedString)attributedBodyText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[IMDMessageRecord attributedBodyData](self, "attributedBodyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    JWDecodeCodableObjectWithStandardAllowlist();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IMDMessageRecord text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[IMDMessageRecord text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0D366B8];
      v11[0] = &unk_1E5ADC000;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v8);

    }
    else
    {
      v4 = 0;
    }
  }

  return (NSAttributedString *)v4;
}

- (NSData)messageSummaryInfoData
{
  return (NSData *)(id)IMDBridgedRecordCopyPropertyValue(self, 58);
}

- (NSDictionary)messageSummaryInfo
{
  void *v2;
  void *v3;

  -[IMDMessageRecord messageSummaryInfoData](self, "messageSummaryInfoData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    JWDecodeCodableObjectWithStandardAllowlist();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSString)iMessageAppBundleID
{
  return (NSString *)(id)IMDBridgedRecordCopyPropertyValue(self, 52);
}

- (NSData)iMessageAppData
{
  return (NSData *)(id)IMDBridgedRecordCopyPropertyValue(self, 53);
}

- (BOOL)isReply
{
  void *v2;
  BOOL v3;

  -[IMDMessageRecord threadOriginatorGUID](self, "threadOriginatorGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isAssociatedMessage
{
  void *v2;
  BOOL v3;

  -[IMDMessageRecord associatedMessageGUID](self, "associatedMessageGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (IMDHandleRecord)handleRecord
{
  return (IMDHandleRecord *)IMDMessageRecordCopyHandle((const __CFArray **)-[IMDMessageRecord cfMessageRecord](self, "cfMessageRecord"));
}

- (IMDHandleRecord)otherHandleRecord
{
  return (IMDHandleRecord *)IMDMessageRecordCopyOtherHandle((const __CFArray **)-[IMDMessageRecord cfMessageRecord](self, "cfMessageRecord"));
}

- (NSArray)attachmentRecords
{
  return (NSArray *)(id)IMDMessageRecordCopyAttachments((uint64_t)-[IMDMessageRecord cfMessageRecord](self, "cfMessageRecord"));
}

- (IMDChatRecord)chatRecord
{
  return (IMDChatRecord *)(id)IMDChatRecordCopyChatForMessageID(-[IMDMessageRecord rowID](self, "rowID"));
}

- (NSDate)dateEdited
{
  void *v2;

  v2 = -[IMDMessageRecord rawDateEdited](self, "rawDateEdited");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)(uint64_t)v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (int64_t)rawDateEdited
{
  return IMDBridgedRecordCopyPropertyNumberAsInteger64(self, 75);
}

- (BOOL)hasDataDetectorResults
{
  return MEMORY[0x1E0DE7D20](self, sel_hasDdResults);
}

- (BOOL)isArchived
{
  return MEMORY[0x1E0DE7D20](self, sel_isArchive);
}

- (IMDMessageRecord)initWithItemType:(int64_t)a3 text:(id)a4 date:(int64_t)a5 dateRead:(int64_t)a6 dateDelivered:(int64_t)a7 datePlayed:(int64_t)a8 error:(int64_t)a9 type:(int64_t)a10 replaceID:(int64_t)a11 flags:(id)a12 guid:(id)a13 attributedBody:(id)a14 service:(id)a15 account:(id)a16 accountGUID:(id)a17 subject:(id)a18 handleID:(id)a19 countryCode:(id)a20 unformattedID:(id)a21 otherHandleID:(id)a22 groupTitle:(id)a23 groupActionType:(int64_t)a24 shareStatus:(int64_t)a25 shareDirection:(int64_t)a26 expireState:(int64_t)a27 messageActionType:(int64_t)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 associatedMessageEmoji:(id)a32 balloonBundleID:(id)a33 payloadData:(id)a34 expressiveSendStyleID:(id)a35 timeExpressiveSendPlayed:(int64_t)a36 messageSummaryInfo:(id)a37 cloudKitSyncState:(int64_t)a38 cloudKitRecordID:(id)a39 cloudKitServerChangeTokenBlob:(id)a40 cloudKitRecordChangeTag:(id)a41 dataDetectorsInfo:(id)a42 destinationCallerID:(id)a43 replyToGUID:(id)a44 sortID:(int64_t)a45 threadOriginatorGUID:(id)a46 threadOriginatorPart:(id)a47 syndicationRanges:(id)a48 syncedSyndicationRanges:(id)a49 partCount:(int64_t)a50 dateEdited:(int64_t)a51 biaReferenceID:(id)a52 fallbackHash:(id)a53 scheduleType:(int64_t)a54 scheduleState:(int64_t)a55
{
  id v55;
  id v56;
  id v57;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  IMDMessageRecord *v69;
  id v70;
  id v71;
  id v72;
  IMDMessageRecord *v78;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  objc_super v95;

  v95.receiver = self;
  v95.super_class = (Class)IMDMessageRecord;
  v72 = a53;
  v55 = a52;
  v71 = a49;
  v56 = a48;
  v70 = a47;
  v57 = a46;
  v68 = a44;
  v67 = a43;
  v59 = a42;
  v66 = a41;
  v65 = a40;
  v60 = a39;
  v61 = a37;
  v94 = a35;
  v93 = a34;
  v62 = a33;
  v63 = a32;
  v64 = a29;
  v92 = a23;
  v91 = a22;
  v90 = a21;
  v89 = a20;
  v88 = a19;
  v87 = a18;
  v86 = a17;
  v85 = a16;
  v84 = a15;
  v83 = a14;
  v82 = a13;
  v81 = a12;
  v80 = a4;
  v69 = -[IMDRecord init](&v95, sel_init);
  sub_1ABB9C8D0((_OWORD *)-[IMDMessageRecord cfMessageRecord](v69, "cfMessageRecord"), a3, (uint64_t)v80, a5, a6, a7, a8, a9, a10, a11, v81, (uint64_t)v82, (uint64_t)v83, (uint64_t)v84, (uint64_t)v85, (uint64_t)v86, (uint64_t)v87, (uint64_t)v88, (uint64_t)v89,
    (uint64_t)v90,
    (uint64_t)v91,
    (uint64_t)v92,
    a24,
    a25,
    a26,
    a27,
    a28,
    (uint64_t)v64,
    a30,
    a31.location,
    a31.length,
    (uint64_t)v62,
    (uint64_t)v93,
    (uint64_t)v94,
    a36,
    (uint64_t)v61,
    a38,
    (uint64_t)v60,
    (uint64_t)v65,
    (uint64_t)v66,
    (uint64_t)v59,
    (uint64_t)v67,
    (uint64_t)v68,
    a45,
    (uint64_t)v57,
    (uint64_t)v70,
    (uint64_t)v56,
    (uint64_t)v71,
    a50,
    a51,
    (uint64_t)v55,
    (uint64_t)v72,
    (uint64_t)v63,
    a54,
    a55);
  v78 = (IMDMessageRecord *)objc_claimAutoreleasedReturnValue();

  return v78;
}

- (IMDMessageRecord)init
{

  return 0;
}

+ (id)keyPathsToColumns
{
  if (qword_1ED0D37A0 != -1)
    dispatch_once(&qword_1ED0D37A0, &unk_1E5AAEF48);
  return (id)qword_1ED0D3780;
}

- (IMDMessageRecord)initWithRecordRef:(_IMDMessageRecordStruct *)a3
{
  _IMDMessageRecordStruct *v4;

  v4 = a3;

  return (IMDMessageRecord *)v4;
}

@end
