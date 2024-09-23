@implementation GEOPDSearchQueryGeoNormalizerMetadata

- (GEOPDSearchQueryGeoNormalizerMetadata)init
{
  GEOPDSearchQueryGeoNormalizerMetadata *v2;
  GEOPDSearchQueryGeoNormalizerMetadata *v3;
  GEOPDSearchQueryGeoNormalizerMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  v2 = -[GEOPDSearchQueryGeoNormalizerMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryGeoNormalizerMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryGeoNormalizerMetadata *v3;
  GEOPDSearchQueryGeoNormalizerMetadata *v4;
  GEOPDSearchQueryGeoNormalizerMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  v3 = -[GEOPDSearchQueryGeoNormalizerMetadata initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  -[GEOPDSearchQueryGeoNormalizerMetadata dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  -[GEOPDSearchQueryGeoNormalizerMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryGeoNormalizerMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryGeoNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  const __CFString *v19;
  void *v20;
  id v21;
  id v22;
  const __CFString *v23;
  void *v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  __CFString *v28;

  if (a1)
  {
    -[GEOPDSearchQueryGeoNormalizerMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x10) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnitNumber_tags);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v7 = *(id *)(a1 + 64);
    if (v7)
    {
      if (a2)
        v8 = CFSTR("unitNumber");
      else
        v8 = CFSTR("unit_number");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 2) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFloor_tags);
        objc_sync_exit(v10);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v11 = *(id *)(a1 + 40);
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("floor"));

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 8) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoPox_tags);
        objc_sync_exit(v13);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v14 = *(id *)(a1 + 56);
    if (v14)
    {
      if (a2)
        v15 = CFSTR("poPox");
      else
        v15 = CFSTR("po_pox");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 4) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        v17 = v16;
        objc_sync_enter(v17);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMailStop_tags);
        objc_sync_exit(v17);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v18 = *(id *)(a1 + 48);
    if (v18)
    {
      if (a2)
        v19 = CFSTR("mailStop");
      else
        v19 = CFSTR("mail_stop");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x20) == 0)
    {
      v20 = *(void **)(a1 + 8);
      if (v20)
      {
        v21 = v20;
        objc_sync_enter(v21);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnitTypeId_tags);
        objc_sync_exit(v21);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v22 = *(id *)(a1 + 72);
    if (v22)
    {
      if (a2)
        v23 = CFSTR("unitTypeId");
      else
        v23 = CFSTR("unit_type_id");
      objc_msgSend(v4, "setObject:forKey:", v22, v23);
    }

    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v26 = 0;
        do
        {
          v27 = *(unsigned int *)(*v25 + 4 * v26);
          if ((v27 - 1) >= 5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = off_1E1C0A750[(int)v27 - 1];
          }
          objc_msgSend(v24, "addObject:", v28);

          ++v26;
          v25 = (_QWORD *)(a1 + 16);
        }
        while (v26 < *(_QWORD *)(a1 + 24));
      }
      objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("normalizers"));

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
  return -[GEOPDSearchQueryGeoNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1049;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1050;
      GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryGeoNormalizerMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_normalizers;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7F) == 0))
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
    v5 = v10;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 0);
    if (self->_unitNumber)
      PBDataWriterWriteStringField();
    v5 = v10;
    if (self->_floor)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if (self->_poPox)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if (self->_mailStop)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if (self->_unitTypeId)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    p_normalizers = &self->_normalizers;
    if (p_normalizers->count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < p_normalizers->count);
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_unitNumber, "copyWithZone:", a3);
    v9 = (void *)v5[8];
    v5[8] = v8;

    v10 = -[NSString copyWithZone:](self->_floor, "copyWithZone:", a3);
    v11 = (void *)v5[5];
    v5[5] = v10;

    v12 = -[NSString copyWithZone:](self->_poPox, "copyWithZone:", a3);
    v13 = (void *)v5[7];
    v5[7] = v12;

    v14 = -[NSString copyWithZone:](self->_mailStop, "copyWithZone:", a3);
    v15 = (void *)v5[6];
    v5[6] = v14;

    v16 = -[NSString copyWithZone:](self->_unitTypeId, "copyWithZone:", a3);
    v17 = (void *)v5[9];
    v5[9] = v16;

    PBRepeatedInt32Copy();
    return v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchQueryGeoNormalizerMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *unitNumber;
  NSString *floor;
  NSString *poPox;
  NSString *mailStop;
  NSString *unitTypeId;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 1),
         -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)v4, 1),
         unitNumber = self->_unitNumber,
         !((unint64_t)unitNumber | v4[8]))
     || -[NSString isEqual:](unitNumber, "isEqual:"))
    && ((floor = self->_floor, !((unint64_t)floor | v4[5]))
     || -[NSString isEqual:](floor, "isEqual:"))
    && ((poPox = self->_poPox, !((unint64_t)poPox | v4[7]))
     || -[NSString isEqual:](poPox, "isEqual:"))
    && ((mailStop = self->_mailStop, !((unint64_t)mailStop | v4[6]))
     || -[NSString isEqual:](mailStop, "isEqual:"))
    && ((unitTypeId = self->_unitTypeId, !((unint64_t)unitTypeId | v4[9]))
     || -[NSString isEqual:](unitTypeId, "isEqual:")))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_unitNumber, "hash");
  v4 = -[NSString hash](self->_floor, "hash") ^ v3;
  v5 = -[NSString hash](self->_poPox, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_mailStop, "hash");
  v7 = -[NSString hash](self->_unitTypeId, "hash");
  return v6 ^ v7 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTypeId, 0);
  objc_storeStrong((id *)&self->_unitNumber, 0);
  objc_storeStrong((id *)&self->_poPox, 0);
  objc_storeStrong((id *)&self->_mailStop, 0);
  objc_storeStrong((id *)&self->_floor, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
