@implementation IMItem

- (NSDate)time
{
  return self->_time;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (NSString)service
{
  return self->_service;
}

- (NSString)guid
{
  return self->_guid;
}

+ (Class)classForMessageItemDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  switch(v5)
  {
    case 0:
      objc_msgSend(v3, "objectForKey:", CFSTR("associatedMessageGUID"));

      goto LABEL_4;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
LABEL_4:
      objc_opt_class();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }

  return (Class)v6;
}

- (id)copyDictionaryRepresentation
{
  __CFDictionary *Mutable;
  void *v4;
  NSDictionary *senderInfo;
  NSString *unformattedID;
  NSString *countryCode;
  NSString *guid;
  NSString *roomName;
  NSString *handle;
  NSString *account;
  NSString *accountID;
  NSString *service;
  void *v14;
  void *v15;
  void *v16;
  NSDate *time;
  void *v18;
  void *v19;
  NSString *cloudKitRecordID;
  NSData *cloudKitServerChangeTokenBlob;
  NSString *cloudKitRecordChangeTag;
  NSString *destinationCallerID;
  void *v24;
  NSString *replyToGUID;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = (void *)MEMORY[0x1A1AE8394]();
  senderInfo = self->_senderInfo;
  if (senderInfo)
    CFDictionarySetValue(Mutable, CFSTR("senderInfo"), senderInfo);
  unformattedID = self->_unformattedID;
  if (unformattedID)
    CFDictionarySetValue(Mutable, CFSTR("unformattedID"), unformattedID);
  countryCode = self->_countryCode;
  if (countryCode)
    CFDictionarySetValue(Mutable, CFSTR("countryCode"), countryCode);
  guid = self->_guid;
  if (guid)
    CFDictionarySetValue(Mutable, CFSTR("guid"), guid);
  roomName = self->_roomName;
  if (roomName)
    CFDictionarySetValue(Mutable, CFSTR("roomName"), roomName);
  handle = self->_handle;
  if (handle)
    CFDictionarySetValue(Mutable, CFSTR("handle"), handle);
  account = self->_account;
  if (account)
    CFDictionarySetValue(Mutable, CFSTR("account"), account);
  accountID = self->_accountID;
  if (accountID)
    CFDictionarySetValue(Mutable, CFSTR("accountID"), accountID);
  service = self->_service;
  if (service)
    CFDictionarySetValue(Mutable, CFSTR("service"), service);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_messageID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    CFDictionarySetValue(Mutable, CFSTR("messageID"), v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(Mutable, CFSTR("type"), v15);

  if (-[NSString length](self->_balloonBundleID, "length"))
  {
    -[IMItem balloonBundleID](self, "balloonBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      CFDictionarySetValue(Mutable, CFSTR("balloonBundleID"), v16);

  }
  time = self->_time;
  if (time)
  {
    -[NSDate timeIntervalSinceReferenceDate](time, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      CFDictionarySetValue(Mutable, CFSTR("time"), v18);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_cloudKitSyncState);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(Mutable, CFSTR("ckSyncState"), v19);

  cloudKitRecordID = self->_cloudKitRecordID;
  if (cloudKitRecordID)
    CFDictionarySetValue(Mutable, CFSTR("ckRecordID"), cloudKitRecordID);
  cloudKitServerChangeTokenBlob = self->_cloudKitServerChangeTokenBlob;
  if (cloudKitServerChangeTokenBlob)
    CFDictionarySetValue(Mutable, CFSTR("ckServerChangeTokenBlob"), cloudKitServerChangeTokenBlob);
  cloudKitRecordChangeTag = self->_cloudKitRecordChangeTag;
  if (cloudKitRecordChangeTag)
    CFDictionarySetValue(Mutable, CFSTR("ckRecordChangeTag"), cloudKitRecordChangeTag);
  destinationCallerID = self->_destinationCallerID;
  if (destinationCallerID)
    CFDictionarySetValue(Mutable, CFSTR("destinationCallerID"), destinationCallerID);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sortID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    CFDictionarySetValue(Mutable, CFSTR("sortID"), v24);

  replyToGUID = self->_replyToGUID;
  if (replyToGUID)
    CFDictionarySetValue(Mutable, CFSTR("replyToGUID"), replyToGUID);
  objc_autoreleasePoolPop(v4);
  return Mutable;
}

- (void)setBalloonBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_balloonBundleID, a3);
}

- (IMItem)initWithDictionary:(id)a3
{
  id v4;
  IMItem *v5;
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
  double v20;
  double v21;
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

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IMItem;
  v5 = -[IMItem init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("senderInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setSenderInfo:](v5, "setSenderInfo:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("guid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7)) == 0
      || (v9 = v8,
          objc_msgSend(v8, "UUIDString"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v10))
    {
      +[IMItem stringGUID](IMItem, "stringGUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[IMItem setGuid:](v5, "setGuid:", v10);
    objc_msgSend(v4, "objectForKey:", CFSTR("roomName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setRoomName:](v5, "setRoomName:", v11);

    objc_msgSend(v4, "objectForKey:", CFSTR("handle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setHandle:](v5, "setHandle:", v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("account"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setAccount:](v5, "setAccount:", v13);

    objc_msgSend(v4, "objectForKey:", CFSTR("accountID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setAccountID:](v5, "setAccountID:", v14);

    objc_msgSend(v4, "objectForKey:", CFSTR("service"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setService:](v5, "setService:", v15);

    objc_msgSend(v4, "objectForKey:", CFSTR("unformattedID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setUnformattedID:](v5, "setUnformattedID:", v16);

    objc_msgSend(v4, "objectForKey:", CFSTR("countryCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCountryCode:](v5, "setCountryCode:", v17);

    objc_msgSend(v4, "objectForKey:", CFSTR("balloonBundleID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setBalloonBundleID:](v5, "setBalloonBundleID:", v18);

    objc_msgSend(v4, "objectForKey:", CFSTR("time"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    if (v21 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMItem setTime:](v5, "setTime:", v22);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("messageID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_messageID = objc_msgSend(v23, "longLongValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v24, "longLongValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("ckSyncState"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCloudKitSyncState:](v5, "setCloudKitSyncState:", objc_msgSend(v25, "integerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("ckRecordID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCloudKitRecordID:](v5, "setCloudKitRecordID:", v26);

    objc_msgSend(v4, "objectForKey:", CFSTR("ckServerChangeTokenBlob"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCloudKitServerChangeTokenBlob:](v5, "setCloudKitServerChangeTokenBlob:", v27);

    objc_msgSend(v4, "objectForKey:", CFSTR("ckRecordChangeTag"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCloudKitRecordChangeTag:](v5, "setCloudKitRecordChangeTag:", v28);

    objc_msgSend(v4, "objectForKey:", CFSTR("destinationCallerID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setDestinationCallerID:](v5, "setDestinationCallerID:", v29);

    objc_msgSend(v4, "objectForKey:", CFSTR("sortID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setSortID:](v5, "setSortID:", objc_msgSend(v30, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("replyToGUID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setReplyToGUID:](v5, "setReplyToGUID:", v31);

  }
  return v5;
}

- (void)setSortID:(unint64_t)a3
{
  self->_sortID = a3;
}

- (void)setUnformattedID:(id)a3
{
  objc_storeStrong((id *)&self->_unformattedID, a3);
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void)setSenderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_senderInfo, a3);
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (void)setReplyToGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (void)setDestinationCallerID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationCallerID, a3);
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)setCloudKitSyncState:(int64_t)a3
{
  self->_cloudKitSyncState = a3;
}

- (void)setCloudKitServerChangeTokenBlob:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setCloudKitRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setCloudKitRecordChangeTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)isEqual:(id)a3
{
  IMItem *v4;
  IMItem *v5;
  int64_t type;
  int64_t messageID;
  NSString *guid;
  NSString *v9;
  NSString *v10;
  void *v11;
  unsigned __int8 v12;
  NSString *handle;
  NSString *v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  NSDictionary *senderInfo;
  NSDictionary *v20;
  NSDictionary *v21;
  uint64_t v22;
  NSDictionary *v23;
  void *v24;
  NSDate *time;
  NSDate *v26;
  NSDate *v27;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  NSString *roomName;
  NSString *v32;
  void *v33;
  NSString *service;
  NSString *v35;
  void *v36;
  NSString *accountID;
  NSString *v38;
  void *v39;
  NSString *account;
  NSString *v41;
  void *v42;
  NSString *destinationCallerID;
  uint64_t v44;
  NSString *v45;
  uint64_t v46;
  NSString *v47;
  void *v48;
  unint64_t v49;
  unint64_t sortID;
  BOOL v51;
  void *v53;
  void *v54;
  NSString *v55;
  uint64_t v56;
  void *v57;
  NSString *v58;
  uint64_t v59;
  void *v60;
  NSString *v61;
  uint64_t v62;
  void *v63;
  NSString *v64;
  uint64_t v65;
  void *v66;
  NSDate *v67;
  NSString *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  NSDate *v72;
  void *v73;
  NSDictionary *v74;
  void *v75;
  objc_super v76;

  v4 = (IMItem *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type != -[IMItem type](v5, "type")
        || (messageID = self->_messageID, messageID != -[IMItem messageID](v5, "messageID")))
      {
        v12 = 0;
LABEL_62:

        goto LABEL_63;
      }
      guid = self->_guid;
      -[IMItem guid](v5, "guid");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (guid != v9)
      {
        v10 = self->_guid;
        -[IMItem guid](v5, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v10, "isEqualToString:", v11))
        {
          v12 = 0;
          goto LABEL_60;
        }
        v75 = v11;
      }
      handle = self->_handle;
      -[IMItem handle](v5, "handle");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (handle != v14)
      {
        v15 = self->_handle;
        -[IMItem handle](v5, "handle");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = (void *)v16;
        if (!-[NSString isEqualToString:](v17, "isEqualToString:", v16))
        {
          v12 = 0;
          v11 = v75;
LABEL_58:

LABEL_59:
          if (guid == v9)
          {
LABEL_61:

            goto LABEL_62;
          }
LABEL_60:

          goto LABEL_61;
        }
        v73 = v18;
      }
      senderInfo = self->_senderInfo;
      -[IMItem senderInfo](v5, "senderInfo");
      v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v74 = senderInfo;
      if (senderInfo != v20)
      {
        v21 = self->_senderInfo;
        -[IMItem senderInfo](v5, "senderInfo");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v21;
        v24 = (void *)v22;
        if (!-[NSDictionary isEqualToDictionary:](v23, "isEqualToDictionary:", v22))
        {
          v12 = 0;
LABEL_56:

LABEL_57:
          v51 = handle == v14;
          v11 = v75;
          v18 = v73;
          if (v51)
            goto LABEL_59;
          goto LABEL_58;
        }
        v71 = v24;
      }
      time = self->_time;
      -[IMItem time](v5, "time");
      v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v72 = time;
      if (time != v26)
      {
        v27 = self->_time;
        -[IMItem time](v5, "time");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqualToDate:](v27, "isEqualToDate:"))
        {
          v12 = 0;
LABEL_54:

LABEL_55:
          v24 = v71;
          if (v74 == v20)
            goto LABEL_57;
          goto LABEL_56;
        }
      }
      v28 = self->_handle;
      -[IMItem handle](v5, "handle");
      v68 = v28;
      v69 = objc_claimAutoreleasedReturnValue();
      if (v28 != (NSString *)v69)
      {
        v29 = self->_handle;
        -[IMItem handle](v5, "handle");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v29, "isEqualToString:"))
        {
          v12 = 0;
          v30 = (NSString *)v69;
LABEL_52:

LABEL_53:
          if (v72 == v26)
            goto LABEL_55;
          goto LABEL_54;
        }
      }
      roomName = self->_roomName;
      -[IMItem roomName](v5, "roomName");
      v64 = roomName;
      v65 = objc_claimAutoreleasedReturnValue();
      v67 = v26;
      if (roomName != (NSString *)v65)
      {
        v32 = self->_roomName;
        -[IMItem roomName](v5, "roomName");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v32, "isEqualToString:"))
        {
          v12 = 0;
          v30 = (NSString *)v69;
          v33 = (void *)v65;
LABEL_50:

LABEL_51:
          v26 = v67;
          if (v68 == v30)
            goto LABEL_53;
          goto LABEL_52;
        }
      }
      service = self->_service;
      -[IMItem service](v5, "service");
      v61 = service;
      v62 = objc_claimAutoreleasedReturnValue();
      if (service != (NSString *)v62)
      {
        v35 = self->_service;
        -[IMItem service](v5, "service");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v35, "isEqualToString:"))
        {
          v12 = 0;
          v30 = (NSString *)v69;
          v36 = (void *)v62;
LABEL_48:

LABEL_49:
          v33 = (void *)v65;
          if (v64 == (NSString *)v65)
            goto LABEL_51;
          goto LABEL_50;
        }
      }
      accountID = self->_accountID;
      -[IMItem accountID](v5, "accountID");
      v58 = accountID;
      v59 = objc_claimAutoreleasedReturnValue();
      if (accountID != (NSString *)v59)
      {
        v38 = self->_accountID;
        -[IMItem accountID](v5, "accountID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v38, "isEqualToString:"))
        {
          v12 = 0;
          v30 = (NSString *)v69;
          v39 = (void *)v59;
LABEL_46:

LABEL_47:
          v36 = (void *)v62;
          if (v61 == (NSString *)v62)
            goto LABEL_49;
          goto LABEL_48;
        }
      }
      account = self->_account;
      -[IMItem account](v5, "account");
      v55 = account;
      v56 = objc_claimAutoreleasedReturnValue();
      if (account == (NSString *)v56
        || (v41 = self->_account,
            -[IMItem account](v5, "account"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v41, "isEqualToString:")))
      {
        destinationCallerID = self->_destinationCallerID;
        -[IMItem destinationCallerID](v5, "destinationCallerID");
        v44 = objc_claimAutoreleasedReturnValue();
        if (destinationCallerID == (NSString *)v44)
        {
          sortID = self->_sortID;
          v12 = sortID == -[IMItem sortID](v5, "sortID");

        }
        else
        {
          v53 = (void *)v44;
          v45 = self->_destinationCallerID;
          -[IMItem destinationCallerID](v5, "destinationCallerID");
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = v45;
          v48 = (void *)v46;
          if (-[NSString isEqualToString:](v47, "isEqualToString:", v46))
          {
            v49 = self->_sortID;
            v12 = v49 == -[IMItem sortID](v5, "sortID");

          }
          else
          {

            v12 = 0;
          }
        }
        v42 = (void *)v56;
        v30 = (NSString *)v69;
        if (v55 == (NSString *)v56)
        {
LABEL_45:

          v39 = (void *)v59;
          if (v58 == (NSString *)v59)
            goto LABEL_47;
          goto LABEL_46;
        }
      }
      else
      {
        v12 = 0;
        v30 = (NSString *)v69;
        v42 = (void *)v56;
      }

      goto LABEL_45;
    }
    v76.receiver = self;
    v76.super_class = (Class)IMItem;
    v12 = -[IMItem isEqual:](&v76, sel_isEqual_, v4);
  }
LABEL_63:

  return v12;
}

- (unint64_t)sortID
{
  return self->_sortID;
}

- (int64_t)associatedMessageType
{
  return 0;
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)associatedMessageGUID
{
  return 0;
}

- (int64_t)messageID
{
  return self->_messageID;
}

- (NSString)balloonBundleID
{
  return self->_balloonBundleID;
}

- (NSString)account
{
  return self->_account;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_parentChatID, 0);
  objc_storeStrong((id *)&self->_cloudKitRecordChangeTag, 0);
  objc_storeStrong((id *)&self->_cloudKitServerChangeTokenBlob, 0);
  objc_storeStrong((id *)&self->_cloudKitRecordID, 0);
  objc_storeStrong((id *)&self->_personCentric, 0);
  objc_storeStrong((id *)&self->_replyToGUID, 0);
  objc_storeStrong((id *)&self->_clientSendTime, 0);
  objc_storeStrong((id *)&self->_destinationCallerID, 0);
  objc_storeStrong((id *)&self->_balloonBundleID, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_unformattedID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (Class)classForIMItemType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "classForMessageItemDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (id)stringGUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)IMItem;
  -[IMItem description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMItem messageID](self, "messageID");
  -[IMItem guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem time](self, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IMItem cloudKitSyncState](self, "cloudKitSyncState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem cloudKitRecordID](self, "cloudKitRecordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItem destinationCallerID](self, "destinationCallerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMItem sortID](self, "sortID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMItem wasDetonated](self, "wasDetonated"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[IMItem service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("[%@ messageID: %lld guid: %@ time: %@ ck-sync-state: %@ ck-record-id %@ destinationCallerID: %@ sortID %@ wasDetonated: %@ service: %@]"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (IMItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 type:(int64_t)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  IMItem *v15;
  IMItem *v16;
  id v17;
  id v18;
  IMItem *v19;

  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = *MEMORY[0x1E0D36D90];
    v12 = a5;
    v13 = a4;
    objc_msgSend(v10, "dictionaryWithObject:forKey:", a3, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IMItem initWithSenderInfo:time:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:type:](self, "initWithSenderInfo:time:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:type:", v14, v13, v12, 0, 0, 0, 0, 0, 0, 0, 0, a6);

    v16 = v15;
  }
  else
  {
    v17 = a5;
    v18 = a4;
    v19 = -[IMItem initWithSenderInfo:time:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:type:](self, "initWithSenderInfo:time:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:type:", 0, v18, v17, 0, 0, 0, 0, 0, 0, 0, 0, a6);

    v16 = v19;
  }

  return v16;
}

- (IMItem)initWithSenderInfo:(id)a3 time:(id)a4 guid:(id)a5 messageID:(int64_t)a6 account:(id)a7 accountID:(id)a8 service:(id)a9 handle:(id)a10 roomName:(id)a11 unformattedID:(id)a12 countryCode:(id)a13 type:(int64_t)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  IMItem *v29;
  IMItem *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v38;
  id v39;
  objc_super v40;

  v18 = a3;
  v39 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  v22 = v20;
  v23 = a9;
  v24 = v21;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a13;
  v40.receiver = self;
  v40.super_class = (Class)IMItem;
  v29 = -[IMItem init](&v40, sel_init);
  v30 = v29;
  if (v29)
  {
    -[IMItem setSenderInfo:](v29, "setSenderInfo:", v18);
    -[IMItem setRoomName:](v30, "setRoomName:", v26);
    -[IMItem setHandle:](v30, "setHandle:", v25);
    -[IMItem setAccount:](v30, "setAccount:", v22);
    -[IMItem setAccountID:](v30, "setAccountID:", v24);
    v38 = v23;
    -[IMItem setService:](v30, "setService:", v23);
    if (v39)
    {
      -[IMItem setTime:](v30, "setTime:", v39);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v31 = v18;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMItem setTime:](v30, "setTime:", v32);

      v18 = v31;
    }
    -[IMItem setCountryCode:](v30, "setCountryCode:", v28);
    -[IMItem setUnformattedID:](v30, "setUnformattedID:", v27);
    if (v19)
    {
      -[IMItem setGuid:](v30, "setGuid:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v33 = v18;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMItem setGuid:](v30, "setGuid:", v34);

      v18 = v33;
    }
    -[IMItem setCloudKitSyncState:](v30, "setCloudKitSyncState:", 0);
    -[IMItem setCloudKitRecordID:](v30, "setCloudKitRecordID:", 0);
    -[IMItem setCloudKitServerChangeTokenBlob:](v30, "setCloudKitServerChangeTokenBlob:", 0);
    -[IMItem setCloudKitRecordChangeTag:](v30, "setCloudKitRecordChangeTag:", 0);
    -[IMItem setSortID:](v30, "setSortID:", 0);
    v23 = v38;
    v30->_messageID = a6;
    v30->_type = a14;
  }

  return v30;
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

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[IMItem senderInfo](self, "senderInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderInfo:", v5);

  -[IMItem time](self, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTime:", v6);

  -[IMItem guid](self, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuid:", v7);

  -[IMItem roomName](self, "roomName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoomName:", v8);

  -[IMItem handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandle:", v9);

  -[IMItem account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccount:", v10);

  -[IMItem accountID](self, "accountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountID:", v11);

  -[IMItem service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v12);

  -[IMItem destinationCallerID](self, "destinationCallerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinationCallerID:", v13);

  -[IMItem countryCode](self, "countryCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCountryCode:", v14);

  -[IMItem unformattedID](self, "unformattedID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnformattedID:", v15);

  objc_msgSend(v4, "setType:", -[IMItem type](self, "type"));
  -[IMItem context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContext:", v16);

  -[IMItem balloonBundleID](self, "balloonBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBalloonBundleID:", v17);

  -[IMItem clientSendTime](self, "clientSendTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientSendTime:", v18);

  objc_msgSend(v4, "setSortID:", -[IMItem sortID](self, "sortID"));
  return v4;
}

- (IMItem)initWithCoder:(id)a3
{
  id v4;
  IMItem *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)IMItem;
  v5 = -[IMItem init](&v32, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("senderInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setSenderInfo:](v5, "setSenderInfo:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setGuid:](v5, "setGuid:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roomName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setRoomName:](v5, "setRoomName:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setHandle:](v5, "setHandle:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setAccount:](v5, "setAccount:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setAccountID:](v5, "setAccountID:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setService:](v5, "setService:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationCallerID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setDestinationCallerID:](v5, "setDestinationCallerID:", v20);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("time"));
    if (v21 > 10.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMItem setTime:](v5, "setTime:", v22);

    }
    v5->_messageID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("messageID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCountryCode:](v5, "setCountryCode:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unformattedID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setUnformattedID:](v5, "setUnformattedID:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balloonBundleID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setBalloonBundleID:](v5, "setBalloonBundleID:", v25);

    v5->_cloudKitSyncState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ckSyncState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckRecordID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCloudKitRecordID:](v5, "setCloudKitRecordID:", v26);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckServerChangeTokenBlob"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCloudKitServerChangeTokenBlob:](v5, "setCloudKitServerChangeTokenBlob:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckRecordChangeTag"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setCloudKitRecordChangeTag:](v5, "setCloudKitRecordChangeTag:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setSortID:](v5, "setSortID:", objc_msgSend(v29, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replyToGUID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItem setReplyToGUID:](v5, "setReplyToGUID:", v30);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", type, CFSTR("type"));
  -[IMItem senderInfo](self, "senderInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("senderInfo"));

  -[IMItem guid](self, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("guid"));

  -[IMItem roomName](self, "roomName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("roomName"));

  -[IMItem handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("handle"));

  -[IMItem account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("account"));

  -[IMItem accountID](self, "accountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("accountID"));

  -[IMItem service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("service"));

  -[IMItem destinationCallerID](self, "destinationCallerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("destinationCallerID"));

  -[IMItem time](self, "time");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("time"), v16);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_messageID, CFSTR("messageID"));
  -[IMItem countryCode](self, "countryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("countryCode"));

  -[IMItem unformattedID](self, "unformattedID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("unformattedID"));

  -[IMItem balloonBundleID](self, "balloonBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("balloonBundleID"));

  objc_msgSend(v5, "encodeInt64:forKey:", self->_cloudKitSyncState, CFSTR("ckSyncState"));
  -[IMItem cloudKitRecordID](self, "cloudKitRecordID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("ckRecordID"));

  -[IMItem cloudKitServerChangeTokenBlob](self, "cloudKitServerChangeTokenBlob");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v21, CFSTR("ckServerChangeTokenBlob"));

  -[IMItem cloudKitRecordChangeTag](self, "cloudKitRecordChangeTag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v22, CFSTR("ckRecordChangeTag"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMItem sortID](self, "sortID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v23, CFSTR("sortID"));

  -[IMItem replyToGUID](self, "replyToGUID");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v24, CFSTR("replyToGUID"));

}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = -[IMItem copyDictionaryRepresentation](self, "copyDictionaryRepresentation");
  if (v4)
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

- (id)dictionaryRepresentation
{
  return -[IMItem copyDictionaryRepresentation](self, "copyDictionaryRepresentation");
}

- (BOOL)isFromMe
{
  void *v2;
  BOOL v3;

  -[IMItem sender](self, "sender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setSender:(id)a3
{
  void *v4;
  CFMutableDictionaryRef Mutable;
  uint64_t v6;
  CFMutableDictionaryRef v7;
  id v8;

  v8 = a3;
  -[IMItem senderInfo](self, "senderInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (CFMutableDictionaryRef)objc_msgSend(v4, "mutableCopy");

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v6 = *MEMORY[0x1E0D36D90];
  if (v8)
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v8, v6);
  else
    -[__CFDictionary removeObjectForKey:](Mutable, "removeObjectForKey:", v6);
  if (-[__CFDictionary count](Mutable, "count"))
    v7 = Mutable;
  else
    v7 = 0;
  -[IMItem setSenderInfo:](self, "setSenderInfo:", v7);

}

- (void)setPersonCentricID:(id)a3
{
  void *v4;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v6;
  id v7;

  v7 = a3;
  -[IMItem senderInfo](self, "senderInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (CFMutableDictionaryRef)objc_msgSend(v4, "mutableCopy");

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v7)
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v7, CFSTR("FZPersonPersonCentricID"));
  else
    -[__CFDictionary removeObjectForKey:](Mutable, "removeObjectForKey:", CFSTR("FZPersonPersonCentricID"));
  if (-[__CFDictionary count](Mutable, "count"))
    v6 = Mutable;
  else
    v6 = 0;
  -[IMItem setSenderInfo:](self, "setSenderInfo:", v6);

}

- (NSString)sender
{
  return (NSString *)-[NSDictionary objectForKey:](self->_senderInfo, "objectForKey:", *MEMORY[0x1E0D36D90]);
}

- (NSString)personCentricID
{
  return (NSString *)-[NSDictionary objectForKey:](self->_senderInfo, "objectForKey:", CFSTR("FZPersonPersonCentricID"));
}

- (BOOL)isOlderThanItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v4 = a3;
  -[IMItem time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == 1)
  {
    v8 = 0;
  }
  else if (v7 == -1)
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_msgSend(v4, "messageID");
    v8 = v9 >= -[IMItem messageID](self, "messageID");
  }

  return v8;
}

- (BOOL)unsentIsFromMeItem
{
  void *v3;
  int v4;
  _BOOL4 v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScheduledMessagesCoreEnabled");

  if (!v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v5 = -[IMItem isFromMe](self, "isFromMe");
  if (v5)
  {
    if ((-[IMItem isSent](self, "isSent") & 1) != 0)
    {
LABEL_5:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = -[IMItem errorCode](self, "errorCode") == 0;
  }
  return v5;
}

- (BOOL)isReply
{
  return 0;
}

- (unint64_t)hash
{
  NSString *guid;
  objc_super v5;

  guid = self->_guid;
  if (guid)
    return -[NSString hash](guid, "hash");
  v5.receiver = self;
  v5.super_class = (Class)IMItem;
  return -[IMItem hash](&v5, sel_hash);
}

- (BOOL)isFirstMessageCandidate
{
  return 0;
}

- (BOOL)isLastMessageCandidate
{
  return 0;
}

- (BOOL)wasDetonated
{
  return 0;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)unformattedID
{
  return self->_unformattedID;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSDictionary)senderInfo
{
  return self->_senderInfo;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)_setMessageID:(int64_t)a3
{
  self->_messageID = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)destinationCallerID
{
  return self->_destinationCallerID;
}

- (NSDate)clientSendTime
{
  return self->_clientSendTime;
}

- (void)setClientSendTime:(id)a3
{
  objc_storeStrong((id *)&self->_clientSendTime, a3);
}

- (NSString)replyToGUID
{
  return self->_replyToGUID;
}

- (NSString)personCentric
{
  return self->_personCentric;
}

- (void)setPersonCentric:(id)a3
{
  objc_storeStrong((id *)&self->_personCentric, a3);
}

- (int64_t)cloudKitSyncState
{
  return self->_cloudKitSyncState;
}

- (NSString)cloudKitRecordID
{
  return self->_cloudKitRecordID;
}

- (NSData)cloudKitServerChangeTokenBlob
{
  return self->_cloudKitServerChangeTokenBlob;
}

- (NSString)cloudKitRecordChangeTag
{
  return self->_cloudKitRecordChangeTag;
}

- (NSString)parentChatID
{
  return self->_parentChatID;
}

- (void)setParentChatID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)setFileTransferGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferGUIDs, a3);
}

- (id)consumedSessionPayloads
{
  return 0;
}

- (id)pluginSessionGUID
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[IMItem balloonBundleID](self, "balloonBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 && -[IMItem isBreadcrumb](self, "isBreadcrumb"))
  {
    -[IMItem associatedMessageGUID](self, "associatedMessageGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IMItem guid](self, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isAssociatedMessageItem
{
  return 0;
}

- (BOOL)isMessageAcknowledgment
{
  return 0;
}

- (BOOL)isBreadcrumb
{
  return 0;
}

- (BOOL)isMessageEdit
{
  return 0;
}

- (BOOL)isSticker
{
  return 0;
}

- (BOOL)isEmojiSticker
{
  return 0;
}

- (id)tapback
{
  return 0;
}

- (id)emojiSticker
{
  return 0;
}

- (id)associatedMessageEmoji
{
  return 0;
}

@end
