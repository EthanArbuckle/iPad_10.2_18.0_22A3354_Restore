@implementation GEORPProblemStatusResponse

- (int)statusCode
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_statusCode;
  else
    return 0;
}

- (void)setStatusCode:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)statusCodeAsString:(int)a3
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

- (int)StringAsStatusCode:(id)a3
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

- (NSMutableArray)problemStatus
{
  return self->_problemStatus;
}

- (void)setProblemStatus:(id)a3
{
  objc_storeStrong((id *)&self->_problemStatus, a3);
}

- (void)clearProblemStatus
{
  -[NSMutableArray removeAllObjects](self->_problemStatus, "removeAllObjects");
}

- (void)addProblemStatus:(id)a3
{
  id v4;
  NSMutableArray *problemStatus;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  problemStatus = self->_problemStatus;
  v8 = v4;
  if (!problemStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_problemStatus;
    self->_problemStatus = v6;

    v4 = v8;
    problemStatus = self->_problemStatus;
  }
  -[NSMutableArray addObject:](problemStatus, "addObject:", v4);

}

- (unint64_t)problemStatusCount
{
  return -[NSMutableArray count](self->_problemStatus, "count");
}

- (id)problemStatusAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_problemStatus, "objectAtIndex:", a3);
}

+ (Class)problemStatusType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEORPProblemStatusResponse;
  -[GEORPProblemStatusResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemStatusResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemStatusResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 16);
    if (v5 <= 29)
    {
      v6 = CFSTR("STATUS_SUCCESS");
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v6 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v5 != 20)
            goto LABEL_15;
          v6 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        if (a2)
          v7 = CFSTR("statusCode");
        else
          v7 = CFSTR("status_code");
        objc_msgSend(v4, "setObject:forKey:", v6, v7);

        goto LABEL_24;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_24:
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = *(id *)(a1 + 8);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("problemStatus");
    else
      v16 = CFSTR("problem_status");
    objc_msgSend(v4, "setObject:forKey:", v8, v16);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemStatusResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemStatusResponse)initWithDictionary:(id)a3
{
  return (GEORPProblemStatusResponse *)-[GEORPProblemStatusResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEORPProblemStatus *v18;
  uint64_t v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_48;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_48;
  if (a3)
    v6 = CFSTR("statusCode");
  else
    v6 = CFSTR("status_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v9 = 30;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v9 = 40;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v9 = 50;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v9 = 60;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_29:
    objc_msgSend(a1, "setStatusCode:", v9);
  }

  if (a3)
    v10 = CFSTR("problemStatus");
  else
    v10 = CFSTR("problem_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v5;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = [GEORPProblemStatus alloc];
            if ((a3 & 1) != 0)
              v19 = -[GEORPProblemStatus initWithJSON:](v18, "initWithJSON:", v17);
            else
              v19 = -[GEORPProblemStatus initWithDictionary:](v18, "initWithDictionary:", v17);
            v20 = (void *)v19;
            objc_msgSend(a1, "addProblemStatus:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v5 = v22;
  }

LABEL_48:
  return a1;
}

- (GEORPProblemStatusResponse)initWithJSON:(id)a3
{
  return (GEORPProblemStatusResponse *)-[GEORPProblemStatusResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemStatusResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemStatusResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_problemStatus;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_problemStatus;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;

  v8 = a3;
  -[GEORPProblemStatusResponse readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v8[4] = self->_statusCode;
    *((_BYTE *)v8 + 20) |= 1u;
  }
  if (-[GEORPProblemStatusResponse problemStatusCount](self, "problemStatusCount"))
  {
    objc_msgSend(v8, "clearProblemStatus");
    v4 = -[GEORPProblemStatusResponse problemStatusCount](self, "problemStatusCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPProblemStatusResponse problemStatusAtIndex:](self, "problemStatusAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addProblemStatus:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_statusCode;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_problemStatus;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v6, "addProblemStatus:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *problemStatus;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEORPProblemStatusResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  problemStatus = self->_problemStatus;
  if ((unint64_t)problemStatus | *((_QWORD *)v4 + 1))
    v6 = -[NSMutableArray isEqual:](problemStatus, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEORPProblemStatusResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_statusCode;
  else
    v3 = 0;
  return -[NSMutableArray hash](self->_problemStatus, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEORPProblemStatusResponse addProblemStatus:](self, "addProblemStatus:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemStatus, 0);
}

@end
