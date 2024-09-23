@implementation GEORPProblemResponse

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

- (BOOL)hasProblemId
{
  return self->_problemId != 0;
}

- (NSString)problemId
{
  return self->_problemId;
}

- (void)setProblemId:(id)a3
{
  objc_storeStrong((id *)&self->_problemId, a3);
}

- (BOOL)isNotificationSupported
{
  return self->_isNotificationSupported;
}

- (void)setIsNotificationSupported:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isNotificationSupported = a3;
}

- (void)setHasIsNotificationSupported:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsNotificationSupported
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
  v8.super_class = (Class)GEORPProblemResponse;
  -[GEORPProblemResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
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
  objc_msgSend((id)a1, "problemId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("problemId");
    else
      v9 = CFSTR("problem_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isNotificationSupported");
    else
      v11 = CFSTR("is_notification_supported");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemResponse)initWithDictionary:(id)a3
{
  return (GEORPProblemResponse *)-[GEORPProblemResponse _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_41;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_41;
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
    v10 = CFSTR("problemId");
  else
    v10 = CFSTR("problem_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setProblemId:", v12);

  }
  if (a3)
    v13 = CFSTR("isNotificationSupported");
  else
    v13 = CFSTR("is_notification_supported");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsNotificationSupported:", objc_msgSend(v14, "BOOLValue"));

LABEL_41:
  return a1;
}

- (GEORPProblemResponse)initWithJSON:(id)a3
{
  return (GEORPProblemResponse *)-[GEORPProblemResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_problemId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v5 = a3;
  -[GEORPProblemResponse readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_statusCode;
    v5[24] |= 1u;
  }
  if (self->_problemId)
  {
    objc_msgSend(v5, "setProblemId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4[20] = self->_isNotificationSupported;
    v4[24] |= 2u;
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
    *(_DWORD *)(v5 + 16) = self->_statusCode;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_problemId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v6 + 20) = self->_isNotificationSupported;
    *(_BYTE *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *problemId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEORPProblemResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 24);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 4))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_12;
  }
  problemId = self->_problemId;
  if ((unint64_t)problemId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](problemId, "isEqual:"))
      goto LABEL_12;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 24);
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_isNotificationSupported)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_12;
      }
      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_12;
      }
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  -[GEORPProblemResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_statusCode;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_problemId, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_isNotificationSupported;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = (BOOL *)v5;
  if ((v5[6] & 1) != 0)
  {
    self->_statusCode = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 1))
  {
    -[GEORPProblemResponse setProblemId:](self, "setProblemId:");
    v4 = (BOOL *)v5;
  }
  if ((v4[24] & 2) != 0)
  {
    self->_isNotificationSupported = v4[20];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemId, 0);
}

@end
