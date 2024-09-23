@implementation IMAssociatedMessagePipelineParameter

- (IMAssociatedMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  IMAssociatedMessagePipelineParameter *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *associatedMessageFallbackHash;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMAssociatedMessagePipelineParameter;
  v7 = -[IMTextMessagePipelineParameter initWithBD:idsTrustedData:](&v17, sel_initWithBD_idsTrustedData_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "messageSubType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tapback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", objc_msgSend(v9, "associatedMessageType"));
    objc_msgSend(v9, "associatedMessageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setAssociatedMessageGUID:](v7, "setAssociatedMessageGUID:", v10);

    objc_msgSend(v9, "associatedMessageFallbackHash");
    v11 = objc_claimAutoreleasedReturnValue();
    associatedMessageFallbackHash = v7->_associatedMessageFallbackHash;
    v7->_associatedMessageFallbackHash = (NSString *)v11;

    v13 = objc_msgSend(v9, "associatedMessageRange");
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v13, v14);
    objc_msgSend(v9, "plainTextBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setPlainTextBody:](v7, "setPlainTextBody:", v15);

  }
  return v7;
}

- (IMAssociatedMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  IMAssociatedMessagePipelineParameter *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *associatedMessageFallbackHash;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMAssociatedMessagePipelineParameter;
  v7 = -[IMTextMessagePipelineParameter initWithBDBasic:idsTrustedData:](&v17, sel_initWithBDBasic_idsTrustedData_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "messageSubType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tapback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", objc_msgSend(v9, "associatedMessageType"));
    objc_msgSend(v9, "associatedMessageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setAssociatedMessageGUID:](v7, "setAssociatedMessageGUID:", v10);

    objc_msgSend(v9, "associatedMessageFallbackHash");
    v11 = objc_claimAutoreleasedReturnValue();
    associatedMessageFallbackHash = v7->_associatedMessageFallbackHash;
    v7->_associatedMessageFallbackHash = (NSString *)v11;

    v13 = objc_msgSend(v9, "associatedMessageRange");
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v13, v14);
    objc_msgSend(v9, "plainTextBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setPlainTextBody:](v7, "setPlainTextBody:", v15);

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMTextMessagePipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMAssociatedMessagePipelineParameter associatedMessageType](self, "associatedMessageType");
  -[IMTextMessagePipelineParameter associatedMessageGUID](self, "associatedMessageGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isFromStorage](self, "isFromStorage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTextMessagePipelineParameter isFromMe](self, "isFromMe"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTextMessagePipelineParameter messageItems](self, "messageItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMMessageTapbackPipelineParameter %p> { guid: %@, assocatedMessageType: %lld, associatedMessageGUID: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}"), self, v4, v5, v6, v7, v8, v9, v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  self->_associatedMessageType = a3;
}

- (NSString)associatedMessageFallbackHash
{
  return self->_associatedMessageFallbackHash;
}

- (void)setAssociatedMessageFallbackHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (_NSRange)associatedMessageRange
{
  _NSRange *p_associatedMessageRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_associatedMessageRange = &self->_associatedMessageRange;
  location = self->_associatedMessageRange.location;
  length = p_associatedMessageRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAssociatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedMessageFallbackHash, 0);
}

@end
