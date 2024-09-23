@implementation NMSMessagePersistentContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NMSMessagePersistentContext)initWithCoder:(id)a3
{
  id v4;
  NMSMessagePersistentContext *v5;
  uint64_t v6;
  NSString *idsIdentifier;
  void *v8;
  uint64_t v9;
  NSDictionary *userInfo;
  uint64_t v11;
  NSDate *date;
  void *v13;
  uint64_t v14;
  NSDictionary *idsOptions;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NMSMessagePersistentContext;
  v5 = -[NMSMessagePersistentContext init](&v17, sel_init);
  if (v5)
  {
    v5->_messageID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("m"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v6;

    allowedClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("u"));
    v9 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v11 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v11;

    v5->_fromRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("r"));
    allowedClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("f"));
    v14 = objc_claimAutoreleasedReturnValue();
    idsOptions = v5->_idsOptions;
    v5->_idsOptions = (NSDictionary *)v14;

    v5->_sendAcked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sa"));
    v5->_processAcked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pa"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *userInfo;
  NSDictionary *idsOptions;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_messageID, CFSTR("m"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_idsIdentifier, CFSTR("i"));
  if (self->_userInfo)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[NMSMessagePersistentContext encodeWithCoder:].cold.2();
    userInfo = self->_userInfo;
  }
  else
  {
    userInfo = 0;
  }
  objc_msgSend(v6, "encodeObject:forKey:", userInfo, CFSTR("u"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_date, CFSTR("d"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_fromRequest, CFSTR("r"));
  if (self->_idsOptions)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[NMSMessagePersistentContext encodeWithCoder:].cold.1();
    idsOptions = self->_idsOptions;
  }
  else
  {
    idsOptions = 0;
  }
  objc_msgSend(v6, "encodeObject:forKey:", idsOptions, CFSTR("f"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_sendAcked, CFSTR("sa"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_processAcked, CFSTR("pa"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p id:%hu ids:%@ date:%@ fromRequest:%d sendAcked:%d processAcked:%d idsOptions:%@ userInfo:%@>"), v5, self, self->_messageID, self->_idsIdentifier, self->_date, self->_fromRequest, self->_sendAcked, self->_processAcked, self->_idsOptions, self->_userInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
  objc_storeStrong((id *)&self->_idsOptions, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (BOOL)isFromRequest
{
  return self->_fromRequest;
}

- (void)setFromRequest:(BOOL)a3
{
  self->_fromRequest = a3;
}

- (BOOL)sendAcked
{
  return self->_sendAcked;
}

- (void)setSendAcked:(BOOL)a3
{
  self->_sendAcked = a3;
}

- (BOOL)processAcked
{
  return self->_processAcked;
}

- (void)setProcessAcked:(BOOL)a3
{
  self->_processAcked = a3;
}

- (NSSet)targetDeviceIDs
{
  return self->_targetDeviceIDs;
}

- (void)setTargetDeviceIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceIDs, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_idsOptions, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (void)encodeWithCoder:.cold.1()
{
  __assert_rtn("-[NMSMessagePersistentContext encodeWithCoder:]", "NanoMessagingService.m", 1858, "_idsOptions == nil || [_idsOptions isKindOfClass:[NSDictionary class]]");
}

- (void)encodeWithCoder:.cold.2()
{
  __assert_rtn("-[NMSMessagePersistentContext encodeWithCoder:]", "NanoMessagingService.m", 1854, "_userInfo == nil || [_userInfo isKindOfClass:[NSDictionary class]]");
}

@end
