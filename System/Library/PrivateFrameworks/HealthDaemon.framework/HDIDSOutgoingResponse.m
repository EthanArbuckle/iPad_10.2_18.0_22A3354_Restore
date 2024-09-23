@implementation HDIDSOutgoingResponse

- (HDIDSOutgoingResponse)init
{
  HDIDSOutgoingResponse *v2;
  uint64_t v3;
  HDDaemonTransaction *transaction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDIDSOutgoingResponse;
  v2 = -[HDIDSOutgoingResponse init](&v6, sel_init);
  if (v2)
  {
    +[HKDaemonTransaction transactionWithOwner:](HDDaemonTransaction, "transactionWithOwner:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    transaction = v2->_transaction;
    v2->_transaction = (HDDaemonTransaction *)v3;

  }
  return v2;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setPbResponse:(id)a3
{
  PBCodable *v5;
  void *v6;
  char isKindOfClass;
  PBCodable *pbResponse;
  NSData *v9;
  NSData *data;
  void *v11;
  objc_class *v12;
  void *v13;
  PBCodable *v14;

  v5 = (PBCodable *)a3;
  -[HDIDSMessageCenter _pbMappingForMessageID:]((uint64_t)self->_messageCenter, self->_messageID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 859, CFSTR("Invalid pbResponse of type %@"), v13);

  }
  pbResponse = self->_pbResponse;
  self->_pbResponse = v5;
  v14 = v5;

  -[PBCodable data](self->_pbResponse, "data");
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v9;

}

- (void)setPersistentUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_persistentUserInfo, a3);
}

- (void)setForceLocalDelivery:(BOOL)a3
{
  self->_forceLocalDelivery = a3;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (void)send
{
  HDIDSMessageCenter *messageCenter;
  HDIDSOutgoingResponse *v3;
  HDIDSOutgoingResponse *v4;
  unsigned __int16 v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  HDIDSOutgoingResponse *v15;
  id v16;
  char *v17;
  unsigned __int16 v18;
  unsigned __int16 v19;

  messageCenter = self->_messageCenter;
  v3 = self;
  v4 = v3;
  if (messageCenter)
  {
    v5 = -[HDIDSOutgoingResponse messageID](v3, "messageID");
    v6 = -[HDIDSOutgoingResponse requestMessageID](v4, "requestMessageID");
    -[HDIDSOutgoingResponse idsIdentifier](v4, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__sendResponse_, messageCenter, CFSTR("HDIDSMessageCenter.m"), 425, CFSTR("Response's request needs an idsIdentifier"));

    }
    -[HDIDSOutgoingResponse toParticipant](v4, "toParticipant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__sendResponse_, messageCenter, CFSTR("HDIDSMessageCenter.m"), 426, CFSTR("Response's to participant not found"));

    }
    if (v4->_sent)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__sendResponse_, messageCenter, CFSTR("HDIDSMessageCenter.m"), 427, CFSTR("You cannot call send twice for the same response object"));

    }
    v4->_sent = 1;
    queue = messageCenter->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__HDIDSMessageCenter__sendResponse___block_invoke;
    block[3] = &unk_1E6D0BEC0;
    block[4] = messageCenter;
    v17 = sel__sendResponse_;
    v18 = v5;
    v15 = v4;
    v16 = v7;
    v19 = v6;
    v10 = v7;
    dispatch_async(queue, block);

  }
}

- (unsigned)requestMessageID
{
  return self->_requestMessageID;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)priority
{
  return self->_priority;
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

  -[HDIDSOutgoingResponse persistentUserInfo](self, "persistentUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableNanoSyncMessage messageFromPersistentUserInfo:](HDCodableNanoSyncMessage, "messageFromPersistentUserInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = -[HDIDSOutgoingResponse messageID](self, "messageID");
  -[HDIDSOutgoingResponse idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nanoSyncDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FormattedMessageDescription((int)v3, 0, 0, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HKDaemonTransaction invalidate](self->_transaction, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDIDSOutgoingResponse;
  -[HDIDSOutgoingResponse dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_toParticipant, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
  objc_storeStrong((id *)&self->_requestIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)configureWithActivationRestore:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = a5;
  v10 = a3;
  if (-[HDIDSOutgoingResponse messageID](self, "messageID") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNanoSyncSupport.m"), 648, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self messageID] == HDNanoSyncMessageRestore"));

  }
  +[HDCodableNanoSyncMessage messageWithSyncStore:profile:](HDCodableNanoSyncMessage, "messageWithSyncStore:profile:", v14, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActivationRestore:", v10);

  -[HDIDSOutgoingResponse setPbResponse:](self, "setPbResponse:", v11);
  v12 = (void *)objc_msgSend(v11, "copyPersistentUserInfo");
  -[HDIDSOutgoingResponse setPersistentUserInfo:](self, "setPersistentUserInfo:", v12);

}

- (void)configureWithStatus:(id)a3 syncStore:(id)a4 profile:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = a5;
  v10 = a3;
  if (-[HDIDSOutgoingResponse messageID](self, "messageID") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNanoSyncSupport.m"), 660, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self messageID] == HDNanoSyncMessageChanges"));

  }
  +[HDCodableNanoSyncMessage messageWithSyncStore:profile:](HDCodableNanoSyncMessage, "messageWithSyncStore:profile:", v14, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStatus:", v10);

  -[HDIDSOutgoingResponse setPbResponse:](self, "setPbResponse:", v11);
  v12 = (void *)objc_msgSend(v11, "copyPersistentUserInfo");
  -[HDIDSOutgoingResponse setPersistentUserInfo:](self, "setPersistentUserInfo:", v12);

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

- (NSString)requestIdsIdentifier
{
  return self->_requestIdsIdentifier;
}

- (HDIDSMessageCenter)messageCenter
{
  return self->_messageCenter;
}

- (HDIDSParticipant)toParticipant
{
  return self->_toParticipant;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setDoNotCompress:(BOOL)a3
{
  self->_doNotCompress = a3;
}

- (PBCodable)pbResponse
{
  return self->_pbResponse;
}

@end
