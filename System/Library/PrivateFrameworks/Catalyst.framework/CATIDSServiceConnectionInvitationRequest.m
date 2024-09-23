@implementation CATIDSServiceConnectionInvitationRequest

- (CATIDSServiceConnectionInvitationRequest)initWithInvitationIdentifier:(id)a3 appleID:(id)a4 assertion:(id)a5 userInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CATIDSServiceConnectionInvitationRequest *v15;
  CATIDSServiceConnectionInvitationRequest *v16;
  uint64_t v17;
  NSString *appleID;
  uint64_t v19;
  NSDictionary *userInfo;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CATIDSServiceConnectionInvitationRequest;
  v15 = -[CATIDSServiceConnectionInvitationRequest init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_invitationIdentifier, a3);
    v17 = objc_msgSend(v12, "copy");
    appleID = v16->_appleID;
    v16->_appleID = (NSString *)v17;

    objc_storeStrong((id *)&v16->_assertion, a5);
    v19 = objc_msgSend(v14, "copy");
    userInfo = v16->_userInfo;
    v16->_userInfo = (NSDictionary *)v19;

  }
  return v16;
}

- (NSUUID)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (CATCancelable)assertion
{
  return self->_assertion;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end
