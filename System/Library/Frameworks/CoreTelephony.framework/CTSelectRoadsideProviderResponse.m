@implementation CTSelectRoadsideProviderResponse

- (id)description
{
  void *v3;
  const char *v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CTSelectRoadsideProviderResponse success](self, "success"))
    v4 = "YES";
  else
    v4 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", success=%s"), v4);
  if (-[CTSelectRoadsideProviderResponse conversationResumed](self, "conversationResumed"))
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationResumed=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTSelectRoadsideProviderResponse:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 v7;

  v4 = a3;
  v5 = -[CTSelectRoadsideProviderResponse success](self, "success");
  if (v5 == objc_msgSend(v4, "success"))
  {
    v7 = -[CTSelectRoadsideProviderResponse conversationResumed](self, "conversationResumed");
    v6 = v7 ^ objc_msgSend(v4, "conversationResumed") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CTSelectRoadsideProviderResponse *v4;
  BOOL v5;

  v4 = (CTSelectRoadsideProviderResponse *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTSelectRoadsideProviderResponse isEqualToCTSelectRoadsideProviderResponse:](self, "isEqualToCTSelectRoadsideProviderResponse:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSuccess:", -[CTSelectRoadsideProviderResponse success](self, "success"));
  objc_msgSend(v4, "setConversationResumed:", -[CTSelectRoadsideProviderResponse conversationResumed](self, "conversationResumed"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTSelectRoadsideProviderResponse success](self, "success"), CFSTR("success"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTSelectRoadsideProviderResponse conversationResumed](self, "conversationResumed"), CFSTR("conversationResumed"));

}

- (CTSelectRoadsideProviderResponse)initWithCoder:(id)a3
{
  id v4;
  CTSelectRoadsideProviderResponse *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSelectRoadsideProviderResponse;
  v5 = -[CTSelectRoadsideProviderResponse init](&v7, sel_init);
  if (v5)
  {
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
    v5->_conversationResumed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("conversationResumed"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)conversationResumed
{
  return self->_conversationResumed;
}

- (void)setConversationResumed:(BOOL)a3
{
  self->_conversationResumed = a3;
}

@end
