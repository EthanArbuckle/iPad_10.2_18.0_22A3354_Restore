@implementation GEORPPersonalizedMaps

- (int)addressType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_addressType;
  else
    return 0;
}

- (void)setAddressType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_addressType = a3;
}

- (void)setHasAddressType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAddressType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)addressTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C0EC58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAddressType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_MARKED_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_FREQUENT_LOCATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RECENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_EDIT_FWDGEO")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FALLBACK_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_TYPE_COMPLETION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXISTING_ADDRESS")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)placeType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_placeType;
  else
    return 0;
}

- (void)setPlaceType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPlaceType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)placeTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0ECA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SCHOOL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEORPAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
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
  v8.super_class = (Class)GEORPPersonalizedMaps;
  -[GEORPPersonalizedMaps description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPersonalizedMaps dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPersonalizedMaps _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) != 0)
    {
      v6 = *(int *)(a1 + 16);
      if (v6 >= 0xA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C0EC58[v6];
      }
      if (a2)
        v8 = CFSTR("addressType");
      else
        v8 = CFSTR("address_type");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      v9 = *(int *)(a1 + 20);
      if (v9 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E1C0ECA8[v9];
      }
      if (a2)
        v11 = CFSTR("placeType");
      else
        v11 = CFSTR("place_type");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    objc_msgSend((id)a1, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v12, "jsonRepresentation");
      else
        objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("address"));

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
  return -[GEORPPersonalizedMaps _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPersonalizedMaps)initWithDictionary:(id)a3
{
  return (GEORPPersonalizedMaps *)-[GEORPPersonalizedMaps _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  GEORPAddress *v15;
  uint64_t v16;
  void *v17;

  v5 = a2;
  if (!a1)
    goto LABEL_55;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_55;
  if (a3)
    v6 = CFSTR("addressType");
  else
    v6 = CFSTR("address_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADDRESS_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_CURRENT_LOCATION")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_MARKED_LOCATION")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_FREQUENT_LOCATION")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_RECENT_LOCATION")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("USER_EDIT_FWDGEO")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FALLBACK_CURRENT_LOCATION")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_TYPE_COMPLETION")) & 1) != 0)
    {
      v9 = 8;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("EXISTING_ADDRESS")))
    {
      v9 = 9;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_32;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setAddressType:", v9);
LABEL_32:

  if (a3)
    v10 = CFSTR("placeType");
  else
    v10 = CFSTR("place_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PLACE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("HOME")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WORK")) & 1) != 0)
    {
      v13 = 2;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("SCHOOL")))
    {
      v13 = 3;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_48:
    objc_msgSend(a1, "setPlaceType:", v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEORPAddress alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEORPAddress initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEORPAddress initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setAddress:", v16);

  }
LABEL_55:

  return a1;
}

- (GEORPPersonalizedMaps)initWithJSON:(id)a3
{
  return (GEORPPersonalizedMaps *)-[GEORPPersonalizedMaps _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPersonalizedMapsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPersonalizedMapsReadAllFrom((uint64_t)self, a3, 0);
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
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_address)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEORPPersonalizedMaps readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_addressType;
    *((_BYTE *)v6 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_placeType;
    *((_BYTE *)v6 + 24) |= 2u;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_addressType;
    *(_BYTE *)(v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_placeType;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v8 = -[GEORPAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPAddress *address;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEORPPersonalizedMaps readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_addressType != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_placeType != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 1))
    v6 = -[GEORPAddress isEqual:](address, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEORPPersonalizedMaps readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_addressType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[GEORPAddress hash](self->_address, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_placeType;
  return v4 ^ v3 ^ -[GEORPAddress hash](self->_address, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  GEORPAddress *address;
  uint64_t v7;
  int *v8;

  v8 = (int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 24);
  if ((v5 & 1) != 0)
  {
    self->_addressType = v8[4];
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v8 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_placeType = v8[5];
    *(_BYTE *)&self->_flags |= 2u;
  }
  address = self->_address;
  v7 = *((_QWORD *)v8 + 1);
  if (address)
  {
    if (v7)
    {
      -[GEORPAddress mergeFrom:](address, "mergeFrom:");
LABEL_10:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEORPPersonalizedMaps setAddress:](self, "setAddress:");
    goto LABEL_10;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

@end
