@implementation GEORPRapResponse

- (GEORPRapResponse)init
{
  GEORPRapResponse *v2;
  GEORPRapResponse *v3;
  GEORPRapResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPRapResponse;
  v2 = -[GEORPRapResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPRapResponse)initWithData:(id)a3
{
  GEORPRapResponse *v3;
  GEORPRapResponse *v4;
  GEORPRapResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPRapResponse;
  v3 = -[GEORPRapResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readResponseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPRapResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseId_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasResponseId
{
  -[GEORPRapResponse _readResponseId]((uint64_t)self);
  return self->_responseId != 0;
}

- (NSString)responseId
{
  -[GEORPRapResponse _readResponseId]((uint64_t)self);
  return self->_responseId;
}

- (void)setResponseId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (int)rapStateIcon
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_rapStateIcon;
  else
    return 0;
}

- (void)setRapStateIcon:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_rapStateIcon = a3;
}

- (void)setHasRapStateIcon:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasRapStateIcon
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)rapStateIconAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C214F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRapStateIcon:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_UNRESOLVED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_RESOLVED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_REJECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_NEEDS_ADDITIONAL_INFO")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_RESOLVED_NOT_LIVE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readNotification
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPRapResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNotification_tags_783);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasNotification
{
  -[GEORPRapResponse _readNotification]((uint64_t)self);
  return self->_notification != 0;
}

- (GEORPRapNotification)notification
{
  -[GEORPRapResponse _readNotification]((uint64_t)self);
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void)_readDisplayDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPRapResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDisplayDetails
{
  -[GEORPRapResponse _readDisplayDetails]((uint64_t)self);
  return self->_displayDetails != 0;
}

- (GEORPDisplayDetails)displayDetails
{
  -[GEORPRapResponse _readDisplayDetails]((uint64_t)self);
  return self->_displayDetails;
}

- (void)setDisplayDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_displayDetails, a3);
}

- (void)_readUserFormDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPRapResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserFormDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasUserFormDetails
{
  -[GEORPRapResponse _readUserFormDetails]((uint64_t)self);
  return self->_userFormDetails != 0;
}

- (GEORPUserFormDetails)userFormDetails
{
  -[GEORPRapResponse _readUserFormDetails]((uint64_t)self);
  return self->_userFormDetails;
}

- (void)setUserFormDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_userFormDetails, a3);
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
  v8.super_class = (Class)GEORPRapResponse;
  -[GEORPRapResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPRapResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPRapResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "responseId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("responseId");
    else
      v6 = CFSTR("response_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v7 = *(int *)(a1 + 68);
    if (v7 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C214F8[v7];
    }
    if (a2)
      v9 = CFSTR("rapStateIcon");
    else
      v9 = CFSTR("rap_state_icon");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "jsonRepresentation");
    else
      objc_msgSend(v10, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("notification"));

  }
  objc_msgSend((id)a1, "displayDetails");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("displayDetails");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("display_details");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "userFormDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("userFormDetails");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("user_form_details");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __46__GEORPRapResponse__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPRapResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEORPRapResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPRapResponse)initWithDictionary:(id)a3
{
  return (GEORPRapResponse *)-[GEORPRapResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  GEORPRapNotification *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEORPDisplayDetails *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEORPUserFormDetails *v24;
  uint64_t v25;
  void *v26;

  v5 = a2;
  if (!a1)
    goto LABEL_51;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_51;
  if (a3)
    v6 = CFSTR("responseId");
  else
    v6 = CFSTR("response_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setResponseId:", v8);

  }
  if (a3)
    v9 = CFSTR("rapStateIcon");
  else
    v9 = CFSTR("rap_state_icon");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_UNRESOLVED")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_RESOLVED")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_REJECTED")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_NEEDS_ADDITIONAL_INFO")) & 1) != 0)
    {
      v12 = 4;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RAP_RESPONSE_RAP_STATE_ICON_RESOLVED_NOT_LIVE")))
    {
      v12 = 5;
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "intValue");
LABEL_28:
    objc_msgSend(a1, "setRapStateIcon:", v12);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notification"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEORPRapNotification alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEORPRapNotification initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEORPRapNotification initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setNotification:", v15);

  }
  if (a3)
    v17 = CFSTR("displayDetails");
  else
    v17 = CFSTR("display_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEORPDisplayDetails alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEORPDisplayDetails initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEORPDisplayDetails initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setDisplayDetails:", v20);

  }
  if (a3)
    v22 = CFSTR("userFormDetails");
  else
    v22 = CFSTR("user_form_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEORPUserFormDetails alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEORPUserFormDetails initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEORPUserFormDetails initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setUserFormDetails:", v25);

  }
LABEL_51:

  return a1;
}

- (GEORPRapResponse)initWithJSON:(id)a3
{
  return (GEORPRapResponse *)-[GEORPRapResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_803;
    else
      v8 = (int *)&readAll__nonRecursiveTag_804;
    GEORPRapResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPRapNotification readAll:](self->_notification, "readAll:", 1);
    -[GEORPDisplayDetails readAll:](self->_displayDetails, "readAll:", 1);
    -[GEORPUserFormDetails readAll:](self->_userFormDetails, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPRapResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPRapResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPRapResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPRapResponse readAll:](self, "readAll:", 0);
    if (self->_responseId)
      PBDataWriterWriteStringField();
    v5 = v8;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_notification)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_displayDetails)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_userFormDetails)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPRapResponse _readDisplayDetails]((uint64_t)self);
  return -[GEORPDisplayDetails hasGreenTeaWithValue:](self->_displayDetails, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPRapResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_responseId)
    objc_msgSend(v5, "setResponseId:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 17) = self->_rapStateIcon;
    *((_BYTE *)v5 + 72) |= 1u;
  }
  if (self->_notification)
  {
    objc_msgSend(v5, "setNotification:");
    v4 = v5;
  }
  if (self->_displayDetails)
  {
    objc_msgSend(v5, "setDisplayDetails:");
    v4 = v5;
  }
  if (self->_userFormDetails)
  {
    objc_msgSend(v5, "setUserFormDetails:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPRapResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPRapResponse readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_responseId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_rapStateIcon;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v11 = -[GEORPRapNotification copyWithZone:](self->_notification, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEORPDisplayDetails copyWithZone:](self->_displayDetails, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEORPUserFormDetails copyWithZone:](self->_userFormDetails, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *responseId;
  GEORPRapNotification *notification;
  GEORPDisplayDetails *displayDetails;
  GEORPUserFormDetails *userFormDetails;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEORPRapResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  responseId = self->_responseId;
  if ((unint64_t)responseId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](responseId, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_rapStateIcon != *((_DWORD *)v4 + 17))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  notification = self->_notification;
  if ((unint64_t)notification | *((_QWORD *)v4 + 4)
    && !-[GEORPRapNotification isEqual:](notification, "isEqual:"))
  {
    goto LABEL_15;
  }
  displayDetails = self->_displayDetails;
  if ((unint64_t)displayDetails | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPDisplayDetails isEqual:](displayDetails, "isEqual:"))
      goto LABEL_15;
  }
  userFormDetails = self->_userFormDetails;
  if ((unint64_t)userFormDetails | *((_QWORD *)v4 + 6))
    v9 = -[GEORPUserFormDetails isEqual:](userFormDetails, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  -[GEORPRapResponse readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_responseId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_rapStateIcon;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[GEORPRapNotification hash](self->_notification, "hash");
  v7 = v5 ^ v6 ^ -[GEORPDisplayDetails hash](self->_displayDetails, "hash");
  return v7 ^ -[GEORPUserFormDetails hash](self->_userFormDetails, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPRapNotification *notification;
  uint64_t v6;
  GEORPDisplayDetails *displayDetails;
  uint64_t v8;
  GEORPUserFormDetails *userFormDetails;
  uint64_t v10;
  _QWORD *v11;

  v11 = a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  if (v11[5])
  {
    -[GEORPRapResponse setResponseId:](self, "setResponseId:");
    v4 = v11;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_rapStateIcon = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }
  notification = self->_notification;
  v6 = v4[4];
  if (notification)
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPRapNotification mergeFrom:](notification, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPRapResponse setNotification:](self, "setNotification:");
  }
  v4 = v11;
LABEL_11:
  displayDetails = self->_displayDetails;
  v8 = v4[3];
  if (displayDetails)
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPDisplayDetails mergeFrom:](displayDetails, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPRapResponse setDisplayDetails:](self, "setDisplayDetails:");
  }
  v4 = v11;
LABEL_17:
  userFormDetails = self->_userFormDetails;
  v10 = v4[6];
  if (userFormDetails)
  {
    if (v10)
    {
      -[GEORPUserFormDetails mergeFrom:](userFormDetails, "mergeFrom:");
LABEL_22:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[GEORPRapResponse setUserFormDetails:](self, "setUserFormDetails:");
    goto LABEL_22;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPRapResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_807);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPRapResponse readAll:](self, "readAll:", 0);
    -[GEORPRapNotification clearUnknownFields:](self->_notification, "clearUnknownFields:", 1);
    -[GEORPDisplayDetails clearUnknownFields:](self->_displayDetails, "clearUnknownFields:", 1);
    -[GEORPUserFormDetails clearUnknownFields:](self->_userFormDetails, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFormDetails, 0);
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_displayDetails, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
