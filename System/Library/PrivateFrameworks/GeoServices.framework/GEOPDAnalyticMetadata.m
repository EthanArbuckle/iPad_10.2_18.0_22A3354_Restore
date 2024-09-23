@implementation GEOPDAnalyticMetadata

- (GEOPDAnalyticMetadata)initWithTraits:(id)a3
{
  id v4;
  GEOPDAnalyticMetadata *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GEOPDAnalyticMetadata;
  v5 = -[GEOPDAnalyticMetadata init](&v22, sel_init);
  if (!v5)
    goto LABEL_27;
  if ((objc_msgSend(v4, "analyticsOptOut") & 1) == 0)
  {
    objc_msgSend(v4, "updateAnalyticsShortSession");
    if (objc_msgSend(v4, "hasSessionId"))
    {
      v6 = objc_msgSend(v4, "sessionId");
      -[GEOPDAnalyticMetadata setSessionId:](v5, "setSessionId:", v6, v7);
    }
    if (objc_msgSend(v4, "hasSessionRelativeTimestamp"))
    {
      objc_msgSend(v4, "sessionRelativeTimestamp");
      -[GEOPDAnalyticMetadata setRelativeTimestamp:](v5, "setRelativeTimestamp:");
    }
  }
  if (objc_msgSend(v4, "hasAppIdentifier"))
  {
    objc_msgSend(v4, "appIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDAnalyticMetadata setAppIdentifier:](v5, "setAppIdentifier:", v8);

  }
  if (objc_msgSend(v4, "hasAppMajorVersion"))
  {
    objc_msgSend(v4, "appMajorVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDAnalyticMetadata setAppMajorVersion:](v5, "setAppMajorVersion:", v9);

  }
  if (objc_msgSend(v4, "hasAppMinorVersion"))
  {
    objc_msgSend(v4, "appMinorVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDAnalyticMetadata setAppMinorVersion:](v5, "setAppMinorVersion:", v10);

  }
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hardwareClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if ((objc_msgSend(v4, "hasHardwareIdentifier") & 1) == 0)
      goto LABEL_20;
LABEL_18:
    objc_msgSend(v4, "hardwareIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[GEOPDAnalyticMetadata setHardwareClass:](v5, "setHardwareClass:", v12);
  if (objc_msgSend(v4, "hasHardwareIdentifier"))
    goto LABEL_18;
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPopulateFakeHardwareIdentifier, (uint64_t)off_1EDF4E398))
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("0,0"));
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v14 = (void *)v13;
    -[GEOPDAnalyticMetadata setHardwareModel:](v5, "setHardwareModel:", v13);

  }
LABEL_20:
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "osAndBuildVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAnalyticMetadata setOsVersion:](v5, "setOsVersion:", v16);

  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "productName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAnalyticMetadata setProductName:](v5, "setProductName:", v18);

  if (objc_msgSend(v4, "hasSource"))
    -[GEOPDAnalyticMetadata setRequestSource:](v5, "setRequestSource:", _PDRSourceForGEOMapServiceTraits_Source(objc_msgSend(v4, "source")));
  if (objc_msgSend(v4, "hasRouteStopCount"))
    -[GEOPDAnalyticMetadata setRouteStopCount:](v5, "setRouteStopCount:", objc_msgSend(v4, "routeStopCount"));
  if (objc_msgSend(v4, "hasSequenceNumber"))
    -[GEOPDAnalyticMetadata setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v4, "sequenceNumber"));
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAnalyticMetadata setIsInternalInstall:](v5, "setIsInternalInstall:", objc_msgSend(v19, "isInternalInstall"));

  -[GEOPDAnalyticMetadata setIsFromApi:](v5, "setIsFromApi:", objc_msgSend(v4, "isAPICall"));
  +[GEOGeoServiceTag defaultTag](GEOGeoServiceTag, "defaultTag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAnalyticMetadata addServiceTag:](v5, "addServiceTag:", v20);

LABEL_27:
  return v5;
}

- (void)setHardwareModel:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x208000u;
  objc_storeStrong((id *)&self->_hardwareModel, a3);
}

- (void)setProductName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x240000u;
  objc_storeStrong((id *)&self->_productName, a3);
}

- (void)setOsVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x220000u;
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (void)setIsInternalInstall:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200040u;
  self->_isInternalInstall = a3;
}

- (void)setIsFromApi:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200020u;
  self->_isFromApi = a3;
}

- (void)setAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200800u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)addServiceTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  -[GEOPDAnalyticMetadata _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
}

- (void)_readServiceTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 166) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceTags_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)setAppMinorVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x202000u;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (void)setAppMajorVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x201000u;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(_DWORD *)&self->_flags |= 0x200001u;
  self->_sessionId = a3;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200010u;
  self->_sequenceNumber = a3;
}

- (void)setRelativeTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200002u;
  self->_relativeTimestamp = a3;
}

- (GEOPDAnalyticMetadata)init
{
  GEOPDAnalyticMetadata *v2;
  GEOPDAnalyticMetadata *v3;
  GEOPDAnalyticMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAnalyticMetadata;
  v2 = -[GEOPDAnalyticMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_loggedAbExperiment, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_hardwareClass, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_abAssignInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $925BF102989D38BAF07877F8029BF610 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $925BF102989D38BAF07877F8029BF610 v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3FFC00) == 0)
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
      goto LABEL_51;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAnalyticMetadata readAll:](self, "readAll:", 0);
  if (self->_appIdentifier)
    PBDataWriterWriteStringField();
  if (self->_appMajorVersion)
    PBDataWriterWriteStringField();
  if (self->_appMinorVersion)
    PBDataWriterWriteStringField();
  if (self->_hardwareModel)
    PBDataWriterWriteStringField();
  if (self->_hardwareClass)
    PBDataWriterWriteStringField();
  if (self->_osVersion)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_18;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_25;
  }
LABEL_24:
  v18 = 0;
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_20;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
LABEL_27:
    PBDataWriterWriteBOOLField();
LABEL_28:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_serviceTags;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  if (self->_productName)
    PBDataWriterWriteStringField();
  if (self->_loggedAbExperiment)
    PBDataWriterWriteStringField();
  if (self->_abAssignInfo)
    PBDataWriterWriteSubmessage();
  if (self->_requestTime)
    PBDataWriterWriteSubmessage();
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v11 = self->_flags;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = self->_flags;
  }
  if ((*(_BYTE *)&v11 & 8) != 0)
    PBDataWriterWriteUint32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
LABEL_51:

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
      v8 = (int *)&readAll__recursiveTag_49;
    else
      v8 = (int *)&readAll__nonRecursiveTag_49;
    GEOPDAnalyticMetadataReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDAnalyticMetadataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDAnalyticMetadata)initWithData:(id)a3
{
  GEOPDAnalyticMetadata *v3;
  GEOPDAnalyticMetadata *v4;
  GEOPDAnalyticMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAnalyticMetadata;
  v3 = -[GEOPDAnalyticMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 165) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppIdentifier_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAppIdentifier
{
  -[GEOPDAnalyticMetadata _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier != 0;
}

- (NSString)appIdentifier
{
  -[GEOPDAnalyticMetadata _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier;
}

- (void)_readAppMajorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 165) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMajorVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAppMajorVersion
{
  -[GEOPDAnalyticMetadata _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion != 0;
}

- (NSString)appMajorVersion
{
  -[GEOPDAnalyticMetadata _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion;
}

- (void)_readAppMinorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 165) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMinorVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAppMinorVersion
{
  -[GEOPDAnalyticMetadata _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion != 0;
}

- (NSString)appMinorVersion
{
  -[GEOPDAnalyticMetadata _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion;
}

- (void)_readHardwareModel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 165) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHardwareModel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasHardwareModel
{
  -[GEOPDAnalyticMetadata _readHardwareModel]((uint64_t)self);
  return self->_hardwareModel != 0;
}

- (NSString)hardwareModel
{
  -[GEOPDAnalyticMetadata _readHardwareModel]((uint64_t)self);
  return self->_hardwareModel;
}

- (void)_readHardwareClass
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 165) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHardwareClass_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasHardwareClass
{
  -[GEOPDAnalyticMetadata _readHardwareClass]((uint64_t)self);
  return self->_hardwareClass != 0;
}

- (NSString)hardwareClass
{
  -[GEOPDAnalyticMetadata _readHardwareClass]((uint64_t)self);
  return self->_hardwareClass;
}

- (void)setHardwareClass:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x204000u;
  objc_storeStrong((id *)&self->_hardwareClass, a3);
}

- (void)_readOsVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 166) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOsVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasOsVersion
{
  -[GEOPDAnalyticMetadata _readOsVersion]((uint64_t)self);
  return self->_osVersion != 0;
}

- (NSString)osVersion
{
  -[GEOPDAnalyticMetadata _readOsVersion]((uint64_t)self);
  return self->_osVersion;
}

- (BOOL)isInternalTool
{
  return self->_isInternalTool;
}

- (void)setIsInternalTool:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200080u;
  self->_isInternalTool = a3;
}

- (void)setHasIsInternalTool:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097280;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsInternalTool
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setHasIsInternalInstall:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097216;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsInternalInstall
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (GEOSessionID)sessionId
{
  GEOSessionID *p_sessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionId = &self->_sessionId;
  high = self->_sessionId._high;
  low = p_sessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x200000);
}

- (BOOL)hasSessionId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097168;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasSequenceNumber
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int)requestSource
{
  os_unfair_lock_s *p_readerLock;
  $925BF102989D38BAF07877F8029BF610 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 4) != 0)
    return self->_requestSource;
  else
    return 0;
}

- (void)setRequestSource:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x200004u;
  self->_requestSource = a3;
}

- (void)setHasRequestSource:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097156;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasRequestSource
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)requestSourceAsString:(int)a3
{
  if (a3 < 0x18)
    return off_1E1C0E750[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SOURCE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFINEMENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPELLING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_CONTACTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_USER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_COMPLETION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_HINT_COMPLETION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_HISTORY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_HINT_HISTORY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_SEARCH")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_AUTOCOMPLETE_SEARCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_FROM")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_TO")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_FROM")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TO")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOKMARK_REFRESH")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRELOADER")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NO_TYPING")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_FAVORITES")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_COLLECTION")) & 1) != 0)
  {
    v4 = 22;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_HINT_COMPLETION")))
  {
    v4 = 23;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isFromApi
{
  return self->_isFromApi;
}

- (void)setHasIsFromApi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097184;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFDFFFDF | v3);
}

- (BOOL)hasIsFromApi
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (NSMutableArray)serviceTags
{
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  return self->_serviceTags;
}

- (void)setServiceTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceTags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;

}

- (void)clearServiceTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  -[NSMutableArray removeAllObjects](self->_serviceTags, "removeAllObjects");
}

- (unint64_t)serviceTagsCount
{
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceTags, "count");
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceTags, "objectAtIndex:", a3);
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (void)_readProductName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 166) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProductName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasProductName
{
  -[GEOPDAnalyticMetadata _readProductName]((uint64_t)self);
  return self->_productName != 0;
}

- (NSString)productName
{
  -[GEOPDAnalyticMetadata _readProductName]((uint64_t)self);
  return self->_productName;
}

- (void)_readLoggedAbExperiment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 166) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLoggedAbExperiment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasLoggedAbExperiment
{
  -[GEOPDAnalyticMetadata _readLoggedAbExperiment]((uint64_t)self);
  return self->_loggedAbExperiment != 0;
}

- (NSString)loggedAbExperiment
{
  -[GEOPDAnalyticMetadata _readLoggedAbExperiment]((uint64_t)self);
  return self->_loggedAbExperiment;
}

- (void)setLoggedAbExperiment:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x210000u;
  objc_storeStrong((id *)&self->_loggedAbExperiment, a3);
}

- (void)_readAbAssignInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 165) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbAssignInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAbAssignInfo
{
  -[GEOPDAnalyticMetadata _readAbAssignInfo]((uint64_t)self);
  return self->_abAssignInfo != 0;
}

- (GEOAbAssignInfo)abAssignInfo
{
  -[GEOPDAnalyticMetadata _readAbAssignInfo]((uint64_t)self);
  return self->_abAssignInfo;
}

- (void)setAbAssignInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200400u;
  objc_storeStrong((id *)&self->_abAssignInfo, a3);
}

- (void)_readRequestTime
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 166) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestTime_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasRequestTime
{
  -[GEOPDAnalyticMetadata _readRequestTime]((uint64_t)self);
  return self->_requestTime != 0;
}

- (GEOLocalTime)requestTime
{
  -[GEOPDAnalyticMetadata _readRequestTime]((uint64_t)self);
  return self->_requestTime;
}

- (void)setRequestTime:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x280000u;
  objc_storeStrong((id *)&self->_requestTime, a3);
}

- (double)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setHasRelativeTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097154;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasRelativeTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)isSiriOriginalRequest
{
  return self->_isSiriOriginalRequest;
}

- (void)setIsSiriOriginalRequest:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200100u;
  self->_isSiriOriginalRequest = a3;
}

- (void)setHasIsSiriOriginalRequest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097408;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsSiriOriginalRequest
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unsigned)routeStopCount
{
  return self->_routeStopCount;
}

- (void)setRouteStopCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200008u;
  self->_routeStopCount = a3;
}

- (void)setHasRouteStopCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097160;
  else
    v3 = 0x200000;
  self->_flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRouteStopCount
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOPDAnalyticMetadata;
  -[GEOPDAnalyticMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAnalyticMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAnalyticMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  int v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  const __CFString *v65;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "appIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("appIdentifier");
    else
      v6 = CFSTR("app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "appMajorVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("appMajorVersion");
    else
      v8 = CFSTR("app_major_version");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "appMinorVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("appMinorVersion");
    else
      v10 = CFSTR("app_minor_version");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend((id)a1, "hardwareModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("hardwareModel");
    else
      v12 = CFSTR("hardware_model");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  objc_msgSend((id)a1, "hardwareClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("hardwareClass");
    else
      v14 = CFSTR("hardware_class");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend((id)a1, "osVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a2)
      v16 = CFSTR("osVersion");
    else
      v16 = CFSTR("os_version");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 162));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v38 = CFSTR("isInternalTool");
    else
      v38 = CFSTR("is_internal_tool");
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

    v17 = *(_DWORD *)(a1 + 164);
    if ((v17 & 0x40) == 0)
    {
LABEL_34:
      if ((v17 & 1) == 0)
        goto LABEL_35;
      goto LABEL_78;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 161));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v40 = CFSTR("isInternalInstall");
  else
    v40 = CFSTR("is_internal_install");
  objc_msgSend(v4, "setObject:forKey:", v39, v40);

  v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 1) == 0)
  {
LABEL_35:
    if ((v17 & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_82;
  }
LABEL_78:
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 24));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v42 = CFSTR("sessionId");
  else
    v42 = CFSTR("session_id");
  objc_msgSend(v4, "setObject:forKey:", v41, v42);

  v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 0x10) == 0)
  {
LABEL_36:
    if ((v17 & 4) == 0)
      goto LABEL_37;
    goto LABEL_86;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 156));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v44 = CFSTR("sequenceNumber");
  else
    v44 = CFSTR("sequence_number");
  objc_msgSend(v4, "setObject:forKey:", v43, v44);

  v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 4) == 0)
  {
LABEL_37:
    if ((v17 & 0x20) == 0)
      goto LABEL_42;
    goto LABEL_38;
  }
LABEL_86:
  v45 = *(int *)(a1 + 148);
  if (v45 >= 0x18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 148));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_1E1C0E750[v45];
  }
  if (a2)
    v65 = CFSTR("requestSource");
  else
    v65 = CFSTR("request_source");
  objc_msgSend(v4, "setObject:forKey:", v46, v65);

  if ((*(_DWORD *)(a1 + 164) & 0x20) != 0)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 160));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("isFromApi");
    else
      v19 = CFSTR("is_from_api");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
LABEL_42:
  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v21 = *(id *)(a1 + 128);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v69 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("serviceTag");
    else
      v28 = CFSTR("service_tag");
    objc_msgSend(v4, "setObject:forKey:", v20, v28);

  }
  objc_msgSend((id)a1, "productName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (a2)
      v30 = CFSTR("productName");
    else
      v30 = CFSTR("product_name");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  objc_msgSend((id)a1, "loggedAbExperiment");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    if (a2)
      v32 = CFSTR("loggedAbExperiment");
    else
      v32 = CFSTR("logged_ab_experiment");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);
  }

  objc_msgSend((id)a1, "abAssignInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("abAssignInfo");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("ab_assign_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  objc_msgSend((id)a1, "requestTime");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("requestTime");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("request_time");
    }
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  v51 = *(_DWORD *)(a1 + 164);
  if ((v51 & 2) == 0)
  {
    if ((v51 & 0x100) == 0)
      goto LABEL_97;
LABEL_111:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 163));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v64 = CFSTR("isSiriOriginalRequest");
    else
      v64 = CFSTR("is_siri_original_request");
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

    if ((*(_DWORD *)(a1 + 164) & 8) == 0)
      goto LABEL_102;
    goto LABEL_98;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 112));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v62 = CFSTR("relativeTimestamp");
  else
    v62 = CFSTR("relative_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v61, v62);

  v51 = *(_DWORD *)(a1 + 164);
  if ((v51 & 0x100) != 0)
    goto LABEL_111;
LABEL_97:
  if ((v51 & 8) != 0)
  {
LABEL_98:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 152));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v53 = CFSTR("routeStopCount");
    else
      v53 = CFSTR("route_stop_count");
    objc_msgSend(v4, "setObject:forKey:", v52, v53);

  }
LABEL_102:
  v54 = *(void **)(a1 + 16);
  if (v54)
  {
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v55, "count"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __51__GEOPDAnalyticMetadata__dictionaryRepresentation___block_invoke;
      v66[3] = &unk_1E1C00600;
      v58 = v57;
      v67 = v58;
      objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v66);
      v59 = v58;

      v56 = v59;
    }
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAnalyticMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDAnalyticMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAnalyticMetadata)initWithDictionary:(id)a3
{
  return (GEOPDAnalyticMetadata *)-[GEOPDAnalyticMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  GEOGeoServiceTag *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEOAbAssignInfo *v57;
  uint64_t v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  GEOLocalTime *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_174;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_174;
  if (a3)
    v6 = CFSTR("appIdentifier");
  else
    v6 = CFSTR("app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setAppIdentifier:", v8);

  }
  if (a3)
    v9 = CFSTR("appMajorVersion");
  else
    v9 = CFSTR("app_major_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setAppMajorVersion:", v11);

  }
  if (a3)
    v12 = CFSTR("appMinorVersion");
  else
    v12 = CFSTR("app_minor_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(a1, "setAppMinorVersion:", v14);

  }
  if (a3)
    v15 = CFSTR("hardwareModel");
  else
    v15 = CFSTR("hardware_model");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(a1, "setHardwareModel:", v17);

  }
  if (a3)
    v18 = CFSTR("hardwareClass");
  else
    v18 = CFSTR("hardware_class");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(a1, "setHardwareClass:", v20);

  }
  if (a3)
    v21 = CFSTR("osVersion");
  else
    v21 = CFSTR("os_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(a1, "setOsVersion:", v23);

  }
  if (a3)
    v24 = CFSTR("isInternalTool");
  else
    v24 = CFSTR("is_internal_tool");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsInternalTool:", objc_msgSend(v25, "BOOLValue"));

  if (a3)
    v26 = CFSTR("isInternalInstall");
  else
    v26 = CFSTR("is_internal_install");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsInternalInstall:", objc_msgSend(v27, "BOOLValue"));

  if (a3)
    v28 = CFSTR("sessionId");
  else
    v28 = CFSTR("session_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v77 = 0;
    v78 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v29, &v77);
    objc_msgSend(a1, "setSessionId:", v77, v78);
  }

  if (a3)
    v30 = CFSTR("sequenceNumber");
  else
    v30 = CFSTR("sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v31, "unsignedIntValue"));

  if (a3)
    v32 = CFSTR("requestSource");
  else
    v32 = CFSTR("request_source");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v33;
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("UNKNOWN_SOURCE")) & 1) != 0)
    {
      v35 = 0;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("URL")) & 1) != 0)
    {
      v35 = 1;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("USER")) & 1) != 0)
    {
      v35 = 2;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("REFINEMENT")) & 1) != 0)
    {
      v35 = 3;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SPELLING")) & 1) != 0)
    {
      v35 = 4;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("HINT_CONTACTS")) & 1) != 0)
    {
      v35 = 5;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("STARK_USER")) & 1) != 0)
    {
      v35 = 6;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("HINT_COMPLETION")) & 1) != 0)
    {
      v35 = 7;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("STARK_HINT_COMPLETION")) & 1) != 0)
    {
      v35 = 8;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("HINT_HISTORY")) & 1) != 0)
    {
      v35 = 9;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("STARK_HINT_HISTORY")) & 1) != 0)
    {
      v35 = 10;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("AUTOCOMPLETE_SEARCH")) & 1) != 0)
    {
      v35 = 11;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("STARK_AUTOCOMPLETE_SEARCH")) & 1) != 0)
    {
      v35 = 12;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_FROM")) & 1) != 0)
    {
      v35 = 13;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_TO")) & 1) != 0)
    {
      v35 = 14;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("NAV_FROM")) & 1) != 0)
    {
      v35 = 15;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("NAV_TO")) & 1) != 0)
    {
      v35 = 16;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("BOOKMARK_REFRESH")) & 1) != 0)
    {
      v35 = 17;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
    {
      v35 = 18;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("PRELOADER")) & 1) != 0)
    {
      v35 = 19;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("USER_NO_TYPING")) & 1) != 0)
    {
      v35 = 20;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("ADD_TO_FAVORITES")) & 1) != 0)
    {
      v35 = 21;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("ADD_TO_COLLECTION")) & 1) != 0)
    {
      v35 = 22;
    }
    else if (objc_msgSend(v34, "isEqualToString:", CFSTR("RAP_HINT_COMPLETION")))
    {
      v35 = 23;
    }
    else
    {
      v35 = 0;
    }

    goto LABEL_109;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = objc_msgSend(v33, "intValue");
LABEL_109:
    objc_msgSend(a1, "setRequestSource:", v35);
  }

  if (a3)
    v36 = CFSTR("isFromApi");
  else
    v36 = CFSTR("is_from_api");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsFromApi:", objc_msgSend(v37, "BOOLValue"));

  if (a3)
    v38 = CFSTR("serviceTag");
  else
    v38 = CFSTR("service_tag");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = v5;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v74 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = [GEOGeoServiceTag alloc];
            if ((a3 & 1) != 0)
              v47 = -[GEOGeoServiceTag initWithJSON:](v46, "initWithJSON:", v45);
            else
              v47 = -[GEOGeoServiceTag initWithDictionary:](v46, "initWithDictionary:", v45);
            v48 = (void *)v47;
            objc_msgSend(a1, "addServiceTag:", v47);

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      }
      while (v42);
    }

    v5 = v72;
  }

  if (a3)
    v49 = CFSTR("productName");
  else
    v49 = CFSTR("product_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(a1, "setProductName:", v51);

  }
  if (a3)
    v52 = CFSTR("loggedAbExperiment");
  else
    v52 = CFSTR("logged_ab_experiment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(a1, "setLoggedAbExperiment:", v54);

  }
  if (a3)
    v55 = CFSTR("abAssignInfo");
  else
    v55 = CFSTR("ab_assign_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEOAbAssignInfo alloc];
    if ((a3 & 1) != 0)
      v58 = -[GEOAbAssignInfo initWithJSON:](v57, "initWithJSON:", v56);
    else
      v58 = -[GEOAbAssignInfo initWithDictionary:](v57, "initWithDictionary:", v56);
    v59 = (void *)v58;
    objc_msgSend(a1, "setAbAssignInfo:", v58);

  }
  if (a3)
    v60 = CFSTR("requestTime");
  else
    v60 = CFSTR("request_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = [GEOLocalTime alloc];
    if ((a3 & 1) != 0)
      v63 = -[GEOLocalTime initWithJSON:](v62, "initWithJSON:", v61);
    else
      v63 = -[GEOLocalTime initWithDictionary:](v62, "initWithDictionary:", v61);
    v64 = (void *)v63;
    objc_msgSend(a1, "setRequestTime:", v63);

  }
  if (a3)
    v65 = CFSTR("relativeTimestamp");
  else
    v65 = CFSTR("relative_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v66, "doubleValue");
    objc_msgSend(a1, "setRelativeTimestamp:");
  }

  if (a3)
    v67 = CFSTR("isSiriOriginalRequest");
  else
    v67 = CFSTR("is_siri_original_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsSiriOriginalRequest:", objc_msgSend(v68, "BOOLValue"));

  if (a3)
    v69 = CFSTR("routeStopCount");
  else
    v69 = CFSTR("route_stop_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteStopCount:", objc_msgSend(v70, "unsignedIntValue"));

LABEL_174:
  return a1;
}

- (GEOPDAnalyticMetadata)initWithJSON:(id)a3
{
  return (GEOPDAnalyticMetadata *)-[GEOPDAnalyticMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAnalyticMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAnalyticMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $925BF102989D38BAF07877F8029BF610 flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;
  $925BF102989D38BAF07877F8029BF610 v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOPDAnalyticMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 34) = self->_readerMarkPos;
  *((_DWORD *)v12 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_appIdentifier)
    objc_msgSend(v12, "setAppIdentifier:");
  if (self->_appMajorVersion)
    objc_msgSend(v12, "setAppMajorVersion:");
  v4 = v12;
  if (self->_appMinorVersion)
  {
    objc_msgSend(v12, "setAppMinorVersion:");
    v4 = v12;
  }
  if (self->_hardwareModel)
  {
    objc_msgSend(v12, "setHardwareModel:");
    v4 = v12;
  }
  if (self->_hardwareClass)
  {
    objc_msgSend(v12, "setHardwareClass:");
    v4 = v12;
  }
  if (self->_osVersion)
  {
    objc_msgSend(v12, "setOsVersion:");
    v4 = v12;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    *((_BYTE *)v4 + 162) = self->_isInternalTool;
    *((_DWORD *)v4 + 41) |= 0x80u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_16;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    goto LABEL_15;
  }
  *((_BYTE *)v4 + 161) = self->_isInternalInstall;
  *((_DWORD *)v4 + 41) |= 0x40u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *(GEOSessionID *)(v4 + 3) = self->_sessionId;
  *((_DWORD *)v4 + 41) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_18;
LABEL_41:
    *((_DWORD *)v4 + 37) = self->_requestSource;
    *((_DWORD *)v4 + 41) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_40:
  *((_DWORD *)v4 + 39) = self->_sequenceNumber;
  *((_DWORD *)v4 + 41) |= 0x10u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    goto LABEL_41;
LABEL_18:
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_19:
    *((_BYTE *)v4 + 160) = self->_isFromApi;
    *((_DWORD *)v4 + 41) |= 0x20u;
  }
LABEL_20:
  if (-[GEOPDAnalyticMetadata serviceTagsCount](self, "serviceTagsCount"))
  {
    objc_msgSend(v12, "clearServiceTags");
    v6 = -[GEOPDAnalyticMetadata serviceTagsCount](self, "serviceTagsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOPDAnalyticMetadata serviceTagAtIndex:](self, "serviceTagAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addServiceTag:", v9);

      }
    }
  }
  if (self->_productName)
    objc_msgSend(v12, "setProductName:");
  v10 = v12;
  if (self->_loggedAbExperiment)
  {
    objc_msgSend(v12, "setLoggedAbExperiment:");
    v10 = v12;
  }
  if (self->_abAssignInfo)
  {
    objc_msgSend(v12, "setAbAssignInfo:");
    v10 = v12;
  }
  if (self->_requestTime)
  {
    objc_msgSend(v12, "setRequestTime:");
    v10 = v12;
  }
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 2) == 0)
  {
    if ((*(_WORD *)&v11 & 0x100) == 0)
      goto LABEL_34;
LABEL_44:
    *((_BYTE *)v10 + 163) = self->_isSiriOriginalRequest;
    *((_DWORD *)v10 + 41) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 8) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  v10[14] = *(id *)&self->_relativeTimestamp;
  *((_DWORD *)v10 + 41) |= 2u;
  v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x100) != 0)
    goto LABEL_44;
LABEL_34:
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
LABEL_35:
    *((_DWORD *)v10 + 38) = self->_routeStopCount;
    *((_DWORD *)v10 + 41) |= 8u;
  }
LABEL_36:

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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  $925BF102989D38BAF07877F8029BF610 flags;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  $925BF102989D38BAF07877F8029BF610 v35;
  PBUnknownFields *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAnalyticMetadata readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v9;

    v11 = -[NSString copyWithZone:](self->_appMajorVersion, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v11;

    v13 = -[NSString copyWithZone:](self->_appMinorVersion, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v13;

    v15 = -[NSString copyWithZone:](self->_hardwareModel, "copyWithZone:", a3);
    v16 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v15;

    v17 = -[NSString copyWithZone:](self->_hardwareClass, "copyWithZone:", a3);
    v18 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v17;

    v19 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
    v20 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v19;

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x80) != 0)
    {
      *(_BYTE *)(v5 + 162) = self->_isInternalTool;
      *(_DWORD *)(v5 + 164) |= 0x80u;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 0x40) == 0)
      {
LABEL_7:
        if ((*(_BYTE *)&flags & 1) == 0)
          goto LABEL_8;
        goto LABEL_27;
      }
    }
    else if ((*(_BYTE *)&flags & 0x40) == 0)
    {
      goto LABEL_7;
    }
    *(_BYTE *)(v5 + 161) = self->_isInternalInstall;
    *(_DWORD *)(v5 + 164) |= 0x40u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_28;
    }
LABEL_27:
    *(GEOSessionID *)(v5 + 24) = self->_sessionId;
    *(_DWORD *)(v5 + 164) |= 1u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_10;
      goto LABEL_29;
    }
LABEL_28:
    *(_DWORD *)(v5 + 156) = self->_sequenceNumber;
    *(_DWORD *)(v5 + 164) |= 0x10u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_29:
    *(_DWORD *)(v5 + 148) = self->_requestSource;
    *(_DWORD *)(v5 + 164) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
    {
LABEL_12:
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v22 = self->_serviceTags;
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v22);
            v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v38);
            objc_msgSend((id)v5, "addServiceTag:", v26);

          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v23);
      }

      v27 = -[NSString copyWithZone:](self->_productName, "copyWithZone:", a3);
      v28 = *(void **)(v5 + 104);
      *(_QWORD *)(v5 + 104) = v27;

      v29 = -[NSString copyWithZone:](self->_loggedAbExperiment, "copyWithZone:", a3);
      v30 = *(void **)(v5 + 88);
      *(_QWORD *)(v5 + 88) = v29;

      v31 = -[GEOAbAssignInfo copyWithZone:](self->_abAssignInfo, "copyWithZone:", a3);
      v32 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v31;

      v33 = -[GEOLocalTime copyWithZone:](self->_requestTime, "copyWithZone:", a3);
      v34 = *(void **)(v5 + 120);
      *(_QWORD *)(v5 + 120) = v33;

      v35 = self->_flags;
      if ((*(_BYTE *)&v35 & 2) != 0)
      {
        *(double *)(v5 + 112) = self->_relativeTimestamp;
        *(_DWORD *)(v5 + 164) |= 2u;
        v35 = self->_flags;
        if ((*(_WORD *)&v35 & 0x100) == 0)
        {
LABEL_21:
          if ((*(_BYTE *)&v35 & 8) == 0)
          {
LABEL_23:
            v36 = self->_unknownFields;
            v8 = *(id *)(v5 + 16);
            *(_QWORD *)(v5 + 16) = v36;
            goto LABEL_24;
          }
LABEL_22:
          *(_DWORD *)(v5 + 152) = self->_routeStopCount;
          *(_DWORD *)(v5 + 164) |= 8u;
          goto LABEL_23;
        }
      }
      else if ((*(_WORD *)&v35 & 0x100) == 0)
      {
        goto LABEL_21;
      }
      *(_BYTE *)(v5 + 163) = self->_isSiriOriginalRequest;
      *(_DWORD *)(v5 + 164) |= 0x100u;
      if ((*(_DWORD *)&self->_flags & 8) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
LABEL_11:
    *(_BYTE *)(v5 + 160) = self->_isFromApi;
    *(_DWORD *)(v5 + 164) |= 0x20u;
    goto LABEL_12;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDAnalyticMetadataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appIdentifier;
  NSString *appMajorVersion;
  NSString *appMinorVersion;
  NSString *hardwareModel;
  NSString *hardwareClass;
  NSString *osVersion;
  $925BF102989D38BAF07877F8029BF610 flags;
  int v12;
  NSMutableArray *serviceTags;
  NSString *productName;
  NSString *loggedAbExperiment;
  GEOAbAssignInfo *abAssignInfo;
  GEOLocalTime *requestTime;
  $925BF102989D38BAF07877F8029BF610 v19;
  int v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_85;
  -[GEOPDAnalyticMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:"))
      goto LABEL_85;
  }
  appMajorVersion = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:"))
      goto LABEL_85;
  }
  appMinorVersion = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:"))
      goto LABEL_85;
  }
  hardwareModel = self->_hardwareModel;
  if ((unint64_t)hardwareModel | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](hardwareModel, "isEqual:"))
      goto LABEL_85;
  }
  hardwareClass = self->_hardwareClass;
  if ((unint64_t)hardwareClass | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](hardwareClass, "isEqual:"))
      goto LABEL_85;
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:"))
      goto LABEL_85;
  }
  flags = self->_flags;
  v12 = *((_DWORD *)v4 + 41);
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0)
      goto LABEL_85;
    if (self->_isInternalTool)
    {
      if (!*((_BYTE *)v4 + 162))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 162))
    {
      goto LABEL_85;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0)
      goto LABEL_85;
    if (self->_isInternalInstall)
    {
      if (!*((_BYTE *)v4 + 161))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 161))
    {
      goto LABEL_85;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&flags & 1) != 0 && (v12 & 1) != 0)
  {
    if (self->_sessionId._high != *((_QWORD *)v4 + 3) || self->_sessionId._low != *((_QWORD *)v4 + 4))
      goto LABEL_85;
  }
  else if (((*(_DWORD *)&flags | v12) & 1) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 39))
      goto LABEL_85;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_requestSource != *((_DWORD *)v4 + 37))
      goto LABEL_85;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0)
      goto LABEL_85;
    if (self->_isFromApi)
    {
      if (!*((_BYTE *)v4 + 160))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 160))
    {
      goto LABEL_85;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_85;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((_QWORD *)v4 + 16)
    && !-[NSMutableArray isEqual:](serviceTags, "isEqual:"))
  {
    goto LABEL_85;
  }
  productName = self->_productName;
  if ((unint64_t)productName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](productName, "isEqual:"))
      goto LABEL_85;
  }
  loggedAbExperiment = self->_loggedAbExperiment;
  if ((unint64_t)loggedAbExperiment | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](loggedAbExperiment, "isEqual:"))
      goto LABEL_85;
  }
  abAssignInfo = self->_abAssignInfo;
  if ((unint64_t)abAssignInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOAbAssignInfo isEqual:](abAssignInfo, "isEqual:"))
      goto LABEL_85;
  }
  requestTime = self->_requestTime;
  if ((unint64_t)requestTime | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOLocalTime isEqual:](requestTime, "isEqual:"))
      goto LABEL_85;
  }
  v19 = self->_flags;
  v20 = *((_DWORD *)v4 + 41);
  if ((*(_BYTE *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_relativeTimestamp != *((double *)v4 + 14))
      goto LABEL_85;
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&v19 & 0x100) != 0)
  {
    if ((v20 & 0x100) != 0)
    {
      if (self->_isSiriOriginalRequest)
      {
        if (!*((_BYTE *)v4 + 163))
          goto LABEL_85;
        goto LABEL_80;
      }
      if (!*((_BYTE *)v4 + 163))
        goto LABEL_80;
    }
LABEL_85:
    v21 = 0;
    goto LABEL_86;
  }
  if ((v20 & 0x100) != 0)
    goto LABEL_85;
LABEL_80:
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_routeStopCount != *((_DWORD *)v4 + 38))
      goto LABEL_85;
    v21 = 1;
  }
  else
  {
    v21 = (*((_DWORD *)v4 + 41) & 8) == 0;
  }
LABEL_86:

  return v21;
}

- (unint64_t)hash
{
  $925BF102989D38BAF07877F8029BF610 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  $925BF102989D38BAF07877F8029BF610 v11;
  unint64_t v12;
  double relativeTimestamp;
  double v14;
  long double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;

  -[GEOPDAnalyticMetadata readAll:](self, "readAll:", 1);
  v30 = -[NSString hash](self->_appIdentifier, "hash");
  v29 = -[NSString hash](self->_appMajorVersion, "hash");
  v28 = -[NSString hash](self->_appMinorVersion, "hash");
  v27 = -[NSString hash](self->_hardwareModel, "hash");
  v26 = -[NSString hash](self->_hardwareClass, "hash");
  v25 = -[NSString hash](self->_osVersion, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    v24 = 2654435761 * self->_isInternalTool;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_isInternalInstall;
      if ((*(_BYTE *)&flags & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v24 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
LABEL_4:
    v22 = PBHashBytes();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v22 = 0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_5:
    v20 = 2654435761 * self->_sequenceNumber;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_6;
LABEL_12:
    v4 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v20 = 0;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_12;
LABEL_6:
  v4 = 2654435761 * self->_requestSource;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_7:
    v5 = 2654435761 * self->_isFromApi;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
LABEL_14:
  v6 = -[NSMutableArray hash](self->_serviceTags, "hash", v20);
  v7 = -[NSString hash](self->_productName, "hash");
  v8 = -[NSString hash](self->_loggedAbExperiment, "hash");
  v9 = -[GEOAbAssignInfo hash](self->_abAssignInfo, "hash");
  v10 = -[GEOLocalTime hash](self->_requestTime, "hash");
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 2) != 0)
  {
    relativeTimestamp = self->_relativeTimestamp;
    v14 = -relativeTimestamp;
    if (relativeTimestamp >= 0.0)
      v14 = self->_relativeTimestamp;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    v17 = 2654435761 * self->_isSiriOriginalRequest;
    if ((*(_BYTE *)&v11 & 8) != 0)
      goto LABEL_24;
LABEL_26:
    v18 = 0;
    return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ v18;
  }
  v17 = 0;
  if ((*(_BYTE *)&v11 & 8) == 0)
    goto LABEL_26;
LABEL_24:
  v18 = 2654435761 * self->_routeStopCount;
  return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  GEOAbAssignInfo *abAssignInfo;
  uint64_t v12;
  GEOLocalTime *requestTime;
  uint64_t v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 6))
    -[GEOPDAnalyticMetadata setAppIdentifier:](self, "setAppIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[GEOPDAnalyticMetadata setAppMajorVersion:](self, "setAppMajorVersion:");
  if (*((_QWORD *)v4 + 8))
    -[GEOPDAnalyticMetadata setAppMinorVersion:](self, "setAppMinorVersion:");
  if (*((_QWORD *)v4 + 10))
    -[GEOPDAnalyticMetadata setHardwareModel:](self, "setHardwareModel:");
  if (*((_QWORD *)v4 + 9))
    -[GEOPDAnalyticMetadata setHardwareClass:](self, "setHardwareClass:");
  if (*((_QWORD *)v4 + 12))
    -[GEOPDAnalyticMetadata setOsVersion:](self, "setOsVersion:");
  v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 0x80) != 0)
  {
    self->_isInternalTool = v4[162];
    *(_DWORD *)&self->_flags |= 0x80u;
    v5 = *((_DWORD *)v4 + 41);
    if ((v5 & 0x40) == 0)
    {
LABEL_15:
      if ((v5 & 1) == 0)
        goto LABEL_16;
      goto LABEL_36;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_15;
  }
  self->_isInternalInstall = v4[161];
  *(_DWORD *)&self->_flags |= 0x40u;
  v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_sessionId = *(GEOSessionID *)(v4 + 24);
  *(_DWORD *)&self->_flags |= 1u;
  v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 0x10) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  self->_sequenceNumber = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_flags |= 0x10u;
  v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 4) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_38:
  self->_requestSource = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 41) & 0x20) != 0)
  {
LABEL_19:
    self->_isFromApi = v4[160];
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_20:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *((id *)v4 + 16);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        -[GEOPDAnalyticMetadata addServiceTag:](self, "addServiceTag:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 13))
    -[GEOPDAnalyticMetadata setProductName:](self, "setProductName:");
  if (*((_QWORD *)v4 + 11))
    -[GEOPDAnalyticMetadata setLoggedAbExperiment:](self, "setLoggedAbExperiment:");
  abAssignInfo = self->_abAssignInfo;
  v12 = *((_QWORD *)v4 + 5);
  if (abAssignInfo)
  {
    if (v12)
      -[GEOAbAssignInfo mergeFrom:](abAssignInfo, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOPDAnalyticMetadata setAbAssignInfo:](self, "setAbAssignInfo:");
  }
  requestTime = self->_requestTime;
  v14 = *((_QWORD *)v4 + 15);
  if (requestTime)
  {
    if (v14)
      -[GEOLocalTime mergeFrom:](requestTime, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOPDAnalyticMetadata setRequestTime:](self, "setRequestTime:");
  }
  v15 = *((_DWORD *)v4 + 41);
  if ((v15 & 2) == 0)
  {
    if ((v15 & 0x100) == 0)
      goto LABEL_49;
LABEL_53:
    self->_isSiriOriginalRequest = v4[163];
    *(_DWORD *)&self->_flags |= 0x100u;
    if ((*((_DWORD *)v4 + 41) & 8) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
  self->_relativeTimestamp = *((double *)v4 + 14);
  *(_DWORD *)&self->_flags |= 2u;
  v15 = *((_DWORD *)v4 + 41);
  if ((v15 & 0x100) != 0)
    goto LABEL_53;
LABEL_49:
  if ((v15 & 8) != 0)
  {
LABEL_50:
    self->_routeStopCount = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 8u;
  }
LABEL_51:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAnalyticMetadataReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_9);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200200u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAnalyticMetadata readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_serviceTags;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEOAbAssignInfo clearUnknownFields:](self->_abAssignInfo, "clearUnknownFields:", 1);
    -[GEOLocalTime clearUnknownFields:](self->_requestTime, "clearUnknownFields:", 1);
  }
}

@end
