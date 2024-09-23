@implementation GEOLogMsgStatePairedDevice

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22ED8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAIRED_DEVICE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAIRED_DEVICE_WATCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAIRED_DEVICE_PHONE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_isConnected = a3;
}

- (void)setHasIsConnected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsConnected
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)hasPairedDeviceIdentifier
{
  return self->_pairedDeviceIdentifier != 0;
}

- (GEOLogMsgStateDeviceIdentifier)pairedDeviceIdentifier
{
  return self->_pairedDeviceIdentifier;
}

- (void)setPairedDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceIdentifier, a3);
}

- (BOOL)isConnectedAndNearby
{
  return self->_isConnectedAndNearby;
}

- (void)setIsConnectedAndNearby:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isConnectedAndNearby = a3;
}

- (void)setHasIsConnectedAndNearby:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsConnectedAndNearby
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
  v8.super_class = (Class)GEOLogMsgStatePairedDevice;
  -[GEOLogMsgStatePairedDevice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStatePairedDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStatePairedDevice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) != 0)
    {
      v6 = *(int *)(a1 + 16);
      if (v6 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C22ED8[v6];
      }
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 21));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("isConnected");
      else
        v9 = CFSTR("is_connected");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    objc_msgSend((id)a1, "pairedDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("pairedDeviceIdentifier");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("paired_device_identifier");
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    if ((*(_BYTE *)(a1 + 24) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v15 = CFSTR("isConnectedAndNearby");
      else
        v15 = CFSTR("is_connected_and_nearby");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStatePairedDevice _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStatePairedDevice)initWithDictionary:(id)a3
{
  return (GEOLogMsgStatePairedDevice *)-[GEOLogMsgStatePairedDevice _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOLogMsgStateDeviceIdentifier *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v5 = a2;
  if (!a1)
    goto LABEL_34;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_34;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PAIRED_DEVICE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PAIRED_DEVICE_WATCH")) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PAIRED_DEVICE_PHONE")))
    {
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_14:
    objc_msgSend(a1, "setType:", v8);
  }

  if (a3)
    v9 = CFSTR("isConnected");
  else
    v9 = CFSTR("is_connected");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsConnected:", objc_msgSend(v10, "BOOLValue"));

  if (a3)
    v11 = CFSTR("pairedDeviceIdentifier");
  else
    v11 = CFSTR("paired_device_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOLogMsgStateDeviceIdentifier alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOLogMsgStateDeviceIdentifier initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOLogMsgStateDeviceIdentifier initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setPairedDeviceIdentifier:", v14);

  }
  if (a3)
    v16 = CFSTR("isConnectedAndNearby");
  else
    v16 = CFSTR("is_connected_and_nearby");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsConnectedAndNearby:", objc_msgSend(v17, "BOOLValue"));

LABEL_34:
  return a1;
}

- (GEOLogMsgStatePairedDevice)initWithJSON:(id)a3
{
  return (GEOLogMsgStatePairedDevice *)-[GEOLogMsgStatePairedDevice _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStatePairedDeviceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStatePairedDeviceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_pairedDeviceIdentifier)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char flags;
  _BYTE *v6;

  v6 = a3;
  -[GEOLogMsgStatePairedDevice readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_type;
    v6[24] |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v6[21] = self->_isConnected;
    v6[24] |= 4u;
  }
  if (self->_pairedDeviceIdentifier)
  {
    objc_msgSend(v6, "setPairedDeviceIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4[20] = self->_isConnectedAndNearby;
    v4[24] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 21) = self->_isConnected;
    *(_BYTE *)(v5 + 24) |= 4u;
  }
  v8 = -[GEOLogMsgStateDeviceIdentifier copyWithZone:](self->_pairedDeviceIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v8;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v6 + 20) = self->_isConnectedAndNearby;
    *(_BYTE *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOLogMsgStateDeviceIdentifier *pairedDeviceIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOLogMsgStatePairedDevice readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 24);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_20;
    if (self->_isConnected)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_20;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_20;
  }
  pairedDeviceIdentifier = self->_pairedDeviceIdentifier;
  if ((unint64_t)pairedDeviceIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOLogMsgStateDeviceIdentifier isEqual:](pairedDeviceIdentifier, "isEqual:"))
      goto LABEL_20;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 24);
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_isConnectedAndNearby)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_20;
      }
      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_20;
      }
      v8 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v8 = 0;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOLogMsgStatePairedDevice readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isConnected;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[GEOLogMsgStateDeviceIdentifier hash](self->_pairedDeviceIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_isConnectedAndNearby;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  char v5;
  GEOLogMsgStateDeviceIdentifier *pairedDeviceIdentifier;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = (BOOL *)v8;
  v5 = *((_BYTE *)v8 + 24);
  if ((v5 & 1) != 0)
  {
    self->_type = *((_DWORD *)v8 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v8 + 24);
  }
  if ((v5 & 4) != 0)
  {
    self->_isConnected = *((_BYTE *)v8 + 21);
    *(_BYTE *)&self->_flags |= 4u;
  }
  pairedDeviceIdentifier = self->_pairedDeviceIdentifier;
  v7 = *((_QWORD *)v8 + 1);
  if (pairedDeviceIdentifier)
  {
    if (!v7)
      goto LABEL_11;
    -[GEOLogMsgStateDeviceIdentifier mergeFrom:](pairedDeviceIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[GEOLogMsgStatePairedDevice setPairedDeviceIdentifier:](self, "setPairedDeviceIdentifier:");
  }
  v4 = (BOOL *)v8;
LABEL_11:
  if ((v4[24] & 2) != 0)
  {
    self->_isConnectedAndNearby = v4[20];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceIdentifier, 0);
}

@end
