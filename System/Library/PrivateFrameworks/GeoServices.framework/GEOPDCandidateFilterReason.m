@implementation GEOPDCandidateFilterReason

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCandidateFilterReason;
  -[GEOPDCandidateFilterReason description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCandidateFilterReason dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCandidateFilterReason _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  char v6;
  unsigned int v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 32);
  if ((v6 & 1) != 0)
  {
    v7 = *(_DWORD *)(a1 + 24) - 15300;
    if (v7 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C0DCA8[v7];
    }
    if (a2)
      v9 = CFSTR("reasonType");
    else
      v9 = CFSTR("reason_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v6 = *(_BYTE *)(a1 + 32);
  }
  if ((v6 & 2) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 28);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("viewportExpansionFactor");
    else
      v11 = CFSTR("viewport_expansion_factor");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(id *)(a1 + 16);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("sortMetadata");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("sort_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = *(void **)(a1 + 8);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __56__GEOPDCandidateFilterReason__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCandidateFilterReason _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDCandidateFilterReason__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  BOOL v16;
  int v17;
  unint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  GEOPDResultRefinementMetadata *v27;
  GEOPDResultRefinementMetadata *sortMetadata;
  uint64_t v29;
  unint64_t v30;
  float v31;
  PBUnknownFields *v32;
  PBUnknownFields *unknownFields;
  BOOL v34;

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
      do
      {
        if (v4[*v7])
          break;
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
          v16 = v10++ >= 9;
          if (v16)
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
          break;
        v19 = v11 >> 3;
        if ((v11 >> 3) == 3)
        {
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_48;
          v27 = objc_alloc_init(GEOPDResultRefinementMetadata);
          if (!GEOPDResultRefinementMetadataReadAllFrom((uint64_t)v27, v4, 0))
          {

            goto LABEL_48;
          }
          PBReaderRecallMark();
          sortMetadata = self->_sortMetadata;
          self->_sortMetadata = v27;

        }
        else if ((_DWORD)v19 == 2)
        {
          *(_BYTE *)&self->_flags |= 2u;
          v29 = *v5;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(_QWORD *)&v4[*v6])
          {
            v31 = *(float *)(*(_QWORD *)&v4[*v8] + v30);
            *(_QWORD *)&v4[v29] = v30 + 4;
          }
          else
          {
            v4[*v7] = 1;
            v31 = 0.0;
          }
          self->_viewportExpansionFactor = v31;
        }
        else if ((_DWORD)v19 == 1)
        {
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)&self->_flags |= 1u;
          while (1)
          {
            v23 = *v5;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v6])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_40;
            v20 += 7;
            v16 = v21++ >= 9;
            if (v16)
            {
              LODWORD(v22) = 0;
              goto LABEL_42;
            }
          }
          v4[*v7] = 1;
LABEL_40:
          if (v4[*v7])
            LODWORD(v22) = 0;
LABEL_42:
          self->_reasonType = v22;
        }
        else
        {
          if (!self->_unknownFields)
          {
            v32 = (PBUnknownFields *)objc_alloc_init(MEMORY[0x1E0D82BB0]);
            unknownFields = self->_unknownFields;
            self->_unknownFields = v32;

          }
          if (!PBUnknownFieldAdd())
            goto LABEL_48;
        }
      }
      while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
    }
    v34 = v4[*v7] == 0;
  }
  else
  {
LABEL_48:
    v34 = 0;
  }
  objc_sync_exit(v4);

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
  if (self->_sortMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_reasonType;
    *(_BYTE *)(v5 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 28) = self->_viewportExpansionFactor;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v8 = -[GEOPDResultRefinementMetadata copyWithZone:](self->_sortMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDResultRefinementMetadata *sortMetadata;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_reasonType != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_viewportExpansionFactor != *((float *)v4 + 7))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  sortMetadata = self->_sortMetadata;
  if ((unint64_t)sortMetadata | *((_QWORD *)v4 + 2))
    v6 = -[GEOPDResultRefinementMetadata isEqual:](sortMetadata, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  float viewportExpansionFactor;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_reasonType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3 ^ -[GEOPDResultRefinementMetadata hash](self->_sortMetadata, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_3:
  viewportExpansionFactor = self->_viewportExpansionFactor;
  v5 = viewportExpansionFactor;
  if (viewportExpansionFactor < 0.0)
    v5 = -viewportExpansionFactor;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ -[GEOPDResultRefinementMetadata hash](self->_sortMetadata, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
