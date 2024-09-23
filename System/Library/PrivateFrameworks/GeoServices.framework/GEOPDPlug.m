@implementation GEOPDPlug

- (GEOPDPlug)init
{
  GEOPDPlug *v2;
  GEOPDPlug *v3;
  GEOPDPlug *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlug;
  v2 = -[GEOPDPlug init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlug)initWithData:(id)a3
{
  GEOPDPlug *v3;
  GEOPDPlug *v4;
  GEOPDPlug *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlug;
  v3 = -[GEOPDPlug initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)connectorType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
    else
      return 0;
  }
  return result;
}

- (void)_readConnectorTypeDisplayText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readConnectorTypeDisplayText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)connectorTypeDisplayText
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlug _readConnectorTypeDisplayText]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readCurrentTypeDisplayText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentTypeDisplayText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)currentTypeDisplayText
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlug _readCurrentTypeDisplayText]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readAvailabilityInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAvailabilityInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)availabilityInfo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlug _readAvailabilityInfo]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readChargerInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlugReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChargerInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)chargerInfo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlug _readChargerInfo]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDPlug;
  -[GEOPDPlug description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlug dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlug _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  -[GEOPDPlug readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v5 = *(int *)(a1 + 68);
    if (v5 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0BFC0[v5];
    }
    if (a2)
      v7 = CFSTR("connectorType");
    else
      v7 = CFSTR("connector_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDPlug connectorTypeDisplayText]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("connectorTypeDisplayText");
    else
      v9 = CFSTR("connector_type_display_text");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  -[GEOPDPlug currentTypeDisplayText]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("currentTypeDisplayText");
    else
      v11 = CFSTR("current_type_display_text");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("powerWatts");
    else
      v13 = CFSTR("power_watts");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  -[GEOPDPlug availabilityInfo]((id *)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("availabilityInfo");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("availability_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  -[GEOPDPlug chargerInfo]((id *)a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("chargerInfo");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("charger_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __39__GEOPDPlug__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlug _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5850;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5851;
      GEOPDPlugReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDChargerInfo readAll:](*(_QWORD *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __39__GEOPDPlug__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPlugReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  GEOPDChargerInfo *chargerInfo;
  int v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE8) != 0)
    || (*(_BYTE *)&self->_flags & 0x10) != 0
    && (chargerInfo = self->_chargerInfo) != 0
    && (os_unfair_lock_lock_with_options(),
        os_unfair_lock_assert_owner(&chargerInfo->_readerLock),
        v7 = *(_BYTE *)&chargerInfo->_flags & 0xE,
        os_unfair_lock_unlock(&chargerInfo->_readerLock),
        v7))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlug readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v10;
    if (self->_connectorTypeDisplayText)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if (self->_currentTypeDisplayText)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v10;
    }
    if (self->_availabilityInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_chargerInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }
  else
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlugReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlug readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_connectorType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_connectorTypeDisplayText, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_currentTypeDisplayText, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_powerWatts;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v13 = -[GEOPDAvailabilityInfo copyWithZone:](self->_availabilityInfo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOPDChargerInfo copyWithZone:](self->_chargerInfo, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *connectorTypeDisplayText;
  NSString *currentTypeDisplayText;
  GEOPDAvailabilityInfo *availabilityInfo;
  GEOPDChargerInfo *chargerInfo;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPDPlug readAll:]((uint64_t)self, 1);
  -[GEOPDPlug readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_connectorType != *((_DWORD *)v4 + 17))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  connectorTypeDisplayText = self->_connectorTypeDisplayText;
  if ((unint64_t)connectorTypeDisplayText | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](connectorTypeDisplayText, "isEqual:"))
  {
    goto LABEL_20;
  }
  currentTypeDisplayText = self->_currentTypeDisplayText;
  if ((unint64_t)currentTypeDisplayText | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](currentTypeDisplayText, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_powerWatts != *((_DWORD *)v4 + 18))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  availabilityInfo = self->_availabilityInfo;
  if ((unint64_t)availabilityInfo | *((_QWORD *)v4 + 3)
    && !-[GEOPDAvailabilityInfo isEqual:](availabilityInfo, "isEqual:"))
  {
    goto LABEL_20;
  }
  chargerInfo = self->_chargerInfo;
  if ((unint64_t)chargerInfo | *((_QWORD *)v4 + 4))
    v9 = -[GEOPDChargerInfo isEqual:](chargerInfo, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  -[GEOPDPlug readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_connectorType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_connectorTypeDisplayText, "hash");
  v5 = -[NSString hash](self->_currentTypeDisplayText, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_powerWatts;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[GEOPDAvailabilityInfo hash](self->_availabilityInfo, "hash");
  return v7 ^ v8 ^ -[GEOPDChargerInfo hash](self->_chargerInfo, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTypeDisplayText, 0);
  objc_storeStrong((id *)&self->_connectorTypeDisplayText, 0);
  objc_storeStrong((id *)&self->_chargerInfo, 0);
  objc_storeStrong((id *)&self->_availabilityInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
