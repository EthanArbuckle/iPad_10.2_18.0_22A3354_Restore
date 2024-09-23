@implementation CAContentStream

- (BOOL)setIncludedContexts:(id)a3 error:(id *)a4
{
  _BOOL4 started;
  unordered_map<unsigned int, unsigned int, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned int>>> *p_includedContexts;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  started = self->_started;
  if (self->_started)
  {
    stream_active_error(a4);
  }
  else
  {
    p_includedContexts = &self->_includedContexts;
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear(&self->_includedContexts.__table_.__bucket_list_.__ptr_.__value_);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(a3);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "unsignedIntValue");
          std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int,unsigned int>((uint64_t)p_includedContexts, v11, v11, 0);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v8);
    }
  }
  return !started;
}

- (BOOL)setExcludedContexts:(id)a3 error:(id *)a4
{
  _BOOL4 started;
  unordered_map<unsigned int, unsigned int, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned int>>> *p_excludedContexts;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  started = self->_started;
  if (self->_started)
  {
    stream_active_error(a4);
  }
  else
  {
    p_excludedContexts = &self->_excludedContexts;
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear(&self->_excludedContexts.__table_.__bucket_list_.__ptr_.__value_);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(a3);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "unsignedIntValue");
          std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int,unsigned int>((uint64_t)p_excludedContexts, v11, v11, 0);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v8);
    }
  }
  return !started;
}

- (id)copyOptions
{
  return (id)-[CAContentStreamOptions copy](self->_options, "copy");
}

- (BOOL)updateOptions:(id)a3 error:(id *)a4
{
  unsigned int v7;
  unsigned int v8;
  CFStringRef Name;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  size_t NumberOfComponents;
  float64x2_t *Components;
  int16x8_t v34;
  float64x2_t v35;
  BOOL v41;
  char v43;
  pid_t v44;
  pid_t v45;
  unsigned int v46;
  unsigned int v47;
  float v48;
  char v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int serverPort;
  unsigned int port;
  int v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  pid_t v58;
  unsigned int v59;
  int16x8_t v60;
  int16x8_t v61;
  double v62;
  unsigned int v63;
  double v64;
  char v65;
  double v66;
  char v67;
  __int16 v68;
  char v69;
  char v70;
  unsigned __int8 v71;
  __int128 v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  float v82;
  __int16 v83;
  char v84;
  char v85;
  char v86;
  unsigned __int32 v87;
  char v88;
  char v89;
  char v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (self->_started)
  {
    stream_active_error(a4);
    return 0;
  }
  if (!validate_options((CAContentStreamOptions *)a3, (NSError **)a4))
    return 0;
  v7 = objc_msgSend(a3, "targetDisplayId");
  v8 = objc_msgSend(a3, "pixelFormat");
  Name = CGColorSpaceGetName((CGColorSpaceRef)objc_msgSend(a3, "colorSpaceKey"));
  v71 = 0;
  get_colorspace_map(&v71);
  if (v71)
  {
    v10 = 0;
    while ((CFStringRef)get_colorspace_map(unsigned char *)::space_names[v10] != Name)
    {
      if (v71 == ++v10)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    LOBYTE(v10) = 0;
  }
  v70 = objc_msgSend(a3, "YCbCrMatrix");
  v69 = objc_msgSend(a3, "ChromaLocation");
  objc_msgSend(a3, "frameSize");
  v12 = v11;
  objc_msgSend(a3, "frameSize");
  v66 = v13;
  objc_msgSend(a3, "minimumFrameTime");
  v64 = v14;
  v68 = objc_msgSend(a3, "queueDepth");
  if (objc_msgSend(a3, "alwaysScaleToFit"))
    v15 = 2;
  else
    v15 = 0;
  v16 = objc_msgSend(a3, "preserveAspectRatioKey");
  objc_msgSend(a3, "sourceRect");
  v62 = v17;
  objc_msgSend(a3, "sourceRect");
  v19 = v18;
  objc_msgSend(a3, "sourceRect");
  v21 = v20;
  objc_msgSend(a3, "sourceRect");
  v23 = v22;
  objc_msgSend(a3, "destinationRect");
  v25 = v24;
  objc_msgSend(a3, "destinationRect");
  v27 = v26;
  objc_msgSend(a3, "destinationRect");
  v29 = v28;
  objc_msgSend(a3, "destinationRect");
  v31 = v30;
  if (objc_msgSend(a3, "backgroundColorKey"))
  {
    NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(a3, "backgroundColorKey"));
    Components = (float64x2_t *)CGColorGetComponents((CGColorRef)objc_msgSend(a3, "backgroundColorKey"));
    v34 = 0uLL;
    if (NumberOfComponents >= 4 && Components)
    {
      v35 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
      __asm { FMOV            V3.2D, #0.5 }
      v34 = (int16x8_t)vcvtq_s64_f64(vmlaq_f64(_Q3, v35, *Components));
      *(int16x4_t *)v34.i8 = vuzp1_s16((int16x4_t)vmovn_s64((int64x2_t)v34), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q3, v35, Components[1]))));
    }
  }
  else
  {
    v34 = 0uLL;
  }
  if (self->_options)
  {
    v43 = 0;
    v44 = 0;
  }
  else
  {
    v60 = v34;
    v45 = getpid();
    v43 = 1;
    v34 = v60;
    v44 = v45;
  }
  v46 = v12;
  v47 = v66;
  v48 = v64;
  v49 = v15 | v16;
  v50 = v62;
  v51 = v31;
  serverPort = self->_serverPort;
  port = self->_clientIPC._port;
  v54 = CA::MachPortUtil::task_identity_port(void)::task;
  if (!CA::MachPortUtil::task_identity_port(void)::task)
  {
    v63 = self->_serverPort;
    v58 = v44;
    v59 = self->_clientIPC._port;
    v61 = v34;
    v67 = v43;
    v65 = v49;
    v56 = v47;
    v57 = v46;
    task_create_identity_token(*MEMORY[0x1E0C83DA0], (task_id_token_t *)&CA::MachPortUtil::task_identity_port(void)::task);
    v51 = v31;
    v47 = v56;
    v46 = v57;
    v44 = v58;
    port = v59;
    serverPort = v63;
    v49 = v65;
    v43 = v67;
    v34 = v61;
    v54 = CA::MachPortUtil::task_identity_port(void)::task;
  }
  *(_QWORD *)&v72 = __PAIR64__(v7, v44);
  *((_QWORD *)&v72 + 1) = __PAIR64__(v46, v8);
  v73 = v47;
  v74 = v50;
  v75 = v19;
  v76 = v21;
  v77 = v23;
  v78 = v25;
  v79 = v27;
  v80 = v29;
  v81 = v51;
  v82 = v48;
  v83 = v68;
  v84 = v10;
  v85 = v70;
  v86 = v69;
  v87 = vmovn_s16(v34).u32[0];
  v88 = v43;
  v89 = v49;
  v90 = 0;
  v55 = _CASContentStreamModify(serverPort, port, v54, &v72);
  v41 = (_DWORD)v55 == 0;
  if ((_DWORD)v55)
    server_error(a4, v55);

  self->_options = (CAContentStreamOptions *)objc_msgSend(a3, "copy");
  -[CAContentStream clearSeenSurfaces](self, "clearSeenSurfaces");
  return v41;
}

- (BOOL)start:(id *)a3
{
  BOOL v4;
  _DWORD *next;
  int value;
  int v9;
  unint64_t v10;
  _QWORD *i;
  _QWORD *j;
  uint64_t started;
  void *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  _OWORD *v18;
  uint64_t v19;
  _OWORD v20[8];
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (self->_started)
  {
    stream_active_error(a3);
    return 0;
  }
  next = self->_excludedContexts.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (!std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&self->_includedContexts.__table_.__bucket_list_.__ptr_.__value_, next[4]))
    {
      next = *(_DWORD **)next;
      if (!next)
        goto LABEL_8;
    }
    if (!a3)
      return 0;
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Cannot include and exclude the same context");
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
    goto LABEL_21;
  }
LABEL_8:
  value = self->_includedContexts.__table_.__p2_.__value_;
  v9 = self->_excludedContexts.__table_.__p2_.__value_;
  v10 = (v9 + value);
  if (!(v9 + value))
  {
    if (!a3)
      return 0;
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("Empty context list");
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
LABEL_21:
    v4 = 0;
    *a3 = v14;
    return v4;
  }
  memset(v20, 0, sizeof(v20));
  v16 = v20;
  v17 = (char *)v20;
  v18 = v20;
  v19 = 32;
  if (v10 >= 0x21)
    X::small_vector_base<unsigned int>::grow((int **)&v16, v10);
  for (i = self->_includedContexts.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v15 = i[2];
    X::small_vector_base<unsigned int>::push_back((uint64_t)&v16, &v15);
  }
  for (j = self->_excludedContexts.__table_.__p1_.__value_.__next_; j; j = (_QWORD *)*j)
  {
    v15 = j[2];
    X::small_vector_base<unsigned int>::push_back((uint64_t)&v16, &v15);
  }
  started = _CASContentStreamStartStop(self->_serverPort, self->_clientIPC._port, 1, (uint64_t)v16, (unint64_t)(v17 - (_BYTE *)v16) >> 2, value, v9);
  v4 = (_DWORD)started == 0;
  if ((_DWORD)started)
    server_error(a3, started);
  else
    self->_started = 1;
  if (v16 != v18)
    free(v16);
  return v4;
}

- (BOOL)stop:(id *)a3
{
  uint64_t started;
  void *v6;
  BOOL result;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!self->_started)
  {
    if (a3)
    {
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = CFSTR("Stream already stopped");
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
      result = 0;
      *a3 = v6;
      return result;
    }
    return 0;
  }
  started = _CASContentStreamStartStop(self->_serverPort, self->_clientIPC._port, 0, 0, 0, 0, 0);
  if ((_DWORD)started)
  {
    server_error(a3, started);
    return 0;
  }
  self->_started = 0;
  return 1;
}

- (void)produceSurface:(unsigned int)a3 withFrameInfo:(const CA_content_stream_frame_info *)a4
{
  SpinLock *p_callback_lock;
  ContentStreamClientFrame *begin;
  ContentStreamClientFrame *end;
  __IOSurface *v10;
  IOSurfaceID v11;
  ContentStreamClientFrame *v12;
  unint64_t v13;
  uint64_t id;
  __IOSurface *iosurface;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *queue;
  NSObject *v20;
  _QWORD block[7];
  uint8_t buf[4];
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_callback_lock = &self->_callback_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_callback_lock);
  if (self->_queue && self->_handler)
  {
    if (!a3)
    {
      iosurface = 0;
      id = 0;
      goto LABEL_15;
    }
    begin = self->_seen_surfaces._begin;
    end = self->_seen_surfaces._end;
    if (begin != end)
    {
      while (begin->port != a3)
      {
        if (++begin == end)
        {
          begin = self->_seen_surfaces._end;
          break;
        }
      }
    }
    if (begin != end)
    {
LABEL_13:
      id = begin->id;
      iosurface = begin->iosurface;
LABEL_15:
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setSurfaceId:", id);
      objc_msgSend(v16, "setSurface:", iosurface);
      objc_msgSend(v16, "setStatus:", a4->var1);
      objc_msgSend(v16, "setDisplayTime:", a4->var0);
      objc_msgSend(v16, "setDropCount:", a4->var2);
      LOBYTE(v17) = a4->var9;
      objc_msgSend(v16, "setDisplayResolution:", (double)v17);
      objc_msgSend(v16, "setContentScaleX:", a4->var3);
      objc_msgSend(v16, "setContentScaleY:", a4->var4);
      objc_msgSend(v16, "setContentRect:", a4->var5, a4->var6, a4->var7, a4->var8);
      v18 = _Block_copy(self->_handler);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__CAContentStream_produceSurface_withFrameInfo___block_invoke;
      block[3] = &unk_1E15ABC50;
      block[5] = v16;
      block[6] = v18;
      block[4] = self;
      dispatch_async(queue, block);
      goto LABEL_16;
    }
    v10 = IOSurfaceLookupFromMachPort(a3);
    if (v10)
    {
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a3, 0, 1);
      v11 = IOSurfaceGetID(v10);
      v12 = self->_seen_surfaces._end;
      v13 = v12 - self->_seen_surfaces._begin + 1;
      if (self->_seen_surfaces._capacity < v13)
      {
        X::small_vector_base<ContentStreamClientFrame>::grow((uint64_t)&self->_seen_surfaces, v13);
        v12 = self->_seen_surfaces._end;
      }
      v12->iosurface = v10;
      v12->id = v11;
      v12->port = a3;
      begin = self->_seen_surfaces._end;
      self->_seen_surfaces._end = begin + 1;
      goto LABEL_13;
    }
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v20 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v23 = a3;
        _os_log_impl(&dword_184457000, v20, OS_LOG_TYPE_ERROR, "Failed to create surface from machport %u", buf, 8u);
      }
    }
  }
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)p_callback_lock);
}

- (BOOL)releaseSurfaceWithId:(unsigned int)a3 error:(id *)a4
{
  unsigned int serverPort;
  unsigned int port;
  mach_port_t reply_port;
  uint64_t v8;
  uint64_t v9;
  _BYTE msg[36];
  int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    serverPort = self->_serverPort;
    port = self->_clientIPC._port;
    *(_OWORD *)&msg[20] = 0u;
    *(_OWORD *)&msg[4] = 0u;
    *(_DWORD *)&msg[24] = 1;
    *(_DWORD *)&msg[28] = port;
    v12 = 1245184;
    v13 = *MEMORY[0x1E0C804E8];
    v14 = a3;
    reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = serverPort;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = -2147478253;
    *(_QWORD *)&msg[16] = 0x9D3B00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v8 = mach_msg((mach_msg_header_t *)msg, 3, 0x34u, 0x2Cu, reply_port, 0, 0);
    v9 = v8;
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 40351)
      {
        v9 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v9 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 1;
        }
      }
      else
      {
        v9 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
    }
    server_error(a4, v9);
  }
  return 0;
}

- (BOOL)releaseSurface:(__IOSurface *)a3 error:(id *)a4
{
  return a3
      && -[CAContentStream releaseSurfaceWithId:error:](self, "releaseSurfaceWithId:error:", IOSurfaceGetID(a3), a4);
}

- (void)clearSeenSurfaces
{
  ContentStreamClientFrame *begin;
  ContentStreamClientFrame *end;
  ipc_space_t *v5;
  mach_port_name_t port;
  __IOSurface *iosurface;

  begin = self->_seen_surfaces._begin;
  end = self->_seen_surfaces._end;
  if (begin != end)
  {
    v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    do
    {
      port = begin->port;
      if (port)
        mach_port_deallocate(*v5, port);
      iosurface = begin->iosurface;
      ++begin;
      CFRelease(iosurface);
    }
    while (begin != end);
    begin = self->_seen_surfaces._begin;
  }
  self->_seen_surfaces._end = begin;
}

- (unsigned)streamId
{
  return self->_clientIPC._port;
}

- (void)dealloc
{
  unsigned int v3;
  unsigned int serverPort;
  unsigned int port;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *queue;
  CAContentStream **v11;
  uint64_t v12;
  objc_super v13;
  uint8_t buf[4];
  int v15;
  _DWORD v16[2];
  __int128 v17;
  __int128 v18;
  _BYTE v19[26];
  __int16 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  memset(v19, 0, 25);
  v3 = -[CAContentStreamOptions targetDisplayId](self->_options, "targetDisplayId");
  serverPort = self->_serverPort;
  port = self->_clientIPC._port;
  v6 = CA::MachPortUtil::task_identity_port(void)::task;
  if (!CA::MachPortUtil::task_identity_port(void)::task)
  {
    task_create_identity_token(*MEMORY[0x1E0C83DA0], (task_id_token_t *)&CA::MachPortUtil::task_identity_port(void)::task);
    v6 = CA::MachPortUtil::task_identity_port(void)::task;
  }
  v16[0] = 0;
  v16[1] = v3;
  v19[25] = 2;
  v20 = 0;
  v7 = _CASContentStreamModify(serverPort, port, v6, (__int128 *)v16);
  if ((_DWORD)v7)
  {
    v8 = v7;
    if (x_log_hook_p())
    {
      v12 = v8;
      x_log_();
    }
    else
    {
      v9 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v15 = v8;
        _os_log_impl(&dword_184457000, v9, OS_LOG_TYPE_ERROR, "Failed to destroy server-side content stream %u", buf, 8u);
      }
    }
  }
  CA::MachPortUtil::ClientIPC::destroy((CA::MachPortUtil::ClientIPC *)&self->_clientIPC);

  os_unfair_lock_lock((os_unfair_lock_t)&self->_callback_lock);
  _Block_release(self->_handler);
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  -[CAContentStream clearSeenSurfaces](self, "clearSeenSurfaces", v12);
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_callback_lock);
  os_unfair_lock_lock((os_unfair_lock_t)&_all_streams_lock);
  v11 = (CAContentStream **)_all_streams;
  if (_all_streams != (_UNKNOWN *)qword_1EDD10C78)
  {
    while (*v11 != self)
    {
      if (++v11 == (CAContentStream **)qword_1EDD10C78)
      {
        v11 = (CAContentStream **)qword_1EDD10C78;
        break;
      }
    }
  }
  if (v11 != (CAContentStream **)qword_1EDD10C78)
  {
    *v11 = *(CAContentStream **)(qword_1EDD10C78 - 8);
    if (qword_1EDD10C78 <= (unint64_t)_all_streams)
      __assert_rtn("pop_back", "x-small-vector.h", 410, "_end > _begin && \"pop_back on empty container\");
    qword_1EDD10C78 -= 8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_streams_lock);
  v13.receiver = self;
  v13.super_class = (Class)CAContentStream;
  -[CAContentStream dealloc](&v13, sel_dealloc);
}

- (void).cxx_destruct
{
  ContentStreamClientFrame *begin;

  begin = self->_seen_surfaces._begin;
  if (begin != self->_seen_surfaces._fixedStorage)
    free(begin);
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&self->_excludedContexts);
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&self->_includedContexts);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_QWORD *)self + 12) = (char *)self + 128;
  *((_QWORD *)self + 13) = (char *)self + 128;
  *((_QWORD *)self + 14) = (char *)self + 128;
  *((_QWORD *)self + 15) = 8;
  *((_DWORD *)self + 66) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_DWORD *)self + 73) = 0;
  return self;
}

void __48__CAContentStream_produceSurface_withFrameInfo___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_release(*(const void **)(a1 + 48));

}

+ (id)contentStreamWithOptions:(id)a3 queue:(id)a4 handler:(id)a5 error:(id *)a6
{
  NSObject **v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject ***v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (!a4 || !a5)
  {
    if (a6)
    {
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = CFSTR("Invalid handler");
      v11 = 0;
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1));
      return v11;
    }
    return 0;
  }
  if (!validate_options((CAContentStreamOptions *)a3, (NSError **)a6))
    return 0;
  v11 = (NSObject **)objc_alloc_init((Class)a1);
  if (!v11)
    return v11;
  *((_DWORD *)v11 + 64) = CARenderServerGetServerPort(0);
  v12 = CA::MachPortUtil::ClientIPC::create((mach_port_context_t)(v11 + 33), "CAContentStreamClientHandler");
  if ((_DWORD)v12)
  {
    if (a6)
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating client ports! 0x%x"), v12);
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = v13;
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    }

    return 0;
  }
  if ((objc_msgSend(v11, "updateOptions:error:", a3, a6) & 1) == 0)
  {

    return 0;
  }
  *((_BYTE *)v11 + 288) = 0;
  v11[38] = _Block_copy(a5);
  dispatch_retain((dispatch_object_t)a4);
  v11[37] = a4;
  v14 = v11[35];
  if (v14)
    dispatch_activate(v14);
  os_unfair_lock_lock((os_unfair_lock_t)&_all_streams_lock);
  v16 = _all_streams;
  v15 = (NSObject ***)qword_1EDD10C78;
  v17 = (qword_1EDD10C78 - (uint64_t)_all_streams) >> 3;
  if (qword_1EDD10C88 < (unint64_t)(v17 + 1))
  {
    v18 = qword_1EDD10C80;
    v19 = (qword_1EDD10C88 + 1) | ((unint64_t)(qword_1EDD10C88 + 1) >> 1) | (((qword_1EDD10C88 + 1) | ((unint64_t)(qword_1EDD10C88 + 1) >> 1)) >> 2);
    v20 = v19 | (v19 >> 4) | ((v19 | (v19 >> 4)) >> 8);
    v21 = v20 | (v20 >> 16) | ((v20 | (v20 >> 16)) >> 32);
    if (v21 + 1 > v17 + 1)
      v22 = v21 + 1;
    else
      v22 = v17 + 1;
    v23 = (char *)malloc_type_malloc(8 * v22, 0x80040B8603338uLL);
    v24 = v23;
    v25 = (uint64_t *)_all_streams;
    v26 = qword_1EDD10C78;
    if (_all_streams != (_UNKNOWN *)qword_1EDD10C78)
    {
      v27 = v23;
      do
      {
        v28 = *v25++;
        *(_QWORD *)v27 = v28;
        v27 += 8;
      }
      while (v25 != (uint64_t *)v26);
    }
    if (v16 != (void *)v18)
      free(_all_streams);
    v15 = (NSObject ***)&v24[8 * v17];
    _all_streams = v24;
    qword_1EDD10C78 = (uint64_t)v15;
    qword_1EDD10C88 = v22;
  }
  *v15 = v11;
  qword_1EDD10C78 += 8;
  v11 = v11;
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_streams_lock);
  return v11;
}

@end
