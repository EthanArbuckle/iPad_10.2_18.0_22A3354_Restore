@implementation GEOPDPOIClaim

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimUrl, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_claimUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

+ (id)poiClaimForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__GEOPDPOIClaim_PlaceDataExtras__poiClaimForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 96, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__GEOPDPOIClaim_PlaceDataExtras__poiClaimForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue poiClaim](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (id)claimUrl
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
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
  v8.super_class = (Class)GEOPDPOIClaim;
  -[GEOPDPOIClaim description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPOIClaim dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPOIClaim _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
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
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("isClaimed");
    else
      v7 = CFSTR("is_claimed");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 28);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isClaimable");
    else
      v9 = CFSTR("is_claimable");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (*(_QWORD *)(a1 + 16))
    objc_msgSend(v4, "setObject:forKey:");
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
      v17[2] = __43__GEOPDPOIClaim__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDPOIClaim _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOPDPOIClaim__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPOIClaimReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[25] = self->_isClaimed;
    v5[28] |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[24] = self->_isClaimable;
    v5[28] |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_claimUrl, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v8;

  objc_storeStrong((id *)v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSString *claimUrl;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_14;
    if (self->_isClaimed)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_20;
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 28) & 1) == 0)
    goto LABEL_14;
  if (!self->_isClaimable)
  {
    if (!*((_BYTE *)v4 + 24))
      goto LABEL_20;
    goto LABEL_14;
  }
  if (!*((_BYTE *)v4 + 24))
    goto LABEL_14;
LABEL_20:
  claimUrl = self->_claimUrl;
  if ((unint64_t)claimUrl | *((_QWORD *)v4 + 2))
    v5 = -[NSString isEqual:](claimUrl, "isEqual:");
  else
    v5 = 1;
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v2 = 2654435761 * self->_isClaimed;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSString hash](self->_claimUrl, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_isClaimable;
  return v3 ^ v2 ^ -[NSString hash](self->_claimUrl, "hash");
}

@end
