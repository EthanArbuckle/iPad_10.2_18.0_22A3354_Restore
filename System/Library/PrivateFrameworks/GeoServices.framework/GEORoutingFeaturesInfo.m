@implementation GEORoutingFeaturesInfo

- (int)destinationVariant
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_destinationVariant;
  else
    return 1;
}

- (void)setDestinationVariant:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_destinationVariant = a3;
}

- (void)setHasDestinationVariant:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDestinationVariant
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)destinationVariantAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("PROD");
  if (a3 == 2)
  {
    v3 = CFSTR("PREFLIGHT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDestinationVariant:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROD")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("PREFLIGHT")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasChargingNetworkInfo
{
  return self->_chargingNetworkInfo != 0;
}

- (GEOChargingNetworkInfo)chargingNetworkInfo
{
  return self->_chargingNetworkInfo;
}

- (void)setChargingNetworkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_chargingNetworkInfo, a3);
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
  v8.super_class = (Class)GEORoutingFeaturesInfo;
  -[GEORoutingFeaturesInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoutingFeaturesInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutingFeaturesInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v5 = *(_DWORD *)(a1 + 16);
      if (v5 == 1)
      {
        v6 = CFSTR("PROD");
      }
      else if (v5 == 2)
      {
        v6 = CFSTR("PREFLIGHT");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2)
        v7 = CFSTR("destinationVariant");
      else
        v7 = CFSTR("destination_variant");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "chargingNetworkInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "jsonRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("chargingNetworkInfo");
      }
      else
      {
        objc_msgSend(v8, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("charging_network_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

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
  return -[GEORoutingFeaturesInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORoutingFeaturesInfo)initWithDictionary:(id)a3
{
  return (GEORoutingFeaturesInfo *)-[GEORoutingFeaturesInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOChargingNetworkInfo *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_24;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_24;
  if (a3)
    v6 = CFSTR("destinationVariant");
  else
    v6 = CFSTR("destination_variant");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = 1;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROD")) & 1) == 0)
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("PREFLIGHT")))
        v9 = 2;
      else
        v9 = 1;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_14:
    objc_msgSend(a1, "setDestinationVariant:", v9);
  }

  if (a3)
    v10 = CFSTR("chargingNetworkInfo");
  else
    v10 = CFSTR("charging_network_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEOChargingNetworkInfo alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEOChargingNetworkInfo initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEOChargingNetworkInfo initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setChargingNetworkInfo:", v13);

  }
LABEL_24:

  return a1;
}

- (GEORoutingFeaturesInfo)initWithJSON:(id)a3
{
  return (GEORoutingFeaturesInfo *)-[GEORoutingFeaturesInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutingFeaturesInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutingFeaturesInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_chargingNetworkInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEORoutingFeaturesInfo readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_destinationVariant;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  if (self->_chargingNetworkInfo)
  {
    objc_msgSend(v5, "setChargingNetworkInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_destinationVariant;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[GEOChargingNetworkInfo copyWithZone:](self->_chargingNetworkInfo, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOChargingNetworkInfo *chargingNetworkInfo;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEORoutingFeaturesInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_destinationVariant != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  chargingNetworkInfo = self->_chargingNetworkInfo;
  if ((unint64_t)chargingNetworkInfo | *((_QWORD *)v4 + 1))
    v6 = -[GEOChargingNetworkInfo isEqual:](chargingNetworkInfo, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEORoutingFeaturesInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_destinationVariant;
  else
    v3 = 0;
  return -[GEOChargingNetworkInfo hash](self->_chargingNetworkInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOChargingNetworkInfo *chargingNetworkInfo;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[5] & 1) != 0)
  {
    self->_destinationVariant = v7[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  chargingNetworkInfo = self->_chargingNetworkInfo;
  v6 = *((_QWORD *)v7 + 1);
  if (chargingNetworkInfo)
  {
    if (v6)
    {
      -[GEOChargingNetworkInfo mergeFrom:](chargingNetworkInfo, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEORoutingFeaturesInfo setChargingNetworkInfo:](self, "setChargingNetworkInfo:");
    goto LABEL_8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingNetworkInfo, 0);
}

@end
