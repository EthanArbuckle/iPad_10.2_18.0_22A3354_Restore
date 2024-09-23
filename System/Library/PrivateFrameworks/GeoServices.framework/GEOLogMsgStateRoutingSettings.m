@implementation GEOLogMsgStateRoutingSettings

- (GEOLogMsgStateRoutingSettings)init
{
  GEOLogMsgStateRoutingSettings *v2;
  GEOLogMsgStateRoutingSettings *v3;
  GEOLogMsgStateRoutingSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateRoutingSettings;
  v2 = -[GEOLogMsgStateRoutingSettings init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateRoutingSettings)initWithData:(id)a3
{
  GEOLogMsgStateRoutingSettings *v3;
  GEOLogMsgStateRoutingSettings *v4;
  GEOLogMsgStateRoutingSettings *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateRoutingSettings;
  v3 = -[GEOLogMsgStateRoutingSettings initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVirtualGarageSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateRoutingSettingsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVirtualGarageSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasVirtualGarageSettings
{
  -[GEOLogMsgStateRoutingSettings _readVirtualGarageSettings]((uint64_t)self);
  return self->_virtualGarageSettings != 0;
}

- (GEORoutingSettingsVirtualGarageSetttings)virtualGarageSettings
{
  -[GEOLogMsgStateRoutingSettings _readVirtualGarageSettings]((uint64_t)self);
  return self->_virtualGarageSettings;
}

- (void)setVirtualGarageSettings:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_virtualGarageSettings, a3);
}

- (void)_readCyclingPrefs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateRoutingSettingsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCyclingPrefs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCyclingPrefs
{
  -[GEOLogMsgStateRoutingSettings _readCyclingPrefs]((uint64_t)self);
  return self->_cyclingPrefs != 0;
}

- (GEORoutingSettingsCyclingPrefs)cyclingPrefs
{
  -[GEOLogMsgStateRoutingSettings _readCyclingPrefs]((uint64_t)self);
  return self->_cyclingPrefs;
}

- (void)setCyclingPrefs:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_cyclingPrefs, a3);
}

- (void)_readDrivingPrefs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateRoutingSettingsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDrivingPrefs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDrivingPrefs
{
  -[GEOLogMsgStateRoutingSettings _readDrivingPrefs]((uint64_t)self);
  return self->_drivingPrefs != 0;
}

- (GEORoutingSettingsDrivingPrefs)drivingPrefs
{
  -[GEOLogMsgStateRoutingSettings _readDrivingPrefs]((uint64_t)self);
  return self->_drivingPrefs;
}

- (void)setDrivingPrefs:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_drivingPrefs, a3);
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
  v8.super_class = (Class)GEOLogMsgStateRoutingSettings;
  -[GEOLogMsgStateRoutingSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateRoutingSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateRoutingSettings _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "virtualGarageSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("virtualGarageSettings");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("virtual_garage_settings");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "cyclingPrefs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("cyclingPrefs");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("cycling_prefs");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend(a1, "drivingPrefs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("drivingPrefs");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("driving_prefs");
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

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
  return -[GEOLogMsgStateRoutingSettings _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateRoutingSettings)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateRoutingSettings *)-[GEOLogMsgStateRoutingSettings _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORoutingSettingsVirtualGarageSetttings *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORoutingSettingsCyclingPrefs *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEORoutingSettingsDrivingPrefs *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("virtualGarageSettings");
      else
        v6 = CFSTR("virtual_garage_settings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORoutingSettingsVirtualGarageSetttings alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORoutingSettingsVirtualGarageSetttings initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORoutingSettingsVirtualGarageSetttings initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setVirtualGarageSettings:", v9);

      }
      if (a3)
        v11 = CFSTR("cyclingPrefs");
      else
        v11 = CFSTR("cycling_prefs");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORoutingSettingsCyclingPrefs alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORoutingSettingsCyclingPrefs initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORoutingSettingsCyclingPrefs initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setCyclingPrefs:", v14);

      }
      if (a3)
        v16 = CFSTR("drivingPrefs");
      else
        v16 = CFSTR("driving_prefs");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEORoutingSettingsDrivingPrefs alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEORoutingSettingsDrivingPrefs initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEORoutingSettingsDrivingPrefs initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setDrivingPrefs:", v19);

      }
    }
  }

  return a1;
}

- (GEOLogMsgStateRoutingSettings)initWithJSON:(id)a3
{
  return (GEOLogMsgStateRoutingSettings *)-[GEOLogMsgStateRoutingSettings _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7709;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7710;
    GEOLogMsgStateRoutingSettingsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORoutingSettingsVirtualGarageSetttings readAll:](self->_virtualGarageSettings, "readAll:", 1);
    -[GEORoutingSettingsCyclingPrefs readAll:](self->_cyclingPrefs, "readAll:", 1);
    -[GEORoutingSettingsDrivingPrefs readAll:](self->_drivingPrefs, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateRoutingSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateRoutingSettingsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
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
    -[GEOLogMsgStateRoutingSettings readAll:](self, "readAll:", 0);
    if (self->_virtualGarageSettings)
      PBDataWriterWriteSubmessage();
    if (self->_cyclingPrefs)
      PBDataWriterWriteSubmessage();
    if (self->_drivingPrefs)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgStateRoutingSettings readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_virtualGarageSettings)
    objc_msgSend(v5, "setVirtualGarageSettings:");
  if (self->_cyclingPrefs)
    objc_msgSend(v5, "setCyclingPrefs:");
  v4 = v5;
  if (self->_drivingPrefs)
  {
    objc_msgSend(v5, "setDrivingPrefs:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateRoutingSettings readAll:](self, "readAll:", 0);
    v8 = -[GEORoutingSettingsVirtualGarageSetttings copyWithZone:](self->_virtualGarageSettings, "copyWithZone:", a3);
    v9 = (void *)v5[4];
    v5[4] = v8;

    v10 = -[GEORoutingSettingsCyclingPrefs copyWithZone:](self->_cyclingPrefs, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    v12 = -[GEORoutingSettingsDrivingPrefs copyWithZone:](self->_drivingPrefs, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgStateRoutingSettingsReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORoutingSettingsVirtualGarageSetttings *virtualGarageSettings;
  GEORoutingSettingsCyclingPrefs *cyclingPrefs;
  GEORoutingSettingsDrivingPrefs *drivingPrefs;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLogMsgStateRoutingSettings readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         virtualGarageSettings = self->_virtualGarageSettings,
         !((unint64_t)virtualGarageSettings | v4[4]))
     || -[GEORoutingSettingsVirtualGarageSetttings isEqual:](virtualGarageSettings, "isEqual:"))
    && ((cyclingPrefs = self->_cyclingPrefs, !((unint64_t)cyclingPrefs | v4[2]))
     || -[GEORoutingSettingsCyclingPrefs isEqual:](cyclingPrefs, "isEqual:")))
  {
    drivingPrefs = self->_drivingPrefs;
    if ((unint64_t)drivingPrefs | v4[3])
      v8 = -[GEORoutingSettingsDrivingPrefs isEqual:](drivingPrefs, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;

  -[GEOLogMsgStateRoutingSettings readAll:](self, "readAll:", 1);
  v3 = -[GEORoutingSettingsVirtualGarageSetttings hash](self->_virtualGarageSettings, "hash");
  v4 = -[GEORoutingSettingsCyclingPrefs hash](self->_cyclingPrefs, "hash") ^ v3;
  return v4 ^ -[GEORoutingSettingsDrivingPrefs hash](self->_drivingPrefs, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORoutingSettingsVirtualGarageSetttings *virtualGarageSettings;
  uint64_t v5;
  GEORoutingSettingsCyclingPrefs *cyclingPrefs;
  uint64_t v7;
  GEORoutingSettingsDrivingPrefs *drivingPrefs;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  virtualGarageSettings = self->_virtualGarageSettings;
  v5 = v10[4];
  if (virtualGarageSettings)
  {
    if (v5)
      -[GEORoutingSettingsVirtualGarageSetttings mergeFrom:](virtualGarageSettings, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLogMsgStateRoutingSettings setVirtualGarageSettings:](self, "setVirtualGarageSettings:");
  }
  cyclingPrefs = self->_cyclingPrefs;
  v7 = v10[2];
  if (cyclingPrefs)
  {
    if (v7)
      -[GEORoutingSettingsCyclingPrefs mergeFrom:](cyclingPrefs, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOLogMsgStateRoutingSettings setCyclingPrefs:](self, "setCyclingPrefs:");
  }
  drivingPrefs = self->_drivingPrefs;
  v9 = v10[3];
  if (drivingPrefs)
  {
    if (v9)
      -[GEORoutingSettingsDrivingPrefs mergeFrom:](drivingPrefs, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOLogMsgStateRoutingSettings setDrivingPrefs:](self, "setDrivingPrefs:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarageSettings, 0);
  objc_storeStrong((id *)&self->_drivingPrefs, 0);
  objc_storeStrong((id *)&self->_cyclingPrefs, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
