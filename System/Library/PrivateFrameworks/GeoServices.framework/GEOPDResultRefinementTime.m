@implementation GEOPDResultRefinementTime

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 8u;
    *(_BYTE *)(a1 + 64) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementTime readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 32), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDResultRefinementTime)init
{
  GEOPDResultRefinementTime *v2;
  GEOPDResultRefinementTime *v3;
  GEOPDResultRefinementTime *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementTime;
  v2 = -[GEOPDResultRefinementTime init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementTime)initWithData:(id)a3
{
  GEOPDResultRefinementTime *v3;
  GEOPDResultRefinementTime *v4;
  GEOPDResultRefinementTime *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementTime;
  v3 = -[GEOPDResultRefinementTime initWithData:](&v7, sel_initWithData_, a3);
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
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementTimeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_937);
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
    -[GEOPDResultRefinementTime _readDisplayName]((uint64_t)a1);
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
    *(_BYTE *)(a1 + 64) |= 0x10u;
    *(_BYTE *)(a1 + 64) |= 0x40u;
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
    if ((*(_BYTE *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementTimeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_938);
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
    -[GEOPDResultRefinementTime _readMetadata]((uint64_t)a1);
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
    *(_BYTE *)(a1 + 64) |= 0x20u;
    *(_BYTE *)(a1 + 64) |= 0x40u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

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
  v8.super_class = (Class)GEOPDResultRefinementTime;
  -[GEOPDResultRefinementTime description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementTime dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementTime _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementTime readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementTime displayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayName");
    else
      v6 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 64);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("timestamp"));

    v7 = *(_BYTE *)(a1 + 64);
  }
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("isSelected");
    else
      v10 = CFSTR("is_selected");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOPDResultRefinementTime metadata]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("metadata"));

  }
  if ((*(_BYTE *)(a1 + 64) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 61));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("usedNextDayForFilteration");
    else
      v15 = CFSTR("used_next_day_for_filteration");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __55__GEOPDResultRefinementTime__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementTime _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_945;
      else
        v6 = (int *)&readAll__nonRecursiveTag_946;
      GEOPDResultRefinementTimeReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __55__GEOPDResultRefinementTime__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultRefinementTimeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementTimeIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 0);
    if (self->_displayName)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    v6 = v9;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v6 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v6 = v9;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
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
  char flags;
  id v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDResultRefinementTimeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 40) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_isSelected;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v12 = -[GEOPDResultRefinementMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 61) = self->_usedNextDayForFilteration;
    *(_BYTE *)(v5 + 64) |= 4u;
  }
  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  char flags;
  char v7;
  GEOPDResultRefinementMetadata *metadata;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementTime readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_22;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 64);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_timestamp != *((double *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0)
      goto LABEL_22;
    if (self->_isSelected)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_22;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:"))
      goto LABEL_22;
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 64);
  }
  v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) != 0)
    {
      if (self->_usedNextDayForFilteration)
      {
        if (!*((_BYTE *)v4 + 61))
          goto LABEL_22;
      }
      else if (*((_BYTE *)v4 + 61))
      {
        goto LABEL_22;
      }
      v9 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v9 = 0;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char flags;
  unint64_t v5;
  double timestamp;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayName, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    timestamp = self->_timestamp;
    v7 = -timestamp;
    if (timestamp >= 0.0)
      v7 = self->_timestamp;
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
  if ((flags & 2) != 0)
    v10 = 2654435761 * self->_isSelected;
  else
    v10 = 0;
  v11 = -[GEOPDResultRefinementMetadata hash](self->_metadata, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v12 = 2654435761 * self->_usedNextDayForFilteration;
  else
    v12 = 0;
  return v5 ^ v3 ^ v10 ^ v11 ^ v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
