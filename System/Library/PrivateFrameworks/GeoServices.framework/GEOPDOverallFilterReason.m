@implementation GEOPDOverallFilterReason

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDOverallFilterReason;
  -[GEOPDOverallFilterReason description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDOverallFilterReason dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDOverallFilterReason _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  unsigned int v6;
  __CFString *v7;
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
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) != 0)
  {
    v6 = *(_DWORD *)(a1 + 20) - 15400;
    if (v6 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C0DCD8[v6];
    }
    if (a2)
      v8 = CFSTR("reasonType");
    else
      v8 = CFSTR("reason_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("proxyErrorHttpStatus");
    else
      v10 = CFSTR("proxy_error_http_status");
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
      v18[2] = __54__GEOPDOverallFilterReason__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDOverallFilterReason _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDOverallFilterReason__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  char *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  BOOL v26;
  int *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  PBUnknownFields *v34;
  PBUnknownFields *unknownFields;
  BOOL v36;

  v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E0D82BF0];
    v6 = (int *)MEMORY[0x1E0D82BD8];
    v7 = (int *)MEMORY[0x1E0D82BC8];
    if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
    {
      v8 = (int *)MEMORY[0x1E0D82BB8];
      while (1)
      {
        if (v4[*v7])
          goto LABEL_49;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = *v5;
          v13 = *(_QWORD *)&v4[v12];
          v14 = v13 + 1;
          if (v13 == -1 || v14 > *(_QWORD *)&v4[*v6])
            break;
          v15 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
          *(_QWORD *)&v4[v12] = v14;
          v11 |= (unint64_t)(v15 & 0x7F) << v9;
          if ((v15 & 0x80) == 0)
            goto LABEL_13;
          v9 += 7;
          if (v10++ >= 9)
          {
            v11 = 0;
            v17 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        v17 = v4[*v7];
        if (v4[*v7])
          v11 = 0;
LABEL_15:
        if (v17 || (v11 & 7) == 4)
          goto LABEL_49;
        if ((v11 >> 3) == 2)
          break;
        if ((v11 >> 3) == 1)
        {
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)&self->_flags |= 2u;
          while (1)
          {
            v22 = *v5;
            v23 = *(_QWORD *)&v4[v22];
            v24 = v23 + 1;
            if (v23 == -1 || v24 > *(_QWORD *)&v4[*v6])
            {
              v27 = &OBJC_IVAR___GEOPDOverallFilterReason__reasonType;
              goto LABEL_41;
            }
            v25 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v23);
            *(_QWORD *)&v4[v22] = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0)
              break;
            v19 += 7;
            v26 = v20++ > 8;
            if (v26)
            {
              LODWORD(v21) = 0;
              v27 = &OBJC_IVAR___GEOPDOverallFilterReason__reasonType;
              goto LABEL_44;
            }
          }
          v27 = &OBJC_IVAR___GEOPDOverallFilterReason__reasonType;
LABEL_42:
          if (v4[*v7])
            LODWORD(v21) = 0;
LABEL_44:
          *(_DWORD *)((char *)&self->super.super.isa + *v27) = v21;
          goto LABEL_45;
        }
        if (!self->_unknownFields)
        {
          v34 = (PBUnknownFields *)objc_alloc_init(MEMORY[0x1E0D82BB0]);
          unknownFields = self->_unknownFields;
          self->_unknownFields = v34;

        }
        if ((PBUnknownFieldAdd() & 1) == 0)
          goto LABEL_50;
LABEL_45:
        if (*(_QWORD *)&v4[*v5] >= *(_QWORD *)&v4[*v6])
          goto LABEL_49;
      }
      v28 = 0;
      v29 = 0;
      v21 = 0;
      *(_BYTE *)&self->_flags |= 1u;
      while (1)
      {
        v30 = *v5;
        v31 = *(_QWORD *)&v4[v30];
        v32 = v31 + 1;
        if (v31 == -1 || v32 > *(_QWORD *)&v4[*v6])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v31);
        *(_QWORD *)&v4[v30] = v32;
        v21 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
        {
          v27 = &OBJC_IVAR___GEOPDOverallFilterReason__proxyErrorHttpStatus;
          goto LABEL_42;
        }
        v28 += 7;
        v26 = v29++ > 8;
        if (v26)
        {
          LODWORD(v21) = 0;
          v27 = &OBJC_IVAR___GEOPDOverallFilterReason__proxyErrorHttpStatus;
          goto LABEL_44;
        }
      }
      v27 = &OBJC_IVAR___GEOPDOverallFilterReason__proxyErrorHttpStatus;
LABEL_41:
      v4[*v7] = 1;
      goto LABEL_42;
    }
LABEL_49:
    v36 = v4[*v7] == 0;
  }
  else
  {
LABEL_50:
    v36 = 0;
  }
  objc_sync_exit(v4);

  return v36;
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteUint32Field();
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
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_reasonType;
    *(_BYTE *)(v4 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_proxyErrorHttpStatus;
    *(_BYTE *)(v4 + 24) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_reasonType != *((_DWORD *)v4 + 5))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_proxyErrorHttpStatus != *((_DWORD *)v4 + 4))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v2 = 2654435761 * self->_reasonType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_proxyErrorHttpStatus;
  return v3 ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
