@implementation GEOWiFiPasspointInfo

- (int)networkType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_networkType;
  else
    return 0;
}

- (void)setNetworkType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNetworkType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_1E1C122E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNetworkType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)venueGroup
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_venueGroup;
  else
    return 0;
}

- (void)setVenueGroup:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_venueGroup = a3;
}

- (void)setHasVenueGroup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasVenueGroup
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)venueGroupAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E1C12370[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVenueGroup:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_VENUE_GROUP")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSEMBLY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDUCATIONAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FACTORY_AND_INDUSTRIAL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTITUTIONAL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MERCANTILE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESIDENTIAL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STORAGE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UTILITY_AND_MISC")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VEHICULAR")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OUTDOOR")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)venueType
{
  return self->_venueType;
}

- (void)setVenueType:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_venueType = a3;
}

- (void)setHasVenueType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasVenueType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)hasVenueName
{
  return self->_venueName != 0;
}

- (NSString)venueName
{
  return self->_venueName;
}

- (void)setVenueName:(id)a3
{
  objc_storeStrong((id *)&self->_venueName, a3);
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
  v8.super_class = (Class)GEOWiFiPasspointInfo;
  -[GEOWiFiPasspointInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiPasspointInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 28);
  if ((v3 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 2) == 0)
      goto LABEL_4;
LABEL_14:
    v9 = *(int *)(a1 + 20);
    if (v9 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C12370[v9];
    }
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("venueGroup"));

    if ((*(_BYTE *)(a1 + 28) & 4) != 0)
      goto LABEL_5;
    goto LABEL_6;
  }
  v7 = *(int *)(a1 + 16);
  if (v7 >= 0x11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C122E8[v7];
  }
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("networkType"));

  v3 = *(_BYTE *)(a1 + 28);
  if ((v3 & 2) != 0)
    goto LABEL_14;
LABEL_4:
  if ((v3 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("venueType"));

  }
LABEL_6:
  objc_msgSend((id)a1, "venueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("venueName"));

  return v2;
}

- (GEOWiFiPasspointInfo)initWithDictionary:(id)a3
{
  return (GEOWiFiPasspointInfo *)-[GEOWiFiPasspointInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (!a1)
    goto LABEL_78;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_78;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("networkType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
    {
      v6 = 9;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
    {
      v6 = 10;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
    {
      v6 = 11;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
    {
      v6 = 12;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
    {
      v6 = 13;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
    {
      v6 = 14;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
    {
      v6 = 15;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
    {
      v6 = 16;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
    v6 = objc_msgSend(v4, "intValue");
  }
  objc_msgSend(a1, "setNetworkType:", v6);
LABEL_43:

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("venueGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_VENUE_GROUP")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ASSEMBLY")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EDUCATIONAL")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FACTORY_AND_INDUSTRIAL")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INSTITUTIONAL")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MERCANTILE")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESIDENTIAL")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STORAGE")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UTILITY_AND_MISC")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VEHICULAR")) & 1) != 0)
    {
      v9 = 10;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("OUTDOOR")))
    {
      v9 = 11;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_72;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_72:
    objc_msgSend(a1, "setVenueGroup:", v9);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("venueType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setVenueType:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("venueName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setVenueName:", v12);

  }
LABEL_78:

  return a1;
}

- (GEOWiFiPasspointInfo)initWithJSON:(id)a3
{
  return (GEOWiFiPasspointInfo *)-[GEOWiFiPasspointInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiPasspointInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiPasspointInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_venueName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOWiFiPasspointInfo readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_networkType;
    *((_BYTE *)v6 + 28) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 5) = self->_venueGroup;
  *((_BYTE *)v6 + 28) |= 2u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 6) = self->_venueType;
    *((_BYTE *)v6 + 28) |= 4u;
  }
LABEL_5:
  if (self->_venueName)
  {
    objc_msgSend(v6, "setVenueName:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_venueGroup;
    *(_BYTE *)(v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_networkType;
  *(_BYTE *)(v5 + 28) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_venueType;
    *(_BYTE *)(v5 + 28) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_venueName, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *venueName;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOWiFiPasspointInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_networkType != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_venueGroup != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_venueType != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  venueName = self->_venueName;
  if ((unint64_t)venueName | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](venueName, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOWiFiPasspointInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_venueName, "hash");
  }
  v3 = 2654435761 * self->_networkType;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_venueGroup;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_venueType;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_venueName, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 28);
  if ((v5 & 1) != 0)
  {
    self->_networkType = *((_DWORD *)v6 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v6 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v6 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_venueGroup = *((_DWORD *)v6 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v6 + 28) & 4) != 0)
  {
LABEL_4:
    self->_venueType = *((_DWORD *)v6 + 6);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v6 + 1))
  {
    -[GEOWiFiPasspointInfo setVenueName:](self, "setVenueName:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueName, 0);
}

@end
