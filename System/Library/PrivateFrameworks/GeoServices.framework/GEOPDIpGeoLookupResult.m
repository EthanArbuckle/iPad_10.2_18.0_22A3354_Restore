@implementation GEOPDIpGeoLookupResult

- (GEOPDIpGeoLookupResult)init
{
  GEOPDIpGeoLookupResult *v2;
  GEOPDIpGeoLookupResult *v3;
  GEOPDIpGeoLookupResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDIpGeoLookupResult;
  v2 = -[GEOPDIpGeoLookupResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDIpGeoLookupResult)initWithData:(id)a3
{
  GEOPDIpGeoLookupResult *v3;
  GEOPDIpGeoLookupResult *v4;
  GEOPDIpGeoLookupResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDIpGeoLookupResult;
  v3 = -[GEOPDIpGeoLookupResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIpAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIpAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)ipAddress
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDIpGeoLookupResult _readIpAddress]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setIpAddress:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 8u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_2636);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)location
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDIpGeoLookupResult _readLocation]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setLocation:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 0x10u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_2637);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)countryCode
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDIpGeoLookupResult _readCountryCode]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setCountryCode:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 4u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readTimeZome
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDIpGeoLookupResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeZome_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)timeZome
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDIpGeoLookupResult _readTimeZome]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setTimeZome:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 0x20u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);

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
  v8.super_class = (Class)GEOPDIpGeoLookupResult;
  -[GEOPDIpGeoLookupResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDIpGeoLookupResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDIpGeoLookupResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
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
  -[GEOPDIpGeoLookupResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 68);
    if (v5 <= 29)
    {
      v6 = CFSTR("STATUS_SUCCESS");
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v6 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v5 != 20)
            goto LABEL_15;
          v6 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  -[GEOPDIpGeoLookupResult ipAddress]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("ipAddress");
    else
      v8 = CFSTR("ip_address");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  -[GEOPDIpGeoLookupResult location]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("location"));

  }
  -[GEOPDIpGeoLookupResult countryCode]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("countryCode");
    else
      v13 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  -[GEOPDIpGeoLookupResult timeZome]((id *)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("timeZome");
    else
      v15 = CFSTR("time_zome");
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
      v23[2] = __52__GEOPDIpGeoLookupResult__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDIpGeoLookupResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2642;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2643;
      GEOPDIpGeoLookupResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __52__GEOPDIpGeoLookupResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDIpGeoLookupResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7C) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_ipAddress)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_location)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_countryCode)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_timeZome)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
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
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PBUnknownFields *v17;

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
      GEOPDIpGeoLookupResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_status;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_ipAddress, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_timeZome, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *ipAddress;
  GEOLatLng *location;
  NSString *countryCode;
  NSString *timeZome;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 1);
  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_status != *((_DWORD *)v4 + 17))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  ipAddress = self->_ipAddress;
  if ((unint64_t)ipAddress | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](ipAddress, "isEqual:"))
    goto LABEL_15;
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
      goto LABEL_15;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_15;
  }
  timeZome = self->_timeZome;
  if ((unint64_t)timeZome | *((_QWORD *)v4 + 6))
    v9 = -[NSString isEqual:](timeZome, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;

  -[GEOPDIpGeoLookupResult readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_ipAddress, "hash") ^ v3;
  v5 = -[GEOLatLng hash](self->_location, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_countryCode, "hash");
  return v6 ^ -[NSString hash](self->_timeZome, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZome, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
