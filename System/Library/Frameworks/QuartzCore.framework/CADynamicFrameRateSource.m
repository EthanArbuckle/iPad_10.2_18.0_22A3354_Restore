@implementation CADynamicFrameRateSource

- (double)commitDeadlineAfterTimestamp:(double)a3
{
  DynamicFrameRateSource *impl;
  uint64_t v4;
  uint64_t v5;

  impl = self->_impl;
  v4 = CAHostTimeWithTime(a3);
  v5 = CA::DynamicFrameRateSource::commit_deadline((CA::DynamicFrameRateSource *)impl);
  if (v5 <= v4)
    v5 = CA::DynamicFrameRateSource::_commit_deadline_at_timestamp((CA::DynamicFrameRateSource *)impl, v4);
  return CATimeWithHostTime(v5);
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;
  uint64_t v7;
  CAFrameRateRange v8;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  if (!CAFrameRateRangeIsValid(a3.minimum, a3.maximum, a3.preferred))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid range (minimum: %.2f maximum: %.2f preferred: %.2f)"), minimum, maximum, preferred);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  v8.minimum = minimum;
  v8.maximum = maximum;
  v8.preferred = preferred;
  CA::DynamicFrameRateSource::set_preferred_fps_range((CA::DynamicFrameRateSource *)self->_impl, v8, 1);
}

- (void)setHighFrameRateReasons:(const unsigned int *)a3 count:(unint64_t)a4
{
  DynamicFrameRateSource *impl;
  unsigned int v6;
  size_t v7;
  size_t v8;
  _BYTE __dst[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (a4 >= 4)
    v6 = 4;
  else
    v6 = a4;
  v7 = 4 * v6;
  if (v6 <= 3)
    v8 = 16 - v7;
  else
    v8 = 0;
  bzero(&__dst[v7], v8);
  memcpy(__dst, a3, v7);
  if (memcmp(impl->var8, __dst, v7))
  {
    memmove(impl->var8, a3, v7);
    if ((*((_BYTE *)impl + 88) & 1) != 0)
      CA::Display::DisplayTimingsControl::register_frame_interval_reasons((CA::Display::DisplayTimingsControl *)impl->var1, (uint64_t)impl, impl->var8, 4u);
    CA::DynamicFrameRateSource::set_preferred_fps_range((CA::DynamicFrameRateSource *)impl, impl->var2, 1);
  }
}

- (void)setPaused:(BOOL)a3
{
  DynamicFrameRateSource *impl;
  char v4;

  impl = self->_impl;
  v4 = *((_BYTE *)impl + 104);
  if (((((v4 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)impl + 104) = v4 & 0xFE | a3;
    if (a3)
    {
      if ((*((_BYTE *)impl + 88) & 1) != 0)
      {
        CA::Display::DisplayTimingsControl::unregister_frame_interval_range((os_unfair_lock_s *)impl->var1, impl->var3);
        CA::Display::DisplayTimingsControl::register_frame_interval_reasons((CA::Display::DisplayTimingsControl *)impl->var1, (uint64_t)impl, 0, 0);
        *((_BYTE *)impl + 88) &= ~1u;
      }
    }
    else
    {
      CA::DynamicFrameRateSource::set_preferred_fps_range((CA::DynamicFrameRateSource *)impl, impl->var2, 1);
    }
  }
}

- (BOOL)isPaused
{
  return *((_BYTE *)self->_impl + 104) & 1;
}

- (CADynamicFrameRateSource)initWithDisplay:(id)a3
{
  CADynamicFrameRateSource *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)CADynamicFrameRateSource;
  v4 = -[CADynamicFrameRateSource init](&v9, sel_init);
  if (v4)
  {
    v5 = operator new();
    v6 = objc_msgSend(a3, "displayId");
    v7 = objc_msgSend(a3, "timingsControl");
    *(_DWORD *)v5 = v6;
    *(_QWORD *)(v5 + 8) = v7;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_OWORD *)(v5 + 32) = 0u;
    *(_DWORD *)(v5 + 48) = 0;
    *(_BYTE *)(v5 + 88) &= ~1u;
    *(_BYTE *)(v5 + 104) |= 1u;
    os_unfair_lock_lock((os_unfair_lock_t)&CA::DynamicFrameRateSource::_list_lock);
    *(_QWORD *)(v5 + 96) = CA::DynamicFrameRateSource::_list;
    CA::DynamicFrameRateSource::_list = v5;
    os_unfair_lock_unlock((os_unfair_lock_t)&CA::DynamicFrameRateSource::_list_lock);
    v4->_impl = (DynamicFrameRateSource *)v5;
  }
  return v4;
}

- (void)dealloc
{
  DynamicFrameRateSource *impl;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    if ((*((_BYTE *)impl + 88) & 1) != 0)
    {
      CA::Display::DisplayTimingsControl::unregister_frame_interval_range((os_unfair_lock_s *)impl->var1, impl->var3);
      CA::Display::DisplayTimingsControl::register_frame_interval_reasons((CA::Display::DisplayTimingsControl *)impl->var1, (uint64_t)impl, 0, 0);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&CA::DynamicFrameRateSource::_list_lock);
    v4 = CA::DynamicFrameRateSource::_list;
    if (CA::DynamicFrameRateSource::_list)
    {
      if ((DynamicFrameRateSource *)CA::DynamicFrameRateSource::_list == impl)
      {
        v6 = &CA::DynamicFrameRateSource::_list;
LABEL_10:
        *v6 = (uint64_t)impl->var10;
      }
      else
      {
        while (1)
        {
          v5 = v4;
          v4 = *(_QWORD *)(v4 + 96);
          if (!v4)
            break;
          if ((DynamicFrameRateSource *)v4 == impl)
          {
            v6 = (uint64_t *)(v5 + 96);
            goto LABEL_10;
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&CA::DynamicFrameRateSource::_list_lock);
    MEMORY[0x186DBD990](impl, 0x10A0C405234EED1);
  }
  v7.receiver = self;
  v7.super_class = (Class)CADynamicFrameRateSource;
  -[CADynamicFrameRateSource dealloc](&v7, sel_dealloc);
}

- (CAFrameRateRange)preferredFrameRateRange
{
  DynamicFrameRateSource *impl;
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  impl = self->_impl;
  minimum = impl->var2.minimum;
  maximum = impl->var2.maximum;
  preferred = impl->var2.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (double)commitDeadline
{
  uint64_t v2;

  v2 = CA::DynamicFrameRateSource::commit_deadline((CA::DynamicFrameRateSource *)self->_impl);
  return CATimeWithHostTime(v2);
}

- (BOOL)shiftFramePhaseBy:(double)a3
{
  DynamicFrameRateSource *impl;
  unint64_t v4;
  os_unfair_lock_s *var1;
  unint64_t v6;
  os_unfair_lock_s *v7;
  mach_port_t ServerPort;
  int os_unfair_lock_opaque;
  pid_t v10;
  mach_port_t reply_port;
  mach_msg_return_t v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  int v17;
  unint64_t var6;
  mach_msg_header_t v19;
  uint64_t v20;
  int v21;
  pid_t v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v4 = CAHostTimeWithTime(a3);
  if ((*((_BYTE *)impl + 104) & 1) != 0)
    return 0;
  var1 = (os_unfair_lock_s *)impl->var1;
  if ((var1[58]._os_unfair_lock_opaque & 0x200) == 0)
    return 0;
  v6 = v4;
  v7 = var1 + 23;
  os_unfair_lock_lock(var1 + 23);
  if (0xAAAAAAAAAAAAAAABLL
     * ((uint64_t)(*(_QWORD *)&var1[30]._os_unfair_lock_opaque - *(_QWORD *)&var1[28]._os_unfair_lock_opaque) >> 2) >= 2)
    goto LABEL_32;
  ServerPort = CARenderServerGetServerPort(0);
  os_unfair_lock_opaque = var1[2]._os_unfair_lock_opaque;
  v10 = getpid();
  v20 = *MEMORY[0x1E0C804E8];
  v21 = os_unfair_lock_opaque;
  v22 = v10;
  v23 = v6;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v19.msgh_bits = 5395;
  v19.msgh_remote_port = ServerPort;
  v19.msgh_local_port = reply_port;
  *(_QWORD *)&v19.msgh_voucher_port = 0x9D5900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v19);
    reply_port = v19.msgh_local_port;
  }
  v12 = mach_msg(&v19, 3, 0x30u, 0x30u, reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v19.msgh_local_port);
    goto LABEL_28;
  }
  if (v12)
  {
    mig_dealloc_reply_port(v19.msgh_local_port);
    goto LABEL_27;
  }
  if (v19.msgh_id == 71)
  {
    v13 = -308;
LABEL_26:
    mach_msg_destroy(&v19);
LABEL_27:
    if (!v13)
    {
LABEL_32:
      os_unfair_lock_unlock(v7);
      return 0;
    }
LABEL_28:
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v15 = x_log_category_frame_rate;
      if (os_log_type_enabled((os_log_t)x_log_category_frame_rate, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19.msgh_bits) = 0;
        _os_log_impl(&dword_184457000, v15, OS_LOG_TYPE_ERROR, "CAFrameRateClient: request_frame_phase_shift failed", (uint8_t *)&v19, 2u);
      }
    }
    goto LABEL_32;
  }
  if (v19.msgh_id != 40381)
  {
    v13 = -301;
    goto LABEL_26;
  }
  if ((v19.msgh_bits & 0x80000000) != 0)
    goto LABEL_25;
  if (v19.msgh_size != 40)
  {
    if (v19.msgh_size == 36)
    {
      if (v19.msgh_remote_port)
        v14 = 1;
      else
        v14 = v21 == 0;
      if (v14)
        v13 = -300;
      else
        v13 = v21;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v19.msgh_remote_port)
  {
LABEL_25:
    v13 = -300;
    goto LABEL_26;
  }
  v13 = v21;
  if (v21)
    goto LABEL_26;
  v17 = v22;
  os_unfair_lock_unlock(v7);
  if (!v17)
    return 0;
  impl->var4 = 0;
  var6 = impl->var6;
  if (var6)
    impl->var6 = var6 + v6;
  return 1;
}

@end
