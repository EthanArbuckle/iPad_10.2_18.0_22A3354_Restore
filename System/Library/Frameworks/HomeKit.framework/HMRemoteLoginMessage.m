@implementation HMRemoteLoginMessage

- (id)initNewMessage
{
  void *v3;
  void *v4;
  HMRemoteLoginMessage *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMRemoteLoginMessage initWithSessionID:](self, "initWithSessionID:", v4);

  return v5;
}

- (HMRemoteLoginMessage)initWithSessionID:(id)a3
{
  id v5;
  HMRemoteLoginMessage *v6;
  HMRemoteLoginMessage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMRemoteLoginMessage;
  v6 = -[HMRemoteLoginMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionID, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMRemoteLoginMessage sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRemoteLoginMessage error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Session: %@, Error: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMRemoteLoginMessage sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionID"));

  -[HMRemoteLoginMessage error](self, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

}

- (HMRemoteLoginMessage)initWithCoder:(id)a3
{
  id v4;
  HMRemoteLoginMessage *v5;
  uint64_t v6;
  NSString *sessionID;
  uint64_t v8;
  NSError *error;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMRemoteLoginMessage;
  v5 = -[HMRemoteLoginMessage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

  }
  return v5;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
