@implementation CAFrameRateRangeGroup

- (void)addCompatQuantaIntent
{
  *((_BYTE *)self->_impl + 129) |= 8u;
}

- (void)dealloc
{
  _QWORD *impl;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    if (impl[1])
    {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::FrameRateRangeGroup::_list_lock);
      v4 = CA::FrameRateRangeGroup::_list;
      if (CA::FrameRateRangeGroup::_list)
      {
        if ((_QWORD *)CA::FrameRateRangeGroup::_list == impl)
        {
          v6 = &CA::FrameRateRangeGroup::_list;
LABEL_9:
          *v6 = impl[3];
        }
        else
        {
          while (1)
          {
            v5 = v4;
            v4 = *(_QWORD *)(v4 + 24);
            if (!v4)
              break;
            if ((_QWORD *)v4 == impl)
            {
              v6 = (uint64_t *)(v5 + 24);
              goto LABEL_9;
            }
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&CA::FrameRateRangeGroup::_list_lock);
    }
    v7 = (void *)impl[12];
    if (v7)
    {
      impl[13] = v7;
      operator delete(v7);
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)(impl + 7));
    MEMORY[0x186DBD990](impl, 0x10A0C40DF5EECE8);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAFrameRateRangeGroup;
  -[CAFrameRateRangeGroup dealloc](&v8, sel_dealloc);
}

- (void)addReason:(unsigned int)a3
{
  uint64_t current_reason_count;
  unsigned int *reasons;
  uint64_t v5;
  int v6;

  if (a3)
  {
    current_reason_count = self->_current_reason_count;
    if ((_DWORD)current_reason_count)
    {
      if ((_DWORD)current_reason_count != 8)
      {
        reasons = self->_reasons;
        v5 = self->_current_reason_count;
        while (1)
        {
          v6 = *reasons++;
          if (v6 == a3)
            break;
          if (!--v5)
            goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      self->_current_reason_count = current_reason_count + 1;
      self->_reasons[current_reason_count] = a3;
    }
  }
}

- (void)addFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;
  os_unfair_lock_s *impl;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CAFrameRateRange v14;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v14.minimum = minimum;
  v14.maximum = maximum;
  v14.preferred = preferred;
  CA::FrameRateRangeGroup::add((CA::FrameRateRangeGroup *)impl, v14);
  CA::FrameRateRangeGroup::arbitrate_ranges((CA::FrameRateRangeGroup *)impl, v7, v8, v9, v10, v11, v12, v13);
  os_unfair_lock_unlock(impl);
}

- (CAFrameRateRangeGroup)initWithHeartbeatRate:(double)a3 minimumFrameDuration:(unsigned __int8)a4 supportsVRR:(BOOL)a5 compatQuantaMode:(BOOL)a6 serverCompatQuantaMode:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  CAFrameRateRangeGroup *v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  objc_super v18;
  uint64_t v19;

  v7 = a7;
  v8 = a6;
  v19 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CAFrameRateRangeGroup;
  v12 = -[CAFrameRateRangeGroup init](&v18, sel_init);
  if (v12)
  {
    v13 = operator new();
    *(_QWORD *)v13 = 0xFFFFFFFF00000000;
    *(_OWORD *)(v13 + 8) = 0u;
    *(_OWORD *)(v13 + 24) = 0u;
    *(_OWORD *)(v13 + 40) = 0u;
    *(_OWORD *)(v13 + 56) = 0u;
    *(_OWORD *)(v13 + 72) = 0u;
    *(_DWORD *)(v13 + 88) = 1065353216;
    *(_QWORD *)(v13 + 104) = 0;
    *(_QWORD *)(v13 + 112) = 0;
    v14 = *(_BYTE *)(v13 + 129) & 0xF0;
    *(_QWORD *)(v13 + 96) = 0;
    *(double *)(v13 + 120) = a3;
    if (v8)
      v15 = 2;
    else
      v15 = 0;
    *(_BYTE *)(v13 + 128) = a4;
    if (v7)
      v16 = 4;
    else
      v16 = 0;
    *(_BYTE *)(v13 + 129) = v15 | a5 | v16 | v14;
    v12->_impl = (void *)v13;
  }
  return v12;
}

- (BOOL)hasCompatQuantaIntent
{
  return (*((unsigned __int8 *)self->_impl + 129) >> 3) & 1;
}

- (CAFrameIntervalRange)arbitratedIntervalRange
{
  os_unfair_lock_s *impl;
  uint64_t v3;
  unsigned int os_unfair_lock_opaque;
  uint64_t v5;
  unsigned int v6;
  CAFrameIntervalRange result;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v3 = *(_QWORD *)&impl[8]._os_unfair_lock_opaque;
  os_unfair_lock_opaque = impl[10]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(impl);
  v5 = v3;
  v6 = os_unfair_lock_opaque;
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  result.var2 = v6;
  return result;
}

- (const)reasonsWithCount:(unsigned int *)a3
{
  *a3 = self->_current_reason_count;
  return self->_reasons;
}

- (CAFrameRateRangeGroup)initWithDisplay:(id)a3
{
  CAFrameRateRangeGroup *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)CAFrameRateRangeGroup;
  v4 = -[CAFrameRateRangeGroup init](&v9, sel_init);
  if (v4)
  {
    v5 = operator new();
    v6 = objc_msgSend(a3, "displayId");
    v7 = objc_msgSend(a3, "timingsControl");
    *(_DWORD *)v5 = 0;
    *(_DWORD *)(v5 + 4) = v6;
    *(_QWORD *)(v5 + 8) = v7;
    *(_QWORD *)(v5 + 16) = v4;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 96) = 0u;
    *(_DWORD *)(v5 + 88) = 1065353216;
    *(_OWORD *)(v5 + 112) = 0u;
    *(_BYTE *)(v5 + 128) = 0;
    *(_BYTE *)(v5 + 129) &= 0xF0u;
    if (!v7)
      __assert_rtn("FrameRateRangeGroup", "CAFrameRateRangeGroup.mm", 103, "display_timings_control != nullptr");
    os_unfair_lock_lock((os_unfair_lock_t)&CA::FrameRateRangeGroup::_list_lock);
    *(_QWORD *)(v5 + 24) = CA::FrameRateRangeGroup::_list;
    CA::FrameRateRangeGroup::_list = v5;
    os_unfair_lock_unlock((os_unfair_lock_t)&CA::FrameRateRangeGroup::_list_lock);
    v4->_impl = (void *)v5;
  }
  return v4;
}

- (void)removeFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;
  os_unfair_lock_s *impl;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CAFrameRateRange v14;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v14.minimum = minimum;
  v14.maximum = maximum;
  v14.preferred = preferred;
  CA::FrameRateRangeGroup::remove((int8x8_t *)impl, v14);
  CA::FrameRateRangeGroup::arbitrate_ranges((CA::FrameRateRangeGroup *)impl, v7, v8, v9, v10, v11, v12, v13);
  os_unfair_lock_unlock(impl);
}

- (void)updateFrameRateRange:(CAFrameRateRange)a3 toRange:(CAFrameRateRange)a4
{
  float preferred;
  float maximum;
  float minimum;
  float v7;
  float v8;
  float v9;
  os_unfair_lock_s *impl;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CAFrameRateRange v18;
  CAFrameRateRange v19;

  preferred = a4.preferred;
  maximum = a4.maximum;
  minimum = a4.minimum;
  v7 = a3.preferred;
  v8 = a3.maximum;
  v9 = a3.minimum;
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v18.minimum = v9;
  v18.maximum = v8;
  v18.preferred = v7;
  CA::FrameRateRangeGroup::remove((int8x8_t *)impl, v18);
  v19.minimum = minimum;
  v19.maximum = maximum;
  v19.preferred = preferred;
  CA::FrameRateRangeGroup::add((CA::FrameRateRangeGroup *)impl, v19);
  CA::FrameRateRangeGroup::arbitrate_ranges((CA::FrameRateRangeGroup *)impl, v11, v12, v13, v14, v15, v16, v17);
  os_unfair_lock_unlock(impl);
}

- (CAFrameRateRange)arbitratedRange
{
  os_unfair_lock_s *impl;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  CAFrameRateRange result;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl);
  v3 = *(float *)&impl[11]._os_unfair_lock_opaque;
  v4 = *(float *)&impl[12]._os_unfair_lock_opaque;
  v5 = *(float *)&impl[13]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(impl);
  v6 = v3;
  v7 = v4;
  v8 = v5;
  result.preferred = v8;
  result.maximum = v7;
  result.minimum = v6;
  return result;
}

@end
