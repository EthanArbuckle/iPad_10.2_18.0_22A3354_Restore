@implementation GEOFormatArgument

- (GEOFormatArgument)init
{
  GEOFormatArgument *v2;
  GEOFormatArgument *v3;
  GEOFormatArgument *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOFormatArgument;
  v2 = -[GEOFormatArgument init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOFormatArgument)initWithData:(id)a3
{
  GEOFormatArgument *v3;
  GEOFormatArgument *v4;
  GEOFormatArgument *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOFormatArgument;
  v3 = -[GEOFormatArgument initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOFormatArgument;
  -[GEOFormatArgument dealloc](&v3, sel_dealloc);
}

- (void)_readToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readToken_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasToken
{
  -[GEOFormatArgument _readToken]((uint64_t)self);
  return self->_token != 0;
}

- (NSString)token
{
  -[GEOFormatArgument _readToken]((uint64_t)self);
  return self->_token;
}

- (void)setToken:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000u;
  objc_storeStrong((id *)&self->_token, a3);
}

- (unsigned)valInt1
{
  return self->_valInt1;
}

- (void)setValInt1:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40002u;
  self->_valInt1 = a3;
}

- (void)setHasValInt1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262146;
  else
    v3 = 0x40000;
  self->_flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasValInt1
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)valInt2
{
  return self->_valInt2;
}

- (void)setValInt2:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40004u;
  self->_valInt2 = a3;
}

- (void)setHasValInt2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262148;
  else
    v3 = 0x40000;
  self->_flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFBFFFB | v3);
}

- (BOOL)hasValInt2
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readValInt3s
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 172) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValInt3s_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (unint64_t)valInt3sCount
{
  -[GEOFormatArgument _readValInt3s]((uint64_t)self);
  return self->_valInt3s.count;
}

- (unsigned)valInt3s
{
  -[GEOFormatArgument _readValInt3s]((uint64_t)self);
  return self->_valInt3s.list;
}

- (void)clearValInt3s
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  PBRepeatedUInt32Clear();
}

- (void)addValInt3:(unsigned int)a3
{
  -[GEOFormatArgument _readValInt3s]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (unsigned)valInt3AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_valInt3s;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOFormatArgument _readValInt3s]((uint64_t)self);
  p_valInt3s = &self->_valInt3s;
  count = self->_valInt3s.count;
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
  return p_valInt3s->list[a3];
}

- (void)setValInt3s:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  PBRepeatedUInt32Set();
}

- (void)_readValString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 174) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasValString
{
  -[GEOFormatArgument _readValString]((uint64_t)self);
  return self->_valString != 0;
}

- (NSString)valString
{
  -[GEOFormatArgument _readValString]((uint64_t)self);
  return self->_valString;
}

- (void)setValString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x60000u;
  objc_storeStrong((id *)&self->_valString, a3);
}

- (void)_readPrice
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrice_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasPrice
{
  -[GEOFormatArgument _readPrice]((uint64_t)self);
  return self->_price != 0;
}

- (GEOPrice)price
{
  -[GEOFormatArgument _readPrice]((uint64_t)self);
  return self->_price;
}

- (void)setPrice:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x41000u;
  objc_storeStrong((id *)&self->_price, a3);
}

- (void)_readArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 172) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_1910);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasArtwork
{
  -[GEOFormatArgument _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOFormatArgument _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40040u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readTimestampDatas
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimestampDatas_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)timestampDatas
{
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  return self->_timestampDatas;
}

- (void)setTimestampDatas:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *timestampDatas;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  timestampDatas = self->_timestampDatas;
  self->_timestampDatas = v4;

}

- (void)clearTimestampDatas
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  -[NSMutableArray removeAllObjects](self->_timestampDatas, "removeAllObjects");
}

- (void)addTimestampData:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  -[GEOFormatArgument _addNoFlagsTimestampData:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (void)_addNoFlagsTimestampData:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)timestampDatasCount
{
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  return -[NSMutableArray count](self->_timestampDatas, "count");
}

- (id)timestampDataAtIndex:(unint64_t)a3
{
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_timestampDatas, "objectAtIndex:", a3);
}

+ (Class)timestampDataType
{
  return (Class)objc_opt_class();
}

- (void)_readCountdownData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 172) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountdownData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasCountdownData
{
  -[GEOFormatArgument _readCountdownData]((uint64_t)self);
  return self->_countdownData != 0;
}

- (GEOCountdownData)countdownData
{
  -[GEOFormatArgument _readCountdownData]((uint64_t)self);
  return self->_countdownData;
}

- (void)setCountdownData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40080u;
  objc_storeStrong((id *)&self->_countdownData, a3);
}

- (void)_readNumberData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNumberData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasNumberData
{
  -[GEOFormatArgument _readNumberData]((uint64_t)self);
  return self->_numberData != 0;
}

- (GEOServerFormatTokenNumberData)numberData
{
  -[GEOFormatArgument _readNumberData]((uint64_t)self);
  return (GEOServerFormatTokenNumberData *)self->_numberData;
}

- (void)setNumberData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40800u;
  objc_storeStrong((id *)&self->_numberData, a3);
}

- (void)_readMeasurementData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMeasurementData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasMeasurementData
{
  -[GEOFormatArgument _readMeasurementData]((uint64_t)self);
  return self->_measurementData != 0;
}

- (GEOMeasurementData)measurementData
{
  -[GEOFormatArgument _readMeasurementData]((uint64_t)self);
  return self->_measurementData;
}

- (void)setMeasurementData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40400u;
  objc_storeStrong((id *)&self->_measurementData, a3);
}

- (void)_readUrlData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 174) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrlData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasUrlData
{
  -[GEOFormatArgument _readUrlData]((uint64_t)self);
  return self->_urlData != 0;
}

- (GEOURLData)urlData
{
  -[GEOFormatArgument _readUrlData]((uint64_t)self);
  return self->_urlData;
}

- (void)setUrlData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x50000u;
  objc_storeStrong((id *)&self->_urlData, a3);
}

- (void)_readManeuverData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManeuverData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasManeuverData
{
  -[GEOFormatArgument _readManeuverData]((uint64_t)self);
  return self->_maneuverData != 0;
}

- (GEOManeuverData)maneuverData
{
  -[GEOFormatArgument _readManeuverData]((uint64_t)self);
  return self->_maneuverData;
}

- (void)setManeuverData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40200u;
  objc_storeStrong((id *)&self->_maneuverData, a3);
}

- (void)_readStringSubstituteData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStringSubstituteData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasStringSubstituteData
{
  -[GEOFormatArgument _readStringSubstituteData]((uint64_t)self);
  return self->_stringSubstituteData != 0;
}

- (GEOGenericStringData)stringSubstituteData
{
  -[GEOFormatArgument _readStringSubstituteData]((uint64_t)self);
  return self->_stringSubstituteData;
}

- (void)setStringSubstituteData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x42000u;
  objc_storeStrong((id *)&self->_stringSubstituteData, a3);
}

- (void)_readGenericCombinations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 173) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGenericCombinations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasGenericCombinations
{
  -[GEOFormatArgument _readGenericCombinations]((uint64_t)self);
  return self->_genericCombinations != 0;
}

- (GEOGenericCombinations)genericCombinations
{
  -[GEOFormatArgument _readGenericCombinations]((uint64_t)self);
  return self->_genericCombinations;
}

- (void)setGenericCombinations:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40100u;
  objc_storeStrong((id *)&self->_genericCombinations, a3);
}

- (int)format
{
  os_unfair_lock_s *p_readerLock;
  $7A3EB02FEAFF35E6843F3D548DA5361E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_format;
  else
    return 0;
}

- (void)setFormat:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40001u;
  self->_format = a3;
}

- (void)setHasFormat:(BOOL)a3
{
  self->_flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000);
}

- (BOOL)hasFormat
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)formatAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x13 && ((0x7FF7Fu >> a3) & 1) != 0)
  {
    v3 = off_1E1C08100[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsFormat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIMESTAMP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DURATION_SHORT_UNITS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DURATION_MEDIUM_UNITS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREQUENCY_VALUE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREQUENCY_RANGE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIMESTAMP_LIST")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTDOWN_LIST")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERCENTAGE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANEUVER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POWER")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC_STRING")) & 1) != 0)
  {
    v4 = 17;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC_COMBINATIONS")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)waypointIndex
{
  os_unfair_lock_s *p_readerLock;
  $7A3EB02FEAFF35E6843F3D548DA5361E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_waypointIndex;
  else
    return -1;
}

- (void)setWaypointIndex:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40008u;
  self->_waypointIndex = a3;
}

- (void)setHasWaypointIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262152;
  else
    v3 = 0x40000;
  self->_flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasWaypointIndex
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOFormatArgument;
  -[GEOFormatArgument description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOFormatArgument dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormatArgument _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  int v58;
  uint64_t v59;
  __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("token"));

  v6 = *(_DWORD *)(a1 + 172);
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 160));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("valInt1");
    else
      v8 = CFSTR("val_int_1");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v6 = *(_DWORD *)(a1 + 172);
  }
  if ((v6 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 164));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("valInt2");
    else
      v10 = CFSTR("val_int_2");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("valInt3");
    else
      v12 = CFSTR("val_int_3");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "valString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("valString");
    else
      v14 = CFSTR("val_string");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend((id)a1, "price");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("price"));

  }
  objc_msgSend((id)a1, "artwork");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("artwork"));

  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v22 = *(id *)(a1 + 112);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v73 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      }
      while (v24);
    }

    if (a2)
      v29 = CFSTR("timestampData");
    else
      v29 = CFSTR("timestamp_data");
    objc_msgSend(v4, "setObject:forKey:", v21, v29);

  }
  objc_msgSend((id)a1, "countdownData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("countdownData");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("countdown_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "numberData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("numberData");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("number_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  objc_msgSend((id)a1, "measurementData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("measurementData");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("measurement_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  objc_msgSend((id)a1, "urlData");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v42, "jsonRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("urlData");
    }
    else
    {
      objc_msgSend(v42, "dictionaryRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("url_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v44, v45);

  }
  objc_msgSend((id)a1, "maneuverData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v46, "jsonRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("maneuverData");
    }
    else
    {
      objc_msgSend(v46, "dictionaryRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("maneuver_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

  }
  objc_msgSend((id)a1, "stringSubstituteData");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v50, "jsonRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("stringSubstituteData");
    }
    else
    {
      objc_msgSend(v50, "dictionaryRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("string_substitute_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v52, v53);

  }
  objc_msgSend((id)a1, "genericCombinations");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v54, "jsonRepresentation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = CFSTR("genericCombinations");
    }
    else
    {
      objc_msgSend(v54, "dictionaryRepresentation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = CFSTR("generic_combinations");
    }
    objc_msgSend(v4, "setObject:forKey:", v56, v57);

  }
  v58 = *(_DWORD *)(a1 + 172);
  if ((v58 & 1) != 0)
  {
    v59 = *(int *)(a1 + 156);
    if (v59 < 0x13 && ((0x7FF7Fu >> v59) & 1) != 0)
    {
      v60 = off_1E1C08100[v59];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 156));
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("format"));

    v58 = *(_DWORD *)(a1 + 172);
  }
  if ((v58 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 168));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v62 = CFSTR("waypointIndex");
    else
      v62 = CFSTR("waypoint_index");
    objc_msgSend(v4, "setObject:forKey:", v61, v62);

  }
  v63 = *(void **)(a1 + 16);
  if (v63)
  {
    objc_msgSend(v63, "dictionaryRepresentation");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v64, "count"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __47__GEOFormatArgument__dictionaryRepresentation___block_invoke;
      v70[3] = &unk_1E1C00600;
      v67 = v66;
      v71 = v67;
      objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v70);
      v68 = v67;

      v65 = v68;
    }
    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOFormatArgument _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOFormatArgument__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOFormatArgument)initWithDictionary:(id)a3
{
  return (GEOFormatArgument *)-[GEOFormatArgument _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  GEOPrice *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  GEOPBTransitArtwork *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  GEOTimestampData *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  GEOCountdownData *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  GEONumberData *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  GEOMeasurementData *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  GEOURLData *v59;
  uint64_t v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  GEOManeuverData *v64;
  uint64_t v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  GEOGenericStringData *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  GEOGenericCombinations *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  const __CFString *v80;
  void *v81;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_165;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_165;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("token"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setToken:", v7);

  }
  if (a3)
    v8 = CFSTR("valInt1");
  else
    v8 = CFSTR("val_int_1");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setValInt1:", objc_msgSend(v9, "unsignedIntValue"));

  if (a3)
    v10 = CFSTR("valInt2");
  else
    v10 = CFSTR("val_int_2");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setValInt2:", objc_msgSend(v11, "unsignedIntValue"));

  if (a3)
    v12 = CFSTR("valInt3");
  else
    v12 = CFSTR("val_int_3");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v90 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addValInt3:", objc_msgSend(v19, "unsignedIntValue"));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
      }
      while (v16);
    }

  }
  if (a3)
    v20 = CFSTR("valString");
  else
    v20 = CFSTR("val_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(a1, "setValString:", v22);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("price"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOPrice alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOPrice initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOPrice initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setPrice:", v25);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = [GEOPBTransitArtwork alloc];
    if ((a3 & 1) != 0)
      v29 = -[GEOPBTransitArtwork initWithJSON:](v28, "initWithJSON:", v27);
    else
      v29 = -[GEOPBTransitArtwork initWithDictionary:](v28, "initWithDictionary:", v27);
    v30 = (void *)v29;
    objc_msgSend(a1, "setArtwork:", v29);

  }
  if (a3)
    v31 = CFSTR("timestampData");
  else
    v31 = CFSTR("timestamp_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = v32;
    v84 = v5;
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v86 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = [GEOTimestampData alloc];
            if ((a3 & 1) != 0)
              v40 = -[GEOTimestampData initWithJSON:](v39, "initWithJSON:", v38);
            else
              v40 = -[GEOTimestampData initWithDictionary:](v39, "initWithDictionary:", v38);
            v41 = (void *)v40;
            objc_msgSend(a1, "addTimestampData:", v40, v83, v84, (_QWORD)v85);

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
      }
      while (v35);
    }

    v32 = v83;
    v5 = v84;
  }

  if (a3)
    v42 = CFSTR("countdownData");
  else
    v42 = CFSTR("countdown_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42, v83, v84);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = [GEOCountdownData alloc];
    if ((a3 & 1) != 0)
      v45 = -[GEOCountdownData initWithJSON:](v44, "initWithJSON:", v43);
    else
      v45 = -[GEOCountdownData initWithDictionary:](v44, "initWithDictionary:", v43);
    v46 = (void *)v45;
    objc_msgSend(a1, "setCountdownData:", v45);

  }
  if (a3)
    v47 = CFSTR("numberData");
  else
    v47 = CFSTR("number_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = [GEONumberData alloc];
    if ((a3 & 1) != 0)
      v50 = -[GEONumberData initWithJSON:](v49, "initWithJSON:", v48);
    else
      v50 = -[GEONumberData initWithDictionary:](v49, "initWithDictionary:", v48);
    v51 = (void *)v50;
    objc_msgSend(a1, "setNumberData:", v50);

  }
  if (a3)
    v52 = CFSTR("measurementData");
  else
    v52 = CFSTR("measurement_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = [GEOMeasurementData alloc];
    if ((a3 & 1) != 0)
      v55 = -[GEOMeasurementData initWithJSON:](v54, "initWithJSON:", v53);
    else
      v55 = -[GEOMeasurementData initWithDictionary:](v54, "initWithDictionary:", v53);
    v56 = (void *)v55;
    objc_msgSend(a1, "setMeasurementData:", v55);

  }
  if (a3)
    v57 = CFSTR("urlData");
  else
    v57 = CFSTR("url_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = [GEOURLData alloc];
    if ((a3 & 1) != 0)
      v60 = -[GEOURLData initWithJSON:](v59, "initWithJSON:", v58);
    else
      v60 = -[GEOURLData initWithDictionary:](v59, "initWithDictionary:", v58);
    v61 = (void *)v60;
    objc_msgSend(a1, "setUrlData:", v60);

  }
  if (a3)
    v62 = CFSTR("maneuverData");
  else
    v62 = CFSTR("maneuver_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = [GEOManeuverData alloc];
    if ((a3 & 1) != 0)
      v65 = -[GEOManeuverData initWithJSON:](v64, "initWithJSON:", v63);
    else
      v65 = -[GEOManeuverData initWithDictionary:](v64, "initWithDictionary:", v63);
    v66 = (void *)v65;
    objc_msgSend(a1, "setManeuverData:", v65);

  }
  if (a3)
    v67 = CFSTR("stringSubstituteData");
  else
    v67 = CFSTR("string_substitute_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = [GEOGenericStringData alloc];
    if ((a3 & 1) != 0)
      v70 = -[GEOGenericStringData initWithJSON:](v69, "initWithJSON:", v68);
    else
      v70 = -[GEOGenericStringData initWithDictionary:](v69, "initWithDictionary:", v68);
    v71 = (void *)v70;
    objc_msgSend(a1, "setStringSubstituteData:", v70);

  }
  if (a3)
    v72 = CFSTR("genericCombinations");
  else
    v72 = CFSTR("generic_combinations");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = [GEOGenericCombinations alloc];
    if ((a3 & 1) != 0)
      v75 = -[GEOGenericCombinations initWithJSON:](v74, "initWithJSON:", v73);
    else
      v75 = -[GEOGenericCombinations initWithDictionary:](v74, "initWithDictionary:", v73);
    v76 = (void *)v75;
    objc_msgSend(a1, "setGenericCombinations:", v75);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("format"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v78 = v77;
    if ((objc_msgSend(v78, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v79 = 0;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
    {
      v79 = 1;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("TIMESTAMP")) & 1) != 0)
    {
      v79 = 2;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("DURATION_SHORT_UNITS")) & 1) != 0)
    {
      v79 = 3;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("DURATION_MEDIUM_UNITS")) & 1) != 0)
    {
      v79 = 4;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("FREQUENCY_VALUE")) & 1) != 0)
    {
      v79 = 5;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("FREQUENCY_RANGE")) & 1) != 0)
    {
      v79 = 6;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
    {
      v79 = 8;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("TIMESTAMP_LIST")) & 1) != 0)
    {
      v79 = 9;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
    {
      v79 = 10;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("ARTWORK")) & 1) != 0)
    {
      v79 = 11;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("COUNTDOWN_LIST")) & 1) != 0)
    {
      v79 = 12;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("PERCENTAGE")) & 1) != 0)
    {
      v79 = 13;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("URL")) & 1) != 0)
    {
      v79 = 14;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("MANEUVER")) & 1) != 0)
    {
      v79 = 15;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("POWER")) & 1) != 0)
    {
      v79 = 16;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("GENERIC_STRING")) & 1) != 0)
    {
      v79 = 17;
    }
    else if (objc_msgSend(v78, "isEqualToString:", CFSTR("GENERIC_COMBINATIONS")))
    {
      v79 = 18;
    }
    else
    {
      v79 = 0;
    }

    goto LABEL_158;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v79 = objc_msgSend(v77, "intValue");
LABEL_158:
    objc_msgSend(a1, "setFormat:", v79);
  }

  if (a3)
    v80 = CFSTR("waypointIndex");
  else
    v80 = CFSTR("waypoint_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWaypointIndex:", objc_msgSend(v81, "intValue"));

LABEL_165:
  return a1;
}

- (GEOFormatArgument)initWithJSON:(id)a3
{
  return (GEOFormatArgument *)-[GEOFormatArgument _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1978;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1979;
    GEOFormatArgumentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOFormatArgumentCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormatArgumentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormatArgumentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $7A3EB02FEAFF35E6843F3D548DA5361E flags;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  $7A3EB02FEAFF35E6843F3D548DA5361E v12;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOFormatArgumentIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOFormatArgument readAll:](self, "readAll:", 0);
    if (self->_token)
      PBDataWriterWriteStringField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_valInt3s.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_valInt3s.count);
    }
    if (self->_valString)
      PBDataWriterWriteStringField();
    if (self->_price)
      PBDataWriterWriteSubmessage();
    if (self->_artwork)
      PBDataWriterWriteSubmessage();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_timestampDatas;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (self->_countdownData)
      PBDataWriterWriteSubmessage();
    if (self->_numberData)
      PBDataWriterWriteSubmessage();
    if (self->_measurementData)
      PBDataWriterWriteSubmessage();
    if (self->_urlData)
      PBDataWriterWriteSubmessage();
    if (self->_maneuverData)
      PBDataWriterWriteSubmessage();
    if (self->_stringSubstituteData)
      PBDataWriterWriteSubmessage();
    if (self->_genericCombinations)
      PBDataWriterWriteSubmessage();
    v12 = self->_flags;
    if ((*(_BYTE *)&v12 & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v12 = self->_flags;
    }
    if ((*(_BYTE *)&v12 & 8) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
  }

}

- (void)copyTo:(id)a3
{
  $7A3EB02FEAFF35E6843F3D548DA5361E flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;
  $7A3EB02FEAFF35E6843F3D548DA5361E v13;
  id *v14;

  v14 = (id *)a3;
  -[GEOFormatArgument readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v14 + 1, self->_reader);
  *((_DWORD *)v14 + 36) = self->_readerMarkPos;
  *((_DWORD *)v14 + 37) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_token)
    objc_msgSend(v14, "setToken:");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_DWORD *)v14 + 40) = self->_valInt1;
    *((_DWORD *)v14 + 43) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *((_DWORD *)v14 + 41) = self->_valInt2;
    *((_DWORD *)v14 + 43) |= 4u;
  }
  if (-[GEOFormatArgument valInt3sCount](self, "valInt3sCount"))
  {
    objc_msgSend(v14, "clearValInt3s");
    v5 = -[GEOFormatArgument valInt3sCount](self, "valInt3sCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v14, "addValInt3:", -[GEOFormatArgument valInt3AtIndex:](self, "valInt3AtIndex:", i));
    }
  }
  if (self->_valString)
    objc_msgSend(v14, "setValString:");
  if (self->_price)
    objc_msgSend(v14, "setPrice:");
  if (self->_artwork)
    objc_msgSend(v14, "setArtwork:");
  if (-[GEOFormatArgument timestampDatasCount](self, "timestampDatasCount"))
  {
    objc_msgSend(v14, "clearTimestampDatas");
    v8 = -[GEOFormatArgument timestampDatasCount](self, "timestampDatasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOFormatArgument timestampDataAtIndex:](self, "timestampDataAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addTimestampData:", v11);

      }
    }
  }
  if (self->_countdownData)
    objc_msgSend(v14, "setCountdownData:");
  v12 = v14;
  if (self->_numberData)
  {
    objc_msgSend(v14, "setNumberData:");
    v12 = v14;
  }
  if (self->_measurementData)
  {
    objc_msgSend(v14, "setMeasurementData:");
    v12 = v14;
  }
  if (self->_urlData)
  {
    objc_msgSend(v14, "setUrlData:");
    v12 = v14;
  }
  if (self->_maneuverData)
  {
    objc_msgSend(v14, "setManeuverData:");
    v12 = v14;
  }
  if (self->_stringSubstituteData)
  {
    objc_msgSend(v14, "setStringSubstituteData:");
    v12 = v14;
  }
  if (self->_genericCombinations)
  {
    objc_msgSend(v14, "setGenericCombinations:");
    v12 = v14;
  }
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 1) != 0)
  {
    *((_DWORD *)v12 + 39) = self->_format;
    *((_DWORD *)v12 + 43) |= 1u;
    v13 = self->_flags;
  }
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    *((_DWORD *)v12 + 42) = self->_waypointIndex;
    *((_DWORD *)v12 + 43) |= 8u;
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
  $7A3EB02FEAFF35E6843F3D548DA5361E flags;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  $7A3EB02FEAFF35E6843F3D548DA5361E v37;
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
    if ((*((_BYTE *)&self->_flags + 2) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOFormatArgumentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOFormatArgument readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v9;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_valInt1;
    *(_DWORD *)(v5 + 172) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_valInt2;
    *(_DWORD *)(v5 + 172) |= 4u;
  }
  PBRepeatedUInt32Copy();
  v12 = -[NSString copyWithZone:](self->_valString, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v12;

  v14 = -[GEOPrice copyWithZone:](self->_price, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  v16 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = self->_timestampDatas;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend((id)v5, "addTimestampData:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v19);
  }

  v23 = -[GEOCountdownData copyWithZone:](self->_countdownData, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v23;

  v25 = -[GEONumberData copyWithZone:](self->_numberData, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v25;

  v27 = -[GEOMeasurementData copyWithZone:](self->_measurementData, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v27;

  v29 = -[GEOURLData copyWithZone:](self->_urlData, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v29;

  v31 = -[GEOManeuverData copyWithZone:](self->_maneuverData, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v31;

  v33 = -[GEOGenericStringData copyWithZone:](self->_stringSubstituteData, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v33;

  v35 = -[GEOGenericCombinations copyWithZone:](self->_genericCombinations, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v35;

  v37 = self->_flags;
  if ((*(_BYTE *)&v37 & 1) != 0)
  {
    *(_DWORD *)(v5 + 156) = self->_format;
    *(_DWORD *)(v5 + 172) |= 1u;
    v37 = self->_flags;
  }
  if ((*(_BYTE *)&v37 & 8) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_waypointIndex;
    *(_DWORD *)(v5 + 172) |= 8u;
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
  NSString *token;
  $7A3EB02FEAFF35E6843F3D548DA5361E flags;
  int v7;
  NSString *valString;
  GEOPrice *price;
  GEOPBTransitArtwork *artwork;
  NSMutableArray *timestampDatas;
  GEOCountdownData *countdownData;
  GEONumberData *numberData;
  GEOMeasurementData *measurementData;
  GEOURLData *urlData;
  GEOManeuverData *maneuverData;
  GEOGenericStringData *stringSubstituteData;
  GEOGenericCombinations *genericCombinations;
  $7A3EB02FEAFF35E6843F3D548DA5361E v19;
  int v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  -[GEOFormatArgument readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](token, "isEqual:"))
      goto LABEL_46;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 43);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_valInt1 != *((_DWORD *)v4 + 40))
      goto LABEL_46;
  }
  else if ((v7 & 2) != 0)
  {
LABEL_46:
    v21 = 0;
    goto LABEL_47;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_valInt2 != *((_DWORD *)v4 + 41))
      goto LABEL_46;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_46;
  valString = self->_valString;
  if ((unint64_t)valString | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](valString, "isEqual:"))
      goto LABEL_46;
  }
  price = self->_price;
  if ((unint64_t)price | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPrice isEqual:](price, "isEqual:"))
      goto LABEL_46;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:"))
      goto LABEL_46;
  }
  timestampDatas = self->_timestampDatas;
  if ((unint64_t)timestampDatas | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](timestampDatas, "isEqual:"))
      goto LABEL_46;
  }
  countdownData = self->_countdownData;
  if ((unint64_t)countdownData | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOCountdownData isEqual:](countdownData, "isEqual:"))
      goto LABEL_46;
  }
  numberData = self->_numberData;
  if ((unint64_t)numberData | *((_QWORD *)v4 + 11))
  {
    if (!-[GEONumberData isEqual:](numberData, "isEqual:"))
      goto LABEL_46;
  }
  measurementData = self->_measurementData;
  if ((unint64_t)measurementData | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOMeasurementData isEqual:](measurementData, "isEqual:"))
      goto LABEL_46;
  }
  urlData = self->_urlData;
  if ((unint64_t)urlData | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOURLData isEqual:](urlData, "isEqual:"))
      goto LABEL_46;
  }
  maneuverData = self->_maneuverData;
  if ((unint64_t)maneuverData | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOManeuverData isEqual:](maneuverData, "isEqual:"))
      goto LABEL_46;
  }
  stringSubstituteData = self->_stringSubstituteData;
  if ((unint64_t)stringSubstituteData | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOGenericStringData isEqual:](stringSubstituteData, "isEqual:"))
      goto LABEL_46;
  }
  genericCombinations = self->_genericCombinations;
  if ((unint64_t)genericCombinations | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOGenericCombinations isEqual:](genericCombinations, "isEqual:"))
      goto LABEL_46;
  }
  v19 = self->_flags;
  v20 = *((_DWORD *)v4 + 43);
  if ((*(_BYTE *)&v19 & 1) != 0)
  {
    if ((v20 & 1) == 0 || self->_format != *((_DWORD *)v4 + 39))
      goto LABEL_46;
  }
  else if ((v20 & 1) != 0)
  {
    goto LABEL_46;
  }
  v21 = (*((_DWORD *)v4 + 43) & 8) == 0;
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_waypointIndex != *((_DWORD *)v4 + 42))
      goto LABEL_46;
    v21 = 1;
  }
LABEL_47:

  return v21;
}

- (unint64_t)hash
{
  $7A3EB02FEAFF35E6843F3D548DA5361E flags;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  $7A3EB02FEAFF35E6843F3D548DA5361E v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;

  -[GEOFormatArgument readAll:](self, "readAll:", 1);
  v22 = -[NSString hash](self->_token, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v21 = 2654435761 * self->_valInt1;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_valInt2;
      goto LABEL_6;
    }
  }
  v20 = 0;
LABEL_6:
  v19 = PBRepeatedUInt32Hash();
  v18 = -[NSString hash](self->_valString, "hash");
  v17 = -[GEOPrice hash](self->_price, "hash");
  v16 = -[GEOPBTransitArtwork hash](self->_artwork, "hash");
  v4 = -[NSMutableArray hash](self->_timestampDatas, "hash");
  v5 = -[GEOCountdownData hash](self->_countdownData, "hash");
  v6 = -[GEONumberData hash](self->_numberData, "hash");
  v7 = -[GEOMeasurementData hash](self->_measurementData, "hash");
  v8 = -[GEOURLData hash](self->_urlData, "hash");
  v9 = -[GEOManeuverData hash](self->_maneuverData, "hash");
  v10 = -[GEOGenericStringData hash](self->_stringSubstituteData, "hash");
  v11 = -[GEOGenericCombinations hash](self->_genericCombinations, "hash");
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    v13 = 2654435761 * self->_format;
    if ((*(_BYTE *)&v12 & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v14 = 0;
    return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((*(_BYTE *)&v12 & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v14 = 2654435761 * self->_waypointIndex;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  GEOPrice *price;
  uint64_t v10;
  GEOPBTransitArtwork *artwork;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  GEOCountdownData *countdownData;
  uint64_t v19;
  GEONumberData *numberData;
  uint64_t v21;
  GEOMeasurementData *measurementData;
  uint64_t v23;
  GEOURLData *urlData;
  uint64_t v25;
  GEOManeuverData *maneuverData;
  uint64_t v27;
  GEOGenericStringData *stringSubstituteData;
  uint64_t v29;
  GEOGenericCombinations *genericCombinations;
  uint64_t v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 15))
    -[GEOFormatArgument setToken:](self, "setToken:");
  v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 2) != 0)
  {
    self->_valInt1 = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_flags |= 2u;
    v5 = *((_DWORD *)v4 + 43);
  }
  if ((v5 & 4) != 0)
  {
    self->_valInt2 = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 4u;
  }
  v6 = objc_msgSend(v4, "valInt3sCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[GEOFormatArgument addValInt3:](self, "addValInt3:", objc_msgSend(v4, "valInt3AtIndex:", i));
  }
  if (*((_QWORD *)v4 + 17))
    -[GEOFormatArgument setValString:](self, "setValString:");
  price = self->_price;
  v10 = *((_QWORD *)v4 + 12);
  if (price)
  {
    if (v10)
      -[GEOPrice mergeFrom:](price, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEOFormatArgument setPrice:](self, "setPrice:");
  }
  artwork = self->_artwork;
  v12 = *((_QWORD *)v4 + 6);
  if (artwork)
  {
    if (v12)
      -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOFormatArgument setArtwork:](self, "setArtwork:");
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = *((id *)v4 + 14);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        -[GEOFormatArgument addTimestampData:](self, "addTimestampData:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), (_QWORD)v33);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v15);
  }

  countdownData = self->_countdownData;
  v19 = *((_QWORD *)v4 + 7);
  if (countdownData)
  {
    if (v19)
      -[GEOCountdownData mergeFrom:](countdownData, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOFormatArgument setCountdownData:](self, "setCountdownData:");
  }
  numberData = self->_numberData;
  v21 = *((_QWORD *)v4 + 11);
  if (numberData)
  {
    if (v21)
      -[GEONumberData mergeFrom:](numberData, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOFormatArgument setNumberData:](self, "setNumberData:");
  }
  measurementData = self->_measurementData;
  v23 = *((_QWORD *)v4 + 10);
  if (measurementData)
  {
    if (v23)
      -[GEOMeasurementData mergeFrom:](measurementData, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOFormatArgument setMeasurementData:](self, "setMeasurementData:");
  }
  urlData = self->_urlData;
  v25 = *((_QWORD *)v4 + 16);
  if (urlData)
  {
    if (v25)
      -[GEOURLData mergeFrom:](urlData, "mergeFrom:");
  }
  else if (v25)
  {
    -[GEOFormatArgument setUrlData:](self, "setUrlData:");
  }
  maneuverData = self->_maneuverData;
  v27 = *((_QWORD *)v4 + 9);
  if (maneuverData)
  {
    if (v27)
      -[GEOManeuverData mergeFrom:](maneuverData, "mergeFrom:");
  }
  else if (v27)
  {
    -[GEOFormatArgument setManeuverData:](self, "setManeuverData:");
  }
  stringSubstituteData = self->_stringSubstituteData;
  v29 = *((_QWORD *)v4 + 13);
  if (stringSubstituteData)
  {
    if (v29)
      -[GEOGenericStringData mergeFrom:](stringSubstituteData, "mergeFrom:");
  }
  else if (v29)
  {
    -[GEOFormatArgument setStringSubstituteData:](self, "setStringSubstituteData:");
  }
  genericCombinations = self->_genericCombinations;
  v31 = *((_QWORD *)v4 + 8);
  if (genericCombinations)
  {
    if (v31)
      -[GEOGenericCombinations mergeFrom:](genericCombinations, "mergeFrom:");
  }
  else if (v31)
  {
    -[GEOFormatArgument setGenericCombinations:](self, "setGenericCombinations:");
  }
  v32 = *((_DWORD *)v4 + 43);
  if ((v32 & 1) != 0)
  {
    self->_format = *((_DWORD *)v4 + 39);
    *(_DWORD *)&self->_flags |= 1u;
    v32 = *((_DWORD *)v4 + 43);
  }
  if ((v32 & 8) != 0)
  {
    self->_waypointIndex = *((_DWORD *)v4 + 42);
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
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOFormatArgumentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1982);
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
  *(_DWORD *)&self->_flags |= 0x40010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOFormatArgument readAll:](self, "readAll:", 0);
    -[GEOPrice clearUnknownFields:](self->_price, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artwork, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_timestampDatas;
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

    -[GEOCountdownData clearUnknownFields:](self->_countdownData, "clearUnknownFields:", 1);
    -[GEONumberData clearUnknownFields:](self->_numberData, "clearUnknownFields:", 1);
    -[GEOMeasurementData clearUnknownFields:](self->_measurementData, "clearUnknownFields:", 1);
    -[GEOURLData clearUnknownFields:](self->_urlData, "clearUnknownFields:", 1);
    -[GEOManeuverData clearUnknownFields:](self->_maneuverData, "clearUnknownFields:", 1);
    -[GEOGenericStringData clearUnknownFields:](self->_stringSubstituteData, "clearUnknownFields:", 1);
    -[GEOGenericCombinations clearUnknownFields:](self->_genericCombinations, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valString, 0);
  objc_storeStrong((id *)&self->_urlData, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_timestampDatas, 0);
  objc_storeStrong((id *)&self->_stringSubstituteData, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_numberData, 0);
  objc_storeStrong((id *)&self->_measurementData, 0);
  objc_storeStrong((id *)&self->_maneuverData, 0);
  objc_storeStrong((id *)&self->_genericCombinations, 0);
  objc_storeStrong((id *)&self->_countdownData, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (int64_t)type
{
  int v2;

  v2 = -[GEOFormatArgument format](self, "format") - 1;
  if (v2 > 0x11)
    return 0;
  else
    return qword_189CDED80[v2];
}

- (NSArray)value3s
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOFormatArgument valInt3sCount](self, "valInt3sCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOFormatArgument valInt3sCount](self, "valInt3sCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GEOFormatArgument valInt3AtIndex:](self, "valInt3AtIndex:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[GEOFormatArgument valInt3sCount](self, "valInt3sCount"));
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (float)percentageValue
{
  void *v2;
  float v3;
  float v4;

  -[GEOFormatArgument numberData](self, "numberData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (NSArray)timeStampValues
{
  void *v2;
  void *v3;

  -[GEOFormatArgument timestampDatas](self, "timestampDatas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)shouldScaleUnits
{
  void *v3;
  void *v4;
  char v5;

  -[GEOFormatArgument measurementData](self, "measurementData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableUnitScaling"))
  {
    -[GEOFormatArgument measurementData](self, "measurementData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enableUnitScaling");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NSString)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[GEOFormatArgument artworkValue](self, "artworkValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[GEOFormatArgument stringValue](self, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (id)stringWithDefaultValues
{
  int v3;
  GEOFormatArgument *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;

  v3 = -[GEOFormatArgument format](self, "format");
  if (v3 != 16)
  {
    if (v3 == 4)
    {
      -[GEOFormatArgument _secondsRoundedUpToNearestMinute:](self, "_secondsRoundedUpToNearestMinute:", (double)-[GEOFormatArgument valInt1](self, "valInt1"));
      v4 = self;
      v5 = 3;
      goto LABEL_9;
    }
    if (v3 == 3)
    {
      -[GEOFormatArgument _secondsRoundedUpToNearestMinute:](self, "_secondsRoundedUpToNearestMinute:", (double)-[GEOFormatArgument valInt1](self, "valInt1"));
      v4 = self;
      v5 = 2;
LABEL_9:
      -[GEOFormatArgument _stringForDurationSeconds:unitsStyle:](v4, "_stringForDurationSeconds:unitsStyle:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      return v11;
    }
    goto LABEL_7;
  }
  -[GEOFormatArgument numberData](self, "numberData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v11 = 0;
    return v11;
  }
  -[GEOFormatArgument numberData](self, "numberData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3AE8], "kilowatts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOFormatArgument _stringForPower:unit:](self, "_stringForPower:unit:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)_secondsRoundedUpToNearestMinute:(double)a3
{
  return ceil(a3 / 60.0) * 60.0;
}

- (id)_stringForDurationSeconds:(double)a3 unitsStyle:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  -[GEOFormatArgument _formatterForDurationString](self, "_formatterForDurationString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnitsStyle:", a4);
  objc_msgSend(v6, "stringFromTimeInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E1C241D0);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

- (id)_formatterForDurationString
{
  if (qword_1ECDBC400 != -1)
    dispatch_once(&qword_1ECDBC400, &__block_literal_global_136);
  return (id)_MergedGlobals_275;
}

uint64_t __67__GEOFormatArgument_GEOServicesExtras___formatterForDurationString__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_MergedGlobals_275;
  _MergedGlobals_275 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_275, "setZeroFormattingBehavior:", 14);
  objc_msgSend((id)_MergedGlobals_275, "setAllowedUnits:", 112);
  return objc_msgSend((id)_MergedGlobals_275, "setMaximumUnitCount:", 2);
}

- (id)_stringForPower:(double)a3 unit:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v5 = qword_1ECDBC410;
  v6 = a4;
  if (v5 != -1)
    dispatch_once(&qword_1ECDBC410, &__block_literal_global_8_2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3758]), "initWithDoubleValue:unit:", v6, a3);

  objc_msgSend((id)qword_1ECDBC408, "stringFromMeasurement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __61__GEOFormatArgument_GEOServicesExtras___stringForPower_unit___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3760]);
  v1 = (void *)qword_1ECDBC408;
  qword_1ECDBC408 = (uint64_t)v0;

}

@end
