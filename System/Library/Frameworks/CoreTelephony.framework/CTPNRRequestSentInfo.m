@implementation CTPNRRequestSentInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", success=%d"), -[CTPNRRequestSentInfo success](self, "success"));
  -[CTPNRRequestSentInfo token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", token=%@"), v4);

  -[CTPNRRequestSentInfo timeout](self, "timeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", timeout=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTPNRRequestSentInfo)init
{
  CTPNRRequestSentInfo *v2;
  CTPNRRequestSentInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTPNRRequestSentInfo;
  v2 = -[CTPNRRequestSentInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CTPNRRequestSentInfo setSuccess:](v2, "setSuccess:", 0);
  return v3;
}

- (BOOL)isEqualToCTPNRRequestSentInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  int v9;
  BOOL v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  if (!v8 || (v9 = -[CTPNRRequestSentInfo success](self, "success"), v9 != objc_msgSend(v8, "success")))
  {
    v10 = 0;
    goto LABEL_18;
  }
  -[CTPNRRequestSentInfo token](self, "token");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v8, "token"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTPNRRequestSentInfo token](self, "token");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_15;
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  -[CTPNRRequestSentInfo timeout](self, "timeout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v8, "timeout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = 1;
LABEL_20:

      if ((v12 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  -[CTPNRRequestSentInfo timeout](self, "timeout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14 == v15;

  if (!v13)
    goto LABEL_20;

  if (v12)
  {
LABEL_14:

  }
LABEL_15:
  if (!v11)

LABEL_18:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTPNRRequestSentInfo *v4;
  BOOL v5;

  v4 = (CTPNRRequestSentInfo *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTPNRRequestSentInfo isEqualToCTPNRRequestSentInfo:](self, "isEqualToCTPNRRequestSentInfo:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTPNRRequestSentInfo *v4;

  v4 = +[CTPNRRequestSentInfo allocWithZone:](CTPNRRequestSentInfo, "allocWithZone:", a3);
  -[CTPNRRequestSentInfo setSuccess:](v4, "setSuccess:", self->_success);
  -[CTPNRRequestSentInfo setToken:](v4, "setToken:", self->_token);
  -[CTPNRRequestSentInfo setTimeout:](v4, "setTimeout:", self->_timeout);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *timeout;
  id v5;

  timeout = self->_timeout;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timeout, CFSTR("timeout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("push_token"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_success, CFSTR("success"));

}

- (CTPNRRequestSentInfo)initWithCoder:(id)a3
{
  id v4;
  CTPNRRequestSentInfo *v5;
  uint64_t v6;
  NSNumber *timeout;
  uint64_t v8;
  NSString *token;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPNRRequestSentInfo;
  v5 = -[CTPNRRequestSentInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeout"));
    v6 = objc_claimAutoreleasedReturnValue();
    timeout = v5->_timeout;
    v5->_timeout = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("push_token"));
    v8 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v8;

    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
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

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_timeout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
