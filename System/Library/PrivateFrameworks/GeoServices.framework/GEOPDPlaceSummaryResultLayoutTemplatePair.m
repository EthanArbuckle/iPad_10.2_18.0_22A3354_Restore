@implementation GEOPDPlaceSummaryResultLayoutTemplatePair

- (GEOPDPlaceSummaryResultLayoutTemplatePair)init
{
  GEOPDPlaceSummaryResultLayoutTemplatePair *v2;
  GEOPDPlaceSummaryResultLayoutTemplatePair *v3;
  GEOPDPlaceSummaryResultLayoutTemplatePair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  v2 = -[GEOPDPlaceSummaryResultLayoutTemplatePair init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithData:(id)a3
{
  GEOPDPlaceSummaryResultLayoutTemplatePair *v3;
  GEOPDPlaceSummaryResultLayoutTemplatePair *v4;
  GEOPDPlaceSummaryResultLayoutTemplatePair *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  v3 = -[GEOPDPlaceSummaryResultLayoutTemplatePair initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  -[GEOPDPlaceSummaryResultLayoutTemplatePair dealloc](&v3, sel_dealloc);
}

- (void)_readMapsIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsIds_tags_1065);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)mapsIds
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  return self->_mapsIds;
}

- (void)setMapsIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mapsIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  mapsIds = self->_mapsIds;
  self->_mapsIds = v4;

}

- (void)clearMapsIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_mapsIds, "removeAllObjects");
}

- (void)addMapsId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _addNoFlagsMapsId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsMapsId:(uint64_t)a1
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

- (unint64_t)mapsIdsCount
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  return -[NSMutableArray count](self->_mapsIds, "count");
}

- (id)mapsIdAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_mapsIds, "objectAtIndex:", a3);
}

+ (Class)mapsIdType
{
  return (Class)objc_opt_class();
}

- (void)_readLayoutTemplate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLayoutTemplate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLayoutTemplate
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readLayoutTemplate]((uint64_t)self);
  return self->_layoutTemplate != 0;
}

- (GEOPDPlaceSummaryLayoutTemplate)layoutTemplate
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readLayoutTemplate]((uint64_t)self);
  return self->_layoutTemplate;
}

- (void)setLayoutTemplate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_layoutTemplate, a3);
}

- (void)_readPlaceTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)placeTypesCount
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readPlaceTypes]((uint64_t)self);
  return self->_placeTypes.count;
}

- (int)placeTypes
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readPlaceTypes]((uint64_t)self);
  return self->_placeTypes.list;
}

- (void)clearPlaceTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addPlaceType:(int)a3
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readPlaceTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (int)placeTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_placeTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readPlaceTypes]((uint64_t)self);
  p_placeTypes = &self->_placeTypes;
  count = self->_placeTypes.count;
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
  return p_placeTypes->list[a3];
}

- (void)setPlaceTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Set();
}

- (id)placeTypesAsString:(int)a3
{
  __CFString *v3;
  id result;

  switch(a3)
  {
    case '#':
      v3 = CFSTR("TIME_ZONE");
      goto LABEL_3;
    case '$':
    case '%':
    case '&':
    case '\'':
    case '(':
    case ')':
    case '*':
    case '4':
    case '5':
    case '8':
    case ':':
    case ';':
    case '<':
    case '>':
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v3;
      break;
    case '+':
      result = CFSTR("SUB_LOCALITY");
      break;
    case ',':
      result = CFSTR("OCEAN");
      break;
    case '-':
      result = CFSTR("AOI");
      break;
    case '.':
      result = CFSTR("INLAND_WATER");
      break;
    case '/':
      result = CFSTR("BUSINESS");
      break;
    case '0':
      result = CFSTR("ISLAND");
      break;
    case '1':
      result = CFSTR("STREET");
      break;
    case '2':
      result = CFSTR("ADMIN");
      break;
    case '3':
      result = CFSTR("POSTAL");
      break;
    case '6':
      result = CFSTR("INTERSECTION");
      break;
    case '7':
      result = CFSTR("BUILDING");
      break;
    case '9':
      result = CFSTR("ADDRESS");
      break;
    case '=':
      result = CFSTR("CONTINENT");
      break;
    case '?':
      result = CFSTR("REGION");
      break;
    case '@':
      result = CFSTR("DIVISION");
      break;
    case 'A':
      result = CFSTR("PHYSICAL_FEATURE");
      break;
    default:
      v3 = CFSTR("UNKNOWN_PLACE_TYPE");
      switch(a3)
      {
        case 0:
          goto LABEL_3;
        case 1:
          result = CFSTR("COUNTRY");
          break;
        case 2:
          result = CFSTR("ADMINISTRATIVE_AREA");
          break;
        case 3:
          goto LABEL_9;
        case 4:
          result = CFSTR("SUB_ADMINISTRATIVE_AREA");
          break;
        default:
          if (a3 != 16)
            goto LABEL_9;
          result = CFSTR("LOCALITY");
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsPlaceTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
  {
    v4 = 64;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
  {
    v4 = 65;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  -[GEOPDPlaceSummaryResultLayoutTemplatePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryResultLayoutTemplatePair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryResultLayoutTemplatePair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("mapsId");
    else
      v13 = CFSTR("maps_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "layoutTemplate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("layoutTemplate");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("layout_template");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v20 = 0;
      do
      {
        v21 = *(unsigned int *)(*v19 + 4 * v20);
        switch((int)v21)
        {
          case '#':
            v22 = CFSTR("TIME_ZONE");
            break;
          case '$':
          case '%':
          case '&':
          case '\'':
          case '(':
          case ')':
          case '*':
          case '4':
          case '5':
          case '8':
          case ':':
          case ';':
          case '<':
          case '>':
LABEL_31:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
          case '+':
            v22 = CFSTR("SUB_LOCALITY");
            break;
          case ',':
            v22 = CFSTR("OCEAN");
            break;
          case '-':
            v22 = CFSTR("AOI");
            break;
          case '.':
            v22 = CFSTR("INLAND_WATER");
            break;
          case '/':
            v22 = CFSTR("BUSINESS");
            break;
          case '0':
            v22 = CFSTR("ISLAND");
            break;
          case '1':
            v22 = CFSTR("STREET");
            break;
          case '2':
            v22 = CFSTR("ADMIN");
            break;
          case '3':
            v22 = CFSTR("POSTAL");
            break;
          case '6':
            v22 = CFSTR("INTERSECTION");
            break;
          case '7':
            v22 = CFSTR("BUILDING");
            break;
          case '9':
            v22 = CFSTR("ADDRESS");
            break;
          case '=':
            v22 = CFSTR("CONTINENT");
            break;
          case '?':
            v22 = CFSTR("REGION");
            break;
          case '@':
            v22 = CFSTR("DIVISION");
            break;
          case 'A':
            v22 = CFSTR("PHYSICAL_FEATURE");
            break;
          default:
            v22 = CFSTR("UNKNOWN_PLACE_TYPE");
            switch((int)v21)
            {
              case 0:
                goto LABEL_50;
              case 1:
                v22 = CFSTR("COUNTRY");
                break;
              case 2:
                v22 = CFSTR("ADMINISTRATIVE_AREA");
                break;
              case 3:
                goto LABEL_31;
              case 4:
                v22 = CFSTR("SUB_ADMINISTRATIVE_AREA");
                break;
              default:
                if ((_DWORD)v21 != 16)
                  goto LABEL_31;
                v22 = CFSTR("LOCALITY");
                break;
            }
            break;
        }
LABEL_50:
        objc_msgSend(v18, "addObject:", v22);

        ++v20;
        v19 = (_QWORD *)(a1 + 16);
      }
      while (v20 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v23 = CFSTR("placeType");
    else
      v23 = CFSTR("place_type");
    objc_msgSend(v4, "setObject:forKey:", v18, v23);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryResultLayoutTemplatePair _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryResultLayoutTemplatePair *)-[GEOPDPlaceSummaryResultLayoutTemplatePair _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t v14;
  GEOPDMapsIdentifier *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOPDPlaceSummaryLayoutTemplate *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  uint64_t v32;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("mapsId");
      else
        v7 = CFSTR("maps_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v41 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = [GEOPDMapsIdentifier alloc];
                if ((a3 & 1) != 0)
                  v16 = -[GEOPDMapsIdentifier initWithJSON:](v15, "initWithJSON:", v14);
                else
                  v16 = -[GEOPDMapsIdentifier initWithDictionary:](v15, "initWithDictionary:", v14);
                v17 = (void *)v16;
                objc_msgSend(v6, "addMapsId:", v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          }
          while (v11);
        }

        v5 = v35;
      }

      if (a3)
        v18 = CFSTR("layoutTemplate");
      else
        v18 = CFSTR("layout_template");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOPDPlaceSummaryLayoutTemplate alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOPDPlaceSummaryLayoutTemplate initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOPDPlaceSummaryLayoutTemplate initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(v6, "setLayoutTemplate:", v21);

      }
      if (a3)
        v23 = CFSTR("placeType");
      else
        v23 = CFSTR("place_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = v24;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (!v26)
          goto LABEL_89;
        v27 = v26;
        v28 = *(_QWORD *)v37;
        while (1)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v37 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = v30;
              if ((objc_msgSend(v31, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
              {
                v32 = 0;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
              {
                v32 = 1;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
              {
                v32 = 2;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
              {
                v32 = 4;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
              {
                v32 = 16;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
              {
                v32 = 35;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
              {
                v32 = 43;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
              {
                v32 = 44;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
              {
                v32 = 45;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
              {
                v32 = 46;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
              {
                v32 = 47;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
              {
                v32 = 48;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
              {
                v32 = 49;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
              {
                v32 = 50;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
              {
                v32 = 51;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
              {
                v32 = 54;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
              {
                v32 = 55;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
              {
                v32 = 57;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
              {
                v32 = 61;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
              {
                v32 = 63;
              }
              else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
              {
                v32 = 64;
              }
              else if (objc_msgSend(v31, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
              {
                v32 = 65;
              }
              else
              {
                v32 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v32 = objc_msgSend(v30, "intValue");
            }
            objc_msgSend(v6, "addPlaceType:", v32, v34);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (!v27)
          {
LABEL_89:

            v24 = v34;
            v5 = v35;
            break;
          }
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

- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryResultLayoutTemplatePair *)-[GEOPDPlaceSummaryResultLayoutTemplatePair _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1075;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1076;
    GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceSummaryResultLayoutTemplatePairCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryResultLayoutTemplatePairIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryResultLayoutTemplatePairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_placeTypes;
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
  if (self->_reader && (_GEOPDPlaceSummaryResultLayoutTemplatePairIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPlaceSummaryResultLayoutTemplatePair readAll:](self, "readAll:", 0);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_mapsIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    if (self->_layoutTemplate)
      PBDataWriterWriteSubmessage();
    p_placeTypes = &self->_placeTypes;
    if (p_placeTypes->count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < p_placeTypes->count);
    }
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readLayoutTemplate]((uint64_t)self);
  if (-[GEOPDPlaceSummaryLayoutTemplate hasGreenTeaWithValue:](self->_layoutTemplate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_mapsIds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_13;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_13:

  return v5;
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
  id *v11;

  v11 = (id *)a3;
  -[GEOPDPlaceSummaryResultLayoutTemplatePair readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPDPlaceSummaryResultLayoutTemplatePair mapsIdsCount](self, "mapsIdsCount"))
  {
    objc_msgSend(v11, "clearMapsIds");
    v4 = -[GEOPDPlaceSummaryResultLayoutTemplatePair mapsIdsCount](self, "mapsIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDPlaceSummaryResultLayoutTemplatePair mapsIdAtIndex:](self, "mapsIdAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addMapsId:", v7);

      }
    }
  }
  if (self->_layoutTemplate)
    objc_msgSend(v11, "setLayoutTemplate:");
  if (-[GEOPDPlaceSummaryResultLayoutTemplatePair placeTypesCount](self, "placeTypesCount"))
  {
    objc_msgSend(v11, "clearPlaceTypes");
    v8 = -[GEOPDPlaceSummaryResultLayoutTemplatePair placeTypesCount](self, "placeTypesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v11, "addPlaceType:", -[GEOPDPlaceSummaryResultLayoutTemplatePair placeTypeAtIndex:](self, "placeTypeAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceSummaryResultLayoutTemplatePairReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceSummaryResultLayoutTemplatePair readAll:](self, "readAll:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_mapsIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v5, "addMapsId:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[GEOPDPlaceSummaryLayoutTemplate copyWithZone:](self->_layoutTemplate, "copyWithZone:", a3);
  v14 = (void *)v5[5];
  v5[5] = v13;

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *mapsIds;
  GEOPDPlaceSummaryLayoutTemplate *layoutTemplate;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDPlaceSummaryResultLayoutTemplatePair readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         mapsIds = self->_mapsIds,
         !((unint64_t)mapsIds | v4[6]))
     || -[NSMutableArray isEqual:](mapsIds, "isEqual:"))
    && ((layoutTemplate = self->_layoutTemplate, !((unint64_t)layoutTemplate | v4[5]))
     || -[GEOPDPlaceSummaryLayoutTemplate isEqual:](layoutTemplate, "isEqual:")))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  -[GEOPDPlaceSummaryResultLayoutTemplatePair readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_mapsIds, "hash");
  v4 = -[GEOPDPlaceSummaryLayoutTemplate hash](self->_layoutTemplate, "hash") ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOPDPlaceSummaryLayoutTemplate *layoutTemplate;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDPlaceSummaryResultLayoutTemplatePair addMapsId:](self, "addMapsId:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  layoutTemplate = self->_layoutTemplate;
  v11 = v4[5];
  if (layoutTemplate)
  {
    if (v11)
      -[GEOPDPlaceSummaryLayoutTemplate mergeFrom:](layoutTemplate, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOPDPlaceSummaryResultLayoutTemplatePair setLayoutTemplate:](self, "setLayoutTemplate:");
  }
  v12 = objc_msgSend(v4, "placeTypesCount", (_QWORD)v15);
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
      -[GEOPDPlaceSummaryResultLayoutTemplatePair addPlaceType:](self, "addPlaceType:", objc_msgSend(v4, "placeTypeAtIndex:", j));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsIds, 0);
  objc_storeStrong((id *)&self->_layoutTemplate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSArray)mapItemIdentifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[GEOPDPlaceSummaryResultLayoutTemplatePair mapsIds](self, "mapsIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (NSArray *)0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__71;
  v13 = __Block_byref_object_dispose__71;
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[GEOPDPlaceSummaryResultLayoutTemplatePair mapsIdsCount](self, "mapsIdsCount"));
  -[GEOPDPlaceSummaryResultLayoutTemplatePair mapsIds](self, "mapsIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__GEOPDPlaceSummaryResultLayoutTemplatePair_Extras__mapItemIdentifiers__block_invoke;
  v8[3] = &unk_1E1C07078;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (void *)objc_msgSend((id)v10[5], "copy");
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __71__GEOPDPlaceSummaryResultLayoutTemplatePair_Extras__mapItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOMapItemIdentifier *v4;
  GEOMapItemIdentifier *v5;

  v3 = a2;
  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    v4 = v5;
  }

}

- (NSArray)geoMapItemPlaceTypes
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;

  v3 = -[GEOPDPlaceSummaryResultLayoutTemplatePair placeTypesCount](self, "placeTypesCount");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _MapItemPlaceTypeForPDPlaceType(-[GEOPDPlaceSummaryResultLayoutTemplatePair placeTypeAtIndex:](self, "placeTypeAtIndex:", i)));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    v8 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

@end
