@implementation GEOBusinessResolutionResponse

- (int)status
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBusinessName
{
  return self->_businessName != 0;
}

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessName:(id)a3
{
  objc_storeStrong((id *)&self->_businessName, a3);
}

- (unint64_t)businessUID
{
  return self->_businessUID;
}

- (void)setBusinessUID:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_businessUID = a3;
}

- (void)setHasBusinessUID:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBusinessUID
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOBusinessResolutionResponse;
  -[GEOBusinessResolutionResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBusinessResolutionResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  int v3;
  __CFString *v4;
  void *v5;
  void *v6;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 2) != 0)
  {
    v3 = *(_DWORD *)(a1 + 24);
    if (v3 <= 29)
    {
      v4 = CFSTR("STATUS_SUCCESS");
      switch(v3)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v4 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v4 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v4 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v3 != 20)
            goto LABEL_15;
          v4 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v3 > 49)
    {
      if (v3 == 50)
      {
        v4 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v3 == 60)
      {
        v4 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v3 == 30)
      {
        v4 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v3 == 40)
      {
        v4 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("status"));

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend((id)a1, "businessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("businessName"));

  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("businessUID"));

  }
  return v2;
}

- (GEOBusinessResolutionResponse)initWithDictionary:(id)a3
{
  return (GEOBusinessResolutionResponse *)-[GEOBusinessResolutionResponse _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (!a1)
    goto LABEL_32;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_32;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v6 = 20;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v6 = 30;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v6 = 40;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v6 = 50;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v6 = 60;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_26:
    objc_msgSend(a1, "setStatus:", v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("businessName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setBusinessName:", v8);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("businessUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBusinessUID:", objc_msgSend(v9, "unsignedLongLongValue"));

LABEL_32:
  return a1;
}

- (GEOBusinessResolutionResponse)initWithJSON:(id)a3
{
  return (GEOBusinessResolutionResponse *)-[GEOBusinessResolutionResponse _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v16;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  BOOL v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  BOOL v30;

  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        goto LABEL_41;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        goto LABEL_41;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        if (v16 != 2)
          goto LABEL_43;
      }
      else if ((_DWORD)v18 == 1)
      {
        if ((v10 & 7) != 0)
          goto LABEL_43;
        v19 = 0;
        while (1)
        {
          v20 = *v4;
          v21 = *(_QWORD *)((char *)a3 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v22 = v21 + 1;
          v23 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v21);
          *(_QWORD *)((char *)a3 + v20) = v22;
          if (v23 < 0)
          {
            v24 = v19++ > 8;
            if (!v24)
              continue;
          }
          goto LABEL_40;
        }
LABEL_37:
        *((_BYTE *)a3 + *v6) = 1;
        goto LABEL_40;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_43:
        v30 = 0;
        goto LABEL_42;
      }
LABEL_40:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        goto LABEL_41;
    }
    if ((v10 & 7) != 0)
      goto LABEL_43;
    v25 = 0;
    while (1)
    {
      v26 = *v4;
      v27 = *(_QWORD *)((char *)a3 + v26);
      if (v27 == -1 || v27 >= *(_QWORD *)((char *)a3 + *v5))
        goto LABEL_37;
      v28 = v27 + 1;
      v29 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v27);
      *(_QWORD *)((char *)a3 + v26) = v28;
      if (v29 < 0)
      {
        v24 = v25++ > 8;
        if (!v24)
          continue;
      }
      goto LABEL_40;
    }
  }
LABEL_41:
  v30 = *((_BYTE *)a3 + *v6) == 0;
LABEL_42:
  PBReaderRecallMark();
  return v30;
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
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  NSString *v31;
  NSString *businessName;
  BOOL v33;

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
        if (v16 || (v11 & 7) == 4)
          break;
        v18 = v11 >> 3;
        if ((v11 >> 3) == 3)
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_flags |= 1u;
          while (1)
          {
            v28 = *v5;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v6])
              break;
            v30 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v29);
            *(_QWORD *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0)
              goto LABEL_44;
            v25 += 7;
            v15 = v26++ >= 9;
            if (v15)
            {
              v27 = 0;
              goto LABEL_46;
            }
          }
          v4[*v7] = 1;
LABEL_44:
          if (v4[*v7])
            v27 = 0;
LABEL_46:
          self->_businessUID = v27;
        }
        else if ((_DWORD)v18 == 2)
        {
          PBReaderReadString();
          v31 = (NSString *)objc_claimAutoreleasedReturnValue();
          businessName = self->_businessName;
          self->_businessName = v31;

        }
        else if ((_DWORD)v18 == 1)
        {
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)&self->_flags |= 2u;
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
              goto LABEL_40;
            v19 += 7;
            v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_42;
            }
          }
          v4[*v7] = 1;
LABEL_40:
          if (v4[*v7])
            LODWORD(v21) = 0;
LABEL_42:
          self->_status = v21;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_49;
        }
      }
      while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
    }
    v33 = v4[*v7] == 0;
  }
  else
  {
LABEL_49:
    v33 = 0;
  }
  objc_sync_exit(v4);

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_businessName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _DWORD *v5;

  v5 = a3;
  -[GEOBusinessResolutionResponse readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5[6] = self->_status;
    *((_BYTE *)v5 + 28) |= 2u;
  }
  if (self->_businessName)
  {
    objc_msgSend(v5, "setBusinessName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[2] = self->_businessUID;
    *((_BYTE *)v4 + 28) |= 1u;
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
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_status;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_businessName, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_businessUID;
    *(_BYTE *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *businessName;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOBusinessResolutionResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 28);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_status != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  businessName = self->_businessName;
  if ((unint64_t)businessName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](businessName, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 28);
  }
  v8 = (v6 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_businessUID != *((_QWORD *)v4 + 2))
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
  unint64_t v5;

  -[GEOBusinessResolutionResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_businessName, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761u * self->_businessUID;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[7] & 2) != 0)
  {
    self->_status = v5[6];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v5 + 1))
  {
    -[GEOBusinessResolutionResponse setBusinessName:](self, "setBusinessName:");
    v4 = v5;
  }
  if ((v4[7] & 1) != 0)
  {
    self->_businessUID = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessName, 0);
}

@end
