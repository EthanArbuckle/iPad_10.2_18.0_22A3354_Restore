@implementation GEOPDWifiAccessPoint

- (void)setMacId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);

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
  v8.super_class = (Class)GEOPDWifiAccessPoint;
  -[GEOPDWifiAccessPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDWifiAccessPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v17;
  const __CFString *v18;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 16))
    objc_msgSend(v4, "setObject:forKey:");
  v6 = *(_BYTE *)(a1 + 44);
  if ((v6 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("rssi"));

    v6 = *(_BYTE *)(a1 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 1) == 0)
        goto LABEL_7;
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v18 = CFSTR("scanTimestamp");
      else
        v18 = CFSTR("scan_timestamp");
      objc_msgSend(v5, "setObject:forKey:", v17, v18);

      if ((*(_BYTE *)(a1 + 44) & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)(a1 + 44) & 4) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 36));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("channel"));

  v6 = *(_BYTE *)(a1 + 44);
  if ((v6 & 1) != 0)
    goto LABEL_16;
LABEL_7:
  if ((v6 & 2) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("age"));

  }
LABEL_9:
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
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __50__GEOPDWifiAccessPoint__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v12 = v11;
      v20 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOPDWifiAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDWifiAccessPointReadAllFrom((uint64_t)self, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOPDWifiAccessPoint)initWithGEOWifiAccessPoint:(id)a3
{
  id v4;
  GEOPDWifiAccessPoint *v5;
  void *v6;
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOPDWifiAccessPoint;
  v5 = -[GEOPDWifiAccessPoint init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hasMacId"))
    {
      objc_msgSend(v4, "macId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDWifiAccessPoint setMacId:]((uint64_t)v5, v6);

    }
    if (objc_msgSend(v4, "hasAge"))
    {
      v7 = objc_msgSend(v4, "age");
      *(_BYTE *)&v5->_flags |= 2u;
      v5->_age = v7;
    }
    if (objc_msgSend(v4, "hasChannel"))
    {
      v8 = objc_msgSend(v4, "channel");
      *(_BYTE *)&v5->_flags |= 4u;
      v5->_channel = v8;
    }
    if (objc_msgSend(v4, "hasRssi"))
    {
      v9 = objc_msgSend(v4, "rssi");
      *(_BYTE *)&v5->_flags |= 8u;
      v5->_rssi = v9;
    }
    if (objc_msgSend(v4, "hasScanTimestamp"))
    {
      v10 = objc_msgSend(v4, "scanTimestamp");
      *(_BYTE *)&v5->_flags |= 1u;
      v5->_scanTimestamp = v10;
    }
  }

  return v5;
}

@end
