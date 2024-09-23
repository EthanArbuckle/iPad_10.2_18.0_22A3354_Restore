@implementation GEOWiFiBeaconInfo

- (GEOWiFiBeaconInfo)init
{
  GEOWiFiBeaconInfo *v2;
  GEOWiFiBeaconInfo *v3;
  GEOWiFiBeaconInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiBeaconInfo;
  v2 = -[GEOWiFiBeaconInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiBeaconInfo)initWithData:(id)a3
{
  GEOWiFiBeaconInfo *v3;
  GEOWiFiBeaconInfo *v4;
  GEOWiFiBeaconInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiBeaconInfo;
  v3 = -[GEOWiFiBeaconInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBeaconInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBeaconInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasBeaconInfo
{
  -[GEOWiFiBeaconInfo _readBeaconInfo]((uint64_t)self);
  return self->_beaconInfo != 0;
}

- (NSData)beaconInfo
{
  -[GEOWiFiBeaconInfo _readBeaconInfo]((uint64_t)self);
  return self->_beaconInfo;
}

- (void)setBeaconInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  objc_storeStrong((id *)&self->_beaconInfo, a3);
}

- (void)_readWpsResponseType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsResponseType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsResponseType
{
  -[GEOWiFiBeaconInfo _readWpsResponseType]((uint64_t)self);
  return self->_wpsResponseType != 0;
}

- (NSString)wpsResponseType
{
  -[GEOWiFiBeaconInfo _readWpsResponseType]((uint64_t)self);
  return self->_wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_wpsResponseType, a3);
}

- (void)_readWpsManufacturerElement
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsManufacturerElement_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsManufacturerElement
{
  -[GEOWiFiBeaconInfo _readWpsManufacturerElement]((uint64_t)self);
  return self->_wpsManufacturerElement != 0;
}

- (NSString)wpsManufacturerElement
{
  -[GEOWiFiBeaconInfo _readWpsManufacturerElement]((uint64_t)self);
  return self->_wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_wpsManufacturerElement, a3);
}

- (void)_readWpsModelName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsModelName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsModelName
{
  -[GEOWiFiBeaconInfo _readWpsModelName]((uint64_t)self);
  return self->_wpsModelName != 0;
}

- (NSString)wpsModelName
{
  -[GEOWiFiBeaconInfo _readWpsModelName]((uint64_t)self);
  return self->_wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_wpsModelName, a3);
}

- (void)_readWpsModelNumber
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsModelNumber_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsModelNumber
{
  -[GEOWiFiBeaconInfo _readWpsModelNumber]((uint64_t)self);
  return self->_wpsModelNumber != 0;
}

- (NSString)wpsModelNumber
{
  -[GEOWiFiBeaconInfo _readWpsModelNumber]((uint64_t)self);
  return self->_wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_wpsModelNumber, a3);
}

- (void)_readWpsPrimaryDeviceTypeCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsPrimaryDeviceTypeCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsPrimaryDeviceTypeCategory
{
  -[GEOWiFiBeaconInfo _readWpsPrimaryDeviceTypeCategory]((uint64_t)self);
  return self->_wpsPrimaryDeviceTypeCategory != 0;
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  -[GEOWiFiBeaconInfo _readWpsPrimaryDeviceTypeCategory]((uint64_t)self);
  return self->_wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeCategory, a3);
}

- (void)_readWpsPrimaryDeviceTypeSubCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsPrimaryDeviceTypeSubCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsPrimaryDeviceTypeSubCategory
{
  -[GEOWiFiBeaconInfo _readWpsPrimaryDeviceTypeSubCategory]((uint64_t)self);
  return self->_wpsPrimaryDeviceTypeSubCategory != 0;
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  -[GEOWiFiBeaconInfo _readWpsPrimaryDeviceTypeSubCategory]((uint64_t)self);
  return self->_wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeSubCategory, a3);
}

- (void)_readWpsDeviceNameElement
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsDeviceNameElement_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsDeviceNameElement
{
  -[GEOWiFiBeaconInfo _readWpsDeviceNameElement]((uint64_t)self);
  return self->_wpsDeviceNameElement != 0;
}

- (NSString)wpsDeviceNameElement
{
  -[GEOWiFiBeaconInfo _readWpsDeviceNameElement]((uint64_t)self);
  return self->_wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_wpsDeviceNameElement, a3);
}

- (void)_readWpsDeviceNameData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsDeviceNameData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsDeviceNameData
{
  -[GEOWiFiBeaconInfo _readWpsDeviceNameData]((uint64_t)self);
  return self->_wpsDeviceNameData != 0;
}

- (NSString)wpsDeviceNameData
{
  -[GEOWiFiBeaconInfo _readWpsDeviceNameData]((uint64_t)self);
  return self->_wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_wpsDeviceNameData, a3);
}

- (void)_readWpsConfigMethods
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWpsConfigMethods_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsConfigMethods
{
  -[GEOWiFiBeaconInfo _readWpsConfigMethods]((uint64_t)self);
  return self->_wpsConfigMethods != 0;
}

- (NSString)wpsConfigMethods
{
  -[GEOWiFiBeaconInfo _readWpsConfigMethods]((uint64_t)self);
  return self->_wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  objc_storeStrong((id *)&self->_wpsConfigMethods, a3);
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
  v8.super_class = (Class)GEOWiFiBeaconInfo;
  -[GEOWiFiBeaconInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiBeaconInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiBeaconInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "beaconInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("beaconInfo"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("beaconInfo"));
      }
    }

    objc_msgSend(a1, "wpsResponseType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("wpsResponseType"));

    objc_msgSend(a1, "wpsManufacturerElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("wpsManufacturerElement"));

    objc_msgSend(a1, "wpsModelName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("wpsModelName"));

    objc_msgSend(a1, "wpsModelNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("wpsModelNumber"));

    objc_msgSend(a1, "wpsPrimaryDeviceTypeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("wpsPrimaryDeviceTypeCategory"));

    objc_msgSend(a1, "wpsPrimaryDeviceTypeSubCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("wpsPrimaryDeviceTypeSubCategory"));

    objc_msgSend(a1, "wpsDeviceNameElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("wpsDeviceNameElement"));

    objc_msgSend(a1, "wpsDeviceNameData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("wpsDeviceNameData"));

    objc_msgSend(a1, "wpsConfigMethods");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("wpsConfigMethods"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiBeaconInfo _dictionaryRepresentation:](self, 1);
}

- (GEOWiFiBeaconInfo)initWithDictionary:(id)a3
{
  return (GEOWiFiBeaconInfo *)-[GEOWiFiBeaconInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("beaconInfo"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
        objc_msgSend(a1, "setBeaconInfo:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsResponseType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setWpsResponseType:", v7);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsManufacturerElement"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setWpsManufacturerElement:", v9);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsModelName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setWpsModelName:", v11);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsModelNumber"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setWpsModelNumber:", v13);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsPrimaryDeviceTypeCategory"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setWpsPrimaryDeviceTypeCategory:", v15);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsPrimaryDeviceTypeSubCategory"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setWpsPrimaryDeviceTypeSubCategory:", v17);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsDeviceNameElement"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setWpsDeviceNameElement:", v19);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsDeviceNameData"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setWpsDeviceNameData:", v21);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wpsConfigMethods"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (void *)objc_msgSend(v22, "copy");
        objc_msgSend(a1, "setWpsConfigMethods:", v23);

      }
    }
  }

  return a1;
}

- (GEOWiFiBeaconInfo)initWithJSON:(id)a3
{
  return (GEOWiFiBeaconInfo *)-[GEOWiFiBeaconInfo _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_62;
    else
      v8 = (int *)&readAll__nonRecursiveTag_62;
    GEOWiFiBeaconInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiBeaconInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiBeaconInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7FF) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWiFiBeaconInfo readAll:](self, "readAll:", 0);
    if (self->_beaconInfo)
      PBDataWriterWriteDataField();
    if (self->_wpsResponseType)
      PBDataWriterWriteStringField();
    if (self->_wpsManufacturerElement)
      PBDataWriterWriteStringField();
    if (self->_wpsModelName)
      PBDataWriterWriteStringField();
    if (self->_wpsModelNumber)
      PBDataWriterWriteStringField();
    if (self->_wpsPrimaryDeviceTypeCategory)
      PBDataWriterWriteStringField();
    if (self->_wpsPrimaryDeviceTypeSubCategory)
      PBDataWriterWriteStringField();
    if (self->_wpsDeviceNameElement)
      PBDataWriterWriteStringField();
    if (self->_wpsDeviceNameData)
      PBDataWriterWriteStringField();
    if (self->_wpsConfigMethods)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOWiFiBeaconInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 24) = self->_readerMarkPos;
  *((_DWORD *)v5 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_beaconInfo)
    objc_msgSend(v5, "setBeaconInfo:");
  if (self->_wpsResponseType)
    objc_msgSend(v5, "setWpsResponseType:");
  v4 = v5;
  if (self->_wpsManufacturerElement)
  {
    objc_msgSend(v5, "setWpsManufacturerElement:");
    v4 = v5;
  }
  if (self->_wpsModelName)
  {
    objc_msgSend(v5, "setWpsModelName:");
    v4 = v5;
  }
  if (self->_wpsModelNumber)
  {
    objc_msgSend(v5, "setWpsModelNumber:");
    v4 = v5;
  }
  if (self->_wpsPrimaryDeviceTypeCategory)
  {
    objc_msgSend(v5, "setWpsPrimaryDeviceTypeCategory:");
    v4 = v5;
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory)
  {
    objc_msgSend(v5, "setWpsPrimaryDeviceTypeSubCategory:");
    v4 = v5;
  }
  if (self->_wpsDeviceNameElement)
  {
    objc_msgSend(v5, "setWpsDeviceNameElement:");
    v4 = v5;
  }
  if (self->_wpsDeviceNameData)
  {
    objc_msgSend(v5, "setWpsDeviceNameData:");
    v4 = v5;
  }
  if (self->_wpsConfigMethods)
  {
    objc_msgSend(v5, "setWpsConfigMethods:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWiFiBeaconInfo readAll:](self, "readAll:", 0);
    v8 = -[NSData copyWithZone:](self->_beaconInfo, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_wpsResponseType, "copyWithZone:", a3);
    v11 = (void *)v5[11];
    v5[11] = v10;

    v12 = -[NSString copyWithZone:](self->_wpsManufacturerElement, "copyWithZone:", a3);
    v13 = (void *)v5[6];
    v5[6] = v12;

    v14 = -[NSString copyWithZone:](self->_wpsModelName, "copyWithZone:", a3);
    v15 = (void *)v5[7];
    v5[7] = v14;

    v16 = -[NSString copyWithZone:](self->_wpsModelNumber, "copyWithZone:", a3);
    v17 = (void *)v5[8];
    v5[8] = v16;

    v18 = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeCategory, "copyWithZone:", a3);
    v19 = (void *)v5[9];
    v5[9] = v18;

    v20 = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeSubCategory, "copyWithZone:", a3);
    v21 = (void *)v5[10];
    v5[10] = v20;

    v22 = -[NSString copyWithZone:](self->_wpsDeviceNameElement, "copyWithZone:", a3);
    v23 = (void *)v5[5];
    v5[5] = v22;

    v24 = -[NSString copyWithZone:](self->_wpsDeviceNameData, "copyWithZone:", a3);
    v25 = (void *)v5[4];
    v5[4] = v24;

    v26 = -[NSString copyWithZone:](self->_wpsConfigMethods, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v26;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOWiFiBeaconInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *beaconInfo;
  NSString *wpsResponseType;
  NSString *wpsManufacturerElement;
  NSString *wpsModelName;
  NSString *wpsModelNumber;
  NSString *wpsPrimaryDeviceTypeCategory;
  NSString *wpsPrimaryDeviceTypeSubCategory;
  NSString *wpsDeviceNameElement;
  NSString *wpsDeviceNameData;
  NSString *wpsConfigMethods;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOWiFiBeaconInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  beaconInfo = self->_beaconInfo;
  if ((unint64_t)beaconInfo | v4[2])
  {
    if (!-[NSData isEqual:](beaconInfo, "isEqual:"))
      goto LABEL_22;
  }
  wpsResponseType = self->_wpsResponseType;
  if ((unint64_t)wpsResponseType | v4[11] && !-[NSString isEqual:](wpsResponseType, "isEqual:"))
    goto LABEL_22;
  if (((wpsManufacturerElement = self->_wpsManufacturerElement, !((unint64_t)wpsManufacturerElement | v4[6]))
     || -[NSString isEqual:](wpsManufacturerElement, "isEqual:"))
    && ((wpsModelName = self->_wpsModelName, !((unint64_t)wpsModelName | v4[7]))
     || -[NSString isEqual:](wpsModelName, "isEqual:"))
    && ((wpsModelNumber = self->_wpsModelNumber, !((unint64_t)wpsModelNumber | v4[8]))
     || -[NSString isEqual:](wpsModelNumber, "isEqual:"))
    && ((wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory,
         !((unint64_t)wpsPrimaryDeviceTypeCategory | v4[9]))
     || -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:"))
    && ((wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory,
         !((unint64_t)wpsPrimaryDeviceTypeSubCategory | v4[10]))
     || -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:"))
    && ((wpsDeviceNameElement = self->_wpsDeviceNameElement, !((unint64_t)wpsDeviceNameElement | v4[5]))
     || -[NSString isEqual:](wpsDeviceNameElement, "isEqual:"))
    && ((wpsDeviceNameData = self->_wpsDeviceNameData, !((unint64_t)wpsDeviceNameData | v4[4]))
     || -[NSString isEqual:](wpsDeviceNameData, "isEqual:")))
  {
    wpsConfigMethods = self->_wpsConfigMethods;
    if ((unint64_t)wpsConfigMethods | v4[3])
      v15 = -[NSString isEqual:](wpsConfigMethods, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  -[GEOWiFiBeaconInfo readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_beaconInfo, "hash");
  v4 = -[NSString hash](self->_wpsResponseType, "hash") ^ v3;
  v5 = -[NSString hash](self->_wpsManufacturerElement, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_wpsModelName, "hash");
  v7 = -[NSString hash](self->_wpsModelNumber, "hash");
  v8 = v7 ^ -[NSString hash](self->_wpsPrimaryDeviceTypeCategory, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_wpsPrimaryDeviceTypeSubCategory, "hash");
  v10 = -[NSString hash](self->_wpsDeviceNameElement, "hash");
  v11 = v10 ^ -[NSString hash](self->_wpsDeviceNameData, "hash");
  return v9 ^ v11 ^ -[NSString hash](self->_wpsConfigMethods, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[2])
    -[GEOWiFiBeaconInfo setBeaconInfo:](self, "setBeaconInfo:");
  if (v4[11])
    -[GEOWiFiBeaconInfo setWpsResponseType:](self, "setWpsResponseType:");
  if (v4[6])
    -[GEOWiFiBeaconInfo setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  if (v4[7])
    -[GEOWiFiBeaconInfo setWpsModelName:](self, "setWpsModelName:");
  if (v4[8])
    -[GEOWiFiBeaconInfo setWpsModelNumber:](self, "setWpsModelNumber:");
  if (v4[9])
    -[GEOWiFiBeaconInfo setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  if (v4[10])
    -[GEOWiFiBeaconInfo setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  if (v4[5])
    -[GEOWiFiBeaconInfo setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  if (v4[4])
    -[GEOWiFiBeaconInfo setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  if (v4[3])
    -[GEOWiFiBeaconInfo setWpsConfigMethods:](self, "setWpsConfigMethods:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wpsResponseType, 0);
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeSubCategory, 0);
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeCategory, 0);
  objc_storeStrong((id *)&self->_wpsModelNumber, 0);
  objc_storeStrong((id *)&self->_wpsModelName, 0);
  objc_storeStrong((id *)&self->_wpsManufacturerElement, 0);
  objc_storeStrong((id *)&self->_wpsDeviceNameElement, 0);
  objc_storeStrong((id *)&self->_wpsDeviceNameData, 0);
  objc_storeStrong((id *)&self->_wpsConfigMethods, 0);
  objc_storeStrong((id *)&self->_beaconInfo, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
