@implementation GEOPDResultRefinementMultiSelectElement

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x10u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementMultiSelectElement readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 40), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 32), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDResultRefinementMultiSelectElement)init
{
  GEOPDResultRefinementMultiSelectElement *v2;
  GEOPDResultRefinementMultiSelectElement *v3;
  GEOPDResultRefinementMultiSelectElement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementMultiSelectElement;
  v2 = -[GEOPDResultRefinementMultiSelectElement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementMultiSelectElement)initWithData:(id)a3
{
  GEOPDResultRefinementMultiSelectElement *v3;
  GEOPDResultRefinementMultiSelectElement *v4;
  GEOPDResultRefinementMultiSelectElement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementMultiSelectElement;
  v3 = -[GEOPDResultRefinementMultiSelectElement initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_661);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementMultiSelectElement _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 76) |= 0x20u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_663);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)metadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementMultiSelectElement _readMetadata]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 76) |= 0x40u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (uint64_t)elementType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 60);
    else
      return 0;
  }
  return result;
}

- (uint64_t)evChargingConnectorType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 64);
    else
      return 0;
  }
  return result;
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
  v8.super_class = (Class)GEOPDResultRefinementMultiSelectElement;
  -[GEOPDResultRefinementMultiSelectElement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelectElement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMultiSelectElement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __int16 v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  int v28;
  __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  __CFString *v32;
  const __CFString *v33;
  _QWORD v34[4];
  id v35;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementMultiSelectElement readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelectElement displayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayName");
    else
      v6 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_WORD *)(a1 + 76) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("isSelected");
    else
      v8 = CFSTR("is_selected");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_662);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  -[GEOPDResultRefinementMultiSelectElement metadata]((id *)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("metadata"));

  }
  v18 = *(_WORD *)(a1 + 76);
  if ((v18 & 1) == 0)
  {
    if ((v18 & 2) == 0)
      goto LABEL_27;
LABEL_46:
    v31 = *(int *)(a1 + 64);
    if (v31 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_1E1C0DE10[v31];
    }
    if (a2)
      v33 = CFSTR("evChargingConnectorType");
    else
      v33 = CFSTR("ev_charging_connector_type");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

    if ((*(_WORD *)(a1 + 76) & 4) == 0)
      goto LABEL_32;
    goto LABEL_28;
  }
  v28 = *(_DWORD *)(a1 + 60);
  if (v28)
  {
    if (v28 == 1)
    {
      v29 = CFSTR("RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_EV_CHARGING");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v29 = CFSTR("RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_DEFAULT");
  }
  if (a2)
    v30 = CFSTR("elementType");
  else
    v30 = CFSTR("element_type");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  v18 = *(_WORD *)(a1 + 76);
  if ((v18 & 2) != 0)
    goto LABEL_46;
LABEL_27:
  if ((v18 & 4) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("selectionSequenceNumber");
    else
      v20 = CFSTR("selection_sequence_number");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
LABEL_32:
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __69__GEOPDResultRefinementMultiSelectElement__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v25 = v24;
      v35 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v34);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementMultiSelectElement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_680;
      else
        v6 = (int *)&readAll__nonRecursiveTag_681;
      GEOPDResultRefinementMultiSelectElementReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __69__GEOPDResultRefinementMultiSelectElement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultRefinementMultiSelectElementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  __int16 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    flags = (__int16)self->_flags;
    if ((flags & 0x1A0) == 0
      && ((flags & 0x40) == 0
       || (GEOPDResultRefinementMetadataIsDirty((os_unfair_lock_s *)self->_metadata) & 1) == 0))
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
      goto LABEL_16;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 0);
  if (self->_displayName)
    PBDataWriterWriteStringField();
  v6 = v10;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v10;
  }
  if (self->_styleAttributes)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  v7 = (__int16)self->_flags;
  if ((v7 & 1) == 0)
  {
    if ((v7 & 2) == 0)
      goto LABEL_13;
LABEL_18:
    PBDataWriterWriteInt32Field();
    v6 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteInt32Field();
  v6 = v10;
  v7 = (__int16)self->_flags;
  if ((v7 & 2) != 0)
    goto LABEL_18;
LABEL_13:
  if ((v7 & 4) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint32Field();
    v6 = v10;
  }
LABEL_15:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int16 flags;
  PBUnknownFields *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 0);
    v9 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_BYTE *)(v5 + 72) = self->_isSelected;
      *(_WORD *)(v5 + 76) |= 8u;
    }
    v11 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v11;

    v13 = -[GEOPDResultRefinementMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v13;

    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_elementType;
      *(_WORD *)(v5 + 76) |= 1u;
      flags = (__int16)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_9:
        if ((flags & 4) == 0)
        {
LABEL_11:
          v16 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v16;
          goto LABEL_12;
        }
LABEL_10:
        *(_DWORD *)(v5 + 68) = self->_selectionSequenceNumber;
        *(_WORD *)(v5 + 76) |= 4u;
        goto LABEL_11;
      }
    }
    else if ((flags & 2) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 64) = self->_evChargingConnectorType;
    *(_WORD *)(v5 + 76) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDResultRefinementMultiSelectElementReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_12:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  __int16 v6;
  GEOStyleAttributes *styleAttributes;
  GEOPDResultRefinementMetadata *metadata;
  __int16 flags;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_30;
  }
  v6 = *((_WORD *)v4 + 38);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_isSelected)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_30;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_12;
    }
LABEL_30:
    v11 = 0;
    goto LABEL_31;
  }
  if ((v6 & 8) != 0)
    goto LABEL_30;
LABEL_12:
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 5)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_30;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:"))
      goto LABEL_30;
  }
  flags = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 38);
  if ((flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_elementType != *((_DWORD *)v4 + 15))
      goto LABEL_30;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_evChargingConnectorType != *((_DWORD *)v4 + 16))
      goto LABEL_30;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_30;
  }
  v11 = (v10 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_selectionSequenceNumber != *((_DWORD *)v4 + 17))
      goto LABEL_30;
    v11 = 1;
  }
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int16 flags;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[GEOPDResultRefinementMultiSelectElement readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayName, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v4 = 2654435761 * self->_isSelected;
  else
    v4 = 0;
  v5 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v6 = -[GEOPDResultRefinementMetadata hash](self->_metadata, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    v8 = 0;
    if ((flags & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v9 = 0;
    if ((flags & 4) != 0)
      goto LABEL_7;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10;
  }
  v8 = 2654435761 * self->_elementType;
  if ((flags & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v9 = 2654435761 * self->_evChargingConnectorType;
  if ((flags & 4) == 0)
    goto LABEL_10;
LABEL_7:
  v10 = 2654435761 * self->_selectionSequenceNumber;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
