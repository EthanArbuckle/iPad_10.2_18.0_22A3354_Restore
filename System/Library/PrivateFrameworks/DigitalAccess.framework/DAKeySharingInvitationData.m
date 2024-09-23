@implementation DAKeySharingInvitationData

- (DAKeySharingInvitationData)initWithSessionUUID:(id)a3 invitationIdentifier:(id)a4 friendKeyIdentifier:(id)a5 sharingTarget:(int64_t)a6 state:(int64_t)a7 vehicleEnteredPasscode:(id)a8
{
  id v15;
  id v16;
  id v17;
  DAKeySharingInvitationData *v18;
  DAKeySharingInvitationData *v19;
  NSString *passwordPiece;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)DAKeySharingInvitationData;
  v18 = -[DAKeySharingInvitationData init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sharingSessionIdentifier, a3);
    objc_storeStrong((id *)&v19->_invitationIdentifier, a4);
    objc_storeStrong((id *)&v19->_friendKeyIdentifier, a5);
    v19->_sharingTargetType = a6;
    v19->_invitationState = a7;
    passwordPiece = v19->_passwordPiece;
    v19->_passwordPiece = 0;

    objc_storeStrong((id *)&v19->_vehicleEnteredPasscode, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DAKeySharingInvitationData sharingSessionIdentifier](self, "sharingSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharingSessionIdentifier"));

  -[DAKeySharingInvitationData invitationIdentifier](self, "invitationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("invitationIdentifier"));

  -[DAKeySharingInvitationData friendKeyIdentifier](self, "friendKeyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("friendKeyIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DAKeySharingInvitationData sharingTargetType](self, "sharingTargetType"), CFSTR("sharingTargetType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DAKeySharingInvitationData invitationState](self, "invitationState"), CFSTR("invitationState"));
  -[DAKeySharingInvitationData vehicleEnteredPasscode](self, "vehicleEnteredPasscode");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("vehicleEnteredPasscode"));

}

- (DAKeySharingInvitationData)initWithCoder:(id)a3
{
  id v4;
  DAKeySharingInvitationData *v5;
  uint64_t v6;
  NSUUID *sharingSessionIdentifier;
  uint64_t v8;
  NSString *invitationIdentifier;
  uint64_t v10;
  NSString *friendKeyIdentifier;
  uint64_t v12;
  NSString *vehicleEnteredPasscode;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeySharingInvitationData;
  v5 = -[DAKeySharingInvitationData init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("friendKeyIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v10;

    v5->_sharingTargetType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharingTargetType"));
    v5->_invitationState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("invitationState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleEnteredPasscode"));
    v12 = objc_claimAutoreleasedReturnValue();
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SessionUUID           : %@\n"), self->_sharingSessionIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invitation ID         : %@\n"), self->_invitationIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Friend Key ID         : %@\n"), self->_friendKeyIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sharing Target        : %ld\n"), self->_sharingTargetType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invitation State      : %ld\n"), self->_invitationState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VEP length            : %ld"), -[NSString length](self->_vehicleEnteredPasscode, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  return v3;
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSString)friendKeyIdentifier
{
  return self->_friendKeyIdentifier;
}

- (int64_t)sharingTargetType
{
  return self->_sharingTargetType;
}

- (int64_t)invitationState
{
  return self->_invitationState;
}

- (NSString)passwordPiece
{
  return self->_passwordPiece;
}

- (NSString)vehicleEnteredPasscode
{
  return self->_vehicleEnteredPasscode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_passwordPiece, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
}

@end
