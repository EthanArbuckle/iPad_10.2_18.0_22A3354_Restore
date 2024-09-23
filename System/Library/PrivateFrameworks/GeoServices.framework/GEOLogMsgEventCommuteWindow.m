@implementation GEOLogMsgEventCommuteWindow

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)predictedExitTime
{
  return self->_predictedExitTime;
}

- (void)setPredictedExitTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_predictedExitTime = a3;
}

- (void)setHasPredictedExitTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasPredictedExitTime
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (int)endReason
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_endReason;
  else
    return 0;
}

- (void)setEndReason:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_endReason = a3;
}

- (void)setHasEndReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEndReason
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)endReasonAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C224A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_WINDOW_TIMED_OUT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_MISSION_COMPLETE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)predictedDestinations
{
  return self->_predictedDestinations;
}

- (void)setPredictedDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_predictedDestinations, a3);
}

- (void)clearPredictedDestinations
{
  -[NSMutableArray removeAllObjects](self->_predictedDestinations, "removeAllObjects");
}

- (void)addPredictedDestination:(id)a3
{
  id v4;
  NSMutableArray *predictedDestinations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  predictedDestinations = self->_predictedDestinations;
  v8 = v4;
  if (!predictedDestinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_predictedDestinations;
    self->_predictedDestinations = v6;

    v4 = v8;
    predictedDestinations = self->_predictedDestinations;
  }
  -[NSMutableArray addObject:](predictedDestinations, "addObject:", v4);

}

- (unint64_t)predictedDestinationsCount
{
  return -[NSMutableArray count](self->_predictedDestinations, "count");
}

- (id)predictedDestinationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_predictedDestinations, "objectAtIndex:", a3);
}

+ (Class)predictedDestinationType
{
  return (Class)objc_opt_class();
}

- (unsigned)numberOfDoomRoutingRequests
{
  return self->_numberOfDoomRoutingRequests;
}

- (void)setNumberOfDoomRoutingRequests:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_numberOfDoomRoutingRequests = a3;
}

- (void)setHasNumberOfDoomRoutingRequests:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasNumberOfDoomRoutingRequests
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)numberOfAlertingResponses
{
  return self->_numberOfAlertingResponses;
}

- (void)setNumberOfAlertingResponses:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_numberOfAlertingResponses = a3;
}

- (void)setHasNumberOfAlertingResponses:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNumberOfAlertingResponses
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOLogMsgEventCommuteWindow;
  -[GEOLogMsgEventCommuteWindow description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventCommuteWindow dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventCommuteWindow _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  char v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("startTime");
    else
      v7 = CFSTR("start_time");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 44);
  }
  if ((v5 & 2) == 0)
  {
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("predictedExitTime");
    else
      v10 = CFSTR("predicted_exit_time");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    if ((*(_BYTE *)(a1 + 44) & 4) == 0)
      goto LABEL_23;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("duration"));

  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 0x20) != 0)
    goto LABEL_12;
LABEL_9:
  if ((v5 & 4) != 0)
  {
LABEL_16:
    v11 = *(int *)(a1 + 28);
    if (v11 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C224A8[v11];
    }
    if (a2)
      v13 = CFSTR("endReason");
    else
      v13 = CFSTR("end_reason");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
LABEL_23:
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = *(id *)(a1 + 8);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("predictedDestination");
    else
      v22 = CFSTR("predicted_destination");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  v23 = *(_BYTE *)(a1 + 44);
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("numberOfDoomRoutingRequests");
    else
      v25 = CFSTR("number_of_doom_routing_requests");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    v23 = *(_BYTE *)(a1 + 44);
  }
  if ((v23 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("numberOfAlertingResponses");
    else
      v27 = CFSTR("number_of_alerting_responses");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventCommuteWindow _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventCommuteWindow)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventCommuteWindow *)-[GEOLogMsgEventCommuteWindow _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  GEOPredictedCommuteDestination *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_58;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_58;
  if (a3)
    v6 = CFSTR("startTime");
  else
    v6 = CFSTR("start_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(a1, "setStartTime:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDuration:", objc_msgSend(v8, "unsignedIntValue"));

  if (a3)
    v9 = CFSTR("predictedExitTime");
  else
    v9 = CFSTR("predicted_exit_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPredictedExitTime:", objc_msgSend(v10, "unsignedIntValue"));

  if (a3)
    v11 = CFSTR("endReason");
  else
    v11 = CFSTR("end_reason");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UNKNOWN_REASON")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("COMMUTE_WINDOW_TIMED_OUT")) & 1) != 0)
    {
      v14 = 1;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("COMMUTE_MISSION_COMPLETE")))
    {
      v14 = 2;
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v12, "intValue");
LABEL_29:
    objc_msgSend(a1, "setEndReason:", v14);
  }

  if (a3)
    v15 = CFSTR("predictedDestination");
  else
    v15 = CFSTR("predicted_destination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v5;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = [GEOPredictedCommuteDestination alloc];
            if ((a3 & 1) != 0)
              v24 = -[GEOPredictedCommuteDestination initWithJSON:](v23, "initWithJSON:", v22);
            else
              v24 = -[GEOPredictedCommuteDestination initWithDictionary:](v23, "initWithDictionary:", v22);
            v25 = (void *)v24;
            objc_msgSend(a1, "addPredictedDestination:", v24);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

    v5 = v31;
  }

  if (a3)
    v26 = CFSTR("numberOfDoomRoutingRequests");
  else
    v26 = CFSTR("number_of_doom_routing_requests");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNumberOfDoomRoutingRequests:", objc_msgSend(v27, "unsignedIntValue"));

  if (a3)
    v28 = CFSTR("numberOfAlertingResponses");
  else
    v28 = CFSTR("number_of_alerting_responses");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNumberOfAlertingResponses:", objc_msgSend(v29, "unsignedIntValue"));

LABEL_58:
  return a1;
}

- (GEOLogMsgEventCommuteWindow)initWithJSON:(id)a3
{
  return (GEOLogMsgEventCommuteWindow *)-[GEOLogMsgEventCommuteWindow _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventCommuteWindowIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventCommuteWindowReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_predictedDestinations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (char)self->_flags;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = (char)self->_flags;
  }
  if ((v11 & 8) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  _QWORD *v10;

  v10 = a3;
  -[GEOLogMsgEventCommuteWindow readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v10[2] = *(_QWORD *)&self->_startTime;
    *((_BYTE *)v10 + 44) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
LABEL_17:
      *((_DWORD *)v10 + 10) = self->_predictedExitTime;
      *((_BYTE *)v10 + 44) |= 0x20u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v10 + 6) = self->_duration;
  *((_BYTE *)v10 + 44) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_17;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v10 + 7) = self->_endReason;
    *((_BYTE *)v10 + 44) |= 4u;
  }
LABEL_6:
  if (-[GEOLogMsgEventCommuteWindow predictedDestinationsCount](self, "predictedDestinationsCount"))
  {
    objc_msgSend(v10, "clearPredictedDestinations");
    v5 = -[GEOLogMsgEventCommuteWindow predictedDestinationsCount](self, "predictedDestinationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLogMsgEventCommuteWindow predictedDestinationAtIndex:](self, "predictedDestinationAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addPredictedDestination:", v8);

      }
    }
  }
  v9 = (char)self->_flags;
  if ((v9 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 9) = self->_numberOfDoomRoutingRequests;
    *((_BYTE *)v10 + 44) |= 0x10u;
    v9 = (char)self->_flags;
  }
  if ((v9 & 8) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_numberOfAlertingResponses;
    *((_BYTE *)v10 + 44) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_startTime;
    *(_BYTE *)(v5 + 44) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_duration;
  *(_BYTE *)(v5 + 44) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_20:
  *(_DWORD *)(v5 + 40) = self->_predictedExitTime;
  *(_BYTE *)(v5 + 44) |= 0x20u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 28) = self->_endReason;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
LABEL_6:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_predictedDestinations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v6, "addPredictedDestination:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (char)self->_flags;
  if ((v14 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_numberOfDoomRoutingRequests;
    *(_BYTE *)(v6 + 44) |= 0x10u;
    v14 = (char)self->_flags;
  }
  if ((v14 & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_numberOfAlertingResponses;
    *(_BYTE *)(v6 + 44) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *predictedDestinations;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[GEOLogMsgEventCommuteWindow readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 44);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_startTime != *((double *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 6))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_predictedExitTime != *((_DWORD *)v4 + 10))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_endReason != *((_DWORD *)v4 + 7))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_34;
  }
  predictedDestinations = self->_predictedDestinations;
  if ((unint64_t)predictedDestinations | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](predictedDestinations, "isEqual:"))
    {
LABEL_34:
      v8 = 0;
      goto LABEL_35;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numberOfDoomRoutingRequests != *((_DWORD *)v4 + 9))
      goto LABEL_34;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_34;
  }
  v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_numberOfAlertingResponses != *((_DWORD *)v4 + 8))
      goto LABEL_34;
    v8 = 1;
  }
LABEL_35:

  return v8;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double startTime;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[GEOLogMsgEventCommuteWindow readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    startTime = self->_startTime;
    v6 = -startTime;
    if (startTime >= 0.0)
      v6 = self->_startTime;
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
  if ((flags & 2) == 0)
  {
    v9 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((flags & 4) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v9 = 2654435761 * self->_duration;
  if ((flags & 0x20) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_predictedExitTime;
  if ((flags & 4) != 0)
  {
LABEL_12:
    v11 = 2654435761 * self->_endReason;
    goto LABEL_16;
  }
LABEL_15:
  v11 = 0;
LABEL_16:
  v12 = -[NSMutableArray hash](self->_predictedDestinations, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v13 = 2654435761 * self->_numberOfDoomRoutingRequests;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_18;
LABEL_20:
    v14 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v13 ^ v14 ^ v12;
  }
  v13 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_20;
LABEL_18:
  v14 = 2654435761 * self->_numberOfAlertingResponses;
  return v9 ^ v4 ^ v10 ^ v11 ^ v13 ^ v14 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_startTime = *((double *)v4 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_flags |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_20:
  self->_predictedExitTime = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_flags |= 0x20u;
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
LABEL_5:
    self->_endReason = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_6:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GEOLogMsgEventCommuteWindow addPredictedDestination:](self, "addPredictedDestination:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v4 + 44);
  if ((v11 & 0x10) != 0)
  {
    self->_numberOfDoomRoutingRequests = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_flags |= 0x10u;
    v11 = *((_BYTE *)v4 + 44);
  }
  if ((v11 & 8) != 0)
  {
    self->_numberOfAlertingResponses = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_flags |= 8u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedDestinations, 0);
}

@end
