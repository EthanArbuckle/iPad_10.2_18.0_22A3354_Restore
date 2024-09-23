@implementation GEOPDWifiFingerprint

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDWifiFingerprint;
  -[GEOPDWifiFingerprint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDWifiFingerprint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDWifiFingerprint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 2) == 0)
      goto LABEL_4;
LABEL_30:
    v16 = *(int *)(a1 + 20);
    if (v16 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C0C440[v16];
    }
    if (a2)
      v18 = CFSTR("labelType");
    else
      v18 = CFSTR("label_type");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    if ((*(_BYTE *)(a1 + 28) & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v14 = *(_DWORD *)(a1 + 24);
  if (v14 > 29)
  {
    if (v14 > 49)
    {
      if (v14 == 50)
      {
        v15 = CFSTR("STATUS_DEDUPED");
        goto LABEL_29;
      }
      if (v14 == 60)
      {
        v15 = CFSTR("VERSION_MISMATCH");
        goto LABEL_29;
      }
    }
    else
    {
      if (v14 == 30)
      {
        v15 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_29;
      }
      if (v14 == 40)
      {
        v15 = CFSTR("FAILED_NOT_AUTHORIZED");
        goto LABEL_29;
      }
    }
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v15 = CFSTR("STATUS_SUCCESS");
  switch(v14)
  {
    case 0:
      break;
    case 1:
      v15 = CFSTR("STATUS_FAILED");
      break;
    case 2:
      v15 = CFSTR("STATUS_INCOMPLETE");
      break;
    case 3:
    case 4:
      goto LABEL_24;
    case 5:
      v15 = CFSTR("INVALID_REQUEST");
      break;
    default:
      if (v14 != 20)
        goto LABEL_24;
      v15 = CFSTR("FAILED_NO_RESULT");
      break;
  }
LABEL_29:
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("status"));

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) != 0)
    goto LABEL_30;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("confidence"));

  }
LABEL_6:
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
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __50__GEOPDWifiFingerprint__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v11 = v10;
      v20 = v11;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v19);
      v12 = v11;

      v9 = v12;
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDWifiFingerprint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOPDWifiFingerprint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDWifiFingerprintReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v4 + 20) = self->_labelType;
    *(_BYTE *)(v4 + 28) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_status;
  *(_BYTE *)(v4 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 16) = self->_confidence;
    *(_BYTE *)(v4 + 28) |= 1u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_status != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_labelType != *((_DWORD *)v4 + 5))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_confidence != *((_DWORD *)v4 + 4))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_status;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_labelType;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_confidence;
  return v3 ^ v2 ^ v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
