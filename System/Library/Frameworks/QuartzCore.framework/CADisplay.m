@implementation CADisplay

+ (id)mainDisplay
{
  ensure_displays();
  return (id)_mainDisplay;
}

- (double)refreshRate
{
  CA::Display::Display *impl;
  uint64_t v4;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = 528;
  if ((*((_BYTE *)impl + 697) & 8) == 0)
    v4 = 496;
  return 1.0 / round(1.0 / *(double *)((char *)impl + v4));
}

- (double)heartbeatRate
{
  CA::Display::Display *impl;
  uint64_t v4;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = 528;
  if ((*((_BYTE *)impl + 697) & 8) == 0)
    v4 = 512;
  return 1.0 / round(1.0 / *(double *)((char *)impl + v4));
}

- (int64_t)minimumFrameDuration
{
  unsigned int *impl;
  unsigned int v4;
  unsigned int v5;

  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  if ((*((_BYTE *)impl + 697) & 1) != 0)
    v4 = 2;
  else
    v4 = 1;
  if (v4 <= impl[130])
    v4 = impl[130];
  v5 = impl[138];
  if (v4 <= v5)
    return v5;
  else
    return v4;
}

- (float)highestLocalPreferredFrameRateRequest
{
  os_unfair_lock_s *impl;
  float v3;
  uint64_t v4;
  unsigned int os_unfair_lock_opaque;
  double v6;

  impl = (os_unfair_lock_s *)self->_impl;
  v3 = 0.0;
  if ((impl[174]._os_unfair_lock_opaque & 0x200) != 0)
  {
    os_unfair_lock_lock(impl + 139);
    if (*(_QWORD *)&impl[144]._os_unfair_lock_opaque != *(_QWORD *)&impl[146]._os_unfair_lock_opaque)
    {
      v4 = 128;
      if ((impl[174]._os_unfair_lock_opaque & 0x800) != 0)
        v4 = 132;
      os_unfair_lock_opaque = impl[142]._os_unfair_lock_opaque;
      if (os_unfair_lock_opaque)
      {
        v6 = *(double *)&impl[v4]._os_unfair_lock_opaque;
        if (v6 != 0.0)
          v3 = 1.0 / (v6 * (double)os_unfair_lock_opaque);
      }
    }
    os_unfair_lock_unlock(impl + 139);
  }
  return v3;
}

- (NSString)uniqueId
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return (NSString *)(id)CA::Display::Display::retain_uuid((os_unfair_lock_s *)impl);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (int64_t)tag
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((unsigned int *)impl + 105);
}

- (unint64_t)pointScale
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((unsigned int *)impl + 180);
}

+ (id)displays
{
  id v2;

  ensure_displays();
  pthread_mutex_lock(&_displays_mutex);
  v2 = (id)_displays;
  pthread_mutex_unlock(&_displays_mutex);
  return v2;
}

- (CGRect)bounds
{
  char *impl;
  int32x4_t v4;
  int32x4_t v5;
  int v6;
  int64x2_t v7;
  int8x16_t v8;
  double v9;
  double v10;
  double v11;
  int32x4_t v12;
  CGRect result;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v12 = *(int32x4_t *)(impl + 264);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  v5 = v12;
  if (v12.i32[2] <= v12.i32[3])
    v6 = v12.i32[3];
  else
    v6 = v12.i32[2];
  v5.i32[0] = 1073741822;
  v4.i32[0] = v6;
  v7.i64[0] = v12.i32[0];
  v7.i64[1] = v12.i32[1];
  v8 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v4, v5), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v7));
  if (v6 <= 1073741822)
    v9 = (double)v12.i32[2];
  else
    v9 = 1.79769313e308;
  if (v6 <= 1073741822)
    v10 = (double)v12.i32[3];
  else
    v10 = 1.79769313e308;
  v11 = *(double *)&v8.i64[1];
  result.origin.x = *(double *)v8.i64;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v11;
  return result;
}

- (BOOL)hasNativeFrameRateRequest
{
  os_unfair_lock_s *impl;
  BOOL v3;
  os_unfair_lock_s *v4;

  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[174]._os_unfair_lock_opaque & 0x200) == 0)
    return 0;
  v4 = impl + 139;
  os_unfair_lock_lock(impl + 139);
  v3 = *(_QWORD *)&impl[144]._os_unfair_lock_opaque != *(_QWORD *)&impl[146]._os_unfair_lock_opaque
    && impl[140]._os_unfair_lock_opaque == 2;
  os_unfair_lock_unlock(v4);
  return v3;
}

- (void)update
{
  CA::Display::Display::update((CA::Display::Display *)self->_impl);
}

- (CADisplayMode)preferredMode
{
  char *impl;
  os_unfair_lock_s *v4;
  unint64_t v5;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v5 = *((_QWORD *)impl + 32);
  os_unfair_lock_unlock(v4);
  return (CADisplayMode *)create_mode((uint64_t)self, v5, 0);
}

- (NSString)name
{
  return (NSString *)*((_QWORD *)self->_impl + 11);
}

- (id)_initWithDisplay:(void *)a3
{
  CADisplay *v4;
  CADisplay *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CADisplay;
  v4 = -[CADisplay init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
    *((_QWORD *)a3 + 10) = v4;
    if ((*((_WORD *)a3 + 380) & 0x400) != 0)
      CA::Display::Display::update((CA::Display::Display *)a3);
  }
  else if (a3)
  {
    (*(void (**)(void *))(*(_QWORD *)a3 + 8))(a3);
  }
  return v5;
}

- (NSArray)availableModes
{
  os_unfair_lock_s *impl;
  NSArray *v4;
  unint64_t *v5;
  unint64_t *v6;
  void *__p[2];
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (os_unfair_lock_s *)self->_impl;
  }
  v10 = 0u;
  memset(v11, 0, sizeof(v11));
  *(_OWORD *)__p = 0u;
  v9 = 0u;
  CA::Display::Display::available_modes((CA::Display::Display *)__p, impl);
  if (__p[1] == __p[0])
  {
    v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (unint64_t *)__p[0];
    v6 = (unint64_t *)__p[1];
    while (v5 != v6)
      -[NSArray addObject:](v4, "addObject:", create_mode((uint64_t)self, *v5++, (uint64_t)__p));
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v11);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((_QWORD *)v10);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v4;
}

- (CADisplayMode)currentMode
{
  char *impl;
  os_unfair_lock_s *v4;
  unint64_t v5;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v5 = *((_QWORD *)impl + 31);
  os_unfair_lock_unlock(v4);
  return (CADisplayMode *)create_mode((uint64_t)self, v5, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CADisplay:%@ %@>"), -[CADisplay name](self, "name"), -[CADisplay deviceName](self, "deviceName"));
}

- (NSString)deviceName
{
  return (NSString *)*((_QWORD *)self->_impl + 12);
}

- (int64_t)displayType
{
  return *((_QWORD *)self->_impl + 56);
}

- (BOOL)isReference
{
  os_unfair_lock_s *impl;
  os_unfair_lock_s *v4;
  int os_unfair_lock_opaque_low;

  if (CADeviceSupportsReferenceMode::once[0] != -1)
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_159);
  if (!CADeviceSupportsReferenceMode::supports_ref)
    return 0;
  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)impl);
  v4 = impl + 18;
  os_unfair_lock_lock(impl + 18);
  os_unfair_lock_opaque_low = LOBYTE(impl[92]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v4);
  return os_unfair_lock_opaque_low != 0;
}

- (BOOL)isReferenceLimited
{
  os_unfair_lock_s *impl;
  os_unfair_lock_s *v4;
  int v5;

  if (CADeviceSupportsReferenceMode::once[0] != -1)
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_159);
  if (!CADeviceSupportsReferenceMode::supports_ref)
    return 0;
  impl = (os_unfair_lock_s *)self->_impl;
  if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)impl);
  v4 = impl + 18;
  os_unfair_lock_lock(impl + 18);
  v5 = BYTE1(impl[92]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v4);
  return v5 != 0;
}

- (BOOL)supportsExtendedColors
{
  unsigned __int16 *impl;
  unsigned int v4;

  impl = (unsigned __int16 *)self->_impl;
  v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 4) & 1;
}

- (BOOL)isCloned
{
  unsigned __int16 *impl;
  unsigned int v4;

  impl = (unsigned __int16 *)self->_impl;
  v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 1) & 1;
}

- (double)latency
{
  double *impl;

  impl = (double *)self->_impl;
  if (((_WORD)impl[95] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (double *)self->_impl;
  }
  return impl[51];
}

- (BOOL)isCloningSupported
{
  unsigned __int16 *impl;
  unsigned int v4;

  impl = (unsigned __int16 *)self->_impl;
  v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 3) & 1;
}

- (double)hardwareRefreshRate
{
  CA::Display::Display *impl;
  uint64_t v4;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = 528;
  if ((*((_BYTE *)impl + 697) & 8) == 0)
    v4 = 504;
  return 1.0 / round(1.0 / *(double *)((char *)impl + v4));
}

- (id)availablePresets
{
  unsigned int *impl;
  double v5;
  double v6;
  double v7;
  double v8;
  CAUserAdjustment *v9;
  CADisplayPreset *v10;
  double v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (CADeviceSupportsReferenceMode::once[0] != -1)
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_159);
  if (!CADeviceSupportsReferenceMode::supports_ref)
    return 0;
  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)impl);
  if (*((_QWORD *)impl + 56))
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v5 = *((double *)impl + 47);
  v6 = *((double *)impl + 48);
  v7 = *((double *)impl + 49);
  v8 = *((double *)impl + 50);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  v9 = -[CAUserAdjustment initWithXDelta:yDelta:luminanceScale:timestamp:]([CAUserAdjustment alloc], "initWithXDelta:yDelta:luminanceScale:timestamp:", v5, v6, v7, v8);
  v12[0] = -[CADisplayPreset initWithIsReference:userAdjustment:]([CADisplayPreset alloc], "initWithIsReference:userAdjustment:", 0, 0);
  v10 = [CADisplayPreset alloc];
  *(float *)&v11 = CA::Display::Display::auto_luminance_boost((CA::Display::Display *)impl[26]);
  v12[1] = -[CADisplayPreset initWithIsReference:userAdjustment:autoLuminanceBoost:](v10, "initWithIsReference:userAdjustment:autoLuminanceBoost:", 1, v9, v11);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
}

- (void)dealloc
{
  void *impl;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  v4.receiver = self;
  v4.super_class = (Class)CADisplay;
  -[CADisplay dealloc](&v4, sel_dealloc);
}

- (unsigned)seed
{
  unsigned int *impl;

  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  return impl[30];
}

- (int)processId
{
  int *impl;

  impl = (int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (int *)self->_impl;
  }
  return impl[106];
}

- (unsigned)connectionSeed
{
  unsigned int *impl;

  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  return impl[31];
}

- (BOOL)isOverscanned
{
  CA::Display::Display *impl;
  __int16 v4;

  impl = (CA::Display::Display *)self->_impl;
  v4 = *((_WORD *)impl + 380);
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    v4 = *((_WORD *)self->_impl + 380);
  }
  return v4 & 1;
}

- (BOOL)isExternal
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return (unint64_t)(*((_QWORD *)impl + 56) - 1) < 2;
}

- (NSString)overscanAdjustment
{
  CA::Display::Display *impl;
  unsigned int v4;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = *((_DWORD *)impl + 104) - 1;
  if (v4 > 2)
    return 0;
  else
    return (NSString *)*((_QWORD *)&off_1E159C4F0 + v4);
}

- (NSString)nativeOrientation
{
  CA::Display::Display *impl;
  unsigned int v4;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = *((_DWORD *)impl + 107) - 1;
  if (v4 > 2)
    return (NSString *)CFSTR("rot0");
  else
    return (NSString *)*((_QWORD *)&off_1E159C508 + v4);
}

- (unsigned)displayId
{
  return *((_DWORD *)self->_impl + 26);
}

- (void)timingsControl
{
  return (char *)self->_impl + 464;
}

- (CGSize)overscanAmounts
{
  void *impl;
  float v4;
  float v5;
  double v6;
  double v7;
  CGSize result;

  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v4 = *((float *)impl + 74);
  v5 = *((float *)impl + 75);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)supportsVariableFrameDuration
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update(impl);
  if ((CADisplay *)_mainDisplay != self)
    return 0;
  if (CAPrefers60HzAPT(void)::once[0] != -1)
    dispatch_once(CAPrefers60HzAPT(void)::once, &__block_literal_global_2);
  return CAPrefers60HzAPT(void)::enabled != 0;
}

- (CGRect)frame
{
  char *impl;
  int32x4_t v4;
  int32x4_t v5;
  int v6;
  int64x2_t v7;
  int8x16_t v8;
  double v9;
  double v10;
  double v11;
  int32x4_t v12;
  CGRect result;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v12 = *(int32x4_t *)(impl + 280);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  v5 = v12;
  if (v12.i32[2] <= v12.i32[3])
    v6 = v12.i32[3];
  else
    v6 = v12.i32[2];
  v5.i32[0] = 1073741822;
  v4.i32[0] = v6;
  v7.i64[0] = v12.i32[0];
  v7.i64[1] = v12.i32[1];
  v8 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v4, v5), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v7));
  if (v6 <= 1073741822)
    v9 = (double)v12.i32[2];
  else
    v9 = 1.79769313e308;
  if (v6 <= 1073741822)
    v10 = (double)v12.i32[3];
  else
    v10 = 1.79769313e308;
  v11 = *(double *)&v8.i64[1];
  result.origin.x = *(double *)v8.i64;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v11;
  return result;
}

- (id)allowedHDRModes
{
  void *impl;
  CADisplayPreferences *v4;
  unint64_t v6;
  BOOL v7;
  unsigned int v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v4 = -[CADisplay preferences](self, "preferences");
  if (v4 && -[CADisplayPreferences matchContent](v4, "matchContent"))
    return -[CADisplay supportedHDRModes](self, "supportedHDRModes");
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v6 = *((_QWORD *)impl + 31);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if (v6)
    v7 = (v6 & 0x10000000) == 0;
  else
    v7 = 0;
  if (!v7)
    return 0;
  v8 = CA::WindowServer::Display::Mode::hdr_type(v6) - 1;
  if (v8 > 4)
    v9 = 0;
  else
    v9 = (uint64_t)*(&off_1E159C5A0 + v8);
  v10[0] = v9;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
}

- (CADisplayPreferences)preferences
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update(impl);
  return -[CADisplayPreferences initWithMatchContent:preferredHdrType:]([CADisplayPreferences alloc], "initWithMatchContent:preferredHdrType:", (*((unsigned __int16 *)self->_impl + 380) >> 6) & 1, *((unsigned int *)self->_impl + 110));
}

+ (id)TVOutDisplay
{
  ensure_displays();
  return (id)_tvoutDisplay;
}

- (id)immutableCopy
{
  char *impl;
  malloc_zone_t *malloc_zone;
  _DWORD *v4;
  _DWORD *v5;
  CFTypeRef v6;
  CFTypeRef v7;
  CFTypeRef v8;
  uint64_t v9;
  __int128 v10;
  char v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) != 0)
    return self;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 8));
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v4 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x300uLL, 0x743898A5uLL);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)v4 = off_1E15999B0;
    v4[18] = 0;
    *((_QWORD *)v4 + 11) = CFRetain(*((CFTypeRef *)impl + 11));
    *((_QWORD *)v5 + 12) = CFRetain(*((CFTypeRef *)impl + 12));
    v5[26] = *((_DWORD *)impl + 26);
    *((_QWORD *)v5 + 14) = 0;
    *((_QWORD *)v5 + 15) = *((_QWORD *)impl + 15);
    v6 = (CFTypeRef)*((_QWORD *)impl + 16);
    if (v6)
      v6 = CFRetain(v6);
    *((_QWORD *)v5 + 16) = v6;
    v7 = (CFTypeRef)*((_QWORD *)impl + 17);
    if (v7)
      v7 = CFRetain(v7);
    *((_QWORD *)v5 + 17) = v7;
    v8 = (CFTypeRef)*((_QWORD *)impl + 18);
    if (v8)
      v8 = CFRetain(v8);
    *((_QWORD *)v5 + 18) = v8;
    CA::WindowServer::Display::ModeSet::ModeSet((CA::WindowServer::Display::ModeSet *)(v5 + 38), (const CA::WindowServer::Display::ModeSet *)(impl + 152));
    *((_QWORD *)v5 + 31) = *((_QWORD *)impl + 31);
    *((_QWORD *)v5 + 32) = *((_QWORD *)impl + 32);
    *(_OWORD *)(v5 + 66) = *(_OWORD *)(impl + 264);
    *(_OWORD *)(v5 + 70) = *(_OWORD *)(impl + 280);
    *((_QWORD *)v5 + 37) = *((_QWORD *)impl + 37);
    *((_QWORD *)v5 + 38) = *((_QWORD *)impl + 38);
    v9 = *((_QWORD *)impl + 39);
    *((_QWORD *)v5 + 40) = 0;
    *((_QWORD *)v5 + 41) = 0;
    *((_QWORD *)v5 + 39) = v9;
    *(_QWORD *)((char *)v5 + 333) = 0;
    *((_QWORD *)v5 + 43) = 0;
    *((_QWORD *)v5 + 44) = 0;
    v5[90] = 0;
    *((_OWORD *)v5 + 20) = *((_OWORD *)impl + 20);
    v5[84] = *((_DWORD *)impl + 84);
    *((_BYTE *)v5 + 340) = impl[340];
    *(_OWORD *)(v5 + 86) = *(_OWORD *)(impl + 344);
    v5[90] = *((_DWORD *)impl + 90);
    *((_WORD *)v5 + 184) = 0;
    *((_QWORD *)v5 + 47) = 0;
    *((_QWORD *)v5 + 48) = 0;
    *((_QWORD *)v5 + 49) = 0x3FF0000000000000;
    *((_QWORD *)v5 + 50) = 0;
    *((_QWORD *)v5 + 51) = *((_QWORD *)impl + 51);
    *((_OWORD *)v5 + 26) = *((_OWORD *)impl + 26);
    *((_OWORD *)v5 + 27) = *((_OWORD *)impl + 27);
    *((_QWORD *)v5 + 56) = *((_QWORD *)impl + 56);
    v5[114] = *((_DWORD *)impl + 114);
    *((_QWORD *)v5 + 58) = &off_1E1599990;
    v5[118] = *((_DWORD *)impl + 118);
    v5[123] = 0;
    *(_QWORD *)(v5 + 121) = 0;
    *(_QWORD *)(v5 + 119) = 0;
    *((_OWORD *)v5 + 31) = *((_OWORD *)impl + 31);
    *((_QWORD *)v5 + 64) = *((_QWORD *)impl + 64);
    *((_QWORD *)v5 + 65) = *((_QWORD *)impl + 65);
    *((_QWORD *)v5 + 66) = *((_QWORD *)impl + 66);
    *(_OWORD *)(v5 + 134) = *(_OWORD *)(impl + 536);
    v5[138] = *((_DWORD *)impl + 138);
    *(_QWORD *)(v5 + 141) = 0;
    *(_QWORD *)(v5 + 139) = 0;
    *((_OWORD *)v5 + 36) = 0u;
    *((_OWORD *)v5 + 37) = 0u;
    *(_OWORD *)(v5 + 151) = 0u;
    *((_OWORD *)v5 + 39) = 0u;
    *((_OWORD *)v5 + 40) = 0u;
    *((_OWORD *)v5 + 41) = 0u;
    v10 = *((_OWORD *)impl + 42);
    *((_QWORD *)v5 + 86) = *((_QWORD *)impl + 86);
    *((_OWORD *)v5 + 42) = v10;
    *((_BYTE *)v5 + 696) = 10;
    v11 = *((_BYTE *)v5 + 697) & 0xFA | impl[697] & 1;
    *((_BYTE *)v5 + 697) = v11;
    LOBYTE(v9) = v11 & 0xF3 | impl[697] & 8;
    *((_BYTE *)v5 + 697) = v9;
    *((_BYTE *)v5 + 697) = v9 & 0xEF | impl[697] & 0x10;
    *((_QWORD *)v5 + 88) = *((_QWORD *)impl + 88);
    *((_QWORD *)v5 + 89) = *((_QWORD *)impl + 89);
    v5[180] = *((_DWORD *)impl + 180);
    v5[181] = 0;
    *((_QWORD *)v5 + 91) = *((_QWORD *)impl + 91);
    v5[184] = 0;
    *((_QWORD *)v5 + 93) = 0;
    *((_QWORD *)v5 + 94) = 0;
    v12 = v5[190] & 0xFFFE | *((_WORD *)impl + 380) & 1;
    *((_WORD *)v5 + 380) = v5[190] & 0xFFFE | *((_WORD *)impl + 380) & 1;
    v13 = v12 & 0xFFFFFFFD | (2 * ((*((unsigned __int16 *)impl + 380) >> 1) & 1));
    *((_WORD *)v5 + 380) = v13;
    v14 = v13 & 0xFFFFFFFB | (4 * ((*((unsigned __int16 *)impl + 380) >> 2) & 1));
    *((_WORD *)v5 + 380) = v14;
    v15 = v14 & 0xFFFFFFF7 | (8 * ((*((unsigned __int16 *)impl + 380) >> 3) & 1));
    *((_WORD *)v5 + 380) = v15;
    v16 = v15 & 0xFFFFFFEF | (16 * ((*((unsigned __int16 *)impl + 380) >> 4) & 1));
    *((_WORD *)v5 + 380) = v16;
    v17 = v16 & 0xFFFFFFDF | (32 * ((*((unsigned __int16 *)impl + 380) >> 5) & 1));
    *((_WORD *)v5 + 380) = v17;
    *((_WORD *)v5 + 380) = *((_WORD *)impl + 380) & 0x40 | 0xA00 | v17 & 0xF1BF;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(impl + 8));
  return -[CADisplay _initWithDisplay:]([CADisplay alloc], "_initWithDisplay:", v5);
}

- (void)_postNotification:(int64_t)a3
{
  if (*((_QWORD *)self->_impl + 14))
  {
    if (a3 == 1)
    {
      CA::Display::DisplayLink::display_power_changed((CA::Display::DisplayLink *)self);
    }
    else if (!a3)
    {
      -[CADisplay update](self, "update");
    }
  }
}

- (void)_invalidate
{
  _WORD *impl;

  impl = self->_impl;
  if ((impl[380] & 0x800) == 0)
    impl[380] |= 0x400u;
}

- (void)_finalize
{
  char *impl;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) == 0)
  {
    *((_WORD *)impl + 380) |= 0x400u;
    pthread_mutex_lock((pthread_mutex_t *)(impl + 8));
    v3 = 528;
    v4 = 496;
    if ((impl[697] & 8) != 0)
      v4 = 528;
    v5 = *(double *)&impl[v4];
    if ((impl[697] & 8) == 0)
      v3 = 512;
    v6 = *(double *)&impl[v3];
    if ((*((_WORD *)impl + 380) & 0x200) != 0)
    {
      if (v5 != 0.0)
        objc_msgSend(*((id *)impl + 10), "willChangeValueForKey:", CFSTR("refreshRate"));
      if (v6 != 0.0)
        objc_msgSend(*((id *)impl + 10), "willChangeValueForKey:", CFSTR("heartbeatRate"));
      objc_msgSend(*((id *)impl + 10), "willChangeValueForKey:", CFSTR("minimumFrameDuration"));
    }
    *((_OWORD *)impl + 31) = 0u;
    *((_OWORD *)impl + 32) = 0u;
    CA::Display::DisplayTimingsControl::set_timings_shmem((os_unfair_lock_s *)impl + 116, 0);
    if ((*((_WORD *)impl + 380) & 0x200) != 0)
    {
      if (v5 != 0.0)
        objc_msgSend(*((id *)impl + 10), "didChangeValueForKey:", CFSTR("refreshRate"));
      if (v6 != 0.0)
        objc_msgSend(*((id *)impl + 10), "didChangeValueForKey:", CFSTR("heartbeatRate"));
      objc_msgSend(*((id *)impl + 10), "didChangeValueForKey:", CFSTR("minimumFrameDuration"));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(impl + 8));
  }
}

- (void)_notifyDisallowedLayersChange:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *impl;
  uint64_t v5;

  v3 = a3;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 181);
  v5 = *(_QWORD *)&impl[182]._os_unfair_lock_opaque;
  if (v5)
    (*(void (**)(uint64_t, _BOOL8))(v5 + 16))(v5, v3);
  os_unfair_lock_unlock(impl + 181);
}

- (id)stateControl
{
  return -[CADisplayStateControl _initWithDisplayId:]([CADisplayStateControl alloc], "_initWithDisplayId:", -[CADisplay displayId](self, "displayId"));
}

- (BOOL)setDisplayProperties:(id)a3
{
  _DWORD *impl;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  char v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  int v17;
  unsigned int v18;
  mach_port_name_t ServerPort;
  mach_port_name_t v20;
  ipc_space_t *v21;
  BOOL v22;
  unsigned int v23;
  unsigned int v24;
  mach_msg_return_t v25;
  mach_msg_return_t v26;
  mach_port_name_t name;
  mach_msg_header_t msg[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if ((impl[190] & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplay"), CFSTR("cannot change properties on an immutable CADisplay"));
  }
  else
  {
    if (objc_msgSend(a3, "needsUpdateForField:", 1) && objc_msgSend(a3, "currentMode"))
      v5 = objc_msgSend((id)objc_msgSend(a3, "currentMode"), "_mode");
    else
      v5 = 0;
    if (objc_msgSend(a3, "needsUpdateForField:", 2)
      && (v6 = (void *)objc_msgSend(a3, "overscanAdjustment")) != 0)
    {
      v7 = v6;
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("none")) & 1) != 0)
      {
        v8 = 1;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("scaleContent")) & 1) != 0)
      {
        v8 = 2;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("insetBounds")))
      {
        v8 = 3;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(a3, "needsUpdateForField:", 4))
      v9 = objc_msgSend(a3, "dmrrEnabled");
    else
      v9 = 0;
    if (objc_msgSend(a3, "needsUpdateForField:", 128))
      v10 = objc_msgSend(a3, "forceFixedRateLinks");
    else
      v10 = 0;
    if (objc_msgSend(a3, "needsUpdateForField:", 8))
      v11 = objc_msgSend(a3, "connectionSeed");
    else
      v11 = 0;
    v12 = 1.0;
    v13 = 1.0;
    if (objc_msgSend(a3, "needsUpdateForField:", 16))
    {
      objc_msgSend(a3, "logicalScale");
      v12 = v14;
      v13 = v15;
    }
    if (objc_msgSend(a3, "needsUpdateForField:", 32))
      v16 = objc_msgSend(a3, "pointScale");
    else
      v16 = 1;
    v17 = objc_msgSend(a3, "updateMask");
    v18 = impl[26];
    ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      v20 = ServerPort;
      v21 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      if (!v18)
      {
        v22 = 0;
LABEL_48:
        mach_port_deallocate(*v21, v20);
        return v22;
      }
      name = 0;
      if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name))
        goto LABEL_29;
      *(float *)&v23 = v12;
      *(float *)&v24 = v13;
      *(_OWORD *)&msg[0].msgh_id = 0u;
      *(_OWORD *)&msg[0].msgh_size = 0u;
      msg[1].msgh_size = name;
      msg[1].msgh_local_port = 1310720;
      *(_QWORD *)&msg[1].msgh_voucher_port = *MEMORY[0x1E0C804E8];
      *(_QWORD *)&v30 = v18;
      *((_QWORD *)&v30 + 1) = v5;
      LODWORD(v31) = v8;
      BYTE4(v31) = v9;
      *(_WORD *)((char *)&v31 + 5) = 0;
      BYTE7(v31) = 0;
      *((_QWORD *)&v31 + 1) = __PAIR64__(v23, v11);
      *(_QWORD *)&v32 = __PAIR64__(v16, v24);
      DWORD2(v32) = 1;
      BYTE12(v32) = v10;
      HIBYTE(v32) = 0;
      *(_WORD *)((char *)&v32 + 13) = 0;
      v33 = v17;
      msg[0].msgh_bits = -2147483629;
      msg[0].msgh_remote_port = v20;
      *(_QWORD *)&msg[0].msgh_id = 0x100009D2DLL;
      if (MEMORY[0x1E0C85B60])
        voucher_mach_msg_set(msg);
      v25 = mach_msg(msg, 1, 0x64u, 0, 0, 0, 0);
      if (v25)
      {
        v22 = 0;
        if (v25 == -81182719)
        {
          x_log_crash("Unentitled call to server!");
          abort();
        }
        goto LABEL_47;
      }
      v31 = 0u;
      v32 = 0u;
      v30 = 0u;
      memset(msg, 0, sizeof(msg));
      v26 = mach_msg(msg, 258, 0, 0x60u, name, 0x3E8u, 0);
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], name, 1u, -1);
      if ((impl[190] & 0x800) == 0)
      {
        *((_WORD *)impl + 380) |= 0x400u;
        CA::Display::Display::update((CA::Display::Display *)impl);
      }
      if (v26 || !msg[0].msgh_id)
LABEL_29:
        v22 = 0;
      else
        v22 = 1;
LABEL_47:
      v21 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      goto LABEL_48;
    }
  }
  return 0;
}

- (void)setDisallowedLayersCallback:(id)a3
{
  char *impl;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  int v8;
  mach_port_t ServerPort;
  mach_port_t v10;
  const void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  mach_msg_size_t v15;
  _BYTE msg[36];
  int v17;
  uint64_t v18;
  int v19;
  mach_msg_header_t __str[2];
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplay"), CFSTR("cannot change properties on an immutable CADisplay"));
  os_unfair_lock_lock((os_unfair_lock_t)impl + 181);
  v5 = *((_QWORD *)impl + 91);
  v7 = v5 == (_QWORD)a3;
  v6 = (unint64_t)a3 | v5;
  v7 = v7 || v6 == 0;
  if (!v7)
  {
    v8 = *((_DWORD *)impl + 26);
    ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      v10 = ServerPort;
      if (v8)
      {
        v11 = (const void *)*((_QWORD *)impl + 91);
        if (v11)
        {
          _Block_release(v11);
          *((_QWORD *)impl + 91) = 0;
        }
        if (a3)
        {
          *((_QWORD *)impl + 91) = _Block_copy(a3);
          if (!*((_DWORD *)impl + 184))
          {
            v21 = 0u;
            memset(__str, 0, sizeof(__str));
            snprintf((char *)__str, 0x40uLL, "CADisplay.%i.disallowedLayersNotification", *((_DWORD *)impl + 26));
            v12 = CA::MachPortUtil::ClientIPC::create((mach_port_context_t)(impl + 736), (const char *)__str);
            CA_CLIENT_MACH_PORT_ALLOCATE_FAILED(v12, *((_DWORD *)impl + 184));
            v13 = *((_QWORD *)impl + 94);
            if (v13)
              dispatch_activate(v13);
            v14 = *((_DWORD *)impl + 184);
            *(_OWORD *)&msg[20] = 0u;
            *(_DWORD *)&msg[28] = v14;
            v17 = 1245184;
            *(_OWORD *)&msg[4] = 0u;
            v18 = *MEMORY[0x1E0C804E8];
            v19 = v8;
            *(_DWORD *)msg = -2147483629;
            *(_DWORD *)&msg[8] = v10;
            *(_QWORD *)&msg[20] = 0x100009D31;
            if (MEMORY[0x1E0C85B60])
              voucher_mach_msg_set((mach_msg_header_t *)msg);
            mach_msg((mach_msg_header_t *)msg, 1, 0x34u, 0, 0, 0, 0);
          }
        }
        else
        {
          v15 = *((_DWORD *)impl + 184);
          *(_OWORD *)&__str[0].msgh_id = 0u;
          __str[1].msgh_size = v15;
          __str[1].msgh_local_port = 1245184;
          *(_OWORD *)&__str[0].msgh_size = 0u;
          *(_QWORD *)&__str[1].msgh_voucher_port = *MEMORY[0x1E0C804E8];
          LODWORD(v21) = v8;
          __str[0].msgh_bits = -2147483629;
          __str[0].msgh_remote_port = v10;
          *(_QWORD *)&__str[0].msgh_id = 0x100009D32;
          if (MEMORY[0x1E0C85B60])
            voucher_mach_msg_set(__str);
          mach_msg(__str, 1, 0x34u, 0, 0, 0, 0);
          CA::MachPortUtil::ClientIPC::destroy((CA::MachPortUtil::ClientIPC *)(impl + 736));
        }
      }
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v10);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 181);
}

- (NSString)containerId
{
  char *impl;
  os_unfair_lock_s *v4;
  const void *v5;
  void *v6;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v5 = (const void *)*((_QWORD *)impl + 17);
  if (v5)
    v6 = (void *)CFRetain(v5);
  else
    v6 = 0;
  os_unfair_lock_unlock(v4);
  return (NSString *)v6;
}

- (NSString)productName
{
  char *impl;
  os_unfair_lock_s *v4;
  const void *v5;
  void *v6;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v5 = (const void *)*((_QWORD *)impl + 18);
  if (v5)
    v6 = (void *)CFRetain(v5);
  else
    v6 = 0;
  os_unfair_lock_unlock(v4);
  return (NSString *)v6;
}

- (CGSize)physicalSize
{
  void *impl;
  float v4;
  float v5;
  double v6;
  double v7;
  CGSize result;

  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v4 = *((float *)impl + 76);
  v5 = *((float *)impl + 77);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)nativeSize
{
  char *impl;
  os_unfair_lock_s *v4;
  int v5;
  int v6;
  double v7;
  double v8;
  CGSize result;

  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
  }
  v4 = (os_unfair_lock_s *)(impl + 72);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v5 = *((_DWORD *)impl + 79);
  v6 = *((_DWORD *)impl + 78);
  os_unfair_lock_unlock(v4);
  v7 = (double)v6;
  v8 = (double)v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)transportType
{
  CA::Display::Display *impl;
  unsigned int v4;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = *((_DWORD *)impl + 114) - 1;
  if (v4 > 4)
    return (NSString *)CFSTR("other");
  else
    return (NSString *)*((_QWORD *)&off_1E159C4C8 + v4);
}

- (void)setCurrentMode:(id)a3
{
  CADisplayProperties *v5;

  if ((CADisplay *)objc_msgSend(a3, "_display") == self && objc_msgSend(a3, "_mode"))
  {
    v5 = objc_alloc_init(CADisplayProperties);
    -[CADisplayProperties setCurrentMode:](v5, "setCurrentMode:", a3);
    -[CADisplay setDisplayProperties:](self, "setDisplayProperties:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAInvalidDisplayMode"), CFSTR("mode %@ is not valid for display %@"), a3, self);
  }
}

- (NSString)colorMode
{
  NSLog(CFSTR("CoreAnimation: [CADisplay colorMode] is deprecated!"), a2);
  return (NSString *)CFSTR("auto");
}

- (void)setColorMode:(id)a3
{
  NSLog(CFSTR("CoreAnimation: [CADisplay setColorMode:] is deprecated!"), a2, a3);
}

- (BOOL)allowsVirtualModes
{
  NSLog(CFSTR("CoreAnimation: [CADisplay allowsVirtualModes] is deprecated!"), a2);
  return 0;
}

- (void)setAllowsVirtualModes:(BOOL)a3
{
  NSLog(CFSTR("CoreAnimation: [CADisplay setAllowsVirtualModes] is deprecated!"), a2, a3);
}

- (CGRect)safeBounds
{
  char *impl;
  __int16 v3;
  __int128 v5;
  int32x4_t v6;
  int32x4_t v7;
  int v8;
  int v9;
  int8x16_t v11;
  int v12;
  int64x2_t v13;
  int8x16_t v14;
  double v15;
  double v16;
  double v17;
  int64x2_t v23;
  int32x2_t v25;
  int8x16_t v26;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  int32x2_t v31;
  __int128 v32;
  int8x16_t v33;
  CGRect result;

  impl = (char *)self->_impl;
  v3 = *((_WORD *)impl + 380);
  if ((v3 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = (char *)self->_impl;
    v3 = *((_WORD *)impl + 380);
  }
  if ((v3 & 1) != 0 && *((_DWORD *)impl + 104) == 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    *(_QWORD *)&v5 = *((_QWORD *)impl + 33);
    v32 = v5;
    v31 = *(int32x2_t *)(impl + 272);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    v30 = *((_DWORD *)impl + 74);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    v29 = *((_DWORD *)impl + 75);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    v8 = v31.i32[0];
    if (v31.i32[0] <= v31.i32[1])
      v9 = v31.i32[1];
    else
      v9 = v31.i32[0];
    if (v31.i32[0] >= v31.i32[1])
      v8 = v31.i32[1];
    if (v9 > 1073741822 || v8 < 1)
    {
      v11.i64[0] = v32;
      v11.u64[1] = (unint64_t)v31;
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
      v23.i64[0] = v31.i32[0];
      v23.i64[1] = v31.i32[1];
      __asm { FMOV            V2.2D, #0.5 }
      v25 = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q2, vcvtq_f64_s64(v23), vmulq_f64(vcvtq_f64_f32(vsub_f32(_D0, (float32x2_t)__PAIR64__(v29, v30))), _Q2))));
      v7.i64[1] = *((_QWORD *)&v32 + 1);
      *(int32x2_t *)v7.i8 = vadd_s32(*(int32x2_t *)&v32, v25);
      v26.i64[0] = v7.i64[0];
      v26.u64[1] = (unint64_t)vsub_s32(v31, vadd_s32(v25, v25));
      if (v26.i32[3] < 1 || v26.i32[2] < 1)
        v28 = -1;
      else
        v28 = 0;
      v6 = vdupq_n_s32(v28);
      v11 = vbslq_s8((int8x16_t)v6, (int8x16_t)v7, v26);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
    v33 = *(int8x16_t *)(impl + 264);
    os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
    v11 = v33;
  }
  if (v11.i32[2] <= v11.i32[3])
    v12 = v11.i32[3];
  else
    v12 = v11.i32[2];
  v6.i32[0] = 1073741822;
  v7.i32[0] = v12;
  v13.i64[0] = v11.i32[0];
  v13.i64[1] = v11.i32[1];
  v14 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v7, v6), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v13));
  if (v12 <= 1073741822)
    v15 = (double)v11.i32[2];
  else
    v15 = 1.79769313e308;
  if (v12 <= 1073741822)
    v16 = (double)v11.i32[3];
  else
    v16 = 1.79769313e308;
  v17 = *(double *)&v14.i64[1];
  result.origin.x = *(double *)v14.i64;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v17;
  return result;
}

- (BOOL)isSupported
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update(impl);
  return 1;
}

- (void)overrideMinimumFrameDuration:(int64_t)a3
{
  _WORD *impl;
  int v5;

  impl = self->_impl;
  if ((impl[380] & 0x800) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplay"), CFSTR("cannot change properties on an immutable CADisplay"));
  v5 = a3 & ~(a3 >> 63);
  if (*((_DWORD *)impl + 138) != v5)
  {
    *((_DWORD *)impl + 138) = v5;
    CA::Display::DisplayLink::display_refresh_rate_changed((CA::Display::DisplayLink *)impl, (CA::Display::Display *)a2);
  }
}

- (double)overscanAmount
{
  void *impl;
  float v4;
  float v5;

  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    impl = self->_impl;
  }
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v4 = *((float *)impl + 74);
  v5 = *((float *)impl + 75);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if (v4 >= v5)
    return v5;
  else
    return v4;
}

- (void)setOverscanAdjustment:(id)a3
{
  CADisplayProperties *v5;

  v5 = objc_alloc_init(CADisplayProperties);
  -[CADisplayProperties setOverscanAdjustment:](v5, "setOverscanAdjustment:", a3);
  -[CADisplay setDisplayProperties:](self, "setDisplayProperties:", v5);

}

- (CGSize)logicalScale
{
  CA::Display::Display *impl;
  double v4;
  double v5;
  CGSize result;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = *((float *)impl + 176);
  v5 = *((float *)impl + 177);
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)minimumLogicalScale
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((float *)impl + 178);
}

- (double)maximumLogicalScale
{
  CA::Display::Display *impl;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  return *((float *)impl + 179);
}

- (BOOL)isCloning
{
  unsigned __int16 *impl;
  unsigned int v4;

  impl = (unsigned __int16 *)self->_impl;
  v4 = impl[380];
  if ((v4 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    v4 = *((unsigned __int16 *)self->_impl + 380);
  }
  return (v4 >> 2) & 1;
}

- (NSString)currentOrientation
{
  CA::Display::Display *impl;
  unsigned int v4;

  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  v4 = *((_DWORD *)impl + 108) - 1;
  if (v4 > 2)
    return (NSString *)CFSTR("rot0");
  else
    return (NSString *)*((_QWORD *)&off_1E159C508 + v4);
}

- (unsigned)odLUTVersion
{
  unsigned int *impl;

  impl = (unsigned int *)self->_impl;
  if ((impl[190] & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)impl);
    impl = (unsigned int *)self->_impl;
  }
  return impl[109];
}

- (CADisplayAttributes)externalDisplayAttributes
{
  CA::Display::Display *impl;
  CADisplayAttributes *v4;
  char *v5;
  __int128 v7;
  int v8;
  char v9;
  __int128 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
  {
    CA::Display::Display::update(impl);
    impl = (CA::Display::Display *)self->_impl;
  }
  if ((unint64_t)(*((_QWORD *)impl + 56) - 1) > 1)
    return 0;
  v4 = [CADisplayAttributes alloc];
  v5 = (char *)self->_impl;
  os_unfair_lock_lock((os_unfair_lock_t)v5 + 18);
  v7 = *((_OWORD *)v5 + 20);
  v8 = *((_DWORD *)v5 + 84);
  v9 = v5[340];
  v10 = *(_OWORD *)(v5 + 344);
  v11 = *((_DWORD *)v5 + 90);
  os_unfair_lock_unlock((os_unfair_lock_t)v5 + 18);
  return (CADisplayAttributes *)-[CADisplayAttributes _initWithAttributes:](v4, "_initWithAttributes:", &v7);
}

- (int)linkQuality
{
  return -1;
}

- (void)setLatency:(double)a3
{
  void *impl;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  mach_port_name_t ServerPort;
  int v10;
  NSObject *v11;
  mach_msg_size_t v12;
  uint8_t *v13;
  mach_port_t reply_port;
  mach_msg_return_t v15;
  int v16;
  _OWORD v17[4];
  uint8_t buf[16];
  __int128 v19;
  _OWORD v20[6];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if ((*((_WORD *)impl + 380) & 0x800) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplay"), CFSTR("cannot change properties on an immutable CADisplay"));
  if (*((double *)impl + 51) != a3)
  {
    v5 = (const __CFString *)CA::Display::Display::retain_uuid((os_unfair_lock_s *)impl);
    if (v5)
    {
      v6 = v5;
      os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
      v7 = *((_QWORD *)impl + 31);
      os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
      v8 = *((_DWORD *)impl + 26);
      ServerPort = CARenderServerGetServerPort(0);
      memset(v17, 0, sizeof(v17));
      CFStringGetCString(v6, (char *)v17, 64, 0x8000100u);
      if (!ServerPort)
      {
LABEL_35:
        CFRelease(v6);
        return;
      }
      if (!v8)
      {
LABEL_34:
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], ServerPort);
        goto LABEL_35;
      }
      v19 = 0u;
      memset(v20, 0, 92);
      *(_OWORD *)buf = 0u;
      *((_QWORD *)&v19 + 1) = *MEMORY[0x1E0C804E8];
      LODWORD(v20[0]) = v8;
      if (MEMORY[0x1E0C84128])
        v10 = mig_strncpy_zerofill((char *)v20 + 12, (const char *)v17, 64);
      else
        v10 = mig_strncpy((char *)v20 + 12, (const char *)v17, 64);
      DWORD1(v20[0]) = 0;
      DWORD2(v20[0]) = v10;
      v12 = ((v10 + 3) & 0xFFFFFFFC) + 60;
      v13 = &buf[(v10 + 3) & 0xFFFFFFFC];
      *(_QWORD *)(v13 + 44) = v7;
      *(double *)(v13 + 52) = a3;
      reply_port = mig_get_reply_port();
      *(_DWORD *)&buf[8] = ServerPort;
      *(_DWORD *)&buf[12] = reply_port;
      *(_DWORD *)buf = 5395;
      *(_QWORD *)&v19 = 0x9D3000000000;
      if (MEMORY[0x1E0C85B60])
      {
        voucher_mach_msg_set((mach_msg_header_t *)buf);
        reply_port = *(_DWORD *)&buf[12];
      }
      v15 = mach_msg((mach_msg_header_t *)buf, 3, v12, 0x2Cu, reply_port, 0, 0);
      v16 = v15;
      if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(*(mach_port_t *)&buf[12]);
LABEL_32:
        if ((*((_WORD *)impl + 380) & 0x800) == 0)
          *((_WORD *)impl + 380) |= 0x400u;
        goto LABEL_34;
      }
      if (v15)
      {
        mig_dealloc_reply_port(*(mach_port_t *)&buf[12]);
      }
      else
      {
        if (DWORD1(v19) == 71)
        {
          v16 = -308;
        }
        else if (DWORD1(v19) == 40340)
        {
          v16 = -300;
          if ((*(_DWORD *)buf & 0x80000000) == 0 && *(_DWORD *)&buf[4] == 36 && !*(_DWORD *)&buf[8])
          {
            v16 = v20[0];
            if (!LODWORD(v20[0]))
              goto LABEL_32;
          }
        }
        else
        {
          v16 = -301;
        }
        mach_msg_destroy((mach_msg_header_t *)buf);
      }
      if (v16 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      goto LABEL_32;
    }
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v11 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_ERROR, "Failed to set display latency - missing UUID", buf, 2u);
      }
    }
  }
}

- (void)setPreferences:(id)a3
{
  _WORD *impl;
  int v6;
  int v7;
  int v8;
  __int16 v9;
  int v10;
  mach_port_name_t ServerPort;
  mach_port_name_t v12;
  mach_port_t reply_port;
  mach_msg_return_t v14;
  int v15;
  mach_msg_header_t msg;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if ((impl[380] & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplay"), CFSTR("cannot change preferences on an immutable CADisplay"));
    impl = self->_impl;
  }
  v6 = objc_msgSend(a3, "matchContent");
  v7 = objc_msgSend(a3, "_preferredHdrType");
  v8 = v7;
  v9 = impl[380];
  if ((v9 & 0x400) != 0 || v6 != (v9 & 0x40) >> 6 || *((_DWORD *)impl + 110) != v7)
  {
    v10 = *((_DWORD *)impl + 26);
    ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      v12 = ServerPort;
      if (!v10)
      {
LABEL_30:
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], v12);
        return;
      }
      v17 = *MEMORY[0x1E0C804E8];
      v18 = v10;
      v19 = v6;
      v20 = v8;
      reply_port = mig_get_reply_port();
      *(_QWORD *)&msg.msgh_bits = 5395;
      msg.msgh_remote_port = v12;
      msg.msgh_local_port = reply_port;
      *(_QWORD *)&msg.msgh_voucher_port = 0x9D2F00000000;
      if (MEMORY[0x1E0C85B60])
      {
        voucher_mach_msg_set(&msg);
        reply_port = msg.msgh_local_port;
      }
      v14 = mach_msg(&msg, 3, 0x2Cu, 0x2Cu, reply_port, 0, 0);
      v15 = v14;
      if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(msg.msgh_local_port);
        goto LABEL_27;
      }
      if (v14)
      {
        mig_dealloc_reply_port(msg.msgh_local_port);
      }
      else
      {
        if (msg.msgh_id == 71)
        {
          v15 = -308;
        }
        else if (msg.msgh_id == 40339)
        {
          v15 = -300;
          if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
          {
            v15 = v18;
            if (!v18)
            {
LABEL_27:
              if (!v15 && (impl[380] & 0x800) == 0)
              {
                impl[380] |= 0x400u;
                CA::Display::Display::update((CA::Display::Display *)impl);
              }
              goto LABEL_30;
            }
          }
        }
        else
        {
          v15 = -301;
        }
        mach_msg_destroy(&msg);
      }
      if (v15 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      goto LABEL_27;
    }
  }
}

- (id)preferredModeWithCriteria:(id)a3
{
  CA::Display::Display *impl;
  CADisplayPreferences *v6;
  void *v7;
  int v8;
  NSString *v9;
  uint64_t v10;
  double v11;
  double v12;
  char *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  float v19;
  unint64_t v20;
  id mode;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  void *__p[2];
  __int128 v28;
  __int128 v29;
  _OWORD v30[3];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  impl = (CA::Display::Display *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update(impl);
  v6 = -[CADisplay preferences](self, "preferences");
  v7 = (void *)objc_msgSend(a3, "hdrMode");
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Dolby")) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HDR10")) & 1) != 0)
  {
    v8 = 3;
  }
  else
  {
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SDR"));
  }
  v9 = -[CADisplayPreferences preferredHdrMode](v6, "preferredHdrMode");
  if (-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("Dolby")))
  {
    v10 = 5;
  }
  else if (-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("HDR10")))
  {
    v10 = 3;
  }
  else
  {
    v10 = -[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("SDR"));
  }
  objc_msgSend(a3, "refreshRate");
  v12 = v11;
  HIDWORD(v24) = 0;
  v13 = (char *)self->_impl;
  os_unfair_lock_lock((os_unfair_lock_t)v13 + 18);
  v23 = *((_OWORD *)v13 + 20);
  LODWORD(v24) = *((_DWORD *)v13 + 84);
  BYTE4(v24) = v13[340];
  v25 = *(_OWORD *)(v13 + 344);
  LODWORD(v26) = *((_DWORD *)v13 + 90);
  os_unfair_lock_unlock((os_unfair_lock_t)v13 + 18);
  v29 = 0u;
  memset(v30, 0, sizeof(v30));
  *(_OWORD *)__p = 0u;
  v28 = 0u;
  CA::Display::Display::available_modes((CA::Display::Display *)__p, (os_unfair_lock_s *)self->_impl);
  objc_msgSend(a3, "resolution", v23, v24, v25, v26);
  v15 = v14;
  v17 = v16;
  v18 = -[CADisplayPreferences matchContent](v6, "matchContent");
  v19 = v12;
  v20 = CA::WindowServer::Display::ModeSet::preferred_mode_with_criteria((unint64_t **)__p, v8, v10, v18, (unsigned int *)&v23, v15, v17, v19);
  if (v20)
    mode = create_mode((uint64_t)self, v20, (uint64_t)__p);
  else
    mode = 0;
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v30);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((_QWORD *)v29);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return mode;
}

- (id)supportedHDRModes
{
  char *impl;
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  void *__p[6];
  _OWORD v16[4];
  int v17;
  char v18;
  __int128 v19;
  int v20;
  _OWORD v21[2];
  __int128 v22;
  _OWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  impl = (char *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v3 = *((_QWORD *)impl + 31);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if (!v3)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v4 = *((_QWORD *)impl + 31);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if ((v4 & 0x10000000) != 0)
    return 0;
  v22 = 0u;
  memset(v23, 0, sizeof(v23));
  memset(v21, 0, sizeof(v21));
  CA::Display::Display::available_modes((CA::Display::Display *)v21, (os_unfair_lock_s *)impl);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v5 = *((_DWORD *)impl + 84);
  v6 = impl[340];
  v12 = *(_OWORD *)(impl + 344);
  v13 = *((_OWORD *)impl + 20);
  v7 = *((_DWORD *)impl + 90);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  v24[0] = CFSTR("Dolby");
  v24[1] = CFSTR("HDR10");
  v24[2] = CFSTR("SDR");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v9 = (void *)MEMORY[0x1E0CB3880];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = __30__CADisplay_supportedHDRModes__block_invoke;
  v14[3] = &__block_descriptor_172_e8_32c39_ZTSN2CA12WindowServer7Display7ModeSetE128c47_ZTSN2CA12WindowServer7Display14EDIDAttributesE_e21_B24__0__NSString_8_16l;
  CA::WindowServer::Display::ModeSet::ModeSet((CA::WindowServer::Display::ModeSet *)__p, (const CA::WindowServer::Display::ModeSet *)v21);
  v16[3] = v13;
  v17 = v5;
  v18 = v6;
  v19 = v12;
  v20 = v7;
  v10 = (void *)objc_msgSend(v8, "filteredArrayUsingPredicate:", objc_msgSend(v9, "predicateWithBlock:", v14));
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v16);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((_QWORD *)__p[4]);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v23);
  std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((_QWORD *)v22);
  if (*(_QWORD *)&v21[0])
  {
    *((_QWORD *)&v21[0] + 1) = *(_QWORD *)&v21[0];
    operator delete(*(void **)&v21[0]);
  }
  return v10;
}

- (id)preferredHDRModes
{
  id result;
  id v4;
  os_unfair_lock_s *impl;
  char v6;
  __int128 v7;
  void *__p[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  result = (id)objc_msgSend(-[CADisplay supportedHDRModes](self, "supportedHDRModes"), "mutableCopy");
  if (result)
  {
    v4 = result;
    impl = (os_unfair_lock_s *)self->_impl;
    os_unfair_lock_lock(impl + 18);
    v7 = *(_OWORD *)&impl[80]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(impl + 18);
    CA::Display::Display::available_modes((CA::Display::Display *)__p, impl);
    v6 = CA::WindowServer::Display::ModeSet::supports_4k60_dovi((unint64_t **)__p, (const EDIDAttributes *)v7);
    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)v9);
    std::__tree<std::tuple<unsigned short,unsigned short>>::destroy((_QWORD *)__p[4]);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if ((v6 & 1) == 0)
      objc_msgSend(v4, "removeObject:", CFSTR("Dolby"));
    return v4;
  }
  return result;
}

- (CADisplayPreset)currentPreset
{
  unsigned __int8 *impl;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CAUserAdjustment *v9;
  CADisplayPreset *v11;
  double v12;

  if (CADeviceSupportsReferenceMode::once[0] != -1)
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_159);
  if (!CADeviceSupportsReferenceMode::supports_ref)
    return 0;
  impl = (unsigned __int8 *)self->_impl;
  if ((*((_WORD *)impl + 380) & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)impl);
  os_unfair_lock_lock((os_unfair_lock_t)impl + 18);
  v4 = impl[368];
  v5 = *((double *)impl + 47);
  v6 = *((double *)impl + 48);
  v7 = *((double *)impl + 49);
  v8 = *((double *)impl + 50);
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 18);
  if (v4)
    v9 = -[CAUserAdjustment initWithXDelta:yDelta:luminanceScale:timestamp:]([CAUserAdjustment alloc], "initWithXDelta:yDelta:luminanceScale:timestamp:", v5, v6, v7, v8);
  else
    v9 = 0;
  v11 = [CADisplayPreset alloc];
  *(float *)&v12 = CA::Display::Display::auto_luminance_boost((CA::Display::Display *)*((unsigned int *)impl + 26));
  return -[CADisplayPreset initWithIsReference:userAdjustment:autoLuminanceBoost:](v11, "initWithIsReference:userAdjustment:autoLuminanceBoost:", v4 != 0, v9, v12);
}

- (void)setCurrentPreset:(id)a3
{
  os_unfair_lock_s *impl;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint32_t os_unfair_lock_opaque;
  mach_port_t ServerPort;
  mach_port_t v17;
  ipc_space_t *v18;
  mach_msg_return_t v19;
  mach_port_name_t name;
  mach_msg_header_t msg[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (CADeviceSupportsReferenceMode::once[0] != -1)
    dispatch_once(CADeviceSupportsReferenceMode::once, &__block_literal_global_159);
  if (CADeviceSupportsReferenceMode::supports_ref)
  {
    objc_msgSend(a3, "isReference");
    kdebug_trace();
    impl = (os_unfair_lock_s *)self->_impl;
    if ((impl[190]._os_unfair_lock_opaque & 0x400) != 0)
      CA::Display::Display::update((CA::Display::Display *)impl);
    os_unfair_lock_lock(impl + 18);
    v6 = *(_QWORD *)&impl[94]._os_unfair_lock_opaque;
    v7 = *(_QWORD *)&impl[96]._os_unfair_lock_opaque;
    v8 = *(_QWORD *)&impl[98]._os_unfair_lock_opaque;
    v9 = *(_QWORD *)&impl[100]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(impl + 18);
    if (objc_msgSend(a3, "userAdjustment"))
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "xDelta");
      v6 = v10;
    }
    if (objc_msgSend(a3, "userAdjustment"))
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "yDelta");
      v7 = v11;
    }
    if (objc_msgSend(a3, "userAdjustment"))
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "luminanceScale");
      v8 = v12;
    }
    if (objc_msgSend(a3, "userAdjustment"))
    {
      objc_msgSend((id)objc_msgSend(a3, "userAdjustment"), "timestamp");
      v9 = v13;
    }
    v14 = objc_msgSend(a3, "isReference");
    os_unfair_lock_opaque = impl[26]._os_unfair_lock_opaque;
    ServerPort = CARenderServerGetServerPort(0);
    if (ServerPort)
    {
      v17 = ServerPort;
      v18 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      if (os_unfair_lock_opaque)
      {
        name = 0;
        if (!mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name))
        {
          *(_OWORD *)&msg[0].msgh_id = 0u;
          *(_OWORD *)&msg[0].msgh_size = 0u;
          msg[1].msgh_size = name;
          msg[1].msgh_local_port = 1310720;
          *(_QWORD *)&msg[1].msgh_voucher_port = *MEMORY[0x1E0C804E8];
          LODWORD(v22) = os_unfair_lock_opaque;
          BYTE4(v22) = v14;
          *(_WORD *)((char *)&v22 + 5) = 0;
          BYTE7(v22) = 0;
          *((_QWORD *)&v22 + 1) = v6;
          *(_QWORD *)&v23 = v7;
          *((_QWORD *)&v23 + 1) = v8;
          *(_QWORD *)&v24 = v9;
          msg[0].msgh_bits = -2147483629;
          msg[0].msgh_remote_port = v17;
          *(_QWORD *)&msg[0].msgh_id = 0x100009D2ELL;
          if (MEMORY[0x1E0C85B60])
            voucher_mach_msg_set(msg);
          v19 = mach_msg(msg, 1, 0x58u, 0, 0, 0, 0);
          if (v19)
          {
            if (v19 == -81182719)
            {
              x_log_crash("Unentitled call to server!");
              abort();
            }
          }
          else
          {
            v23 = 0u;
            v24 = 0u;
            v22 = 0u;
            memset(msg, 0, sizeof(msg));
            mach_msg(msg, 258, 0, 0x60u, name, 0x3E8u, 0);
            mach_port_mod_refs(*v18, name, 1u, -1);
            if ((impl[190]._os_unfair_lock_opaque & 0x800) == 0)
            {
              LOWORD(impl[190]._os_unfair_lock_opaque) |= 0x400u;
              CA::Display::Display::update((CA::Display::Display *)impl);
            }
          }
        }
      }
      mach_port_deallocate(*v18, v17);
    }
    objc_msgSend(a3, "isReference");
    kdebug_trace();
  }
}

- (float)autoLuminanceBoost
{
  _WORD *impl;

  impl = self->_impl;
  if ((impl[380] & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  return CA::Display::Display::auto_luminance_boost((CA::Display::Display *)*((unsigned int *)impl + 26));
}

- (BOOL)isForceFixedRateLinksEnabled
{
  unsigned __int16 *impl;
  unsigned int v3;

  impl = (unsigned __int16 *)self->_impl;
  v3 = impl[380];
  if ((v3 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    v3 = impl[380];
  }
  return (v3 >> 8) & 1;
}

- (void)setForceFixedRateLinksEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _WORD *impl;
  id v6;

  v3 = a3;
  impl = self->_impl;
  if ((impl[380] & 0x800) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplay"), CFSTR("cannot change fixed rate link settings on an immutable CADisplay"));
  if (v3 && *((_QWORD *)impl + 56))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplay"), CFSTR("cannot enable fixed rate links on non-internal panel"));
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setForceFixedRateLinks:", v3);
  -[CADisplay setDisplayProperties:](self, "setDisplayProperties:", v6);

}

- (id)flipBookWithCapacity:(unint64_t)a3
{
  return 0;
}

- (id)flipBookWithOptions:(id)a3
{
  _WORD *impl;
  __int16 v6;

  impl = self->_impl;
  v6 = impl[380];
  if ((v6 & 0x400) != 0)
  {
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
    v6 = impl[380];
  }
  if ((v6 & 0x20) != 0)
    return -[CAFlipBook _initWithDisplayId:options:]([CAFlipBook alloc], "_initWithDisplayId:options:", -[CADisplay displayId](self, "displayId"), a3);
  else
    return 0;
}

- (void)overrideDisplayTimings:(id)a3
{
  _WORD *impl;
  void *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  CA::Display::Display *v13;
  double v14;
  char v15;

  impl = self->_impl;
  if ((impl[380] & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  if (*((_QWORD *)impl + 56) == 2)
  {
    if (!a3)
    {
      *((_BYTE *)impl + 697) &= 0xE7u;
      return;
    }
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("offset"));
    if (!v5)
      goto LABEL_14;
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
    v7 = *((_BYTE *)impl + 697);
    *((_BYTE *)impl + 697) = v7 | 0x10;
    v8 = *((_QWORD *)impl + 68);
    if (v8 - 1 < v6)
    {
      v9 = (v7 & 8) == 0;
      v10 = 264;
      if (v9)
        v10 = 248;
      v11 = CAHostTimeWithTime(*(double *)&impl[v10]);
      if (!v11)
        goto LABEL_14;
      *((_QWORD *)impl + 67) += vcvtad_u64_f64((double)(v6 - v8) / (double)v11);
    }
    else
    {
      *((_QWORD *)impl + 67) = 0;
    }
    *((_QWORD *)impl + 68) = v6;
LABEL_14:
    v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("refreshRate"));
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      v15 = *((_BYTE *)impl + 697);
      if ((v15 & 8) == 0 || fabs(*((double *)impl + 66) / v14 + -1.0) >= 0.0001)
      {
        *((double *)impl + 66) = v14;
        *((_BYTE *)impl + 697) = v15 | 8;
        CA::Display::DisplayLink::display_refresh_rate_changed((CA::Display::DisplayLink *)impl, v13);
      }
    }
  }
}

- (CAFrameRateRange)preferredFrameRateRangeForVelocity:(float)a3
{
  _WORD *impl;
  float v5;
  float v6;
  float v7;
  CAFrameRateRange result;

  impl = self->_impl;
  if ((impl[380] & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if ((*((_BYTE *)impl + 697) & 2) != 0)
    v5 = CAFrameRateRangeForVelocity(a3, 1);
  result.preferred = v7;
  result.maximum = v6;
  result.minimum = v5;
  return result;
}

- (CAFrameRateRange)preferredFrameRateRangeForMaximumVelocity:(float)a3
{
  _WORD *impl;
  float v5;
  float v6;
  float v7;
  CAFrameRateRange result;

  impl = self->_impl;
  if ((impl[380] & 0x400) != 0)
    CA::Display::Display::update((CA::Display::Display *)self->_impl);
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if ((*((_BYTE *)impl + 697) & 2) != 0)
    v5 = CAFrameRateRangeForVelocity(a3, 0);
  result.preferred = v7;
  result.maximum = v6;
  result.minimum = v5;
  return result;
}

uint64_t __30__CADisplay_supportedHDRModes__block_invoke(uint64_t a1, void *a2)
{
  int v4;
  unint64_t v6;
  unsigned int v7;
  void *v8;

  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("Dolby")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(a2, "isEqualToString:", CFSTR("HDR10")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    if ((objc_msgSend(a2, "isEqualToString:", CFSTR("SDR")) & 1) != 0)
      return 1;
    v4 = 0;
  }
  v6 = CA::WindowServer::Display::ModeSet::preferred_mode_with_criteria((unint64_t **)(a1 + 32), v4, 0, 1, (unsigned int *)(a1 + 128), 0.0, 0.0, 0.0);
  v7 = CA::WindowServer::Display::Mode::hdr_type(v6) - 1;
  if (v7 > 4)
    v8 = 0;
  else
    v8 = *(&off_1E159C5A0 + v7);
  return objc_msgSend(v8, "isEqual:", a2);
}

+ (void)updateDisplays
{
  displays_up_to_date = 0;
}

- (__CFDictionary)_copyDebugProperties
{
  int ServerPort;
  int v4;
  unsigned int v5;
  mach_port_t reply_port;
  mach_msg_return_t v7;
  int v8;
  unsigned int v9;
  const UInt8 *v10;
  const __CFAllocator *v11;
  mach_vm_size_t v12;
  const __CFData *v13;
  __CFDictionary *v14;
  int msg;
  _BYTE msg_4[60];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ServerPort = CARenderServerGetServerPort(0);
  if (!ServerPort)
    return 0;
  v4 = ServerPort;
  v5 = -[CADisplay displayId](self, "displayId");
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg_4[28] = v5;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = v4;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x9D6100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    reply_port = *(_DWORD *)&msg_4[8];
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  }
  else
  {
    if (v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
    }
    else
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v8 = -308;
      }
      else if (*(_DWORD *)&msg_4[16] == 40389)
      {
        if (msg < 0)
        {
          v8 = -300;
          if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 56 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
          {
            v9 = *(_DWORD *)&msg_4[36];
            if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
            {
              v10 = *(const UInt8 **)&msg_4[24];
              goto LABEL_29;
            }
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          v8 = -300;
          if (*(_DWORD *)&msg_4[28])
          {
            if (*(_DWORD *)&msg_4[4])
              v8 = -300;
            else
              v8 = *(_DWORD *)&msg_4[28];
          }
        }
        else
        {
          v8 = -300;
        }
      }
      else
      {
        v8 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }
    if (v8 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
  }
  v10 = 0;
  v9 = 0;
LABEL_29:
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE18];
  v12 = v9;
  v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE18], v10, v9);
  mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)v10, v12);
  if (!v13)
    return 0;
  v14 = (__CFDictionary *)CFPropertyListCreateWithData(v11, v13, 0, 0, 0);
  CFRelease(v13);
  return v14;
}

@end
