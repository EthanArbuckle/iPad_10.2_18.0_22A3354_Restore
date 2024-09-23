@implementation CAFlipBook

- (id)renderForTime:(unint64_t)a3 options:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  _BOOL4 v10;
  _BOOL4 v11;
  unsigned int serverPort;
  unsigned int displayId;
  unsigned int v14;
  int v15;
  mach_port_t reply_port;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int128 v22;
  uint64_t v23;
  mach_port_name_t v24;
  int v25;
  IOSurfaceRef v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  uint64_t v32;
  CAFlipBookFrame *v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE msg[36];
  __int128 v46;
  __int128 v47;
  unsigned __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = -[CAFlipBook wantsTransform](self, "wantsTransform", a3, a4);
  v11 = -[CAFlipBook isInverted](self, "isInverted");
  serverPort = self->_serverPort;
  displayId = self->_displayId;
  v14 = -[CAFlipBook contextId](self, "contextId");
  if (v10)
    v15 = 2;
  else
    v15 = 0;
  *(_OWORD *)&msg[20] = 0u;
  v46 = 0u;
  v50 = 0;
  v49 = 0u;
  v48 = 0u;
  v47 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = displayId;
  LODWORD(v46) = v14;
  *(_QWORD *)((char *)&v46 + 4) = a3;
  HIDWORD(v46) = v15 | v11;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = serverPort;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x9D3300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v17 = mach_msg((mach_msg_header_t *)msg, 3, 0x34u, 0x6Cu, reply_port, 0, 0);
  v18 = v17;
  if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
LABEL_29:
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IPC Error %d"), v18);
    v28 = (void *)objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreanimation.flipbook"), 6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v29 = 0;
    *a6 = v28;
    return v29;
  }
  if ((_DWORD)v17)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_29;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v18 = 4294966988;
LABEL_28:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_29;
  }
  if (*(_DWORD *)&msg[20] != 40343)
  {
    v18 = 4294966995;
    goto LABEL_28;
  }
  if ((*(_DWORD *)msg & 0x80000000) == 0)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      v18 = 4294966996;
      if (*(_DWORD *)&msg[32])
      {
        if (*(_DWORD *)&msg[8])
          v18 = 4294966996;
        else
          v18 = *(unsigned int *)&msg[32];
      }
      goto LABEL_28;
    }
LABEL_27:
    v18 = 4294966996;
    goto LABEL_28;
  }
  v18 = 4294966996;
  if (*(_DWORD *)&msg[24] != 1 || *(_DWORD *)&msg[4] != 100 || *(_DWORD *)&msg[8])
    goto LABEL_28;
  if (WORD1(v46) << 16 != 1114112)
    goto LABEL_27;
  v19 = v47;
  self->_lastFrameId = *((_QWORD *)&v47 + 1);
  v22 = v48;
  v20 = v22 >> 64;
  v21 = v22;
  v23 = HIDWORD(v46);
  v24 = *(_DWORD *)&msg[28];
  v25 = v49;
  v39 = DWORD2(v49);
  v40 = DWORD1(v49);
  v38 = HIDWORD(v49);
  if (*(_DWORD *)&msg[28])
  {
    v26 = IOSurfaceLookupFromMachPort(*(mach_port_t *)&msg[28]);
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v24);
  }
  else
  {
    v26 = 0;
  }
  if ((_DWORD)v23)
  {
    if (a6)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      if (v23 > 6)
        v32 = 0;
      else
        v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", status_to_string::status_codes[v23]);
      v42 = v32;
      v37 = (void *)objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreanimation.flipbook"), v23, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
      v29 = 0;
      *a6 = v37;
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    if (!v19)
      __assert_rtn("-[CAFlipBook renderForTime:options:userInfo:error:]", "CAFlipBook.mm", 305, "frameId != 0");
    -[CAFlipBook _collectFlipBookFrames](self, "_collectFlipBookFrames");
    v33 = [CAFlipBookFrame alloc];
    LODWORD(v35) = HIDWORD(v21);
    LODWORD(v34) = v21;
    v36 = -[CAFlipBookFrame _initWithPresentationTime:frameId:generation:apl:aplDimming:memoryUsage:inverted:userInfo:](v33, "_initWithPresentationTime:frameId:generation:apl:aplDimming:memoryUsage:inverted:userInfo:", a3, v19, self->_generation, v20, self->_inverted, a5, v34, v35);
    objc_msgSend(v36, "setRawSurface:", v26);
    objc_msgSend(v36, "setRawSurfaceFrame:", (double)v25, (double)v40, (double)v39, (double)v38);
    -[NSMutableArray addObject:](self->_frames, "addObject:", v36);
    v29 = v36;
  }
  if (v26)
    CFRelease(v26);
  return v29;
}

- (id)frameAtTime:(unint64_t)a3
{
  unsigned int serverPort;
  unsigned int displayId;
  mach_port_t reply_port;
  mach_msg_return_t v7;
  int v8;
  id result;
  BOOL v10;
  uint64_t v11;
  _BYTE msg[36];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  serverPort = self->_serverPort;
  displayId = self->_displayId;
  *(_OWORD *)&msg[20] = 0u;
  v13 = 0u;
  v14 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = displayId;
  *(_QWORD *)&v13 = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = serverPort;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x9D3400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3, 0x2Cu, 0x3Cu, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return 0;
  }
  if (!v7)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v8 = -308;
    }
    else if (*(_DWORD *)&msg[20] == 40344)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 52)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v8 = *(_DWORD *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              v11 = v13;
              self->_lastFrameId = *((_QWORD *)&v13 + 1);
              goto LABEL_26;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v10 = 1;
          else
            v10 = *(_DWORD *)&msg[32] == 0;
          if (v10)
            v8 = -300;
          else
            v8 = *(_DWORD *)&msg[32];
          goto LABEL_23;
        }
      }
      v8 = -300;
    }
    else
    {
      v8 = -301;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_24;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_24:
  result = 0;
  if (v8)
    return result;
  v11 = 0;
LABEL_26:
  -[CAFlipBook _collectFlipBookFrames](self, "_collectFlipBookFrames");
  return -[CAFlipBook _frameById:](self, "_frameById:", v11);
}

- (id)copyCurrentFrame
{
  unsigned int serverPort;
  unsigned int displayId;
  mach_port_t reply_port;
  mach_msg_return_t v6;
  mach_port_name_t v7;
  uint64_t v8;
  IOSurfaceRef v9;
  id v10;
  CAFlipBookFrame *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  id v24;
  int msg;
  _BYTE msg_4[60];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  serverPort = self->_serverPort;
  displayId = self->_displayId;
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg_4[28] = displayId;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = serverPort;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x9D3600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    reply_port = *(_DWORD *)&msg_4[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (v6)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (*(_DWORD *)&msg_4[16] != 40346
    || (msg & 0x80000000) == 0
    || *(_DWORD *)&msg_4[20] != 1
    || *(_DWORD *)msg_4 != 56
    || *(_DWORD *)&msg_4[4]
    || *(unsigned __int16 *)&msg_4[34] << 16 != 1114112)
  {
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return 0;
  }
  v7 = *(_DWORD *)&msg_4[24];
  if (!*(_DWORD *)&msg_4[24])
    return 0;
  v8 = *(_QWORD *)&msg_4[44];
  v9 = IOSurfaceLookupFromMachPort(*(mach_port_t *)&msg_4[24]);
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v7);
  if (!v9)
    return 0;
  v10 = -[CAFlipBook _frameById:](self, "_frameById:", v8);
  if (v10)
  {
    v11 = [CAFlipBookFrame alloc];
    v12 = objc_msgSend(v10, "presentationTime");
    v13 = objc_msgSend(v10, "frameId");
    v14 = objc_msgSend(v10, "generation");
    objc_msgSend(v10, "apl");
    v16 = v15;
    objc_msgSend(v10, "aplDimming");
    v18 = v17;
    v19 = objc_msgSend(v10, "memoryUsage");
    v20 = objc_msgSend(v10, "isInverted");
    v21 = objc_msgSend(v10, "userInfo");
    LODWORD(v22) = v16;
    LODWORD(v23) = v18;
    v24 = -[CAFlipBookFrame _initWithPresentationTime:frameId:generation:apl:aplDimming:memoryUsage:inverted:userInfo:](v11, "_initWithPresentationTime:frameId:generation:apl:aplDimming:memoryUsage:inverted:userInfo:", v12, v13, v14, v19, v20, v21, v22, v23);
    objc_msgSend(v24, "setRawSurface:", objc_msgSend(v10, "rawSurface"));
    objc_msgSend(v10, "rawSurfaceFrame");
    objc_msgSend(v24, "setRawSurfaceFrame:");
    objc_msgSend(v24, "setSurface:", v9);
  }
  else
  {
    v24 = 0;
  }
  CFRelease(v9);
  return v24;
}

- (id)activeFrames
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = mach_continuous_time();
  v4 = 0;
  if (-[NSMutableArray count](self->_frames, "count"))
  {
    while (1)
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](self->_frames, "objectAtIndex:", v4);
      if (objc_msgSend(v5, "presentationTime") > v3
        && objc_msgSend(v5, "generation") == self->_generation)
      {
        break;
      }
      if (++v4 >= (unint64_t)-[NSMutableArray count](self->_frames, "count"))
        goto LABEL_7;
    }
    if (!v4)
      return (id)-[NSMutableArray subarrayWithRange:](self->_frames, "subarrayWithRange:", v4, -[NSMutableArray count](self->_frames, "count") - v4);
LABEL_7:
    if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_frames, "objectAtIndex:", v4 - 1), "generation") == self->_generation)--v4;
  }
  return (id)-[NSMutableArray subarrayWithRange:](self->_frames, "subarrayWithRange:", v4, -[NSMutableArray count](self->_frames, "count") - v4);
}

- (unint64_t)memoryUsage
{
  unsigned int serverPort;
  unsigned int displayId;
  mach_port_t reply_port;
  mach_msg_return_t v5;
  _BYTE msg[36];
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  serverPort = self->_serverPort;
  displayId = self->_displayId;
  *(_OWORD *)&msg[20] = 0u;
  v8 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = displayId;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = serverPort;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x9D3500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x34u, reply_port, 0, 0);
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else if (v5)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (*(_DWORD *)&msg[20] == 40345
      && (*(_DWORD *)msg & 0x80000000) == 0
      && *(_DWORD *)&msg[4] == 44
      && !*(_DWORD *)&msg[8]
      && !*(_DWORD *)&msg[32])
    {
      return v8;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return 0;
}

- (id)cancel
{
  unint64_t v3;
  unsigned int serverPort;
  unsigned int displayId;
  mach_port_t reply_port;
  mach_msg_return_t v7;
  uint64_t v8;
  mach_port_name_t v9;
  IOSurfaceRef v10;
  id v11;
  int msg;
  _BYTE msg_4[60];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[CAFlipBook maximumMemoryUsageForDiagnostics](self, "maximumMemoryUsageForDiagnostics");
  serverPort = self->_serverPort;
  displayId = self->_displayId;
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg_4[28] = displayId;
  msg_4[32] = v3 != 0;
  *(_WORD *)&msg_4[33] = 0;
  msg_4[35] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = serverPort;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x9D3700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    reply_port = *(_DWORD *)&msg_4[8];
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x28u, 0x40u, reply_port, 0, 0);
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (v7)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (*(_DWORD *)&msg_4[16] != 40347
    || (msg & 0x80000000) == 0
    || *(_DWORD *)&msg_4[20] != 1
    || *(_DWORD *)msg_4 != 56
    || *(_DWORD *)&msg_4[4]
    || *(unsigned __int16 *)&msg_4[34] << 16 != 1114112)
  {
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return 0;
  }
  v8 = *(_QWORD *)&msg_4[44];
  v9 = *(_DWORD *)&msg_4[24];
  if (*(_DWORD *)&msg_4[24])
  {
    v10 = IOSurfaceLookupFromMachPort(*(mach_port_t *)&msg_4[24]);
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = -[CAFlipBook _frameById:](self, "_frameById:", v8);
  if (v11)
  {
    -[NSMutableArray removeAllObjects](self->_frames, "removeAllObjects");
    -[NSMutableArray addObject:](self->_frames, "addObject:", v11);
    objc_msgSend(v11, "setSurface:", v10);
  }
  ++self->_generation;
  if (v10)
    CFRelease(v10);
  return v11;
}

- (void)collect
{
  _CASFlipBookModify(self->_serverPort, self->_displayId, 1, 0);
}

- (void)purge
{
  _CASFlipBookModify(self->_serverPort, self->_displayId, 2, 0);
}

- (void)setPowerSavingEnabled:(BOOL)a3
{
  self->_powerSavingEnabled = a3;
}

- (void)setOneHzFlipBook:(BOOL)a3
{
  self->_oneHzFlipBook = a3;
}

- (void)setCachesFramesOnExit:(BOOL)a3
{
  self->_cachesFramesOnExit = a3;
  _CASFlipBookModify(self->_serverPort, self->_displayId, 5, a3);
}

- (void)dealloc
{
  mach_port_name_t serverPort;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[CAFlipBook purge](self, "purge");
  serverPort = self->_serverPort;
  if (serverPort + 1 >= 2)
  {
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], serverPort);
    self->_serverPort = 0;
  }

  self->_frames = 0;
  v4.receiver = self;
  v4.super_class = (Class)CAFlipBook;
  -[CAFlipBook dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CAFlipBook: maximumSize %zu, generation %u, contextId 0x%x>"), self->_maximumSize, self->_generation, self->_contextId);
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (void)setInverted:(BOOL)a3
{
  self->_inverted = a3;
}

- (unint64_t)maximumMemoryUsageForDiagnostics
{
  return self->_maximumMemoryUsageForDiagnostics;
}

- (void)setMaximumMemoryUsageForDiagnostics:(unint64_t)a3
{
  self->_maximumMemoryUsageForDiagnostics = a3;
}

- (BOOL)wantsTransform
{
  return self->_wantsTransform;
}

- (void)setWantsTransform:(BOOL)a3
{
  self->_wantsTransform = a3;
}

- (BOOL)powerSavingEnabled
{
  return self->_powerSavingEnabled;
}

- (BOOL)isOneHzFlipBook
{
  return self->_oneHzFlipBook;
}

- (BOOL)cachesFramesOnExit
{
  return self->_cachesFramesOnExit;
}

- (id)_frameById:(unint64_t)a3
{
  NSMutableArray *frames;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  frames = self->_frames;
  result = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](frames, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(frames);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "frameId") == a3)
          return v9;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](frames, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)_collectFlipBookFrames
{
  NSMutableArray *i;

  for (i = self->_frames;
        -[NSMutableArray count](i, "count")
     && objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_frames, "objectAtIndex:", 0), "frameId") < self->_lastFrameId;
        i = self->_frames)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_frames, "removeObjectAtIndex:", 0);
  }
}

- (id)_initWithDisplayId:(unsigned int)a3 options:(id)a4
{
  CAFlipBook *v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CAFlipBook;
  v6 = -[CAFlipBook init](&v10, sel_init);
  if (v6)
  {
    v6->_serverPort = CARenderServerGetServerPort(0);
    v6->_maximumSize = 512;
    v6->_contextId = 0;
    v6->_displayId = a3;
    v6->_lastFrameId = 0;
    v6->_generation = 0;
    v6->_wantsTransform = 0;
    v6->_inverted = 0;
    v6->_frames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("maximumSize")), "intValue");
    if ((v7 - 2) > 0x1FE)
    {
      NSLog(CFSTR("CoreAnimation: Maximum flipbook size %u ignored. Using %zu."), v7, 512);
    }
    else
    {
      v8 = v7;
      _CASFlipBookModify(v6->_serverPort, v6->_displayId, 0, v7);
      v6->_maximumSize = v8;
    }
  }
  return v6;
}

@end
