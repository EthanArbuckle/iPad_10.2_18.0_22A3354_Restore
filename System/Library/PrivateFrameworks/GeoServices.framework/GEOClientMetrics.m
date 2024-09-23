@implementation GEOClientMetrics

- (GEOClientNetworkMetrics)networkMetrics
{
  return self->_networkMetrics;
}

- (void)setNetworkMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_networkMetrics, a3);
}

- (void)setResponseSource:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_responseSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMetrics, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_networkMetrics)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (int)responseSource
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_responseSource;
  else
    return 0;
}

- (void)setHasResponseSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasResponseSource
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)responseSourceAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0F938[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResponseSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPDATASERVICE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasNetworkMetrics
{
  return self->_networkMetrics != 0;
}

- (double)queuedTime
{
  return self->_queuedTime;
}

- (void)setQueuedTime:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_queuedTime = a3;
}

- (void)setHasQueuedTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasQueuedTime
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOClientMetrics;
  -[GEOClientMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 36) & 2) != 0)
  {
    v5 = *(int *)(a1 + 32);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0F938[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("responseSource"));

  }
  objc_msgSend((id)a1, "networkMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("networkMetrics"));

  }
  if ((*(_BYTE *)(a1 + 36) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("queuedTime");
    else
      v11 = CFSTR("queued_time");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(void **)(a1 + 8);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __46__GEOClientMetrics__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOClientMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOClientMetrics__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOClientMetrics)initWithDictionary:(id)a3
{
  return (GEOClientMetrics *)-[GEOClientMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEOClientNetworkMetrics *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_28;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_28;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("responseSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("URL")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MAPDATASERVICE")))
    {
      v8 = 3;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_16:
    objc_msgSend(a1, "setResponseSource:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("networkMetrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOClientNetworkMetrics alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOClientNetworkMetrics initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOClientNetworkMetrics initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setNetworkMetrics:", v11);

  }
  if (a3)
    v13 = CFSTR("queuedTime");
  else
    v13 = CFSTR("queued_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(a1, "setQueuedTime:");
  }

LABEL_28:
  return a1;
}

- (GEOClientMetrics)initWithJSON:(id)a3
{
  return (GEOClientMetrics *)-[GEOClientMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientMetricsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _DWORD *v5;

  v5 = a3;
  -[GEOClientMetrics readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5[8] = self->_responseSource;
    *((_BYTE *)v5 + 36) |= 2u;
  }
  if (self->_networkMetrics)
  {
    objc_msgSend(v5, "setNetworkMetrics:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[3] = *(_QWORD *)&self->_queuedTime;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_responseSource;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v7 = -[GEOClientNetworkMetrics copyWithZone:](self->_networkMetrics, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v6 + 24) = self->_queuedTime;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOClientNetworkMetrics *networkMetrics;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOClientMetrics readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 36);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_responseSource != *((_DWORD *)v4 + 8))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_14;
  }
  networkMetrics = self->_networkMetrics;
  if ((unint64_t)networkMetrics | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOClientNetworkMetrics isEqual:](networkMetrics, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 36);
  }
  v8 = (v6 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_queuedTime != *((double *)v4 + 3))
      goto LABEL_14;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double queuedTime;
  double v7;
  long double v8;
  double v9;

  -[GEOClientMetrics readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_responseSource;
  else
    v3 = 0;
  v4 = -[GEOClientNetworkMetrics hash](self->_networkMetrics, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    queuedTime = self->_queuedTime;
    v7 = -queuedTime;
    if (queuedTime >= 0.0)
      v7 = self->_queuedTime;
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
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  GEOClientNetworkMetrics *networkMetrics;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = (double *)v7;
  if ((v7[9] & 2) != 0)
  {
    self->_responseSource = v7[8];
    *(_BYTE *)&self->_flags |= 2u;
  }
  networkMetrics = self->_networkMetrics;
  v6 = *((_QWORD *)v7 + 2);
  if (networkMetrics)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOClientNetworkMetrics mergeFrom:](networkMetrics, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOClientMetrics setNetworkMetrics:](self, "setNetworkMetrics:");
  }
  v4 = (double *)v7;
LABEL_9:
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_queuedTime = v4[3];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOClientMetrics readAll:](self, "readAll:", 0);
    -[GEOClientNetworkMetrics clearUnknownFields:](self->_networkMetrics, "clearUnknownFields:", 1);
  }
}

@end
