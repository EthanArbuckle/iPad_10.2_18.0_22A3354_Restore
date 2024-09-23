@implementation FCCKPQueryRetrieveRequest

- (void)setRequestedFields:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setQuery:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_query)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_continuationMarker)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
}

+ (id)options
{
  if (qword_1ED0F8470 != -1)
    dispatch_once(&qword_1ED0F8470, &__block_literal_global_99);
  return (id)_MergedGlobals_178;
}

void __36__FCCKPQueryRetrieveRequest_options__block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_178;
  _MergedGlobals_178 = (uint64_t)&unk_1E470D420;

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
  v8.super_class = (Class)FCCKPQueryRetrieveRequest;
  -[FCCKPQueryRetrieveRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPQueryRetrieveRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPQuery *query;
  void *v5;
  NSData *continuationMarker;
  void *v7;
  FCCKPRecordZoneIdentifier *zoneIdentifier;
  void *v9;
  FCCKPRequestedFields *requestedFields;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  if (query)
  {
    -[FCCKPQuery dictionaryRepresentation](query, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("query"));

  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker)
    objc_msgSend(v3, "setObject:forKey:", continuationMarker, CFSTR("continuationMarker"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_limit);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("limit"));

  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    -[FCCKPRecordZoneIdentifier dictionaryRepresentation](zoneIdentifier, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("zoneIdentifier"));

  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    -[FCCKPRequestedFields dictionaryRepresentation](requestedFields, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("requestedFields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPQueryRetrieveRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (unsigned)requestTypeCode
{
  return 11;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPQuery copyWithZone:](self->_query, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_continuationMarker, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_limit;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v10 = -[FCCKPRecordZoneIdentifier copyWithZone:](self->_zoneIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[FCCKPRequestedFields copyWithZone:](self->_requestedFields, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  FCCKPQuery *query;
  NSData *continuationMarker;
  FCCKPRecordZoneIdentifier *zoneIdentifier;
  FCCKPRequestedFields *requestedFields;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 3))
  {
    if (!-[FCCKPQuery isEqual:](query, "isEqual:"))
      goto LABEL_15;
  }
  continuationMarker = self->_continuationMarker;
  if ((unint64_t)continuationMarker | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](continuationMarker, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_limit != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if ((unint64_t)zoneIdentifier | *((_QWORD *)v4 + 5)
    && !-[FCCKPRecordZoneIdentifier isEqual:](zoneIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  requestedFields = self->_requestedFields;
  if ((unint64_t)requestedFields | *((_QWORD *)v4 + 4))
    v9 = -[FCCKPRequestedFields isEqual:](requestedFields, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[FCCKPQuery hash](self->_query, "hash");
  v4 = -[NSData hash](self->_continuationMarker, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_limit;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[FCCKPRecordZoneIdentifier hash](self->_zoneIdentifier, "hash");
  return v6 ^ -[FCCKPRequestedFields hash](self->_requestedFields, "hash");
}

- (void)setContinuationMarker:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

@end
