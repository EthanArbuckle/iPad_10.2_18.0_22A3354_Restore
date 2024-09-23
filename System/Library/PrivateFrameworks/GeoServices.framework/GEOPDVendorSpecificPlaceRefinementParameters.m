@implementation GEOPDVendorSpecificPlaceRefinementParameters

- (GEOPDVendorSpecificPlaceRefinementParameters)init
{
  GEOPDVendorSpecificPlaceRefinementParameters *v2;
  GEOPDVendorSpecificPlaceRefinementParameters *v3;
  GEOPDVendorSpecificPlaceRefinementParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  v2 = -[GEOPDVendorSpecificPlaceRefinementParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithData:(id)a3
{
  GEOPDVendorSpecificPlaceRefinementParameters *v3;
  GEOPDVendorSpecificPlaceRefinementParameters *v4;
  GEOPDVendorSpecificPlaceRefinementParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  v3 = -[GEOPDVendorSpecificPlaceRefinementParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setVendorId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x800u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }

}

- (void)setExternalItemId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x80u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)_readLocationHint
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationHint_tags_5650);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)setLocationHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x200u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)setAddressHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x20u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readPlaceNameHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceNameHint_tags_5652);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)placeNameHint
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDVendorSpecificPlaceRefinementParameters _readPlaceNameHint]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)setPlaceNameHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x400u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)_readFormattedAddressLineHints
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedAddressLineHints_tags_5653);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)setFormattedAddressLineHints:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)addFormattedAddressLineHint:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDVendorSpecificPlaceRefinementParameters _readFormattedAddressLineHints](a1);
    -[GEOPDVendorSpecificPlaceRefinementParameters _addNoFlagsFormattedAddressLineHint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x1000u;
  }
}

- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1
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

- (void)setAddressObjectHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x40u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

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
  v8.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  -[GEOPDVendorSpecificPlaceRefinementParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDVendorSpecificPlaceRefinementParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVendorSpecificPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v50[4];
  id v51;

  if (!a1)
    return 0;
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 112);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 108));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("resultProviderId");
    else
      v7 = CFSTR("result_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 112);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("muid"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVendorId_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v11 = *(id *)(a1 + 80);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("vendorId");
    else
      v12 = CFSTR("vendor_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExternalItemId_tags);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v15 = *(id *)(a1 + 40);
  if (v15)
  {
    if (a2)
      v16 = CFSTR("externalItemId");
    else
      v16 = CFSTR("external_item_id");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  -[GEOPDVendorSpecificPlaceRefinementParameters _readLocationHint](a1);
  v17 = *(id *)(a1 + 56);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("locationHint");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("location_hint");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
  {
    v21 = *(void **)(a1 + 8);
    if (v21)
    {
      v22 = v21;
      objc_sync_enter(v22);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressHint_tags_5651);
      objc_sync_exit(v22);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v23 = *(id *)(a1 + 24);
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("addressHint");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("address_hint");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  -[GEOPDVendorSpecificPlaceRefinementParameters placeNameHint]((id *)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    if (a2)
      v28 = CFSTR("placeNameHint");
    else
      v28 = CFSTR("place_name_hint");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    -[GEOPDVendorSpecificPlaceRefinementParameters _readFormattedAddressLineHints](a1);
    v29 = *(id *)(a1 + 48);
    if (a2)
      v30 = CFSTR("formattedAddressLineHint");
    else
      v30 = CFSTR("formatted_address_line_hint");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  v31 = *(_WORD *)(a1 + 112);
  if ((v31 & 4) != 0)
  {
    v32 = *(_DWORD *)(a1 + 104);
    switch(v32)
    {
      case '#':
        v33 = CFSTR("TIME_ZONE");
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
LABEL_55:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 104));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '+':
        v33 = CFSTR("SUB_LOCALITY");
        break;
      case ',':
        v33 = CFSTR("OCEAN");
        break;
      case '-':
        v33 = CFSTR("AOI");
        break;
      case '.':
        v33 = CFSTR("INLAND_WATER");
        break;
      case '/':
        v33 = CFSTR("BUSINESS");
        break;
      case '0':
        v33 = CFSTR("ISLAND");
        break;
      case '1':
        v33 = CFSTR("STREET");
        break;
      case '2':
        v33 = CFSTR("ADMIN");
        break;
      case '3':
        v33 = CFSTR("POSTAL");
        break;
      case '6':
        v33 = CFSTR("INTERSECTION");
        break;
      case '7':
        v33 = CFSTR("BUILDING");
        break;
      case '9':
        v33 = CFSTR("ADDRESS");
        break;
      case '=':
        v33 = CFSTR("CONTINENT");
        break;
      case '?':
        v33 = CFSTR("REGION");
        break;
      case '@':
        v33 = CFSTR("DIVISION");
        break;
      case 'A':
        v33 = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v33 = CFSTR("UNKNOWN_PLACE_TYPE");
        switch(v32)
        {
          case 0:
            goto LABEL_74;
          case 1:
            v33 = CFSTR("COUNTRY");
            break;
          case 2:
            v33 = CFSTR("ADMINISTRATIVE_AREA");
            break;
          case 3:
            goto LABEL_55;
          case 4:
            v33 = CFSTR("SUB_ADMINISTRATIVE_AREA");
            break;
          default:
            if (v32 != 16)
              goto LABEL_55;
            v33 = CFSTR("LOCALITY");
            break;
        }
        break;
    }
LABEL_74:
    if (a2)
      v34 = CFSTR("placeTypeHint");
    else
      v34 = CFSTR("place_type_hint");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    v31 = *(_WORD *)(a1 + 112);
  }
  if ((v31 & 2) != 0)
  {
    v35 = *(int *)(a1 + 100);
    if (v35 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 100));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E1C051D0[v35];
    }
    if (a2)
      v37 = CFSTR("addressGeocodeAccuracyHint");
    else
      v37 = CFSTR("address_geocode_accuracy_hint");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
  {
    v38 = *(void **)(a1 + 8);
    if (v38)
    {
      v39 = v38;
      objc_sync_enter(v39);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressObjectHint_tags_5654);
      objc_sync_exit(v39);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v40 = *(id *)(a1 + 32);
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "base64EncodedStringWithOptions:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("addressObjectHint"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("address_object_hint"));
    }
  }

  v43 = *(void **)(a1 + 16);
  if (v43)
  {
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __74__GEOPDVendorSpecificPlaceRefinementParameters__dictionaryRepresentation___block_invoke;
      v50[3] = &unk_1E1C00600;
      v47 = v46;
      v51 = v47;
      objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v50);
      v48 = v47;

      v45 = v48;
    }
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDVendorSpecificPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5663;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5664;
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 56), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

void __74__GEOPDVendorSpecificPlaceRefinementParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDVendorSpecificPlaceRefinementParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FE0) == 0))
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
    -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 0);
    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_vendorId)
      PBDataWriterWriteStringField();
    if (self->_externalItemId)
      PBDataWriterWriteStringField();
    if (self->_locationHint)
      PBDataWriterWriteSubmessage();
    if (self->_addressHint)
      PBDataWriterWriteSubmessage();
    if (self->_placeNameHint)
      PBDataWriterWriteStringField();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_formattedAddressLineHints;
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

    v11 = (__int16)self->_flags;
    if ((v11 & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v11 = (__int16)self->_flags;
    }
    if ((v11 & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_addressObjectHint)
      PBDataWriterWriteDataField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __int16 v25;
  uint64_t v26;
  void *v27;
  PBUnknownFields *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDVendorSpecificPlaceRefinementParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_resultProviderId;
    *(_WORD *)(v5 + 112) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_muid;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_vendorId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  v12 = -[NSString copyWithZone:](self->_externalItemId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[GEOLatLng copyWithZone:](self->_locationHint, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[GEOStructuredAddress copyWithZone:](self->_addressHint, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[NSString copyWithZone:](self->_placeNameHint, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_formattedAddressLineHints;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v30);
        -[GEOPDVendorSpecificPlaceRefinementParameters addFormattedAddressLineHint:](v5, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  v25 = (__int16)self->_flags;
  if ((v25 & 4) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_placeTypeHint;
    *(_WORD *)(v5 + 112) |= 4u;
    v25 = (__int16)self->_flags;
  }
  if ((v25 & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_addressGeocodeAccuracyHint;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  v26 = -[NSData copyWithZone:](self->_addressObjectHint, "copyWithZone:", a3, (_QWORD)v30);
  v27 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v26;

  v28 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v28;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *vendorId;
  NSString *externalItemId;
  GEOLatLng *locationHint;
  GEOStructuredAddress *addressHint;
  NSString *placeNameHint;
  NSMutableArray *formattedAddressLineHints;
  __int16 v13;
  __int16 v14;
  NSData *addressObjectHint;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 56);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 27))
      goto LABEL_36;
  }
  else if ((v6 & 8) != 0)
  {
LABEL_36:
    v16 = 0;
    goto LABEL_37;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 8))
      goto LABEL_36;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_36;
  }
  vendorId = self->_vendorId;
  if ((unint64_t)vendorId | *((_QWORD *)v4 + 10) && !-[NSString isEqual:](vendorId, "isEqual:"))
    goto LABEL_36;
  externalItemId = self->_externalItemId;
  if ((unint64_t)externalItemId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](externalItemId, "isEqual:"))
      goto LABEL_36;
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](locationHint, "isEqual:"))
      goto LABEL_36;
  }
  addressHint = self->_addressHint;
  if ((unint64_t)addressHint | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOStructuredAddress isEqual:](addressHint, "isEqual:"))
      goto LABEL_36;
  }
  placeNameHint = self->_placeNameHint;
  if ((unint64_t)placeNameHint | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](placeNameHint, "isEqual:"))
      goto LABEL_36;
  }
  formattedAddressLineHints = self->_formattedAddressLineHints;
  if ((unint64_t)formattedAddressLineHints | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLineHints, "isEqual:"))
      goto LABEL_36;
  }
  v13 = (__int16)self->_flags;
  v14 = *((_WORD *)v4 + 56);
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_placeTypeHint != *((_DWORD *)v4 + 26))
      goto LABEL_36;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_addressGeocodeAccuracyHint != *((_DWORD *)v4 + 25))
      goto LABEL_36;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_36;
  }
  addressObjectHint = self->_addressObjectHint;
  if ((unint64_t)addressObjectHint | *((_QWORD *)v4 + 4))
    v16 = -[NSData isEqual:](addressObjectHint, "isEqual:");
  else
    v16 = 1;
LABEL_37:

  return v16;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v4 = 2654435761 * self->_resultProviderId;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_vendorId, "hash");
  v7 = -[NSString hash](self->_externalItemId, "hash");
  v8 = -[GEOLatLng hash](self->_locationHint, "hash");
  v9 = -[GEOStructuredAddress hash](self->_addressHint, "hash");
  v10 = -[NSString hash](self->_placeNameHint, "hash");
  v11 = -[NSMutableArray hash](self->_formattedAddressLineHints, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    v13 = 2654435761 * self->_placeTypeHint;
    if ((v12 & 2) != 0)
      goto LABEL_8;
LABEL_10:
    v14 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ -[NSData hash](self->_addressObjectHint, "hash");
  }
  v13 = 0;
  if ((v12 & 2) == 0)
    goto LABEL_10;
LABEL_8:
  v14 = 2654435761 * self->_addressGeocodeAccuracyHint;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ -[NSData hash](self->_addressObjectHint, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_placeNameHint, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_formattedAddressLineHints, 0);
  objc_storeStrong((id *)&self->_externalItemId, 0);
  objc_storeStrong((id *)&self->_addressObjectHint, 0);
  objc_storeStrong((id *)&self->_addressHint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithMuid:(unint64_t)a3 locationHint:(id)a4 placeNameHint:(id)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  double var1;
  double var0;
  id v14;
  id v15;
  GEOPDVendorSpecificPlaceRefinementParameters *v16;
  void *v17;
  GEOLatLng *v18;
  GEOPDVendorSpecificPlaceRefinementParameters *v19;
  NSObject *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  var1 = a4.var1;
  var0 = a4.var0;
  v26 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  v16 = -[GEOPDVendorSpecificPlaceRefinementParameters init](&v23, sel_init);
  if (!v16)
  {
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  if (!v15 || !objc_msgSend(v15, "length"))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPDVendorSpecificPlaceRefinementParameters");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v21;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "%{public}@ requires a contentProvider", buf, 0xCu);

    }
    goto LABEL_19;
  }
  -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:]((uint64_t)v16, v15);
  if (a3)
  {
    *(_WORD *)&v16->_flags |= 0x1000u;
    *(_WORD *)&v16->_flags |= 1u;
    v16->_muid = a3;
    if (!a6)
    {
      +[GEOMapService sharedService](GEOMapService, "sharedService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      a6 = objc_msgSend(v17, "localSearchProviderID");

    }
    *(_WORD *)&v16->_flags |= 0x1000u;
    *(_WORD *)&v16->_flags |= 8u;
    v16->_resultProviderId = a6;
  }
  if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
  {
    v18 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
    -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:]((uint64_t)v16, v18);

  }
  if (objc_msgSend(v14, "length"))
    -[GEOPDVendorSpecificPlaceRefinementParameters setPlaceNameHint:]((uint64_t)v16, v14);
  v19 = v16;
LABEL_20:

  return v19;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4
{
  id v7;
  id v8;
  GEOPDVendorSpecificPlaceRefinementParameters *v9;
  GEOPDVendorSpecificPlaceRefinementParameters *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  v9 = -[GEOPDVendorSpecificPlaceRefinementParameters init](&v15, sel_init);
  if (!v9)
    goto LABEL_10;
  if (!v8 || !objc_msgSend(v8, "length"))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPDVendorSpecificPlaceRefinementParameters");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    v13 = "%{public}@ requires business IDs";
LABEL_8:
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);

    goto LABEL_9;
  }
  if (!objc_msgSend(v8, "length"))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPDVendorSpecificPlaceRefinementParameters");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    v13 = "%{public}@ requires a contentProvider";
    goto LABEL_8;
  }
  -[GEOPDVendorSpecificPlaceRefinementParameters setExternalItemId:]((uint64_t)v9, v7);
  -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:]((uint64_t)v9, v8);
  v10 = v9;
LABEL_11:

  return v10;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 contentProvider:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  GEOPDVendorSpecificPlaceRefinementParameters *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  int v21;
  int v22;
  GEOPDVendorSpecificPlaceRefinementParameters *v23;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "_hasMUID"))
    v11 = objc_msgSend(v9, "_muid");
  else
    v11 = 0;
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GEOPDVendorSpecificPlaceRefinementParameters initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:](self, "initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:", v11, v12, objc_msgSend(v9, "_resultProviderID"), v10, var0, var1);

  if (!v13)
    goto LABEL_18;
  objc_msgSend(v9, "geoAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "hasStructuredAddress"))
  {
    objc_msgSend(v14, "structuredAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDVendorSpecificPlaceRefinementParameters setAddressHint:]((uint64_t)v13, v15);

  }
  if (objc_msgSend(v14, "formattedAddressLinesCount"))
  {
    objc_msgSend(v14, "formattedAddressLines");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDVendorSpecificPlaceRefinementParameters setFormattedAddressLineHints:]((uint64_t)v13, v16);

  }
  objc_msgSend(v9, "addressObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "rawBytes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
      -[GEOPDVendorSpecificPlaceRefinementParameters setAddressObjectHint:]((uint64_t)v13, v19);

  }
  v20 = objc_msgSend(v9, "_addressGeocodeAccuracy");
  if (v20 >= 6)
  {
    if (v20 == -1)
      goto LABEL_15;
    v20 = -1;
  }
  *(_WORD *)&v13->_flags |= 0x1000u;
  *(_WORD *)&v13->_flags |= 2u;
  v13->_addressGeocodeAccuracyHint = v20;
LABEL_15:
  v21 = objc_msgSend(v9, "_placeType");
  if (v21)
  {
    v22 = _PDPlaceTypeForMapItemPlaceType(v21);
    *(_WORD *)&v13->_flags |= 0x1000u;
    *(_WORD *)&v13->_flags |= 4u;
    v13->_placeTypeHint = v22;
  }
  v23 = v13;

LABEL_18:
  return v13;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  return -[GEOPDVendorSpecificPlaceRefinementParameters initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:](self, "initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:", a5, a3, *(_QWORD *)&a6, a7, a4.var0, a4.var1);
}

@end
