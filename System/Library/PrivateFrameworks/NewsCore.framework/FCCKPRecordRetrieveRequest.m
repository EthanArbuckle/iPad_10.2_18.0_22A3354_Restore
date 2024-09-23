@implementation FCCKPRecordRetrieveRequest

- (void)setRequestedFields:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setRecordIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setClientVersionETag:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionETag, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_clientVersionETag, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_versionETag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientVersionETag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

+ (id)options
{
  if (qword_1ED0F87A0 != -1)
    dispatch_once(&qword_1ED0F87A0, &__block_literal_global_157);
  return (id)_MergedGlobals_206;
}

void __37__FCCKPRecordRetrieveRequest_options__block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_206;
  _MergedGlobals_206 = (uint64_t)&unk_1E470D4E8;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordRetrieveRequest;
  -[FCCKPRecordRetrieveRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordRetrieveRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPRecordIdentifier *recordIdentifier;
  void *v5;
  FCCKPRequestedFields *requestedFields;
  void *v7;
  NSString *versionETag;
  NSString *clientVersionETag;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    -[FCCKPRecordIdentifier dictionaryRepresentation](recordIdentifier, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("recordIdentifier"));

  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    -[FCCKPRequestedFields dictionaryRepresentation](requestedFields, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("requestedFields"));

  }
  versionETag = self->_versionETag;
  if (versionETag)
    objc_msgSend(v3, "setObject:forKey:", versionETag, CFSTR("versionETag"));
  clientVersionETag = self->_clientVersionETag;
  if (clientVersionETag)
    objc_msgSend(v3, "setObject:forKey:", clientVersionETag, CFSTR("clientVersionETag"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordRetrieveRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (unsigned)requestTypeCode
{
  return 4;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPRecordIdentifier copyWithZone:](self->_recordIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[FCCKPRequestedFields copyWithZone:](self->_requestedFields, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_versionETag, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_clientVersionETag, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCCKPRecordIdentifier *recordIdentifier;
  FCCKPRequestedFields *requestedFields;
  NSString *versionETag;
  NSString *clientVersionETag;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((recordIdentifier = self->_recordIdentifier, !((unint64_t)recordIdentifier | v4[2]))
     || -[FCCKPRecordIdentifier isEqual:](recordIdentifier, "isEqual:"))
    && ((requestedFields = self->_requestedFields, !((unint64_t)requestedFields | v4[3]))
     || -[FCCKPRequestedFields isEqual:](requestedFields, "isEqual:"))
    && ((versionETag = self->_versionETag, !((unint64_t)versionETag | v4[4]))
     || -[NSString isEqual:](versionETag, "isEqual:")))
  {
    clientVersionETag = self->_clientVersionETag;
    if ((unint64_t)clientVersionETag | v4[1])
      v9 = -[NSString isEqual:](clientVersionETag, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[FCCKPRecordIdentifier hash](self->_recordIdentifier, "hash");
  v4 = -[FCCKPRequestedFields hash](self->_requestedFields, "hash") ^ v3;
  v5 = -[NSString hash](self->_versionETag, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_clientVersionETag, "hash");
}

@end
