@implementation GEOPairedDeviceMessageMetadata

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

- (int)priority
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_priority;
  else
    return 100;
}

- (void)setPriority:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPriority
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)priorityAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 100:
      return CFSTR("SYNC");
    case 300:
      return CFSTR("URGENT");
    case 200:
      v3 = CFSTR("DEFAULT");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsPriority:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYNC")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 200;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("URGENT")))
  {
    v4 = 300;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (double)sentTimestamp
{
  return self->_sentTimestamp;
}

- (void)setSentTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_sentTimestamp = a3;
}

- (void)setHasSentTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSentTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOPairedDeviceMessageMetadata;
  -[GEOPairedDeviceMessageMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceMessageMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceMessageMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
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

  v6 = *(_BYTE *)(a1 + 36);
  if ((v6 & 2) != 0)
  {
    v7 = *(_DWORD *)(a1 + 32);
    switch(v7)
    {
      case 100:
        v8 = CFSTR("SYNC");
        break;
      case 300:
        v8 = CFSTR("URGENT");
        break;
      case 200:
        v8 = CFSTR("DEFAULT");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 32));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("priority"));

    v6 = *(_BYTE *)(a1 + 36);
  }
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sentTimestamp"));

  }
  v10 = *(void **)(a1 + 8);
  if (v10)
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __60__GEOPairedDeviceMessageMetadata__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E1C00600;
      v14 = v13;
      v18 = v14;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
      v15 = v14;

      v12 = v15;
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceMessageMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPairedDeviceMessageMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceMessageMetadata)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceMessageMetadata *)-[GEOPairedDeviceMessageMetadata _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  if (!a1)
    goto LABEL_20;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_20;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("senderUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(a1, "setSenderUUID:", v5);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SYNC")) & 1) != 0)
    {
      v8 = 100;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    {
      v8 = 200;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("URGENT")))
    {
      v8 = 300;
    }
    else
    {
      v8 = 100;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_16:
    objc_msgSend(a1, "setPriority:", v8);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sentTimestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(a1, "setSentTimestamp:");
  }

LABEL_20:
  return a1;
}

- (GEOPairedDeviceMessageMetadata)initWithJSON:(id)a3
{
  return (GEOPairedDeviceMessageMetadata *)-[GEOPairedDeviceMessageMetadata _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceMessageMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceMessageMetadataReadAllFrom((uint64_t)self, a3);
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
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOPairedDeviceMessageMetadata readAll:](self, "readAll:", 0);
  if (self->_senderUUID)
    objc_msgSend(v5, "setSenderUUID:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_priority;
    *((_BYTE *)v5 + 36) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_sentTimestamp;
    *((_BYTE *)v5 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_senderUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_priority;
    *(_BYTE *)(v5 + 36) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_sentTimestamp;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
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
    goto LABEL_13;
  -[GEOPairedDeviceMessageMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  senderUUID = self->_senderUUID;
  if ((unint64_t)senderUUID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](senderUUID, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_priority != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_sentTimestamp != *((double *)v4 + 3))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  double sentTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  -[GEOPairedDeviceMessageMetadata readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_senderUUID, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_priority;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  sentTimestamp = self->_sentTimestamp;
  v6 = -sentTimestamp;
  if (sentTimestamp >= 0.0)
    v6 = self->_sentTimestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 2))
    -[GEOPairedDeviceMessageMetadata setSenderUUID:](self, "setSenderUUID:");
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 2) != 0)
  {
    self->_priority = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 36);
  }
  if ((v4 & 1) != 0)
  {
    self->_sentTimestamp = *((double *)v5 + 3);
    *(_BYTE *)&self->_flags |= 1u;
  }

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
    -[GEOPairedDeviceMessageMetadata readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderUUID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
