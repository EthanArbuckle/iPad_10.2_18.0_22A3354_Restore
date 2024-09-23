@implementation GEOAddress

- (BOOL)readFrom:(id)a3
{
  return GEOAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (id)addressDictionary
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[GEOAddress hasStructuredAddress](self, "hasStructuredAddress")
    || (-[GEOAddress structuredAddress](self, "structuredAddress"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "addressDictionary"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  }
  -[GEOAddress formattedAddressLines](self, "formattedAddressLines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("FormattedAddressLines"));

  return v4;
}

- (BOOL)hasStructuredAddress
{
  -[GEOAddress _readStructuredAddress]((uint64_t)self);
  return self->_structuredAddress != 0;
}

- (GEOStructuredAddress)structuredAddress
{
  -[GEOAddress _readStructuredAddress]((uint64_t)self);
  return self->_structuredAddress;
}

- (void)_readStructuredAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStructuredAddress_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsFormattedAddressLine:(uint64_t)a1
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

- (NSMutableArray)formattedAddressLines
{
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  return self->_formattedAddressLines;
}

- (void)_readFormattedAddressLines
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedAddressLines_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEOAddress)initWithAddressDictionary:(id)a3
{
  id v4;
  GEOAddress *v5;
  GEOStructuredAddress *v6;
  void *v7;
  GEOAddress *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOAddress;
  v5 = -[GEOAddress init](&v10, sel_init);
  if (v5)
  {
    v6 = -[GEOStructuredAddress initWithAddressDictionary:]([GEOStructuredAddress alloc], "initWithAddressDictionary:", v4);
    -[GEOAddress setStructuredAddress:](v5, "setStructuredAddress:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormattedAddressLines"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOAddress setFormattedAddressLines:](v5, "setFormattedAddressLines:", v7);

    v8 = v5;
  }

  return v5;
}

- (void)setStructuredAddress:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_structuredAddress, a3);
}

- (void)setFormattedAddressLines:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *formattedAddressLines;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  formattedAddressLines = self->_formattedAddressLines;
  self->_formattedAddressLines = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredAddress, 0);
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)geoAddressForPlaceData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[GEOAddressObject addressObjectForPlaceData:](GEOAddressObject, "addressObjectForPlaceData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOAddress)initWithData:(id)a3
{
  GEOAddress *v3;
  GEOAddress *v4;
  GEOAddress *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAddress;
  v3 = -[GEOAddress initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)formattedAddressLinesCount
{
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  return -[NSMutableArray count](self->_formattedAddressLines, "count");
}

- (GEOAddress)initWithUrlRepresentation:(id)a3
{
  id v4;
  GEOAddress *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOStructuredAddress *v9;
  GEOAddress *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOAddress;
  v5 = -[GEOAddress init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("addr"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOAddress setFormattedAddressLines:](v5, "setFormattedAddressLines:", v7);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("straddr"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GEOStructuredAddress initWithUrlRepresentation:]([GEOStructuredAddress alloc], "initWithUrlRepresentation:", v8);
      if (v9)
        -[GEOAddress setStructuredAddress:](v5, "setStructuredAddress:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (id)urlRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAddress formattedAddressLines](self, "formattedAddressLines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GEOAddress formattedAddressLines](self, "formattedAddressLines");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("addr"));

  }
  if (-[GEOAddress hasStructuredAddress](self, "hasStructuredAddress"))
  {
    -[GEOAddress structuredAddress](self, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("straddr"));

  }
  return v3;
}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;

  v7 = a3;
  -[GEOAddress formattedAddressLines](self, "formattedAddressLines");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "formattedAddressLines"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[GEOAddress formattedAddressLines](self, "formattedAddressLines");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedAddressLines");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_11;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (-[GEOAddress hasStructuredAddress](self, "hasStructuredAddress")
    || (objc_msgSend(v7, "hasStructuredAddress") & 1) != 0)
  {
    -[GEOAddress structuredAddress](self, "structuredAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "structuredAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "_isEquivalentURLRepresentationTo:", v12);

    if (!v9)
      goto LABEL_11;
    goto LABEL_10;
  }
  v10 = 1;
  if ((v9 & 1) != 0)
  {
LABEL_10:

  }
LABEL_11:
  if (!v8)

  return v10;
}

- (GEOAddress)initWithPostalAddress:(id)a3
{
  id v4;
  GEOAddress *v5;
  GEOStructuredAddress *v6;
  GEOAddress *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAddress;
  v5 = -[GEOAddress init](&v9, sel_init);
  if (v5)
  {
    v6 = -[GEOStructuredAddress initWithPostalAddress:]([GEOStructuredAddress alloc], "initWithPostalAddress:", v4);
    -[GEOAddress setStructuredAddress:](v5, "setStructuredAddress:", v6);

    v7 = v5;
  }

  return v5;
}

- (id)postalAddress
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[GEOAddress hasStructuredAddress](self, "hasStructuredAddress"))
  {
    -[GEOAddress structuredAddress](self, "structuredAddress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postalAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    v5 = 0;
  }
  -[GEOAddress formattedAddressLines](self, "formattedAddressLines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    if (!v5)
      v5 = objc_alloc_init((Class)getCNMutablePostalAddressClass());
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattedAddress:", v7);

  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (id)bestName
{
  void *v2;
  void *v3;

  -[GEOAddress formattedAddressLines](self, "formattedAddressLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
    goto LABEL_4;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {

LABEL_4:
    v3 = 0;
  }

  return v3;
}

- (GEOAddress)init
{
  GEOAddress *v2;
  GEOAddress *v3;
  GEOAddress *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAddress;
  v2 = -[GEOAddress init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)clearFormattedAddressLines
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_formattedAddressLines, "removeAllObjects");
}

- (void)addFormattedAddressLine:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  -[GEOAddress _addNoFlagsFormattedAddressLine:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (id)formattedAddressLineAtIndex:(unint64_t)a3
{
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_formattedAddressLines, "objectAtIndex:", a3);
}

+ (Class)formattedAddressLineType
{
  return (Class)objc_opt_class();
}

- (int)formattedAddressType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_formattedAddressType;
  else
    return 0;
}

- (void)setFormattedAddressType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_formattedAddressType = a3;
}

- (void)setHasFormattedAddressType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasFormattedAddressType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)formattedAddressTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C13890[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFormattedAddressType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FULL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHORT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPOKEN")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOAddress;
  -[GEOAddress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAddress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend((id)a1, "formattedAddressLines");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("formattedAddressLine"));

  }
  objc_msgSend((id)a1, "structuredAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("structuredAddress"));

  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v9 = *(int *)(a1 + 52);
    if (v9 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C13890[v9];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("formattedAddressType"));

  }
  v11 = *(void **)(a1 + 16);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __40__GEOAddress__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAddress)initWithDictionary:(id)a3
{
  return (GEOAddress *)-[GEOAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  GEOStructuredAddress *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("formattedAddressLine"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v22);
                objc_msgSend(a1, "addFormattedAddressLine:", v13);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v9);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("structuredAddress"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOStructuredAddress alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOStructuredAddress initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOStructuredAddress initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setStructuredAddress:", v16, (_QWORD)v22);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("formattedAddressType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("FULL")) & 1) != 0)
        {
          v20 = 0;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SHORT")) & 1) != 0)
        {
          v20 = 1;
        }
        else if (objc_msgSend(v19, "isEqualToString:", CFSTR("SPOKEN")))
        {
          v20 = 2;
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        v20 = objc_msgSend(v18, "intValue");
      }
      objc_msgSend(a1, "setFormattedAddressType:", v20, (_QWORD)v22);
      goto LABEL_31;
    }
  }
LABEL_32:

  return a1;
}

- (GEOAddress)initWithJSON:(id)a3
{
  return (GEOAddress *)-[GEOAddress _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_69;
    else
      v8 = (int *)&readAll__nonRecursiveTag_69;
    GEOAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressIsValid((char *)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEOAddress readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_formattedAddressLines;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_structuredAddress)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
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
  -[GEOAddress readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOAddress formattedAddressLinesCount](self, "formattedAddressLinesCount"))
  {
    objc_msgSend(v8, "clearFormattedAddressLines");
    v4 = -[GEOAddress formattedAddressLinesCount](self, "formattedAddressLinesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOAddress formattedAddressLineAtIndex:](self, "formattedAddressLineAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addFormattedAddressLine:", v7);

      }
    }
  }
  if (self->_structuredAddress)
    objc_msgSend(v8, "setStructuredAddress:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 13) = self->_formattedAddressType;
    *((_BYTE *)v8 + 56) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  PBUnknownFields *v16;
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
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAddress readAll:](self, "readAll:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_formattedAddressLines;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addFormattedAddressLine:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v14 = -[GEOStructuredAddress copyWithZone:](self->_structuredAddress, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_formattedAddressType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *formattedAddressLines;
  GEOStructuredAddress *structuredAddress;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOAddress readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  formattedAddressLines = self->_formattedAddressLines;
  if ((unint64_t)formattedAddressLines | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLines, "isEqual:"))
      goto LABEL_10;
  }
  structuredAddress = self->_structuredAddress;
  if ((unint64_t)structuredAddress | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOStructuredAddress isEqual:](structuredAddress, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_formattedAddressType == *((_DWORD *)v4 + 13))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOAddress readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_formattedAddressLines, "hash");
  v4 = -[GEOStructuredAddress hash](self->_structuredAddress, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_formattedAddressType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOStructuredAddress *structuredAddress;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[GEOAddress addFormattedAddressLine:](self, "addFormattedAddressLine:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  structuredAddress = self->_structuredAddress;
  v11 = *((_QWORD *)v4 + 4);
  if (structuredAddress)
  {
    if (v11)
      -[GEOStructuredAddress mergeFrom:](structuredAddress, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOAddress setStructuredAddress:](self, "setStructuredAddress:");
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_formattedAddressType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
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
      GEOAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_13);
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
  *(_BYTE *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAddress readAll:](self, "readAll:", 0);
    -[GEOStructuredAddress clearUnknownFields:](self->_structuredAddress, "clearUnknownFields:", 1);
  }
}

@end
