@implementation GEORPFeedbackConversationMessage

- (GEORPFeedbackConversationMessage)init
{
  GEORPFeedbackConversationMessage *v2;
  GEORPFeedbackConversationMessage *v3;
  GEORPFeedbackConversationMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackConversationMessage;
  v2 = -[GEORPFeedbackConversationMessage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackConversationMessage)initWithData:(id)a3
{
  GEORPFeedbackConversationMessage *v3;
  GEORPFeedbackConversationMessage *v4;
  GEORPFeedbackConversationMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackConversationMessage;
  v3 = -[GEORPFeedbackConversationMessage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUuid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackConversationMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUuid_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUuid
{
  -[GEORPFeedbackConversationMessage _readUuid]((uint64_t)self);
  return self->_uuid != 0;
}

- (NSString)uuid
{
  -[GEORPFeedbackConversationMessage _readUuid]((uint64_t)self);
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)_readPostedBy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackConversationMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPostedBy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPostedBy
{
  -[GEORPFeedbackConversationMessage _readPostedBy]((uint64_t)self);
  return self->_postedBy != 0;
}

- (GEORPPostedBy)postedBy
{
  -[GEORPFeedbackConversationMessage _readPostedBy]((uint64_t)self);
  return self->_postedBy;
}

- (void)setPostedBy:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_postedBy, a3);
}

- (void)_readPostedAt
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackConversationMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPostedAt_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPostedAt
{
  -[GEORPFeedbackConversationMessage _readPostedAt]((uint64_t)self);
  return self->_postedAt != 0;
}

- (GEORPTimestamp)postedAt
{
  -[GEORPFeedbackConversationMessage _readPostedAt]((uint64_t)self);
  return self->_postedAt;
}

- (void)setPostedAt:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_postedAt, a3);
}

- (void)_readComments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackConversationMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComments_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasComments
{
  -[GEORPFeedbackConversationMessage _readComments]((uint64_t)self);
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPFeedbackConversationMessage _readComments]((uint64_t)self);
  return self->_comments;
}

- (void)setComments:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (void)_readSurveyResponses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackConversationMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSurveyResponses_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)surveyResponses
{
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  return self->_surveyResponses;
}

- (void)setSurveyResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *surveyResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  surveyResponses = self->_surveyResponses;
  self->_surveyResponses = v4;

}

- (void)clearSurveyResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_surveyResponses, "removeAllObjects");
}

- (void)addSurveyResponse:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  -[GEORPFeedbackConversationMessage _addNoFlagsSurveyResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsSurveyResponse:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)surveyResponsesCount
{
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_surveyResponses, "count");
}

- (id)surveyResponseAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackConversationMessage _readSurveyResponses]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_surveyResponses, "objectAtIndex:", a3);
}

+ (Class)surveyResponseType
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
  v8.super_class = (Class)GEORPFeedbackConversationMessage;
  -[GEORPFeedbackConversationMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackConversationMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackConversationMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("uuid"));

  objc_msgSend((id)a1, "postedBy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("postedBy");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("posted_by");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "postedAt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("postedAt");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("posted_at");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  objc_msgSend((id)a1, "comments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("comments"));

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = *(id *)(a1 + 48);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }

    if (a2)
      v23 = CFSTR("surveyResponse");
    else
      v23 = CFSTR("survey_response");
    objc_msgSend(v4, "setObject:forKey:", v15, v23);

  }
  v24 = *(void **)(a1 + 16);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __62__GEORPFeedbackConversationMessage__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackConversationMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEORPFeedbackConversationMessage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackConversationMessage)initWithDictionary:(id)a3
{
  return (GEORPFeedbackConversationMessage *)-[GEORPFeedbackConversationMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEORPPostedBy *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  GEORPTimestamp *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  GEORPFeedbackSurveyResponse *v28;
  uint64_t v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uuid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setUuid:", v7);

      }
      if (a3)
        v8 = CFSTR("postedBy");
      else
        v8 = CFSTR("posted_by");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEORPPostedBy alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEORPPostedBy initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEORPPostedBy initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setPostedBy:", v11);

      }
      if (a3)
        v13 = CFSTR("postedAt");
      else
        v13 = CFSTR("posted_at");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEORPTimestamp alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEORPTimestamp initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEORPTimestamp initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setPostedAt:", v16);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("comments"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setComments:", v19);

      }
      if (a3)
        v20 = CFSTR("surveyResponse");
      else
        v20 = CFSTR("survey_response");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v5;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v34 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = [GEORPFeedbackSurveyResponse alloc];
                if ((a3 & 1) != 0)
                  v29 = -[GEORPFeedbackSurveyResponse initWithJSON:](v28, "initWithJSON:", v27);
                else
                  v29 = -[GEORPFeedbackSurveyResponse initWithDictionary:](v28, "initWithDictionary:", v27);
                v30 = (void *)v29;
                objc_msgSend(a1, "addSurveyResponse:", v29);

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v24);
        }

        v5 = v32;
      }

    }
  }

  return a1;
}

- (GEORPFeedbackConversationMessage)initWithJSON:(id)a3
{
  return (GEORPFeedbackConversationMessage *)-[GEORPFeedbackConversationMessage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_354;
    else
      v8 = (int *)&readAll__nonRecursiveTag_355;
    GEORPFeedbackConversationMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackConversationMessageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackConversationMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackConversationMessageReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPFeedbackConversationMessageIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPFeedbackConversationMessage readAll:](self, "readAll:", 0);
    if (self->_uuid)
      PBDataWriterWriteStringField();
    if (self->_postedBy)
      PBDataWriterWriteSubmessage();
    if (self->_postedAt)
      PBDataWriterWriteSubmessage();
    if (self->_comments)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_surveyResponses;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEORPFeedbackConversationMessage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_uuid)
    objc_msgSend(v8, "setUuid:");
  if (self->_postedBy)
    objc_msgSend(v8, "setPostedBy:");
  if (self->_postedAt)
    objc_msgSend(v8, "setPostedAt:");
  if (self->_comments)
    objc_msgSend(v8, "setComments:");
  if (-[GEORPFeedbackConversationMessage surveyResponsesCount](self, "surveyResponsesCount"))
  {
    objc_msgSend(v8, "clearSurveyResponses");
    v4 = -[GEORPFeedbackConversationMessage surveyResponsesCount](self, "surveyResponsesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackConversationMessage surveyResponseAtIndex:](self, "surveyResponseAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSurveyResponse:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      GEORPFeedbackConversationMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackConversationMessage readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[GEORPPostedBy copyWithZone:](self->_postedBy, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[GEORPTimestamp copyWithZone:](self->_postedAt, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_comments, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = self->_surveyResponses;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addSurveyResponse:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuid;
  GEORPPostedBy *postedBy;
  GEORPTimestamp *postedAt;
  NSString *comments;
  NSMutableArray *surveyResponses;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackConversationMessage readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         uuid = self->_uuid,
         !((unint64_t)uuid | v4[7]))
     || -[NSString isEqual:](uuid, "isEqual:"))
    && ((postedBy = self->_postedBy, !((unint64_t)postedBy | v4[5]))
     || -[GEORPPostedBy isEqual:](postedBy, "isEqual:"))
    && ((postedAt = self->_postedAt, !((unint64_t)postedAt | v4[4]))
     || -[GEORPTimestamp isEqual:](postedAt, "isEqual:"))
    && ((comments = self->_comments, !((unint64_t)comments | v4[3]))
     || -[NSString isEqual:](comments, "isEqual:")))
  {
    surveyResponses = self->_surveyResponses;
    if ((unint64_t)surveyResponses | v4[6])
      v10 = -[NSMutableArray isEqual:](surveyResponses, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;

  -[GEORPFeedbackConversationMessage readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_uuid, "hash");
  v4 = -[GEORPPostedBy hash](self->_postedBy, "hash") ^ v3;
  v5 = -[GEORPTimestamp hash](self->_postedAt, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_comments, "hash");
  return v6 ^ -[NSMutableArray hash](self->_surveyResponses, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEORPPostedBy *postedBy;
  id v6;
  GEORPTimestamp *postedAt;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[7])
    -[GEORPFeedbackConversationMessage setUuid:](self, "setUuid:");
  postedBy = self->_postedBy;
  v6 = v4[5];
  if (postedBy)
  {
    if (v6)
      -[GEORPPostedBy mergeFrom:](postedBy, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPFeedbackConversationMessage setPostedBy:](self, "setPostedBy:");
  }
  postedAt = self->_postedAt;
  v8 = v4[4];
  if (postedAt)
  {
    if (v8)
      -[GEORPTimestamp mergeFrom:](postedAt, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEORPFeedbackConversationMessage setPostedAt:](self, "setPostedAt:");
  }
  if (v4[3])
    -[GEORPFeedbackConversationMessage setComments:](self, "setComments:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v4[6];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[GEORPFeedbackConversationMessage addSurveyResponse:](self, "addSurveyResponse:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackConversationMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_358);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackConversationMessage readAll:](self, "readAll:", 0);
    -[GEORPPostedBy clearUnknownFields:](self->_postedBy, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_surveyResponses;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_surveyResponses, 0);
  objc_storeStrong((id *)&self->_postedBy, 0);
  objc_storeStrong((id *)&self->_postedAt, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
