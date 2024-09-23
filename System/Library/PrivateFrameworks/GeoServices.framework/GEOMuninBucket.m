@implementation GEOMuninBucket

- (unsigned)bucketID
{
  return self->_bucketID;
}

- (void)setBucketID:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_bucketID = a3;
}

- (void)setHasBucketID:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBucketID
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasBucketURL
{
  return self->_bucketURL != 0;
}

- (NSString)bucketURL
{
  return self->_bucketURL;
}

- (void)setBucketURL:(id)a3
{
  objc_storeStrong((id *)&self->_bucketURL, a3);
}

- (unsigned)lodLevel
{
  return self->_lodLevel;
}

- (void)setLodLevel:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_lodLevel = a3;
}

- (void)setHasLodLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLodLevel
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOMuninBucket;
  -[GEOMuninBucket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMuninBucket dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMuninBucket _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("bucketID"));

  }
  objc_msgSend((id)a1, "bucketURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("bucketURL"));

  if ((*(_BYTE *)(a1 + 32) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("lodLevel"));

  }
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__GEOMuninBucket__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMuninBucket _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOMuninBucket__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMuninBucket)initWithDictionary:(id)a3
{
  return (GEOMuninBucket *)-[GEOMuninBucket _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bucketID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBucketID:", objc_msgSend(v4, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bucketURL"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (void *)objc_msgSend(v5, "copy");
        objc_msgSend(a1, "setBucketURL:", v6);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lodLevel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLodLevel:", objc_msgSend(v7, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOMuninBucket)initWithJSON:(id)a3
{
  return (GEOMuninBucket *)-[GEOMuninBucket _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMuninBucketIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMuninBucketReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_bucketURL)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v5 = a3;
  -[GEOMuninBucket readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[6] = self->_bucketID;
    *((_BYTE *)v5 + 32) |= 1u;
  }
  if (self->_bucketURL)
  {
    objc_msgSend(v5, "setBucketURL:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4[7] = self->_lodLevel;
    *((_BYTE *)v4 + 32) |= 2u;
  }

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
    *(_DWORD *)(v5 + 24) = self->_bucketID;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_bucketURL, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_lodLevel;
    *(_BYTE *)(v6 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *bucketURL;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOMuninBucket readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 32);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_bucketID != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_14;
  }
  bucketURL = self->_bucketURL;
  if ((unint64_t)bucketURL | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bucketURL, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 32);
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_lodLevel != *((_DWORD *)v4 + 7))
      goto LABEL_14;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  -[GEOMuninBucket readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_bucketID;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bucketURL, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_lodLevel;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v5 = (unsigned int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[8] & 1) != 0)
  {
    self->_bucketID = v5[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[GEOMuninBucket setBucketURL:](self, "setBucketURL:");
    v4 = v5;
  }
  if ((v4[8] & 2) != 0)
  {
    self->_lodLevel = v4[7];
    *(_BYTE *)&self->_flags |= 2u;
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
    -[GEOMuninBucket readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
