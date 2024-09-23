@implementation HDIDSIncomingRequest

- (id)nanoSyncDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HDIDSIncomingRequest pbRequest](self, "pbRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDNanoSyncDescriptionSafe(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = -[HDIDSIncomingRequest messageID](self, "messageID");
  -[HDIDSIncomingRequest idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FormattedMessageDescription((int)v3, 1, 1, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PBCodable)pbRequest
{
  id pbRequest;
  id WeakRetained;
  _QWORD *v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v11;

  pbRequest = self->_pbRequest;
  if (!pbRequest)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
    -[HDIDSMessageCenter _pbMappingForMessageID:]((uint64_t)WeakRetained, self->_messageID);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (objc_class *)v6[1];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 805, CFSTR("Can't access -pbRequest without a mapping for messageID: %hu"), self->_messageID);

      v7 = 0;
    }
    v8 = (void *)objc_msgSend([v7 alloc], "initWithData:", self->_data);
    v9 = self->_pbRequest;
    self->_pbRequest = v8;

    pbRequest = self->_pbRequest;
  }
  return (PBCodable *)pbRequest;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (HDIDSOutgoingResponse)response
{
  return self->_response;
}

- (void)dealloc
{
  HDIDSOutgoingResponse *response;
  void *v4;
  NSObject *v5;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  HDIDSIncomingRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_expectsResponse)
  {
    response = self->_response;
    if (!response || !response->_sent)
    {
      _HKInitializeLogging();
      v4 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        *(_DWORD *)buf = 138412546;
        v9 = (id)objc_opt_class();
        v10 = 2112;
        v11 = self;
        v6 = v9;
        _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%@ (%@) deallocated without sending a response", buf, 0x16u);

      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HDIDSIncomingRequest;
  -[HDIDSIncomingRequest dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_fromParticipant, 0);
  objc_storeStrong(&self->_pbRequest, 0);
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

- (unint64_t)priority
{
  return self->_priority;
}

@end
