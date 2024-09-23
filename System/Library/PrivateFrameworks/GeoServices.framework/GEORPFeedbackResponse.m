@implementation GEORPFeedbackResponse

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

- (int)feedbackRequestType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_feedbackRequestType;
  else
    return 0;
}

- (void)setFeedbackRequestType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_feedbackRequestType = a3;
}

- (void)setHasFeedbackRequestType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFeedbackRequestType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)feedbackRequestTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C03B00[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_SUBMISSION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_ID_LOOKUP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_QUERY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LOG_EVENT")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasFeedbackResult
{
  return self->_feedbackResult != 0;
}

- (GEORPFeedbackResult)feedbackResult
{
  return self->_feedbackResult;
}

- (void)setFeedbackResult:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackResult, a3);
}

- (BOOL)discardLogs
{
  return self->_discardLogs;
}

- (void)setDiscardLogs:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_discardLogs = a3;
}

- (void)setHasDiscardLogs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasDiscardLogs
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)attestationNotFound
{
  return self->_attestationNotFound;
}

- (void)setAttestationNotFound:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_attestationNotFound = a3;
}

- (void)setHasAttestationNotFound:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAttestationNotFound
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEORPFeedbackResponse;
  -[GEORPFeedbackResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  char v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 2) != 0)
  {
    v6 = *(_DWORD *)(a1 + 28);
    if (v6 <= 29)
    {
      v7 = CFSTR("STATUS_SUCCESS");
      switch(v6)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v7 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v7 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v7 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v6 != 20)
            goto LABEL_15;
          v7 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v6 > 49)
    {
      if (v6 == 50)
      {
        v7 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v6 == 60)
      {
        v7 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v6 == 30)
      {
        v7 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v6 == 40)
      {
        v7 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("status"));

        v5 = *(_BYTE *)(a1 + 36);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 28));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ((v5 & 1) != 0)
  {
    v8 = *(int *)(a1 + 24);
    if (v8 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C03B00[v8];
    }
    if (a2)
      v10 = CFSTR("feedbackRequestType");
    else
      v10 = CFSTR("feedback_request_type");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "feedbackResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("feedbackResult");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("feedback_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(_BYTE *)(a1 + 36);
  if ((v15 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("discardLogs");
    else
      v17 = CFSTR("discard_logs");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v15 = *(_BYTE *)(a1 + 36);
  }
  if ((v15 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("attestationNotFound");
    else
      v19 = CFSTR("attestation_not_found");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __51__GEORPFeedbackResponse__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORPFeedbackResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackResponse)initWithDictionary:(id)a3
{
  return (GEORPFeedbackResponse *)-[GEORPFeedbackResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  GEORPFeedbackResult *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;

  v5 = a2;
  if (!a1)
    goto LABEL_71;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_71;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v8 = 40;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v8 = 50;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v8 = 60;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_27;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setStatus:", v8);
LABEL_27:

  if (a3)
    v9 = CFSTR("feedbackRequestType");
  else
    v9 = CFSTR("feedback_request_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_SUBMISSION")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_ID_LOOKUP")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_QUERY")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG")) & 1) != 0)
    {
      v12 = 5;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION")) & 1) != 0)
    {
      v12 = 6;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("FEEDBACK_REQUEST_TYPE_LOG_EVENT")))
    {
      v12 = 7;
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "intValue");
LABEL_51:
    objc_msgSend(a1, "setFeedbackRequestType:", v12);
  }

  if (a3)
    v13 = CFSTR("feedbackResult");
  else
    v13 = CFSTR("feedback_result");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEORPFeedbackResult alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEORPFeedbackResult initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEORPFeedbackResult initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setFeedbackResult:", v16);

  }
  if (a3)
    v18 = CFSTR("discardLogs");
  else
    v18 = CFSTR("discard_logs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDiscardLogs:", objc_msgSend(v19, "BOOLValue"));

  if (a3)
    v20 = CFSTR("attestationNotFound");
  else
    v20 = CFSTR("attestation_not_found");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAttestationNotFound:", objc_msgSend(v21, "BOOLValue"));

LABEL_71:
  return a1;
}

- (GEORPFeedbackResponse)initWithJSON:(id)a3
{
  return (GEORPFeedbackResponse *)-[GEORPFeedbackResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  char flags;
  char v5;
  id v6;

  v6 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedbackResult)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_flags;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_flags;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEORPFeedbackResult hasGreenTeaWithValue:](self->_feedbackResult, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char flags;
  char v6;
  _BYTE *v7;

  v7 = a3;
  -[GEORPFeedbackResponse readAll:](self, "readAll:", 0);
  v4 = v7;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v7 + 7) = self->_status;
    v7[36] |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v7 + 6) = self->_feedbackRequestType;
    v7[36] |= 1u;
  }
  if (self->_feedbackResult)
  {
    objc_msgSend(v7, "setFeedbackResult:");
    v4 = v7;
  }
  v6 = (char)self->_flags;
  if ((v6 & 8) != 0)
  {
    v4[33] = self->_discardLogs;
    v4[36] |= 8u;
    v6 = (char)self->_flags;
  }
  if ((v6 & 4) != 0)
  {
    v4[32] = self->_attestationNotFound;
    v4[36] |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_status;
    *(_BYTE *)(v5 + 36) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_feedbackRequestType;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v8 = -[GEORPFeedbackResult copyWithZone:](self->_feedbackResult, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = (char)self->_flags;
  if ((v10 & 8) != 0)
  {
    *(_BYTE *)(v6 + 33) = self->_discardLogs;
    *(_BYTE *)(v6 + 36) |= 8u;
    v10 = (char)self->_flags;
  }
  if ((v10 & 4) != 0)
  {
    *(_BYTE *)(v6 + 32) = self->_attestationNotFound;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEORPFeedbackResult *feedbackResult;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEORPFeedbackResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 36);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_status != *((_DWORD *)v4 + 7))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_feedbackRequestType != *((_DWORD *)v4 + 6))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_25;
  }
  feedbackResult = self->_feedbackResult;
  if ((unint64_t)feedbackResult | *((_QWORD *)v4 + 2))
  {
    if (!-[GEORPFeedbackResult isEqual:](feedbackResult, "isEqual:"))
      goto LABEL_25;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_25;
    if (self->_discardLogs)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_25;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_25;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_25;
  }
  v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_attestationNotFound)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_25;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_25;
      }
      v8 = 1;
      goto LABEL_26;
    }
LABEL_25:
    v8 = 0;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEORPFeedbackResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_status;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_feedbackRequestType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[GEORPFeedbackResult hash](self->_feedbackResult, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v6 = 2654435761 * self->_discardLogs;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = 2654435761 * self->_attestationNotFound;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  char v5;
  GEORPFeedbackResult *feedbackResult;
  uint64_t v7;
  BOOL v8;
  int *v9;

  v9 = (int *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = (BOOL *)v9;
  v5 = *((_BYTE *)v9 + 36);
  if ((v5 & 2) != 0)
  {
    self->_status = v9[7];
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v9 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_feedbackRequestType = v9[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  feedbackResult = self->_feedbackResult;
  v7 = *((_QWORD *)v9 + 2);
  if (feedbackResult)
  {
    if (!v7)
      goto LABEL_11;
    -[GEORPFeedbackResult mergeFrom:](feedbackResult, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[GEORPFeedbackResponse setFeedbackResult:](self, "setFeedbackResult:");
  }
  v4 = (BOOL *)v9;
LABEL_11:
  v8 = v4[36];
  if ((v8 & 8) != 0)
  {
    self->_discardLogs = v4[33];
    *(_BYTE *)&self->_flags |= 8u;
    v8 = v4[36];
  }
  if ((v8 & 4) != 0)
  {
    self->_attestationNotFound = v4[32];
    *(_BYTE *)&self->_flags |= 4u;
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
    -[GEORPFeedbackResponse readAll:](self, "readAll:", 0);
    -[GEORPFeedbackResult clearUnknownFields:](self->_feedbackResult, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
