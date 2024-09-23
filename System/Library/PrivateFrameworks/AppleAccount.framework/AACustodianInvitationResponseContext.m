@implementation AACustodianInvitationResponseContext

- (AACustodianInvitationResponseContext)initWithCustodianID:(id)a3 didAccept:(BOOL)a4
{
  id v7;
  AACustodianInvitationResponseContext *v8;
  AACustodianInvitationResponseContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AACustodianInvitationResponseContext;
  v8 = -[AACustodianInvitationResponseContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_custodianID, a3);
    v9->_accepted = a4;
    v9->_autoAction = 0;
  }

  return v9;
}

- (AACustodianInvitationResponseContext)initWithCoder:(id)a3
{
  id v4;
  AACustodianInvitationResponseContext *v5;
  uint64_t v6;
  NSUUID *custodianID;

  v4 = a3;
  v5 = -[AACustodianInvitationResponseContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianID"));
    v6 = objc_claimAutoreleasedReturnValue();
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v6;

    v5->_accepted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_accepted"));
    v5->_autoAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_autoAction"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *custodianID;
  id v5;

  custodianID = self->_custodianID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", custodianID, CFSTR("_custodianID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_accepted, CFSTR("_accepted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_autoAction, CFSTR("_autoAction"));

}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (void)setCustodianID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAccepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (BOOL)isAutoAction
{
  return self->_autoAction;
}

- (void)setAutoAction:(BOOL)a3
{
  self->_autoAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianID, 0);
}

@end
