@implementation GEOLPRTimeCondition

- (GEOLPRTimeCondition)init
{
  GEOLPRTimeCondition *v2;
  GEOLPRTimeCondition *v3;
  GEOLPRTimeCondition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRTimeCondition;
  v2 = -[GEOLPRTimeCondition init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRTimeCondition)initWithData:(id)a3
{
  GEOLPRTimeCondition *v3;
  GEOLPRTimeCondition *v4;
  GEOLPRTimeCondition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRTimeCondition;
  v3 = -[GEOLPRTimeCondition initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLPRTimeCondition;
  -[GEOLPRTimeCondition dealloc](&v3, sel_dealloc);
}

- (void)_readDayOfWeeks
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
        GEOLPRTimeConditionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDayOfWeeks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)dayOfWeeksCount
{
  -[GEOLPRTimeCondition _readDayOfWeeks]((uint64_t)self);
  return self->_dayOfWeeks.count;
}

- (int)dayOfWeeks
{
  -[GEOLPRTimeCondition _readDayOfWeeks]((uint64_t)self);
  return self->_dayOfWeeks.list;
}

- (void)clearDayOfWeeks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addDayOfWeek:(int)a3
{
  -[GEOLPRTimeCondition _readDayOfWeeks]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (int)dayOfWeekAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_dayOfWeeks;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOLPRTimeCondition _readDayOfWeeks]((uint64_t)self);
  p_dayOfWeeks = &self->_dayOfWeeks;
  count = self->_dayOfWeeks.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_dayOfWeeks->list[a3];
}

- (void)setDayOfWeeks:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Set();
}

- (id)dayOfWeeksAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_1E1C05B08[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDayOfWeeks:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUNDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SATURDAY")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readDayOfMonths
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRTimeConditionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDayOfMonths_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)dayOfMonthsCount
{
  -[GEOLPRTimeCondition _readDayOfMonths]((uint64_t)self);
  return self->_dayOfMonths.count;
}

- (unsigned)dayOfMonths
{
  -[GEOLPRTimeCondition _readDayOfMonths]((uint64_t)self);
  return self->_dayOfMonths.list;
}

- (void)clearDayOfMonths
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedUInt32Clear();
}

- (void)addDayOfMonth:(unsigned int)a3
{
  -[GEOLPRTimeCondition _readDayOfMonths]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (unsigned)dayOfMonthAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_dayOfMonths;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOLPRTimeCondition _readDayOfMonths]((uint64_t)self);
  p_dayOfMonths = &self->_dayOfMonths;
  count = self->_dayOfMonths.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_dayOfMonths->list[a3];
}

- (void)setDayOfMonths:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)GEOLPRTimeCondition;
  -[GEOLPRTimeCondition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRTimeCondition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRTimeCondition _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[6])
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1 + 5;
      if (a1[6])
      {
        v7 = 0;
        do
        {
          v8 = *(unsigned int *)(*v6 + 4 * v7);
          if ((v8 - 1) >= 7)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E1C05B08[(int)v8 - 1];
          }
          objc_msgSend(v5, "addObject:", v9);

          ++v7;
          v6 = a1 + 5;
        }
        while (v7 < a1[6]);
      }
      if (a2)
        v10 = CFSTR("dayOfWeek");
      else
        v10 = CFSTR("day_of_week");
      objc_msgSend(v4, "setObject:forKey:", v5, v10);

    }
    if (a1[3])
    {
      PBRepeatedUInt32NSArray();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("dayOfMonth");
      else
        v12 = CFSTR("day_of_month");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRTimeCondition _dictionaryRepresentation:](self, 1);
}

- (GEOLPRTimeCondition)initWithDictionary:(id)a3
{
  return (GEOLPRTimeCondition *)-[GEOLPRTimeCondition _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("dayOfWeek");
      else
        v7 = CFSTR("day_of_week");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = a3;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (!v10)
          goto LABEL_34;
        v11 = v10;
        v12 = *(_QWORD *)v32;
        while (1)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SUNDAY")) & 1) != 0)
              {
                v16 = 1;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
              {
                v16 = 2;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
              {
                v16 = 3;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
              {
                v16 = 4;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
              {
                v16 = 5;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
              {
                v16 = 6;
              }
              else if (objc_msgSend(v15, "isEqualToString:", CFSTR("SATURDAY")))
              {
                v16 = 7;
              }
              else
              {
                v16 = 1;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v16 = objc_msgSend(v14, "intValue");
            }
            objc_msgSend(v6, "addDayOfWeek:", v16);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (!v11)
          {
LABEL_34:

            a3 = v26;
            break;
          }
        }
      }

      if (a3)
        v17 = CFSTR("dayOfMonth");
      else
        v17 = CFSTR("day_of_month");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v28 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v6, "addDayOfMonth:", objc_msgSend(v24, "unsignedIntValue"));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v21);
        }

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOLPRTimeCondition)initWithJSON:(id)a3
{
  return (GEOLPRTimeCondition *)-[GEOLPRTimeCondition _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_608;
    else
      v8 = (int *)&readAll__nonRecursiveTag_609;
    GEOLPRTimeConditionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRTimeConditionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRTimeConditionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_dayOfMonths;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    v5 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRTimeCondition readAll:](self, "readAll:", 0);
    v5 = v11;
    if (self->_dayOfWeeks.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v11;
        ++v6;
      }
      while (v6 < self->_dayOfWeeks.count);
    }
    p_dayOfMonths = &self->_dayOfMonths;
    if (p_dayOfMonths->count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v11;
        ++v8;
      }
      while (v8 < p_dayOfMonths->count);
    }
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  id *v10;

  v10 = (id *)a3;
  -[GEOLPRTimeCondition readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRTimeCondition dayOfWeeksCount](self, "dayOfWeeksCount"))
  {
    objc_msgSend(v10, "clearDayOfWeeks");
    v4 = -[GEOLPRTimeCondition dayOfWeeksCount](self, "dayOfWeeksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addDayOfWeek:", -[GEOLPRTimeCondition dayOfWeekAtIndex:](self, "dayOfWeekAtIndex:", i));
    }
  }
  if (-[GEOLPRTimeCondition dayOfMonthsCount](self, "dayOfMonthsCount"))
  {
    objc_msgSend(v10, "clearDayOfMonths");
    v7 = -[GEOLPRTimeCondition dayOfMonthsCount](self, "dayOfMonthsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v10, "addDayOfMonth:", -[GEOLPRTimeCondition dayOfMonthAtIndex:](self, "dayOfMonthAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  PBDataReader *reader;
  PBDataReader *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v6 = reader;
  objc_sync_enter(v6);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRTimeCondition readAll:](self, "readAll:", 0);
    PBRepeatedInt32Copy();
    PBRepeatedUInt32Copy();
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLPRTimeConditionReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOLPRTimeCondition readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual()))
  {
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  -[GEOLPRTimeCondition readAll:](self, "readAll:", 1);
  v2 = PBRepeatedInt32Hash();
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = objc_msgSend(v10, "dayOfWeeksCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOLPRTimeCondition addDayOfWeek:](self, "addDayOfWeek:", objc_msgSend(v10, "dayOfWeekAtIndex:", i));
  }
  v7 = objc_msgSend(v10, "dayOfMonthsCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[GEOLPRTimeCondition addDayOfMonth:](self, "addDayOfMonth:", objc_msgSend(v10, "dayOfMonthAtIndex:", j));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
