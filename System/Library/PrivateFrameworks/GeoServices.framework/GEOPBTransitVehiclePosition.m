@implementation GEOPBTransitVehiclePosition

+ (id)transitVehiclePositionForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__GEOPBTransitVehiclePosition_PlaceDataExtras__transitVehiclePositionForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 62, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __83__GEOPBTransitVehiclePosition_PlaceDataExtras__transitVehiclePositionForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitVehiclePosition](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPBTransitVehiclePosition)init
{
  GEOPBTransitVehiclePosition *v2;
  GEOPBTransitVehiclePosition *v3;
  GEOPBTransitVehiclePosition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitVehiclePosition;
  v2 = -[GEOPBTransitVehiclePosition init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitVehiclePosition)initWithData:(id)a3
{
  GEOPBTransitVehiclePosition *v3;
  GEOPBTransitVehiclePosition *v4;
  GEOPBTransitVehiclePosition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitVehiclePosition;
  v3 = -[GEOPBTransitVehiclePosition initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)tripId
{
  return self->_tripId;
}

- (void)setTripId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_tripId = a3;
}

- (void)setHasTripId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTripId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readLatLng
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatLng_tags_955);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasLatLng
{
  -[GEOPBTransitVehiclePosition _readLatLng]((uint64_t)self);
  return self->_latLng != 0;
}

- (GEOLatLng)latLng
{
  -[GEOPBTransitVehiclePosition _readLatLng]((uint64_t)self);
  return self->_latLng;
}

- (void)setLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (float)bearing
{
  return self->_bearing;
}

- (void)setBearing:(float)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_bearing = a3;
}

- (void)setHasBearing:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasBearing
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSpeed
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readDirectionName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDirectionName
{
  -[GEOPBTransitVehiclePosition _readDirectionName]((uint64_t)self);
  return self->_directionName != 0;
}

- (NSString)directionName
{
  -[GEOPBTransitVehiclePosition _readDirectionName]((uint64_t)self);
  return self->_directionName;
}

- (void)setDirectionName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_directionName, a3);
}

- (void)_readHeadsign
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHeadsign_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasHeadsign
{
  -[GEOPBTransitVehiclePosition _readHeadsign]((uint64_t)self);
  return self->_headsign != 0;
}

- (NSString)headsign
{
  -[GEOPBTransitVehiclePosition _readHeadsign]((uint64_t)self);
  return self->_headsign;
}

- (void)setHeadsign:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_headsign, a3);
}

- (void)_readModeShield
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModeShield_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasModeShield
{
  -[GEOPBTransitVehiclePosition _readModeShield]((uint64_t)self);
  return self->_modeShield != 0;
}

- (GEOPBTransitShield)modeShield
{
  -[GEOPBTransitVehiclePosition _readModeShield]((uint64_t)self);
  return self->_modeShield;
}

- (void)setModeShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_modeShield, a3);
}

- (void)_readColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readColor_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasColor
{
  -[GEOPBTransitVehiclePosition _readColor]((uint64_t)self);
  return self->_color != 0;
}

- (NSString)color
{
  -[GEOPBTransitVehiclePosition _readColor]((uint64_t)self);
  return self->_color;
}

- (void)setColor:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_color, a3);
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_956);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOPBTransitVehiclePosition _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitVehiclePosition _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_957);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasArtwork
{
  -[GEOPBTransitVehiclePosition _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOPBTransitVehiclePosition _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_artwork, a3);
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
  v8.super_class = (Class)GEOPBTransitVehiclePosition;
  -[GEOPBTransitVehiclePosition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitVehiclePosition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitVehiclePosition _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  double v11;
  __int16 v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 116) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("tripId");
    else
      v6 = CFSTR("trip_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "latLng");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("latLng");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("lat_lng");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v12 = *(_WORD *)(a1 + 116);
  if ((v12 & 1) == 0)
  {
    if ((v12 & 4) == 0)
      goto LABEL_14;
LABEL_27:
    LODWORD(v11) = *(_DWORD *)(a1 + 108);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("bearing"));

    if ((*(_WORD *)(a1 + 116) & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("time"));

  v12 = *(_WORD *)(a1 + 116);
  if ((v12 & 4) != 0)
    goto LABEL_27;
LABEL_14:
  if ((v12 & 8) != 0)
  {
LABEL_15:
    LODWORD(v11) = *(_DWORD *)(a1 + 112);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("speed"));

  }
LABEL_16:
  objc_msgSend((id)a1, "directionName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("directionName");
    else
      v15 = CFSTR("direction_name");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  objc_msgSend((id)a1, "headsign");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("headsign"));

  objc_msgSend((id)a1, "modeShield");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("modeShield");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("mode_shield");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend((id)a1, "color");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("color"));

  objc_msgSend((id)a1, "styleAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  objc_msgSend((id)a1, "artwork");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v28, "jsonRepresentation");
    else
      objc_msgSend(v28, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("artwork"));

  }
  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __57__GEOPBTransitVehiclePosition__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitVehiclePosition _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPBTransitVehiclePosition__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitVehiclePosition)initWithDictionary:(id)a3
{
  return (GEOPBTransitVehiclePosition *)-[GEOPBTransitVehiclePosition _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOLatLng *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOPBTransitShield *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOStyleAttributes *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  GEOPBTransitArtwork *v34;
  uint64_t v35;
  void *v36;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tripId");
      else
        v6 = CFSTR("trip_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTripId:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("latLng");
      else
        v8 = CFSTR("lat_lng");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOLatLng initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOLatLng initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setLatLng:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("time"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTime:", objc_msgSend(v13, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bearing"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "floatValue");
        objc_msgSend(a1, "setBearing:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("speed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "floatValue");
        objc_msgSend(a1, "setSpeed:");
      }

      if (a3)
        v16 = CFSTR("directionName");
      else
        v16 = CFSTR("direction_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setDirectionName:", v18);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("headsign"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(a1, "setHeadsign:", v20);

      }
      if (a3)
        v21 = CFSTR("modeShield");
      else
        v21 = CFSTR("mode_shield");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEOPBTransitShield alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEOPBTransitShield initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEOPBTransitShield initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setModeShield:", v24);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("color"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(a1, "setColor:", v27);

      }
      if (a3)
        v28 = CFSTR("styleAttributes");
      else
        v28 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v31 = -[GEOStyleAttributes initWithJSON:](v30, "initWithJSON:", v29);
        else
          v31 = -[GEOStyleAttributes initWithDictionary:](v30, "initWithDictionary:", v29);
        v32 = (void *)v31;
        objc_msgSend(a1, "setStyleAttributes:", v31);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v35 = -[GEOPBTransitArtwork initWithJSON:](v34, "initWithJSON:", v33);
        else
          v35 = -[GEOPBTransitArtwork initWithDictionary:](v34, "initWithDictionary:", v33);
        v36 = (void *)v35;
        objc_msgSend(a1, "setArtwork:", v35);

      }
    }
  }

  return a1;
}

- (GEOPBTransitVehiclePosition)initWithJSON:(id)a3
{
  return (GEOPBTransitVehiclePosition *)-[GEOPBTransitVehiclePosition _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_981;
    else
      v8 = (int *)&readAll__nonRecursiveTag_982;
    GEOPBTransitVehiclePositionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBTransitVehiclePositionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitVehiclePositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitVehiclePositionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitVehiclePositionIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_28;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitVehiclePosition readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint64Field();
  v5 = v9;
  if (self->_latLng)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_9;
LABEL_25:
    PBDataWriterWriteFloatField();
    v5 = v9;
    if ((*(_WORD *)&self->_flags & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  v5 = v9;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_25;
LABEL_9:
  if ((flags & 8) != 0)
  {
LABEL_10:
    PBDataWriterWriteFloatField();
    v5 = v9;
  }
LABEL_11:
  if (self->_directionName)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  if (self->_headsign)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  if (self->_modeShield)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  if (self->_color)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  if (self->_styleAttributes)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  if (self->_artwork)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_28:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPBTransitVehiclePosition _readLatLng]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_latLng, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOPBTransitVehiclePosition readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 24) = self->_readerMarkPos;
  *((_DWORD *)v6 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v6[11] = (id)self->_tripId;
    *((_WORD *)v6 + 58) |= 2u;
  }
  if (self->_latLng)
  {
    objc_msgSend(v6, "setLatLng:");
    v4 = v6;
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v4[10] = (id)self->_time;
    *((_WORD *)v4 + 58) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 27) = LODWORD(self->_bearing);
  *((_WORD *)v4 + 58) |= 4u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 28) = LODWORD(self->_speed);
    *((_WORD *)v4 + 58) |= 8u;
  }
LABEL_9:
  if (self->_directionName)
  {
    objc_msgSend(v6, "setDirectionName:");
    v4 = v6;
  }
  if (self->_headsign)
  {
    objc_msgSend(v6, "setHeadsign:");
    v4 = v6;
  }
  if (self->_modeShield)
  {
    objc_msgSend(v6, "setModeShield:");
    v4 = v6;
  }
  if (self->_color)
  {
    objc_msgSend(v6, "setColor:");
    v4 = v6;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v6, "setStyleAttributes:");
    v4 = v6;
  }
  if (self->_artwork)
  {
    objc_msgSend(v6, "setArtwork:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  __int16 flags;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  PBUnknownFields *v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBTransitVehiclePosition readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      *(_QWORD *)(v5 + 88) = self->_tripId;
      *(_WORD *)(v5 + 116) |= 2u;
    }
    v9 = -[GEOLatLng copyWithZone:](self->_latLng, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v9;

    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      *(_QWORD *)(v5 + 80) = self->_time;
      *(_WORD *)(v5 + 116) |= 1u;
      flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0)
        {
LABEL_11:
          v12 = -[NSString copyWithZone:](self->_directionName, "copyWithZone:", a3);
          v13 = *(void **)(v5 + 40);
          *(_QWORD *)(v5 + 40) = v12;

          v14 = -[NSString copyWithZone:](self->_headsign, "copyWithZone:", a3);
          v15 = *(void **)(v5 + 48);
          *(_QWORD *)(v5 + 48) = v14;

          v16 = -[GEOPBTransitShield copyWithZone:](self->_modeShield, "copyWithZone:", a3);
          v17 = *(void **)(v5 + 64);
          *(_QWORD *)(v5 + 64) = v16;

          v18 = -[NSString copyWithZone:](self->_color, "copyWithZone:", a3);
          v19 = *(void **)(v5 + 32);
          *(_QWORD *)(v5 + 32) = v18;

          v20 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
          v21 = *(void **)(v5 + 72);
          *(_QWORD *)(v5 + 72) = v20;

          v22 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
          v23 = *(void **)(v5 + 24);
          *(_QWORD *)(v5 + 24) = v22;

          v24 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v24;
          goto LABEL_12;
        }
LABEL_10:
        *(float *)(v5 + 112) = self->_speed;
        *(_WORD *)(v5 + 116) |= 8u;
        goto LABEL_11;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_9;
    }
    *(float *)(v5 + 108) = self->_bearing;
    *(_WORD *)(v5 + 116) |= 4u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPBTransitVehiclePositionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_12:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOLatLng *latLng;
  NSString *directionName;
  NSString *headsign;
  GEOPBTransitShield *modeShield;
  NSString *color;
  GEOStyleAttributes *styleAttributes;
  GEOPBTransitArtwork *artwork;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[GEOPBTransitVehiclePosition readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 58);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_tripId != *((_QWORD *)v4 + 11))
      goto LABEL_37;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_37;
  }
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:"))
    {
LABEL_37:
      v14 = 0;
      goto LABEL_38;
    }
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 58);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_time != *((_QWORD *)v4 + 10))
      goto LABEL_37;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_37;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bearing != *((float *)v4 + 27))
      goto LABEL_37;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_speed != *((float *)v4 + 28))
      goto LABEL_37;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }
  directionName = self->_directionName;
  if ((unint64_t)directionName | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](directionName, "isEqual:"))
  {
    goto LABEL_37;
  }
  headsign = self->_headsign;
  if ((unint64_t)headsign | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](headsign, "isEqual:"))
      goto LABEL_37;
  }
  modeShield = self->_modeShield;
  if ((unint64_t)modeShield | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPBTransitShield isEqual:](modeShield, "isEqual:"))
      goto LABEL_37;
  }
  color = self->_color;
  if ((unint64_t)color | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](color, "isEqual:"))
      goto LABEL_37;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_37;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 3))
    v14 = -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:");
  else
    v14 = 1;
LABEL_38:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  __int16 flags;
  unint64_t v6;
  float bearing;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  float speed;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  unint64_t v20;
  NSUInteger v21;
  unint64_t v22;

  -[GEOPBTransitVehiclePosition readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v3 = 2654435761u * self->_tripId;
  else
    v3 = 0;
  v4 = -[GEOLatLng hash](self->_latLng, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v6 = 2654435761u * self->_time;
    if ((flags & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v11 = 0;
    goto LABEL_14;
  }
  v6 = 0;
  if ((flags & 4) == 0)
    goto LABEL_11;
LABEL_6:
  bearing = self->_bearing;
  v8 = bearing;
  if (bearing < 0.0)
    v8 = -bearing;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_14:
  if ((flags & 8) != 0)
  {
    speed = self->_speed;
    v14 = speed;
    if (speed < 0.0)
      v14 = -speed;
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
  v17 = v4 ^ v3 ^ v6 ^ v11 ^ v12;
  v18 = -[NSString hash](self->_directionName, "hash");
  v19 = v17 ^ v18 ^ -[NSString hash](self->_headsign, "hash");
  v20 = -[GEOPBTransitShield hash](self->_modeShield, "hash");
  v21 = v20 ^ -[NSString hash](self->_color, "hash");
  v22 = v19 ^ v21 ^ -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  return v22 ^ -[GEOPBTransitArtwork hash](self->_artwork, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  GEOLatLng *latLng;
  unint64_t v6;
  __int16 v7;
  GEOPBTransitShield *modeShield;
  unint64_t v9;
  GEOStyleAttributes *styleAttributes;
  unint64_t v11;
  GEOPBTransitArtwork *artwork;
  unint64_t v13;
  unint64_t *v14;

  v14 = (unint64_t *)a3;
  objc_msgSend(v14, "readAll:", 0);
  v4 = v14;
  if ((*((_WORD *)v14 + 58) & 2) != 0)
  {
    self->_tripId = v14[11];
    *(_WORD *)&self->_flags |= 2u;
  }
  latLng = self->_latLng;
  v6 = v14[7];
  if (latLng)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPBTransitVehiclePosition setLatLng:](self, "setLatLng:");
  }
  v4 = v14;
LABEL_9:
  v7 = *((_WORD *)v4 + 58);
  if ((v7 & 1) != 0)
  {
    self->_time = v4[10];
    *(_WORD *)&self->_flags |= 1u;
    v7 = *((_WORD *)v4 + 58);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_bearing = *((float *)v4 + 27);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v4 + 58) & 8) != 0)
  {
LABEL_12:
    self->_speed = *((float *)v4 + 28);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_13:
  if (v4[5])
  {
    -[GEOPBTransitVehiclePosition setDirectionName:](self, "setDirectionName:");
    v4 = v14;
  }
  if (v4[6])
  {
    -[GEOPBTransitVehiclePosition setHeadsign:](self, "setHeadsign:");
    v4 = v14;
  }
  modeShield = self->_modeShield;
  v9 = v4[8];
  if (modeShield)
  {
    if (!v9)
      goto LABEL_26;
    -[GEOPBTransitShield mergeFrom:](modeShield, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_26;
    -[GEOPBTransitVehiclePosition setModeShield:](self, "setModeShield:");
  }
  v4 = v14;
LABEL_26:
  if (v4[4])
  {
    -[GEOPBTransitVehiclePosition setColor:](self, "setColor:");
    v4 = v14;
  }
  styleAttributes = self->_styleAttributes;
  v11 = v4[9];
  if (styleAttributes)
  {
    if (!v11)
      goto LABEL_34;
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_34;
    -[GEOPBTransitVehiclePosition setStyleAttributes:](self, "setStyleAttributes:");
  }
  v4 = v14;
LABEL_34:
  artwork = self->_artwork;
  v13 = v4[3];
  if (artwork)
  {
    if (v13)
    {
      -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
LABEL_39:
      v4 = v14;
    }
  }
  else if (v13)
  {
    -[GEOPBTransitVehiclePosition setArtwork:](self, "setArtwork:");
    goto LABEL_39;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitVehiclePositionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_985);
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
  *(_WORD *)&self->_flags |= 0x1010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitVehiclePosition readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_latLng, "clearUnknownFields:", 1);
    -[GEOPBTransitShield clearUnknownFields:](self->_modeShield, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artwork, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_modeShield, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_headsign, 0);
  objc_storeStrong((id *)&self->_directionName, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (unint64_t)tripID
{
  if (-[GEOPBTransitVehiclePosition hasTripId](self, "hasTripId"))
    return -[GEOPBTransitVehiclePosition tripId](self, "tripId");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[GEOPBTransitVehiclePosition hasLatLng](self, "hasLatLng"))
  {
    -[GEOPBTransitVehiclePosition latLng](self, "latLng");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinate");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = 0xC066800000000000;
    v7 = 0xC066800000000000;
  }
  v8 = *(double *)&v5;
  v9 = *(double *)&v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (double)heading
{
  _BOOL4 v3;
  double result;
  float v5;

  v3 = -[GEOPBTransitVehiclePosition hasBearing](self, "hasBearing");
  result = -1.0;
  if (v3)
  {
    -[GEOPBTransitVehiclePosition bearing](self, "bearing", -1.0);
    return v5;
  }
  return result;
}

- (NSString)direction
{
  void *v3;

  if (-[GEOPBTransitVehiclePosition hasDirectionName](self, "hasDirectionName"))
  {
    -[GEOPBTransitVehiclePosition directionName](self, "directionName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSDate)timestamp
{
  void *v3;

  if (-[GEOPBTransitVehiclePosition hasTime](self, "hasTime"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOPBTransitVehiclePosition time](self, "time"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (NSString)colorHexString
{
  void *v3;

  if (-[GEOPBTransitVehiclePosition hasColor](self, "hasColor"))
  {
    -[GEOPBTransitVehiclePosition color](self, "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (GEOTransitArtworkDataSource)artworkDataSource
{
  void *v3;

  if (-[GEOPBTransitVehiclePosition hasArtwork](self, "hasArtwork"))
  {
    -[GEOPBTransitVehiclePosition artwork](self, "artwork");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOTransitArtworkDataSource *)v3;
}

@end
