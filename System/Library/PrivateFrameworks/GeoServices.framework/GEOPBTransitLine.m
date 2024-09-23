@implementation GEOPBTransitLine

- (GEOPBTransitLine)init
{
  GEOPBTransitLine *v2;
  GEOPBTransitLine *v3;
  GEOPBTransitLine *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitLine;
  v2 = -[GEOPBTransitLine init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitLine)initWithData:(id)a3
{
  GEOPBTransitLine *v3;
  GEOPBTransitLine *v4;
  GEOPBTransitLine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitLine;
  v3 = -[GEOPBTransitLine initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEOPBTransitLine clearOperatingHours](self, "clearOperatingHours");
  v3.receiver = self;
  v3.super_class = (Class)GEOPBTransitLine;
  -[GEOPBTransitLine dealloc](&v3, sel_dealloc);
}

- (unsigned)lineIndex
{
  return self->_lineIndex;
}

- (void)setLineIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_lineIndex = a3;
}

- (void)setHasLineIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131076;
  else
    v3 = 0x20000;
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLineIndex
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasArtwork
{
  -[GEOPBTransitLine _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOPBTransitLine _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readModeArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModeArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasModeArtwork
{
  -[GEOPBTransitLine _readModeArtwork]((uint64_t)self);
  return self->_modeArtwork != 0;
}

- (GEOPBTransitArtwork)modeArtwork
{
  -[GEOPBTransitLine _readModeArtwork]((uint64_t)self);
  return self->_modeArtwork;
}

- (void)setModeArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_modeArtwork, a3);
}

- (void)_readAlternateArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternateArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAlternateArtwork
{
  -[GEOPBTransitLine _readAlternateArtwork]((uint64_t)self);
  return self->_alternateArtwork != 0;
}

- (GEOPBTransitArtwork)alternateArtwork
{
  -[GEOPBTransitLine _readAlternateArtwork]((uint64_t)self);
  return self->_alternateArtwork;
}

- (void)setAlternateArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_alternateArtwork, a3);
}

- (void)_readHeaderArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHeaderArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasHeaderArtwork
{
  -[GEOPBTransitLine _readHeaderArtwork]((uint64_t)self);
  return self->_headerArtwork != 0;
}

- (GEOPBTransitArtwork)headerArtwork
{
  -[GEOPBTransitLine _readHeaderArtwork]((uint64_t)self);
  return self->_headerArtwork;
}

- (void)setHeaderArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_headerArtwork, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasMuid
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)guidanceSnappingType
{
  os_unfair_lock_s *p_readerLock;
  $28D1F72B349555397FBEEFFE487B8B4D flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_guidanceSnappingType;
  else
    return 0;
}

- (void)setGuidanceSnappingType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_guidanceSnappingType = a3;
}

- (void)setHasGuidanceSnappingType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131074;
  else
    v3 = 0x20000;
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasGuidanceSnappingType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)guidanceSnappingTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0DF80[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGuidanceSnappingType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GUIDANCE_SNAPPING_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GUIDANCE_SNAPPING_TYPE_ROAD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GUIDANCE_SNAPPING_TYPE_RAIL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLineColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLineColor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLineColor
{
  -[GEOPBTransitLine _readLineColor]((uint64_t)self);
  return self->_lineColor != 0;
}

- (NSString)lineColor
{
  -[GEOPBTransitLine _readLineColor]((uint64_t)self);
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (unsigned)systemIndex
{
  return self->_systemIndex;
}

- (void)setSystemIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_systemIndex = a3;
}

- (void)setHasSystemIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131104;
  else
    v3 = 0x20000;
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasSystemIndex
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (int)transitType
{
  return self->_transitType;
}

- (void)setTransitType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  self->_transitType = a3;
}

- (void)setHasTransitType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131136;
  else
    v3 = 0x20000;
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasTransitType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)preferredDepartureTimeStyle
{
  os_unfair_lock_s *p_readerLock;
  $28D1F72B349555397FBEEFFE487B8B4D flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_preferredDepartureTimeStyle;
  else
    return 0;
}

- (void)setPreferredDepartureTimeStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_preferredDepartureTimeStyle = a3;
}

- (void)setHasPreferredDepartureTimeStyle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131088;
  else
    v3 = 0x20000;
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasPreferredDepartureTimeStyle
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)preferredDepartureTimeStyleAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0DF98[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreferredDepartureTimeStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_COUNTDOWN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_STAMP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_OPERATING_HOURS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_STAMP_LIST")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_353);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOPBTransitLine _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitLine _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readOperatingHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOperatingHours_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (unint64_t)operatingHoursCount
{
  -[GEOPBTransitLine _readOperatingHours]((uint64_t)self);
  return self->_operatingHoursCount;
}

- (GEOPBTransitTimeRange)operatingHours
{
  -[GEOPBTransitLine _readOperatingHours]((uint64_t)self);
  return self->_operatingHours;
}

- (uint64_t)_reserveOperatingHours:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (12 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0xF3DCEDC5uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(_QWORD *)(a1 + 32)), 12 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearOperatingHours
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  self->_operatingHoursSpace = 0;
  self->_operatingHoursCount = 0;
  free(self->_operatingHours);
  self->_operatingHours = 0;
}

- (void)addOperatingHours:(GEOPBTransitTimeRange)a3
{
  $B85216D09A238EDB5177F50F3CAD2EB5 has;
  uint64_t v4;
  GEOPBTransitTimeRange *v6;

  has = a3._has;
  v4 = *(_QWORD *)&a3._duration;
  -[GEOPBTransitLine _readOperatingHours]((uint64_t)self);
  if (self && -[GEOPBTransitLine _reserveOperatingHours:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_operatingHours[self->_operatingHoursCount];
    *(_QWORD *)&v6->_duration = v4;
    v6->_has = has;
    ++self->_operatingHoursCount;
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (GEOPBTransitTimeRange)operatingHoursAtIndex:(unint64_t)a3
{
  unint64_t operatingHoursCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOPBTransitTimeRange *v10;
  uint64_t v11;
  $B85216D09A238EDB5177F50F3CAD2EB5 has;
  GEOPBTransitTimeRange result;

  -[GEOPBTransitLine _readOperatingHours]((uint64_t)self);
  operatingHoursCount = self->_operatingHoursCount;
  if (operatingHoursCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, operatingHoursCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_operatingHours[a3];
  v11 = *(_QWORD *)&v10->_duration;
  has = v10->_has;
  result._duration = v11;
  result._startTime = HIDWORD(v11);
  result._has = has;
  return result;
}

- (void)setOperatingHours:(GEOPBTransitTimeRange *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[GEOPBTransitLine clearOperatingHours](self, "clearOperatingHours");
  if (-[GEOPBTransitLine _reserveOperatingHours:]((uint64_t)self, a4))
  {
    memcpy(self->_operatingHours, a3, 12 * a4);
    self->_operatingHoursCount = a4;
  }
}

- (void)_readDisplayHints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayHints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDisplayHints
{
  -[GEOPBTransitLine _readDisplayHints]((uint64_t)self);
  return self->_displayHints != 0;
}

- (GEOPBTransitLineDisplayHints)displayHints
{
  -[GEOPBTransitLine _readDisplayHints]((uint64_t)self);
  return self->_displayHints;
}

- (void)setDisplayHints:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_displayHints, a3);
}

- (void)_readNameDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNameDisplayString_tags_354);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasNameDisplayString
{
  -[GEOPBTransitLine _readNameDisplayString]((uint64_t)self);
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitLine _readNameDisplayString]((uint64_t)self);
  return self->_nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_nameDisplayString, a3);
}

- (int)placeDisplayStyle
{
  os_unfair_lock_s *p_readerLock;
  $28D1F72B349555397FBEEFFE487B8B4D flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_placeDisplayStyle;
  else
    return 0;
}

- (void)setPlaceDisplayStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_placeDisplayStyle = a3;
}

- (void)setHasPlaceDisplayStyle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131080;
  else
    v3 = 0x20000;
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPlaceDisplayStyle
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)placeDisplayStyleAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0DFC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceDisplayStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINE_PLACE_DISPLAY_STYLE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINE_PLACE_DISPLAY_STYLE_NAME_PRIMARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LINE_PLACE_DISPLAY_STYLE_NAME_SECONDARY")))
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
  v8.super_class = (Class)GEOPBTransitLine;
  -[GEOPBTransitLine description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitLine dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitLine _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  int v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  int v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  __CFString *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  _QWORD v62[4];
  id v63;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 156) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("lineIndex");
    else
      v6 = CFSTR("line_index");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("artwork"));

  }
  objc_msgSend((id)a1, "modeArtwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("modeArtwork");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("mode_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  objc_msgSend((id)a1, "alternateArtwork");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("alternateArtwork");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("alternate_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "headerArtwork");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("headerArtwork");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("header_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(_DWORD *)(a1 + 156);
  if ((v22 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 96));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("muid"));

    v22 = *(_DWORD *)(a1 + 156);
  }
  if ((v22 & 2) != 0)
  {
    v24 = *(int *)(a1 + 132);
    if (v24 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E1C0DF80[v24];
    }
    if (a2)
      v26 = CFSTR("guidanceSnappingType");
    else
      v26 = CFSTR("guidance_snapping_type");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  objc_msgSend((id)a1, "lineColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    if (a2)
      v28 = CFSTR("lineColor");
    else
      v28 = CFSTR("line_color");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);
  }

  v29 = *(_DWORD *)(a1 + 156);
  if ((v29 & 0x20) == 0)
  {
    if ((v29 & 0x40) == 0)
      goto LABEL_44;
LABEL_50:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 152));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("transitType");
    else
      v33 = CFSTR("transit_type");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

    if ((*(_DWORD *)(a1 + 156) & 0x10) == 0)
      goto LABEL_61;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v31 = CFSTR("systemIndex");
  else
    v31 = CFSTR("system_index");
  objc_msgSend(v4, "setObject:forKey:", v30, v31);

  v29 = *(_DWORD *)(a1 + 156);
  if ((v29 & 0x40) != 0)
    goto LABEL_50;
LABEL_44:
  if ((v29 & 0x10) != 0)
  {
LABEL_54:
    v34 = *(int *)(a1 + 144);
    if (v34 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 144));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E1C0DF98[v34];
    }
    if (a2)
      v36 = CFSTR("preferredDepartureTimeStyle");
    else
      v36 = CFSTR("preferred_departure_time_style");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
LABEL_61:
  objc_msgSend((id)a1, "styleAttributes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "jsonRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v37, "dictionaryRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v42 = 0;
      v43 = 0;
      do
      {
        _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v42), a2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v44);

        ++v43;
        v42 += 12;
      }
      while (v43 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v45 = CFSTR("operatingHours");
    else
      v45 = CFSTR("operating_hours");
    objc_msgSend(v4, "setObject:forKey:", v41, v45);

  }
  objc_msgSend((id)a1, "displayHints");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v46, "jsonRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("displayHints");
    }
    else
    {
      objc_msgSend(v46, "dictionaryRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("display_hints");
    }
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

  }
  objc_msgSend((id)a1, "nameDisplayString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    if (a2)
      v51 = CFSTR("nameDisplayString");
    else
      v51 = CFSTR("name_display_string");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);
  }

  if ((*(_BYTE *)(a1 + 156) & 8) != 0)
  {
    v52 = *(int *)(a1 + 140);
    if (v52 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 140));
      v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53 = off_1E1C0DFC0[v52];
    }
    if (a2)
      v54 = CFSTR("placeDisplayStyle");
    else
      v54 = CFSTR("place_display_style");
    objc_msgSend(v4, "setObject:forKey:", v53, v54);

  }
  v55 = *(void **)(a1 + 16);
  if (v55)
  {
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v56, "count"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __46__GEOPBTransitLine__dictionaryRepresentation___block_invoke;
      v62[3] = &unk_1E1C00600;
      v59 = v58;
      v63 = v59;
      objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v62);
      v60 = v59;

      v57 = v60;
    }
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitLine _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPBTransitLine__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitLine)initWithDictionary:(id)a3
{
  return (GEOPBTransitLine *)-[GEOPBTransitLine _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  GEOPBTransitArtwork *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  GEOPBTransitArtwork *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOPBTransitArtwork *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOPBTransitArtwork *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  void *v45;
  GEOStyleAttributes *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  const __CFString *v57;
  void *v58;
  GEOPBTransitLineDisplayHints *v59;
  uint64_t v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  id v67;
  uint64_t v68;
  id v70;
  uint64_t v71;
  unsigned int v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("lineIndex");
      else
        v6 = CFSTR("line_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0x1E0CB3000uLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLineIndex:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOPBTransitArtwork initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOPBTransitArtwork initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setArtwork:", v11);

      }
      if (a3)
        v13 = CFSTR("modeArtwork");
      else
        v13 = CFSTR("mode_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOPBTransitArtwork initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOPBTransitArtwork initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setModeArtwork:", v16);

      }
      if (a3)
        v18 = CFSTR("alternateArtwork");
      else
        v18 = CFSTR("alternate_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOPBTransitArtwork initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOPBTransitArtwork initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setAlternateArtwork:", v21);

      }
      if (a3)
        v23 = CFSTR("headerArtwork");
      else
        v23 = CFSTR("header_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOPBTransitArtwork initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOPBTransitArtwork initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setHeaderArtwork:", v26);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v28, "unsignedLongLongValue"));

      if (a3)
        v29 = CFSTR("guidanceSnappingType");
      else
        v29 = CFSTR("guidance_snapping_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v30;
        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("GUIDANCE_SNAPPING_TYPE_NONE")) & 1) != 0)
        {
          v32 = 0;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("GUIDANCE_SNAPPING_TYPE_ROAD")) & 1) != 0)
        {
          v32 = 1;
        }
        else if (objc_msgSend(v31, "isEqualToString:", CFSTR("GUIDANCE_SNAPPING_TYPE_RAIL")))
        {
          v32 = 2;
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
          goto LABEL_54;
        v32 = objc_msgSend(v30, "intValue");
      }
      objc_msgSend(a1, "setGuidanceSnappingType:", v32);
LABEL_54:

      if (a3)
        v33 = CFSTR("lineColor");
      else
        v33 = CFSTR("line_color");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = (void *)objc_msgSend(v34, "copy");
        objc_msgSend(a1, "setLineColor:", v35);

      }
      if (a3)
        v36 = CFSTR("systemIndex");
      else
        v36 = CFSTR("system_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSystemIndex:", objc_msgSend(v37, "unsignedIntValue"));

      if (a3)
        v38 = CFSTR("transitType");
      else
        v38 = CFSTR("transit_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitType:", objc_msgSend(v39, "intValue"));

      if (a3)
        v40 = CFSTR("preferredDepartureTimeStyle");
      else
        v40 = CFSTR("preferred_departure_time_style");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = v41;
        if ((objc_msgSend(v42, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_UNKNOWN")) & 1) != 0)
        {
          v43 = 0;
        }
        else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_COUNTDOWN")) & 1) != 0)
        {
          v43 = 1;
        }
        else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_STAMP")) & 1) != 0)
        {
          v43 = 2;
        }
        else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_OPERATING_HOURS")) & 1) != 0)
        {
          v43 = 3;
        }
        else if (objc_msgSend(v42, "isEqualToString:", CFSTR("TRANSIT_TIME_STYLE_STAMP_LIST")))
        {
          v43 = 4;
        }
        else
        {
          v43 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_88;
        v43 = objc_msgSend(v41, "intValue");
      }
      objc_msgSend(a1, "setPreferredDepartureTimeStyle:", v43);
LABEL_88:

      if (a3)
        v44 = CFSTR("styleAttributes");
      else
        v44 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v47 = -[GEOStyleAttributes initWithJSON:](v46, "initWithJSON:", v45);
        else
          v47 = -[GEOStyleAttributes initWithDictionary:](v46, "initWithDictionary:", v45);
        v48 = (void *)v47;
        objc_msgSend(a1, "setStyleAttributes:", v47);

      }
      if (a3)
        v49 = CFSTR("operatingHours");
      else
        v49 = CFSTR("operating_hours");
      objc_msgSend(v5, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v70 = v5;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v51 = v50;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v74 != v54)
                objc_enumerationMutation(v51);
              v56 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v72 = 0;
                v71 = 0;
                _GEOPDTimeRangeFromDictionaryRepresentation(v56, (uint64_t)&v71, a3);
                v8 = v8 & 0xFFFFFFFF00000000 | v72;
                objc_msgSend(a1, "addOperatingHours:", v71, v8);
              }
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
          }
          while (v53);
        }

        v5 = v70;
      }

      if (a3)
        v57 = CFSTR("displayHints");
      else
        v57 = CFSTR("display_hints");
      objc_msgSend(v5, "objectForKeyedSubscript:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = [GEOPBTransitLineDisplayHints alloc];
        if ((a3 & 1) != 0)
          v60 = -[GEOPBTransitLineDisplayHints initWithJSON:](v59, "initWithJSON:", v58);
        else
          v60 = -[GEOPBTransitLineDisplayHints initWithDictionary:](v59, "initWithDictionary:", v58);
        v61 = (void *)v60;
        objc_msgSend(a1, "setDisplayHints:", v60);

      }
      if (a3)
        v62 = CFSTR("nameDisplayString");
      else
        v62 = CFSTR("name_display_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = (void *)objc_msgSend(v63, "copy");
        objc_msgSend(a1, "setNameDisplayString:", v64);

      }
      if (a3)
        v65 = CFSTR("placeDisplayStyle");
      else
        v65 = CFSTR("place_display_style");
      objc_msgSend(v5, "objectForKeyedSubscript:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = v66;
        if ((objc_msgSend(v67, "isEqualToString:", CFSTR("LINE_PLACE_DISPLAY_STYLE_DEFAULT")) & 1) != 0)
        {
          v68 = 0;
        }
        else if ((objc_msgSend(v67, "isEqualToString:", CFSTR("LINE_PLACE_DISPLAY_STYLE_NAME_PRIMARY")) & 1) != 0)
        {
          v68 = 1;
        }
        else if (objc_msgSend(v67, "isEqualToString:", CFSTR("LINE_PLACE_DISPLAY_STYLE_NAME_SECONDARY")))
        {
          v68 = 2;
        }
        else
        {
          v68 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_138:

          goto LABEL_139;
        }
        v68 = objc_msgSend(v66, "intValue");
      }
      objc_msgSend(a1, "setPlaceDisplayStyle:", v68);
      goto LABEL_138;
    }
  }
LABEL_139:

  return a1;
}

- (GEOPBTransitLine)initWithJSON:(id)a3
{
  return (GEOPBTransitLine *)-[GEOPBTransitLine _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_406;
    else
      v8 = (int *)&readAll__nonRecursiveTag_407;
    GEOPBTransitLineReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBTransitLineCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitLineIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitLineReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $28D1F72B349555397FBEEFFE487B8B4D flags;
  $28D1F72B349555397FBEEFFE487B8B4D v7;
  uint64_t v8;
  unint64_t v9;
  PBDataReader *v10;
  void *v11;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitLineIsDirty((uint64_t)self) & 1) == 0)
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
    goto LABEL_39;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitLine readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_artwork)
    PBDataWriterWriteSubmessage();
  if (self->_modeArtwork)
    PBDataWriterWriteSubmessage();
  if (self->_alternateArtwork)
    PBDataWriterWriteSubmessage();
  if (self->_headerArtwork)
    PBDataWriterWriteSubmessage();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_lineColor)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_21;
LABEL_36:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  PBDataWriterWriteUint32Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x40) != 0)
    goto LABEL_36;
LABEL_21:
  if ((*(_BYTE *)&v7 & 0x10) != 0)
LABEL_22:
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_styleAttributes)
    PBDataWriterWriteSubmessage();
  if (self->_operatingHoursCount)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOPBTransitTimeRangeWriteTo((uint64_t)&self->_operatingHours[v8]);
      PBDataWriterRecallMark();
      ++v9;
      ++v8;
    }
    while (v9 < self->_operatingHoursCount);
  }
  if (self->_displayHints)
    PBDataWriterWriteSubmessage();
  if (self->_nameDisplayString)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_39:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $28D1F72B349555397FBEEFFE487B8B4D flags;
  $28D1F72B349555397FBEEFFE487B8B4D v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  unsigned int v11;
  id *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEOPBTransitLine readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 30) = self->_readerMarkPos;
  *((_DWORD *)v13 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v13;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v13 + 34) = self->_lineIndex;
    *((_DWORD *)v13 + 39) |= 4u;
  }
  if (self->_artwork)
  {
    objc_msgSend(v13, "setArtwork:");
    v4 = v13;
  }
  if (self->_modeArtwork)
  {
    objc_msgSend(v13, "setModeArtwork:");
    v4 = v13;
  }
  if (self->_alternateArtwork)
  {
    objc_msgSend(v13, "setAlternateArtwork:");
    v4 = v13;
  }
  if (self->_headerArtwork)
  {
    objc_msgSend(v13, "setHeaderArtwork:");
    v4 = v13;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v4[12] = (id)self->_muid;
    *((_DWORD *)v4 + 39) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_guidanceSnappingType;
    *((_DWORD *)v4 + 39) |= 2u;
  }
  if (self->_lineColor)
  {
    objc_msgSend(v13, "setLineColor:");
    v4 = v13;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 37) = self->_systemIndex;
    *((_DWORD *)v4 + 39) |= 0x20u;
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 0x40) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&v6 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v4 + 38) = self->_transitType;
  *((_DWORD *)v4 + 39) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 36) = self->_preferredDepartureTimeStyle;
    *((_DWORD *)v4 + 39) |= 0x10u;
  }
LABEL_21:
  if (self->_styleAttributes)
    objc_msgSend(v13, "setStyleAttributes:");
  if (-[GEOPBTransitLine operatingHoursCount](self, "operatingHoursCount"))
  {
    objc_msgSend(v13, "clearOperatingHours");
    v7 = -[GEOPBTransitLine operatingHoursCount](self, "operatingHoursCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = -[GEOPBTransitLine operatingHoursAtIndex:](self, "operatingHoursAtIndex:", i);
        objc_msgSend(v13, "addOperatingHours:", v10, v11);
      }
    }
  }
  if (self->_displayHints)
    objc_msgSend(v13, "setDisplayHints:");
  v12 = v13;
  if (self->_nameDisplayString)
  {
    objc_msgSend(v13, "setNameDisplayString:");
    v12 = v13;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v12 + 35) = self->_placeDisplayStyle;
    *((_DWORD *)v12 + 39) |= 8u;
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  $28D1F72B349555397FBEEFFE487B8B4D flags;
  uint64_t v18;
  void *v19;
  $28D1F72B349555397FBEEFFE487B8B4D v20;
  id v21;
  void *v22;
  unint64_t operatingHoursCount;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PBUnknownFields *v28;

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
      GEOPBTransitLineReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitLine readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_lineIndex;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
  v9 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[GEOPBTransitArtwork copyWithZone:](self->_modeArtwork, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v11;

  v13 = -[GEOPBTransitArtwork copyWithZone:](self->_alternateArtwork, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[GEOPBTransitArtwork copyWithZone:](self->_headerArtwork, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 96) = self->_muid;
    *(_DWORD *)(v5 + 156) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_guidanceSnappingType;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  v18 = -[NSString copyWithZone:](self->_lineColor, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 0x20) == 0)
  {
    if ((*(_BYTE *)&v20 & 0x40) == 0)
      goto LABEL_13;
LABEL_22:
    *(_DWORD *)(v5 + 152) = self->_transitType;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *(_DWORD *)(v5 + 148) = self->_systemIndex;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 0x40) != 0)
    goto LABEL_22;
LABEL_13:
  if ((*(_BYTE *)&v20 & 0x10) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 144) = self->_preferredDepartureTimeStyle;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
LABEL_15:
  v21 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v21;

  operatingHoursCount = self->_operatingHoursCount;
  if (operatingHoursCount)
  {
    -[GEOPBTransitLine _reserveOperatingHours:](v5, operatingHoursCount);
    memcpy(*(void **)(v5 + 24), self->_operatingHours, 12 * self->_operatingHoursCount);
    *(_QWORD *)(v5 + 32) = self->_operatingHoursCount;
  }
  v24 = -[GEOPBTransitLineDisplayHints copyWithZone:](self->_displayHints, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v24;

  v26 = -[NSString copyWithZone:](self->_nameDisplayString, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v26;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_placeDisplayStyle;
    *(_DWORD *)(v5 + 156) |= 8u;
  }
  v28 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v28;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  int v5;
  GEOPBTransitArtwork *artwork;
  GEOPBTransitArtwork *modeArtwork;
  GEOPBTransitArtwork *alternateArtwork;
  GEOPBTransitArtwork *headerArtwork;
  $28D1F72B349555397FBEEFFE487B8B4D flags;
  int v11;
  NSString *lineColor;
  GEOStyleAttributes *styleAttributes;
  unint64_t operatingHoursCount;
  BOOL v15;
  GEOPBTransitLineDisplayHints *displayHints;
  NSString *nameDisplayString;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEOPBTransitLine readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v5 & 4) == 0 || self->_lineIndex != *((_DWORD *)v4 + 34))
      goto LABEL_47;
  }
  else if ((v5 & 4) != 0)
  {
    goto LABEL_47;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | (unint64_t)v4[7] && !-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:"))
    goto LABEL_47;
  modeArtwork = self->_modeArtwork;
  if ((unint64_t)modeArtwork | (unint64_t)v4[11])
  {
    if (!-[GEOPBTransitArtwork isEqual:](modeArtwork, "isEqual:"))
      goto LABEL_47;
  }
  alternateArtwork = self->_alternateArtwork;
  if ((unint64_t)alternateArtwork | (unint64_t)v4[6])
  {
    if (!-[GEOPBTransitArtwork isEqual:](alternateArtwork, "isEqual:"))
      goto LABEL_47;
  }
  headerArtwork = self->_headerArtwork;
  if ((unint64_t)headerArtwork | (unint64_t)v4[9])
  {
    if (!-[GEOPBTransitArtwork isEqual:](headerArtwork, "isEqual:"))
      goto LABEL_47;
  }
  flags = self->_flags;
  v11 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v11 & 1) == 0 || (const void *)self->_muid != v4[12])
      goto LABEL_47;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_guidanceSnappingType != *((_DWORD *)v4 + 33))
      goto LABEL_47;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_47;
  }
  lineColor = self->_lineColor;
  if ((unint64_t)lineColor | (unint64_t)v4[10])
  {
    if (!-[NSString isEqual:](lineColor, "isEqual:"))
      goto LABEL_47;
    flags = self->_flags;
    v11 = *((_DWORD *)v4 + 39);
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_systemIndex != *((_DWORD *)v4 + 37))
      goto LABEL_47;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_transitType != *((_DWORD *)v4 + 38))
      goto LABEL_47;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_preferredDepartureTimeStyle != *((_DWORD *)v4 + 36))
      goto LABEL_47;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  styleAttributes = self->_styleAttributes;
  if (!((unint64_t)styleAttributes | (unint64_t)v4[14])
    || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    operatingHoursCount = self->_operatingHoursCount;
    if ((const void *)operatingHoursCount == v4[4] && !memcmp(self->_operatingHours, v4[3], 12 * operatingHoursCount))
    {
      displayHints = self->_displayHints;
      if (!((unint64_t)displayHints | (unint64_t)v4[8])
        || -[GEOPBTransitLineDisplayHints isEqual:](displayHints, "isEqual:"))
      {
        nameDisplayString = self->_nameDisplayString;
        if (!((unint64_t)nameDisplayString | (unint64_t)v4[13])
          || -[NSString isEqual:](nameDisplayString, "isEqual:"))
        {
          if ((*(_BYTE *)&self->_flags & 8) == 0)
          {
            v15 = (*((_DWORD *)v4 + 39) & 8) == 0;
            goto LABEL_48;
          }
          if ((*((_DWORD *)v4 + 39) & 8) != 0 && self->_placeDisplayStyle == *((_DWORD *)v4 + 35))
          {
            v15 = 1;
            goto LABEL_48;
          }
        }
      }
    }
  }
LABEL_47:
  v15 = 0;
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  $28D1F72B349555397FBEEFFE487B8B4D flags;
  $28D1F72B349555397FBEEFFE487B8B4D v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  -[GEOPBTransitLine readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v22 = 2654435761 * self->_lineIndex;
  else
    v22 = 0;
  v21 = -[GEOPBTransitArtwork hash](self->_artwork, "hash");
  v20 = -[GEOPBTransitArtwork hash](self->_modeArtwork, "hash");
  v19 = -[GEOPBTransitArtwork hash](self->_alternateArtwork, "hash");
  v18 = -[GEOPBTransitArtwork hash](self->_headerArtwork, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v17 = 2654435761u * self->_muid;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
LABEL_6:
      v16 = 2654435761 * self->_guidanceSnappingType;
      goto LABEL_9;
    }
  }
  v16 = 0;
LABEL_9:
  v14 = -[NSString hash](self->_lineColor, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x20) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_11;
LABEL_14:
    v6 = 0;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v5 = 2654435761 * self->_systemIndex;
  if ((*(_BYTE *)&v4 & 0x40) == 0)
    goto LABEL_14;
LABEL_11:
  v6 = 2654435761 * self->_transitType;
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
LABEL_12:
    v7 = 2654435761 * self->_preferredDepartureTimeStyle;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
LABEL_16:
  v8 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash", v14);
  v9 = PBHashBytes();
  v10 = -[GEOPBTransitLineDisplayHints hash](self->_displayHints, "hash");
  v11 = -[NSString hash](self->_nameDisplayString, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v12 = 2654435761 * self->_placeDisplayStyle;
  else
    v12 = 0;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  GEOPBTransitArtwork *artwork;
  uint64_t v6;
  GEOPBTransitArtwork *modeArtwork;
  uint64_t v8;
  GEOPBTransitArtwork *alternateArtwork;
  uint64_t v10;
  GEOPBTransitArtwork *headerArtwork;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  GEOStyleAttributes *styleAttributes;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  unsigned int v21;
  GEOPBTransitLineDisplayHints *displayHints;
  unsigned int *v23;
  uint64_t v24;
  unsigned int *v25;

  v25 = (unsigned int *)a3;
  objc_msgSend(v25, "readAll:", 0);
  v4 = v25;
  if ((v25[39] & 4) != 0)
  {
    self->_lineIndex = v25[34];
    *(_DWORD *)&self->_flags |= 4u;
  }
  artwork = self->_artwork;
  v6 = *((_QWORD *)v25 + 7);
  if (artwork)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPBTransitLine setArtwork:](self, "setArtwork:");
  }
  v4 = v25;
LABEL_9:
  modeArtwork = self->_modeArtwork;
  v8 = *((_QWORD *)v4 + 11);
  if (modeArtwork)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPBTransitArtwork mergeFrom:](modeArtwork, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPBTransitLine setModeArtwork:](self, "setModeArtwork:");
  }
  v4 = v25;
LABEL_15:
  alternateArtwork = self->_alternateArtwork;
  v10 = *((_QWORD *)v4 + 6);
  if (alternateArtwork)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPBTransitArtwork mergeFrom:](alternateArtwork, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPBTransitLine setAlternateArtwork:](self, "setAlternateArtwork:");
  }
  v4 = v25;
LABEL_21:
  headerArtwork = self->_headerArtwork;
  v12 = *((_QWORD *)v4 + 9);
  if (headerArtwork)
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPBTransitArtwork mergeFrom:](headerArtwork, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPBTransitLine setHeaderArtwork:](self, "setHeaderArtwork:");
  }
  v4 = v25;
LABEL_27:
  v13 = v4[39];
  if ((v13 & 1) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 12);
    *(_DWORD *)&self->_flags |= 1u;
    v13 = v4[39];
  }
  if ((v13 & 2) != 0)
  {
    self->_guidanceSnappingType = v4[33];
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[GEOPBTransitLine setLineColor:](self, "setLineColor:");
    v4 = v25;
  }
  v14 = v4[39];
  if ((v14 & 0x20) != 0)
  {
    self->_systemIndex = v4[37];
    *(_DWORD *)&self->_flags |= 0x20u;
    v14 = v4[39];
    if ((v14 & 0x40) == 0)
    {
LABEL_35:
      if ((v14 & 0x10) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((v14 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  self->_transitType = v4[38];
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((v4[39] & 0x10) != 0)
  {
LABEL_36:
    self->_preferredDepartureTimeStyle = v4[36];
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_37:
  styleAttributes = self->_styleAttributes;
  v16 = *((_QWORD *)v4 + 14);
  if (styleAttributes)
  {
    if (!v16)
      goto LABEL_46;
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_46;
    -[GEOPBTransitLine setStyleAttributes:](self, "setStyleAttributes:");
  }
  v4 = v25;
LABEL_46:
  v17 = objc_msgSend(v4, "operatingHoursCount");
  if (v17)
  {
    v18 = v17;
    for (i = 0; i != v18; ++i)
    {
      v20 = objc_msgSend(v25, "operatingHoursAtIndex:", i);
      -[GEOPBTransitLine addOperatingHours:](self, "addOperatingHours:", v20, v21);
    }
  }
  displayHints = self->_displayHints;
  v23 = v25;
  v24 = *((_QWORD *)v25 + 8);
  if (displayHints)
  {
    if (!v24)
      goto LABEL_55;
    -[GEOPBTransitLineDisplayHints mergeFrom:](displayHints, "mergeFrom:");
  }
  else
  {
    if (!v24)
      goto LABEL_55;
    -[GEOPBTransitLine setDisplayHints:](self, "setDisplayHints:");
  }
  v23 = v25;
LABEL_55:
  if (*((_QWORD *)v23 + 13))
  {
    -[GEOPBTransitLine setNameDisplayString:](self, "setNameDisplayString:");
    v23 = v25;
  }
  if ((v23[39] & 8) != 0)
  {
    self->_placeDisplayStyle = v23[35];
    *(_DWORD *)&self->_flags |= 8u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitLineReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_410);
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
  *(_DWORD *)&self->_flags |= 0x20080u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitLine readAll:](self, "readAll:", 0);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artwork, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_modeArtwork, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_alternateArtwork, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_headerArtwork, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    -[GEOPBTransitLineDisplayHints clearUnknownFields:](self->_displayHints, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_modeArtwork, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_headerArtwork, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_alternateArtwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)geoTransitLineWithSystem:(id)a3 locationHint:(id)a4
{
  double var1;
  double var0;
  id v7;
  _GEOTransitLine *v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", self, v7, var0, var1);

  return v8;
}

- (id)identifierWithLocationHint:(id)a3
{
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", -[GEOPBTransitLine muid](self, "muid"), 0, a3.var0, a3.var1);
}

@end
