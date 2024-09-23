@implementation GEOWiFiAP

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRssi
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasChannel
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)origin
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_origin;
  else
    return 0;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOrigin
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C12050[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ORIGIN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROAM_CACHE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SCAN_CACHE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOWiFiAP;
  -[GEOWiFiAP description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiAP dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("uniqueID"));

  v4 = *(_BYTE *)(a1 + 28);
  if ((v4 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 1) == 0)
      goto LABEL_6;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("channel"));

    if ((*(_BYTE *)(a1 + 28) & 2) == 0)
      return v2;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("rssi"));

  v4 = *(_BYTE *)(a1 + 28);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_6:
  if ((v4 & 2) == 0)
    return v2;
LABEL_10:
  v7 = *(int *)(a1 + 20);
  if (v7 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C12050[v7];
  }
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("origin"));

  return v2;
}

- (GEOWiFiAP)initWithDictionary:(id)a3
{
  return (GEOWiFiAP *)-[GEOWiFiAP _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uniqueID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setUniqueID:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rssi"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRssi:", objc_msgSend(v6, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("channel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setChannel:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("origin"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNKNOWN_ORIGIN")) & 1) != 0)
        {
          v10 = 0;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ROAM_CACHE")) & 1) != 0)
        {
          v10 = 1;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("SCAN_CACHE")))
        {
          v10 = 2;
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_21:

          goto LABEL_22;
        }
        v10 = objc_msgSend(v8, "intValue");
      }
      objc_msgSend(a1, "setOrigin:", v10);
      goto LABEL_21;
    }
  }
LABEL_22:

  return a1;
}

- (GEOWiFiAP)initWithJSON:(id)a3
{
  return (GEOWiFiAP *)-[GEOWiFiAP _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiAPIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiAPReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOWiFiAP readAll:](self, "readAll:", 0);
  if (self->_uniqueID)
    objc_msgSend(v5, "setUniqueID:");
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v5 + 4) = self->_channel;
    *((_BYTE *)v5 + 28) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_DWORD *)v5 + 6) = self->_rssi;
  *((_BYTE *)v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 5) = self->_origin;
    *((_BYTE *)v5 + 28) |= 2u;
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
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_channel;
    *(_BYTE *)(v5 + 28) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_rssi;
  *(_BYTE *)(v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 20) = self->_origin;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueID;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOWiFiAP readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_rssi != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_channel != *((_DWORD *)v4 + 4))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_origin != *((_DWORD *)v4 + 5))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOWiFiAP readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_uniqueID, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_rssi;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_channel;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_origin;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 1))
    -[GEOWiFiAP setUniqueID:](self, "setUniqueID:");
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 4) == 0)
  {
    if ((*((_BYTE *)v5 + 28) & 1) == 0)
      goto LABEL_5;
LABEL_9:
    self->_channel = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v5 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_rssi = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v4 & 2) != 0)
  {
LABEL_6:
    self->_origin = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
