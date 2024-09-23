@implementation GEOPDSPunchInResultHints

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_16;
  v9 = v3;
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)v3, 0);
  v4 = v9;
  if ((*((_BYTE *)v9 + 72) & 1) != 0)
  {
    *(_QWORD *)(a1 + 40) = *((_QWORD *)v9 + 5);
    *(_BYTE *)(a1 + 72) |= 1u;
  }
  v5 = (void *)*((_QWORD *)v9 + 6);
  if (v5)
  {
    -[GEOPDSPunchInResultHints setName:](a1, v5);
    v4 = v9;
  }
  v6 = (void *)*((_QWORD *)v4 + 4);
  if (v6)
  {
    -[GEOPDSPunchInResultHints setFormattedAddress:](a1, v6);
    v4 = v9;
  }
  v7 = *(void **)(a1 + 24);
  v8 = *((_QWORD *)v4 + 3);
  if (v7)
  {
    if (!v8)
      goto LABEL_14;
    objc_msgSend(v7, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    -[GEOPDSPunchInResultHints setCenter:](a1, *((void **)v4 + 3));
  }
  v4 = v9;
LABEL_14:
  if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v4 + 17);
    *(_BYTE *)(a1 + 72) |= 2u;
  }
LABEL_16:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 4u;
    *(_BYTE *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSPunchInResultHints readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 24), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDSPunchInResultHints)init
{
  GEOPDSPunchInResultHints *v2;
  GEOPDSPunchInResultHints *v3;
  GEOPDSPunchInResultHints *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSPunchInResultHints;
  v2 = -[GEOPDSPunchInResultHints init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSPunchInResultHints)initWithData:(id)a3
{
  GEOPDSPunchInResultHints *v3;
  GEOPDSPunchInResultHints *v4;
  GEOPDSPunchInResultHints *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSPunchInResultHints;
  v3 = -[GEOPDSPunchInResultHints initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 0x20u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)setFormattedAddress:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 0x10u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInResultHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 8u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOPDSPunchInResultHints;
  -[GEOPDSPunchInResultHints description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSPunchInResultHints dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSPunchInResultHints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  -[GEOPDSPunchInResultHints readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
  {
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = v6;
      objc_sync_enter(v7);
      GEOPDSPunchInResultHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_2);
      objc_sync_exit(v7);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v8 = *(id *)(a1 + 48);
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("name"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDSPunchInResultHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedAddress_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v11 = *(id *)(a1 + 32);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("formattedAddress");
    else
      v12 = CFSTR("formatted_address");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  -[GEOPDSPunchInResultHints _readCenter](a1);
  v13 = *(id *)(a1 + 24);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("center"));

  }
  if ((*(_BYTE *)(a1 + 72) & 2) != 0)
  {
    v16 = *(_DWORD *)(a1 + 68);
    switch(v16)
    {
      case '#':
        v17 = CFSTR("TIME_ZONE");
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
LABEL_29:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '+':
        v17 = CFSTR("SUB_LOCALITY");
        break;
      case ',':
        v17 = CFSTR("OCEAN");
        break;
      case '-':
        v17 = CFSTR("AOI");
        break;
      case '.':
        v17 = CFSTR("INLAND_WATER");
        break;
      case '/':
        v17 = CFSTR("BUSINESS");
        break;
      case '0':
        v17 = CFSTR("ISLAND");
        break;
      case '1':
        v17 = CFSTR("STREET");
        break;
      case '2':
        v17 = CFSTR("ADMIN");
        break;
      case '3':
        v17 = CFSTR("POSTAL");
        break;
      case '6':
        v17 = CFSTR("INTERSECTION");
        break;
      case '7':
        v17 = CFSTR("BUILDING");
        break;
      case '9':
        v17 = CFSTR("ADDRESS");
        break;
      case '=':
        v17 = CFSTR("CONTINENT");
        break;
      case '?':
        v17 = CFSTR("REGION");
        break;
      case '@':
        v17 = CFSTR("DIVISION");
        break;
      case 'A':
        v17 = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v17 = CFSTR("UNKNOWN_PLACE_TYPE");
        switch(v16)
        {
          case 0:
            goto LABEL_48;
          case 1:
            v17 = CFSTR("COUNTRY");
            break;
          case 2:
            v17 = CFSTR("ADMINISTRATIVE_AREA");
            break;
          case 3:
            goto LABEL_29;
          case 4:
            v17 = CFSTR("SUB_ADMINISTRATIVE_AREA");
            break;
          default:
            if (v16 != 16)
              goto LABEL_29;
            v17 = CFSTR("LOCALITY");
            break;
        }
        break;
    }
LABEL_48:
    if (a2)
      v18 = CFSTR("placeType");
    else
      v18 = CFSTR("place_type");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __54__GEOPDSPunchInResultHints__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSPunchInResultHints _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_296;
      else
        v6 = (int *)&readAll__nonRecursiveTag_297;
      GEOPDSPunchInResultHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __54__GEOPDSPunchInResultHints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOLatLng *v15;
  GEOLatLng *v16;
  GEOLatLng *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  int v21;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "unsignedLongLongValue");
      *(_BYTE *)(v6 + 72) |= 0x40u;
      *(_BYTE *)(v6 + 72) |= 1u;
      *(_QWORD *)(v6 + 40) = v8;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[GEOPDSPunchInResultHints setName:](v6, v10);

    }
    if (a3)
      v11 = CFSTR("formattedAddress");
    else
      v11 = CFSTR("formatted_address");
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[GEOPDSPunchInResultHints setFormattedAddress:](v6, v13);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = [GEOLatLng alloc];
      if ((a3 & 1) != 0)
        v16 = -[GEOLatLng initWithJSON:](v15, "initWithJSON:", v14);
      else
        v16 = -[GEOLatLng initWithDictionary:](v15, "initWithDictionary:", v14);
      v17 = v16;
      -[GEOPDSPunchInResultHints setCenter:](v6, v16);

    }
    if (a3)
      v18 = CFSTR("placeType");
    else
      v18 = CFSTR("place_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v19;
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
      {
        v21 = 0;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
      {
        v21 = 1;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
      {
        v21 = 2;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
      {
        v21 = 4;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
      {
        v21 = 16;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
      {
        v21 = 35;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
      {
        v21 = 43;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
      {
        v21 = 44;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
      {
        v21 = 45;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
      {
        v21 = 46;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
      {
        v21 = 47;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
      {
        v21 = 48;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
      {
        v21 = 49;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
      {
        v21 = 50;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
      {
        v21 = 51;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
      {
        v21 = 54;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
      {
        v21 = 55;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
      {
        v21 = 57;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
      {
        v21 = 61;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
      {
        v21 = 63;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
      {
        v21 = 64;
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
      {
        v21 = 65;
      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_69:

        goto LABEL_70;
      }
      v21 = objc_msgSend(v19, "intValue");
    }
    *(_BYTE *)(v6 + 72) |= 0x40u;
    *(_BYTE *)(v6 + 72) |= 2u;
    *(_DWORD *)(v6 + 68) = v21;
    goto LABEL_69;
  }
LABEL_70:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSPunchInResultHintsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x78) == 0))
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
    -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_formattedAddress)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
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
  id v13;
  void *v14;
  PBUnknownFields *v15;

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
      GEOPDSPunchInResultHintsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_muid;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_formattedAddress, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_placeType;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *formattedAddress;
  GEOLatLng *center;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 1);
  -[GEOPDSPunchInResultHints readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 5))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_17;
  formattedAddress = self->_formattedAddress;
  if ((unint64_t)formattedAddress | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](formattedAddress, "isEqual:"))
      goto LABEL_17;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_17;
  }
  v8 = (*((_BYTE *)v4 + 72) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_placeType != *((_DWORD *)v4 + 17))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;

  -[GEOPDSPunchInResultHints readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NSString hash](self->_formattedAddress, "hash");
  v6 = -[GEOLatLng hash](self->_center, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v7 = 2654435761 * self->_placeType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_formattedAddress, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
