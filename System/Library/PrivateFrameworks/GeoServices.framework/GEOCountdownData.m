@implementation GEOCountdownData

- (GEOCountdownData)init
{
  GEOCountdownData *v2;
  GEOCountdownData *v3;
  GEOCountdownData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCountdownData;
  v2 = -[GEOCountdownData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCountdownData)initWithData:(id)a3
{
  GEOCountdownData *v3;
  GEOCountdownData *v4;
  GEOCountdownData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCountdownData;
  v3 = -[GEOCountdownData initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCountdownData;
  -[GEOCountdownData dealloc](&v3, sel_dealloc);
}

- (void)_readTimestampValues
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimestampValues_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)timestampValuesCount
{
  -[GEOCountdownData _readTimestampValues]((uint64_t)self);
  return self->_timestampValues.count;
}

- (unsigned)timestampValues
{
  -[GEOCountdownData _readTimestampValues]((uint64_t)self);
  return self->_timestampValues.list;
}

- (void)clearTimestampValues
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Clear();
}

- (void)addTimestampValue:(unsigned int)a3
{
  -[GEOCountdownData _readTimestampValues]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (unsigned)timestampValueAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_timestampValues;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCountdownData _readTimestampValues]((uint64_t)self);
  p_timestampValues = &self->_timestampValues;
  count = self->_timestampValues.count;
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
  return p_timestampValues->list[a3];
}

- (void)setTimestampValues:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Set();
}

- (void)_readAlternateFormatStrings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternateFormatStrings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)alternateFormatStrings
{
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  return self->_alternateFormatStrings;
}

- (void)setAlternateFormatStrings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *alternateFormatStrings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  alternateFormatStrings = self->_alternateFormatStrings;
  self->_alternateFormatStrings = v4;

}

- (void)clearAlternateFormatStrings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_alternateFormatStrings, "removeAllObjects");
}

- (void)addAlternateFormatString:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  -[GEOCountdownData _addNoFlagsAlternateFormatString:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsAlternateFormatString:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)alternateFormatStringsCount
{
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  return -[NSMutableArray count](self->_alternateFormatStrings, "count");
}

- (id)alternateFormatStringAtIndex:(unint64_t)a3
{
  -[GEOCountdownData _readAlternateFormatStrings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_alternateFormatStrings, "objectAtIndex:", a3);
}

+ (Class)alternateFormatStringType
{
  return (Class)objc_opt_class();
}

- (void)_readAlternateCountdownTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternateCountdownTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)alternateCountdownTypesCount
{
  -[GEOCountdownData _readAlternateCountdownTypes]((uint64_t)self);
  return self->_alternateCountdownTypes.count;
}

- (int)alternateCountdownTypes
{
  -[GEOCountdownData _readAlternateCountdownTypes]((uint64_t)self);
  return self->_alternateCountdownTypes.list;
}

- (void)clearAlternateCountdownTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Clear();
}

- (void)addAlternateCountdownType:(int)a3
{
  -[GEOCountdownData _readAlternateCountdownTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (int)alternateCountdownTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_alternateCountdownTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCountdownData _readAlternateCountdownTypes]((uint64_t)self);
  p_alternateCountdownTypes = &self->_alternateCountdownTypes;
  count = self->_alternateCountdownTypes.count;
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
  return p_alternateCountdownTypes->list[a3];
}

- (void)setAlternateCountdownTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Set();
}

- (id)alternateCountdownTypesAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C08000[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlternateCountdownTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMMINENT_ONLY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMMINENT_AND_UPCOMING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UPCOMING_ONLY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSeparator
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSeparator_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSeparator
{
  -[GEOCountdownData _readSeparator]((uint64_t)self);
  return self->_separator != 0;
}

- (NSString)separator
{
  -[GEOCountdownData _readSeparator]((uint64_t)self);
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void)_readTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCountdownDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasTimezone
{
  -[GEOCountdownData _readTimezone]((uint64_t)self);
  return self->_timezone != 0;
}

- (NSString)timezone
{
  -[GEOCountdownData _readTimezone]((uint64_t)self);
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOCountdownData;
  -[GEOCountdownData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCountdownData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCountdownData _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[7])
  {
    PBRepeatedUInt32NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("timestampValue");
    else
      v6 = CFSTR("timestamp_value");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (a1[9])
  {
    objc_msgSend(a1, "alternateFormatStrings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("alternateFormatString");
    else
      v8 = CFSTR("alternate_format_string");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1 + 3;
    if (a1[4])
    {
      v11 = 0;
      do
      {
        v12 = *(int *)(*v10 + 4 * v11);
        if (v12 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_1E1C08000[v12];
        }
        objc_msgSend(v9, "addObject:", v13);

        ++v11;
        v10 = a1 + 3;
      }
      while (v11 < a1[4]);
    }
    if (a2)
      v14 = CFSTR("alternateCountdownType");
    else
      v14 = CFSTR("alternate_countdown_type");
    objc_msgSend(v4, "setObject:forKey:", v9, v14);

  }
  objc_msgSend(a1, "separator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("separator"));

  objc_msgSend(a1, "timezone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("timezone"));

  v17 = (void *)a1[2];
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __46__GEOCountdownData__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCountdownData _dictionaryRepresentation:](self, 1);
}

void __46__GEOCountdownData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCountdownData)initWithDictionary:(id)a3
{
  return (GEOCountdownData *)-[GEOCountdownData _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("timestampValue");
      else
        v7 = CFSTR("timestamp_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v50;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v50 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v13);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v6, "addTimestampValue:", objc_msgSend(v14, "unsignedIntValue"));
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          }
          while (v11);
        }

      }
      if (a3)
        v15 = CFSTR("alternateFormatString");
      else
        v15 = CFSTR("alternate_format_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v46;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v46 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v21);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = (void *)objc_msgSend(v22, "copy");
                objc_msgSend(v6, "addAlternateFormatString:", v23);

              }
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v19);
        }

      }
      if (a3)
        v24 = CFSTR("alternateCountdownType");
      else
        v24 = CFSTR("alternate_countdown_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = v25;
        v40 = v5;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        if (!v27)
          goto LABEL_56;
        v28 = v27;
        v29 = *(_QWORD *)v42;
        while (1)
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v42 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v30);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = v31;
              if ((objc_msgSend(v32, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
              {
                v33 = 0;
              }
              else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("IMMINENT_ONLY")) & 1) != 0)
              {
                v33 = 1;
              }
              else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("IMMINENT_AND_UPCOMING")) & 1) != 0)
              {
                v33 = 2;
              }
              else if (objc_msgSend(v32, "isEqualToString:", CFSTR("UPCOMING_ONLY")))
              {
                v33 = 3;
              }
              else
              {
                v33 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_54;
              v33 = objc_msgSend(v31, "intValue");
            }
            objc_msgSend(v6, "addAlternateCountdownType:", v33, v39, v40, (_QWORD)v41);
LABEL_54:
            ++v30;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          if (!v28)
          {
LABEL_56:

            v25 = v39;
            v5 = v40;
            break;
          }
        }
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("separator"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = (void *)objc_msgSend(v34, "copy");
        objc_msgSend(v6, "setSeparator:", v35);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timezone"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = (void *)objc_msgSend(v36, "copy");
        objc_msgSend(v6, "setTimezone:", v37);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOCountdownData)initWithJSON:(id)a3
{
  return (GEOCountdownData *)-[GEOCountdownData _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1025;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1026;
    GEOCountdownDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCountdownDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCountdownDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7E) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCountdownData readAll:](self, "readAll:", 0);
    if (self->_timestampValues.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_timestampValues.count);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_alternateFormatStrings;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    if (self->_alternateCountdownTypes.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_alternateCountdownTypes.count);
    }
    if (self->_separator)
      PBDataWriterWriteStringField();
    if (self->_timezone)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
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
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  id *v14;
  id *v15;

  v15 = (id *)a3;
  -[GEOCountdownData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 24) = self->_readerMarkPos;
  *((_DWORD *)v15 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOCountdownData timestampValuesCount](self, "timestampValuesCount"))
  {
    objc_msgSend(v15, "clearTimestampValues");
    v4 = -[GEOCountdownData timestampValuesCount](self, "timestampValuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v15, "addTimestampValue:", -[GEOCountdownData timestampValueAtIndex:](self, "timestampValueAtIndex:", i));
    }
  }
  if (-[GEOCountdownData alternateFormatStringsCount](self, "alternateFormatStringsCount"))
  {
    objc_msgSend(v15, "clearAlternateFormatStrings");
    v7 = -[GEOCountdownData alternateFormatStringsCount](self, "alternateFormatStringsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOCountdownData alternateFormatStringAtIndex:](self, "alternateFormatStringAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addAlternateFormatString:", v10);

      }
    }
  }
  if (-[GEOCountdownData alternateCountdownTypesCount](self, "alternateCountdownTypesCount"))
  {
    objc_msgSend(v15, "clearAlternateCountdownTypes");
    v11 = -[GEOCountdownData alternateCountdownTypesCount](self, "alternateCountdownTypesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v15, "addAlternateCountdownType:", -[GEOCountdownData alternateCountdownTypeAtIndex:](self, "alternateCountdownTypeAtIndex:", k));
    }
  }
  if (self->_separator)
    objc_msgSend(v15, "setSeparator:");
  v14 = v15;
  if (self->_timezone)
  {
    objc_msgSend(v15, "setTimezone:");
    v14 = v15;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      GEOCountdownDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCountdownData readAll:](self, "readAll:", 0);
  PBRepeatedUInt32Copy();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_alternateFormatStrings;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addAlternateFormatString:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  v13 = -[NSString copyWithZone:](self->_separator, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = -[NSString copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v15;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *alternateFormatStrings;
  NSString *separator;
  NSString *timezone;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOCountdownData readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedUInt32IsEqual())
    && ((alternateFormatStrings = self->_alternateFormatStrings, !((unint64_t)alternateFormatStrings | v4[9]))
     || -[NSMutableArray isEqual:](alternateFormatStrings, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((separator = self->_separator, !((unint64_t)separator | v4[10]))
     || -[NSString isEqual:](separator, "isEqual:")))
  {
    timezone = self->_timezone;
    if ((unint64_t)timezone | v4[11])
      v8 = -[NSString isEqual:](timezone, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  -[GEOCountdownData readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt32Hash();
  v4 = -[NSMutableArray hash](self->_alternateFormatStrings, "hash");
  v5 = v4 ^ v3 ^ PBRepeatedInt32Hash();
  v6 = -[NSString hash](self->_separator, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_timezone, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "timestampValuesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOCountdownData addTimestampValue:](self, "addTimestampValue:", objc_msgSend(v4, "timestampValueAtIndex:", i));
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4[9];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[GEOCountdownData addAlternateFormatString:](self, "addAlternateFormatString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v13 = objc_msgSend(v4, "alternateCountdownTypesCount");
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[GEOCountdownData addAlternateCountdownType:](self, "addAlternateCountdownType:", objc_msgSend(v4, "alternateCountdownTypeAtIndex:", k, (_QWORD)v16));
  }
  if (v4[10])
    -[GEOCountdownData setSeparator:](self, "setSeparator:");
  if (v4[11])
    -[GEOCountdownData setTimezone:](self, "setTimezone:");

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
      GEOCountdownDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1029);
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
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOCountdownData readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_alternateFormatStrings, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSArray)timestamps
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  if (-[GEOCountdownData timestampValuesCount](self, "timestampValuesCount"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOCountdownData timestampValuesCount](self, "timestampValuesCount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[GEOCountdownData timestampValuesCount](self, "timestampValuesCount"))
    {
      v4 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GEOCountdownData timestampValueAtIndex:](self, "timestampValueAtIndex:", v4));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v5);

        ++v4;
      }
      while (v4 < -[GEOCountdownData timestampValuesCount](self, "timestampValuesCount"));
    }
    v6 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (int64_t)countdownType
{
  return 0;
}

- (NSDictionary)alternativeFormatStringsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, unint64_t);
  void *v11;
  GEOCountdownData *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[GEOCountdownData alternateFormatStringsCount](self, "alternateFormatStringsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCountdownData alternateFormatStrings](self, "alternateFormatStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __69__GEOCountdownData_GEOServicesExtras__alternativeFormatStringsByType__block_invoke;
  v11 = &unk_1E1C11B20;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return (NSDictionary *)v6;
}

void __69__GEOCountdownData_GEOServicesExtras__alternativeFormatStringsByType__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "alternateCountdownTypesCount") <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: idx < self.alternateCountdownTypesCount", v9, 2u);
    }
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "_convertFrom:", objc_msgSend(*(id *)(a1 + 32), "alternateCountdownTypeAtIndex:", a3));
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v8);

  }
}

- (int64_t)_convertFrom:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 1);
  if (v3 < 3)
    return v3 + 1;
  else
    return 0;
}

@end
