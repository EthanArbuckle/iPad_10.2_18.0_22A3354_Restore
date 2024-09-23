@implementation GEOPBTransitIncidentEntity

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    if (a2)
    {
      v5 = *(_QWORD *)(a1 + 24);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
    }
  }
}

- (id)filter
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitIncidentEntity;
  -[GEOPBTransitIncidentEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitIncidentEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitIncidentEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("affectedMuid");
    else
      v6 = CFSTR("affected_muid");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  v7 = *(id *)(a1 + 24);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("filter"));

  }
  v10 = *(void **)(a1 + 8);
  if (v10)
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __56__GEOPBTransitIncidentEntity__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E1C00600;
      v14 = v13;
      v18 = v14;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
      v15 = v14;

      v12 = v15;
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitIncidentEntity _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPBTransitIncidentEntity__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPBTransitIncidentEntityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_filter)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_affectedMuid;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[GEOPBTransitIncidentEntityFilter copyWithZone:](self->_filter, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPBTransitIncidentEntityFilter *filter;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_affectedMuid != *((_QWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  filter = self->_filter;
  if ((unint64_t)filter | *((_QWORD *)v4 + 3))
    v6 = -[GEOPBTransitIncidentEntityFilter isEqual:](filter, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v2 = 2654435761u * self->_affectedMuid;
  else
    v2 = 0;
  return -[GEOPBTransitIncidentEntityFilter hash](self->_filter, "hash") ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (unint64_t)muid
{
  if (self)
    return *(_QWORD *)(self + 16);
  return self;
}

- (BOOL)hasNextStopIDs
{
  _QWORD *v2;
  BOOL v3;

  if (!self || !self->_filter)
    return 0;
  -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[3] != 0;
  else
    v3 = 0;

  return v3;
}

- (NSSet)nextStopIDs
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t i;
  _QWORD *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(_QWORD *)(v4 + 24);
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(v3, "initWithCapacity:", v6);

  for (i = 0; ; ++i)
  {
    -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = v9 ? v9[3] : 0;

    if (i >= v10)
      break;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedLongLong:", -[GEOPBTransitIncidentEntityFilter nextStopMuidAtIndex:]((uint64_t)v12, i));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v14;
}

@end
