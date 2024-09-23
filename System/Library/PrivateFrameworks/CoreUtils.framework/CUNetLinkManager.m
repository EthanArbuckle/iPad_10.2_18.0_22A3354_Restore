@implementation CUNetLinkManager

- (CUNetLinkManager)init
{
  CUNetLinkManager *v2;
  CUNetLinkManager *v3;
  CUNetLinkManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUNetLinkManager;
  v2 = -[CUNetLinkManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_probeSocketV4 = -1;
    v3->_probeSocketV6 = -1;
    v3->_ucat = (LogCategory *)&gLogCategory_CUNetLinkManager;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUNetLinkManager;
  -[CUNetLinkManager dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[CUNetLinkManager descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  NSMutableSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  CFMutableStringRef v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CFMutableStringRef v43;
  CFMutableStringRef v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v5 = -[NSMutableSet count](self->_endpoints, "count");
  NSAppendPrintF(&v44, (uint64_t)"CUNetLinkManager %d EP(s), EPCh %u, PrRx/Tx/Err %u/%u/%u, Un/Re %u/%u", v6, v7, v8, v9, v10, v11, v5);
  v12 = v44;
  v19 = v12;
  if (a3 <= 20)
  {
    v43 = v12;
    NSAppendPrintF(&v43, (uint64_t)"\n", v13, v14, v15, v16, v17, v18, v37);
    v20 = v43;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = self->_endpoints;
    v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      if (a3 >= 11)
        v25 = 50;
      else
        v25 = 30;
      do
      {
        v26 = 0;
        v27 = v20;
        do
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v26);
          v38 = v27;
          CUDescriptionWithLevel(v28, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF(&v38, (uint64_t)"    %@\n", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
          v20 = v38;

          ++v26;
          v27 = v20;
        }
        while (v23 != v26);
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v23);
    }

    v19 = v20;
  }
  return v19;
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE067548;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CUNetLinkManager_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUNetLinkManager_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_invalidateCalled)
    return;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_6;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v16);
  }
LABEL_6:
  self->_invalidateCalled = 1;
  -[CUNetLinkManager _monitorEnsureStopped](self, "_monitorEnsureStopped");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_endpoints;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        *(_DWORD *)(v13 + 36) = 1;
        v14 = _Block_copy(*(const void **)(v13 + 40));
        v15 = v14;
        if (*(_QWORD *)(v13 + 40))
          (*((void (**)(void *))v14 + 2))(v14);

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[CUNetLinkManager _invalidated](self, "_invalidated", (_QWORD)v16);
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  uint64_t v10;

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_pollTimer
    && !self->_probeSourceV4
    && !self->_probeSourceV6)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      v4 = self->_invalidationHandler;
    }
    else
    {
      v4 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v5, v6, v7, v8, v10);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }
}

- (void)addEndpoint:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CUNetLinkManager *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CUNetLinkManager_addEndpoint___block_invoke;
  v7[3] = &unk_1E25DE628;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)removeEndpoint:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CUNetLinkManager_removeEndpoint___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_update
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_WORD *)&self->_hasIPv4Endpoint = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_endpoints;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 9);
        if (v8 == 30)
        {
          self->_hasIPv6Endpoint = 1;
LABEL_10:
          if (!self->_hasIPv4Endpoint)
            continue;
          goto LABEL_11;
        }
        if (v8 != 2)
          goto LABEL_10;
        self->_hasIPv4Endpoint = 1;
LABEL_11:
        if (self->_hasIPv6Endpoint)
          goto LABEL_14;
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
LABEL_14:

  if (self->_hasIPv4Endpoint || self->_hasIPv6Endpoint)
    -[CUNetLinkManager _monitorEnsureStarted](self, "_monitorEnsureStarted", (_QWORD)v9);
  else
    -[CUNetLinkManager _monitorEnsureStopped](self, "_monitorEnsureStopped", (_QWORD)v9);
}

- (void)_updateEndpoints
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __darwin_time_t tv_sec;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  timeval v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateEndpoints]", 9u, (uint64_t)"Update endpoints\n", v2, v3, v4, v5, v24);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_endpoints;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        *(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i) + 64) = 0;
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }

  if (self->_hasIPv4Endpoint)
    -[CUNetLinkManager _updateARP](self, "_updateARP");
  if (self->_hasIPv6Endpoint)
    -[CUNetLinkManager _updateNDP](self, "_updateNDP");
  v28.tv_sec = 0;
  *(_QWORD *)&v28.tv_usec = 0;
  gettimeofday(&v28, 0);
  v13 = mach_absolute_time();
  tv_sec = v28.tv_sec;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = self->_endpoints;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        v21 = *(unsigned __int8 *)(v20 + 64);
        if (*(_BYTE *)(v20 + 64))
          v22 = *(_QWORD *)(v20 + 48) - tv_sec < -16;
        else
          v22 = 1;
        if (v22)
        {
          v23 = *(_QWORD *)(v20 + 56);
          if (!v23)
          {
            *(_QWORD *)(v20 + 56) = v13;
            v23 = v13;
          }
          if (*(_DWORD *)(v20 + 36) != 3 && (!v21 || UpTicksToSeconds(v13 - v23) >= 0x1F))
          {
            ++self->_unreachableCount;
            -[CUNetLinkManager _updateEndpoint:state:](self, "_updateEndpoint:state:", v20, 3, (_QWORD)v24);
          }
          -[CUNetLinkManager _monitorSendPacketToEndpoint:](self, "_monitorSendPacketToEndpoint:", v20, (_QWORD)v24);
        }
        else
        {
          if (*(_DWORD *)(v20 + 36) == 3)
            ++self->_reReachableCount;
          *(_QWORD *)(v20 + 56) = 0;
          -[CUNetLinkManager _updateEndpoint:state:](self, "_updateEndpoint:state:", v20, 2, (_QWORD)v24);
        }
      }
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v17);
  }

}

- (void)_updateARP
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *v22;
  uint64_t v23;
  LogCategory *ucat;
  unsigned __int16 *v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  timeval v32;
  unsigned int v33;
  uint64_t v34;
  _BYTE v35[128];
  int v36[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v36 = xmmword_18D51D420;
  v37 = 0x40000000009;
  v34 = 0;
  v33 = 0;
  v25 = (unsigned __int16 *)sysctl_copy(v36, (size_t *)&v34, (int *)&v33);
  if (!v25)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90)
      return;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        return;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateARP]", 0x5Au, (uint64_t)"### Get IPv4 route info failed: %#m\n", v3, v4, v5, v6, v33);
    return;
  }
  v32.tv_sec = 0;
  *(_QWORD *)&v32.tv_usec = 0;
  gettimeofday(&v32, 0);
  if (v34 >= 1)
  {
    v7 = v25;
    v8 = (unint64_t)v25 + v34;
    v26 = (unint64_t)v25 + v34;
    while (1)
    {
      v9 = *((_BYTE *)v7 + 136) ? (*((unsigned __int8 *)v7 + 136) + 3) & 0x1FC : 4;
      v10 = (char *)v7 + v9 + 136;
      v11 = *v7;
      if (v10[1] == 18 && v10[6] == 6)
        break;
LABEL_25:
      v7 = (unsigned __int16 *)((char *)v7 + v11);
      if ((unint64_t)v7 >= v8)
        goto LABEL_26;
    }
    v27 = *v7;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = self->_endpoints;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (!v13)
      goto LABEL_24;
    v18 = v13;
    v19 = *(_QWORD *)v29;
LABEL_11:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v19)
        objc_enumerationMutation(v12);
      v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20);
      if (*(_BYTE *)(v21 + 9) != 2)
        goto LABEL_20;
      if (*(_DWORD *)(v21 + 12) != *((_DWORD *)v7 + 35))
        goto LABEL_20;
      *(_QWORD *)(v21 + 48) = *((_QWORD *)v7 + 14);
      *(_BYTE *)(v21 + 64) = 1;
      v22 = self->_ucat;
      if (v22->var0 > 9)
        goto LABEL_20;
      if (v22->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v22, 9u))
          goto LABEL_20;
        v22 = self->_ucat;
      }
      LogPrintF((uint64_t)v22, (uint64_t)"-[CUNetLinkManager _updateARP]", 9u, (uint64_t)"ARP/NDP poll %##a: RxExp %llu (%lld), TxExp %llu, RtExp %d, Now %ld\n", v14, v15, v16, v17, v21 + 8);
LABEL_20:
      if (v18 == ++v20)
      {
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
        v18 = v23;
        if (!v23)
        {
LABEL_24:

          v8 = v26;
          v11 = v27;
          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }
  }
LABEL_26:
  free(v25);
}

- (void)_updateNDP
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *v22;
  uint64_t v23;
  LogCategory *ucat;
  unsigned __int16 *v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  timeval v32;
  unsigned int v33;
  uint64_t v34;
  _BYTE v35[128];
  int v36[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v36 = xmmword_18D51D430;
  v37 = 0x40000000009;
  v34 = 0;
  v33 = 0;
  v25 = (unsigned __int16 *)sysctl_copy(v36, (size_t *)&v34, (int *)&v33);
  if (!v25)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90)
      return;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        return;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateNDP]", 0x5Au, (uint64_t)"### Get IPv6 route info failed: %#m\n", v3, v4, v5, v6, v33);
    return;
  }
  v32.tv_sec = 0;
  *(_QWORD *)&v32.tv_usec = 0;
  gettimeofday(&v32, 0);
  if (v34 >= 1)
  {
    v7 = v25;
    v8 = (unint64_t)v25 + v34;
    v26 = (unint64_t)v25 + v34;
    while (1)
    {
      v9 = *((_BYTE *)v7 + 136) ? (*((unsigned __int8 *)v7 + 136) + 3) & 0x1FC : 4;
      v10 = (char *)v7 + v9 + 136;
      v11 = *v7;
      if (v10[1] == 18 && v10[6] == 6)
        break;
LABEL_25:
      v7 = (unsigned __int16 *)((char *)v7 + v11);
      if ((unint64_t)v7 >= v8)
        goto LABEL_26;
    }
    v27 = *v7;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = self->_endpoints;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (!v13)
      goto LABEL_24;
    v14 = v13;
    v15 = *(_QWORD *)v29;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16);
      if (*(_BYTE *)(v17 + 9) != 30)
        goto LABEL_20;
      if (SockAddrCompareAddrEx((_QWORD *)(v17 + 8), (uint64_t)(v7 + 68), 1))
        goto LABEL_20;
      *(_QWORD *)(v17 + 48) = *((_QWORD *)v7 + 14);
      *(_BYTE *)(v17 + 64) = 1;
      v22 = self->_ucat;
      if (v22->var0 > 9)
        goto LABEL_20;
      if (v22->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v22, 9u))
          goto LABEL_20;
        v22 = self->_ucat;
      }
      LogPrintF((uint64_t)v22, (uint64_t)"-[CUNetLinkManager _updateNDP]", 9u, (uint64_t)"ARP/NDP poll %##a: RxExp %llu (%lld), TxExp %llu, RtExp %d, Now %ld\n", v18, v19, v20, v21, v17 + 8);
LABEL_20:
      if (v14 == ++v16)
      {
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
        v14 = v23;
        if (!v23)
        {
LABEL_24:

          v8 = v26;
          v11 = v27;
          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }
  }
LABEL_26:
  free(v25);
}

- (void)_updateEndpoint:(id)a3 state:(int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  if (*((_DWORD *)v6 + 9) == a4)
    goto LABEL_10;
  ucat = self->_ucat;
  v15 = v6;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_6:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateEndpoint:state:]", 0x1Eu, (uint64_t)"Endpoint state changed: %##a: %s -> %s\n", v7, v8, v9, v10, (uint64_t)v6 + 8);
      v6 = v15;
      goto LABEL_7;
    }
    v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    v6 = v15;
    if (v12)
    {
      ucat = self->_ucat;
      goto LABEL_6;
    }
  }
LABEL_7:
  *((_DWORD *)v6 + 9) = a4;
  ++*((_DWORD *)v6 + 18);
  v13 = _Block_copy(*((const void **)v6 + 5));
  v14 = v13;
  if (v13)
    (*((void (**)(void *))v13 + 2))(v13);

  v6 = v15;
LABEL_10:

}

- (void)_monitorEnsureStarted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  OS_dispatch_source *v8;
  OS_dispatch_source *pollTimer;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  _QWORD handler[5];

  if (self->_hasIPv4Endpoint && !self->_probeSourceV4)
    -[CUNetLinkManager _monitorSetupSocket:](self, "_monitorSetupSocket:", 2);
  if (self->_hasIPv6Endpoint && !self->_probeSourceV6)
    -[CUNetLinkManager _monitorSetupSocket:](self, "_monitorSetupSocket:", 30);
  if (!self->_pollTimer)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_12;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorEnsureStarted]", 0x1Eu, (uint64_t)"Monitor start\n", v2, v3, v4, v5, v13);
    }
LABEL_12:
    v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pollTimer = self->_pollTimer;
    self->_pollTimer = v8;

    v10 = self->_pollTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __41__CUNetLinkManager__monitorEnsureStarted__block_invoke;
    handler[3] = &unk_1E25DF2A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    v11 = self->_pollTimer;
    v12 = dispatch_time(0, 13000000000);
    dispatch_source_set_timer(v11, v12, 0x306DC4200uLL, 0xB2D05E00uLL);
    dispatch_activate((dispatch_object_t)self->_pollTimer);
  }
}

- (void)_monitorEnsureStopped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  OS_dispatch_source *pollTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  NSObject *probeSourceV4;
  NSObject *probeSourceV6;
  uint64_t v13;

  if (!self->_pollTimer)
    goto LABEL_8;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorEnsureStopped]", 0x1Eu, (uint64_t)"Monitor stop\n", v2, v3, v4, v5, v13);
      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_6:
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    v9 = pollTimer;
    dispatch_source_cancel(v9);
    v10 = self->_pollTimer;
    self->_pollTimer = 0;

  }
LABEL_8:
  probeSourceV4 = self->_probeSourceV4;
  if (probeSourceV4)
    dispatch_source_cancel(probeSourceV4);
  probeSourceV6 = self->_probeSourceV6;
  if (probeSourceV6)
    dispatch_source_cancel(probeSourceV6);
}

- (void)_monitorSetupSocket:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  LogCategory *v12;
  LogCategory *ucat;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  LogCategory *v23;
  LogCategory *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  LogCategory *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  LogCategory *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  LogCategory *v39;
  int v40;
  socklen_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  LogCategory *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  LogCategory *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void **v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  LogCategory *v62;
  _QWORD v63[7];
  _QWORD handler[5];
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  sockaddr v70[2];

  v7 = *(_QWORD *)&a3;
  memset(v70, 0, 28);
  if (a3 == 2)
  {
    v9 = "IPv4";
    v10 = 40;
    v11 = 32;
  }
  else
  {
    if (a3 != 30)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90)
        return;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          return;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket bad family: %d\n", v3, v4, v5, v6, v7);
      return;
    }
    v9 = "IPv6";
    v10 = 56;
    v11 = 48;
  }
  v12 = self->_ucat;
  if (v12->var0 <= 30)
  {
    if (v12->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v12, 0x1Eu))
        goto LABEL_12;
      v12 = self->_ucat;
    }
    LogPrintF((uint64_t)v12, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x1Eu, (uint64_t)"Monitor setup socket %s\n", v3, v4, v5, v6, (uint64_t)v9);
  }
LABEL_12:
  v14 = socket(v7, 2, 17);
  if (v14 < 0 && (!*__error() || *__error()))
  {
    v24 = self->_ucat;
    if (v24->var0 > 90)
      return;
    if (v24->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v24, 0x5Au))
        return;
      v24 = self->_ucat;
    }
    LogPrintF((uint64_t)v24, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket create failed (%s): %#m\n", v15, v16, v17, v18, (uint64_t)v9);
    return;
  }
  if (SocketSetNonBlocking(v14, 1))
  {
    v23 = self->_ucat;
    if (v23->var0 <= 90)
    {
      if (v23->var0 != -1)
      {
LABEL_18:
        LogPrintF((uint64_t)v23, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket NonBlock failed (%s): %#m\n", v19, v20, v21, v22, (uint64_t)v9);
        goto LABEL_23;
      }
      if (_LogCategory_Initialize((uint64_t)v23, 0x5Au))
      {
        v23 = self->_ucat;
        goto LABEL_18;
      }
    }
  }
LABEL_23:
  v69 = 1;
  if (setsockopt(v14, 0xFFFF, 4130, &v69, 4u) && (!*__error() || *__error()))
  {
    v29 = self->_ucat;
    if (v29->var0 <= 90)
    {
      if (v29->var0 != -1)
      {
LABEL_28:
        LogPrintF((uint64_t)v29, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket SO_NOSIGPIPE failed (%s): %#m\n", v25, v26, v27, v28, (uint64_t)v9);
        goto LABEL_30;
      }
      if (_LogCategory_Initialize((uint64_t)v29, 0x5Au))
      {
        v29 = self->_ucat;
        goto LABEL_28;
      }
    }
  }
LABEL_30:
  v68 = 1;
  if (setsockopt(v14, 0xFFFF, 0x10000, &v68, 4u) && (!*__error() || *__error()))
  {
    v34 = self->_ucat;
    if (v34->var0 <= 90)
    {
      if (v34->var0 != -1)
      {
LABEL_35:
        LogPrintF((uint64_t)v34, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket SO_NOWAKEFROMSLEEP failed (%s): %#m\n", v30, v31, v32, v33, (uint64_t)v9);
        goto LABEL_37;
      }
      if (_LogCategory_Initialize((uint64_t)v34, 0x5Au))
      {
        v34 = self->_ucat;
        goto LABEL_35;
      }
    }
  }
LABEL_37:
  v67 = 1;
  if (setsockopt(v14, 0xFFFF, 512, &v67, 4u) && (!*__error() || *__error()))
  {
    v39 = self->_ucat;
    if (v39->var0 <= 90)
    {
      if (v39->var0 != -1)
      {
LABEL_44:
        LogPrintF((uint64_t)v39, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket SO_REUSEPORT failed (%s): %#m\n", v35, v36, v37, v38, (uint64_t)v9);
        goto LABEL_46;
      }
      if (_LogCategory_Initialize((uint64_t)v39, 0x5Au))
      {
        v39 = self->_ucat;
        goto LABEL_44;
      }
    }
  }
LABEL_46:
  if ((_DWORD)v7 == 2)
  {
    *(_QWORD *)&v70[0].sa_len = 2316173840;
    *(_QWORD *)&v70[0].sa_data[6] = 0;
    v40 = v14;
    v41 = 16;
    goto LABEL_62;
  }
  if ((_DWORD)v7 != 30)
    goto LABEL_71;
  v66 = 1;
  if (setsockopt(v14, 41, 27, &v66, 4u) && (!*__error() || *__error()))
  {
    v46 = self->_ucat;
    if (v46->var0 <= 90)
    {
      if (v46->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v46, 0x5Au))
          goto LABEL_61;
        v46 = self->_ucat;
      }
      LogPrintF((uint64_t)v46, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket IPV6_V6ONLY failed (%s): %#m\n", v42, v43, v44, v45, (uint64_t)v9);
    }
  }
LABEL_61:
  *(_OWORD *)&v70[0].sa_data[10] = 0uLL;
  *(_QWORD *)&v70[0].sa_data[2] = 0;
  *(_DWORD *)&v70[0].sa_len = -1978786276;
  *(sockaddr *)&v70[0].sa_data[6] = *(sockaddr *)MEMORY[0x1E0C83920];
  v40 = v14;
  v41 = 28;
LABEL_62:
  if (bind(v40, v70, v41) && (!*__error() || *__error()))
  {
    v51 = self->_ucat;
    if (v51->var0 <= 90)
    {
      if (v51->var0 != -1)
      {
LABEL_69:
        LogPrintF((uint64_t)v51, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket bind failed (%s): %#m\n", v47, v48, v49, v50, (uint64_t)v9);
        goto LABEL_71;
      }
      if (_LogCategory_Initialize((uint64_t)v51, 0x5Au))
      {
        v51 = self->_ucat;
        goto LABEL_69;
      }
    }
  }
LABEL_71:
  v52 = dispatch_source_create(MEMORY[0x1E0C80DB8], v14, 0, (dispatch_queue_t)self->_dispatchQueue);
  if (v52)
  {
    v57 = v52;
    v58 = (void **)((char *)&self->super.isa + v10);
    v59 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__CUNetLinkManager__monitorSetupSocket___block_invoke;
    handler[3] = &unk_1E25DE500;
    handler[4] = self;
    v65 = v14;
    dispatch_source_set_event_handler(v52, handler);
    v63[0] = v59;
    v63[1] = 3221225472;
    v63[2] = __40__CUNetLinkManager__monitorSetupSocket___block_invoke_2;
    v63[3] = &unk_1E25DE188;
    v63[5] = (char *)self + v11;
    v63[6] = v58;
    v63[4] = self;
    dispatch_source_set_cancel_handler(v57, v63);
    dispatch_activate(v57);
    *(_DWORD *)((char *)&self->super.isa + v11) = v14;
    v60 = *v58;
    *v58 = v57;
    v61 = v57;

    return;
  }
  v62 = self->_ucat;
  if (v62->var0 <= 90)
  {
    if (v62->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v62, 0x5Au))
        goto LABEL_79;
      v62 = self->_ucat;
    }
    LogPrintF((uint64_t)v62, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket create read source failed (%s): %#m\n", v53, v54, v55, v56, (uint64_t)v9);
  }
LABEL_79:
  if ((v14 & 0x80000000) == 0 && close(v14))
  {
    if (*__error())
      __error();
  }
}

- (void)_monitorReadPacket:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *v8;
  LogCategory *ucat;
  _QWORD v10[3];
  int v11;
  ssize_t v12;
  int v13;

  v13 = 0;
  v12 = 0;
  memset(v10, 0, sizeof(v10));
  v11 = 0;
  if (!SocketRecvFrom(a3, (uint64_t)&v13, 4, &v12, v10, 0x1Cu, 0, 0, 0, 0))
  {
    ++self->_rxCount;
    ucat = self->_ucat;
    if (ucat->var0 > 9)
      return;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 9u))
        return;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorReadPacket:]", 9u, (uint64_t)"Probe recv: %##a, %zu bytes, R# %u, S# %u\n", v4, v5, v6, v7, (uint64_t)v10);
    return;
  }
  v8 = self->_ucat;
  if (v8->var0 <= 90)
  {
    if (v8->var0 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v8, (uint64_t)"-[CUNetLinkManager _monitorReadPacket:]", 0x5Au, (uint64_t)"### Probe recv failed: R# %u, %#m\n", v4, v5, v6, v7, self->_rxCount);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v8, 0x5Au))
    {
      v8 = self->_ucat;
      goto LABEL_4;
    }
  }
}

- (void)_monitorSendPacketToEndpoint:(id)a3
{
  char *v4;
  int v5;
  const sockaddr *v6;
  int v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  socklen_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  LogCategory *ucat;
  LogCategory *v17;
  int v18;

  v4 = (char *)a3;
  v5 = *((_DWORD *)v4 + 17) + 1;
  *((_DWORD *)v4 + 17) = v5;
  v18 = v5;
  v6 = (const sockaddr *)(v4 + 8);
  v7 = v4[9];
  if (v7 == 30)
    v8 = 28;
  else
    v8 = 0;
  v9 = v7 == 2;
  v10 = 48;
  if (v9)
  {
    v10 = 32;
    v11 = 16;
  }
  else
  {
    v11 = v8;
  }
  if (sendto(*(_DWORD *)((char *)&self->super.isa + v10), &v18, 4uLL, 0, v6, v11) == 4 || *__error() && !*__error())
  {
    ++self->_txCount;
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 9u))
          goto LABEL_19;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorSendPacketToEndpoint:]", 9u, (uint64_t)"Probe sent: %##a, S# %u, T# %u, E# %u\n", v12, v13, v14, v15, (uint64_t)v6);
    }
  }
  else
  {
    ++self->_txErrors;
    v17 = self->_ucat;
    if (v17->var0 <= 20)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v17, 0x14u))
          goto LABEL_19;
        v17 = self->_ucat;
      }
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUNetLinkManager _monitorSendPacketToEndpoint:]", 0x14u, (uint64_t)"### Probe send failed: %##a, S# %u, T# %u, E# %u, %#m\n", v12, v13, v14, v15, (uint64_t)v6);
    }
  }
LABEL_19:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_probeSourceV6, 0);
  objc_storeStrong((id *)&self->_probeSourceV4, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
}

uint64_t __40__CUNetLinkManager__monitorSetupSocket___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_monitorReadPacket:", *(unsigned int *)(a1 + 40));
}

uint64_t __40__CUNetLinkManager__monitorSetupSocket___block_invoke_2(uint64_t a1)
{
  int v2;
  void **v3;
  void *v4;

  v2 = **(_DWORD **)(a1 + 40);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2) && *__error())
      __error();
    **(_DWORD **)(a1 + 40) = -1;
  }
  v3 = *(void ***)(a1 + 48);
  v4 = *v3;
  *v3 = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __41__CUNetLinkManager__monitorEnsureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEndpoints");
}

uint64_t __35__CUNetLinkManager_removeEndpoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 80);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNetLinkManager removeEndpoint:]_block_invoke", 0x1Eu, (uint64_t)"Remove endpoint: %##a\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 40) + 8);
      v9 = *(_QWORD *)(a1 + 32);
      goto LABEL_5;
    }
    v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    v9 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v10 = *(int **)(v9 + 80);
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(*(id *)(v9 + 8), "removeObject:", *(_QWORD *)(a1 + 40));
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v12 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(v12 + 36) != 1)
  {
    *(_DWORD *)(v12 + 36) = 1;
    v13 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 40));
    v14 = v13;
    if (v13)
      (*((void (**)(void *))v13 + 2))(v13);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __32__CUNetLinkManager_addEndpoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  uint64_t v12;
  int *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(unsigned __int8 *)(v9 + 9);
  if (v10 == 30 || v10 == 2)
    *(_WORD *)(v9 + 10) = -30194;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(int **)(v12 + 80);
  if (*v13 <= 30)
  {
    if (*v13 != -1)
    {
LABEL_9:
      LogPrintF((uint64_t)v13, (uint64_t)"-[CUNetLinkManager addEndpoint:]_block_invoke", 0x1Eu, (uint64_t)"Add endpoint: %##a\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 32) + 8);
      v12 = *(_QWORD *)(a1 + 40);
      goto LABEL_11;
    }
    v14 = _LogCategory_Initialize((uint64_t)v13, 0x1Eu);
    v12 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      v13 = *(int **)(v12 + 80);
      goto LABEL_9;
    }
  }
LABEL_11:
  v15 = *(void **)(v12 + 8);
  if (!v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void **)(v17 + 8);
    *(_QWORD *)(v17 + 8) = v16;

    v15 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  }
  objc_msgSend(v15, "addObject:", *(_QWORD *)(a1 + 32));
  ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(*(id *)(a1 + 40), "_update");
  return objc_msgSend(*(id *)(a1 + 40), "_updateEndpoints");
}

uint64_t __30__CUNetLinkManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __28__CUNetLinkManager_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[10];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD **)(a1 + 32);
      if (!v11)
        return objc_msgSend(v9, "_update");
      v10 = (int *)v9[10];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNetLinkManager activate]_block_invoke", 0x1Eu, (uint64_t)"Activate: poll %d secs (+/- %d), reach %d secs, unreach %d secs\n", a5, a6, a7, a8, 13);
    v9 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v9, "_update");
}

@end
