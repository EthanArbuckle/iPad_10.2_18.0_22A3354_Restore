@implementation _BlastDoorCKDeviceToDeviceShareInvitationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4
{
  return -[_BlastDoorCKDeviceToDeviceShareInvitationToken initWithSharingInvitationData:shareURL:participantID:](self, "initWithSharingInvitationData:shareURL:participantID:", a3, a4, 0);
}

- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4 participantID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BlastDoorCKDeviceToDeviceShareInvitationToken *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorCKDeviceToDeviceShareInvitationToken;
  v11 = -[_BlastDoorCKDeviceToDeviceShareInvitationToken init](&v16, sel_init);
  if (v11)
  {
    v12 = (void *)objc_msgSend(v8, "copy");
    -[_BlastDoorCKDeviceToDeviceShareInvitationToken setSharingInvitationData:](v11, "setSharingInvitationData:", v12);

    v13 = (void *)objc_msgSend(v9, "copy");
    -[_BlastDoorCKDeviceToDeviceShareInvitationToken setShareURL:](v11, "setShareURL:", v13);

    v14 = (void *)objc_msgSend(v10, "copy");
    -[_BlastDoorCKDeviceToDeviceShareInvitationToken setParticipantID:](v11, "setParticipantID:", v14);

  }
  return v11;
}

- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BlastDoorCKDeviceToDeviceShareInvitationToken *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v4, "_strictSecureDecodingEnabled"))
  {
    v9 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1AF44B8D4]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShareInvitationData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShareURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ParticipantID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
    self = -[_BlastDoorCKDeviceToDeviceShareInvitationToken initWithSharingInvitationData:shareURL:participantID:](self, "initWithSharingInvitationData:shareURL:participantID:", v6, v7, v8);

    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x1AF44B8D4]();
  -[_BlastDoorCKDeviceToDeviceShareInvitationToken sharingInvitationData](self, "sharingInvitationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("ShareInvitationData"));

  -[_BlastDoorCKDeviceToDeviceShareInvitationToken shareURL](self, "shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("ShareURL"));

  -[_BlastDoorCKDeviceToDeviceShareInvitationToken participantID](self, "participantID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("ParticipantID"));

  objc_autoreleasePoolPop(v4);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorCKDeviceToDeviceShareInvitationToken;
  if (-[_BlastDoorCKDeviceToDeviceShareInvitationToken isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[1];
      if (v7 | (unint64_t)self->_sharingInvitationData && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[2], v8 | (unint64_t)self->_shareURL) && !objc_msgSend((id)v8, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v9 = v6[3];
        if (v9 | (unint64_t)self->_participantID)
          v5 = objc_msgSend((id)v9, "isEqual:");
        else
          v5 = 1;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[_BlastDoorCKDeviceToDeviceShareInvitationToken sharingInvitationData](self, "sharingInvitationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_BlastDoorCKDeviceToDeviceShareInvitationToken shareURL](self, "shareURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[_BlastDoorCKDeviceToDeviceShareInvitationToken participantID](self, "participantID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ShareInvitationData"), CFSTR("ShareURL"), CFSTR("ParticipantID"), 0);
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (void)setSharingInvitationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
}

@end
