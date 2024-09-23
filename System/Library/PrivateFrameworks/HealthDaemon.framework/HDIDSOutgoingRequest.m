@implementation HDIDSOutgoingRequest

- (HDIDSOutgoingRequest)init
{
  HDIDSOutgoingRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDIDSOutgoingRequest;
  result = -[HDIDSOutgoingRequest init](&v3, sel_init);
  if (result)
    result->_priority = 0;
  return result;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setForceLocalDelivery:(BOOL)a3
{
  self->_forceLocalDelivery = a3;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (void)setResponseTimeout:(double)a3
{
  self->_responseTimeout = a3;
}

- (void)setPbRequest:(id)a3
{
  NSData *v5;
  NSData *data;
  id v7;

  objc_storeStrong((id *)&self->_pbRequest, a3);
  v7 = a3;
  -[PBCodable data](self->_pbRequest, "data");
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v5;

}

- (void)setPersistentUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_persistentUserInfo, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSData)data
{
  return self->_data;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (BOOL)doNotCompress
{
  return self->_doNotCompress;
}

- (BOOL)forceLocalDelivery
{
  return self->_forceLocalDelivery;
}

- (BOOL)queueOnly1
{
  return self->_queueOnly1;
}

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (id)nanoSyncDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HDIDSOutgoingRequest persistentUserInfo](self, "persistentUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableNanoSyncMessage messageFromPersistentUserInfo:](HDCodableNanoSyncMessage, "messageFromPersistentUserInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = -[HDIDSOutgoingRequest messageID](self, "messageID");
  -[HDIDSOutgoingRequest idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nanoSyncDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FormattedMessageDescription((int)v3, 0, 1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbRequest, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_toParticipant, 0);
}

+ (id)activationRequestWithRestore:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  +[HDCodableNanoSyncMessage messageWithSyncStore:profile:](HDCodableNanoSyncMessage, "messageWithSyncStore:profile:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActivationRestore:", v9);

  +[HDIDSOutgoingRequest _requestWithMessageID:message:syncStore:]((uint64_t)a1, 1, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_requestWithMessageID:(void *)a3 message:(void *)a4 syncStore:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_opt_self();
  objc_msgSend(v6, "createRequestWithMessageID:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPbRequest:", v7);
  v9 = (void *)objc_msgSend(v7, "copyPersistentUserInfo");

  objc_msgSend(v8, "setPersistentUserInfo:", v9);
  return v8;
}

+ (id)changeRequestWithChangeSet:(id)a3 status:(id)a4 syncStore:(id)a5 profile:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[HDCodableNanoSyncMessage messageWithSyncStore:profile:](HDCodableNanoSyncMessage, "messageWithSyncStore:profile:", v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setChangeSet:", v12);

  objc_msgSend(v13, "setStatus:", v11);
  +[HDIDSOutgoingRequest _requestWithMessageID:message:syncStore:]((uint64_t)a1, 2, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)speculativeChangeRequestWithChangeSet:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  +[HDCodableNanoSyncMessage messageWithSyncStore:profile:](HDCodableNanoSyncMessage, "messageWithSyncStore:profile:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setChangeSet:", v9);

  +[HDIDSOutgoingRequest _requestWithMessageID:message:syncStore:]((uint64_t)a1, 7, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)requestWithMessageID:(unsigned __int16)a3 participant:(id)a4
{
  id v6;
  _WORD *v7;
  void *v8;

  v6 = a4;
  v7 = objc_alloc_init((Class)a1);
  v7[6] = a3;
  v8 = (void *)*((_QWORD *)v7 + 2);
  *((_QWORD *)v7 + 2) = v6;

  return v7;
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

- (HDIDSParticipant)toParticipant
{
  return self->_toParticipant;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (void)setDoNotCompress:(BOOL)a3
{
  self->_doNotCompress = a3;
}

- (void)setQueueOnly1:(BOOL)a3
{
  self->_queueOnly1 = a3;
}

- (BOOL)nonWaking
{
  return self->_nonWaking;
}

- (void)setNonWaking:(BOOL)a3
{
  self->_nonWaking = a3;
}

- (PBCodable)pbRequest
{
  return self->_pbRequest;
}

@end
