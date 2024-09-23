@implementation CAContext

- (CALayer)layer
{
  return (CALayer *)*((_QWORD *)self->_impl + 12);
}

- (BOOL)addFence:(id)a3
{
  CA::Transaction *v5;

  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create(0);
  return CA::Transaction::add_fence(v5, *((_DWORD *)self->_impl + 2), (uint64_t)a3, 0);
}

- (float)level
{
  return *((float *)self->_impl + 50);
}

+ (CAContext)contextWithId:(unsigned int)a3
{
  int *v3;
  int *v4;
  id *v5;
  CAContext *Weak;

  v3 = CA::Context::retain_context_with_client_id(*(CA::Context **)&a3);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (id *)(v3 + 20);
  if (*((_BYTE *)v4 + 88))
    Weak = (CAContext *)objc_loadWeak(v5);
  else
    Weak = (CAContext *)*v5;
  CA::Context::unref((CA::Context *)v4, 0);
  return Weak;
}

- (void)setLayer:(id)a3
{
  CA::Context::set_layer((CA::Context *)self->_impl, (char *)a3);
}

- (void)setCommitPriority:(unsigned int)a3
{
  *((_DWORD *)self->_impl + 35) = a3;
}

- (unsigned)displayId
{
  return *((_DWORD *)self->_impl + 37);
}

- (void)setFencePort:(unsigned int)a3
{
  _QWORD *v4;
  CA::Transaction *v5;
  _QWORD *v6;

  v4 = +[CAFenceHandle _newEphemeralHandleWithPort:]((uint64_t)CAFenceHandle, a3);
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  v6 = v4;
  if (!v5)
  {
    v5 = (CA::Transaction *)CA::Transaction::create(0);
    v4 = v6;
  }
  CA::Transaction::add_fence(v5, *((_DWORD *)self->_impl + 2), (uint64_t)v4, 0);
  objc_msgSend(v6, "invalidate");

}

- (unsigned)createFencePort
{
  unint64_t *v2;
  unsigned int *impl;
  mach_port_name_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  char *v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  mach_port_name_t v14;
  CA::Transaction *v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unsigned int v20[2];
  mach_port_name_t name;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  impl = (unsigned int *)self->_impl;
  name = 0;
  *(_QWORD *)v20 = 0;
  if (*((_QWORD *)impl + 13))
  {
    if (CA::Render::Fence::create_fence_port((CA::Render::Fence *)&name, v20, v2))
    {
      v5 = name;
      goto LABEL_15;
    }
    return 0;
  }
  if ((*((_BYTE *)impl + 241) & 2) != 0)
    return 0;
  v6 = _CASCreateFencePort(impl[40], &name, v20);
  if ((_DWORD)v6)
  {
    v7 = v6;
    if ((_DWORD)v6 == 268435459)
    {
      *((_BYTE *)impl + 241) |= 2u;
    }
    else if ((_DWORD)v6 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      v8 = impl[1];
      v18 = v7;
      v19 = mach_error_string(v7);
      v17 = v8;
      x_log_();
    }
    else
    {
      v9 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v10 = impl[1];
        v11 = mach_error_string(v7);
        *(_DWORD *)buf = 67109634;
        v23 = v10;
        v24 = 1024;
        v25 = v7;
        v26 = 2080;
        v27 = v11;
        _os_log_impl(&dword_184457000, v9, OS_LOG_TYPE_ERROR, "Failed to create fence port (client=0x%x) [0x%x %s]", buf, 0x18u);
      }
    }
  }
  v5 = name;
  if (name - 1 > 0xFFFFFFFD)
  {
    if (name)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name);
    return 0;
  }
LABEL_15:
  v12 = (os_unfair_lock_s *)+[CAFenceHandle _newFenceWithPort:name:]((uint64_t)CAFenceHandle, v5, *(uint64_t *)v20);
  v13 = v12;
  if (!v12)
    return 0;
  v14 = -[CAFenceHandle _copyPort](v12);
  if (v14)
  {
    v15 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v15)
      v15 = (CA::Transaction *)CA::Transaction::create(0);
    if (!CA::Transaction::add_fence(v15, *((_DWORD *)self->_impl + 2), (uint64_t)v13, 0))
    {
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v14);
      v14 = 0;
    }
  }
  -[os_unfair_lock_s invalidate](v13, "invalidate", v17, v18, v19);

  return v14;
}

- (void)dealloc
{
  id *impl;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  impl = (id *)self->_impl;
  if (impl)
  {
    CA::Context::set_objc_context(impl, 0);
    CA::Context::invalidate((CA::Context *)self->_impl);
    CA::Context::unref((CA::Context *)self->_impl, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAContext;
  -[CAContext dealloc](&v4, sel_dealloc);
}

+ (id)remoteContextWithOptions:(id)a3
{
  return -[CAContext initRemoteWithOptions:]([CAContext alloc], "initRemoteWithOptions:", a3);
}

- (id)initRemoteWithOptions:(id)a3
{
  CAContext *v3;
  CA::Context **p_isa;
  BOOL v5;
  CA::Context *v6;

  v3 = -[CAContext initWithOptions:localContext:](self, "initWithOptions:localContext:", a3, 0);
  p_isa = &v3->super.isa;
  if (v3)
  {
    v5 = CA::Context::connect_remote((CA::Context *)v3->_impl);
    v6 = p_isa[1];
    if (v5)
    {
      CA::Context::did_connect(v6);
    }
    else
    {
      CA::Context::set_objc_context((id *)v6, 0);
      CA::Context::unref(p_isa[1], 1);
      p_isa[1] = 0;

      return 0;
    }
  }
  return p_isa;
}

- (CAContext)initWithOptions:(id)a3 localContext:(BOOL)a4
{
  double v4;
  int v5;
  int v6;
  const void *v7;
  const void *v8;
  void *v9;
  id v10;
  malloc_zone_t *malloc_zone;
  char *v12;
  char *v13;
  CGColorSpace *v14;
  pid_t v15;
  NSObject *v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  malloc_zone_t *v20;
  CA::Render::Context *v21;
  objc_super v23;
  uint8_t buf[4];
  _BYTE *v25;
  __int16 v26;
  pid_t v27;
  __int16 v28;
  int v29;
  _BYTE buffer[4096];
  uint64_t v31;

  v4 = MEMORY[0x1E0C80A78](self);
  v6 = v5;
  v8 = v7;
  v31 = *MEMORY[0x1E0C80C00];
  v23.receiver = v9;
  v23.super_class = (Class)CAContext;
  v10 = -[CAContext init](&v23, sel_init, v4);
  if (!v10)
    return (CAContext *)v10;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v12 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xF8uLL, 0x743898A5uLL);
  if (!v12)
  {
    *((_QWORD *)v10 + 1) = 0;

    return 0;
  }
  v13 = v12;
  *((_QWORD *)v12 + 10) = 0;
  *(_DWORD *)v12 = 1;
  v12[88] = 0;
  *((_QWORD *)v12 + 19) = 0;
  *((_DWORD *)v12 + 44) = 0;
  *((_QWORD *)v12 + 23) = 0;
  *((_QWORD *)v12 + 24) = 0;
  *((_QWORD *)v12 + 20) = 0;
  *((_QWORD *)v12 + 27) = off_1E1599810;
  *((_QWORD *)v12 + 28) = v12;
  v12[241] |= 0x20u;
  v12[240] = 0;
  x_thread_init_mutex((pthread_mutex_t *)(v12 + 16), 1);
  if (v8)
  {
    *((_QWORD *)v13 + 15) = v8;
    CFRetain(v8);
  }
  v14 = (CGColorSpace *)CAGetColorSpace(0x1Du);
  *((_QWORD *)v13 + 14) = CGColorSpaceRetain(v14);
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Context::_lock);
  ++CA::Context::_context_count;
  if (CADeviceHasInternalBuild::once != -1)
    dispatch_once(&CADeviceHasInternalBuild::once, &__block_literal_global_107);
  if (CADeviceHasInternalBuild::internal && CA::Context::_context_count >= 0x201)
  {
    v15 = getpid();
    bzero(buffer, 0x1000uLL);
    proc_pidpath(v15, buffer, 0x1000u);
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v16 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v25 = buffer;
        v26 = 1024;
        v27 = v15;
        v28 = 1024;
        v29 = CA::Context::_context_count;
        _os_log_impl(&dword_184457000, v16, OS_LOG_TYPE_FAULT, "Too many CAContexts! Biggest offender (%s [%d]) has %u contexts!", buf, 0x18u);
      }
    }
  }
  v17 = CA::Context::_last_local_id;
  v18 = __CFADD__(CA::Context::_last_local_id++, 1);
  *((_DWORD *)v13 + 2) = CA::Context::_last_local_id;
  if (v18)
  {
    CA::Context::_last_local_id = v17 + 2;
    *((_DWORD *)v13 + 2) = v17 + 2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Context::_lock);
  *((_QWORD *)v10 + 1) = v13;
  CA::Context::set_objc_context((id *)v13, v10);
  if (!v6)
    goto LABEL_22;
  v19 = *((_QWORD *)v10 + 1);
  v20 = (malloc_zone_t *)get_malloc_zone();
  v21 = (CA::Render::Context *)malloc_type_zone_calloc(v20, 1uLL, 0x2E8uLL, 0x743898A5uLL);
  if (!v21)
  {
    *(_QWORD *)(v19 + 104) = 0;
    CA::Context::set_objc_context(*((id **)v10 + 1), 0);
    CA::Context::unref(*((CA::Context **)v10 + 1), 1);
    *((_QWORD *)v10 + 1) = 0;

    return 0;
  }
  *(_QWORD *)(v19 + 104) = CA::Render::Context::Context(v21, *(const __CFDictionary **)(v19 + 120), 0, 0, 0);
  if ((dyld_program_sdk_at_least() & 1) == 0)
    *(_DWORD *)(*(_QWORD *)(v19 + 104) + 12) |= 0x800u;
  *(_WORD *)(*(_QWORD *)(v19 + 104) + 552) &= ~0x40u;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(*(_QWORD *)(v19 + 104) + 16);
  CA::Context::did_connect(*((CA::Context **)v10 + 1));
LABEL_22:
  if (initialized[0] != -1)
    dispatch_once_f(initialized, 0, (dispatch_function_t)init_debug);
  return (CAContext *)v10;
}

- (BOOL)valid
{
  return (*((_BYTE *)self->_impl + 241) & 2) == 0;
}

- (BOOL)waitForCommitId:(unsigned int)a3 timeout:(double)a4
{
  int v6;
  _BOOL4 v7;

  if (a4 >= INFINITY)
    v6 = 0x7FFFFFFF;
  else
    v6 = (int)(a4 * 1000.0 + 0.5);
  v7 = CA::Context::synchronize((CA::Context *)self->_impl, a3, v6, 0);
  if (v7)
    CA::Context::ping((CA::Context *)self->_impl);
  return v7;
}

- (void)setObject:(id)a3 forSlot:(unsigned int)a4
{
  const void *v4;

  CA::Transaction::add_command((CA::Transaction *)0xB, *((_DWORD *)self->_impl + 2), a4, a3, v4);
}

- (NSDictionary)options
{
  return (NSDictionary *)*((_QWORD *)self->_impl + 15);
}

- (void)setLevel:(float)a3
{
  void *impl;
  CFNumberRef v4;
  const void *v5;
  float valuePtr;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  valuePtr = a3;
  if (*((float *)impl + 50) != a3)
  {
    *((float *)impl + 50) = a3;
    v4 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
    CA::Transaction::add_command((CA::Transaction *)0xA, *((_DWORD *)impl + 2), (unint64_t)valuePtr, v4, v5);
    CFRelease(v4);
  }
}

- (unsigned)contextId
{
  return *((_DWORD *)self->_impl + 1);
}

- (unsigned)commitId
{
  char *impl;
  pthread_mutex_t *v3;

  impl = (char *)self->_impl;
  v3 = (pthread_mutex_t *)(impl + 16);
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  LODWORD(impl) = *((_DWORD *)impl + 32);
  pthread_mutex_unlock(v3);
  return impl;
}

+ (id)objectForSlot:(unsigned int)a3
{
  return -[CASlotProxy initWithName:]([CASlotProxy alloc], "initWithName:", *(_QWORD *)&a3);
}

- (unsigned)createSlot
{
  void *impl;
  uint64_t v3;
  unsigned int v4;
  unsigned int v6;
  mach_port_t reply_port;
  mach_msg_return_t v8;
  mach_port_t msgh_remote_port;
  BOOL v10;
  NSObject *v11;
  mach_msg_size_t v12;
  char *v13;
  mach_msg_header_t msg[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v3 = *((_QWORD *)impl + 13);
  if (v3)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
    v4 = CA::Render::Context::new_slot(*((CA::Render::Context **)impl + 13));
    pthread_mutex_unlock((pthread_mutex_t *)(*((_QWORD *)impl + 13) + 72));
    return v4;
  }
  if ((*((_BYTE *)impl + 241) & 2) != 0)
    return 0;
  v6 = *((_DWORD *)impl + 40);
  *(_OWORD *)&msg[1].msgh_remote_port = 0u;
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v6);
  msg[0].msgh_bits = 5395;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x9D1300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(msg);
    reply_port = msg[0].msgh_local_port;
  }
  v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
  msgh_remote_port = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg[0].msgh_local_port);
    if (!msgh_remote_port)
      return msgh_remote_port;
    goto LABEL_28;
  }
  if (v8)
  {
    mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
    if (msgh_remote_port == 268435459)
    {
      *((_BYTE *)impl + 241) |= 2u;
    }
    else if (msgh_remote_port == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(msgh_remote_port);
      x_log_();
    }
    else
    {
      v11 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v12 = *((_DWORD *)impl + 1);
        v13 = mach_error_string(msgh_remote_port);
        msg[0].msgh_bits = 67109634;
        msg[0].msgh_size = v12;
        LOWORD(msg[0].msgh_remote_port) = 1024;
        *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
        HIWORD(msg[0].msgh_local_port) = 2080;
        *(_QWORD *)&msg[0].msgh_voucher_port = v13;
        _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_ERROR, "Failed to create slot (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
      }
    }
    return 0;
  }
  if (msg[0].msgh_id == 71)
  {
    msgh_remote_port = -308;
    goto LABEL_27;
  }
  if (msg[0].msgh_id != 40311)
  {
    msgh_remote_port = -301;
    goto LABEL_27;
  }
  if ((msg[0].msgh_bits & 0x80000000) != 0)
    goto LABEL_26;
  if (msg[0].msgh_size != 40)
  {
    if (msg[0].msgh_size == 36)
    {
      if (msg[0].msgh_remote_port)
        v10 = 1;
      else
        v10 = msg[1].msgh_remote_port == 0;
      if (v10)
        msgh_remote_port = -300;
      else
        msgh_remote_port = msg[1].msgh_remote_port;
      goto LABEL_27;
    }
LABEL_26:
    msgh_remote_port = -300;
    goto LABEL_27;
  }
  if (msg[0].msgh_remote_port)
    goto LABEL_26;
  msgh_remote_port = msg[1].msgh_remote_port;
  if (!msg[1].msgh_remote_port)
    return msg[1].msgh_local_port;
LABEL_27:
  mach_msg_destroy(msg);
  if (msgh_remote_port)
    goto LABEL_28;
  return msgh_remote_port;
}

- (void)invalidate
{
  CA::Context::invalidate((CA::Context *)self->_impl);
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  const void *v6;
  float v7;
  float v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p; contextId = 0x%x"),
    NSStringFromClass(v4),
    self,
    -[CAContext contextId](self, "contextId"));
  if (-[CAContext colorSpace](self, "colorSpace"))
  {
    v5 = CGColorSpaceCopyICCProfileDescription();
    if (v5)
    {
      v6 = (const void *)v5;
      objc_msgSend(v3, "appendFormat:", CFSTR("; colorSpace = %@"), v5);
      CFRelease(v6);
    }
  }
  if (-[CAContext commitPriority](self, "commitPriority"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; commitPriority = %u"),
      -[CAContext commitPriority](self, "commitPriority"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; contentsFormat = %@"), -[CAContext contentsFormat](self, "contentsFormat"));
  -[CAContext level](self, "level");
  if (v7 != 0.0)
  {
    -[CAContext level](self, "level");
    objc_msgSend(v3, "appendFormat:", CFSTR("; level = %f"), v8);
  }
  if (-[CAContext isSecure](self, "isSecure"))
    objc_msgSend(v3, "appendString:", CFSTR("; secure"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)*((_QWORD *)self->_impl + 14);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  CGColorSpace *v3;
  char *impl;
  NSObject *v5;
  int v6;
  uint64_t v7;
  objc_selector *v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  impl = (char *)self->_impl;
  if (!a3)
  {
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v5 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v6 = *((_DWORD *)impl + 1);
        *(_DWORD *)buf = 67109120;
        v10 = v6;
        _os_log_impl(&dword_184457000, v5, OS_LOG_TYPE_ERROR, "CoreAnimation: NULL color space set on context (%x)\n", buf, 8u);
      }
    }
    v3 = (CGColorSpace *)CAGetColorSpace(0x1Du);
  }
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CGColorSpaceRelease(*((CGColorSpaceRef *)impl + 14));
    *((_QWORD *)impl + 14) = CGColorSpaceRetain(v3);
    impl[241] |= 0x20u;
    v7 = *((_QWORD *)impl + 12);
    if (v7)
    {
      v8 = (objc_selector *)CA::Context::set_colorspace(CGColorSpace *)::sel;
      if (!CA::Context::set_colorspace(CGColorSpace *)::sel)
      {
        v8 = (objc_selector *)sel_registerName("_colorSpaceDidChange");
        CA::Context::set_colorspace(CGColorSpace *)::sel = (uint64_t)v8;
        v7 = *((_QWORD *)impl + 12);
      }
      CA::Layer::perform_selector(*(CA::Layer **)(v7 + 16), v8, 0);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (unsigned)commitPriority
{
  return *((_DWORD *)self->_impl + 35);
}

- (BOOL)colorMatchUntaggedContent
{
  void *impl;
  uint64_t v3;
  uint64_t v4;
  mach_port_t msgh_remote_port;
  unsigned int v6;
  mach_port_t reply_port;
  mach_msg_return_t v8;
  BOOL v9;
  NSObject *v10;
  mach_msg_size_t v11;
  char *v12;
  mach_msg_header_t msg[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v3 = *((_QWORD *)impl + 13);
  if (!v3)
  {
    if ((*((_BYTE *)impl + 241) & 2) != 0)
    {
LABEL_36:
      LOBYTE(msgh_remote_port) = 0;
      return msgh_remote_port;
    }
    v6 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[1].msgh_remote_port = 0u;
    *(_OWORD *)&msg[0].msgh_id = 0u;
    msg[0].msgh_size = 0;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v6);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x9D1500000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(msg);
      reply_port = msg[0].msgh_local_port;
    }
    v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
    msgh_remote_port = v8;
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
      if (!msgh_remote_port)
        return msgh_remote_port;
      goto LABEL_28;
    }
    if (v8)
    {
      mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
      if (msgh_remote_port == 268435459)
      {
        *((_BYTE *)impl + 241) |= 2u;
      }
      else if (msgh_remote_port == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(msgh_remote_port);
        x_log_();
      }
      else
      {
        v10 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          v11 = *((_DWORD *)impl + 1);
          v12 = mach_error_string(msgh_remote_port);
          msg[0].msgh_bits = 67109634;
          msg[0].msgh_size = v11;
          LOWORD(msg[0].msgh_remote_port) = 1024;
          *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
          HIWORD(msg[0].msgh_local_port) = 2080;
          *(_QWORD *)&msg[0].msgh_voucher_port = v12;
          _os_log_impl(&dword_184457000, v10, OS_LOG_TYPE_ERROR, "Failed to query untagged content matching (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
        }
      }
      goto LABEL_36;
    }
    if (msg[0].msgh_id == 71)
    {
      msgh_remote_port = -308;
      goto LABEL_27;
    }
    if (msg[0].msgh_id != 40313)
    {
      msgh_remote_port = -301;
      goto LABEL_27;
    }
    if ((msg[0].msgh_bits & 0x80000000) == 0)
    {
      if (msg[0].msgh_size == 40)
      {
        if (!msg[0].msgh_remote_port)
        {
          msgh_remote_port = msg[1].msgh_remote_port;
          if (!msg[1].msgh_remote_port)
            return msg[1].msgh_local_port != 0;
LABEL_27:
          mach_msg_destroy(msg);
          if (!msgh_remote_port)
            return msgh_remote_port;
          goto LABEL_28;
        }
      }
      else if (msg[0].msgh_size == 36)
      {
        if (msg[0].msgh_remote_port)
          v9 = 1;
        else
          v9 = msg[1].msgh_remote_port == 0;
        if (v9)
          msgh_remote_port = -300;
        else
          msgh_remote_port = msg[1].msgh_remote_port;
        goto LABEL_27;
      }
    }
    msgh_remote_port = -300;
    goto LABEL_27;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
  v4 = *((_QWORD *)impl + 13);
  msgh_remote_port = (*(unsigned __int16 *)(v4 + 552) >> 1) & 1;
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
  return msgh_remote_port;
}

- (void)setColorMatchUntaggedContent:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *impl;
  uint64_t v5;
  __int16 v6;
  int v7;
  mach_port_t reply_port;
  mach_msg_return_t v9;
  mach_error_t v10;
  NSObject *v11;
  int v12;
  char *v13;
  _BYTE msg[36];
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v5 = impl[13];
  if (v5)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 72));
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)(impl[13] + 552) = *(_WORD *)(impl[13] + 552) & 0xFFFD | v6;
    pthread_mutex_unlock((pthread_mutex_t *)(impl[13] + 72));
  }
  else
  {
    if ((*((_BYTE *)impl + 241) & 2) != 0)
      return;
    v7 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[20] = 0u;
    v15 = 0;
    *(_OWORD *)&msg[4] = 0u;
    *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
    *(_DWORD *)&msg[32] = a3;
    reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = v7;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(_QWORD *)&msg[16] = 0x9D1600000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x2Cu, reply_port, 0, 0);
    v10 = v9;
    if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
      if (!v10)
        return;
    }
    else if (v9)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 40314)
      {
        v10 = -300;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v10 = *(_DWORD *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return;
        }
      }
      else
      {
        v10 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      if (!v10)
        return;
    }
    if (v10 == 268435459)
    {
      *((_BYTE *)impl + 241) |= 2u;
    }
    else if (v10 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(v10);
      x_log_();
    }
    else
    {
      v11 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v12 = *((_DWORD *)impl + 1);
        v13 = mach_error_string(v10);
        *(_DWORD *)msg = 67109890;
        *(_DWORD *)&msg[4] = v3;
        *(_WORD *)&msg[8] = 1024;
        *(_DWORD *)&msg[10] = v12;
        *(_WORD *)&msg[14] = 1024;
        *(_DWORD *)&msg[16] = v10;
        *(_WORD *)&msg[20] = 2080;
        *(_QWORD *)&msg[22] = v13;
        _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_ERROR, "Failed to set untagged matching = %d (client=0x%x) [0x%x %s]", msg, 0x1Eu);
      }
    }
  }
}

- (NSString)contentsFormat
{
  NSString **v2;

  if (*((unsigned __int8 *)self->_impl + 240) - 1 > 4)
    v2 = (NSString **)&kCAContentsFormatRGBA8Uint;
  else
    v2 = (NSString **)off_1E159D198[(*((_BYTE *)self->_impl + 240) - 1)];
  return *v2;
}

- (void)setContentsFormat:(id)a3
{
  uint64_t v4;
  char *impl;
  uint64_t v6;
  objc_selector *v7;

  v4 = CA::Render::Layer::contents_format_from_string((const __CFString *)a3, (const __CFString *)a2);
  impl = (char *)self->_impl;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  if (impl[240] != (_DWORD)v4)
  {
    impl[240] = v4;
    v6 = *((_QWORD *)impl + 12);
    if (v6)
    {
      v7 = (objc_selector *)CA::Context::set_contents_format(CA::Render::LayerContentsFormat)::sel;
      if (!CA::Context::set_contents_format(CA::Render::LayerContentsFormat)::sel)
      {
        v7 = (objc_selector *)sel_registerName("_contentsFormatDidChange:");
        CA::Context::set_contents_format(CA::Render::LayerContentsFormat)::sel = (uint64_t)v7;
        v6 = *((_QWORD *)impl + 12);
      }
      CA::Layer::perform_selector(*(CA::Layer **)(v6 + 16), v7, (objc_object *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4));
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (NSDictionary)payload
{
  return (NSDictionary *)*((_QWORD *)self->_impl + 19);
}

- (void)setPayload:(id)Copy
{
  char *impl;
  const void *v5;
  id v6;

  impl = (char *)self->_impl;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  v6 = (id)*((_QWORD *)impl + 19);
  if (v6 != Copy)
  {
    if (Copy)
    {
      Copy = CFDictionaryCreateCopy(0, (CFDictionaryRef)Copy);
      v6 = (id)*((_QWORD *)impl + 19);
    }
    if (v6)
      CFRelease(v6);
    *((_QWORD *)impl + 19) = Copy;
    CA::Transaction::add_command((CA::Transaction *)7, *((_DWORD *)impl + 2), 0, Copy, v5);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (void)orderAbove:(unsigned int)a3
{
  const void *v3;

  CA::Transaction::add_command((CA::Transaction *)8, *((_DWORD *)self->_impl + 2), a3, 0, v3);
}

- (void)orderBelow:(unsigned int)a3
{
  const void *v3;

  CA::Transaction::add_command((CA::Transaction *)9, *((_DWORD *)self->_impl + 2), a3, 0, v3);
}

- (void)setSecure:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *impl;
  uint64_t v5;
  __int16 v6;
  int v7;
  mach_port_t reply_port;
  mach_msg_return_t v9;
  mach_error_t v10;
  NSObject *v11;
  int v12;
  char *v13;
  _BYTE msg[36];
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v5 = impl[13];
  if (v5)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 72));
    if (v3)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)(impl[13] + 552) = *(_WORD *)(impl[13] + 552) & 0xFFFB | v6;
    pthread_mutex_unlock((pthread_mutex_t *)(impl[13] + 72));
  }
  else
  {
    if ((*((_BYTE *)impl + 241) & 2) != 0)
      return;
    v7 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[20] = 0u;
    v15 = 0;
    *(_OWORD *)&msg[4] = 0u;
    *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
    *(_DWORD *)&msg[32] = a3;
    reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = v7;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(_QWORD *)&msg[16] = 0x9D1800000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x2Cu, reply_port, 0, 0);
    v10 = v9;
    if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
      if (!v10)
        return;
    }
    else if (v9)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 40316)
      {
        v10 = -300;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v10 = *(_DWORD *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return;
        }
      }
      else
      {
        v10 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      if (!v10)
        return;
    }
    if (v10 == 268435459)
    {
      *((_BYTE *)impl + 241) |= 2u;
    }
    else if (v10 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(v10);
      x_log_();
    }
    else
    {
      v11 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v12 = *((_DWORD *)impl + 1);
        v13 = mach_error_string(v10);
        *(_DWORD *)msg = 67109890;
        *(_DWORD *)&msg[4] = v3;
        *(_WORD *)&msg[8] = 1024;
        *(_DWORD *)&msg[10] = v12;
        *(_WORD *)&msg[14] = 1024;
        *(_DWORD *)&msg[16] = v10;
        *(_WORD *)&msg[20] = 2080;
        *(_QWORD *)&msg[22] = v13;
        _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_ERROR, "Failed to set secure=%d (client=0x%x) [0x%x %s]", msg, 0x1Eu);
      }
    }
  }
}

- (BOOL)isSecure
{
  void *impl;
  uint64_t v3;
  uint64_t v4;
  mach_port_t msgh_remote_port;
  unsigned int v6;
  mach_port_t reply_port;
  mach_msg_return_t v8;
  BOOL v9;
  NSObject *v10;
  mach_msg_size_t v11;
  char *v12;
  mach_msg_header_t msg[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v3 = *((_QWORD *)impl + 13);
  if (!v3)
  {
    if ((*((_BYTE *)impl + 241) & 2) != 0)
    {
LABEL_36:
      LOBYTE(msgh_remote_port) = 0;
      return msgh_remote_port;
    }
    v6 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[1].msgh_remote_port = 0u;
    *(_OWORD *)&msg[0].msgh_id = 0u;
    msg[0].msgh_size = 0;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v6);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x9D1700000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(msg);
      reply_port = msg[0].msgh_local_port;
    }
    v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
    msgh_remote_port = v8;
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
      if (!msgh_remote_port)
        return msgh_remote_port;
      goto LABEL_28;
    }
    if (v8)
    {
      mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
      if (msgh_remote_port == 268435459)
      {
        *((_BYTE *)impl + 241) |= 2u;
      }
      else if (msgh_remote_port == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(msgh_remote_port);
        x_log_();
      }
      else
      {
        v10 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          v11 = *((_DWORD *)impl + 1);
          v12 = mach_error_string(msgh_remote_port);
          msg[0].msgh_bits = 67109634;
          msg[0].msgh_size = v11;
          LOWORD(msg[0].msgh_remote_port) = 1024;
          *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
          HIWORD(msg[0].msgh_local_port) = 2080;
          *(_QWORD *)&msg[0].msgh_voucher_port = v12;
          _os_log_impl(&dword_184457000, v10, OS_LOG_TYPE_ERROR, "Failed to query security (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
        }
      }
      goto LABEL_36;
    }
    if (msg[0].msgh_id == 71)
    {
      msgh_remote_port = -308;
      goto LABEL_27;
    }
    if (msg[0].msgh_id != 40315)
    {
      msgh_remote_port = -301;
      goto LABEL_27;
    }
    if ((msg[0].msgh_bits & 0x80000000) == 0)
    {
      if (msg[0].msgh_size == 40)
      {
        if (!msg[0].msgh_remote_port)
        {
          msgh_remote_port = msg[1].msgh_remote_port;
          if (!msg[1].msgh_remote_port)
            return msg[1].msgh_local_port != 0;
LABEL_27:
          mach_msg_destroy(msg);
          if (!msgh_remote_port)
            return msgh_remote_port;
          goto LABEL_28;
        }
      }
      else if (msg[0].msgh_size == 36)
      {
        if (msg[0].msgh_remote_port)
          v9 = 1;
        else
          v9 = msg[1].msgh_remote_port == 0;
        if (v9)
          msgh_remote_port = -300;
        else
          msgh_remote_port = msg[1].msgh_remote_port;
        goto LABEL_27;
      }
    }
    msgh_remote_port = -300;
    goto LABEL_27;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
  v4 = *((_QWORD *)impl + 13);
  msgh_remote_port = (*(unsigned __int16 *)(v4 + 552) >> 2) & 1;
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
  return msgh_remote_port;
}

- (void)setDesiredDynamicRange:(float)a3
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;
  int v7;
  mach_port_t reply_port;
  mach_msg_return_t v9;
  mach_error_t v10;
  NSObject *v11;
  int v12;
  char *v13;
  _BYTE msg[36];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v5 = impl[13];
  if (v5)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 72));
    v6 = impl[13];
    *(float *)(v6 + 308) = a3;
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 72));
    return;
  }
  if ((*((_BYTE *)impl + 241) & 2) == 0)
  {
    v7 = *((_DWORD *)impl + 40);
    *(_OWORD *)&msg[20] = 0u;
    v15 = 0;
    *(_OWORD *)&msg[4] = 0u;
    *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
    *(float *)&msg[32] = a3;
    reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = v7;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(_QWORD *)&msg[16] = 0x9D1A00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x2Cu, reply_port, 0, 0);
    v10 = v9;
    if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
      if (!v10)
        return;
    }
    else if (v9)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 40318)
      {
        v10 = -300;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v10 = *(_DWORD *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return;
        }
      }
      else
      {
        v10 = -301;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      if (!v10)
        return;
    }
    if (v10 == 268435459)
    {
      *((_BYTE *)impl + 241) |= 2u;
    }
    else if (v10 == -81182719)
    {
      x_log_crash("Unentitled call to server!");
      abort();
    }
    if (x_log_hook_p())
    {
      mach_error_string(v10);
      x_log_();
    }
    else
    {
      v11 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
      {
        v12 = *((_DWORD *)impl + 1);
        v13 = mach_error_string(v10);
        *(_DWORD *)msg = 134218754;
        *(double *)&msg[4] = a3;
        *(_WORD *)&msg[12] = 1024;
        *(_DWORD *)&msg[14] = v12;
        *(_WORD *)&msg[18] = 1024;
        *(_DWORD *)&msg[20] = v10;
        *(_WORD *)&msg[24] = 2080;
        *(_QWORD *)&msg[26] = v13;
        _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_ERROR, "Failed to set EDR headroom=%g (client=0x%x) [0x%x %s]", msg, 0x22u);
      }
    }
  }
}

- (float)desiredDynamicRange
{
  void *impl;
  uint64_t v3;
  uint64_t v4;
  float v5;
  unsigned int v6;
  mach_port_t reply_port;
  mach_msg_return_t v8;
  mach_port_t msgh_remote_port;
  BOOL v10;
  NSObject *v11;
  mach_msg_size_t v12;
  char *v13;
  mach_msg_header_t msg[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v3 = *((_QWORD *)impl + 13);
  if (v3)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
    v4 = *((_QWORD *)impl + 13);
    v5 = *(float *)(v4 + 308);
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
    return v5;
  }
  v5 = 1.0;
  if ((*((_BYTE *)impl + 241) & 2) != 0)
    return v5;
  v6 = *((_DWORD *)impl + 40);
  *(_OWORD *)&msg[1].msgh_remote_port = 0u;
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v6);
  msg[0].msgh_bits = 5395;
  *(_QWORD *)&msg[0].msgh_voucher_port = 0x9D1900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(msg);
    reply_port = msg[0].msgh_local_port;
  }
  v8 = mach_msg(msg, 3, 0x18u, 0x30u, reply_port, 0, 0);
  msgh_remote_port = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg[0].msgh_local_port);
    if (!msgh_remote_port)
      return v5;
    goto LABEL_28;
  }
  if (!v8)
  {
    if (msg[0].msgh_id == 71)
    {
      msgh_remote_port = -308;
      goto LABEL_27;
    }
    if (msg[0].msgh_id != 40317)
    {
      msgh_remote_port = -301;
      goto LABEL_27;
    }
    if ((msg[0].msgh_bits & 0x80000000) == 0)
    {
      if (msg[0].msgh_size == 40)
      {
        if (!msg[0].msgh_remote_port)
        {
          msgh_remote_port = msg[1].msgh_remote_port;
          if (!msg[1].msgh_remote_port)
            return *(float *)&msg[1].msgh_local_port;
LABEL_27:
          mach_msg_destroy(msg);
          if (!msgh_remote_port)
            return v5;
          goto LABEL_28;
        }
      }
      else if (msg[0].msgh_size == 36)
      {
        if (msg[0].msgh_remote_port)
          v10 = 1;
        else
          v10 = msg[1].msgh_remote_port == 0;
        if (v10)
          msgh_remote_port = -300;
        else
          msgh_remote_port = msg[1].msgh_remote_port;
        goto LABEL_27;
      }
    }
    msgh_remote_port = -300;
    goto LABEL_27;
  }
  mig_dealloc_reply_port(msg[0].msgh_local_port);
LABEL_28:
  if (msgh_remote_port == 268435459)
  {
    *((_BYTE *)impl + 241) |= 2u;
  }
  else if (msgh_remote_port == -81182719)
  {
    x_log_crash("Unentitled call to server!");
    abort();
  }
  if (x_log_hook_p())
  {
    mach_error_string(msgh_remote_port);
    x_log_();
  }
  else
  {
    v11 = x_log_category_api;
    if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
    {
      v12 = *((_DWORD *)impl + 1);
      v13 = mach_error_string(msgh_remote_port);
      msg[0].msgh_bits = 67109634;
      msg[0].msgh_size = v12;
      LOWORD(msg[0].msgh_remote_port) = 1024;
      *(mach_port_t *)((char *)&msg[0].msgh_remote_port + 2) = msgh_remote_port;
      HIWORD(msg[0].msgh_local_port) = 2080;
      *(_QWORD *)&msg[0].msgh_voucher_port = v13;
      _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_ERROR, "Failed to query EDR headroom (client=0x%x) [0x%x %s]", (uint8_t *)msg, 0x18u);
    }
  }
  return v5;
}

- (BOOL)waitForRenderingWithTimeout:(double)a3
{
  int v4;
  _BOOL4 v5;

  if (a3 <= 0.0)
  {
    v4 = 0;
  }
  else if (a3 <= 2147483.0)
  {
    v4 = (int)(a3 * 1000.0);
  }
  else
  {
    v4 = 0x7FFFFFFF;
  }
  v5 = CA::Context::synchronize((CA::Context *)self->_impl, 0, v4, 0);
  if (v5)
    CA::Context::ping((CA::Context *)self->_impl);
  return v5;
}

- (BOOL)addFence:(id)a3 completionHandler:(id)a4
{
  CA::Transaction *v7;

  v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v7)
    v7 = (CA::Transaction *)CA::Transaction::create(0);
  return CA::Transaction::add_fence(v7, *((_DWORD *)self->_impl + 2), (uint64_t)a3, (uint64_t)a4);
}

- (void)setFencePort:(unsigned int)a3 commitHandler:(id)a4
{
  _QWORD *v6;
  unint64_t StatusReg;
  CA::Transaction *v8;
  _OWORD *v9;
  _QWORD *v10;

  v6 = +[CAFenceHandle _newEphemeralHandleWithPort:]((uint64_t)CAFenceHandle, a3);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(CA::Transaction **)(StatusReg + 576);
  v10 = v6;
  if (!v8)
  {
    v8 = (CA::Transaction *)CA::Transaction::create(0);
    v6 = v10;
  }
  if (CA::Transaction::add_fence(v8, *((_DWORD *)self->_impl + 2), (uint64_t)v6, 0))
  {
    v9 = *(_OWORD **)(StatusReg + 576);
    if (!v9)
      v9 = CA::Transaction::create(0);
    CA::Transaction::add_commit_handler((uint64_t)v9, a4, 3);
  }
  objc_msgSend(v10, "invalidate");

}

- (void)setFence:(unsigned int)a3 count:(unsigned int)a4
{
  NSLog(CFSTR("CoreAnimation: [CAContext setFence:count:] is deprecated. Ignoring!"), a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)invalidateFences
{
  _DWORD *impl;
  mach_port_t v3;
  mach_msg_return_t v4;
  mach_error_t v5;
  NSObject *v6;
  mach_msg_size_t v7;
  char *v8;
  mach_msg_header_t msg;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if ((*((_BYTE *)impl + 241) & 2) == 0)
  {
    v3 = impl[40];
    msg.msgh_size = 0;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    *(_QWORD *)&msg.msgh_voucher_port = 0x9D1200000000;
    if (MEMORY[0x1E0C85B60])
      voucher_mach_msg_set(&msg);
    v4 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
    if (v4)
    {
      v5 = v4;
      if (v4 == 268435459)
      {
        *((_BYTE *)impl + 241) |= 2u;
      }
      else if (v4 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(v5);
        x_log_();
      }
      else
      {
        v6 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          v7 = impl[1];
          v8 = mach_error_string(v5);
          msg.msgh_bits = 67109634;
          msg.msgh_size = v7;
          LOWORD(msg.msgh_remote_port) = 1024;
          *(mach_port_t *)((char *)&msg.msgh_remote_port + 2) = v5;
          HIWORD(msg.msgh_local_port) = 2080;
          *(_QWORD *)&msg.msgh_voucher_port = v8;
          _os_log_impl(&dword_184457000, v6, OS_LOG_TYPE_ERROR, "Failed to remove context from fences (client=0x%x) [0x%x %s]", (uint8_t *)&msg, 0x18u);
        }
      }
    }
  }
}

- (unsigned)createImageSlot:(CGSize)a3 hasAlpha:(BOOL)a4
{
  unsigned int v4;
  double height;
  double width;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  if (CADeviceUseCIF10::once != -1)
    dispatch_once(&CADeviceUseCIF10::once, &__block_literal_global_9735);
  return CA::Context::new_image_slot((CA::Context *)self->_impl, (CA::Render *)width, height, v4, CADeviceUseCIF10::enable_cif10);
}

- (unsigned)createImageSlot:(CGSize)a3 hasAlpha:(BOOL)a4 extendedColors:(BOOL)a5
{
  return CA::Context::new_image_slot((CA::Context *)self->_impl, (CA::Render *)a3.width, a3.height, a4, a5);
}

- (void)deleteSlot:(unsigned int)a3
{
  const void *v3;

  CA::Transaction::add_command((CA::Transaction *)0xC, *((_DWORD *)self->_impl + 2), a3, 0, v3);
}

- (void)transferSlot:(unsigned int)a3 toContextWithId:(unsigned int)a4
{
  _DWORD *impl;
  CFNumberRef v6;
  const void *v7;
  unsigned int valuePtr;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  valuePtr = a4;
  v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CA::Transaction::add_command((CA::Transaction *)0xD, impl[2], a3, v6, v7);
  CFRelease(v6);
}

- (unsigned)hitTestContext:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *impl;
  uint64_t v6;
  uint64_t v7;
  int v8;
  mach_port_t v9;
  mach_port_t reply_port;
  mach_msg_return_t v11;
  BOOL v12;
  NSObject *v13;
  int v14;
  char *v15;
  mach_msg_header_t msg;
  _BYTE v18[24];
  uint64_t v19;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v6 = *((_QWORD *)impl + 13);
  if (!v6)
  {
    if ((*((_BYTE *)impl + 241) & 2) != 0)
      return 0;
    v9 = *((_DWORD *)impl + 40);
    *(_QWORD *)v18 = *MEMORY[0x1E0C804E8];
    *(CGPoint *)&v18[8] = a3;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg.msgh_bits = 5395;
    msg.msgh_remote_port = v9;
    msg.msgh_local_port = reply_port;
    *(_QWORD *)&msg.msgh_voucher_port = 0x9D1B00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&msg);
      reply_port = msg.msgh_local_port;
    }
    v11 = mach_msg(&msg, 3, 0x30u, 0x30u, reply_port, 0, 0);
    v8 = v11;
    if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
      if (!v8)
        return v8;
      goto LABEL_28;
    }
    if (v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
LABEL_28:
      if (v8 == 268435459)
      {
        *((_BYTE *)impl + 241) |= 2u;
      }
      else if (v8 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        mach_error_string(v8);
        x_log_();
      }
      else
      {
        v13 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          v14 = *((_DWORD *)impl + 1);
          v15 = mach_error_string(v8);
          msg.msgh_bits = 134219010;
          *(CGFloat *)&msg.msgh_size = x;
          LOWORD(msg.msgh_local_port) = 2048;
          *(CGFloat *)((char *)&msg.msgh_local_port + 2) = y;
          HIWORD(msg.msgh_id) = 1024;
          *(_DWORD *)v18 = v14;
          *(_WORD *)&v18[4] = 1024;
          *(_DWORD *)&v18[6] = v8;
          *(_WORD *)&v18[10] = 2080;
          *(_QWORD *)&v18[12] = v15;
          _os_log_impl(&dword_184457000, v13, OS_LOG_TYPE_ERROR, "Failed to hit test (%g, %g) (client=0x%x) [0x%x %s]", (uint8_t *)&msg, 0x2Cu);
        }
      }
      return 0;
    }
    if (msg.msgh_id == 71)
    {
      v8 = -308;
      goto LABEL_27;
    }
    if (msg.msgh_id != 40319)
    {
      v8 = -301;
      goto LABEL_27;
    }
    if ((msg.msgh_bits & 0x80000000) == 0)
    {
      if (msg.msgh_size == 40)
      {
        if (!msg.msgh_remote_port)
        {
          v8 = *(_DWORD *)&v18[8];
          if (!*(_DWORD *)&v18[8])
            return *(_DWORD *)&v18[12];
LABEL_27:
          mach_msg_destroy(&msg);
          if (!v8)
            return v8;
          goto LABEL_28;
        }
      }
      else if (msg.msgh_size == 36)
      {
        if (msg.msgh_remote_port)
          v12 = 1;
        else
          v12 = *(_DWORD *)&v18[8] == 0;
        if (v12)
          v8 = -300;
        else
          v8 = *(_DWORD *)&v18[8];
        goto LABEL_27;
      }
    }
    v8 = -300;
    goto LABEL_27;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 72));
  v7 = *((_QWORD *)impl + 13);
  *(CGFloat *)&msg.msgh_bits = x;
  *(CGFloat *)&msg.msgh_remote_port = y;
  v8 = CA::Render::Context::hit_test_context(v7);
  pthread_mutex_unlock((pthread_mutex_t *)(*((_QWORD *)impl + 13) + 72));
  return v8;
}

- (NSString)annotation
{
  return (NSString *)*((_QWORD *)self->_impl + 29);
}

- (void)setAnnotation:(id)a3
{
  char *impl;
  const void *v5;
  CFStringRef Copy;

  impl = (char *)self->_impl;
  pthread_mutex_lock((pthread_mutex_t *)(impl + 16));
  v5 = (const void *)*((_QWORD *)impl + 29);
  if (v5)
    CFRelease(v5);
  if (a3)
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)a3);
  else
    Copy = 0;
  *((_QWORD *)impl + 29) = Copy;
  impl[241] |= 0x40u;
  pthread_mutex_unlock((pthread_mutex_t *)(impl + 16));
}

- (void)renderContext
{
  return (void *)*((_QWORD *)self->_impl + 13);
}

- (void)retainRenderContext
{
  return (void *)CA::Context::retain_render_ctx((CA::Context *)self->_impl);
}

- (void)contextImpl
{
  return self->_impl;
}

- (void)requestClientGlitch:(double)a3
{
  int v3;
  const void *v4;
  const void *v5;

  v3 = *((_DWORD *)self->_impl + 2);
  v4 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  CA::Transaction::add_command((CA::Transaction *)0x1A, v3, 0, v4, v5);
}

- (void)requestServerGlitch:(double)a3
{
  int v3;
  const void *v4;
  const void *v5;

  v3 = *((_DWORD *)self->_impl + 2);
  v4 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  CA::Transaction::add_command((CA::Transaction *)0x1B, v3, 0, v4, v5);
}

+ (id)allContexts
{
  id result;

  result = CA::Context::retain_objc_contexts((CA::Context *)a1);
  if (result)
    return result;
  return result;
}

+ (id)currentContext
{
  uint64_t v2;
  uint64_t v3;
  id *v4;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 40);
  if (!v3)
    return 0;
  v4 = (id *)(v3 + 80);
  if (*(_BYTE *)(v3 + 88))
    return objc_loadWeak(v4);
  else
    return *v4;
}

+ (id)localContext
{
  return (id)objc_msgSend(a1, "localContextWithOptions:", 0);
}

+ (id)localContextWithOptions:(id)a3
{
  return -[CAContext initWithOptions:localContext:]([CAContext alloc], "initWithOptions:localContext:", a3, 1);
}

+ (id)remoteContext
{
  return (id)objc_msgSend(a1, "remoteContextWithOptions:", 0);
}

+ (void)setClientPort:(unsigned int)a3
{
  CA::Context::_user_client_port = a3;
}

+ (void)setDrawInContextBlock:(id)a3
{
  if ((id)CA::Context::_draw_in_context_callback != a3)
  {
    _Block_release((const void *)CA::Context::_draw_in_context_callback);
    CA::Context::_draw_in_context_callback = (uint64_t)_Block_copy(a3);
  }
}

+ (id)drawInContextBlock
{
  return (id)CA::Context::_draw_in_context_callback;
}

+ (void)setFinalizeContextBlock:(id)a3
{
  if ((id)CA::Context::_finalize_context_callback != a3)
  {
    _Block_release((const void *)CA::Context::_finalize_context_callback);
    CA::Context::_finalize_context_callback = (uint64_t)_Block_copy(a3);
  }
}

+ (id)finalizeContextBlock
{
  return (id)CA::Context::_finalize_context_callback;
}

+ (void)setCreateCacheBlock:(id)a3
{
  if ((id)CA::Context::_create_cache_callback != a3)
  {
    _Block_release((const void *)CA::Context::_create_cache_callback);
    CA::Context::_create_cache_callback = (uint64_t)_Block_copy(a3);
  }
}

+ (id)createCacheBlock
{
  return (id)CA::Context::_create_cache_callback;
}

@end
