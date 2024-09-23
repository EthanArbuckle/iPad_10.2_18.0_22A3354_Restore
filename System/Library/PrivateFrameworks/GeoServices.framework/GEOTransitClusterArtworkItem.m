@implementation GEOTransitClusterArtworkItem

- (unsigned)artworkIndex
{
  return self->_artworkIndex;
}

- (void)setArtworkIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_artworkIndex = a3;
}

- (void)setHasArtworkIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArtworkIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (GEOServerFormattedString)text
{
  return (GEOServerFormattedString *)self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
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
  v8.super_class = (Class)GEOTransitClusterArtworkItem;
  -[GEOTransitClusterArtworkItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitClusterArtworkItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitClusterArtworkItem _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("artworkIndex");
    else
      v6 = CFSTR("artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("text"));

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
      v17[2] = __58__GEOTransitClusterArtworkItem__dictionaryRepresentation___block_invoke;
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
  return -[GEOTransitClusterArtworkItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOTransitClusterArtworkItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitClusterArtworkItem)initWithDictionary:(id)a3
{
  return (GEOTransitClusterArtworkItem *)-[GEOTransitClusterArtworkItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  GEOFormattedString *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("artworkIndex");
      else
        v6 = CFSTR("artwork_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setArtworkIndex:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("text"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOFormattedString initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOFormattedString initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(a1, "setText:", v10);

      }
    }
  }

  return a1;
}

- (GEOTransitClusterArtworkItem)initWithJSON:(id)a3
{
  return (GEOTransitClusterArtworkItem *)-[GEOTransitClusterArtworkItem _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitClusterArtworkItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitClusterArtworkItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_text)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOTransitClusterArtworkItem readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_artworkIndex;
    *((_BYTE *)v5 + 28) |= 1u;
  }
  if (self->_text)
  {
    objc_msgSend(v5, "setText:");
    v4 = v5;
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
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_artworkIndex;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[GEOFormattedString copyWithZone:](self->_text, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *text;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOTransitClusterArtworkItem readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_artworkIndex != *((_DWORD *)v4 + 6))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  text = self->_text;
  if ((unint64_t)text | *((_QWORD *)v4 + 2))
    v6 = -[GEOFormattedString isEqual:](text, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOTransitClusterArtworkItem readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_artworkIndex;
  else
    v3 = 0;
  return -[GEOFormattedString hash](self->_text, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  GEOFormattedString *text;
  uint64_t v6;
  unsigned int *v7;

  v7 = (unsigned int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[7] & 1) != 0)
  {
    self->_artworkIndex = v7[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  text = self->_text;
  v6 = *((_QWORD *)v7 + 2);
  if (text)
  {
    if (v6)
    {
      -[GEOFormattedString mergeFrom:](text, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEOTransitClusterArtworkItem setText:](self, "setText:");
    goto LABEL_8;
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
    -[GEOTransitClusterArtworkItem readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_text, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (int)artworkSourceType
{
  return 3;
}

- (int)artworkUseType
{
  return 0;
}

- (GEOTransitShieldDataSource)shieldDataSource
{
  return 0;
}

- (GEOTransitIconDataSource)iconDataSource
{
  return 0;
}

- (GEOTransitShieldDataSource)iconFallbackShieldDataSource
{
  return 0;
}

- (BOOL)hasRoutingIncidentBadge
{
  return 0;
}

- (NSString)accessibilityText
{
  return 0;
}

@end
