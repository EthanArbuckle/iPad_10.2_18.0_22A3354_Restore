@implementation CTCAConversationState

- (id)description
{
  void *v3;
  unint64_t v4;
  const char *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTCAConversationState requestReason](self, "requestReason");
  if (v4 > 5)
    v5 = "???";
  else
    v5 = off_1E1533DC0[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", requestReason=%s"), v5);
  -[CTCAConversationState conversationId](self, "conversationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationId=%@"), v6);

  v7 = -[CTCAConversationState committed](self, "committed");
  v8 = "no";
  if (v7)
    v8 = "yes";
  objc_msgSend(v3, "appendFormat:", CFSTR(", committed=%s"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(", fromService=%ld"), -[CTCAConversationState fromService](self, "fromService"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setRequestReason:", -[CTCAConversationState requestReason](self, "requestReason"));
  -[CTCAConversationState conversationId](self, "conversationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setConversationId:", v7);

  objc_msgSend(v5, "setCommitted:", -[CTCAConversationState committed](self, "committed"));
  objc_msgSend(v5, "setFromService:", -[CTCAConversationState fromService](self, "fromService"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTCAConversationState requestReason](self, "requestReason"), CFSTR("requestReason"));
  -[CTCAConversationState conversationId](self, "conversationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("conversationId"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CTCAConversationState committed](self, "committed"), CFSTR("committed"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTCAConversationState fromService](self, "fromService"), CFSTR("fromService"));

}

- (CTCAConversationState)initWithCoder:(id)a3
{
  id v4;
  CTCAConversationState *v5;
  uint64_t v6;
  NSNumber *conversationId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTCAConversationState;
  v5 = -[CTCAConversationState init](&v9, sel_init);
  if (v5)
  {
    v5->_requestReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationId"));
    v6 = objc_claimAutoreleasedReturnValue();
    conversationId = v5->_conversationId;
    v5->_conversationId = (NSNumber *)v6;

    v5->_committed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("committed"));
    v5->_fromService = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fromService"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
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
  objc_storeStrong((id *)&self->_conversationId, 0);
}

@end
