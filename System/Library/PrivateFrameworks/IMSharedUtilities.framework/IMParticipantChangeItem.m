@implementation IMParticipantChangeItem

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMParticipantChangeItem;
  -[IMParticipantChangeItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMParticipantChangeItem;
  v5 = -[IMItem copyWithZone:](&v8, sel_copyWithZone_);
  objc_msgSend(v5, "setOtherUnformattedID:", -[IMParticipantChangeItem otherUnformattedID](self, "otherUnformattedID"));
  objc_msgSend(v5, "setOtherHandle:", -[IMParticipantChangeItem otherHandle](self, "otherHandle"));
  objc_msgSend(v5, "setOtherCountryCode:", -[IMParticipantChangeItem otherCountryCode](self, "otherCountryCode"));
  objc_msgSend(v5, "setChangeType:", -[IMParticipantChangeItem changeType](self, "changeType"));
  objc_msgSend(v5, "setActiveTelephonyConversationUUID:", -[IMParticipantChangeItem activeTelephonyConversationUUID](self, "activeTelephonyConversationUUID"));
  objc_msgSend(v5, "setErrorCode:", -[IMParticipantChangeItem errorCode](self, "errorCode"));
  objc_msgSend(v5, "setTimeRead:", -[IMParticipantChangeItem timeRead](self, "timeRead"));
  v6 = (void *)-[NSDictionary copyWithZone:](-[IMParticipantChangeItem messageSummaryInfo](self, "messageSummaryInfo"), "copyWithZone:", a3);
  objc_msgSend(v5, "setMessageSummaryInfo:", v6);

  return v5;
}

- (IMParticipantChangeItem)initWithCoder:(id)a3
{
  IMParticipantChangeItem *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMParticipantChangeItem;
  v4 = -[IMItem initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    -[IMParticipantChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherCountryCode")));
    -[IMParticipantChangeItem setOtherHandle:](v4, "setOtherHandle:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherHandle")));
    -[IMParticipantChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherUnformattedID")));
    v4->_changeType = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("changeType"));
    v4->_errorCode = objc_msgSend(a3, "decodeIntForKey:", CFSTR("errorCode"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    -[IMParticipantChangeItem setMessageSummaryInfo:](v4, "setMessageSummaryInfo:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), CFSTR("messageSummaryInfo")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeRead"));
    if (v11 > 10.0)
      -[IMParticipantChangeItem setTimeRead:](v4, "setTimeRead:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMParticipantChangeItem;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[IMParticipantChangeItem otherCountryCode](self, "otherCountryCode"), CFSTR("otherCountryCode"));
  objc_msgSend(a3, "encodeObject:forKey:", -[IMParticipantChangeItem otherHandle](self, "otherHandle"), CFSTR("otherHandle"));
  objc_msgSend(a3, "encodeObject:forKey:", -[IMParticipantChangeItem otherUnformattedID](self, "otherUnformattedID"), CFSTR("otherUnformattedID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_changeType, CFSTR("changeType"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_errorCode, CFSTR("errorCode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_messageSummaryInfo, CFSTR("messageSummaryInfo"));
  -[NSDate timeIntervalSinceReferenceDate](self->_timeRead, "timeIntervalSinceReferenceDate");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeRead"));
}

- (IMParticipantChangeItem)initWithDictionary:(id)a3
{
  IMParticipantChangeItem *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMParticipantChangeItem;
  v4 = -[IMItem initWithDictionary:](&v7, sel_initWithDictionary_);
  if (v4)
  {
    -[IMParticipantChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", objc_msgSend(a3, "objectForKey:", CFSTR("otherCountryCode")));
    -[IMParticipantChangeItem setOtherHandle:](v4, "setOtherHandle:", objc_msgSend(a3, "objectForKey:", CFSTR("otherHandle")));
    -[IMParticipantChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", objc_msgSend(a3, "objectForKey:", CFSTR("otherUnformattedID")));
    -[IMParticipantChangeItem setChangeType:](v4, "setChangeType:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("changeType")), "longLongValue"));
    -[IMParticipantChangeItem setErrorCode:](v4, "setErrorCode:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("errorCode")), "intValue"));
    -[IMParticipantChangeItem setMessageSummaryInfo:](v4, "setMessageSummaryInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("messageSummaryInfo")));
    objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("timeRead")), "doubleValue");
    if (v5 > 10.0)
      -[IMParticipantChangeItem setTimeRead:](v4, "setTimeRead:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:"));
  }
  return v4;
}

- (id)copyDictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  NSString *otherCountryCode;
  NSString *otherHandle;
  NSString *otherUnformattedID;
  const void *v8;
  const void *v9;
  NSDictionary *messageSummaryInfo;
  NSDate *timeRead;
  void *v12;
  const void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IMParticipantChangeItem;
  v3 = -[IMItem copyDictionaryRepresentation](&v15, sel_copyDictionaryRepresentation);
  v4 = (void *)MEMORY[0x1A1AE8394]();
  otherCountryCode = self->_otherCountryCode;
  if (otherCountryCode)
    CFDictionarySetValue(v3, CFSTR("otherCountryCode"), otherCountryCode);
  otherHandle = self->_otherHandle;
  if (otherHandle)
    CFDictionarySetValue(v3, CFSTR("otherHandle"), otherHandle);
  otherUnformattedID = self->_otherUnformattedID;
  if (otherUnformattedID)
    CFDictionarySetValue(v3, CFSTR("otherUnformattedID"), otherUnformattedID);
  v8 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_changeType);
  if (v8)
    CFDictionarySetValue(v3, CFSTR("changeType"), v8);
  v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_errorCode);
  if (v9)
    CFDictionarySetValue(v3, CFSTR("errorCode"), v9);
  messageSummaryInfo = self->_messageSummaryInfo;
  if (messageSummaryInfo)
    CFDictionarySetValue(v3, CFSTR("messageSummaryInfo"), messageSummaryInfo);
  timeRead = self->_timeRead;
  if (timeRead)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](timeRead, "timeIntervalSinceReferenceDate");
    v13 = (const void *)objc_msgSend(v12, "numberWithDouble:");
    if (v13)
      CFDictionarySetValue(v3, CFSTR("timeRead"), v13);
  }
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v7;
  NSString *otherCountryCode;
  NSString *otherHandle;
  NSString *otherUnformattedID;
  int64_t changeType;
  NSUUID *activeTelephonyConversationUUID;
  unsigned int errorCode;
  NSDictionary *messageSummaryInfo;
  NSDate *timeRead;
  objc_super v17;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v19 = v3;
    v20 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18.receiver = self;
      v18.super_class = (Class)IMParticipantChangeItem;
      v7 = -[IMItem isEqual:](&v18, sel_isEqual_, a3);
      if (v7)
      {
        otherCountryCode = self->_otherCountryCode;
        if (otherCountryCode == (NSString *)objc_msgSend(a3, "otherCountryCode")
          || (v7 = -[NSString isEqualToString:](self->_otherCountryCode, "isEqualToString:", objc_msgSend(a3, "otherCountryCode"))))
        {
          otherHandle = self->_otherHandle;
          if (otherHandle == (NSString *)objc_msgSend(a3, "otherHandle")
            || (v7 = -[NSString isEqualToString:](self->_otherHandle, "isEqualToString:", objc_msgSend(a3, "otherHandle"))))
          {
            otherUnformattedID = self->_otherUnformattedID;
            if (otherUnformattedID == (NSString *)objc_msgSend(a3, "otherUnformattedID")
              || (v7 = -[NSString isEqualToString:](self->_otherUnformattedID, "isEqualToString:", objc_msgSend(a3, "otherUnformattedID"))))
            {
              changeType = self->_changeType;
              if (changeType == objc_msgSend(a3, "changeType")
                && (activeTelephonyConversationUUID = self->_activeTelephonyConversationUUID,
                    activeTelephonyConversationUUID == (NSUUID *)objc_msgSend(a3, "activeTelephonyConversationUUID"))
                && (errorCode = self->_errorCode, errorCode == objc_msgSend(a3, "errorCode")))
              {
                messageSummaryInfo = self->_messageSummaryInfo;
                if (messageSummaryInfo == (NSDictionary *)objc_msgSend(a3, "messageSummaryInfo")
                  || (v7 = -[NSDictionary isEqualToDictionary:](self->_messageSummaryInfo, "isEqualToDictionary:", objc_msgSend(a3, "messageSummaryInfo"))))
                {
                  timeRead = self->_timeRead;
                  LOBYTE(v7) = timeRead == (NSDate *)objc_msgSend(a3, "timeRead")
                            || -[NSDate isEqualToDate:](self->_timeRead, "isEqualToDate:", objc_msgSend(a3, "timeRead"));
                }
              }
              else
              {
                LOBYTE(v7) = 0;
              }
            }
          }
        }
      }
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)IMParticipantChangeItem;
      LOBYTE(v7) = -[IMItem isEqual:](&v17, sel_isEqual_, a3);
    }
  }
  return v7;
}

- (BOOL)unattributed
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_messageSummaryInfo, "objectForKeyedSubscript:", CFSTR("uat")), "BOOLValue");
}

- (void)setUnattributed:(BOOL)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = (id)-[NSDictionary mutableCopy](self->_messageSummaryInfo, "mutableCopy");
  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v5;
  if (a3)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("uat"));
LABEL_7:
    -[IMParticipantChangeItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", (id)objc_msgSend(v8, "copy"));
    v7 = v8;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v5, "count");
  v7 = v8;
  if (v6)
  {
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("uat"));
    goto LABEL_7;
  }
LABEL_8:

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMParticipantChangeItem;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ timeRead: %@]"), -[IMItem description](&v3, sel_description), -[IMParticipantChangeItem timeRead](self, "timeRead"));
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (NSString)otherCountryCode
{
  return self->_otherCountryCode;
}

- (void)setOtherCountryCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (NSString)otherUnformattedID
{
  return self->_otherUnformattedID;
}

- (void)setOtherUnformattedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSUUID)activeTelephonyConversationUUID
{
  return self->_activeTelephonyConversationUUID;
}

- (void)setActiveTelephonyConversationUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(unsigned int)a3
{
  self->_errorCode = a3;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (NSDate)timeRead
{
  return self->_timeRead;
}

- (void)setTimeRead:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

@end
