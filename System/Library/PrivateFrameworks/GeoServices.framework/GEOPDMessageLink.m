@implementation GEOPDMessageLink

+ (id)messageLinkForPlaceData:(id)a3
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
  v6[2] = __61__GEOPDMessageLink_PlaceDataExtras__messageLinkForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 39, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__GEOPDMessageLink_PlaceDataExtras__messageLinkForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue messageLink](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDMessageLink)init
{
  GEOPDMessageLink *v2;
  GEOPDMessageLink *v3;
  GEOPDMessageLink *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMessageLink;
  v2 = -[GEOPDMessageLink init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMessageLink)initWithData:(id)a3
{
  GEOPDMessageLink *v3;
  GEOPDMessageLink *v4;
  GEOPDMessageLink *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMessageLink;
  v3 = -[GEOPDMessageLink initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMessageId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMessageId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)messageId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMessageLink _readMessageId]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readMessageUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMessageUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)messageUrl
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMessageLink _readMessageUrl]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (uint64_t)responseTime
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 92);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 84);
    else
      return 0;
  }
  return result;
}

- (void)_readHoursOfOperations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHoursOfOperations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)hoursOfOperations
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMessageLink _readHoursOfOperations]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addHoursOfOperation:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDMessageLink _readHoursOfOperations](a1);
    -[GEOPDMessageLink _addNoFlagsHoursOfOperation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 92) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 92) |= 0x200u;
  }
}

- (void)_addNoFlagsHoursOfOperation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)timezone
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMessageLink _readTimezone]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readNavBackgroundColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavBackgroundColor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)navBackgroundColor
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMessageLink _readNavBackgroundColor]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readNavTintColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavTintColor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)navTintColor
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMessageLink _readNavTintColor]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
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
  v8.super_class = (Class)GEOPDMessageLink;
  -[GEOPDMessageLink description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMessageLink dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMessageLink _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDMessageLink readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMessageLink messageId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("messageId");
    else
      v6 = CFSTR("message_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDMessageLink messageUrl]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("messageUrl");
    else
      v8 = CFSTR("message_url");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if ((*(_WORD *)(a1 + 92) & 1) != 0)
  {
    v9 = *(int *)(a1 + 84);
    if (v9 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C0BCE8[v9];
    }
    if (a2)
      v11 = CFSTR("responseTime");
    else
      v11 = CFSTR("response_time");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = *(id *)(a1 + 24);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("hoursOfOperation");
    else
      v20 = CFSTR("hours_of_operation");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  -[GEOPDMessageLink timezone]((id *)a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v21, "jsonRepresentation");
    else
      objc_msgSend(v21, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("timezone"));

  }
  if ((*(_WORD *)(a1 + 92) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("isVerified");
    else
      v25 = CFSTR("is_verified");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  -[GEOPDMessageLink navBackgroundColor]((id *)a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("navBackgroundColor");
    else
      v27 = CFSTR("nav_background_color");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  -[GEOPDMessageLink navTintColor]((id *)a1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (a2)
      v29 = CFSTR("navTintColor");
    else
      v29 = CFSTR("nav_tint_color");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);
  }

  v30 = *(void **)(a1 + 16);
  if (v30)
  {
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __46__GEOPDMessageLink__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v34 = v33;
      v38 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);
      v35 = v34;

      v32 = v35;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMessageLink _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_4869;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4870;
      GEOPDMessageLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDMessageLinkCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __46__GEOPDMessageLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDMessageLinkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F8) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMessageLink readAll:]((uint64_t)self, 0);
    if (self->_messageId)
      PBDataWriterWriteStringField();
    if (self->_messageUrl)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_hoursOfOperations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_timezone)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_navBackgroundColor)
      PBDataWriterWriteStringField();
    if (self->_navTintColor)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PBUnknownFields *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDMessageLinkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMessageLink readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_messageId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_messageUrl, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_responseTime;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_hoursOfOperations;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v26);
        -[GEOPDMessageLink addHoursOfOperation:](v5, v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  v18 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_isVerified;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v20 = -[NSString copyWithZone:](self->_navBackgroundColor, "copyWithZone:", a3, (_QWORD)v26);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  v22 = -[NSString copyWithZone:](self->_navTintColor, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v22;

  v24 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v24;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *messageId;
  NSString *messageUrl;
  __int16 v7;
  NSMutableArray *hoursOfOperations;
  GEOTimezone *timezone;
  __int16 v10;
  NSString *navBackgroundColor;
  NSString *navTintColor;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOPDMessageLink readAll:]((uint64_t)self, 1);
  -[GEOPDMessageLink readAll:]((uint64_t)v4, 1);
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:"))
      goto LABEL_27;
  }
  messageUrl = self->_messageUrl;
  if ((unint64_t)messageUrl | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](messageUrl, "isEqual:"))
      goto LABEL_27;
  }
  v7 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_responseTime != *((_DWORD *)v4 + 21))
      goto LABEL_27;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_27;
  }
  hoursOfOperations = self->_hoursOfOperations;
  if ((unint64_t)hoursOfOperations | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](hoursOfOperations, "isEqual:"))
  {
    goto LABEL_27;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:"))
      goto LABEL_27;
  }
  v10 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_23;
    }
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  if ((v10 & 2) != 0)
    goto LABEL_27;
LABEL_23:
  navBackgroundColor = self->_navBackgroundColor;
  if ((unint64_t)navBackgroundColor | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](navBackgroundColor, "isEqual:"))
  {
    goto LABEL_27;
  }
  navTintColor = self->_navTintColor;
  if ((unint64_t)navTintColor | *((_QWORD *)v4 + 7))
    v13 = -[NSString isEqual:](navTintColor, "isEqual:");
  else
    v13 = 1;
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  -[GEOPDMessageLink readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_messageId, "hash");
  v4 = -[NSString hash](self->_messageUrl, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_responseTime;
  else
    v5 = 0;
  v6 = -[NSMutableArray hash](self->_hoursOfOperations, "hash");
  v7 = -[GEOTimezone hash](self->_timezone, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_isVerified;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_navBackgroundColor, "hash");
  return v9 ^ -[NSString hash](self->_navTintColor, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_navTintColor, 0);
  objc_storeStrong((id *)&self->_navBackgroundColor, 0);
  objc_storeStrong((id *)&self->_messageUrl, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_hoursOfOperations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
