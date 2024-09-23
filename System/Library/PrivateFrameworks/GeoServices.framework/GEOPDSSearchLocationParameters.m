@implementation GEOPDSSearchLocationParameters

- (void)setSearchTransportHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);

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
  v8.super_class = (Class)GEOPDSSearchLocationParameters;
  -[GEOPDSSearchLocationParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchLocationParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchLocationParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  id v8;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 24);
    if (v5)
    {
      if (v5 == 1)
      {
        v6 = CFSTR("SEARCH_LOCATION_PARAMETERS_TYPE_TRANSPORT_HINT");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = CFSTR("SEARCH_LOCATION_PARAMETERS_TYPE_UNKNOWN");
    }
    if (a2)
      v7 = CFSTR("searchLocationParametersType");
    else
      v7 = CFSTR("search_location_parameters_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  v8 = *(id *)(a1 + 16);
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("searchTransportHint");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("search_transport_hint");
    }
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
      v19[2] = __60__GEOPDSSearchLocationParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDSSearchLocationParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDSSearchLocationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  int v9;
  const __CFString *v10;
  void *v11;
  GEOPDSTransportHint *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v16;
  int v17;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("searchLocationParametersType");
      else
        v6 = CFSTR("search_location_parameters_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_LOCATION_PARAMETERS_TYPE_UNKNOWN")) & 1) != 0)
          v9 = 0;
        else
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_LOCATION_PARAMETERS_TYPE_TRANSPORT_HINT"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_14;
        v9 = objc_msgSend(v7, "intValue");
      }
      *(_BYTE *)(a1 + 28) |= 1u;
      *(_DWORD *)(a1 + 24) = v9;
LABEL_14:

      if (a3)
        v10 = CFSTR("searchTransportHint");
      else
        v10 = CFSTR("search_transport_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_46;
      v12 = [GEOPDSTransportHint alloc];
      if (!v12)
      {
LABEL_45:
        -[GEOPDSSearchLocationParameters setSearchTransportHint:](a1, v12);

LABEL_46:
        goto LABEL_47;
      }
      v13 = v11;
      v12 = -[GEOPDSTransportHint init](v12, "init");
      if (!v12)
      {
LABEL_44:

        goto LABEL_45;
      }
      if (a3)
        v14 = CFSTR("transportType");
      else
        v14 = CFSTR("transport_type");
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
        {
          v17 = 0;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
        {
          v17 = 1;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
        {
          v17 = 2;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
        {
          v17 = 3;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
        {
          v17 = 4;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
        {
          v17 = 5;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("RIDESHARE")))
        {
          v17 = 6;
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_43:

          goto LABEL_44;
        }
        v17 = objc_msgSend(v15, "intValue");
      }
      *(_BYTE *)&v12->_flags |= 1u;
      v12->_transportType = v17;
      goto LABEL_43;
    }
  }
LABEL_47:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchLocationParametersReadAllFrom((uint64_t)self, a3);
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
  if (self->_searchTransportHint)
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
    *(_DWORD *)(v5 + 24) = self->_searchLocationParametersType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[GEOPDSTransportHint copyWithZone:](self->_searchTransportHint, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSTransportHint *searchTransportHint;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_searchLocationParametersType != *((_DWORD *)v4 + 6))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  searchTransportHint = self->_searchTransportHint;
  if ((unint64_t)searchTransportHint | *((_QWORD *)v4 + 2))
    v6 = -[GEOPDSTransportHint isEqual:](searchTransportHint, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v2 = 2654435761 * self->_searchLocationParametersType;
  else
    v2 = 0;
  return -[GEOPDSTransportHint hash](self->_searchTransportHint, "hash") ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((*((_BYTE *)v3 + 28) & 1) != 0)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(_BYTE *)(a1 + 28) |= 1u;
    }
    v5 = *(_QWORD *)(a1 + 16);
    v6 = (void *)v4[2];
    if (v5)
    {
      if (v6)
      {
        v7 = v4;
        -[GEOPDSTransportHint mergeFrom:](v5, v6);
LABEL_9:
        v4 = v7;
      }
    }
    else if (v6)
    {
      v7 = v4;
      -[GEOPDSSearchLocationParameters setSearchTransportHint:](a1, v6);
      goto LABEL_9;
    }
  }

}

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
      v5 = *(_QWORD *)(a1 + 16);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTransportHint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
