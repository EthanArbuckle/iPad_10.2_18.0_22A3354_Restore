@implementation GEOPDVenueBuilding

- (GEOPDVenueBuilding)init
{
  GEOPDVenueBuilding *v2;
  GEOPDVenueBuilding *v3;
  GEOPDVenueBuilding *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueBuilding;
  v2 = -[GEOPDVenueBuilding init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueBuilding)initWithData:(id)a3
{
  GEOPDVenueBuilding *v3;
  GEOPDVenueBuilding *v4;
  GEOPDVenueBuilding *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueBuilding;
  v3 = -[GEOPDVenueBuilding initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDVenueBuilding;
  -[GEOPDVenueBuilding dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDVenueBuilding;
  -[GEOPDVenueBuilding description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDVenueBuilding dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueBuilding _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  -[GEOPDVenueBuilding readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 108) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("buildingId");
    else
      v6 = CFSTR("building_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt64NSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("levelId");
    else
      v8 = CFSTR("level_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_BYTE *)(a1 + 108) & 0x20) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDVenueBuildingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabel_tags_131);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v11 = *(id *)(a1 + 80);
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
  if ((*(_BYTE *)(a1 + 108) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("muid"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("directoryGroupingId");
    else
      v16 = CFSTR("directory_grouping_id");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __48__GEOPDVenueBuilding__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDVenueBuilding _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_144;
      else
        v6 = (int *)&readAll__nonRecursiveTag_145;
      GEOPDVenueBuildingReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDVenueLabel readAll:](*(_QWORD *)(a1 + 80), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __48__GEOPDVenueBuilding__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVenueBuildingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDVenueBuildingIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDVenueBuilding readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v5 = v10;
    if (self->_levelIds.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_levelIds.count);
    }
    if (self->_label)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v10;
    }
    if (self->_directoryGroupingIds.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < self->_directoryGroupingIds.count);
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
  PBUnknownFields *v11;

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
      GEOPDVenueBuildingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueBuilding readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_buildingId;
    *(_BYTE *)(v5 + 108) |= 1u;
  }
  PBRepeatedUInt64Copy();
  v9 = -[GEOPDVenueLabel copyWithZone:](self->_label, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_muid;
    *(_BYTE *)(v5 + 108) |= 2u;
  }
  PBRepeatedUInt64Copy();
  v11 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDVenueLabel *label;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDVenueBuilding readAll:]((uint64_t)self, 1);
  -[GEOPDVenueBuilding readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_buildingId != *((_QWORD *)v4 + 9))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
LABEL_16:
    IsEqual = 0;
    goto LABEL_17;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_16;
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDVenueLabel isEqual:](label, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_muid != *((_QWORD *)v4 + 11))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_16;
  }
  IsEqual = PBRepeatedUInt64IsEqual();
LABEL_17:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[GEOPDVenueBuilding readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_buildingId;
  else
    v3 = 0;
  v4 = PBRepeatedUInt64Hash();
  v5 = -[GEOPDVenueLabel hash](self->_label, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761u * self->_muid;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ PBRepeatedUInt64Hash() ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
