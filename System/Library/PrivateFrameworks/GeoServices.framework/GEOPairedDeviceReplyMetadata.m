@implementation GEOPairedDeviceReplyMetadata

- (BOOL)hasSenderUUID
{
  return self->_senderUUID != 0;
}

- (NSString)senderUUID
{
  return self->_senderUUID;
}

- (void)setSenderUUID:(id)a3
{
  objc_storeStrong((id *)&self->_senderUUID, a3);
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_responseTime = a3;
}

- (void)setHasResponseTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasResponseTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)requestReceivedTimestamp
{
  return self->_requestReceivedTimestamp;
}

- (void)setRequestReceivedTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_requestReceivedTimestamp = a3;
}

- (void)setHasRequestReceivedTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRequestReceivedTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)sentTimestamp
{
  return self->_sentTimestamp;
}

- (void)setSentTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_sentTimestamp = a3;
}

- (void)setHasSentTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSentTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOPairedDeviceReplyMetadata;
  -[GEOPairedDeviceReplyMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceReplyMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceReplyMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "senderUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("senderUUID"));

  v6 = *(_BYTE *)(a1 + 48);
  if ((v6 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) == 0)
      goto LABEL_6;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("requestReceivedTimestamp"));

    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("responseTime"));

  v6 = *(_BYTE *)(a1 + 48);
  if ((v6 & 1) != 0)
    goto LABEL_15;
LABEL_6:
  if ((v6 & 4) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("sentTimestamp"));

  }
LABEL_8:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __58__GEOPairedDeviceReplyMetadata__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E1C00600;
      v12 = v11;
      v18 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceReplyMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOPairedDeviceReplyMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPairedDeviceReplyMetadata)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceReplyMetadata *)-[GEOPairedDeviceReplyMetadata _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("senderUUID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setSenderUUID:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("responseTime"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setResponseTime:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("requestReceivedTimestamp"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setRequestReceivedTimestamp:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sentTimestamp"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        objc_msgSend(a1, "setSentTimestamp:");
      }

    }
  }

  return a1;
}

- (GEOPairedDeviceReplyMetadata)initWithJSON:(id)a3
{
  return (GEOPairedDeviceReplyMetadata *)-[GEOPairedDeviceReplyMetadata _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceReplyMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceReplyMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_senderUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOPairedDeviceReplyMetadata readAll:](self, "readAll:", 0);
  if (self->_senderUUID)
    objc_msgSend(v5, "setSenderUUID:");
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_requestReceivedTimestamp;
    *((_BYTE *)v5 + 48) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_responseTime;
  *((_BYTE *)v5 + 48) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    *((_QWORD *)v5 + 5) = *(_QWORD *)&self->_sentTimestamp;
    *((_BYTE *)v5 + 48) |= 4u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_senderUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 16) = self->_requestReceivedTimestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_responseTime;
  *(_BYTE *)(v5 + 48) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 40) = self->_sentTimestamp;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *senderUUID;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOPairedDeviceReplyMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  senderUUID = self->_senderUUID;
  if ((unint64_t)senderUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](senderUUID, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_responseTime != *((double *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_requestReceivedTimestamp != *((double *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 48) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_sentTimestamp != *((double *)v4 + 5))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char flags;
  unint64_t v5;
  double responseTime;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double requestReceivedTimestamp;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double sentTimestamp;
  double v17;
  long double v18;
  double v19;

  -[GEOPairedDeviceReplyMetadata readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_senderUUID, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    responseTime = self->_responseTime;
    v7 = -responseTime;
    if (responseTime >= 0.0)
      v7 = self->_responseTime;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 1) != 0)
  {
    requestReceivedTimestamp = self->_requestReceivedTimestamp;
    v12 = -requestReceivedTimestamp;
    if (requestReceivedTimestamp >= 0.0)
      v12 = self->_requestReceivedTimestamp;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((flags & 4) != 0)
  {
    sentTimestamp = self->_sentTimestamp;
    v17 = -sentTimestamp;
    if (sentTimestamp >= 0.0)
      v17 = self->_sentTimestamp;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  double *v5;

  v5 = (double *)a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 4))
    -[GEOPairedDeviceReplyMetadata setSenderUUID:](self, "setSenderUUID:");
  v4 = *((_BYTE *)v5 + 48);
  if ((v4 & 2) == 0)
  {
    if (((_BYTE)v5[6] & 1) == 0)
      goto LABEL_5;
LABEL_9:
    self->_requestReceivedTimestamp = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
    if (((_BYTE)v5[6] & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_responseTime = v5[3];
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 48);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v4 & 4) != 0)
  {
LABEL_6:
    self->_sentTimestamp = v5[5];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_7:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPairedDeviceReplyMetadata readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderUUID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
