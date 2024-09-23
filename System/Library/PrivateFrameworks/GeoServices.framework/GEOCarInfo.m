@implementation GEOCarInfo

- (GEOCarInfo)init
{
  GEOCarInfo *v2;
  GEOCarInfo *v3;
  GEOCarInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCarInfo;
  v2 = -[GEOCarInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCarInfo)initWithData:(id)a3
{
  GEOCarInfo *v3;
  GEOCarInfo *v4;
  GEOCarInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCarInfo;
  v3 = -[GEOCarInfo initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCarInfo;
  -[GEOCarInfo dealloc](&v3, sel_dealloc);
}

- (void)_readManufacturer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 161) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManufacturer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasManufacturer
{
  -[GEOCarInfo _readManufacturer]((uint64_t)self);
  return self->_manufacturer != 0;
}

- (NSString)manufacturer
{
  -[GEOCarInfo _readManufacturer]((uint64_t)self);
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (void)_readModel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 161) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasModel
{
  -[GEOCarInfo _readModel]((uint64_t)self);
  return self->_model != 0;
}

- (NSString)model
{
  -[GEOCarInfo _readModel]((uint64_t)self);
  return self->_model;
}

- (void)setModel:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_model, a3);
}

- (GEOScreenResolution)screenResolution
{
  *retstr = self[3];
  return self;
}

- (void)setScreenResolution:(GEOScreenResolution *)a3
{
  uint64_t v3;

  *(_DWORD *)&self->_flags |= 0x10001u;
  v3 = *(_QWORD *)&a3->_has;
  *(_OWORD *)&self->_screenResolution._height = *(_OWORD *)&a3->_height;
  *(_QWORD *)&self->_screenResolution._has = v3;
}

- (void)setHasScreenResolution:(BOOL)a3
{
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasScreenResolution
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)deviceConnection
{
  os_unfair_lock_s *p_readerLock;
  $FE2B1A96AD49C8B211CE021377EF8B62 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_deviceConnection;
  else
    return 0;
}

- (void)setDeviceConnection:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_deviceConnection = a3;
}

- (void)setHasDeviceConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65544;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDeviceConnection
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)deviceConnectionAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C138A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceConnection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_CONNECTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_CONNECTION_CABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_CONNECTION_WIRELESS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)destinationSharingEnabled
{
  return self->_destinationSharingEnabled;
}

- (void)setDestinationSharingEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_destinationSharingEnabled = a3;
}

- (void)setHasDestinationSharingEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65568;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasDestinationSharingEnabled
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (int)navAidedDrivingStatus
{
  os_unfair_lock_s *p_readerLock;
  $FE2B1A96AD49C8B211CE021377EF8B62 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_navAidedDrivingStatus;
  else
    return 0;
}

- (void)setNavAidedDrivingStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_navAidedDrivingStatus = a3;
}

- (void)setHasNavAidedDrivingStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65552;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasNavAidedDrivingStatus
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)navAidedDrivingStatusAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C138C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavAidedDrivingStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAD_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNAVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ON")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEngineTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 161) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEngineTypes_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)engineTypesCount
{
  -[GEOCarInfo _readEngineTypes]((uint64_t)self);
  return self->_engineTypes.count;
}

- (int)engineTypes
{
  -[GEOCarInfo _readEngineTypes]((uint64_t)self);
  return self->_engineTypes.list;
}

- (void)clearEngineTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedInt32Clear();
}

- (void)addEngineType:(int)a3
{
  -[GEOCarInfo _readEngineTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (int)engineTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_engineTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCarInfo _readEngineTypes]((uint64_t)self);
  p_engineTypes = &self->_engineTypes;
  count = self->_engineTypes.count;
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
  return p_engineTypes->list[a3];
}

- (void)setEngineTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedInt32Set();
}

- (id)engineTypesAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C138E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngineTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_GASOLINE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_DIESEL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_ELECTRIC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_CNG")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCarName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 161) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCarName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasCarName
{
  -[GEOCarInfo _readCarName]((uint64_t)self);
  return self->_carName != 0;
}

- (NSString)carName
{
  -[GEOCarInfo _readCarName]((uint64_t)self);
  return self->_carName;
}

- (void)setCarName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_carName, a3);
}

- (void)_readScreenDimension
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 161) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScreenDimension_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasScreenDimension
{
  -[GEOCarInfo _readScreenDimension]((uint64_t)self);
  return self->_screenDimension != 0;
}

- (GEOScreenDimension)screenDimension
{
  -[GEOCarInfo _readScreenDimension]((uint64_t)self);
  return self->_screenDimension;
}

- (void)setScreenDimension:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_screenDimension, a3);
}

- (int)colorRange
{
  return self->_colorRange;
}

- (void)setColorRange:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_colorRange = a3;
}

- (void)setHasColorRange:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65540;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasColorRange
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)brightness
{
  return self->_brightness;
}

- (void)setBrightness:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_brightness = a3;
}

- (void)setHasBrightness:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65538;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasBrightness
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readInputMethods
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 161) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInputMethods_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)inputMethodsCount
{
  -[GEOCarInfo _readInputMethods]((uint64_t)self);
  return self->_inputMethods.count;
}

- (int)inputMethods
{
  -[GEOCarInfo _readInputMethods]((uint64_t)self);
  return self->_inputMethods.list;
}

- (void)clearInputMethods
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedInt32Clear();
}

- (void)addInputMethod:(int)a3
{
  -[GEOCarInfo _readInputMethods]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (int)inputMethodAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_inputMethods;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCarInfo _readInputMethods]((uint64_t)self);
  p_inputMethods = &self->_inputMethods;
  count = self->_inputMethods.count;
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
  return p_inputMethods->list[a3];
}

- (void)setInputMethods:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedInt32Set();
}

- (id)inputMethodsAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C13908[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInputMethods:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_INPUT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNOB")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOUCHPAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOUCHSCREEN_HIFI")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOUCHSCREEN_LOFI")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isInstrumentClusterEnabled
{
  return self->_isInstrumentClusterEnabled;
}

- (void)setIsInstrumentClusterEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_isInstrumentClusterEnabled = a3;
}

- (void)setHasIsInstrumentClusterEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65664;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsInstrumentClusterEnabled
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)isInstructionCardEnabled
{
  return self->_isInstructionCardEnabled;
}

- (void)setIsInstructionCardEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_isInstructionCardEnabled = a3;
}

- (void)setHasIsInstructionCardEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65600;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsInstructionCardEnabled
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)isMapviewEnabled
{
  return self->_isMapviewEnabled;
}

- (void)setIsMapviewEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_isMapviewEnabled = a3;
}

- (void)setHasIsMapviewEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65792;
  else
    v3 = 0x10000;
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsMapviewEnabled
{
  return *((_BYTE *)&self->_flags + 1) & 1;
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
  v8.super_class = (Class)GEOCarInfo;
  -[GEOCarInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCarInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCarInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  int v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;
  int v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  _QWORD v52[4];
  id v53;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("manufacturer"));

  objc_msgSend((id)a1, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("model"));

  v7 = *(_DWORD *)(a1 + 160);
  if ((v7 & 1) != 0)
  {
    _GEOScreenResolutionDictionaryRepresentation(a1 + 72);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("screenResolution"));

    v7 = *(_DWORD *)(a1 + 160);
  }
  if ((v7 & 8) != 0)
  {
    v9 = *(int *)(a1 + 148);
    if (v9 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 148));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C138A8[v9];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("deviceConnection"));

    v7 = *(_DWORD *)(a1 + 160);
  }
  if ((v7 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 156));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("destinationSharingEnabled");
    else
      v12 = CFSTR("destination_sharing_enabled");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v7 = *(_DWORD *)(a1 + 160);
  }
  if ((v7 & 0x10) != 0)
  {
    v13 = *(int *)(a1 + 152);
    if (v13 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 152));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C138C0[v13];
    }
    if (a2)
      v15 = CFSTR("navAidedDrivingStatus");
    else
      v15 = CFSTR("nav_aided_driving_status");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v18 = 0;
      do
      {
        v19 = *(int *)(*v17 + 4 * v18);
        if (v19 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = off_1E1C138E0[v19];
        }
        objc_msgSend(v16, "addObject:", v20);

        ++v18;
        v17 = (_QWORD *)(a1 + 24);
      }
      while (v18 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v21 = CFSTR("engineType");
    else
      v21 = CFSTR("engine_type");
    objc_msgSend(v4, "setObject:forKey:", v16, v21);

  }
  objc_msgSend((id)a1, "carName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (a2)
      v23 = CFSTR("carName");
    else
      v23 = CFSTR("car_name");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);
  }

  objc_msgSend((id)a1, "screenDimension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("screenDimension");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("screen_dimension");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  v28 = *(_DWORD *)(a1 + 160);
  if ((v28 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 144));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("colorRange");
    else
      v30 = CFSTR("color_range");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

    v28 = *(_DWORD *)(a1 + 160);
  }
  if ((v28 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 140));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("brightness"));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v34 = 0;
      do
      {
        v35 = *(int *)(*v33 + 4 * v34);
        if (v35 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E1C13908[v35];
        }
        objc_msgSend(v32, "addObject:", v36);

        ++v34;
        v33 = (_QWORD *)(a1 + 48);
      }
      while (v34 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v37 = CFSTR("inputMethod");
    else
      v37 = CFSTR("input_method");
    objc_msgSend(v4, "setObject:forKey:", v32, v37);

  }
  v38 = *(_DWORD *)(a1 + 160);
  if ((v38 & 0x80) == 0)
  {
    if ((v38 & 0x40) == 0)
      goto LABEL_67;
LABEL_82:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 157));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v51 = CFSTR("isInstructionCardEnabled");
    else
      v51 = CFSTR("is_instruction_card_enabled");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

    if ((*(_DWORD *)(a1 + 160) & 0x100) == 0)
      goto LABEL_72;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 158));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v49 = CFSTR("isInstrumentClusterEnabled");
  else
    v49 = CFSTR("is_instrument_cluster_enabled");
  objc_msgSend(v4, "setObject:forKey:", v48, v49);

  v38 = *(_DWORD *)(a1 + 160);
  if ((v38 & 0x40) != 0)
    goto LABEL_82;
LABEL_67:
  if ((v38 & 0x100) != 0)
  {
LABEL_68:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 159));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("isMapviewEnabled");
    else
      v40 = CFSTR("is_mapview_enabled");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
LABEL_72:
  v41 = *(void **)(a1 + 16);
  if (v41)
  {
    objc_msgSend(v41, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v42, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __40__GEOCarInfo__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E1C00600;
      v45 = v44;
      v53 = v45;
      objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v52);
      v46 = v45;

      v43 = v46;
    }
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCarInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOCarInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCarInfo)initWithDictionary:(id)a3
{
  return (GEOCarInfo *)-[GEOCarInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEOScreenDimension *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  id v50;
  uint64_t v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v59;
  void *v60;
  int v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_135;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("manufacturer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v6, "setManufacturer:", v8);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v6, "setModel:", v10);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("screenResolution"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = 0uLL;
      v73 = 0;
      _GEOScreenResolutionFromDictionaryRepresentation(v11, (uint64_t)&v72);
      v70 = v72;
      v71 = v73;
      objc_msgSend(v6, "setScreenResolution:", &v70);
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceConnection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DEVICE_CONNECTION_UNKNOWN")) & 1) != 0)
      {
        v14 = 0;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DEVICE_CONNECTION_CABLE")) & 1) != 0)
      {
        v14 = 1;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("DEVICE_CONNECTION_WIRELESS")))
      {
        v14 = 2;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      v14 = objc_msgSend(v12, "intValue");
    }
    objc_msgSend(v6, "setDeviceConnection:", v14);
LABEL_21:

    if (a3)
      v15 = CFSTR("destinationSharingEnabled");
    else
      v15 = CFSTR("destination_sharing_enabled");
    objc_msgSend(v5, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setDestinationSharingEnabled:", objc_msgSend(v16, "BOOLValue"));

    if (a3)
      v17 = CFSTR("navAidedDrivingStatus");
    else
      v17 = CFSTR("nav_aided_driving_status");
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v18;
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NAD_UNKNOWN")) & 1) != 0)
      {
        v20 = 0;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNAVAILABLE")) & 1) != 0)
      {
        v20 = 1;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OFF")) & 1) != 0)
      {
        v20 = 2;
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("ON")))
      {
        v20 = 3;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_43:

        if (a3)
          v21 = CFSTR("engineType");
        else
          v21 = CFSTR("engine_type");
        objc_msgSend(v5, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v61 = a3;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v59 = v22;
          v23 = v22;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
          if (!v24)
            goto LABEL_70;
          v25 = v24;
          v26 = *(_QWORD *)v67;
          while (1)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v67 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v29 = v28;
                if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v30 = 0;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_GASOLINE")) & 1) != 0)
                {
                  v30 = 1;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_DIESEL")) & 1) != 0)
                {
                  v30 = 2;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_ELECTRIC")) & 1) != 0)
                {
                  v30 = 3;
                }
                else if (objc_msgSend(v29, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_CNG")))
                {
                  v30 = 4;
                }
                else
                {
                  v30 = 0;
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                v30 = objc_msgSend(v28, "intValue");
              }
              objc_msgSend(v6, "addEngineType:", v30);
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
            if (!v25)
            {
LABEL_70:

              a3 = v61;
              v22 = v59;
              break;
            }
          }
        }

        if (a3)
          v31 = CFSTR("carName");
        else
          v31 = CFSTR("car_name");
        objc_msgSend(v5, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = (void *)objc_msgSend(v32, "copy");
          objc_msgSend(v6, "setCarName:", v33);

        }
        if (a3)
          v34 = CFSTR("screenDimension");
        else
          v34 = CFSTR("screen_dimension");
        objc_msgSend(v5, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = [GEOScreenDimension alloc];
          if ((a3 & 1) != 0)
            v37 = -[GEOScreenDimension initWithJSON:](v36, "initWithJSON:", v35);
          else
            v37 = -[GEOScreenDimension initWithDictionary:](v36, "initWithDictionary:", v35);
          v38 = (void *)v37;
          objc_msgSend(v6, "setScreenDimension:", v37);

        }
        if (a3)
          v39 = CFSTR("colorRange");
        else
          v39 = CFSTR("color_range");
        objc_msgSend(v5, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setColorRange:", objc_msgSend(v40, "intValue"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("brightness"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setBrightness:", objc_msgSend(v41, "intValue"));

        if (a3)
          v42 = CFSTR("inputMethod");
        else
          v42 = CFSTR("input_method");
        objc_msgSend(v5, "objectForKeyedSubscript:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v60 = v43;
          v44 = v43;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          if (!v45)
            goto LABEL_118;
          v46 = v45;
          v47 = *(_QWORD *)v63;
          while (1)
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v63 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v50 = v49;
                if ((objc_msgSend(v50, "isEqualToString:", CFSTR("UNKNOWN_INPUT_TYPE")) & 1) != 0)
                {
                  v51 = 0;
                }
                else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("KNOB")) & 1) != 0)
                {
                  v51 = 1;
                }
                else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("TOUCHPAD")) & 1) != 0)
                {
                  v51 = 2;
                }
                else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("TOUCHSCREEN_HIFI")) & 1) != 0)
                {
                  v51 = 3;
                }
                else if (objc_msgSend(v50, "isEqualToString:", CFSTR("TOUCHSCREEN_LOFI")))
                {
                  v51 = 4;
                }
                else
                {
                  v51 = 0;
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                v51 = objc_msgSend(v49, "intValue");
              }
              objc_msgSend(v6, "addInputMethod:", v51);
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
            if (!v46)
            {
LABEL_118:

              a3 = v61;
              v43 = v60;
              break;
            }
          }
        }

        if (a3)
          v52 = CFSTR("isInstrumentClusterEnabled");
        else
          v52 = CFSTR("is_instrument_cluster_enabled");
        objc_msgSend(v5, "objectForKeyedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setIsInstrumentClusterEnabled:", objc_msgSend(v53, "BOOLValue"));

        if (a3)
          v54 = CFSTR("isInstructionCardEnabled");
        else
          v54 = CFSTR("is_instruction_card_enabled");
        objc_msgSend(v5, "objectForKeyedSubscript:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setIsInstructionCardEnabled:", objc_msgSend(v55, "BOOLValue"));

        if (a3)
          v56 = CFSTR("isMapviewEnabled");
        else
          v56 = CFSTR("is_mapview_enabled");
        objc_msgSend(v5, "objectForKeyedSubscript:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setIsMapviewEnabled:", objc_msgSend(v57, "BOOLValue"));

        goto LABEL_135;
      }
      v20 = objc_msgSend(v18, "intValue");
    }
    objc_msgSend(v6, "setNavAidedDrivingStatus:", v20);
    goto LABEL_43;
  }
LABEL_135:

  return v6;
}

- (GEOCarInfo)initWithJSON:(id)a3
{
  return (GEOCarInfo *)-[GEOCarInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_212;
    else
      v8 = (int *)&readAll__nonRecursiveTag_213;
    GEOCarInfoReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOScreenDimension readAll:](self->_screenDimension, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCarInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCarInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $FE2B1A96AD49C8B211CE021377EF8B62 flags;
  unint64_t v7;
  $FE2B1A96AD49C8B211CE021377EF8B62 v8;
  unint64_t v9;
  $FE2B1A96AD49C8B211CE021377EF8B62 v10;
  PBDataReader *v11;
  void *v12;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1FC00) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v12);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_39;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCarInfo readAll:](self, "readAll:", 0);
  if (self->_manufacturer)
    PBDataWriterWriteStringField();
  if (self->_model)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    PBDataWriterPlaceMark();
    GEOScreenResolutionWriteTo((uint64_t)&self->_screenResolution);
    PBDataWriterRecallMark();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_engineTypes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_engineTypes.count);
  }
  if (self->_carName)
    PBDataWriterWriteStringField();
  if (self->_screenDimension)
    PBDataWriterWriteSubmessage();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v8 = self->_flags;
  }
  if ((*(_BYTE *)&v8 & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_inputMethods.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_inputMethods.count);
  }
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
    if ((*(_BYTE *)&v10 & 0x40) == 0)
      goto LABEL_28;
LABEL_36:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 0x40) != 0)
    goto LABEL_36;
LABEL_28:
  if ((*(_WORD *)&v10 & 0x100) != 0)
LABEL_29:
    PBDataWriterWriteBOOLField();
LABEL_30:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_39:

}

- (void)copyTo:(id)a3
{
  $FE2B1A96AD49C8B211CE021377EF8B62 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  _DWORD *v8;
  $FE2B1A96AD49C8B211CE021377EF8B62 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  $FE2B1A96AD49C8B211CE021377EF8B62 v13;
  uint64_t v14;
  char *v15;

  v15 = (char *)a3;
  -[GEOCarInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v15 + 1, self->_reader);
  *((_DWORD *)v15 + 32) = self->_readerMarkPos;
  *((_DWORD *)v15 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_manufacturer)
    objc_msgSend(v15, "setManufacturer:");
  if (self->_model)
    objc_msgSend(v15, "setModel:");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v14 = *(_QWORD *)&self->_screenResolution._has;
    *(_OWORD *)(v15 + 72) = *(_OWORD *)&self->_screenResolution._height;
    *((_QWORD *)v15 + 11) = v14;
    *((_DWORD *)v15 + 40) |= 1u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_8;
LABEL_33:
      v15[156] = self->_destinationSharingEnabled;
      *((_DWORD *)v15 + 40) |= 0x20u;
      if ((*(_DWORD *)&self->_flags & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v15 + 37) = self->_deviceConnection;
  *((_DWORD *)v15 + 40) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
    goto LABEL_33;
LABEL_8:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v15 + 38) = self->_navAidedDrivingStatus;
    *((_DWORD *)v15 + 40) |= 0x10u;
  }
LABEL_10:
  if (-[GEOCarInfo engineTypesCount](self, "engineTypesCount"))
  {
    objc_msgSend(v15, "clearEngineTypes");
    v5 = -[GEOCarInfo engineTypesCount](self, "engineTypesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v15, "addEngineType:", -[GEOCarInfo engineTypeAtIndex:](self, "engineTypeAtIndex:", i));
    }
  }
  if (self->_carName)
    objc_msgSend(v15, "setCarName:");
  v8 = v15;
  if (self->_screenDimension)
  {
    objc_msgSend(v15, "setScreenDimension:");
    v8 = v15;
  }
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 4) != 0)
  {
    v8[36] = self->_colorRange;
    v8[40] |= 4u;
    v9 = self->_flags;
  }
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    v8[35] = self->_brightness;
    v8[40] |= 2u;
  }
  if (-[GEOCarInfo inputMethodsCount](self, "inputMethodsCount"))
  {
    objc_msgSend(v15, "clearInputMethods");
    v10 = -[GEOCarInfo inputMethodsCount](self, "inputMethodsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v15, "addInputMethod:", -[GEOCarInfo inputMethodAtIndex:](self, "inputMethodAtIndex:", j));
    }
  }
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 0x80) == 0)
  {
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_28;
LABEL_36:
    v15[157] = self->_isInstructionCardEnabled;
    *((_DWORD *)v15 + 40) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
  v15[158] = self->_isInstrumentClusterEnabled;
  *((_DWORD *)v15 + 40) |= 0x80u;
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
    goto LABEL_36;
LABEL_28:
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_29:
    v15[159] = self->_isMapviewEnabled;
    *((_DWORD *)v15 + 40) |= 0x100u;
  }
LABEL_30:

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
  $FE2B1A96AD49C8B211CE021377EF8B62 flags;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  $FE2B1A96AD49C8B211CE021377EF8B62 v18;
  $FE2B1A96AD49C8B211CE021377EF8B62 v19;
  PBUnknownFields *v20;
  uint64_t v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCarInfo readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_manufacturer, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v9;

    v11 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v11;

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      v22 = *(_QWORD *)&self->_screenResolution._has;
      *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_screenResolution._height;
      *(_QWORD *)(v5 + 88) = v22;
      *(_DWORD *)(v5 + 160) |= 1u;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 8) == 0)
      {
LABEL_7:
        if ((*(_BYTE *)&flags & 0x20) == 0)
          goto LABEL_8;
        goto LABEL_22;
      }
    }
    else if ((*(_BYTE *)&flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 148) = self->_deviceConnection;
    *(_DWORD *)(v5 + 160) |= 8u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
LABEL_22:
    *(_BYTE *)(v5 + 156) = self->_destinationSharingEnabled;
    *(_DWORD *)(v5 + 160) |= 0x20u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
    {
LABEL_10:
      PBRepeatedInt32Copy();
      v14 = -[NSString copyWithZone:](self->_carName, "copyWithZone:", a3);
      v15 = *(void **)(v5 + 96);
      *(_QWORD *)(v5 + 96) = v14;

      v16 = -[GEOScreenDimension copyWithZone:](self->_screenDimension, "copyWithZone:", a3);
      v17 = *(void **)(v5 + 120);
      *(_QWORD *)(v5 + 120) = v16;

      v18 = self->_flags;
      if ((*(_BYTE *)&v18 & 4) != 0)
      {
        *(_DWORD *)(v5 + 144) = self->_colorRange;
        *(_DWORD *)(v5 + 160) |= 4u;
        v18 = self->_flags;
      }
      if ((*(_BYTE *)&v18 & 2) != 0)
      {
        *(_DWORD *)(v5 + 140) = self->_brightness;
        *(_DWORD *)(v5 + 160) |= 2u;
      }
      PBRepeatedInt32Copy();
      v19 = self->_flags;
      if ((*(_BYTE *)&v19 & 0x80) != 0)
      {
        *(_BYTE *)(v5 + 158) = self->_isInstrumentClusterEnabled;
        *(_DWORD *)(v5 + 160) |= 0x80u;
        v19 = self->_flags;
        if ((*(_BYTE *)&v19 & 0x40) == 0)
        {
LABEL_16:
          if ((*(_WORD *)&v19 & 0x100) == 0)
          {
LABEL_18:
            v20 = self->_unknownFields;
            v8 = *(id *)(v5 + 16);
            *(_QWORD *)(v5 + 16) = v20;
            goto LABEL_19;
          }
LABEL_17:
          *(_BYTE *)(v5 + 159) = self->_isMapviewEnabled;
          *(_DWORD *)(v5 + 160) |= 0x100u;
          goto LABEL_18;
        }
      }
      else if ((*(_BYTE *)&v19 & 0x40) == 0)
      {
        goto LABEL_16;
      }
      *(_BYTE *)(v5 + 157) = self->_isInstructionCardEnabled;
      *(_DWORD *)(v5 + 160) |= 0x40u;
      if ((*(_DWORD *)&self->_flags & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_9:
    *(_DWORD *)(v5 + 152) = self->_navAidedDrivingStatus;
    *(_DWORD *)(v5 + 160) |= 0x10u;
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOCarInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_19:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *manufacturer;
  NSString *model;
  $FE2B1A96AD49C8B211CE021377EF8B62 flags;
  int v8;
  BOOL v9;
  NSString *carName;
  GEOScreenDimension *screenDimension;
  $FE2B1A96AD49C8B211CE021377EF8B62 v13;
  int v14;
  $FE2B1A96AD49C8B211CE021377EF8B62 v15;
  int v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_71;
  -[GEOCarInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  manufacturer = self->_manufacturer;
  if ((unint64_t)manufacturer | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](manufacturer, "isEqual:"))
      goto LABEL_71;
  }
  model = self->_model;
  if ((unint64_t)model | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](model, "isEqual:"))
      goto LABEL_71;
  }
  flags = self->_flags;
  v8 = *((_DWORD *)v4 + 40);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v8 & 1) == 0)
      goto LABEL_71;
    v9 = *(_QWORD *)&self->_screenResolution._height == *((_QWORD *)v4 + 9)
      && *(_QWORD *)&self->_screenResolution._width == *((_QWORD *)v4 + 10);
    if (!v9 || *(_QWORD *)&self->_screenResolution._has != *((_QWORD *)v4 + 11))
      goto LABEL_71;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_deviceConnection != *((_DWORD *)v4 + 37))
      goto LABEL_71;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0)
      goto LABEL_71;
    if (self->_destinationSharingEnabled)
    {
      if (!*((_BYTE *)v4 + 156))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 156))
    {
      goto LABEL_71;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_navAidedDrivingStatus != *((_DWORD *)v4 + 38))
      goto LABEL_71;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_71;
  carName = self->_carName;
  if ((unint64_t)carName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](carName, "isEqual:"))
      goto LABEL_71;
  }
  screenDimension = self->_screenDimension;
  if ((unint64_t)screenDimension | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOScreenDimension isEqual:](screenDimension, "isEqual:"))
      goto LABEL_71;
  }
  v13 = self->_flags;
  v14 = *((_DWORD *)v4 + 40);
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_colorRange != *((_DWORD *)v4 + 36))
      goto LABEL_71;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_brightness != *((_DWORD *)v4 + 35))
      goto LABEL_71;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_71;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_71:
    v17 = 0;
    goto LABEL_72;
  }
  v15 = self->_flags;
  v16 = *((_DWORD *)v4 + 40);
  if ((*(_BYTE *)&v15 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0)
      goto LABEL_71;
    if (self->_isInstrumentClusterEnabled)
    {
      if (!*((_BYTE *)v4 + 158))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 158))
    {
      goto LABEL_71;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&v15 & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0)
      goto LABEL_71;
    if (self->_isInstructionCardEnabled)
    {
      if (!*((_BYTE *)v4 + 157))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 157))
    {
      goto LABEL_71;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&v15 & 0x100) != 0)
  {
    if ((v16 & 0x100) != 0)
    {
      if (self->_isMapviewEnabled)
      {
        if (!*((_BYTE *)v4 + 159))
          goto LABEL_71;
      }
      else if (*((_BYTE *)v4 + 159))
      {
        goto LABEL_71;
      }
      v17 = 1;
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  v17 = (*((_DWORD *)v4 + 40) & 0x100) == 0;
LABEL_72:

  return v17;
}

- (unint64_t)hash
{
  $FE2B1A96AD49C8B211CE021377EF8B62 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  $FE2B1A96AD49C8B211CE021377EF8B62 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $FE2B1A96AD49C8B211CE021377EF8B62 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;

  -[GEOCarInfo readAll:](self, "readAll:", 1);
  v21 = -[NSString hash](self->_manufacturer, "hash");
  v20 = -[NSString hash](self->_model, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v19 = PBHashBytes();
    flags = self->_flags;
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&flags & 8) == 0)
  {
    v18 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_6;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v18 = 2654435761 * self->_deviceConnection;
  if ((*(_BYTE *)&flags & 0x20) == 0)
    goto LABEL_9;
LABEL_6:
  v4 = 2654435761 * self->_destinationSharingEnabled;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_7:
    v5 = 2654435761 * self->_navAidedDrivingStatus;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
LABEL_11:
  v6 = PBRepeatedInt32Hash();
  v7 = -[NSString hash](self->_carName, "hash");
  v8 = -[GEOScreenDimension hash](self->_screenDimension, "hash");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 4) != 0)
  {
    v10 = 2654435761 * self->_colorRange;
    if ((*(_BYTE *)&v9 & 2) != 0)
      goto LABEL_13;
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&v9 & 2) != 0)
    {
LABEL_13:
      v11 = 2654435761 * self->_brightness;
      goto LABEL_16;
    }
  }
  v11 = 0;
LABEL_16:
  v12 = PBRepeatedInt32Hash();
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 0x80) == 0)
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 0x40) != 0)
      goto LABEL_18;
LABEL_21:
    v15 = 0;
    if ((*(_WORD *)&v13 & 0x100) != 0)
      goto LABEL_19;
LABEL_22:
    v16 = 0;
    return v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  v14 = 2654435761 * self->_isInstrumentClusterEnabled;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
    goto LABEL_21;
LABEL_18:
  v15 = 2654435761 * self->_isInstructionCardEnabled;
  if ((*(_WORD *)&v13 & 0x100) == 0)
    goto LABEL_22;
LABEL_19:
  v16 = 2654435761 * self->_isMapviewEnabled;
  return v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL *v9;
  GEOScreenDimension *screenDimension;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  int v17;
  BOOL *v18;

  v18 = (BOOL *)a3;
  objc_msgSend(v18, "readAll:", 0);
  v4 = v18;
  if (*((_QWORD *)v18 + 13))
  {
    -[GEOCarInfo setManufacturer:](self, "setManufacturer:");
    v4 = v18;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[GEOCarInfo setModel:](self, "setModel:");
    v4 = v18;
  }
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    v12 = *((_QWORD *)v4 + 11);
    *(_OWORD *)&self->_screenResolution._height = *(_OWORD *)(v4 + 72);
    *(_QWORD *)&self->_screenResolution._has = v12;
    *(_DWORD *)&self->_flags |= 1u;
    v5 = *((_DWORD *)v4 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_deviceConnection = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_flags |= 8u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_20:
  self->_destinationSharingEnabled = v4[156];
  *(_DWORD *)&self->_flags |= 0x20u;
  if ((*((_DWORD *)v4 + 40) & 0x10) != 0)
  {
LABEL_9:
    self->_navAidedDrivingStatus = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_10:
  v6 = objc_msgSend(v4, "engineTypesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[GEOCarInfo addEngineType:](self, "addEngineType:", objc_msgSend(v18, "engineTypeAtIndex:", i));
  }
  v9 = v18;
  if (*((_QWORD *)v18 + 12))
  {
    -[GEOCarInfo setCarName:](self, "setCarName:");
    v9 = v18;
  }
  screenDimension = self->_screenDimension;
  v11 = *((_QWORD *)v9 + 15);
  if (screenDimension)
  {
    if (!v11)
      goto LABEL_25;
    -[GEOScreenDimension mergeFrom:](screenDimension, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_25;
    -[GEOCarInfo setScreenDimension:](self, "setScreenDimension:");
  }
  v9 = v18;
LABEL_25:
  v13 = *((_DWORD *)v9 + 40);
  if ((v13 & 4) != 0)
  {
    self->_colorRange = *((_DWORD *)v9 + 36);
    *(_DWORD *)&self->_flags |= 4u;
    v13 = *((_DWORD *)v9 + 40);
  }
  if ((v13 & 2) != 0)
  {
    self->_brightness = *((_DWORD *)v9 + 35);
    *(_DWORD *)&self->_flags |= 2u;
  }
  v14 = objc_msgSend(v9, "inputMethodsCount");
  if (v14)
  {
    v15 = v14;
    for (j = 0; j != v15; ++j)
      -[GEOCarInfo addInputMethod:](self, "addInputMethod:", objc_msgSend(v18, "inputMethodAtIndex:", j));
  }
  v17 = *((_DWORD *)v18 + 40);
  if ((v17 & 0x80) == 0)
  {
    if ((v17 & 0x40) == 0)
      goto LABEL_34;
LABEL_38:
    self->_isInstructionCardEnabled = v18[157];
    *(_DWORD *)&self->_flags |= 0x40u;
    if ((*((_DWORD *)v18 + 40) & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  self->_isInstrumentClusterEnabled = v18[158];
  *(_DWORD *)&self->_flags |= 0x80u;
  v17 = *((_DWORD *)v18 + 40);
  if ((v17 & 0x40) != 0)
    goto LABEL_38;
LABEL_34:
  if ((v17 & 0x100) != 0)
  {
LABEL_35:
    self->_isMapviewEnabled = v18[159];
    *(_DWORD *)&self->_flags |= 0x100u;
  }
LABEL_36:

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
      GEOCarInfoReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_216);
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
  *(_DWORD *)&self->_flags |= 0x10200u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOCarInfo readAll:](self, "readAll:", 0);
    -[GEOScreenDimension clearUnknownFields:](self->_screenDimension, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenDimension, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_carName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCarInfo)initWithTraits:(id)a3
{
  id v4;
  GEOCarInfo *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOCarInfo *v11;
  _QWORD v13[2];
  char v14;
  _BYTE v15[7];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOCarInfo;
  v5 = -[GEOCarInfo init](&v16, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hasCarHeadunitConnectionType"))
    {
      v6 = objc_msgSend(v4, "carHeadunitConnectionType");
      if (v6 == 1)
        v7 = 1;
      else
        v7 = 2 * (v6 == 2);
      -[GEOCarInfo setDeviceConnection:](v5, "setDeviceConnection:", v7);
    }
    if (objc_msgSend(v4, "hasCarHeadunitPixelHeight")
      && objc_msgSend(v4, "hasCarHeadunitPixelWidth"))
    {
      objc_msgSend(v4, "carHeadunitPixelHeight");
      v9 = v8;
      objc_msgSend(v4, "carHeadunitPixelWidth");
      v13[0] = v9;
      v13[1] = v10;
      v14 = 3;
      memset(v15, 0, sizeof(v15));
      -[GEOCarInfo setScreenResolution:](v5, "setScreenResolution:", v13);
    }
    v11 = v5;
  }

  return v5;
}

+ (GEOCarInfo)carInfoWithTraits:(id)a3
{
  id v3;
  GEOCarInfo *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasCarHeadunitInteractionModel") & 1) != 0
    || (objc_msgSend(v3, "hasCarHeadunitPixelHeight") & 1) != 0
    || (objc_msgSend(v3, "hasCarHeadunitPixelWidth") & 1) != 0
    || objc_msgSend(v3, "hasCarHeadunitConnectionType"))
  {
    v4 = -[GEOCarInfo initWithTraits:]([GEOCarInfo alloc], "initWithTraits:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
