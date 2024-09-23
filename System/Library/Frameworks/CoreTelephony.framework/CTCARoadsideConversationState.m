@implementation CTCARoadsideConversationState

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCARoadsideConversationState conversationId](self, "conversationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationId=%@"), v4);

  v5 = -[CTCARoadsideConversationState committed](self, "committed");
  v6 = "no";
  if (v5)
    v6 = "yes";
  objc_msgSend(v3, "appendFormat:", CFSTR(", committed=%s"), v6);
  -[CTCARoadsideConversationState providerId](self, "providerId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", providerId=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", fromService=%ld"), -[CTCARoadsideConversationState fromService](self, "fromService"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCARoadsideConversationState conversationId](self, "conversationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setConversationId:", v7);

  objc_msgSend(v5, "setCommitted:", -[CTCARoadsideConversationState committed](self, "committed"));
  -[CTCARoadsideConversationState providerId](self, "providerId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setProviderId:", v9);

  objc_msgSend(v5, "setFromService:", -[CTCARoadsideConversationState fromService](self, "fromService"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTCARoadsideConversationState conversationId](self, "conversationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("conversationId"));

  objc_msgSend(v6, "encodeBool:forKey:", -[CTCARoadsideConversationState committed](self, "committed"), CFSTR("committed"));
  -[CTCARoadsideConversationState providerId](self, "providerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("providerId"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCARoadsideConversationState fromService](self, "fromService"), CFSTR("fromService"));
}

- (CTCARoadsideConversationState)initWithCoder:(id)a3
{
  id v4;
  CTCARoadsideConversationState *v5;
  uint64_t v6;
  NSNumber *conversationId;
  uint64_t v8;
  NSNumber *providerId;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCARoadsideConversationState;
  v5 = -[CTCARoadsideConversationState init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationId"));
    v6 = objc_claimAutoreleasedReturnValue();
    conversationId = v5->_conversationId;
    v5->_conversationId = (NSNumber *)v6;

    v5->_committed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("committed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerId"));
    v8 = objc_claimAutoreleasedReturnValue();
    providerId = v5->_providerId;
    v5->_providerId = (NSNumber *)v8;

    v5->_fromService = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fromService"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (BOOL)committed
{
  return self->_committed;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (NSNumber)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(id)a3
{
  objc_storeStrong((id *)&self->_providerId, a3);
}

- (int64_t)fromService
{
  return self->_fromService;
}

- (void)setFromService:(int64_t)a3
{
  self->_fromService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
}

@end
