@implementation GEOWifiAccessPoint

- (BOOL)hasMacId
{
  return self->_macId != 0;
}

- (NSString)macId
{
  return self->_macId;
}

- (void)setMacId:(id)a3
{
  objc_storeStrong((id *)&self->_macId, a3);
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasRssi
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unint64_t)scanTimestamp
{
  return self->_scanTimestamp;
}

- (void)setScanTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_scanTimestamp = a3;
}

- (void)setHasScanTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasScanTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)age
{
  return self->_age;
}

- (void)setAge:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAge
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOWifiAccessPoint;
  -[GEOWifiAccessPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWifiAccessPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "macId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("macId");
    else
      v6 = CFSTR("mac_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 44);
  if ((v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("rssi"));

    v7 = *(_BYTE *)(a1 + 44);
    if ((v7 & 4) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0)
        goto LABEL_10;
LABEL_20:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v19 = CFSTR("scanTimestamp");
      else
        v19 = CFSTR("scan_timestamp");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

      if ((*(_BYTE *)(a1 + 44) & 2) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)(a1 + 44) & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 36));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("channel"));

  v7 = *(_BYTE *)(a1 + 44);
  if ((v7 & 1) != 0)
    goto LABEL_20;
LABEL_10:
  if ((v7 & 2) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("age"));

  }
LABEL_12:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __48__GEOWifiAccessPoint__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v13 = v12;
      v21 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v20);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOWifiAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWifiAccessPoint)initWithDictionary:(id)a3
{
  return (GEOWifiAccessPoint *)-[GEOWifiAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("macId");
      else
        v6 = CFSTR("mac_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setMacId:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rssi"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRssi:", objc_msgSend(v9, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("channel"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setChannel:", objc_msgSend(v10, "intValue"));

      if (a3)
        v11 = CFSTR("scanTimestamp");
      else
        v11 = CFSTR("scan_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setScanTimestamp:", objc_msgSend(v12, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("age"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAge:", objc_msgSend(v13, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOWifiAccessPoint)initWithJSON:(id)a3
{
  return (GEOWifiAccessPoint *)-[GEOWifiAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWifiAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWifiAccessPointReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_macId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteUint64Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_8:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOWifiAccessPoint readAll:](self, "readAll:", 0);
  if (self->_macId)
    objc_msgSend(v5, "setMacId:");
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_rssi;
    *((_BYTE *)v5 + 44) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *((_QWORD *)v5 + 3) = self->_scanTimestamp;
      *((_BYTE *)v5 + 44) |= 1u;
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 9) = self->_channel;
  *((_BYTE *)v5 + 44) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 8) = self->_age;
    *((_BYTE *)v5 + 44) |= 2u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_macId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_rssi;
    *(_BYTE *)(v5 + 44) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 24) = self->_scanTimestamp;
      *(_BYTE *)(v5 + 44) |= 1u;
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 36) = self->_channel;
  *(_BYTE *)(v5 + 44) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 2) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_age;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
LABEL_6:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *macId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOWifiAccessPoint readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  macId = self->_macId;
  if ((unint64_t)macId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](macId, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_rssi != *((_DWORD *)v4 + 10))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_channel != *((_DWORD *)v4 + 9))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_scanTimestamp != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_age != *((_DWORD *)v4 + 8))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEOWifiAccessPoint readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_macId, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v4 = 2654435761 * self->_rssi;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_channel;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761u * self->_scanTimestamp;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_age;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 2))
    -[GEOWifiAccessPoint setMacId:](self, "setMacId:");
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 8) != 0)
  {
    self->_rssi = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0)
        goto LABEL_6;
LABEL_11:
      self->_scanTimestamp = *((_QWORD *)v5 + 3);
      *(_BYTE *)&self->_flags |= 1u;
      if ((*((_BYTE *)v5 + 44) & 2) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*((_BYTE *)v5 + 44) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_channel = *((_DWORD *)v5 + 9);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((v4 & 2) != 0)
  {
LABEL_7:
    self->_age = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_8:

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
    -[GEOWifiAccessPoint readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
