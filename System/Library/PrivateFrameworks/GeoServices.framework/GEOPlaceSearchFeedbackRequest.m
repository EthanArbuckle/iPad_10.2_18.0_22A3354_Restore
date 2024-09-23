@implementation GEOPlaceSearchFeedbackRequest

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (GEOSessionID)sessionGUID
{
  GEOSessionID *p_sessionGUID;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionGUID = &self->_sessionGUID;
  high = self->_sessionGUID._high;
  low = p_sessionGUID->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setSessionGUID:(GEOSessionID)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_sessionGUID = a3;
}

- (void)setHasSessionGUID:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSessionGUID
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(int64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_businessID = a3;
}

- (void)setHasBusinessID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasBusinessID
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)feedbackType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_feedbackType;
  else
    return 0;
}

- (void)setFeedbackType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasFeedbackType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C06278[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSISTANT_RESULT_CLICK")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSISTANT_YELP_CLICK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSISTANT_RESULT_CLICK_CALL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ASSISTANT_RESULT_CLICK_DIRECTIONS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)numberOfResults
{
  return self->_numberOfResults;
}

- (void)setNumberOfResults:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_numberOfResults = a3;
}

- (void)setHasNumberOfResults:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasNumberOfResults
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (int)positionInResults
{
  return self->_positionInResults;
}

- (void)setPositionInResults:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_positionInResults = a3;
}

- (void)setHasPositionInResults:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasPositionInResults
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x80u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
}

- (BOOL)hasSequenceNumber
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOPlaceSearchFeedbackRequest;
  -[GEOPlaceSearchFeedbackRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceSearchFeedbackRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 60);
  if ((v3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("timestamp"));

    v3 = *(_BYTE *)(a1 + 60);
  }
  if ((v3 & 1) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 8));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("sessionGUID"));

    v3 = *(_BYTE *)(a1 + 60);
    if ((v3 & 2) == 0)
    {
LABEL_6:
      if ((v3 & 8) == 0)
        goto LABEL_7;
      goto LABEL_14;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("businessID"));

  v3 = *(_BYTE *)(a1 + 60);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_14:
  v7 = *(int *)(a1 + 40);
  if (v7 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C06278[v7];
  }
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("feedbackType"));

  v3 = *(_BYTE *)(a1 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("numberOfResults"));

  v3 = *(_BYTE *)(a1 + 60);
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 52));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("positionInResults"));

  v3 = *(_BYTE *)(a1 + 60);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x10) == 0)
      return v2;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("sequenceNumber"));

  if ((*(_BYTE *)(a1 + 60) & 0x10) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 44));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("localSearchProviderID"));

  }
  return v2;
}

- (GEOPlaceSearchFeedbackRequest)initWithDictionary:(id)a3
{
  return (GEOPlaceSearchFeedbackRequest *)-[GEOPlaceSearchFeedbackRequest _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  if (!a1)
    goto LABEL_32;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_32;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(a1, "setTimestamp:");
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sessionGUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v5, &v15);
    objc_msgSend(a1, "setSessionGUID:", v15, v16);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("businessID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBusinessID:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("feedbackType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ASSISTANT_RESULT_CLICK")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ASSISTANT_YELP_CLICK")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ASSISTANT_RESULT_CLICK_CALL")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("ASSISTANT_RESULT_CLICK_DIRECTIONS")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_22:
    objc_msgSend(a1, "setFeedbackType:", v9);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numberOfResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNumberOfResults:", objc_msgSend(v10, "intValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("positionInResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPositionInResults:", objc_msgSend(v11, "intValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v12, "intValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localSearchProviderID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v13, "intValue"));

LABEL_32:
  return a1;
}

- (GEOPlaceSearchFeedbackRequest)initWithJSON:(id)a3
{
  return (GEOPlaceSearchFeedbackRequest *)-[GEOPlaceSearchFeedbackRequest _initWithDictionary:isJSON:](self, a3);
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
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  BOOL v54;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v6;
          v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *v6;
      v17 = *((unsigned __int8 *)a3 + v16);
      if (*((_BYTE *)a3 + v16))
        v10 = 0;
LABEL_14:
      v18 = v10 & 7;
      if (v17 || v18 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          if (v18 != 1)
            goto LABEL_82;
          v20 = *v4;
          v21 = *(_QWORD *)((char *)a3 + v20);
          if (v21 > 0xFFFFFFFFFFFFFFF7)
            goto LABEL_78;
          v22 = v21 + 8;
          if (v22 > *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_78;
          *(_QWORD *)((char *)a3 + v20) = v22;
          continue;
        case 2u:
          if (v18 != 2 || !PBReaderPlaceMark() || !GEOSessionIDIsValid(a3))
            goto LABEL_82;
          PBReaderRecallMark();
          continue;
        case 3u:
          if ((v10 & 7) != 0)
            goto LABEL_82;
          v23 = 0;
          while (1)
          {
            v24 = *v4;
            v25 = *(_QWORD *)((char *)a3 + v24);
            v26 = v25 + 1;
            if (v25 == -1 || v26 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_77;
            v27 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v25);
            *(_QWORD *)((char *)a3 + v24) = v26;
            if (v27 < 0)
            {
              v28 = v23++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_79;
          }
        case 4u:
          if ((v10 & 7) != 0)
            goto LABEL_82;
          v29 = 0;
          while (1)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_77;
            v33 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v31);
            *(_QWORD *)((char *)a3 + v30) = v32;
            if (v33 < 0)
            {
              v28 = v29++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_79;
          }
        case 5u:
          if ((v10 & 7) != 0)
            goto LABEL_82;
          v34 = 0;
          while (1)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_77;
            v38 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v36);
            *(_QWORD *)((char *)a3 + v35) = v37;
            if (v38 < 0)
            {
              v28 = v34++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_79;
          }
        case 6u:
          if ((v10 & 7) != 0)
            goto LABEL_82;
          v39 = 0;
          while (1)
          {
            v40 = *v4;
            v41 = *(_QWORD *)((char *)a3 + v40);
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_77;
            v43 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v41);
            *(_QWORD *)((char *)a3 + v40) = v42;
            if (v43 < 0)
            {
              v28 = v39++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_79;
          }
        case 7u:
          if ((v10 & 7) != 0)
            goto LABEL_82;
          v44 = 0;
          while (1)
          {
            v45 = *v4;
            v46 = *(_QWORD *)((char *)a3 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_77;
            v48 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v46);
            *(_QWORD *)((char *)a3 + v45) = v47;
            if (v48 < 0)
            {
              v28 = v44++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_79;
          }
        case 8u:
          if ((v10 & 7) != 0)
            goto LABEL_82;
          v49 = 0;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
LABEL_82:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        v50 = *v4;
        v51 = *(_QWORD *)((char *)a3 + v50);
        v52 = v51 + 1;
        if (v51 == -1 || v52 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v53 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v51);
        *(_QWORD *)((char *)a3 + v50) = v52;
        if (v53 < 0)
        {
          v28 = v49++ > 8;
          if (!v28)
            continue;
        }
        goto LABEL_79;
      }
LABEL_77:
      v16 = *v6;
LABEL_78:
      *((_BYTE *)a3 + v16) = 1;
LABEL_79:
      ;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  v54 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v54;
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
  uint64_t v19;
  unint64_t v20;
  double v21;
  char v22;
  unsigned int v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  BOOL v61;

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
        switch((v11 >> 3))
        {
          case 1u:
            *(_BYTE *)&self->_flags |= 4u;
            v19 = *v5;
            v20 = *(_QWORD *)&v4[v19];
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)&v4[*v6])
            {
              v21 = *(double *)(*(_QWORD *)&v4[*v8] + v20);
              *(_QWORD *)&v4[v19] = v20 + 8;
            }
            else
            {
              v4[*v7] = 1;
              v21 = 0.0;
            }
            self->_timestamp = v21;
            continue;
          case 2u:
            if (!PBReaderPlaceMark()
              || (GEOSessionIDReadAllFrom(&self->_sessionGUID._high, (uint64_t)v4) & 1) == 0)
            {
              goto LABEL_100;
            }
            PBReaderRecallMark();
            *(_BYTE *)&self->_flags |= 1u;
            continue;
          case 3u:
            v22 = 0;
            v23 = 0;
            v24 = 0;
            *(_BYTE *)&self->_flags |= 2u;
            while (2)
            {
              v25 = *v5;
              v26 = *(_QWORD *)&v4[v25];
              v27 = v26 + 1;
              if (v26 == -1 || v27 > *(_QWORD *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                v28 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v26);
                *(_QWORD *)&v4[v25] = v27;
                v24 |= (unint64_t)(v28 & 0x7F) << v22;
                if (v28 < 0)
                {
                  v22 += 7;
                  v16 = v23++ >= 9;
                  if (v16)
                  {
                    v24 = 0;
                    goto LABEL_73;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7])
              v24 = 0;
LABEL_73:
            self->_businessID = v24;
            continue;
          case 4u:
            v29 = 0;
            v30 = 0;
            v31 = 0;
            *(_BYTE *)&self->_flags |= 8u;
            while (1)
            {
              v32 = *v5;
              v33 = *(_QWORD *)&v4[v32];
              v34 = v33 + 1;
              if (v33 == -1 || v34 > *(_QWORD *)&v4[*v6])
                break;
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v33);
              *(_QWORD *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if ((v35 & 0x80) == 0)
                goto LABEL_75;
              v29 += 7;
              v16 = v30++ >= 9;
              if (v16)
              {
                LODWORD(v31) = 0;
                goto LABEL_77;
              }
            }
            v4[*v7] = 1;
LABEL_75:
            if (v4[*v7])
              LODWORD(v31) = 0;
LABEL_77:
            v60 = 40;
            goto LABEL_94;
          case 5u:
            v36 = 0;
            v37 = 0;
            v31 = 0;
            *(_BYTE *)&self->_flags |= 0x20u;
            while (2)
            {
              v38 = *v5;
              v39 = *(_QWORD *)&v4[v38];
              v40 = v39 + 1;
              if (v39 == -1 || v40 > *(_QWORD *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                v41 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v39);
                *(_QWORD *)&v4[v38] = v40;
                v31 |= (unint64_t)(v41 & 0x7F) << v36;
                if (v41 < 0)
                {
                  v36 += 7;
                  v16 = v37++ >= 9;
                  if (v16)
                  {
                    LODWORD(v31) = 0;
                    goto LABEL_81;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7])
              LODWORD(v31) = 0;
LABEL_81:
            v60 = 48;
            goto LABEL_94;
          case 6u:
            v42 = 0;
            v43 = 0;
            v31 = 0;
            *(_BYTE *)&self->_flags |= 0x40u;
            while (2)
            {
              v44 = *v5;
              v45 = *(_QWORD *)&v4[v44];
              v46 = v45 + 1;
              if (v45 == -1 || v46 > *(_QWORD *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                v47 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v45);
                *(_QWORD *)&v4[v44] = v46;
                v31 |= (unint64_t)(v47 & 0x7F) << v42;
                if (v47 < 0)
                {
                  v42 += 7;
                  v16 = v43++ >= 9;
                  if (v16)
                  {
                    LODWORD(v31) = 0;
                    goto LABEL_85;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7])
              LODWORD(v31) = 0;
LABEL_85:
            v60 = 52;
            goto LABEL_94;
          case 7u:
            v48 = 0;
            v49 = 0;
            v31 = 0;
            *(_BYTE *)&self->_flags |= 0x80u;
            while (2)
            {
              v50 = *v5;
              v51 = *(_QWORD *)&v4[v50];
              v52 = v51 + 1;
              if (v51 == -1 || v52 > *(_QWORD *)&v4[*v6])
              {
                v4[*v7] = 1;
              }
              else
              {
                v53 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v51);
                *(_QWORD *)&v4[v50] = v52;
                v31 |= (unint64_t)(v53 & 0x7F) << v48;
                if (v53 < 0)
                {
                  v48 += 7;
                  v16 = v49++ >= 9;
                  if (v16)
                  {
                    LODWORD(v31) = 0;
                    goto LABEL_89;
                  }
                  continue;
                }
              }
              break;
            }
            if (v4[*v7])
              LODWORD(v31) = 0;
LABEL_89:
            v60 = 56;
            goto LABEL_94;
          case 8u:
            v54 = 0;
            v55 = 0;
            v31 = 0;
            *(_BYTE *)&self->_flags |= 0x10u;
            break;
          default:
            if (!PBReaderSkipValueWithTag())
              goto LABEL_100;
            continue;
        }
        while (1)
        {
          v56 = *v5;
          v57 = *(_QWORD *)&v4[v56];
          v58 = v57 + 1;
          if (v57 == -1 || v58 > *(_QWORD *)&v4[*v6])
            break;
          v59 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v57);
          *(_QWORD *)&v4[v56] = v58;
          v31 |= (unint64_t)(v59 & 0x7F) << v54;
          if ((v59 & 0x80) == 0)
            goto LABEL_91;
          v54 += 7;
          v16 = v55++ >= 9;
          if (v16)
          {
            LODWORD(v31) = 0;
            goto LABEL_93;
          }
        }
        v4[*v7] = 1;
LABEL_91:
        if (v4[*v7])
          LODWORD(v31) = 0;
LABEL_93:
        v60 = 44;
LABEL_94:
        *(_DWORD *)((char *)&self->super.super.super.isa + v60) = v31;
      }
      while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
    }
    v61 = v4[*v7] == 0;
  }
  else
  {
LABEL_100:
    v61 = 0;
  }
  objc_sync_exit(v4);

  return v61;
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if (flags < 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 0x10) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:

}

- (unsigned)requestTypeCode
{
  return 1005;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  char flags;
  char *v5;

  v5 = (char *)a3;
  -[GEOPlaceSearchFeedbackRequest readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_timestamp;
    v5[60] |= 4u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(GEOSessionID *)(v5 + 8) = self->_sessionGUID;
  v5[60] |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)v5 + 3) = self->_businessID;
  v5[60] |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 10) = self->_feedbackType;
  v5[60] |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 12) = self->_numberOfResults;
  v5[60] |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    *((_DWORD *)v5 + 14) = self->_sequenceNumber;
    v5[60] |= 0x80u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *((_DWORD *)v5 + 13) = self->_positionInResults;
  v5[60] |= 0x40u;
  flags = (char)self->_flags;
  if (flags < 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 11) = self->_localSearchProviderID;
    v5[60] |= 0x10u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 60) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(GEOSessionID *)((char *)result + 8) = self->_sessionGUID;
  *((_BYTE *)result + 60) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 3) = self->_businessID;
  *((_BYTE *)result + 60) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 10) = self->_feedbackType;
  *((_BYTE *)result + 60) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 12) = self->_numberOfResults;
  *((_BYTE *)result + 60) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 13) = self->_positionInResults;
  *((_BYTE *)result + 60) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x10) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 14) = self->_sequenceNumber;
  *((_BYTE *)result + 60) |= 0x80u;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 11) = self->_localSearchProviderID;
  *((_BYTE *)result + 60) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $A14AAD9D3671273A066B57AEC6FEAFB5 flags;
  int v6;
  BOOL v8;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[GEOPlaceSearchFeedbackRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = v4[60];
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timestamp != *((double *)v4 + 4))
      goto LABEL_44;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 1) != 0 && (v6 & 1) != 0)
  {
    if (self->_sessionGUID._high != *((_QWORD *)v4 + 1) || self->_sessionGUID._low != *((_QWORD *)v4 + 2))
      goto LABEL_44;
  }
  else if (((*(_DWORD *)&flags | v6) & 1) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_businessID != *((_QWORD *)v4 + 3))
      goto LABEL_44;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_feedbackType != *((_DWORD *)v4 + 10))
      goto LABEL_44;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numberOfResults != *((_DWORD *)v4 + 12))
      goto LABEL_44;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_positionInResults != *((_DWORD *)v4 + 13))
      goto LABEL_44;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_38;
LABEL_44:
    v8 = 0;
    goto LABEL_45;
  }
  if ((v6 & 0x80) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 14))
    goto LABEL_44;
LABEL_38:
  v8 = (v6 & 0x10) == 0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 11))
      goto LABEL_44;
    v8 = 1;
  }
LABEL_45:

  return v8;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[GEOPlaceSearchFeedbackRequest readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    timestamp = self->_timestamp;
    v6 = -timestamp;
    if (timestamp >= 0.0)
      v6 = self->_timestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 1) != 0)
  {
    v9 = PBHashBytes();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
LABEL_11:
      v10 = 2654435761 * self->_businessID;
      if ((flags & 8) != 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else
  {
    v9 = 0;
    if ((flags & 2) != 0)
      goto LABEL_11;
  }
  v10 = 0;
  if ((flags & 8) != 0)
  {
LABEL_12:
    v11 = 2654435761 * self->_feedbackType;
    if ((flags & 0x20) != 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_19:
  v11 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_13:
    v12 = 2654435761 * self->_numberOfResults;
    if ((flags & 0x40) != 0)
      goto LABEL_14;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_14:
    v13 = 2654435761 * self->_positionInResults;
    if (flags < 0)
      goto LABEL_15;
LABEL_22:
    v14 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_16;
LABEL_23:
    v15 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  v13 = 0;
  if ((flags & 0x80) == 0)
    goto LABEL_22;
LABEL_15:
  v14 = 2654435761 * self->_sequenceNumber;
  if ((flags & 0x10) == 0)
    goto LABEL_23;
LABEL_16:
  v15 = 2654435761 * self->_localSearchProviderID;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  char *v5;

  v5 = (char *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[60];
  if ((v4 & 4) != 0)
  {
    self->_timestamp = *((double *)v5 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v4 = v5[60];
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v5[60] & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionGUID = *(GEOSessionID *)(v5 + 8);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = v5[60];
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_businessID = *((_QWORD *)v5 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = v5[60];
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_feedbackType = *((_DWORD *)v5 + 10);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = v5[60];
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_numberOfResults = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = v5[60];
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    self->_sequenceNumber = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_flags |= 0x80u;
    if ((v5[60] & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_positionInResults = *((_DWORD *)v5 + 13);
  *(_BYTE *)&self->_flags |= 0x40u;
  v4 = v5[60];
  if (v4 < 0)
    goto LABEL_17;
LABEL_8:
  if ((v4 & 0x10) != 0)
  {
LABEL_9:
    self->_localSearchProviderID = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_flags |= 0x10u;
  }
LABEL_10:

}

@end
