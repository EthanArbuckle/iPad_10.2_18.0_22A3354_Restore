@implementation GEORevealedPlaceCardModuleButton

+ (id)moduleButtonForType:(int)a3
{
  uint64_t v3;
  GEORevealedPlaceCardModuleButton *v4;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    v4 = objc_alloc_init(GEORevealedPlaceCardModuleButton);
    -[GEORevealedPlaceCardModuleButton setType:](v4, "setType:", v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (GEORevealedPlaceCardModuleButton)init
{
  GEORevealedPlaceCardModuleButton *v2;
  GEORevealedPlaceCardModuleButton *v3;
  GEORevealedPlaceCardModuleButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORevealedPlaceCardModuleButton;
  v2 = -[GEORevealedPlaceCardModuleButton init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORevealedPlaceCardModuleButton)initWithData:(id)a3
{
  GEORevealedPlaceCardModuleButton *v3;
  GEORevealedPlaceCardModuleButton *v4;
  GEORevealedPlaceCardModuleButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORevealedPlaceCardModuleButton;
  v3 = -[GEORevealedPlaceCardModuleButton initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("MODULE_BUTTON_TYPE_UNKNOWN");
  switch(a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
      v3 = CFSTR("MODULE_BUTTON_TYPE_ADD_TO_GUIDES");
LABEL_3:
      result = v3;
      break;
    case 2:
      result = CFSTR("MODULE_BUTTON_TYPE_REPORT_AN_ISSUE");
      break;
    case 3:
      result = CFSTR("MODULE_BUTTON_TYPE_SHARE");
      break;
    case 4:
      result = CFSTR("MODULE_BUTTON_TYPE_CALL");
      break;
    case 5:
      result = CFSTR("MODULE_BUTTON_TYPE_MESSAGE");
      break;
    case 6:
      result = CFSTR("MODULE_BUTTON_TYPE_WEBSITE");
      break;
    case 7:
      result = CFSTR("MODULE_BUTTON_TYPE_QUICK_LINK");
      break;
    case 8:
      result = CFSTR("MODULE_BUTTON_TYPE_GROUP");
      break;
    case 9:
      result = CFSTR("MODULE_BUTTON_TYPE_DIRECTIONS");
      break;
    case 10:
      result = CFSTR("MODULE_BUTTON_TYPE_FLYOVER");
      break;
    default:
      switch(a3)
      {
        case '2':
          result = CFSTR("MODULE_BUTTON_TYPE_CLAIM_PLACE");
          break;
        case '3':
          result = CFSTR("MODULE_BUTTON_TYPE_ADD_PHOTOS");
          break;
        case '4':
          result = CFSTR("MODULE_BUTTON_TYPE_ADD_FAVORITES");
          break;
        case '5':
          result = CFSTR("MODULE_BUTTON_TYPE_ADD_HOURS");
          break;
        case '6':
          result = CFSTR("MODULE_BUTTON_TYPE_ADD_DETAILS");
          break;
        case '7':
          result = CFSTR("MODULE_BUTTON_TYPE_ADD_PHONE");
          break;
        case '8':
          result = CFSTR("MODULE_BUTTON_TYPE_ADD_WEBSITE");
          break;
        case '9':
          result = CFSTR("MODULE_BUTTON_TYPE_FINDMY");
          break;
        case ':':
          result = CFSTR("MODULE_BUTTON_TYPE_LOCATION");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
      }
      break;
  }
  return result;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_TO_GUIDES")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_REPORT_AN_ISSUE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_SHARE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_CALL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_MESSAGE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_WEBSITE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_QUICK_LINK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_GROUP")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_DIRECTIONS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_CLAIM_PLACE")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_PHOTOS")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_FAVORITES")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_HOURS")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_DETAILS")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_PHONE")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_WEBSITE")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_FINDMY")) & 1) != 0)
  {
    v4 = 57;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_LOCATION")))
  {
    v4 = 58;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void)setIsGroup:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_isGroup = a3;
}

- (void)setHasIsGroup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsGroup
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleButtonReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_9026);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasMetadata
{
  -[GEORevealedPlaceCardModuleButton _readMetadata]((uint64_t)self);
  return self->_metadata != 0;
}

- (NSString)metadata
{
  -[GEORevealedPlaceCardModuleButton _readMetadata]((uint64_t)self);
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)_readVendor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleButtonReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVendor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasVendor
{
  -[GEORevealedPlaceCardModuleButton _readVendor]((uint64_t)self);
  return self->_vendor != 0;
}

- (NSString)vendor
{
  -[GEORevealedPlaceCardModuleButton _readVendor]((uint64_t)self);
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_vendor, a3);
}

- (int)linkType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_linkType;
  else
    return 0;
}

- (void)setLinkType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasLinkType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)linkTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C237F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLinkType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_QUICK_LINK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_APP_CLIP_LINK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_APP_EXTENSION")))
  {
    v4 = 3;
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
  v8.super_class = (Class)GEORevealedPlaceCardModuleButton;
  -[GEORevealedPlaceCardModuleButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORevealedPlaceCardModuleButton dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORevealedPlaceCardModuleButton _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 56);
    if ((v5 & 2) != 0)
    {
      v6 = *(_DWORD *)(a1 + 48);
      v7 = CFSTR("MODULE_BUTTON_TYPE_UNKNOWN");
      switch(v6)
      {
        case 0:
          break;
        case 1:
          v7 = CFSTR("MODULE_BUTTON_TYPE_ADD_TO_GUIDES");
          break;
        case 2:
          v7 = CFSTR("MODULE_BUTTON_TYPE_REPORT_AN_ISSUE");
          break;
        case 3:
          v7 = CFSTR("MODULE_BUTTON_TYPE_SHARE");
          break;
        case 4:
          v7 = CFSTR("MODULE_BUTTON_TYPE_CALL");
          break;
        case 5:
          v7 = CFSTR("MODULE_BUTTON_TYPE_MESSAGE");
          break;
        case 6:
          v7 = CFSTR("MODULE_BUTTON_TYPE_WEBSITE");
          break;
        case 7:
          v7 = CFSTR("MODULE_BUTTON_TYPE_QUICK_LINK");
          break;
        case 8:
          v7 = CFSTR("MODULE_BUTTON_TYPE_GROUP");
          break;
        case 9:
          v7 = CFSTR("MODULE_BUTTON_TYPE_DIRECTIONS");
          break;
        case 10:
          v7 = CFSTR("MODULE_BUTTON_TYPE_FLYOVER");
          break;
        default:
          switch(v6)
          {
            case '2':
              v7 = CFSTR("MODULE_BUTTON_TYPE_CLAIM_PLACE");
              break;
            case '3':
              v7 = CFSTR("MODULE_BUTTON_TYPE_ADD_PHOTOS");
              break;
            case '4':
              v7 = CFSTR("MODULE_BUTTON_TYPE_ADD_FAVORITES");
              break;
            case '5':
              v7 = CFSTR("MODULE_BUTTON_TYPE_ADD_HOURS");
              break;
            case '6':
              v7 = CFSTR("MODULE_BUTTON_TYPE_ADD_DETAILS");
              break;
            case '7':
              v7 = CFSTR("MODULE_BUTTON_TYPE_ADD_PHONE");
              break;
            case '8':
              v7 = CFSTR("MODULE_BUTTON_TYPE_ADD_WEBSITE");
              break;
            case '9':
              v7 = CFSTR("MODULE_BUTTON_TYPE_FINDMY");
              break;
            case ':':
              v7 = CFSTR("MODULE_BUTTON_TYPE_LOCATION");
              break;
            default:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 48));
              v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
          break;
      }
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

      v5 = *(_BYTE *)(a1 + 56);
    }
    if ((v5 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("isGroup");
      else
        v9 = CFSTR("is_group");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    objc_msgSend((id)a1, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("metadata"));

    objc_msgSend((id)a1, "vendor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("vendor"));

    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      v12 = *(int *)(a1 + 44);
      if (v12 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E1C237F0[v12];
      }
      if (a2)
        v14 = CFSTR("linkType");
      else
        v14 = CFSTR("link_type");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

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
  return -[GEORevealedPlaceCardModuleButton _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORevealedPlaceCardModuleButton)initWithDictionary:(id)a3
{
  return (GEORevealedPlaceCardModuleButton *)-[GEORevealedPlaceCardModuleButton _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_UNKNOWN")) & 1) != 0)
        {
          v8 = 0;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_TO_GUIDES")) & 1) != 0)
        {
          v8 = 1;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_REPORT_AN_ISSUE")) & 1) != 0)
        {
          v8 = 2;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_SHARE")) & 1) != 0)
        {
          v8 = 3;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_CALL")) & 1) != 0)
        {
          v8 = 4;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_MESSAGE")) & 1) != 0)
        {
          v8 = 5;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_WEBSITE")) & 1) != 0)
        {
          v8 = 6;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_QUICK_LINK")) & 1) != 0)
        {
          v8 = 7;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_GROUP")) & 1) != 0)
        {
          v8 = 8;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_DIRECTIONS")) & 1) != 0)
        {
          v8 = 9;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_FLYOVER")) & 1) != 0)
        {
          v8 = 10;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_CLAIM_PLACE")) & 1) != 0)
        {
          v8 = 50;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_PHOTOS")) & 1) != 0)
        {
          v8 = 51;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_FAVORITES")) & 1) != 0)
        {
          v8 = 52;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_HOURS")) & 1) != 0)
        {
          v8 = 53;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_DETAILS")) & 1) != 0)
        {
          v8 = 54;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_PHONE")) & 1) != 0)
        {
          v8 = 55;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_ADD_WEBSITE")) & 1) != 0)
        {
          v8 = 56;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_FINDMY")) & 1) != 0)
        {
          v8 = 57;
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_BUTTON_TYPE_LOCATION")))
        {
          v8 = 58;
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_49;
        v8 = objc_msgSend(v6, "intValue");
      }
      objc_msgSend(a1, "setType:", v8);
LABEL_49:

      if (a3)
        v9 = CFSTR("isGroup");
      else
        v9 = CFSTR("is_group");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsGroup:", objc_msgSend(v10, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setMetadata:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vendor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setVendor:", v14);

      }
      if (a3)
        v15 = CFSTR("linkType");
      else
        v15 = CFSTR("link_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LINK_TYPE_UNKNOWN")) & 1) != 0)
        {
          v18 = 0;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LINK_TYPE_QUICK_LINK")) & 1) != 0)
        {
          v18 = 1;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LINK_TYPE_APP_CLIP_LINK")) & 1) != 0)
        {
          v18 = 2;
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("LINK_TYPE_APP_EXTENSION")))
        {
          v18 = 3;
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_75:

          goto LABEL_76;
        }
        v18 = objc_msgSend(v16, "intValue");
      }
      objc_msgSend(a1, "setLinkType:", v18);
      goto LABEL_75;
    }
  }
LABEL_76:

  return a1;
}

- (GEORevealedPlaceCardModuleButton)initWithJSON:(id)a3
{
  return (GEORevealedPlaceCardModuleButton *)-[GEORevealedPlaceCardModuleButton _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_9033;
    else
      v8 = (int *)&readAll__nonRecursiveTag_9034;
    GEORevealedPlaceCardModuleButtonReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORevealedPlaceCardModuleButtonIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORevealedPlaceCardModuleButtonReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
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
    -[GEORevealedPlaceCardModuleButton readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_metadata)
      PBDataWriterWriteStringField();
    if (self->_vendor)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEORevealedPlaceCardModuleButton readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 8) = self->_readerMarkPos;
  *((_DWORD *)v6 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_type;
    *((_BYTE *)v6 + 56) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v6 + 52) = self->_isGroup;
    *((_BYTE *)v6 + 56) |= 4u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    v4 = v6;
  }
  if (self->_vendor)
  {
    objc_msgSend(v6, "setVendor:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_linkType;
    *((_BYTE *)v4 + 56) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORevealedPlaceCardModuleButtonReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORevealedPlaceCardModuleButton readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(_BYTE *)(v5 + 56) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_isGroup;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_vendor, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_linkType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *metadata;
  NSString *vendor;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEORevealedPlaceCardModuleButton readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 12))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) != 0)
    {
      if (self->_isGroup)
      {
        if (!*((_BYTE *)v4 + 52))
          goto LABEL_23;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_15;
    }
LABEL_23:
    v7 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
    goto LABEL_23;
LABEL_15:
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](metadata, "isEqual:"))
    goto LABEL_23;
  vendor = self->_vendor;
  if ((unint64_t)vendor | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](vendor, "isEqual:"))
      goto LABEL_23;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 11))
      goto LABEL_23;
    v7 = 1;
  }
LABEL_24:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  -[GEORevealedPlaceCardModuleButton readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isGroup;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_metadata, "hash");
  v6 = -[NSString hash](self->_vendor, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_linkType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 56);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v6 + 12);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v6 + 56);
  }
  if ((v5 & 4) != 0)
  {
    self->_isGroup = *((_BYTE *)v6 + 52);
    *(_BYTE *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v6 + 2))
  {
    -[GEORevealedPlaceCardModuleButton setMetadata:](self, "setMetadata:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEORevealedPlaceCardModuleButton setVendor:](self, "setVendor:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_linkType = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
