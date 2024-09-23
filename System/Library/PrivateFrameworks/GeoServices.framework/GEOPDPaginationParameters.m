@implementation GEOPDPaginationParameters

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  void *v4;
  _BYTE *v5;

  v3 = a2;
  if ((v3[28] & 1) != 0)
  {
    *(_BYTE *)(a1 + 24) = v3[24];
    *(_BYTE *)(a1 + 28) |= 1u;
  }
  v4 = (void *)*((_QWORD *)v3 + 2);
  if (v4)
  {
    v5 = v3;
    -[GEOPDPaginationParameters setPageToken:](a1, v4);
    v3 = v5;
  }

}

- (void)setPageToken:(uint64_t)a1
{
  id v4;

  v4 = a2;
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
  v8.super_class = (Class)GEOPDPaginationParameters;
  -[GEOPDPaginationParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPaginationParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPaginationParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("enablePagination");
    else
      v6 = CFSTR("enable_pagination");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 16))
    objc_msgSend(v4, "setObject:forKey:");
  v7 = *(void **)(a1 + 8);
  if (v7)
  {
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__GEOPDPaginationParameters__dictionaryRepresentation___block_invoke;
      v14[3] = &unk_1E1C00600;
      v11 = v10;
      v15 = v11;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
      v12 = v11;

      v9 = v12;
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPaginationParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDPaginationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  char v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("enablePagination");
    else
      v7 = CFSTR("enable_pagination");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "BOOLValue");
      *(_BYTE *)(v6 + 28) |= 1u;
      *(_BYTE *)(v6 + 24) = v9;
    }

    if (a3)
      v10 = CFSTR("pageToken");
    else
      v10 = CFSTR("page_token");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[GEOPDPaginationParameters setPageToken:](v6, v12);

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPaginationParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_pageToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_enablePagination;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_pageToken, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSString *pageToken;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_enablePagination)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  pageToken = self->_pageToken;
  if ((unint64_t)pageToken | *((_QWORD *)v4 + 2))
    v5 = -[NSString isEqual:](pageToken, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v2 = 2654435761 * self->_enablePagination;
  else
    v2 = 0;
  return -[NSString hash](self->_pageToken, "hash") ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageToken, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
