@implementation GEORPPoiCorrections

- (GEORPPoiCorrections)init
{
  GEORPPoiCorrections *v2;
  GEORPPoiCorrections *v3;
  GEORPPoiCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiCorrections;
  v2 = -[GEORPPoiCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiCorrections)initWithData:(id)a3
{
  GEORPPoiCorrections *v3;
  GEORPPoiCorrections *v4;
  GEORPPoiCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiCorrections;
  v3 = -[GEORPPoiCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_2509);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasName
{
  -[GEORPPoiCorrections _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEORPPoiCorrections _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhone_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPhone
{
  -[GEORPPoiCorrections _readPhone]((uint64_t)self);
  return self->_phone != 0;
}

- (NSString)phone
{
  -[GEORPPoiCorrections _readPhone]((uint64_t)self);
  return self->_phone;
}

- (void)setPhone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_phone, a3);
}

- (void)_readAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 136) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_2510);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAddress
{
  -[GEORPPoiCorrections _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEORPAddressCorrections)address
{
  -[GEORPPoiCorrections _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readBusinessHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 136) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessHours_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)businessHours
{
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  return self->_businessHours;
}

- (void)setBusinessHours:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *businessHours;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  businessHours = self->_businessHours;
  self->_businessHours = v4;

}

- (void)clearBusinessHours
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_businessHours, "removeAllObjects");
}

- (void)addBusinessHours:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  -[GEORPPoiCorrections _addNoFlagsBusinessHours:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsBusinessHours:(uint64_t)a1
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

- (unint64_t)businessHoursCount
{
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  return -[NSMutableArray count](self->_businessHours, "count");
}

- (id)businessHoursAtIndex:(unint64_t)a3
{
  -[GEORPPoiCorrections _readBusinessHours]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_businessHours, "objectAtIndex:", a3);
}

+ (Class)businessHoursType
{
  return (Class)objc_opt_class();
}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 138) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasUrl
{
  -[GEORPPoiCorrections _readUrl]((uint64_t)self);
  return self->_url != 0;
}

- (NSString)url
{
  -[GEORPPoiCorrections _readUrl]((uint64_t)self);
  return self->_url;
}

- (void)setUrl:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasCategory
{
  -[GEORPPoiCorrections _readCategory]((uint64_t)self);
  return self->_category != 0;
}

- (GEORPCategoryCorrections)category
{
  -[GEORPPoiCorrections _readCategory]((uint64_t)self);
  return self->_category;
}

- (void)setCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)_readAmenity
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 136) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAmenity_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAmenity
{
  -[GEORPPoiCorrections _readAmenity]((uint64_t)self);
  return self->_amenity != 0;
}

- (GEORPAmenityCorrections)amenity
{
  -[GEORPPoiCorrections _readAmenity]((uint64_t)self);
  return self->_amenity;
}

- (void)setAmenity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  objc_storeStrong((id *)&self->_amenity, a3);
}

- (BOOL)flagHoursIncorrect
{
  return self->_flagHoursIncorrect;
}

- (void)setFlagHoursIncorrect:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_flagHoursIncorrect = a3;
}

- (void)setHasFlagHoursIncorrect:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131076;
  else
    v3 = 0x20000;
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasFlagHoursIncorrect
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)flagNotAtThisAddress
{
  return self->_flagNotAtThisAddress;
}

- (void)setFlagNotAtThisAddress:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_flagNotAtThisAddress = a3;
}

- (void)setHasFlagNotAtThisAddress:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131080;
  else
    v3 = 0x20000;
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFlagNotAtThisAddress
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readOriginalName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalName_tags_2512);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginalName
{
  -[GEORPPoiCorrections _readOriginalName]((uint64_t)self);
  return self->_originalName != 0;
}

- (NSString)originalName
{
  -[GEORPPoiCorrections _readOriginalName]((uint64_t)self);
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_originalName, a3);
}

- (void)_readOriginalPhone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalPhone_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginalPhone
{
  -[GEORPPoiCorrections _readOriginalPhone]((uint64_t)self);
  return self->_originalPhone != 0;
}

- (NSString)originalPhone
{
  -[GEORPPoiCorrections _readOriginalPhone]((uint64_t)self);
  return self->_originalPhone;
}

- (void)setOriginalPhone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_originalPhone, a3);
}

- (void)_readOriginalUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalUrl_tags_2513);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginalUrl
{
  -[GEORPPoiCorrections _readOriginalUrl]((uint64_t)self);
  return self->_originalUrl != 0;
}

- (NSString)originalUrl
{
  -[GEORPPoiCorrections _readOriginalUrl]((uint64_t)self);
  return self->_originalUrl;
}

- (void)setOriginalUrl:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_originalUrl, a3);
}

- (void)_readHoursText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHoursText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasHoursText
{
  -[GEORPPoiCorrections _readHoursText]((uint64_t)self);
  return self->_hoursText != 0;
}

- (NSString)hoursText
{
  -[GEORPPoiCorrections _readHoursText]((uint64_t)self);
  return self->_hoursText;
}

- (void)setHoursText:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_hoursText, a3);
}

- (void)_readContainmentCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 137) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainmentCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasContainmentCorrections
{
  -[GEORPPoiCorrections _readContainmentCorrections]((uint64_t)self);
  return self->_containmentCorrections != 0;
}

- (GEORPPlaceContainmentCorrections)containmentCorrections
{
  -[GEORPPoiCorrections _readContainmentCorrections]((uint64_t)self);
  return self->_containmentCorrections;
}

- (void)setContainmentCorrections:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_containmentCorrections, a3);
}

- (BOOL)flagBrokenCuratedCollectionUrl
{
  return self->_flagBrokenCuratedCollectionUrl;
}

- (void)setFlagBrokenCuratedCollectionUrl:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_flagBrokenCuratedCollectionUrl = a3;
}

- (void)setHasFlagBrokenCuratedCollectionUrl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131074;
  else
    v3 = 0x20000;
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasFlagBrokenCuratedCollectionUrl
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)flagBadCuratedCollectionDescription
{
  return self->_flagBadCuratedCollectionDescription;
}

- (void)setFlagBadCuratedCollectionDescription:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_flagBadCuratedCollectionDescription = a3;
}

- (void)setHasFlagBadCuratedCollectionDescription:(BOOL)a3
{
  self->_flags = ($9CF4D21F187FAA92402203F7BE027006)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasFlagBadCuratedCollectionDescription
{
  return *(_DWORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEORPPoiCorrections;
  -[GEORPPoiCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPoiCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  int v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  objc_msgSend((id)a1, "phone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("phone"));

  objc_msgSend((id)a1, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("address"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v11 = *(id *)(a1 + 40);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v58 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("businessHours");
    else
      v18 = CFSTR("business_hours");
    objc_msgSend(v4, "setObject:forKey:", v10, v18);

  }
  objc_msgSend((id)a1, "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("url"));

  objc_msgSend((id)a1, "category");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v20, "jsonRepresentation");
    else
      objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("category"));

  }
  objc_msgSend((id)a1, "amenity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v23, "jsonRepresentation");
    else
      objc_msgSend(v23, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("amenity"));

  }
  v26 = *(_DWORD *)(a1 + 136);
  if ((v26 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 134));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("flagHoursIncorrect");
    else
      v28 = CFSTR("flag_hours_incorrect");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v26 = *(_DWORD *)(a1 + 136);
  }
  if ((v26 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 135));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("flagNotAtThisAddress");
    else
      v30 = CFSTR("flag_not_at_this_address");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  objc_msgSend((id)a1, "originalName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    if (a2)
      v32 = CFSTR("originalName");
    else
      v32 = CFSTR("original_name");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);
  }

  objc_msgSend((id)a1, "originalPhone");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if (a2)
      v34 = CFSTR("originalPhone");
    else
      v34 = CFSTR("original_phone");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);
  }

  objc_msgSend((id)a1, "originalUrl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    if (a2)
      v36 = CFSTR("originalUrl");
    else
      v36 = CFSTR("original_url");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);
  }

  objc_msgSend((id)a1, "hoursText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    if (a2)
      v38 = CFSTR("hoursText");
    else
      v38 = CFSTR("hours_text");
    objc_msgSend(v4, "setObject:forKey:", v37, v38);
  }

  objc_msgSend((id)a1, "containmentCorrections");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("containmentCorrections");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("containment_corrections");
    }
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  v43 = *(_DWORD *)(a1 + 136);
  if ((v43 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 133));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v45 = CFSTR("flagBrokenCuratedCollectionUrl");
    else
      v45 = CFSTR("flag_broken_curated_collection_url");
    objc_msgSend(v4, "setObject:forKey:", v44, v45);

    v43 = *(_DWORD *)(a1 + 136);
  }
  if ((v43 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 132));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v47 = CFSTR("flagBadCuratedCollectionDescription");
    else
      v47 = CFSTR("flag_bad_curated_collection_description");
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

  }
  v48 = *(void **)(a1 + 16);
  if (v48)
  {
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __49__GEORPPoiCorrections__dictionaryRepresentation___block_invoke;
      v55[3] = &unk_1E1C00600;
      v52 = v51;
      v56 = v52;
      objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v55);
      v53 = v52;

      v50 = v53;
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEORPPoiCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPoiCorrections)initWithDictionary:(id)a3
{
  return (GEORPPoiCorrections *)-[GEORPPoiCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEORPAddressCorrections *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  GEORPFeedbackBusinessHours *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  GEORPCategoryCorrections *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GEORPAmenityCorrections *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  GEORPPlaceContainmentCorrections *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setName:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("phone"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setPhone:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEORPAddressCorrections alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEORPAddressCorrections initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEORPAddressCorrections initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setAddress:", v12);

      }
      if (a3)
        v14 = CFSTR("businessHours");
      else
        v14 = CFSTR("business_hours");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v61 = v15;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v63 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = [GEORPFeedbackBusinessHours alloc];
                if ((a3 & 1) != 0)
                  v23 = -[GEORPFeedbackBusinessHours initWithJSON:](v22, "initWithJSON:", v21);
                else
                  v23 = -[GEORPFeedbackBusinessHours initWithDictionary:](v22, "initWithDictionary:", v21);
                v24 = (void *)v23;
                objc_msgSend(a1, "addBusinessHours:", v23);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          }
          while (v18);
        }

        v15 = v61;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)objc_msgSend(v25, "copy");
        objc_msgSend(a1, "setUrl:", v26);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEORPCategoryCorrections alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEORPCategoryCorrections initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEORPCategoryCorrections initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setCategory:", v29);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("amenity"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEORPAmenityCorrections alloc];
        if ((a3 & 1) != 0)
          v33 = -[GEORPAmenityCorrections initWithJSON:](v32, "initWithJSON:", v31);
        else
          v33 = -[GEORPAmenityCorrections initWithDictionary:](v32, "initWithDictionary:", v31);
        v34 = (void *)v33;
        objc_msgSend(a1, "setAmenity:", v33);

      }
      if (a3)
        v35 = CFSTR("flagHoursIncorrect");
      else
        v35 = CFSTR("flag_hours_incorrect");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFlagHoursIncorrect:", objc_msgSend(v36, "BOOLValue"));

      if (a3)
        v37 = CFSTR("flagNotAtThisAddress");
      else
        v37 = CFSTR("flag_not_at_this_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFlagNotAtThisAddress:", objc_msgSend(v38, "BOOLValue"));

      if (a3)
        v39 = CFSTR("originalName");
      else
        v39 = CFSTR("original_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = (void *)objc_msgSend(v40, "copy");
        objc_msgSend(a1, "setOriginalName:", v41);

      }
      if (a3)
        v42 = CFSTR("originalPhone");
      else
        v42 = CFSTR("original_phone");
      objc_msgSend(v5, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = (void *)objc_msgSend(v43, "copy");
        objc_msgSend(a1, "setOriginalPhone:", v44);

      }
      if (a3)
        v45 = CFSTR("originalUrl");
      else
        v45 = CFSTR("original_url");
      objc_msgSend(v5, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = (void *)objc_msgSend(v46, "copy");
        objc_msgSend(a1, "setOriginalUrl:", v47);

      }
      if (a3)
        v48 = CFSTR("hoursText");
      else
        v48 = CFSTR("hours_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = (void *)objc_msgSend(v49, "copy");
        objc_msgSend(a1, "setHoursText:", v50);

      }
      if (a3)
        v51 = CFSTR("containmentCorrections");
      else
        v51 = CFSTR("containment_corrections");
      objc_msgSend(v5, "objectForKeyedSubscript:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = [GEORPPlaceContainmentCorrections alloc];
        if ((a3 & 1) != 0)
          v54 = -[GEORPPlaceContainmentCorrections initWithJSON:](v53, "initWithJSON:", v52);
        else
          v54 = -[GEORPPlaceContainmentCorrections initWithDictionary:](v53, "initWithDictionary:", v52);
        v55 = (void *)v54;
        objc_msgSend(a1, "setContainmentCorrections:", v54);

      }
      if (a3)
        v56 = CFSTR("flagBrokenCuratedCollectionUrl");
      else
        v56 = CFSTR("flag_broken_curated_collection_url");
      objc_msgSend(v5, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFlagBrokenCuratedCollectionUrl:", objc_msgSend(v57, "BOOLValue"));

      if (a3)
        v58 = CFSTR("flagBadCuratedCollectionDescription");
      else
        v58 = CFSTR("flag_bad_curated_collection_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFlagBadCuratedCollectionDescription:", objc_msgSend(v59, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPPoiCorrections)initWithJSON:(id)a3
{
  return (GEORPPoiCorrections *)-[GEORPPoiCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2557;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2558;
    GEORPPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPPoiCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $9CF4D21F187FAA92402203F7BE027006 flags;
  $9CF4D21F187FAA92402203F7BE027006 v11;
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
  if (self->_reader && (_GEORPPoiCorrectionsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPPoiCorrections readAll:](self, "readAll:", 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_phone)
      PBDataWriterWriteStringField();
    if (self->_address)
      PBDataWriterWriteSubmessage();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_businessHours;
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

    if (self->_url)
      PBDataWriterWriteStringField();
    if (self->_category)
      PBDataWriterWriteSubmessage();
    if (self->_amenity)
      PBDataWriterWriteSubmessage();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 8) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_originalName)
      PBDataWriterWriteStringField();
    if (self->_originalPhone)
      PBDataWriterWriteStringField();
    if (self->_originalUrl)
      PBDataWriterWriteStringField();
    if (self->_hoursText)
      PBDataWriterWriteStringField();
    if (self->_containmentCorrections)
      PBDataWriterWriteSubmessage();
    v11 = self->_flags;
    if ((*(_BYTE *)&v11 & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v11 = self->_flags;
    }
    if ((*(_BYTE *)&v11 & 1) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPoiCorrections _readAddress]((uint64_t)self);
  return -[GEORPAddressCorrections hasGreenTeaWithValue:](self->_address, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  $9CF4D21F187FAA92402203F7BE027006 flags;
  $9CF4D21F187FAA92402203F7BE027006 v10;
  id *v11;

  v11 = (id *)a3;
  -[GEORPPoiCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 30) = self->_readerMarkPos;
  *((_DWORD *)v11 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name)
    objc_msgSend(v11, "setName:");
  if (self->_phone)
    objc_msgSend(v11, "setPhone:");
  if (self->_address)
    objc_msgSend(v11, "setAddress:");
  if (-[GEORPPoiCorrections businessHoursCount](self, "businessHoursCount"))
  {
    objc_msgSend(v11, "clearBusinessHours");
    v4 = -[GEORPPoiCorrections businessHoursCount](self, "businessHoursCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPPoiCorrections businessHoursAtIndex:](self, "businessHoursAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addBusinessHours:", v7);

      }
    }
  }
  if (self->_url)
    objc_msgSend(v11, "setUrl:");
  v8 = v11;
  if (self->_category)
  {
    objc_msgSend(v11, "setCategory:");
    v8 = v11;
  }
  if (self->_amenity)
  {
    objc_msgSend(v11, "setAmenity:");
    v8 = v11;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *((_BYTE *)v8 + 134) = self->_flagHoursIncorrect;
    *((_DWORD *)v8 + 34) |= 4u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_BYTE *)v8 + 135) = self->_flagNotAtThisAddress;
    *((_DWORD *)v8 + 34) |= 8u;
  }
  if (self->_originalName)
  {
    objc_msgSend(v11, "setOriginalName:");
    v8 = v11;
  }
  if (self->_originalPhone)
  {
    objc_msgSend(v11, "setOriginalPhone:");
    v8 = v11;
  }
  if (self->_originalUrl)
  {
    objc_msgSend(v11, "setOriginalUrl:");
    v8 = v11;
  }
  if (self->_hoursText)
  {
    objc_msgSend(v11, "setHoursText:");
    v8 = v11;
  }
  if (self->_containmentCorrections)
  {
    objc_msgSend(v11, "setContainmentCorrections:");
    v8 = v11;
  }
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    *((_BYTE *)v8 + 133) = self->_flagBrokenCuratedCollectionUrl;
    *((_DWORD *)v8 + 34) |= 2u;
    v10 = self->_flags;
  }
  if ((*(_BYTE *)&v10 & 1) != 0)
  {
    *((_BYTE *)v8 + 132) = self->_flagBadCuratedCollectionDescription;
    *((_DWORD *)v8 + 34) |= 1u;
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  $9CF4D21F187FAA92402203F7BE027006 flags;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  $9CF4D21F187FAA92402203F7BE027006 v37;
  PBUnknownFields *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPPoiCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPoiCorrections readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v11 = -[NSString copyWithZone:](self->_phone, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v11;

  v13 = -[GEORPAddressCorrections copyWithZone:](self->_address, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = self->_businessHours;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend((id)v5, "addBusinessHours:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v20;

  v22 = -[GEORPCategoryCorrections copyWithZone:](self->_category, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v22;

  v24 = -[GEORPAmenityCorrections copyWithZone:](self->_amenity, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v24;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 134) = self->_flagHoursIncorrect;
    *(_DWORD *)(v5 + 136) |= 4u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 135) = self->_flagNotAtThisAddress;
    *(_DWORD *)(v5 + 136) |= 8u;
  }
  v27 = -[NSString copyWithZone:](self->_originalName, "copyWithZone:", a3, (_QWORD)v40);
  v28 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v27;

  v29 = -[NSString copyWithZone:](self->_originalPhone, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v29;

  v31 = -[NSString copyWithZone:](self->_originalUrl, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v31;

  v33 = -[NSString copyWithZone:](self->_hoursText, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v33;

  v35 = -[GEORPPlaceContainmentCorrections copyWithZone:](self->_containmentCorrections, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v35;

  v37 = self->_flags;
  if ((*(_BYTE *)&v37 & 2) != 0)
  {
    *(_BYTE *)(v5 + 133) = self->_flagBrokenCuratedCollectionUrl;
    *(_DWORD *)(v5 + 136) |= 2u;
    v37 = self->_flags;
  }
  if ((*(_BYTE *)&v37 & 1) != 0)
  {
    *(_BYTE *)(v5 + 132) = self->_flagBadCuratedCollectionDescription;
    *(_DWORD *)(v5 + 136) |= 1u;
  }
  v38 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v38;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *phone;
  GEORPAddressCorrections *address;
  NSMutableArray *businessHours;
  NSString *url;
  GEORPCategoryCorrections *category;
  GEORPAmenityCorrections *amenity;
  $9CF4D21F187FAA92402203F7BE027006 flags;
  int v13;
  NSString *originalName;
  NSString *originalPhone;
  NSString *originalUrl;
  NSString *hoursText;
  GEORPPlaceContainmentCorrections *containmentCorrections;
  $9CF4D21F187FAA92402203F7BE027006 v19;
  int v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[GEORPPoiCorrections readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_52;
  }
  phone = self->_phone;
  if ((unint64_t)phone | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](phone, "isEqual:"))
      goto LABEL_52;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPAddressCorrections isEqual:](address, "isEqual:"))
      goto LABEL_52;
  }
  businessHours = self->_businessHours;
  if ((unint64_t)businessHours | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](businessHours, "isEqual:"))
      goto LABEL_52;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_52;
  }
  category = self->_category;
  if ((unint64_t)category | *((_QWORD *)v4 + 6))
  {
    if (!-[GEORPCategoryCorrections isEqual:](category, "isEqual:"))
      goto LABEL_52;
  }
  amenity = self->_amenity;
  if ((unint64_t)amenity | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPAmenityCorrections isEqual:](amenity, "isEqual:"))
      goto LABEL_52;
  }
  flags = self->_flags;
  v13 = *((_DWORD *)v4 + 34);
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v13 & 4) == 0)
      goto LABEL_52;
    if (self->_flagHoursIncorrect)
    {
      if (!*((_BYTE *)v4 + 134))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 134))
    {
      goto LABEL_52;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v13 & 8) == 0)
      goto LABEL_52;
    if (self->_flagNotAtThisAddress)
    {
      if (!*((_BYTE *)v4 + 135))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 135))
    {
      goto LABEL_52;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_52;
  }
  originalName = self->_originalName;
  if ((unint64_t)originalName | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](originalName, "isEqual:"))
  {
    goto LABEL_52;
  }
  originalPhone = self->_originalPhone;
  if ((unint64_t)originalPhone | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](originalPhone, "isEqual:"))
      goto LABEL_52;
  }
  originalUrl = self->_originalUrl;
  if ((unint64_t)originalUrl | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](originalUrl, "isEqual:"))
      goto LABEL_52;
  }
  hoursText = self->_hoursText;
  if ((unint64_t)hoursText | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](hoursText, "isEqual:"))
      goto LABEL_52;
  }
  containmentCorrections = self->_containmentCorrections;
  if ((unint64_t)containmentCorrections | *((_QWORD *)v4 + 7))
  {
    if (!-[GEORPPlaceContainmentCorrections isEqual:](containmentCorrections, "isEqual:"))
      goto LABEL_52;
  }
  v19 = self->_flags;
  v20 = *((_DWORD *)v4 + 34);
  if ((*(_BYTE *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0)
      goto LABEL_52;
    if (self->_flagBrokenCuratedCollectionUrl)
    {
      if (!*((_BYTE *)v4 + 133))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 133))
    {
      goto LABEL_52;
    }
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_52;
  }
  v21 = (*((_DWORD *)v4 + 34) & 1) == 0;
  if ((*(_BYTE *)&v19 & 1) != 0)
  {
    if ((v20 & 1) != 0)
    {
      if (self->_flagBadCuratedCollectionDescription)
      {
        if (!*((_BYTE *)v4 + 132))
          goto LABEL_52;
      }
      else if (*((_BYTE *)v4 + 132))
      {
        goto LABEL_52;
      }
      v21 = 1;
      goto LABEL_53;
    }
LABEL_52:
    v21 = 0;
  }
LABEL_53:

  return v21;
}

- (unint64_t)hash
{
  unint64_t v3;
  $9CF4D21F187FAA92402203F7BE027006 flags;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  $9CF4D21F187FAA92402203F7BE027006 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  NSUInteger v20;
  NSUInteger v21;

  -[GEORPPoiCorrections readAll:](self, "readAll:", 1);
  v21 = -[NSString hash](self->_name, "hash");
  v20 = -[NSString hash](self->_phone, "hash");
  v19 = -[GEORPAddressCorrections hash](self->_address, "hash");
  v18 = -[NSMutableArray hash](self->_businessHours, "hash");
  v17 = -[NSString hash](self->_url, "hash");
  v16 = -[GEORPCategoryCorrections hash](self->_category, "hash");
  v3 = -[GEORPAmenityCorrections hash](self->_amenity, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    v5 = 2654435761 * self->_flagHoursIncorrect;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_flagNotAtThisAddress;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[NSString hash](self->_originalName, "hash");
  v8 = -[NSString hash](self->_originalPhone, "hash");
  v9 = -[NSString hash](self->_originalUrl, "hash");
  v10 = -[NSString hash](self->_hoursText, "hash");
  v11 = -[GEORPPlaceContainmentCorrections hash](self->_containmentCorrections, "hash");
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    v13 = 2654435761 * self->_flagBrokenCuratedCollectionUrl;
    if ((*(_BYTE *)&v12 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v14 = 0;
    return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((*(_BYTE *)&v12 & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v14 = 2654435761 * self->_flagBadCuratedCollectionDescription;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPAddressCorrections *address;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEORPCategoryCorrections *category;
  uint64_t v13;
  GEORPAmenityCorrections *amenity;
  uint64_t v15;
  int v16;
  GEORPPlaceContainmentCorrections *containmentCorrections;
  uint64_t v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 9))
    -[GEORPPoiCorrections setName:](self, "setName:");
  if (*((_QWORD *)v4 + 13))
    -[GEORPPoiCorrections setPhone:](self, "setPhone:");
  address = self->_address;
  v6 = *((_QWORD *)v4 + 3);
  if (address)
  {
    if (v6)
      -[GEORPAddressCorrections mergeFrom:](address, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPPoiCorrections setAddress:](self, "setAddress:");
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        -[GEORPPoiCorrections addBusinessHours:](self, "addBusinessHours:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 14))
    -[GEORPPoiCorrections setUrl:](self, "setUrl:");
  category = self->_category;
  v13 = *((_QWORD *)v4 + 6);
  if (category)
  {
    if (v13)
      -[GEORPCategoryCorrections mergeFrom:](category, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPPoiCorrections setCategory:](self, "setCategory:");
  }
  amenity = self->_amenity;
  v15 = *((_QWORD *)v4 + 4);
  if (amenity)
  {
    if (v15)
      -[GEORPAmenityCorrections mergeFrom:](amenity, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPPoiCorrections setAmenity:](self, "setAmenity:");
  }
  v16 = *((_DWORD *)v4 + 34);
  if ((v16 & 4) != 0)
  {
    self->_flagHoursIncorrect = *((_BYTE *)v4 + 134);
    *(_DWORD *)&self->_flags |= 4u;
    v16 = *((_DWORD *)v4 + 34);
  }
  if ((v16 & 8) != 0)
  {
    self->_flagNotAtThisAddress = *((_BYTE *)v4 + 135);
    *(_DWORD *)&self->_flags |= 8u;
  }
  if (*((_QWORD *)v4 + 10))
    -[GEORPPoiCorrections setOriginalName:](self, "setOriginalName:");
  if (*((_QWORD *)v4 + 11))
    -[GEORPPoiCorrections setOriginalPhone:](self, "setOriginalPhone:");
  if (*((_QWORD *)v4 + 12))
    -[GEORPPoiCorrections setOriginalUrl:](self, "setOriginalUrl:");
  if (*((_QWORD *)v4 + 8))
    -[GEORPPoiCorrections setHoursText:](self, "setHoursText:");
  containmentCorrections = self->_containmentCorrections;
  v18 = *((_QWORD *)v4 + 7);
  if (containmentCorrections)
  {
    if (v18)
      -[GEORPPlaceContainmentCorrections mergeFrom:](containmentCorrections, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEORPPoiCorrections setContainmentCorrections:](self, "setContainmentCorrections:");
  }
  v19 = *((_DWORD *)v4 + 34);
  if ((v19 & 2) != 0)
  {
    self->_flagBrokenCuratedCollectionUrl = *((_BYTE *)v4 + 133);
    *(_DWORD *)&self->_flags |= 2u;
    v19 = *((_DWORD *)v4 + 34);
  }
  if ((v19 & 1) != 0)
  {
    self->_flagBadCuratedCollectionDescription = *((_BYTE *)v4 + 132);
    *(_DWORD *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2561);
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
  *(_DWORD *)&self->_flags |= 0x20010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPPoiCorrections readAll:](self, "readAll:", 0);
    -[GEORPAddressCorrections clearUnknownFields:](self->_address, "clearUnknownFields:", 1);
    -[GEORPCategoryCorrections clearUnknownFields:](self->_category, "clearUnknownFields:", 1);
    -[GEORPPlaceContainmentCorrections clearUnknownFields:](self->_containmentCorrections, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_originalUrl, 0);
  objc_storeStrong((id *)&self->_originalPhone, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_hoursText, 0);
  objc_storeStrong((id *)&self->_containmentCorrections, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_amenity, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
