@implementation GEOPDVenueContainer

- (GEOPDVenueContainer)init
{
  GEOPDVenueContainer *v2;
  GEOPDVenueContainer *v3;
  GEOPDVenueContainer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueContainer;
  v2 = -[GEOPDVenueContainer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueContainer)initWithData:(id)a3
{
  GEOPDVenueContainer *v3;
  GEOPDVenueContainer *v4;
  GEOPDVenueContainer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueContainer;
  v3 = -[GEOPDVenueContainer initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDVenueContainer;
  -[GEOPDVenueContainer dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDVenueContainer;
  -[GEOPDVenueContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDVenueContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueContainer _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  -[GEOPDVenueContainer readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 88) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("venueId");
    else
      v6 = CFSTR("venue_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("buildingId");
    else
      v8 = CFSTR("building_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 88) & 0x20) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDVenueContainerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabel_tags_157);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v11 = *(id *)(a1 + 48);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("label"));

  }
  v14 = *(_BYTE *)(a1 + 88);
  if ((v14 & 4) != 0)
  {
    v15 = *(int *)(a1 + 84);
    if (v15 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C037C0[v15];
    }
    if (a2)
      v17 = CFSTR("browseType");
    else
      v17 = CFSTR("browse_type");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v14 = *(_BYTE *)(a1 + 88);
  }
  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("muid"));

  }
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __49__GEOPDVenueContainer__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDVenueContainer _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_166;
      else
        v6 = (int *)&readAll__nonRecursiveTag_167;
      GEOPDVenueContainerReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDVenueLabel readAll:](*(_QWORD *)(a1 + 48), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEOPDVenueContainer__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVenueContainerReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  char flags;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDVenueContainerIsDirty((uint64_t)self))
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
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDVenueContainer readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    v5 = v10;
    if (self->_buildingIds.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_buildingIds.count);
    }
    if (self->_label)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  char flags;
  PBUnknownFields *v12;

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
      GEOPDVenueContainerReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueContainer readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_venueId;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  PBRepeatedUInt64Copy();
  v9 = -[GEOPDVenueLabel copyWithZone:](self->_label, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_browseType;
    *(_BYTE *)(v5 + 88) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_muid;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v12 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDVenueLabel *label;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDVenueContainer readAll:]((uint64_t)self, 1);
  -[GEOPDVenueContainer readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_venueId != *((_QWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_19;
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDVenueLabel isEqual:](label, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_browseType != *((_DWORD *)v4 + 21))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_19;
  }
  v6 = (*((_BYTE *)v4 + 88) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 7))
      goto LABEL_19;
    v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[GEOPDVenueContainer readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761u * self->_venueId;
  else
    v3 = 0;
  v4 = PBRepeatedUInt64Hash();
  v5 = -[GEOPDVenueLabel hash](self->_label, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v6 = 2654435761 * self->_browseType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v7 = 2654435761u * self->_muid;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
