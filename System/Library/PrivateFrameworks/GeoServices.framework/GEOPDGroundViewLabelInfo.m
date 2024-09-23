@implementation GEOPDGroundViewLabelInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLocationName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_localityName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
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
  uint64_t v13;
  void *v14;
  char flags;
  PBUnknownFields *v16;

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
      GEOPDGroundViewLabelInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_locationName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_secondaryLocationName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[NSString copyWithZone:](self->_localityName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 56) = self->_startHeading;
    *(_BYTE *)(v5 + 76) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_endHeading;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (GEOPDGroundViewLabelInfo)init
{
  GEOPDGroundViewLabelInfo *v2;
  GEOPDGroundViewLabelInfo *v3;
  GEOPDGroundViewLabelInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGroundViewLabelInfo;
  v2 = -[GEOPDGroundViewLabelInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x78) == 0))
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
    -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 0);
    if (self->_locationName)
      PBDataWriterWriteStringField();
    v5 = v9;
    if (self->_secondaryLocationName)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_localityName)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)secondaryLocationName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGroundViewLabelInfo _readSecondaryLocationName]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_4072;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4073;
      GEOPDGroundViewLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)locationName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGroundViewLabelInfo _readLocationName]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (id)localityName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGroundViewLabelInfo _readLocalityName]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroundViewLabelInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (void)_readSecondaryLocationName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundViewLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryLocationName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readLocationName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundViewLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readLocalityName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundViewLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalityName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  char v11;
  void *v12;
  const __CFString *v13;
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
  -[GEOPDGroundViewLabelInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGroundViewLabelInfo locationName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("locationName");
    else
      v6 = CFSTR("location_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDGroundViewLabelInfo secondaryLocationName]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("secondaryLocationName");
    else
      v8 = CFSTR("secondary_location_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  -[GEOPDGroundViewLabelInfo localityName]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("localityName");
    else
      v10 = CFSTR("locality_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  v11 = *(_BYTE *)(a1 + 76);
  if ((v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("startHeading");
    else
      v13 = CFSTR("start_heading");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v11 = *(_BYTE *)(a1 + 76);
  }
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("endHeading");
    else
      v15 = CFSTR("end_heading");
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
      v23[2] = __54__GEOPDGroundViewLabelInfo__dictionaryRepresentation___block_invoke;
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

- (GEOPDGroundViewLabelInfo)initWithData:(id)a3
{
  GEOPDGroundViewLabelInfo *v3;
  GEOPDGroundViewLabelInfo *v4;
  GEOPDGroundViewLabelInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGroundViewLabelInfo;
  v3 = -[GEOPDGroundViewLabelInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
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
  v8.super_class = (Class)GEOPDGroundViewLabelInfo;
  -[GEOPDGroundViewLabelInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGroundViewLabelInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDGroundViewLabelInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDGroundViewLabelInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGroundViewLabelInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *locationName;
  NSString *secondaryLocationName;
  NSString *localityName;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 1);
  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)v4, 1);
  locationName = self->_locationName;
  if ((unint64_t)locationName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](locationName, "isEqual:"))
      goto LABEL_17;
  }
  secondaryLocationName = self->_secondaryLocationName;
  if ((unint64_t)secondaryLocationName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](secondaryLocationName, "isEqual:"))
      goto LABEL_17;
  }
  localityName = self->_localityName;
  if ((unint64_t)localityName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](localityName, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_startHeading != *((double *)v4 + 7))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 76) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_endHeading != *((double *)v4 + 3))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  char flags;
  unint64_t v7;
  double startHeading;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double endHeading;
  double v14;
  long double v15;
  double v16;

  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_locationName, "hash");
  v4 = -[NSString hash](self->_secondaryLocationName, "hash");
  v5 = -[NSString hash](self->_localityName, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    startHeading = self->_startHeading;
    v9 = -startHeading;
    if (startHeading >= 0.0)
      v9 = self->_startHeading;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((flags & 1) != 0)
  {
    endHeading = self->_endHeading;
    v14 = -endHeading;
    if (endHeading >= 0.0)
      v14 = self->_endHeading;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

@end
