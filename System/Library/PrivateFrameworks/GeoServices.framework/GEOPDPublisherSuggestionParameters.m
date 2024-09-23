@implementation GEOPDPublisherSuggestionParameters

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 24);
  v5 = (void *)v3[3];
  if (v4)
  {
    if (!v5)
      goto LABEL_7;
    v6 = v3;
    objc_msgSend(v4, "mergeFrom:");
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    v6 = v3;
    -[GEOPDPublisherSuggestionParameters setViewportInfo:](a1, v5);
  }
  v3 = v6;
LABEL_7:
  if ((v3[4] & 1) != 0)
  {
    *(_QWORD *)(a1 + 16) = v3[2];
    *(_BYTE *)(a1 + 32) |= 1u;
  }

}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 8);
    *(_QWORD *)(result + 8) = 0;

    return objc_msgSend(*(id *)(v1 + 24), "clearUnknownFields:", 1);
  }
  return result;
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOPDPublisherSuggestionParameters;
  -[GEOPDPublisherSuggestionParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPublisherSuggestionParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPublisherSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 24);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("requestLocalTimestamp");
    else
      v10 = CFSTR("request_local_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__GEOPDPublisherSuggestionParameters__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPublisherSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEOPDPublisherSuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  GEOPDViewportInfo *v9;
  GEOPDViewportInfo *v10;
  GEOPDViewportInfo *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("viewportInfo");
    else
      v7 = CFSTR("viewport_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = [GEOPDViewportInfo alloc];
      if ((a3 & 1) != 0)
        v10 = -[GEOPDViewportInfo initWithJSON:](v9, "initWithJSON:", v8);
      else
        v10 = -[GEOPDViewportInfo initWithDictionary:](v9, "initWithDictionary:", v8);
      v11 = v10;
      -[GEOPDPublisherSuggestionParameters setViewportInfo:](v6, v10);

    }
    if (a3)
      v12 = CFSTR("requestLocalTimestamp");
    else
      v12 = CFSTR("request_local_timestamp");
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      *(_BYTE *)(v6 + 32) |= 1u;
      *(_QWORD *)(v6 + 16) = v14;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPublisherSuggestionParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_viewportInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_requestLocalTimestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDViewportInfo *viewportInfo;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_requestLocalTimestamp == *((double *)v4 + 2))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double requestLocalTimestamp;
  double v6;
  long double v7;
  double v8;

  v3 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    requestLocalTimestamp = self->_requestLocalTimestamp;
    v6 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0)
      v6 = self->_requestLocalTimestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
