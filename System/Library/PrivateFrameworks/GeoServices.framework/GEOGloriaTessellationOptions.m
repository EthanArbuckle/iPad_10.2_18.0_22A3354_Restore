@implementation GEOGloriaTessellationOptions

- (uint64_t)zoomLevelsAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 16);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 8) + 4 * a2);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOGloriaTessellationOptions;
  -[GEOGloriaTessellationOptions dealloc](&v3, sel_dealloc);
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
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  BOOL v37;

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
          if (v13 == -1 || v13 >= *(_QWORD *)&v4[*v6])
            break;
          v14 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
          *(_QWORD *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0)
            goto LABEL_13;
          v9 += 7;
          v15 = v10++ >= 9;
          if (v15)
          {
            v11 = 0;
            v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        v16 = v4[*v7];
        if (v4[*v7])
          v11 = 0;
LABEL_15:
        v17 = v11 & 7;
        if (v16 || v17 == 4)
          break;
        if ((v11 >> 3) == 2)
        {
          if (v17 == 2)
          {
            if (!PBReaderPlaceMark())
              goto LABEL_59;
            while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6] && !v4[*v7])
            {
              v25 = 0;
              v26 = 0;
              v27 = 0;
              while (1)
              {
                v28 = *v5;
                v29 = *(_QWORD *)&v4[v28];
                if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v6])
                  break;
                v30 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v29);
                *(_QWORD *)&v4[v28] = v29 + 1;
                v27 |= (unint64_t)(v30 & 0x7F) << v25;
                if (v30 < 0)
                {
                  v25 += 7;
                  v15 = v26++ >= 9;
                  if (!v15)
                    continue;
                }
                goto LABEL_40;
              }
              v4[*v7] = 1;
LABEL_40:
              PBRepeatedUInt32Add();
            }
            PBReaderRecallMark();
          }
          else
          {
            v31 = 0;
            v32 = 0;
            v33 = 0;
            while (1)
            {
              v34 = *v5;
              v35 = *(_QWORD *)&v4[v34];
              if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v6])
                break;
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v35);
              *(_QWORD *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_56;
            }
            v4[*v7] = 1;
LABEL_56:
            PBRepeatedUInt32Add();
          }
        }
        else if ((v11 >> 3) == 1)
        {
          v19 = 0;
          v20 = 0;
          v21 = 0;
          while (1)
          {
            v22 = *v5;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v6])
              break;
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_44;
            v19 += 7;
            v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_46;
            }
          }
          v4[*v7] = 1;
LABEL_44:
          if (v4[*v7])
            LODWORD(v21) = 0;
LABEL_46:
          self->_type = v21;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_59;
        }
      }
      while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
    }
    v37 = v4[*v7] == 0;
  }
  else
  {
LABEL_59:
    v37 = 0;
  }
  objc_sync_exit(v4);

  return v37;
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
  v8.super_class = (Class)GEOGloriaTessellationOptions;
  -[GEOGloriaTessellationOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGloriaTessellationOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(int *)(a1 + 32);
    if (v3 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (void *)*((_QWORD *)&off_1E1C129C0 + v3);
    }
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("type"));

    if (*(_QWORD *)(a1 + 16))
    {
      PBRepeatedUInt32NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("zoomLevels"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)writeTo:(id)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_zoomLevels;
  unint64_t v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteInt32Field();
  p_zoomLevels = &self->_zoomLevels;
  if (p_zoomLevels->count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_zoomLevels->count);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = self->_type;
  PBRepeatedUInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_type == v4[8])
    IsEqual = PBRepeatedUInt32IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_type;
  return v2 ^ PBRepeatedUInt32Hash();
}

@end
