@implementation HDIDSIncomingResponse

- (id)nanoSyncDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HDIDSIncomingResponse pbResponse](self, "pbResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDNanoSyncDescriptionSafe(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = -[HDIDSIncomingResponse messageID](self, "messageID");
  -[HDIDSIncomingResponse idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FormattedMessageDescription((int)v3, 1, 0, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PBCodable)pbResponse
{
  return self->_pbResponse;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbResponse, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_requestPersistentUserInfo, 0);
  objc_storeStrong((id *)&self->_requestSent, 0);
  objc_storeStrong((id *)&self->_requestIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_fromParticipant, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> messageID: %hu"), v5, self, self->_messageID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HDIDSParticipant)fromParticipant
{
  return self->_fromParticipant;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)requestIDSIdentifier
{
  return self->_requestIDSIdentifier;
}

- (NSDate)requestSent
{
  return self->_requestSent;
}

- (NSDictionary)requestPersistentUserInfo
{
  return self->_requestPersistentUserInfo;
}

@end
