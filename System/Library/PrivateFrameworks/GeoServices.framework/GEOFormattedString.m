@implementation GEOFormattedString

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
      v8 = (int *)&readAll__recursiveTag_2143;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2144;
    GEOFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOFormattedStringCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOFormattedStringMetaData)metaData
{
  -[GEOFormattedString _readMetaData]((uint64_t)self);
  return self->_metaData;
}

- (GEOFormattedString)init
{
  GEOFormattedString *v2;
  GEOFormattedString *v3;
  GEOFormattedString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOFormattedString;
  v2 = -[GEOFormattedString init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSArray)formatStrings
{
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  return (NSArray *)self->_formatStrings;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormattedString _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (GEOServerConditionalString)alternativeString
{
  -[GEOFormattedString _readAlternativeString]((uint64_t)self);
  return (GEOServerConditionalString *)self->_alternativeString;
}

- (void)_readMetaData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetaData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readFormatStrings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormatStrings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readAlternativeString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternativeString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)a1, "formatStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("formatString");
    else
      v6 = CFSTR("format_string");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("formatArgument");
    else
      v15 = CFSTR("format_argument");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend((id)a1, "separators");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("separator"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("formatStyle");
    else
      v25 = CFSTR("format_style");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  objc_msgSend((id)a1, "alternativeString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("alternativeString");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("alternative_string");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  objc_msgSend((id)a1, "metaData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("metaData");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("meta_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  v34 = *(void **)(a1 + 16);
  if (v34)
  {
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __48__GEOFormattedString__dictionaryRepresentation___block_invoke;
      v41[3] = &unk_1E1C00600;
      v38 = v37;
      v42 = v38;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v41);
      v39 = v38;

      v36 = v39;
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (void)_addNoFlagsFormatStyle:(uint64_t)a1
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

- (void)_addNoFlagsFormatString:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (GEOFormattedString)initWithData:(id)a3
{
  GEOFormattedString *v3;
  GEOFormattedString *v4;
  GEOFormattedString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOFormattedString;
  v3 = -[GEOFormattedString initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setFormatStrings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *formatStrings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  formatStrings = self->_formatStrings;
  self->_formatStrings = v4;

}

- (void)clearFormatStrings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_formatStrings, "removeAllObjects");
}

- (void)addFormatString:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsFormatString:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (unint64_t)formatStringsCount
{
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  return -[NSMutableArray count](self->_formatStrings, "count");
}

- (id)formatStringAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readFormatStrings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_formatStrings, "objectAtIndex:", a3);
}

+ (Class)formatStringType
{
  return (Class)objc_opt_class();
}

- (void)_readFormatArguments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormatArguments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)formatArguments
{
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  return self->_formatArguments;
}

- (void)setFormatArguments:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *formatArguments;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  formatArguments = self->_formatArguments;
  self->_formatArguments = v4;

}

- (void)clearFormatArguments
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_formatArguments, "removeAllObjects");
}

- (void)addFormatArgument:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsFormatArgument:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsFormatArgument:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)formatArgumentsCount
{
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  return -[NSMutableArray count](self->_formatArguments, "count");
}

- (id)formatArgumentAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readFormatArguments]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_formatArguments, "objectAtIndex:", a3);
}

+ (Class)formatArgumentType
{
  return (Class)objc_opt_class();
}

- (void)_readSeparators
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSeparators_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSArray)separators
{
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  return (NSArray *)self->_separators;
}

- (void)setSeparators:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *separators;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  separators = self->_separators;
  self->_separators = v4;

}

- (void)clearSeparators
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_separators, "removeAllObjects");
}

- (void)addSeparator:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsSeparator:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsSeparator:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)separatorsCount
{
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  return -[NSMutableArray count](self->_separators, "count");
}

- (id)separatorAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readSeparators]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_separators, "objectAtIndex:", a3);
}

+ (Class)separatorType
{
  return (Class)objc_opt_class();
}

- (void)_readFormatStyles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormatStyles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSArray)formatStyles
{
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  return (NSArray *)self->_formatStyles;
}

- (void)setFormatStyles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *formatStyles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  formatStyles = self->_formatStyles;
  self->_formatStyles = v4;

}

- (void)clearFormatStyles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_formatStyles, "removeAllObjects");
}

- (void)addFormatStyle:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  -[GEOFormattedString _addNoFlagsFormatStyle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (unint64_t)formatStylesCount
{
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  return -[NSMutableArray count](self->_formatStyles, "count");
}

- (id)formatStyleAtIndex:(unint64_t)a3
{
  -[GEOFormattedString _readFormatStyles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_formatStyles, "objectAtIndex:", a3);
}

+ (Class)formatStyleType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAlternativeString
{
  -[GEOFormattedString _readAlternativeString]((uint64_t)self);
  return self->_alternativeString != 0;
}

- (void)setAlternativeString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_alternativeString, a3);
}

- (BOOL)hasMetaData
{
  -[GEOFormattedString _readMetaData]((uint64_t)self);
  return self->_metaData != 0;
}

- (void)setMetaData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_metaData, a3);
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
  v8.super_class = (Class)GEOFormattedString;
  -[GEOFormattedString description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOFormattedString dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)jsonRepresentation
{
  return -[GEOFormattedString _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOFormattedString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOFormattedString)initWithDictionary:(id)a3
{
  return (GEOFormattedString *)-[GEOFormattedString _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  GEOFormatArgument *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  GEOFormatStyle *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOConditionalFormattedString *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  GEOFormattedStringMetaData *v52;
  uint64_t v53;
  void *v54;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("formatString");
      else
        v6 = CFSTR("format_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v70 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = (void *)objc_msgSend(v13, "copy");
                objc_msgSend(a1, "addFormatString:", v14);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v15 = CFSTR("formatArgument");
      else
        v15 = CFSTR("format_argument");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v56 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v66 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = [GEOFormatArgument alloc];
                if ((a3 & 1) != 0)
                  v24 = -[GEOFormatArgument initWithJSON:](v23, "initWithJSON:", v22);
                else
                  v24 = -[GEOFormatArgument initWithDictionary:](v23, "initWithDictionary:", v22);
                v25 = (void *)v24;
                objc_msgSend(a1, "addFormatArgument:", v24);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
          }
          while (v19);
        }

        v5 = v56;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("separator"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v62;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v62 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = (void *)objc_msgSend(v32, "copy");
                objc_msgSend(a1, "addSeparator:", v33);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
          }
          while (v29);
        }

        v5 = v56;
      }

      if (a3)
        v34 = CFSTR("formatStyle");
      else
        v34 = CFSTR("format_style");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v58;
          do
          {
            for (m = 0; m != v38; ++m)
            {
              if (*(_QWORD *)v58 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOFormatStyle alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOFormatStyle initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOFormatStyle initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = (void *)v43;
                objc_msgSend(a1, "addFormatStyle:", v43);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
          }
          while (v38);
        }

        v5 = v56;
      }

      if (a3)
        v45 = CFSTR("alternativeString");
      else
        v45 = CFSTR("alternative_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = [GEOConditionalFormattedString alloc];
        if ((a3 & 1) != 0)
          v48 = -[GEOConditionalFormattedString initWithJSON:](v47, "initWithJSON:", v46);
        else
          v48 = -[GEOConditionalFormattedString initWithDictionary:](v47, "initWithDictionary:", v46);
        v49 = (void *)v48;
        objc_msgSend(a1, "setAlternativeString:", v48);

      }
      if (a3)
        v50 = CFSTR("metaData");
      else
        v50 = CFSTR("meta_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = [GEOFormattedStringMetaData alloc];
        if ((a3 & 1) != 0)
          v53 = -[GEOFormattedStringMetaData initWithJSON:](v52, "initWithJSON:", v51);
        else
          v53 = -[GEOFormattedStringMetaData initWithDictionary:](v52, "initWithDictionary:", v51);
        v54 = (void *)v53;
        objc_msgSend(a1, "setMetaData:", v53);

      }
    }
  }

  return a1;
}

- (GEOFormattedString)initWithJSON:(id)a3
{
  return (GEOFormattedString *)-[GEOFormattedString _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormattedStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormattedStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  PBDataReader *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOFormattedStringIsDirty((uint64_t)self) & 1) == 0)
  {
    v22 = self->_reader;
    objc_sync_enter(v22);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v23);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOFormattedString readAll:](self, "readAll:", 0);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = self->_formatStrings;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v37;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v7);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = self->_formatArguments;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v11);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_separators;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v29;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v15);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = self->_formatStyles;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
      }
      while (v19);
    }

    if (self->_alternativeString)
      PBDataWriterWriteSubmessage();
    if (self->_metaData)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id *v20;
  id *v21;

  v21 = (id *)a3;
  -[GEOFormattedString readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v21 + 1, self->_reader);
  *((_DWORD *)v21 + 18) = self->_readerMarkPos;
  *((_DWORD *)v21 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOFormattedString formatStringsCount](self, "formatStringsCount"))
  {
    objc_msgSend(v21, "clearFormatStrings");
    v4 = -[GEOFormattedString formatStringsCount](self, "formatStringsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOFormattedString formatStringAtIndex:](self, "formatStringAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addFormatString:", v7);

      }
    }
  }
  if (-[GEOFormattedString formatArgumentsCount](self, "formatArgumentsCount"))
  {
    objc_msgSend(v21, "clearFormatArguments");
    v8 = -[GEOFormattedString formatArgumentsCount](self, "formatArgumentsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOFormattedString formatArgumentAtIndex:](self, "formatArgumentAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addFormatArgument:", v11);

      }
    }
  }
  if (-[GEOFormattedString separatorsCount](self, "separatorsCount"))
  {
    objc_msgSend(v21, "clearSeparators");
    v12 = -[GEOFormattedString separatorsCount](self, "separatorsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOFormattedString separatorAtIndex:](self, "separatorAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSeparator:", v15);

      }
    }
  }
  if (-[GEOFormattedString formatStylesCount](self, "formatStylesCount"))
  {
    objc_msgSend(v21, "clearFormatStyles");
    v16 = -[GEOFormattedString formatStylesCount](self, "formatStylesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOFormattedString formatStyleAtIndex:](self, "formatStyleAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addFormatStyle:", v19);

      }
    }
  }
  if (self->_alternativeString)
    objc_msgSend(v21, "setAlternativeString:");
  v20 = v21;
  if (self->_metaData)
  {
    objc_msgSend(v21, "setMetaData:");
    v20 = v21;
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
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOFormattedStringReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOFormattedString readAll:](self, "readAll:", 0);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = self->_formatStrings;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v46;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFormatString:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v9);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = self->_formatArguments;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFormatArgument:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v14);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = self->_separators;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v38;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v21), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSeparator:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v19);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = self->_formatStyles;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addFormatStyle:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v24);
  }

  v28 = -[GEOConditionalFormattedString copyWithZone:](self->_alternativeString, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v28;

  v30 = -[GEOFormattedStringMetaData copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v30;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *formatStrings;
  NSMutableArray *formatArguments;
  NSMutableArray *separators;
  NSMutableArray *formatStyles;
  GEOConditionalFormattedString *alternativeString;
  GEOFormattedStringMetaData *metaData;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOFormattedString readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         formatStrings = self->_formatStrings,
         !((unint64_t)formatStrings | v4[5]))
     || -[NSMutableArray isEqual:](formatStrings, "isEqual:"))
    && ((formatArguments = self->_formatArguments, !((unint64_t)formatArguments | v4[4]))
     || -[NSMutableArray isEqual:](formatArguments, "isEqual:"))
    && ((separators = self->_separators, !((unint64_t)separators | v4[8]))
     || -[NSMutableArray isEqual:](separators, "isEqual:"))
    && ((formatStyles = self->_formatStyles, !((unint64_t)formatStyles | v4[6]))
     || -[NSMutableArray isEqual:](formatStyles, "isEqual:"))
    && ((alternativeString = self->_alternativeString, !((unint64_t)alternativeString | v4[3]))
     || -[GEOConditionalFormattedString isEqual:](alternativeString, "isEqual:")))
  {
    metaData = self->_metaData;
    if ((unint64_t)metaData | v4[7])
      v11 = -[GEOFormattedStringMetaData isEqual:](metaData, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[GEOFormattedString readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_formatStrings, "hash");
  v4 = -[NSMutableArray hash](self->_formatArguments, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_separators, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_formatStyles, "hash");
  v7 = -[GEOConditionalFormattedString hash](self->_alternativeString, "hash");
  return v6 ^ v7 ^ -[GEOFormattedStringMetaData hash](self->_metaData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  GEOConditionalFormattedString *alternativeString;
  id v26;
  GEOFormattedStringMetaData *metaData;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v4[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        -[GEOFormattedString addFormatString:](self, "addFormatString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v7);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v4[4];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        -[GEOFormattedString addFormatArgument:](self, "addFormatArgument:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v12);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = v4[8];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        -[GEOFormattedString addSeparator:](self, "addSeparator:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v17);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v4[6];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        -[GEOFormattedString addFormatStyle:](self, "addFormatStyle:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m), (_QWORD)v29);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v22);
  }

  alternativeString = self->_alternativeString;
  v26 = v4[3];
  if (alternativeString)
  {
    if (v26)
      -[GEOConditionalFormattedString mergeFrom:](alternativeString, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOFormattedString setAlternativeString:](self, "setAlternativeString:");
  }
  metaData = self->_metaData;
  v28 = v4[7];
  if (metaData)
  {
    if (v28)
      -[GEOFormattedStringMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEOFormattedString setMetaData:](self, "setMetaData:");
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
      GEOFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2147);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOFormattedString readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_formatArguments;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_formatStyles;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[GEOConditionalFormattedString clearUnknownFields:](self->_alternativeString, "clearUnknownFields:", 1);
    -[GEOFormattedStringMetaData clearUnknownFields:](self->_metaData, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separators, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_formatStyles, 0);
  objc_storeStrong((id *)&self->_formatStrings, 0);
  objc_storeStrong((id *)&self->_formatArguments, 0);
  objc_storeStrong((id *)&self->_alternativeString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOFormattedString)initWithString:(id)a3
{
  id v4;
  GEOFormattedString *v5;
  void *v6;
  GEOFormattedString *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOFormattedString;
  v5 = -[GEOFormattedString init](&v9, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    -[GEOFormattedString addFormatString:](v5, "addFormatString:", v6);

    v7 = v5;
  }

  return v5;
}

- (NSString)basicString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[GEOFormattedString formatArguments](self, "formatArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[GEOFormattedString formatStrings](self, "formatStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (GEOFormattedString)stringWithDefaultValues
{
  GEOFormattedString *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  id obj;
  GEOFormattedString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v2 = self;
  v47 = *MEMORY[0x1E0C80C00];
  -[GEOFormattedString formatArguments](self, "formatArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GEOFormattedString formatStrings](v2, "formatStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[GEOFormattedString formatStrings](v2, "formatStrings");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v40;
      v30 = v2;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v8, "length"))
          {
            v33 = i;
            v9 = (void *)objc_msgSend(v8, "mutableCopy");
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            -[GEOFormattedString formatArguments](v2, "formatArguments");
            v34 = (id)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v36;
              do
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v36 != v12)
                    objc_enumerationMutation(v34);
                  v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                  objc_msgSend(v14, "stringWithDefaultValues");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "token");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v16)
                  {
                    v17 = objc_msgSend(v9, "rangeOfString:", v16);
                    if (v17 != 0x7FFFFFFFFFFFFFFFLL && v18 != 0)
                    {
                      v20 = v17;
                      do
                      {
                        if (v15)
                        {
                          objc_msgSend(v9, "replaceCharactersInRange:withString:", v20, v18, v15);
                        }
                        else
                        {
                          objc_msgSend(v9, "deleteCharactersInRange:", v20, v18);
                          GEOGetGEOFormattedStringLog();
                          v21 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138477827;
                            v44 = v14;
                            _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Error formatting argument %{private}@", buf, 0xCu);
                          }

                        }
                        v22 = objc_msgSend(v9, "rangeOfString:", v16);
                        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
                          break;
                        v20 = v22;
                      }
                      while (v18);
                    }
                  }
                  else
                  {
                    GEOGetGEOFormattedStringLog();
                    v23 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138477827;
                      v44 = v14;
                      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Format argument %{private}@ has no token", buf, 0xCu);
                    }

                  }
                }
                v11 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
              }
              while (v11);
            }

            if (objc_msgSend(v9, "length"))
              objc_msgSend(v28, "addObject:", v9);

            v2 = v30;
            i = v33;
          }
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v32);
    }

    v24 = v28;
    -[GEOFormattedString _joinFormattedComponentsWithSeparators:](v2, "_joinFormattedComponentsWithSeparators:", v28);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOFormattedString formatStrings](v2, "formatStrings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v25;

  return (GEOFormattedString *)v26;
}

- (id)_joinFormattedComponentsWithSeparators:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v7);
      if (v6 < objc_msgSend(v4, "count") - 1)
      {
        -[GEOFormattedString separators](self, "separators");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 >= objc_msgSend(v8, "count"))
          goto LABEL_7;
        -[GEOFormattedString separators](self, "separators");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10)
          break;
      }
LABEL_8:

      if (++v6 >= objc_msgSend(v4, "count"))
        goto LABEL_9;
    }
    objc_msgSend(v5, "appendString:", v10);
    v8 = (void *)v10;
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (BOOL)isPrivate
{
  void *v3;
  BOOL v4;

  if (!-[GEOFormattedString hasMetaData](self, "hasMetaData"))
    return 1;
  -[GEOFormattedString metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "spokenPrivacyFilterType") != 1;

  return v4;
}

@end
