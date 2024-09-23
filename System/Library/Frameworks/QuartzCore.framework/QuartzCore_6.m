void _XFlipBookCancel(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  int v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  *(_QWORD *)(a2 + 32) = 0x11000000000000;
  v4 = *(_DWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 36);
  v6 = *(_OWORD *)(a1 + 76);
  v12[0] = *(_OWORD *)(a1 + 60);
  v12[1] = v6;
  if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v12, (const audit_token_t *)a2) & 0x40) == 0)
  {
    v3 = 53;
    goto LABEL_7;
  }
  v7 = a2 + 28;
  v10 = 0;
  v9 = v4;
  if (!v5)
    v7 = 0;
  v11 = v7;
  CA::Render::post_notification(0x11u, 0, (uint64_t)&v9, 0);
  v8 = v10;
  *(_QWORD *)(a2 + 40) = *MEMORY[0x1E0C804E8];
  *(_QWORD *)(a2 + 48) = v8;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
}

void _XFlipBookModify(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 44) || *(_DWORD *)(a1 + 48) < 0x20u)
  {
    v3 = -309;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 80);
    v10[0] = *(_OWORD *)(a1 + 64);
    v10[1] = v7;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2) & 0x40) != 0)
    {
      v8 = v5;
      v9 = v6;
      CA::Render::post_notification(0x12u, 0, (uint64_t)&v8, 0);
      v3 = 0;
    }
    else
    {
      v3 = 53;
    }
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *v4;
}

uint64_t _XContentStreamModify(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD *v4;
  mach_port_name_t v5;
  const audit_token_t *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  _OWORD v11[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 128)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112 && *(unsigned __int16 *)(a1 + 50) << 16 == 1114112)
    {
      if (*(_DWORD *)(a1 + 128) || *(_DWORD *)(a1 + 132) < 0x20u)
      {
        result = 4294966987;
      }
      else
      {
        v5 = *(_DWORD *)(a1 + 28);
        v6 = (const audit_token_t *)*(unsigned int *)(a1 + 40);
        v7 = *(_OWORD *)(a1 + 76);
        v8 = *(_OWORD *)(a1 + 108);
        v11[2] = *(_OWORD *)(a1 + 92);
        v11[3] = v8;
        v12 = *(_DWORD *)(a1 + 124);
        v11[0] = *(_OWORD *)(a1 + 60);
        v11[1] = v7;
        v9 = *(_OWORD *)(a1 + 164);
        v10[0] = *(_OWORD *)(a1 + 148);
        v10[1] = v9;
        result = CASContentStreamModify(v5, v6, (uint64_t)v11, (CA::Render::Server *)v10);
      }
    }
    else
    {
      result = 4294966996;
    }
  }
  else
  {
    result = 4294966992;
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *v4;
  return result;
}

uint64_t _XContentStreamStartStop(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t result;
  _QWORD *v5;
  CA::Render::ContentStream *v6;
  const audit_token_t *v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v10;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 80)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112
      && *(_BYTE *)(a1 + 51) == 1
      && (v3 = *(_DWORD *)(a1 + 52) >> 2, v3 == *(_DWORD *)(a1 + 68)))
    {
      if (*(_DWORD *)(a1 + 80) || *(_DWORD *)(a1 + 84) < 0x20u)
      {
        result = 4294966987;
      }
      else
      {
        v6 = (CA::Render::ContentStream *)*(unsigned int *)(a1 + 28);
        v7 = *(const audit_token_t **)(a1 + 40);
        v8 = *(_DWORD *)(a1 + 72);
        v9 = *(_DWORD *)(a1 + 76);
        v10 = *(_OWORD *)(a1 + 116);
        v11[0] = *(_OWORD *)(a1 + 100);
        v11[1] = v10;
        result = CASContentStreamStartStop(v6, v7, v3, v8, v9, (CA::Render::Server *)v11);
      }
    }
    else
    {
      result = 4294966996;
    }
  }
  else
  {
    result = 4294966992;
  }
  v5 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *v5;
  return result;
}

uint64_t _XContentStreamReleaseSurf(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD *v4;
  CA::Render::ContentStream *v5;
  const audit_token_t *v6;
  __int128 v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 52)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112)
    {
      if (*(_DWORD *)(a1 + 52) || *(_DWORD *)(a1 + 56) < 0x20u)
      {
        result = 4294966987;
      }
      else
      {
        v5 = (CA::Render::ContentStream *)*(unsigned int *)(a1 + 28);
        v6 = (const audit_token_t *)*(unsigned int *)(a1 + 48);
        v7 = *(_OWORD *)(a1 + 88);
        v8[0] = *(_OWORD *)(a1 + 72);
        v8[1] = v7;
        result = CASContentStreamReleaseSurf(v5, v6, (CA::Render::Server *)v8);
      }
    }
    else
    {
      result = 4294966996;
    }
  }
  else
  {
    result = 4294966992;
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *v4;
  return result;
}

void _XPurgeServer(_DWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  _QWORD *v6;
  __int128 v7;
  const audit_token_t *v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    v5 = -304;
  }
  else
  {
    v4 = a1[6];
    v3 = a1 + 6;
    if (v4 || v3[1] < 0x20u)
    {
      v5 = -309;
    }
    else
    {
      v7 = *(_OWORD *)(v3 + 9);
      v9[0] = *(_OWORD *)(v3 + 5);
      v9[1] = v7;
      if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v9, (const audit_token_t *)a2) & 0x80) != 0
        || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v9, v8) & 0x20000) != 0)
      {
        v5 = -81182719;
      }
      else
      {
        CA::Render::post_notification(0x26u, 0, 0, 0);
        v5 = 0;
      }
    }
  }
  v6 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *v6;
}

void _XGetUpdateHistograms(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  __int128 v5;
  const audit_token_t *v6;
  const audit_token_t *v7;
  const __CFAllocator *v8;
  const __CFData *Data;
  const __CFData *v10;
  size_t Length;
  void *v12;
  const UInt8 *BytePtr;
  vm_address_t v14;
  int v15;
  vm_address_t address;
  CFPropertyListRef propertyList;
  _BOOL8 v18;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    v3 = -309;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v4 = *(_DWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 72);
    v19[0] = *(_OWORD *)(a1 + 56);
    v19[1] = v5;
    *(_QWORD *)(a2 + 28) = 0;
    *(_DWORD *)(a2 + 52) = 0;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, v6) & 0x20000) != 0)
    {
      v3 = -81182719;
    }
    else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, v7) & 0x100) != 0)
    {
      v18 = 0;
      v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE18];
      propertyList = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE18], 0, MEMORY[0x1E0C9B378]);
      v18 = v4 != 0;
      CA::Render::post_notification(0x28u, 0, (uint64_t)&propertyList, 0);
      address = 0;
      Data = CFPropertyListCreateData(v8, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      if (Data)
      {
        v10 = Data;
        Length = CFDataGetLength(Data);
        vm_allocate(*MEMORY[0x1E0C83DA0], &address, (Length + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8], 1);
        v12 = (void *)address;
        if (address)
        {
          BytePtr = CFDataGetBytePtr(v10);
          memcpy(v12, BytePtr, Length);
        }
        CFRelease(v10);
      }
      else
      {
        LODWORD(Length) = 0;
      }
      CFRelease(propertyList);
      v14 = address;
      *(_QWORD *)(a2 + 28) = address;
      if (v14)
        v15 = Length;
      else
        v15 = 0;
      *(_DWORD *)(a2 + 52) = v15;
      if (v14)
      {
        *(_DWORD *)(a2 + 40) = v15;
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
      v3 = 5;
    }
    else
    {
      v3 = 53;
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XGetODStatistics(_DWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  const __CFAllocator *v9;
  CFMutableArrayRef Mutable;
  const __CFData *Data;
  const __CFData *v12;
  size_t Length;
  void *v14;
  const UInt8 *BytePtr;
  vm_address_t v16;
  int v17;
  vm_address_t address;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    v5 = -304;
  }
  else
  {
    v4 = a1[6];
    v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      v5 = -309;
    }
    else
    {
      *(_DWORD *)(a2 + 36) = 16777473;
      v6 = *(_OWORD *)(v3 + 9);
      v19[0] = *(_OWORD *)(v3 + 5);
      v19[1] = v6;
      *(_QWORD *)(a2 + 28) = 0;
      *(_DWORD *)(a2 + 52) = 0;
      if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, (const audit_token_t *)a2) & 0x80) != 0
        || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, v7) & 0x20000) != 0)
      {
        v5 = -81182719;
      }
      else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, v8) & 0x100) != 0)
      {
        v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE18];
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE18], 0, MEMORY[0x1E0C9B378]);
        CA::Render::post_notification(0x29u, 0, (uint64_t)Mutable, 0);
        address = 0;
        Data = CFPropertyListCreateData(v9, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          v12 = Data;
          Length = CFDataGetLength(Data);
          vm_allocate(*MEMORY[0x1E0C83DA0], &address, (Length + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8], 1);
          v14 = (void *)address;
          if (address)
          {
            BytePtr = CFDataGetBytePtr(v12);
            memcpy(v14, BytePtr, Length);
          }
          CFRelease(v12);
        }
        else
        {
          LODWORD(Length) = 0;
        }
        CFRelease(Mutable);
        v16 = address;
        *(_QWORD *)(a2 + 28) = address;
        if (v16)
          v17 = Length;
        else
          v17 = 0;
        *(_DWORD *)(a2 + 52) = v17;
        if (v16)
        {
          *(_DWORD *)(a2 + 40) = v17;
          *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
          *(_DWORD *)a2 |= 0x80000000;
          *(_DWORD *)(a2 + 4) = 56;
          *(_DWORD *)(a2 + 24) = 1;
          return;
        }
        v5 = 5;
      }
      else
      {
        v5 = 53;
      }
    }
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XPostPowerLog(_DWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  _QWORD *v6;
  __int128 v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    v5 = -304;
  }
  else
  {
    v4 = a1[6];
    v3 = a1 + 6;
    if (v4 || v3[1] < 0x20u)
    {
      v5 = -309;
    }
    else
    {
      v7 = *(_OWORD *)(v3 + 9);
      v10[0] = *(_OWORD *)(v3 + 5);
      v10[1] = v7;
      if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2) & 0x80) != 0
        || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v8) & 0x20000) != 0)
      {
        v5 = -81182719;
      }
      else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v9) & 0x100) != 0)
      {
        CA::Render::post_notification(0x2Au, 0, 0, 0);
        v5 = 0;
      }
      else
      {
        v5 = 53;
      }
    }
  }
  v6 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *v6;
}

void _XGetPerformanceInfo(_DWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  const __CFAllocator *v9;
  const __CFData *Data;
  const __CFData *v11;
  size_t Length;
  void *v13;
  const UInt8 *BytePtr;
  vm_address_t v15;
  CFPropertyListRef propertyList;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    v5 = -304;
  }
  else
  {
    v4 = a1[6];
    v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      v5 = -309;
    }
    else
    {
      *(_DWORD *)(a2 + 36) = 16777473;
      v6 = *(_OWORD *)(v3 + 9);
      v17[0] = *(_OWORD *)(v3 + 5);
      v17[1] = v6;
      *(_QWORD *)(a2 + 28) = 0;
      *(_DWORD *)(a2 + 52) = 0;
      if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v17, (const audit_token_t *)a2) & 0x80) != 0
        || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v17, v7) & 0x20000) != 0)
      {
        v5 = -81182719;
      }
      else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v17, v8) & 0x100) != 0)
      {
        v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE18];
        propertyList = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE18], 0, MEMORY[0x1E0C9B378]);
        CA::Render::post_notification(0x2Du, 0, (uint64_t)&propertyList, 0);
        v15 = 0;
        Data = CFPropertyListCreateData(v9, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          v11 = Data;
          Length = CFDataGetLength(Data);
          vm_allocate(*MEMORY[0x1E0C83DA0], &v15, (Length + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8], 1);
          v13 = (void *)v15;
          if (v15)
          {
            BytePtr = CFDataGetBytePtr(v11);
            memcpy(v13, BytePtr, Length);
          }
          CFRelease(v11);
        }
        else
        {
          LODWORD(Length) = 0;
        }
        CFRelease(propertyList);
        if (v15)
        {
          *(_QWORD *)(a2 + 28) = v15;
          *(_DWORD *)(a2 + 52) = Length;
          *(_DWORD *)(a2 + 40) = Length;
          *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
          *(_DWORD *)a2 |= 0x80000000;
          *(_DWORD *)(a2 + 4) = 56;
          *(_DWORD *)(a2 + 24) = 1;
          return;
        }
        v5 = 5;
      }
      else
      {
        v5 = 53;
      }
    }
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

uint64_t _XGetFrameCounter(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  __int128 v5;
  const audit_token_t *v6;
  int v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = *(_DWORD *)(result + 24);
    result += 24;
    if (v3 || *(_DWORD *)(result + 4) <= 0x1Fu)
    {
      v4 = -309;
    }
    else
    {
      v5 = *(_OWORD *)(result + 36);
      v8[0] = *(_OWORD *)(result + 20);
      v8[1] = v5;
      result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, (const audit_token_t *)a2);
      if ((result & 0x80) == 0)
      {
        result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, v6);
        if ((result & 0x20000) == 0)
        {
          result = (uint64_t)CAGetStatsStruct(0);
          v7 = *(_DWORD *)(result + 20);
          *(_DWORD *)(a2 + 32) = 0;
          *(_DWORD *)(a2 + 36) = v7;
          *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
          *(_DWORD *)(a2 + 4) = 40;
          return result;
        }
      }
      v4 = -81182719;
    }
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XGetDebugOption(uint64_t result, uint64_t a2)
{
  int v3;
  unsigned int v4;
  __int128 v5;
  const audit_token_t *v6;
  const audit_token_t *v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
  }
  else
  {
    v4 = *(_DWORD *)(result + 32);
    v5 = *(_OWORD *)(result + 72);
    v8[0] = *(_OWORD *)(result + 56);
    v8[1] = v5;
    result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, (const audit_token_t *)a2);
    if ((result & 0x80) != 0
      || (result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, v6), (result & 0x20000) != 0))
    {
      v3 = -81182719;
    }
    else
    {
      result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, v7);
      if ((result & 0x100) != 0)
      {
        result = CAGetDebugOption(v4);
        *(_DWORD *)(a2 + 32) = 0;
        *(_DWORD *)(a2 + 36) = result;
        *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)(a2 + 4) = 40;
        return result;
      }
      v3 = 53;
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XSetDebugOption(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  unsigned __int32 v5;
  int v6;
  __int128 v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) < 0x20u)
  {
    v3 = -309;
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 36);
    v7 = *(_OWORD *)(a1 + 76);
    v10[0] = *(_OWORD *)(a1 + 60);
    v10[1] = v7;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v8) & 0x20000) != 0)
    {
      v3 = -81182719;
    }
    else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v9) & 0x100) != 0)
    {
      CASetDebugOption(v5, v6 != 0);
      v3 = 0;
    }
    else
    {
      v3 = 53;
    }
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *v4;
}

uint64_t _XClearDebugOptions(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  _QWORD *v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = *(_DWORD *)(result + 24);
    result += 24;
    if (v3 || *(_DWORD *)(result + 4) < 0x20u)
    {
      v4 = -309;
    }
    else
    {
      v6 = *(_OWORD *)(result + 36);
      v10[0] = *(_OWORD *)(result + 20);
      v10[1] = v6;
      result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2);
      if ((result & 0x80) != 0
        || (result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v7), (result & 0x20000) != 0))
      {
        v4 = -81182719;
      }
      else
      {
        result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v8);
        if ((result & 0x100) != 0)
        {
          v9 = 0;
          dword_1ECDC6B10 = 0;
          xmmword_1ECDC6AF0 = 0u;
          *(_OWORD *)&byte_1ECDC6B00 = 0u;
          xmmword_1ECDC6AD0 = 0u;
          unk_1ECDC6AE0 = 0u;
          xmmword_1ECDC6AB0 = 0u;
          *(_OWORD *)&byte_1ECDC6AC0 = 0u;
          xmmword_1ECDC6A90 = 0u;
          *(_OWORD *)&byte_1ECDC6AA0 = 0u;
          xmmword_1ECDC6A70 = 0u;
          *(_OWORD *)&byte_1ECDC6A80 = 0u;
          ca_debug_options = 0u;
          *(_OWORD *)&byte_1ECDC6A60 = 0u;
          options_are_visual = 0;
          while (!*((_BYTE *)&ca_debug_options + dword_18475EC84[v9]))
          {
            if (++v9 == 39)
            {
              v4 = 0;
              goto LABEL_7;
            }
          }
          v4 = 0;
          options_are_visual = 1;
        }
        else
        {
          v4 = 53;
        }
      }
    }
  }
LABEL_7:
  v5 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *v5;
  return result;
}

void _XClearColorDebugOptions(_DWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  _QWORD *v6;
  __int128 v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    v5 = -304;
  }
  else
  {
    v4 = a1[6];
    v3 = a1 + 6;
    if (v4 || v3[1] < 0x20u)
    {
      v5 = -309;
    }
    else
    {
      v7 = *(_OWORD *)(v3 + 9);
      v10[0] = *(_OWORD *)(v3 + 5);
      v10[1] = v7;
      if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2) & 0x80) != 0
        || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v8) & 0x20000) != 0)
      {
        v5 = -81182719;
      }
      else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v9) & 0x100) != 0)
      {
        CAClearColorDebugOptions();
        v5 = 0;
      }
      else
      {
        v5 = 53;
      }
    }
  }
  v6 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *v6;
}

uint64_t _XGetDebugFlags(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  __int128 v5;
  const audit_token_t *v6;
  const audit_token_t *v7;
  uint8x8_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = *(_DWORD *)(result + 24);
    result += 24;
    if (v3 || *(_DWORD *)(result + 4) <= 0x1Fu)
    {
      v4 = -309;
    }
    else
    {
      v5 = *(_OWORD *)(result + 36);
      v9[0] = *(_OWORD *)(result + 20);
      v9[1] = v5;
      result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v9, (const audit_token_t *)a2);
      if ((result & 0x80) != 0
        || (result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v9, v6), (result & 0x20000) != 0))
      {
        v4 = -81182719;
      }
      else
      {
        result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v9, v7);
        if ((result & 0x100) != 0)
        {
          result = CAGetDebugFlags(v8);
          *(_DWORD *)(a2 + 32) = 0;
          *(_DWORD *)(a2 + 36) = result;
          *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
          *(_DWORD *)(a2 + 4) = 40;
          return result;
        }
        v4 = 53;
      }
    }
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XSetDebugFlags(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  unsigned int v5;
  int v6;
  __int128 v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) < 0x20u)
  {
    v3 = -309;
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 36);
    v7 = *(_OWORD *)(a1 + 76);
    v10[0] = *(_OWORD *)(a1 + 60);
    v10[1] = v7;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v8) & 0x20000) != 0)
    {
      v3 = -81182719;
    }
    else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v9) & 0x100) != 0)
    {
      CASetDebugFlags(v5, v6);
      v3 = 0;
    }
    else
    {
      v3 = 53;
    }
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *v4;
}

void _XGetDebugValue(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  __int128 v5;
  const audit_token_t *v6;
  const audit_token_t *v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    v3 = -309;
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 72);
    v8[0] = *(_OWORD *)(a1 + 56);
    v8[1] = v5;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, v6) & 0x20000) != 0)
    {
      v3 = -81182719;
    }
    else
    {
      if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v8, v7) & 0x100) != 0)
      {
        *(float *)(a2 + 36) = CAGetDebugValueFloat(v4);
        *(_DWORD *)(a2 + 32) = 0;
        *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)(a2 + 4) = 40;
        return;
      }
      v3 = 53;
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XSetDebugValue(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  unsigned int v5;
  float v6;
  __int128 v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) < 0x20u)
  {
    v3 = -309;
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6 = *(float *)(a1 + 36);
    v7 = *(_OWORD *)(a1 + 76);
    v10[0] = *(_OWORD *)(a1 + 60);
    v10[1] = v7;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v8) & 0x20000) != 0)
    {
      v3 = -81182719;
    }
    else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v9) & 0x100) != 0)
    {
      CASetDebugValueFloat(v5, v6);
      v3 = 0;
    }
    else
    {
      v3 = 53;
    }
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *v4;
}

void _XDebugBrightness(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  NSObject *global_queue;
  _QWORD block[5];
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) < 0x20u)
  {
    v3 = -309;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_OWORD *)(a1 + 76);
    v11[0] = *(_OWORD *)(a1 + 60);
    v11[1] = v6;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v7) & 0x20000) != 0)
    {
      v3 = -81182719;
    }
    else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v8) & 0x100) != 0)
    {
      global_queue = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN2CA12WindowServer15DebugBrightnessEd_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v5;
      dispatch_async(global_queue, block);
      v3 = 0;
    }
    else
    {
      v3 = 53;
    }
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *v4;
}

void _XDebugPreset(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  int v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  NSObject *global_queue;
  _QWORD block[4];
  int v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) < 0x20u)
  {
    v3 = -309;
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6 = *(_OWORD *)(a1 + 72);
    v12[0] = *(_OWORD *)(a1 + 56);
    v12[1] = v6;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v12, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v12, v7) & 0x20000) != 0)
    {
      v3 = -81182719;
    }
    else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v12, v8) & 0x100) != 0)
    {
      if (CADeviceDisplaySupportsICC::once != -1)
        dispatch_once(&CADeviceDisplaySupportsICC::once, &__block_literal_global_143);
      if (CADeviceDisplaySupportsICC::supports_icc)
      {
        global_queue = dispatch_get_global_queue(33, 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = ___ZN2CA12WindowServer11DebugPresetEj_block_invoke;
        block[3] = &__block_descriptor_36_e5_v8__0l;
        v11 = v5;
        dispatch_async(global_queue, block);
      }
      v3 = 0;
    }
    else
    {
      v3 = 53;
    }
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *v4;
}

void _XDebugFrameInfo(_DWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  _QWORD *v6;
  __int128 v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  NSObject *global_queue;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    v5 = -304;
  }
  else
  {
    v4 = a1[6];
    v3 = a1 + 6;
    if (v4 || v3[1] < 0x20u)
    {
      v5 = -309;
    }
    else
    {
      v7 = *(_OWORD *)(v3 + 9);
      v11[0] = *(_OWORD *)(v3 + 5);
      v11[1] = v7;
      if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, (const audit_token_t *)a2) & 0x80) != 0
        || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v8) & 0x20000) != 0)
      {
        v5 = -81182719;
      }
      else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v9) & 0x100) != 0)
      {
        global_queue = dispatch_get_global_queue(33, 0);
        dispatch_async(global_queue, &__block_literal_global_207);
        v5 = 0;
      }
      else
      {
        v5 = 53;
      }
    }
  }
  v6 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *v6;
}

uint64_t _XSetMessageFile(const char *a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  const char *v9;
  __int128 v10;
  _QWORD *v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)a1;
  result = 4294966992;
  if ((v4 & 0x80000000) == 0)
  {
    v6 = *((unsigned int *)a1 + 1);
    if (v6 >= 0x28 && v6 <= 0x128)
    {
      v7 = *((_DWORD *)a1 + 9);
      v8 = v7 <= 0x100 && (int)v6 - 40 >= v7;
      if (v8 && (_DWORD)v6 == ((v7 + 3) & 0xFFFFFFFC) + 40)
      {
        if (memchr((void *)(a1 + 40), 0, v6 - 40))
        {
          v9 = &a1[(v6 + 3) & 0x1FFFFFFFCLL];
          if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) < 0x20u)
          {
            result = 4294966987;
          }
          else
          {
            v10 = *(_OWORD *)(v9 + 36);
            v12[0] = *(_OWORD *)(v9 + 20);
            v12[1] = v10;
            result = CASSetMessageFile(a1 + 40, (CA::Render::Server *)v12);
          }
        }
        else
        {
          result = 4294966992;
        }
      }
    }
  }
  v11 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *v11;
  return result;
}

uint64_t _XSetDebugMessage(const char *a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v10;
  const char *v11;
  const audit_token_t *v12;
  __int128 v13;
  _QWORD *v14;
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)a1;
  result = 4294966992;
  if ((v4 & 0x80000000) == 0)
  {
    v6 = *((unsigned int *)a1 + 1);
    if (v6 >= 0x2C && v6 <= 0x12C)
    {
      v7 = *((_DWORD *)a1 + 9);
      if (v7 <= 0x100)
      {
        v8 = (v7 + 3) & 0xFFFFFFFC;
        if ((int)v6 - 44 >= v7 && (_DWORD)v6 == v8 + 44)
        {
          v10 = 296;
          if (*((unsigned int *)a1 + 1) < 0x128uLL)
            v10 = *((unsigned int *)a1 + 1);
          if (memchr((void *)(a1 + 40), 0, v10 - 40))
          {
            v11 = &a1[(v6 + 3) & 0x1FFFFFFFCLL];
            if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u)
            {
              result = 4294966987;
            }
            else
            {
              v12 = (const audit_token_t *)*(unsigned int *)&a1[v8 + 40];
              v13 = *(_OWORD *)(v11 + 36);
              v15[0] = *(_OWORD *)(v11 + 20);
              v15[1] = v13;
              result = CASSetDebugMessage(a1 + 40, v12, (CA::Render::Server *)v15);
            }
          }
          else
          {
            result = 4294966992;
          }
        }
      }
    }
  }
  v14 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *v14;
  return result;
}

uint64_t _XSetLUTFile(const char *a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  const char *v9;
  __int128 v10;
  _QWORD *v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)a1;
  result = 4294966992;
  if ((v4 & 0x80000000) == 0)
  {
    v6 = *((unsigned int *)a1 + 1);
    if (v6 >= 0x28 && v6 <= 0x128)
    {
      v7 = *((_DWORD *)a1 + 9);
      v8 = v7 <= 0x100 && (int)v6 - 40 >= v7;
      if (v8 && (_DWORD)v6 == ((v7 + 3) & 0xFFFFFFFC) + 40)
      {
        if (memchr((void *)(a1 + 40), 0, v6 - 40))
        {
          v9 = &a1[(v6 + 3) & 0x1FFFFFFFCLL];
          if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) < 0x20u)
          {
            result = 4294966987;
          }
          else
          {
            v10 = *(_OWORD *)(v9 + 36);
            v12[0] = *(_OWORD *)(v9 + 20);
            v12[1] = v10;
            result = CASSetLUTFile(a1 + 40, (CA::Render::Server *)v12);
          }
        }
        else
        {
          result = 4294966992;
        }
      }
    }
  }
  v11 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *v11;
  return result;
}

void _XSetAXMatrix(uint64_t a1, uint64_t a2)
{
  int v4;
  _QWORD *v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  __int128 v9;
  _OWORD v10[2];
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 72)
  {
    v4 = -304;
  }
  else if (*(_DWORD *)(a1 + 72) || *(_DWORD *)(a1 + 76) < 0x20u)
  {
    v4 = -309;
  }
  else
  {
    v6 = *(_OWORD *)(a1 + 108);
    v10[0] = *(_OWORD *)(a1 + 92);
    v10[1] = v6;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, (const audit_token_t *)a2) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v7) & 0x20000) != 0)
    {
      v4 = -81182719;
    }
    else if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v10, v8) & 0x100) != 0)
    {
      v9 = *(_OWORD *)(a1 + 48);
      v11[0] = *(_OWORD *)(a1 + 32);
      v11[1] = v9;
      v12 = *(_QWORD *)(a1 + 64);
      CA::Render::post_notification(0x27u, 0, (uint64_t)v11, 0);
      v4 = 0;
    }
    else
    {
      v4 = 53;
    }
  }
  v5 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *v5;
}

void _XGetServerInfo(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  void *v10;
  size_t v11;
  vm_address_t v12;
  int v13;
  vm_address_t address;
  _QWORD v15[3];
  void *__src;
  void *v17;
  uint64_t v18;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 44) || *(_DWORD *)(a1 + 48) <= 0x1Fu)
  {
    v3 = -309;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v4 = *(_DWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 36);
    v6 = *(_OWORD *)(a1 + 80);
    v19[0] = *(_OWORD *)(a1 + 64);
    v19[1] = v6;
    *(_QWORD *)(a2 + 28) = 0;
    *(_DWORD *)(a2 + 52) = 0;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, (const audit_token_t *)a2) & 0x10) == 0)
      goto LABEL_10;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, v7) & 0x80) != 0
      || (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, v8) & 0x20000) != 0)
    {
      v3 = -81182719;
      goto LABEL_7;
    }
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v19, v9) & 0x100) != 0)
    {
      __src = 0;
      v17 = 0;
      v18 = 0;
      v15[1] = v5;
      v15[0] = v4;
      v15[2] = &__src;
      CA::Render::post_notification(0x30u, 0, (uint64_t)v15, 0);
      v10 = v17;
      address = 0;
      v11 = (_BYTE *)v17 - (_BYTE *)__src;
      if (v17 != __src)
      {
        vm_allocate(*MEMORY[0x1E0C83DA0], &address, (v11 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8], 1);
        v10 = __src;
        if (address)
        {
          memcpy((void *)address, __src, v11);
          v10 = __src;
        }
      }
      if (v10)
        free(v10);
      v12 = address;
      *(_QWORD *)(a2 + 28) = address;
      if (v12)
        v13 = v11;
      else
        v13 = 0;
      *(_DWORD *)(a2 + 52) = v13;
      if (v12)
      {
        *(_DWORD *)(a2 + 40) = v13;
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
      v3 = 5;
    }
    else
    {
LABEL_10:
      v3 = 53;
    }
  }
LABEL_7:
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

uint64_t _XImageProviderGetNeededSubImage(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  CA::Render::Context *v5;
  uint64_t v6;
  __int128 v7;
  const audit_token_t *v8;
  uint64_t v9;
  pthread_mutex_t *v10;
  int v11;
  int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
LABEL_8:
    *(_QWORD *)(a2 + 24) = v4;
    return result;
  }
  v5 = (CA::Render::Context *)*(unsigned int *)(result + 12);
  v6 = *(_QWORD *)(result + 32);
  v7 = *(_OWORD *)(result + 76);
  v16[0] = *(_OWORD *)(result + 60);
  v16[1] = v7;
  result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v16, (const audit_token_t *)a2);
  if ((result & 0x80) != 0
    || (result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v16, v8), (result & 0x20000) != 0))
  {
    v3 = -81182719;
    goto LABEL_7;
  }
  result = CA::Render::Context::context_by_server_port(v5);
  if (!result)
  {
    v3 = 56;
    goto LABEL_7;
  }
  v9 = result;
  v10 = (pthread_mutex_t *)(result + 72);
  pthread_mutex_lock((pthread_mutex_t *)(result + 72));
  v11 = CA::Render::ImageProvider::needed_subimage(*(CA::Render::ImageProvider **)(v9 + 136), (CA::Render::Context *)*(unsigned int *)(v9 + 148), v6, (unsigned int *)(a2 + 36), (unsigned int *)(a2 + 40), (unsigned int *)(a2 + 44), (unsigned int *)(a2 + 48));
  result = pthread_mutex_unlock(v10);
  if (v11)
    v12 = 0;
  else
    v12 = 48;
  v13 = (unsigned int *)(v9 + 8);
  do
  {
    v14 = __ldaxr(v13);
    v15 = v14 - 1;
  }
  while (__stlxr(v15, v13));
  if (!v15)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
  *(_DWORD *)(a2 + 32) = v12;
  v4 = *MEMORY[0x1E0C804E8];
  if ((v11 & 1) == 0)
    goto LABEL_8;
  *(_QWORD *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 4) = 52;
  return result;
}

uint64_t _XGetLayerRendererInfo(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  CA::Render::Context *v5;
  CA::Render::Object *v6;
  int v7;
  __int128 v8;
  const audit_token_t *v9;
  CA::Render::Context *v10;
  pthread_mutex_t *v11;
  int layer_renderer_info;
  char v13;
  int v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20[2];
  _OWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
LABEL_8:
    *(_QWORD *)(a2 + 24) = v4;
    return result;
  }
  v5 = (CA::Render::Context *)*(unsigned int *)(result + 12);
  v6 = *(CA::Render::Object **)(result + 32);
  v7 = *(_DWORD *)(result + 40);
  v8 = *(_OWORD *)(result + 80);
  v21[0] = *(_OWORD *)(result + 64);
  v21[1] = v8;
  result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v21, (const audit_token_t *)a2);
  if ((result & 0x80) != 0
    || (result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v21, v9), (result & 0x20000) != 0))
  {
    v3 = -81182719;
    goto LABEL_7;
  }
  result = CA::Render::Context::context_by_server_port(v5);
  if (!result)
  {
    v3 = 56;
    goto LABEL_7;
  }
  v10 = (CA::Render::Context *)result;
  v11 = (pthread_mutex_t *)(result + 72);
  pthread_mutex_lock((pthread_mutex_t *)(result + 72));
  *(_QWORD *)v20 = 0;
  v19 = 0;
  layer_renderer_info = CA::Render::Context::get_layer_renderer_info(v10, v6, v7, (int *)&v20[1], v20, &v19);
  v13 = layer_renderer_info;
  if (layer_renderer_info)
  {
    v14 = 0;
    v15 = v20[0];
    *(_DWORD *)(a2 + 36) = v20[1];
    *(_DWORD *)(a2 + 40) = v15;
    *(_DWORD *)(a2 + 44) = v19;
  }
  else
  {
    v14 = 5;
  }
  result = pthread_mutex_unlock(v11);
  v16 = (unsigned int *)((char *)v10 + 8);
  do
  {
    v17 = __ldaxr(v16);
    v18 = v17 - 1;
  }
  while (__stlxr(v18, v16));
  if (!v18)
    result = (*(uint64_t (**)(CA::Render::Context *))(*(_QWORD *)v10 + 16))(v10);
  *(_DWORD *)(a2 + 32) = v14;
  v4 = *MEMORY[0x1E0C804E8];
  if ((v13 & 1) == 0)
    goto LABEL_8;
  *(_QWORD *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 4) = 48;
  return result;
}

void _XRequestFramePhaseShift(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 48)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(a1 + 48) && *(_DWORD *)(a1 + 52) > 0x1Fu)
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 0uLL;
      *(_QWORD *)((char *)&v5 + 4) = *(_QWORD *)(a1 + 32);
      v6 = v4;
      CA::Render::post_notification(0x39u, 0, (uint64_t)&v5, 0);
      *(_BYTE *)(a2 + 36) = v5;
      *(_DWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

uint64_t _XGetDisplayStateShmem(uint64_t result, uint64_t a2)
{
  int v3;
  unsigned int v4;
  __int128 v5;
  const audit_token_t *v6;
  const audit_token_t *v7;
  mach_port_t *v8;
  uint64_t v9;
  mach_port_t *object_handle;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  *(_QWORD *)(a2 + 32) = 0x13000000000000;
  v4 = *(_DWORD *)(result + 32);
  v5 = *(_OWORD *)(result + 72);
  v11[0] = *(_OWORD *)(result + 56);
  v11[1] = v5;
  result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, (const audit_token_t *)a2);
  if ((result & 0x80) != 0
    || (result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v6), (result & 0x20000) != 0)
    || (result = CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v7), (result & 0x10000) == 0))
  {
    v3 = -81182719;
    goto LABEL_7;
  }
  object_handle = 0;
  v9 = v4;
  CA::Render::post_notification(0x41u, 0, (uint64_t)&v9, 0);
  result = (uint64_t)object_handle;
  if (object_handle)
  {
    result = CA::Render::Shmem::port(object_handle);
    v8 = object_handle;
    *(_DWORD *)(a2 + 28) = result;
    if (v8)
      v8 = (mach_port_t *)*((_QWORD *)v8 + 2);
  }
  else
  {
    v8 = 0;
    *(_DWORD *)(a2 + 28) = 0;
  }
  *(_QWORD *)(a2 + 40) = *MEMORY[0x1E0C804E8];
  *(_QWORD *)(a2 + 48) = v8;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XSetDisplayState(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  const audit_token_t *v5;
  unsigned __int8 v6;
  char v7;
  __int128 v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 60) && *(_DWORD *)(result + 64) > 0x1Fu)
      {
        v4 = *(_DWORD *)(result + 28);
        v5 = (const audit_token_t *)*(unsigned int *)(result + 48);
        v6 = *(_BYTE *)(result + 52);
        v7 = *(_BYTE *)(result + 56);
        v8 = *(_OWORD *)(result + 96);
        v9[0] = *(_OWORD *)(result + 80);
        v9[1] = v8;
        result = CASSetDisplayState(v4, v5, v6, v7, (CA::Render::Server *)v9);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      v3 = -309;
    }
    else
    {
      v3 = -300;
    }
  }
  else
  {
    v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XCreateDisplayPowerAssertion(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, audit_token_t *a7)
{
  int v8;
  const audit_token_t *v9;
  int v10;
  mach_port_name_t v11;
  int v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 60) && *(_DWORD *)(result + 64) > 0x1Fu)
      {
        v10 = *(_DWORD *)(result + 48);
        v9 = (const audit_token_t *)*(unsigned int *)(result + 52);
        v11 = *(_DWORD *)(result + 28);
        v12 = *(_DWORD *)(result + 56);
        v13 = *(_OWORD *)(result + 96);
        v14[0] = *(_OWORD *)(result + 80);
        v14[1] = v13;
        result = _CreateDisplayPowerAssertion(v10, v9, v11, v12, 0, (CA::Render::Server *)v14, a7);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      v8 = -309;
    }
    else
    {
      v8 = -300;
    }
  }
  else
  {
    v8 = -304;
  }
  *(_DWORD *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XCreateDisplayPowerAssertionSync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, audit_token_t *a7)
{
  uint64_t result;
  _QWORD *v9;
  const audit_token_t *v10;
  int v11;
  mach_port_name_t v12;
  int v13;
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112)
    {
      if (*(_DWORD *)(a1 + 60) || *(_DWORD *)(a1 + 64) < 0x20u)
      {
        result = 4294966987;
      }
      else
      {
        v11 = *(_DWORD *)(a1 + 48);
        v10 = (const audit_token_t *)*(unsigned int *)(a1 + 52);
        v12 = *(_DWORD *)(a1 + 28);
        v13 = *(_DWORD *)(a1 + 56);
        v14 = *(_OWORD *)(a1 + 96);
        v15[0] = *(_OWORD *)(a1 + 80);
        v15[1] = v14;
        result = _CreateDisplayPowerAssertion(v11, v10, v12, v13, 1u, (CA::Render::Server *)v15, a7);
      }
    }
    else
    {
      result = 4294966996;
    }
  }
  else
  {
    result = 4294966992;
  }
  v9 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *v9;
  return result;
}

uint64_t _XDestroyDisplayPowerAssertion(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  const audit_token_t *v5;
  __int128 v6;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 52)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 52) && *(_DWORD *)(result + 56) > 0x1Fu)
      {
        v4 = *(_DWORD *)(result + 48);
        v5 = (const audit_token_t *)*(unsigned int *)(result + 28);
        v6 = *(_OWORD *)(result + 88);
        v7[0] = *(_OWORD *)(result + 72);
        v7[1] = v6;
        result = CASDestroyDisplayPowerAssertion(v4, v5, (CA::Render::Server *)v7);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      v3 = -309;
    }
    else
    {
      v3 = -300;
    }
  }
  else
  {
    v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XCopyDisplayPowerAssertionInfo(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  __int128 v5;
  const audit_token_t *v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  void *v9;
  size_t v10;
  void *v11;
  int v12;
  void *__dst;
  _QWORD v14[2];
  void *__src;
  void *v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    v3 = -309;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v4 = *(_DWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 72);
    v18[0] = *(_OWORD *)(a1 + 56);
    v18[1] = v5;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v18, (const audit_token_t *)a2) & 0x80) == 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v18, v6) & 0x20000) == 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v18, v7) & 0x100) != 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v18, v8) & 0x10000) != 0)
    {
      __src = 0;
      v16 = 0;
      v17 = 0;
      v14[1] = &__src;
      v14[0] = v4;
      CA::Render::post_notification(0x45u, 0, (uint64_t)v14, 0);
      v9 = v16;
      __dst = 0;
      v10 = (_BYTE *)v16 - (_BYTE *)__src;
      if (v16 != __src)
      {
        vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)&__dst, (v10 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8], 1);
        v9 = __src;
        if (__dst)
        {
          memcpy(__dst, __src, v10);
          v9 = __src;
        }
      }
      if (v9)
        free(v9);
      v11 = __dst;
      *(_QWORD *)(a2 + 28) = __dst;
      if (v11)
        v12 = v10;
      else
        v12 = 0;
      *(_DWORD *)(a2 + 52) = v12;
      if (v11)
      {
        *(_DWORD *)(a2 + 40) = v12;
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
      v3 = 5;
    }
    else
    {
      v3 = -81182719;
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XDebugDisplayStateOldInterface(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  char v5;
  __int128 v6;
  const audit_token_t *v7;
  const audit_token_t *v8;
  const audit_token_t *v9;
  char v10;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) < 0x20u)
  {
    v3 = -309;
  }
  else
  {
    v5 = *(_BYTE *)(a1 + 32);
    v6 = *(_OWORD *)(a1 + 72);
    v11[0] = *(_OWORD *)(a1 + 56);
    v11[1] = v6;
    v10 = v5;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, (const audit_token_t *)a2) & 0x80) == 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v7) & 0x20000) == 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v8) & 0x100) != 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v11, v9) & 0x10000) != 0)
    {
      CA::Render::post_notification(0x46u, 0, (uint64_t)&v10, 0);
      v3 = 0;
    }
    else
    {
      v3 = -81182719;
    }
  }
  v4 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *v4;
}

void _XGetDisplayDebugProperties(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  __int128 v5;
  const audit_token_t *v6;
  const audit_token_t *v7;
  const __CFData *Data;
  const __CFData *v9;
  size_t Length;
  void *v11;
  const UInt8 *BytePtr;
  int v13;
  vm_address_t v14;
  vm_address_t address;
  uint64_t v16;
  CFDictionaryRef theDict;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
  }
  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    v3 = -309;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v4 = *(_DWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 72);
    v18[0] = *(_OWORD *)(a1 + 56);
    v18[1] = v5;
    if ((CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v18, (const audit_token_t *)a2) & 0x80) == 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v18, v6) & 0x20000) == 0
      && (CA::Render::Server::audit_token_cache_lookup((CA::Render::Server *)v18, v7) & 0x100) != 0)
    {
      v16 = v4;
      theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CA::Render::post_notification(0x47u, 0, (uint64_t)&v16, 0);
      if (CFDictionaryGetCount(theDict))
      {
        address = 0;
        Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE18], theDict, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          v9 = Data;
          Length = CFDataGetLength(Data);
          vm_allocate(*MEMORY[0x1E0C83DA0], &address, (Length + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8], 1);
          v11 = (void *)address;
          if (address)
          {
            BytePtr = CFDataGetBytePtr(v9);
            memcpy(v11, BytePtr, Length);
          }
          CFRelease(v9);
        }
        else
        {
          LODWORD(Length) = 0;
        }
        CFRelease(theDict);
        v14 = address;
        *(_QWORD *)(a2 + 28) = address;
        if (v14)
          v13 = Length;
        else
          v13 = 0;
        *(_DWORD *)(a2 + 52) = v13;
        if (!v14)
        {
          v3 = 5;
          goto LABEL_7;
        }
      }
      else
      {
        CFRelease(theDict);
        v13 = *(_DWORD *)(a2 + 52);
      }
      *(_DWORD *)(a2 + 40) = v13;
      *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
      *(_DWORD *)a2 |= 0x80000000;
      *(_DWORD *)(a2 + 4) = 56;
      *(_DWORD *)(a2 + 24) = 1;
      return;
    }
    v3 = -81182719;
  }
LABEL_7:
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XGetArchivedLocalLayerTree(uint64_t a1, uint64_t a2)
{
  mach_port_t v3;
  int v4;
  int *v5;
  CA::Context *v6;
  objc_class *v7;
  objc_class *v8;
  char v9;
  const __CFData *v10;
  int v11;
  mach_msg_return_t v12;
  mach_msg_header_t msg;
  __int128 v14;
  int Length;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    v11 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v11;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1179648)
  {
    v11 = -300;
    goto LABEL_10;
  }
  v3 = *(_DWORD *)(a1 + 28);
  if (v3)
  {
    v4 = *(_DWORD *)(a1 + 52);
    v5 = CA::Context::retain_context_with_client_id((CA::Context *)*(unsigned int *)(a1 + 48));
    if (v5)
    {
      v6 = (CA::Context *)v5;
      v7 = (objc_class *)CA::Context::retain_layer((CA::Context *)v5);
      if (v7)
      {
        v8 = v7;
        v9 = CAEncodeIOSurfacesAsCGImages;
        CAEncodeIOSurfacesAsCGImages = v4 & 1;
        v10 = (const __CFData *)CAEncodeLayerTreeWithInfo(v7, 0);
        CAEncodeIOSurfacesAsCGImages = v9;
        CFRelease(v8);
      }
      else
      {
        v10 = 0;
      }
      CA::Context::unref(v6, 0);
    }
    else
    {
      v10 = 0;
    }
    v14 = 0uLL;
    Length = 0;
    *(_QWORD *)&msg.msgh_bits = 0x2C00000012;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1195461716;
    if (v10)
    {
      msg.msgh_bits = -2147483630;
      LODWORD(v14) = 1;
      *(_QWORD *)((char *)&v14 + 4) = CFDataGetBytePtr(v10);
      HIDWORD(v14) = 16777472;
      Length = CFDataGetLength(v10);
    }
    v12 = mach_msg(&msg, 1, 0x2Cu, 0, 0, 0, 0);
    if ((v12 - 268435459) <= 1)
      mach_msg_destroy(&msg);
    if (v10)
      CFRelease(v10);
  }
  else
  {
    v12 = 0;
  }
  *(_DWORD *)(a2 + 32) = v12;
}

uint64_t _CACImageQueueDidChangeDisplay(mach_port_t a1, mach_msg_timeout_t timeout, int a3)
{
  uint64_t v4;
  mach_msg_header_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0C804E8];
  v8 = a3;
  *(_QWORD *)&v6.msgh_bits = 19;
  v6.msgh_voucher_port = 0;
  v6.msgh_id = 40406;
  v6.msgh_remote_port = a1;
  v6.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v6);
  v4 = mach_msg(&v6, 17, 0x24u, 0, 0, timeout, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((v6.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v6.msgh_local_port);
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t _CACContentStreamSurfaceProduced(int a1, mach_msg_timeout_t timeout, int a3, __int128 *a4)
{
  __int128 v5;
  uint64_t v6;
  _BYTE msg[36];
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[28] = a3;
  v9 = 1245184;
  v10 = *MEMORY[0x1E0C804E8];
  v5 = a4[1];
  v11 = *a4;
  v12 = v5;
  v13 = a4[2];
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_QWORD *)&msg[20] = 0x100009DDBLL;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v6 = mach_msg((mach_msg_header_t *)msg, 17, 0x60u, 0, 0, timeout, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v6;
}

void _CACDisplayDidChangeToState(mach_port_t a1, int a2, char a3, char a4, char a5)
{
  mach_msg_header_t msg;
  uint64_t v6;
  int v7;
  char v8;
  __int16 v9;
  char v10;
  char v11;
  __int16 v12;
  char v13;
  char v14;
  __int16 v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  v9 = 0;
  v10 = 0;
  v11 = a4;
  v12 = 0;
  v13 = 0;
  v14 = a5;
  v15 = 0;
  v16 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 40412;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  if ((mach_msg(&msg, 17, 0x30u, 0, 0, 0, 0) - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
}

uint64_t (*CARenderClient_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 40414) >= 0xFFFFFFF2)
    return CACCARenderClient_subsystem[5 * (v1 - 40400) + 5];
  else
    return 0;
}

_DWORD *_XSetContextGPURegistryID(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    *(_DWORD *)(a2 + 32) = 0;
  }
  return result;
}

void _XImageQueueDidChangeDisplay(_DWORD *a1, uint64_t a2)
{
  int v3;
  CFTypeRef *v4;
  void *v5;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    v3 = a1[8];
    pthread_mutex_lock(&display_change_mutex);
    v4 = (CFTypeRef *)display_change_list;
    if (display_change_list)
    {
      while (1)
      {
        v5 = (void *)*v4;
        if (*((_DWORD *)*v4 + 7) == v3)
          break;
        v4 = (CFTypeRef *)v4[1];
        if (!v4)
          goto LABEL_6;
      }
      CFRetain(*v4);
      pthread_mutex_unlock(&display_change_mutex);
      if (CA::MachPortUtil::reply_queue(void)::once != -1)
        dispatch_once(&CA::MachPortUtil::reply_queue(void)::once, &__block_literal_global_8138);
      dispatch_async_f((dispatch_queue_t)CA::MachPortUtil::reply_queue(void)::queue, v5, (dispatch_function_t)invoke_display_change_callback);
    }
    else
    {
LABEL_6:
      pthread_mutex_unlock(&display_change_mutex);
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void _XTransactionDidPresent(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[6];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 68)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (initialized[0] != -1)
      dispatch_once_f(initialized, 0, (dispatch_function_t)init_debug);
    if (BYTE9(xmmword_1ECDC6A90))
      kdebug_trace();
    if (CACTransactionDidPresent::max_seed < v3)
    {
      CACTransactionDidPresent::max_seed = v3;
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::presentation_handler_lock);
      if (CA::Transaction::presentation_handler)
        v5 = _Block_copy((const void *)CA::Transaction::presentation_handler);
      else
        v5 = 0;
      if (CA::Transaction::presentation_handler_queue)
        v6 = CA::Transaction::presentation_handler_queue;
      else
        v6 = MEMORY[0x1E0C80D38];
      dispatch_retain(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)&CA::Transaction::presentation_handler_lock);
      if (v5)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = ___Z23CATransactionDidPresentjjdyyh_block_invoke;
        v7[3] = &unk_1E15AB170;
        v7[4] = v5;
        v8 = v3;
        v7[5] = v4;
        dispatch_async(v6, v7);
        _Block_release(v5);
      }
      dispatch_release(v6);
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void sub_18473F30C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Transaction::presentation_handler_lock);
  _Unwind_Resume(a1);
}

void _XImageProviderSignal(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    CAImageProviderSignal(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40));
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void _XGetArchivedLayerTree(uint64_t a1, uint64_t a2)
{
  mach_port_t v3;
  int v4;
  int *v5;
  CA::Context *v6;
  objc_class *v7;
  objc_class *v8;
  char v9;
  const __CFData *v10;
  int v11;
  mach_msg_return_t v12;
  mach_msg_header_t msg;
  __int128 v14;
  int Length;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 52)
  {
    v11 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v11;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1179648)
  {
    v11 = -300;
    goto LABEL_10;
  }
  v3 = *(_DWORD *)(a1 + 28);
  if (v3)
  {
    v4 = *(_DWORD *)(a1 + 48);
    v5 = CA::Context::retain_context_with_client_port((CA::Context *)*(unsigned int *)(a1 + 12));
    if (v5)
    {
      v6 = (CA::Context *)v5;
      v7 = (objc_class *)CA::Context::retain_layer((CA::Context *)v5);
      if (v7)
      {
        v8 = v7;
        v9 = CAEncodeIOSurfacesAsCGImages;
        CAEncodeIOSurfacesAsCGImages = v4 & 1;
        v10 = (const __CFData *)CAEncodeLayerTreeWithInfo(v7, 0);
        CAEncodeIOSurfacesAsCGImages = v9;
        CFRelease(v8);
      }
      else
      {
        v10 = 0;
      }
      CA::Context::unref(v6, 0);
    }
    else
    {
      v10 = 0;
    }
    v14 = 0uLL;
    Length = 0;
    *(_QWORD *)&msg.msgh_bits = 0x2C00000012;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1195461716;
    if (v10)
    {
      msg.msgh_bits = -2147483630;
      LODWORD(v14) = 1;
      *(_QWORD *)((char *)&v14 + 4) = CFDataGetBytePtr(v10);
      HIDWORD(v14) = 16777472;
      Length = CFDataGetLength(v10);
    }
    v12 = mach_msg(&msg, 1, 0x2Cu, 0, 0, 0, 0);
    if ((v12 - 268435459) <= 1)
      mach_msg_destroy(&msg);
    if (v10)
      CFRelease(v10);
  }
  else
  {
    v12 = 0;
  }
  *(_DWORD *)(a2 + 32) = v12;
}

void _XContentStreamSurfaceProduced(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  id *v6;
  uint64_t v7;
  id v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 96)
  {
    v9 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v9;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112)
  {
    v9 = -300;
    goto LABEL_10;
  }
  v3 = *(_DWORD *)(a1 + 12);
  v4 = *(unsigned int *)(a1 + 28);
  v5 = *(_OWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 48);
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)&_all_streams_lock);
  v6 = (id *)_all_streams;
  v7 = qword_1EDD10C78;
  while (v6 != (id *)v7)
  {
    v8 = *v6;
    if (objc_msgSend(*v6, "streamId", v10, v11, v12) == v3)
    {
      objc_msgSend(v8, "produceSurface:withFrameInfo:", v4, &v10);
      break;
    }
    ++v6;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_streams_lock);
  if ((_DWORD)v4)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v4);
  *(_DWORD *)(a2 + 32) = 0;
}

void sub_18473F69C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_streams_lock);
  _Unwind_Resume(a1);
}

void _XDisplayDidChangeToState(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  id *v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 48)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 36);
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 44);
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v7 = x_log_category_display_state;
      if (os_log_type_enabled((os_log_t)x_log_category_display_state, OS_LOG_TYPE_DEFAULT))
      {
        if (v4 > 0xB)
          v8 = "unknown";
        else
          v8 = off_1E159DA10[v4];
        if ((v6 + 1) > 6u)
          v9 = "unknown";
        else
          v9 = off_1E159DA70[(v6 + 1)];
        *(_DWORD *)buf = 67109890;
        v13 = v3;
        v14 = 2080;
        v15 = v8;
        v16 = 1024;
        v17 = v5;
        v18 = 2080;
        v19 = v9;
        _os_log_impl(&dword_184457000, v7, OS_LOG_TYPE_DEFAULT, "CADisplayDidChangeToState display_id=%u, state=%s, seed=%u, result=%s", buf, 0x22u);
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_controls_lock);
    v10 = (id *)_controls;
    v11 = qword_1EDD0F9D0;
    while (v10 != (id *)v11)
    {
      if (*((_DWORD *)*v10 + 10) == v3)
        objc_msgSend(*v10, "didChangeToState:seed:result:", v4, v5, v6);
      ++v10;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_controls_lock);
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void sub_18473F8E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_controls_lock);
  _Unwind_Resume(a1);
}

uint64_t _XDisplayNotifyDisallowedLayersChange(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    v3 = *(unsigned int *)(result + 32);
    v4 = *(unsigned __int8 *)(result + 36);
    if (x_log_hook_p())
    {
      v11 = v3;
      v12 = v4;
      x_log_();
    }
    else
    {
      v5 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v14 = v3;
        v15 = 1024;
        v16 = v4;
        _os_log_impl(&dword_184457000, v5, OS_LOG_TYPE_DEFAULT, "CADisplayNotifyDisallowedLayersChange display_id=%u, state=%d", buf, 0xEu);
      }
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = current_displays();
    result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, buf, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
          if (objc_msgSend(v10, "displayId", v11, v12) == (_DWORD)v3)
            objc_msgSend(v10, "_notifyDisallowedLayersChange:", (_DWORD)v4 != 0);
          ++v9;
        }
        while (v7 != v9);
        result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, buf, 16);
        v7 = result;
      }
      while (result);
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
  return result;
}

const __CFString *atomDescription(unsigned int a1)
{
  const __CFString *result;

  result = CAAtomGetString(a1);
  if (result)
    return (const __CFString *)CFRetain(result);
  return result;
}

uint64_t BMEnrollIntoBlockMonitoring()
{
  return MEMORY[0x1E0D03360]();
}

uint64_t BMMonitorBlockExecutionWithSignature()
{
  return MEMORY[0x1E0D03368]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFTypeID CFAttributedStringGetTypeID(void)
{
  return MEMORY[0x1E0C97E58]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x1E0C982A8](theSet, theString);
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982B8](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982C8](alloc);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInRange(CFAllocatorRef alloc, CFRange theRange)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E0](alloc, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
  MEMORY[0x1E0C98318](theSet);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
  MEMORY[0x1E0C98348](theSet, theOtherSet);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1E0C98C28](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
  MEMORY[0x1E0C98C78](observer);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98CA0](rl, timer, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D08](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x1E0C98D48](timer);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
  MEMORY[0x1E0C98D58](timer, fireDate);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x1E0C98DD0](theSet, values);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C991F0](theString, range.location, range.length, replacement);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99390](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99418](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t CGAccessSessionCreate()
{
  return MEMORY[0x1E0C9BA60]();
}

uint64_t CGAccessSessionGetBytes()
{
  return MEMORY[0x1E0C9BA70]();
}

uint64_t CGAccessSessionRelease()
{
  return MEMORY[0x1E0C9BA78]();
}

uint64_t CGAccessSessionSkipForward()
{
  return MEMORY[0x1E0C9BA88]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

uint64_t CGAffineTransformIsRectilinear()
{
  return MEMORY[0x1E0C9BAC0]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapContextSetData()
{
  return MEMORY[0x1E0C9BB88]();
}

uint64_t CGBlt_copyBytes()
{
  return MEMORY[0x1E0C9BBA8]();
}

uint64_t CGBlt_fillBytes()
{
  return MEMORY[0x1E0C9BBB0]();
}

uint64_t CGClipGetMask()
{
  return MEMORY[0x1E0C9BBB8]();
}

uint64_t CGClipGetMode()
{
  return MEMORY[0x1E0C9BBC0]();
}

uint64_t CGClipGetPath()
{
  return MEMORY[0x1E0C9BBC8]();
}

uint64_t CGClipGetRect()
{
  return MEMORY[0x1E0C9BBD0]();
}

uint64_t CGClipGetShouldAntialias()
{
  return MEMORY[0x1E0C9BBD8]();
}

uint64_t CGClipGetStroke()
{
  return MEMORY[0x1E0C9BBE0]();
}

uint64_t CGClipGetTextClipping()
{
  return MEMORY[0x1E0C9BBE8]();
}

uint64_t CGClipGetType()
{
  return MEMORY[0x1E0C9BBF0]();
}

uint64_t CGClipMaskGetImage()
{
  return MEMORY[0x1E0C9BBF8]();
}

uint64_t CGClipMaskGetMatrix()
{
  return MEMORY[0x1E0C9BC00]();
}

uint64_t CGClipMaskGetRect()
{
  return MEMORY[0x1E0C9BC08]();
}

uint64_t CGClipStackGetBounds()
{
  return MEMORY[0x1E0C9BC10]();
}

uint64_t CGClipStackGetClipAtIndex()
{
  return MEMORY[0x1E0C9BC18]();
}

uint64_t CGClipStackGetCount()
{
  return MEMORY[0x1E0C9BC20]();
}

uint64_t CGClipStackGetIdentifier()
{
  return MEMORY[0x1E0C9BC28]();
}

uint64_t CGClipStackGetRect()
{
  return MEMORY[0x1E0C9BC30]();
}

uint64_t CGClipStrokeCreateStrokedPath()
{
  return MEMORY[0x1E0C9BC38]();
}

uint64_t CGClipStrokeGetLineWidth()
{
  return MEMORY[0x1E0C9BC40]();
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1E0C9BC50](options, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x1E0C9BC70]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BCC0](space, pattern, components);
}

uint64_t CGColorCurveEqualToGammaCurve()
{
  return MEMORY[0x1E0C9BCC8]();
}

uint64_t CGColorCurveRelease()
{
  return MEMORY[0x1E0C9BCD0]();
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

uint64_t CGColorFunctionGetOutputRange()
{
  return MEMORY[0x1E0C9BCE8]();
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

uint64_t CGColorGetIdentifier()
{
  return MEMORY[0x1E0C9BD18]();
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x1E0C9BD28](color);
}

uint64_t CGColorGetPatternBaseColor()
{
  return MEMORY[0x1E0C9BD30]();
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x1E0C9BD40]();
}

uint64_t CGColorNxMTransformGetTransform()
{
  return MEMORY[0x1E0C9BD50]();
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

uint64_t CGColorSpaceContainsFlexGTCInfo()
{
  return MEMORY[0x1E0C9BD70]();
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1E0C9BD98](space);
}

uint64_t CGColorSpaceCopyICCProfileDescription()
{
  return MEMORY[0x1E0C9BDB0]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BDB8](space);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateCalibratedRGB(const CGFloat *whitePoint, const CGFloat *blackPoint, const CGFloat *gamma, const CGFloat *matrix)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDD0](whitePoint, blackPoint, gamma, matrix);
}

uint64_t CGColorSpaceCreateConversionCurve()
{
  return MEMORY[0x1E0C9BDD8]();
}

CGColorSpaceRef CGColorSpaceCreateExtended(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF8](space);
}

CGColorSpaceRef CGColorSpaceCreateLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE28](space);
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE30](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE40](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

uint64_t CGColorSpaceEqualToColorSpaceIgnoringRange()
{
  return MEMORY[0x1E0C9BE70]();
}

uint64_t CGColorSpaceGetAlternateColorSpace()
{
  return MEMORY[0x1E0C9BE78]();
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE80](space);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

uint64_t CGColorSpaceGetProcessColorModel()
{
  return MEMORY[0x1E0C9BEE0]();
}

uint64_t CGColorSpaceGetRenderingIntent()
{
  return MEMORY[0x1E0C9BEE8]();
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1E0C9BEF0]();
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1E0C9BEF8]();
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1E0C9BF08](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1E0C9BF18](s);
}

uint64_t CGColorSpaceIsUncalibrated()
{
  return MEMORY[0x1E0C9BF20]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF40](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF50](a1);
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x1E0C9BF58]();
}

uint64_t CGColorTRCGetGammaID()
{
  return MEMORY[0x1E0C9BF60]();
}

uint64_t CGColorTRCPureGammaOriginal()
{
  return MEMORY[0x1E0C9BF70]();
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1E0C9BF78]();
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1E0C9BF80]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1E0C9BF90]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1E0C9BFA0]();
}

uint64_t CGColorTransformRetain()
{
  return MEMORY[0x1E0C9BFA8]();
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFC0](c, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFE8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x1E0C9C008](c, auxiliaryInfo);
}

uint64_t CGContextClear()
{
  return MEMORY[0x1E0C9C018]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

uint64_t CGContextCreateWithDelegate()
{
  return MEMORY[0x1E0C9C090]();
}

uint64_t CGContextDelegateBeginLayer()
{
  return MEMORY[0x1E0C9C098]();
}

uint64_t CGContextDelegateCreate()
{
  return MEMORY[0x1E0C9C0A0]();
}

uint64_t CGContextDelegateDrawConicGradient()
{
  return MEMORY[0x1E0C9C0A8]();
}

uint64_t CGContextDelegateDrawDisplayList()
{
  return MEMORY[0x1E0C9C0B0]();
}

uint64_t CGContextDelegateDrawGlyphs()
{
  return MEMORY[0x1E0C9C0B8]();
}

uint64_t CGContextDelegateDrawImage()
{
  return MEMORY[0x1E0C9C0C0]();
}

uint64_t CGContextDelegateDrawImageFromRect()
{
  return MEMORY[0x1E0C9C0C8]();
}

uint64_t CGContextDelegateDrawImages()
{
  return MEMORY[0x1E0C9C0D0]();
}

uint64_t CGContextDelegateDrawLayer()
{
  return MEMORY[0x1E0C9C0D8]();
}

uint64_t CGContextDelegateDrawLinearGradient()
{
  return MEMORY[0x1E0C9C0E0]();
}

uint64_t CGContextDelegateDrawLines()
{
  return MEMORY[0x1E0C9C0E8]();
}

uint64_t CGContextDelegateDrawPath()
{
  return MEMORY[0x1E0C9C0F0]();
}

uint64_t CGContextDelegateDrawPathDirect()
{
  return MEMORY[0x1E0C9C0F8]();
}

uint64_t CGContextDelegateDrawRadialGradient()
{
  return MEMORY[0x1E0C9C100]();
}

uint64_t CGContextDelegateDrawRects()
{
  return MEMORY[0x1E0C9C108]();
}

uint64_t CGContextDelegateDrawShading()
{
  return MEMORY[0x1E0C9C110]();
}

uint64_t CGContextDelegateEndLayer()
{
  return MEMORY[0x1E0C9C118]();
}

uint64_t CGContextDelegateGetBounds()
{
  return MEMORY[0x1E0C9C120]();
}

uint64_t CGContextDelegateGetColorTransform()
{
  return MEMORY[0x1E0C9C128]();
}

uint64_t CGContextDelegateGetInfo()
{
  return MEMORY[0x1E0C9C130]();
}

uint64_t CGContextDelegateGetLayer()
{
  return MEMORY[0x1E0C9C138]();
}

uint64_t CGContextDelegateGetOwnerIdentity()
{
  return MEMORY[0x1E0C9C140]();
}

uint64_t CGContextDelegateOperation()
{
  return MEMORY[0x1E0C9C148]();
}

uint64_t CGContextDelegateRelease()
{
  return MEMORY[0x1E0C9C150]();
}

uint64_t CGContextDelegateSetCallback()
{
  return MEMORY[0x1E0C9C158]();
}

uint64_t CGContextDelegateSetCallbacks()
{
  return MEMORY[0x1E0C9C160]();
}

void CGContextDrawConicGradient(CGContextRef c, CGGradientRef gradient, CGPoint center, CGFloat angle)
{
  MEMORY[0x1E0C9C168](c, gradient, (__n128)center, *(__n128 *)&center.y, angle);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextDrawImageWithOptions()
{
  return MEMORY[0x1E0C9C180]();
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

uint64_t CGContextDrawPatternCell()
{
  return MEMORY[0x1E0C9C1C8]();
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C1D0](c, gradient, *(_QWORD *)&options, (__n128)startCenter, *(__n128 *)&startCenter.y, startRadius, (__n128)endCenter, *(__n128 *)&endCenter.y, endRadius);
}

void CGContextDrawShading(CGContextRef c, CGShadingRef shading)
{
  MEMORY[0x1E0C9C1D8](c, shading);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x1E0C9C200](c);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1E0C9C240]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

uint64_t CGContextGetDelegate()
{
  return MEMORY[0x1E0C9C270]();
}

uint64_t CGContextGetEDRTargetHeadroom()
{
  return MEMORY[0x1E0C9C278]();
}

uint64_t CGContextGetInterpolationQualityRange()
{
  return MEMORY[0x1E0C9C2A8]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

uint64_t CGContextReplacePathWithShapePath()
{
  return MEMORY[0x1E0C9C348]();
}

uint64_t CGContextResetState()
{
  return MEMORY[0x1E0C9C368]();
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
  MEMORY[0x1E0C9C3B0](c, allowsFontSubpixelQuantization);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x1E0C9C3B8](c, alpha);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1E0C9C3E8]();
}

uint64_t CGContextSetEDRTargetHeadroom()
{
  return MEMORY[0x1E0C9C3F0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

uint64_t CGContextSetInterpolationQualityRange()
{
  return MEMORY[0x1E0C9C460]();
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x1E0C9C478](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
  MEMORY[0x1E0C9C490](c, limit);
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
  MEMORY[0x1E0C9C498](c, (__n128)phase, *(__n128 *)&phase.height);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
  MEMORY[0x1E0C9C4E0](c, shouldSmoothFonts);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

uint64_t CGDashGetPattern()
{
  return MEMORY[0x1E0C9C590]();
}

uint64_t CGDashRelease()
{
  return MEMORY[0x1E0C9C598]();
}

uint64_t CGDashRetain()
{
  return MEMORY[0x1E0C9C5A0]();
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5E0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

uint64_t CGDataProviderGetSizeOfData()
{
  return MEMORY[0x1E0C9C628]();
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

uint64_t CGDataProviderReleaseBytePtr()
{
  return MEMORY[0x1E0C9C640]();
}

CGDataProviderRef CGDataProviderRetain(CGDataProviderRef provider)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C648](provider);
}

uint64_t CGDataProviderRetainBytePtr()
{
  return MEMORY[0x1E0C9C650]();
}

uint64_t CGDisplayListContextCreate()
{
  return MEMORY[0x1E0C9C660]();
}

uint64_t CGDisplayListCreateWithRect()
{
  return MEMORY[0x1E0C9C668]();
}

uint64_t CGDisplayListDrawInContext()
{
  return MEMORY[0x1E0C9C670]();
}

uint64_t CGDisplayListRelease()
{
  return MEMORY[0x1E0C9C6A0]();
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

uint64_t CGFontCreateGlyphPath()
{
  return MEMORY[0x1E0C9C740]();
}

uint64_t CGFontCreateWithName()
{
  return MEMORY[0x1E0C9C758]();
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9C7D8](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes)
{
  return MEMORY[0x1E0C9C7E8](font, glyphs, count, bboxes);
}

uint64_t CGFontGetGlyphIdentifiers()
{
  return MEMORY[0x1E0C9C7F8]();
}

CFTypeID CGFontGetTypeID(void)
{
  return MEMORY[0x1E0C9C858]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x1E0C9C878](font);
}

uint64_t CGFontGetVariationAxes()
{
  return MEMORY[0x1E0C9C888]();
}

uint64_t CGFontGetVariations()
{
  return MEMORY[0x1E0C9C890]();
}

void CGFontRelease(CGFontRef font)
{
  MEMORY[0x1E0C9C8E0](font);
}

uint64_t CGFunctionEvaluate()
{
  return MEMORY[0x1E0C9C900]();
}

uint64_t CGFunctionGetDomain()
{
  return MEMORY[0x1E0C9C908]();
}

uint64_t CGFunctionGetRangeDimension()
{
  return MEMORY[0x1E0C9C910]();
}

uint64_t CGFunctionIsIdentity()
{
  return MEMORY[0x1E0C9C918]();
}

uint64_t CGGStateCreate()
{
  return MEMORY[0x1E0C9C928]();
}

uint64_t CGGStateCreateCopy()
{
  return MEMORY[0x1E0C9C930]();
}

uint64_t CGGStateGetAlpha()
{
  return MEMORY[0x1E0C9C938]();
}

uint64_t CGGStateGetCTM()
{
  return MEMORY[0x1E0C9C940]();
}

uint64_t CGGStateGetClipStack()
{
  return MEMORY[0x1E0C9C948]();
}

uint64_t CGGStateGetCompositeOperation()
{
  return MEMORY[0x1E0C9C950]();
}

uint64_t CGGStateGetEDRTargetHeadroom()
{
  return MEMORY[0x1E0C9C958]();
}

uint64_t CGGStateGetFillColor()
{
  return MEMORY[0x1E0C9C960]();
}

uint64_t CGGStateGetFont()
{
  return MEMORY[0x1E0C9C968]();
}

uint64_t CGGStateGetFontRenderingStyle()
{
  return MEMORY[0x1E0C9C970]();
}

uint64_t CGGStateGetFontSize()
{
  return MEMORY[0x1E0C9C978]();
}

uint64_t CGGStateGetFontSmoothingBackgroundColor()
{
  return MEMORY[0x1E0C9C980]();
}

uint64_t CGGStateGetInterpolationQuality()
{
  return MEMORY[0x1E0C9C988]();
}

uint64_t CGGStateGetLineCap()
{
  return MEMORY[0x1E0C9C990]();
}

uint64_t CGGStateGetLineDash()
{
  return MEMORY[0x1E0C9C998]();
}

uint64_t CGGStateGetLineJoin()
{
  return MEMORY[0x1E0C9C9A0]();
}

uint64_t CGGStateGetPatternPhase()
{
  return MEMORY[0x1E0C9C9A8]();
}

uint64_t CGGStateGetShouldAntialias()
{
  return MEMORY[0x1E0C9C9B0]();
}

uint64_t CGGStateGetShouldDrawBitmapRuns()
{
  return MEMORY[0x1E0C9C9B8]();
}

uint64_t CGGStateGetSoftMask()
{
  return MEMORY[0x1E0C9C9C0]();
}

uint64_t CGGStateGetStrokeColor()
{
  return MEMORY[0x1E0C9C9C8]();
}

uint64_t CGGStateGetStrokeParameters()
{
  return MEMORY[0x1E0C9C9D0]();
}

uint64_t CGGStateGetStyle()
{
  return MEMORY[0x1E0C9C9D8]();
}

uint64_t CGGStateGetTextDrawingMode()
{
  return MEMORY[0x1E0C9C9E0]();
}

uint64_t CGGStateRelease()
{
  return MEMORY[0x1E0C9C9E8]();
}

uint64_t CGGStateResetClip()
{
  return MEMORY[0x1E0C9C9F0]();
}

uint64_t CGGStateRetain()
{
  return MEMORY[0x1E0C9C9F8]();
}

uint64_t CGGStateSetAlpha()
{
  return MEMORY[0x1E0C9CA00]();
}

uint64_t CGGStateSetCTM()
{
  return MEMORY[0x1E0C9CA08]();
}

uint64_t CGGStateSetCompositeOperation()
{
  return MEMORY[0x1E0C9CA10]();
}

uint64_t CGGStateSetFillColor()
{
  return MEMORY[0x1E0C9CA18]();
}

uint64_t CGGStateSetSoftMask()
{
  return MEMORY[0x1E0C9CA20]();
}

uint64_t CGGStateSetStrokeColor()
{
  return MEMORY[0x1E0C9CA28]();
}

uint64_t CGGStateSetStyle()
{
  return MEMORY[0x1E0C9CA30]();
}

uint64_t CGGlyphLockAccess()
{
  return MEMORY[0x1E0C9CA40]();
}

uint64_t CGGlyphLockCreate()
{
  return MEMORY[0x1E0C9CA48]();
}

uint64_t CGGlyphLockGetQuantizationLevel()
{
  return MEMORY[0x1E0C9CA50]();
}

uint64_t CGGlyphLockLockGlyphBitmaps()
{
  return MEMORY[0x1E0C9CA58]();
}

uint64_t CGGlyphLockRelease()
{
  return MEMORY[0x1E0C9CA60]();
}

uint64_t CGGlyphLockUnlock()
{
  return MEMORY[0x1E0C9CA68]();
}

uint64_t CGGradientApply()
{
  return MEMORY[0x1E0C9CA70]();
}

uint64_t CGGradientApplyWithBlock()
{
  return MEMORY[0x1E0C9CA78]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

uint64_t CGGradientCreateWithColorsAndOptions()
{
  return MEMORY[0x1E0C9CA98]();
}

uint64_t CGGradientGetColorSpace()
{
  return MEMORY[0x1E0C9CAA0]();
}

uint64_t CGGradientGetFunction()
{
  return MEMORY[0x1E0C9CAA8]();
}

uint64_t CGGradientGetIdentifier()
{
  return MEMORY[0x1E0C9CAB0]();
}

uint64_t CGGradientGetLocationCount()
{
  return MEMORY[0x1E0C9CAB8]();
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

uint64_t CGGradientUsesPremultipliedInterpolation()
{
  return MEMORY[0x1E0C9CAD0]();
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x1E0C9CB00]();
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x1E0C9CB08]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x1E0C9CB10]();
}

uint64_t CGImageBlockGetRect()
{
  return MEMORY[0x1E0C9CB18]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x1E0C9CB28]();
}

uint64_t CGImageBlockSetGetComponentType()
{
  return MEMORY[0x1E0C9CB38]();
}

uint64_t CGImageBlockSetGetCount()
{
  return MEMORY[0x1E0C9CB40]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x1E0C9CB48]();
}

uint64_t CGImageBlockSetGetRect()
{
  return MEMORY[0x1E0C9CB60]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1E0C9CB68]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CB88](image);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGImageCreateWithImageProvider()
{
  return MEMORY[0x1E0C9CBB0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

uint64_t CGImageEPSRepGetAlternateImage()
{
  return MEMORY[0x1E0C9CBE0]();
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

uint64_t CGImageGetCachingFlags()
{
  return MEMORY[0x1E0C9CC10]();
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1E0C9CC40](image);
}

uint64_t CGImageGetEPSRep()
{
  return MEMORY[0x1E0C9CC48]();
}

uint64_t CGImageGetHeadroom()
{
  return MEMORY[0x1E0C9CC50]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x1E0C9CC68]();
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1E0C9CC70]();
}

uint64_t CGImageGetMask()
{
  return MEMORY[0x1E0C9CC78]();
}

uint64_t CGImageGetMaskingColors()
{
  return MEMORY[0x1E0C9CC80]();
}

uint64_t CGImageGetMatte()
{
  return MEMORY[0x1E0C9CC88]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1E0C9CCC0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1E0C9CCD8]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x1E0C9CCE8](image);
}

uint64_t CGImageIsSubimage()
{
  return MEMORY[0x1E0C9CCF8]();
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

uint64_t CGImageNotificationCenter()
{
  return MEMORY[0x1E0C9CD08]();
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x1E0C9CD10]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x1E0C9CD20]();
}

uint64_t CGImageProviderCopyImageTextureData()
{
  return MEMORY[0x1E0C9CD28]();
}

uint64_t CGImageProviderCreate()
{
  return MEMORY[0x1E0C9CD30]();
}

uint64_t CGImageProviderGetAlphaInfo()
{
  return MEMORY[0x1E0C9CD38]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1E0C9CD58]();
}

uint64_t CGImageProviderGetInfo()
{
  return MEMORY[0x1E0C9CD68]();
}

uint64_t CGImageProviderRelease()
{
  return MEMORY[0x1E0C9CD88]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

uint64_t CGImageSetCachingFlags()
{
  return MEMORY[0x1E0C9CDB0]();
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

uint64_t CGImageSourceCopyTypeExtensions()
{
  return MEMORY[0x1E0CBC540]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CFTypeID CGImageSourceGetTypeID(void)
{
  return MEMORY[0x1E0CBC620]();
}

uint64_t CGImageTextureDataGetColorSpace()
{
  return MEMORY[0x1E0C9CDD8]();
}

uint64_t CGImageTextureDataGetNumberOfMipmaps()
{
  return MEMORY[0x1E0C9CDE8]();
}

uint64_t CGImageTextureDataGetOffsetWithBlock()
{
  return MEMORY[0x1E0C9CDF0]();
}

uint64_t CGImageTextureDataGetPixelFormat()
{
  return MEMORY[0x1E0C9CDF8]();
}

uint64_t CGImageTextureDataGetSize()
{
  return MEMORY[0x1E0C9CE00]();
}

uint64_t CGImageTextureDataRelease()
{
  return MEMORY[0x1E0C9CE10]();
}

uint64_t CGImageTextureDataRetain()
{
  return MEMORY[0x1E0C9CE18]();
}

uint64_t CGImageTextureDataSupportsTiledLayout()
{
  return MEMORY[0x1E0C9CE20]();
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x1E0C9CE28]();
}

uint64_t CGNotificationCenterAddCallback()
{
  return MEMORY[0x1E0C9CE50]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CF60](url);
}

CFTypeID CGPDFDocumentGetTypeID(void)
{
  return MEMORY[0x1E0C9CFA8]();
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x1E0C9CFC8](document);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2A0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
  MEMORY[0x1E0C9D2D8](path, transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x1E0C9D2E8](path, info, function);
}

uint64_t CGPathApplyDashedPath()
{
  return MEMORY[0x1E0C9D2F0]();
}

uint64_t CGPathApplyStrokedDashedPath()
{
  return MEMORY[0x1E0C9D2F8]();
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

uint64_t CGPathApplyWithBlock2()
{
  return MEMORY[0x1E0C9D308]();
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1E0C9D318](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D320](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

uint64_t CGPathCreateDashedPath()
{
  return MEMORY[0x1E0C9D378]();
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

uint64_t CGPathCreateStrokedPath()
{
  return MEMORY[0x1E0C9D3A8]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

uint64_t CGPathCreateWithUnevenCornersRoundedRect()
{
  return MEMORY[0x1E0C9D3E0]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGPathGetNumberOfElements()
{
  return MEMORY[0x1E0C9D400]();
}

uint64_t CGPathGetNumberOfPoints()
{
  return MEMORY[0x1E0C9D408]();
}

CFTypeID CGPathGetTypeID(void)
{
  return MEMORY[0x1E0C9D418]();
}

uint64_t CGPathIsArc()
{
  return MEMORY[0x1E0C9D430]();
}

uint64_t CGPathIsEllipse()
{
  return MEMORY[0x1E0C9D438]();
}

uint64_t CGPathIsEllipseWithTransform()
{
  return MEMORY[0x1E0C9D440]();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1E0C9D448](path);
}

uint64_t CGPathIsLine()
{
  return MEMORY[0x1E0C9D450]();
}

uint64_t CGPathIsPrimitive()
{
  return MEMORY[0x1E0C9D458]();
}

BOOL CGPathIsRect(CGPathRef path, CGRect *rect)
{
  return MEMORY[0x1E0C9D460](path, rect);
}

uint64_t CGPathIsRectWithTransform()
{
  return MEMORY[0x1E0C9D468]();
}

uint64_t CGPathIsRegion()
{
  return MEMORY[0x1E0C9D470]();
}

uint64_t CGPathIsRoundedRect()
{
  return MEMORY[0x1E0C9D478]();
}

uint64_t CGPathIsRoundedRectWithTransform()
{
  return MEMORY[0x1E0C9D480]();
}

uint64_t CGPathIsUnevenCornersRoundedRectWithTransform()
{
  return MEMORY[0x1E0C9D488]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D4A0](path);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x1E0C9D4A8](info, matrix, *(_QWORD *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

uint64_t CGPatternCreateWithImage2()
{
  return MEMORY[0x1E0C9D4B0]();
}

uint64_t CGPatternGetBounds()
{
  return MEMORY[0x1E0C9D4B8]();
}

uint64_t CGPatternGetImage()
{
  return MEMORY[0x1E0C9D4C0]();
}

uint64_t CGPatternGetMatrix()
{
  return MEMORY[0x1E0C9D4C8]();
}

uint64_t CGPatternGetShading()
{
  return MEMORY[0x1E0C9D4D0]();
}

uint64_t CGPatternGetStep()
{
  return MEMORY[0x1E0C9D4D8]();
}

uint64_t CGPatternGetTiling()
{
  return MEMORY[0x1E0C9D4E0]();
}

uint64_t CGPatternGetType()
{
  return MEMORY[0x1E0C9D4E8]();
}

CFTypeID CGPatternGetTypeID(void)
{
  return MEMORY[0x1E0C9D4F0]();
}

uint64_t CGPatternIsColored()
{
  return MEMORY[0x1E0C9D4F8]();
}

uint64_t CGPatternIsOpaque()
{
  return MEMORY[0x1E0C9D500]();
}

uint64_t CGPatternNotificationCenter()
{
  return MEMORY[0x1E0C9D508]();
}

void CGPatternRelease(CGPatternRef pattern)
{
  MEMORY[0x1E0C9D510](pattern);
}

CGPatternRef CGPatternRetain(CGPatternRef pattern)
{
  return (CGPatternRef)MEMORY[0x1E0C9D518](pattern);
}

uint64_t CGPostError()
{
  return MEMORY[0x1E0C9D540]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGRenderingStateCreateCopy()
{
  return MEMORY[0x1E0C9D6A8]();
}

uint64_t CGRenderingStateGetAllowsAntialiasing()
{
  return MEMORY[0x1E0C9D6B0]();
}

uint64_t CGRenderingStateGetBaseCTM()
{
  return MEMORY[0x1E0C9D6B8]();
}

uint64_t CGRenderingStateGetFontRenderingStyle()
{
  return MEMORY[0x1E0C9D6C0]();
}

uint64_t CGRenderingStateGetMaxInterpolationQuality()
{
  return MEMORY[0x1E0C9D6C8]();
}

uint64_t CGRenderingStateGetMinInterpolationQuality()
{
  return MEMORY[0x1E0C9D6D0]();
}

uint64_t CGRenderingStateRelease()
{
  return MEMORY[0x1E0C9D6D8]();
}

uint64_t CGRenderingStateRetain()
{
  return MEMORY[0x1E0C9D6E0]();
}

uint64_t CGRenderingStateSetBaseCTM()
{
  return MEMORY[0x1E0C9D6E8]();
}

uint64_t CGSBoundingShapeAddRect()
{
  return MEMORY[0x1E0C9D6F0]();
}

uint64_t CGSBoundingShapeCreate()
{
  return MEMORY[0x1E0C9D6F8]();
}

uint64_t CGSBoundingShapeGetRegion()
{
  return MEMORY[0x1E0C9D700]();
}

uint64_t CGSBoundingShapeRelease()
{
  return MEMORY[0x1E0C9D708]();
}

uint64_t CGSBoundingShapeReset()
{
  return MEMORY[0x1E0C9D710]();
}

uint64_t CGSDiffRegion()
{
  return MEMORY[0x1E0C9D718]();
}

uint64_t CGSGetRegionData()
{
  return MEMORY[0x1E0C9D720]();
}

uint64_t CGSIntersectRegionWithRect()
{
  return MEMORY[0x1E0C9D728]();
}

uint64_t CGSNewEmptyRegion()
{
  return MEMORY[0x1E0C9D730]();
}

uint64_t CGSNewRegionWithData()
{
  return MEMORY[0x1E0C9D738]();
}

uint64_t CGSNewRegionWithRect()
{
  return MEMORY[0x1E0C9D740]();
}

uint64_t CGSNextRect()
{
  return MEMORY[0x1E0C9D750]();
}

uint64_t CGSRectInRegion()
{
  return MEMORY[0x1E0C9D758]();
}

uint64_t CGSRegionEnumerator()
{
  return MEMORY[0x1E0C9D760]();
}

uint64_t CGSRegionIsEmpty()
{
  return MEMORY[0x1E0C9D768]();
}

uint64_t CGSReleaseRegion()
{
  return MEMORY[0x1E0C9D778]();
}

uint64_t CGSReleaseRegionEnumerator()
{
  return MEMORY[0x1E0C9D780]();
}

uint64_t CGSTransformRegion()
{
  return MEMORY[0x1E0C9D788]();
}

uint64_t CGSUnionRegion()
{
  return MEMORY[0x1E0C9D790]();
}

CGShadingRef CGShadingCreateAxial(CGColorSpaceRef space, CGPoint start, CGPoint end, CGFunctionRef function, BOOL extendStart, BOOL extendEnd)
{
  return (CGShadingRef)MEMORY[0x1E0C9D798](space, function, extendStart, extendEnd, (__n128)start, *(__n128 *)&start.y, (__n128)end, *(__n128 *)&end.y);
}

uint64_t CGShadingCreateConic()
{
  return MEMORY[0x1E0C9D7A0]();
}

CGShadingRef CGShadingCreateRadial(CGColorSpaceRef space, CGPoint start, CGFloat startRadius, CGPoint end, CGFloat endRadius, CGFunctionRef function, BOOL extendStart, BOOL extendEnd)
{
  return (CGShadingRef)MEMORY[0x1E0C9D7A8](space, function, extendStart, extendEnd, (__n128)start, *(__n128 *)&start.y, startRadius, (__n128)end, *(__n128 *)&end.y, endRadius);
}

uint64_t CGShadingDrawInContextDelegate()
{
  return MEMORY[0x1E0C9D7B0]();
}

uint64_t CGShadingGetBackground()
{
  return MEMORY[0x1E0C9D7B8]();
}

uint64_t CGShadingGetBounds()
{
  return MEMORY[0x1E0C9D7C0]();
}

uint64_t CGShadingGetColorSpace()
{
  return MEMORY[0x1E0C9D7C8]();
}

uint64_t CGShadingGetDescriptor()
{
  return MEMORY[0x1E0C9D7D0]();
}

uint64_t CGShadingGetIdentifier()
{
  return MEMORY[0x1E0C9D7D8]();
}

uint64_t CGShadingGetType()
{
  return MEMORY[0x1E0C9D7E0]();
}

void CGShadingRelease(CGShadingRef shading)
{
  MEMORY[0x1E0C9D7E8](shading);
}

CGShadingRef CGShadingRetain(CGShadingRef shading)
{
  return (CGShadingRef)MEMORY[0x1E0C9D7F0](shading);
}

uint64_t CGSoftMaskDelegateDrawSoftMask()
{
  return MEMORY[0x1E0C9D828]();
}

uint64_t CGSoftMaskGetBackground()
{
  return MEMORY[0x1E0C9D830]();
}

uint64_t CGSoftMaskGetBounds()
{
  return MEMORY[0x1E0C9D838]();
}

uint64_t CGSoftMaskGetMatrix()
{
  return MEMORY[0x1E0C9D840]();
}

uint64_t CGSoftMaskGetTransfer()
{
  return MEMORY[0x1E0C9D848]();
}

uint64_t CGSoftMaskRelease()
{
  return MEMORY[0x1E0C9D850]();
}

uint64_t CGSoftMaskRetain()
{
  return MEMORY[0x1E0C9D858]();
}

uint64_t CGStyleGetColor()
{
  return MEMORY[0x1E0C9D880]();
}

uint64_t CGStyleGetData()
{
  return MEMORY[0x1E0C9D888]();
}

uint64_t CGStyleGetDrawOrdering()
{
  return MEMORY[0x1E0C9D890]();
}

uint64_t CGStyleGetIdentifier()
{
  return MEMORY[0x1E0C9D898]();
}

uint64_t CGStyleGetType()
{
  return MEMORY[0x1E0C9D8A0]();
}

uint64_t CGStyleRetain()
{
  return MEMORY[0x1E0C9D8A8]();
}

uint64_t CGTextClippingCreatePath()
{
  return MEMORY[0x1E0C9D8B0]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1E0CA7A30](font, matrix, attributes, size);
}

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1E0CA7A80](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A88](name, matrix, size);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C50](font);
  return result;
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x1E0CA7C78]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x1E0CA7E60](line, justificationFactor, justificationWidth);
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1E0CA7E70](line, *(_QWORD *)&truncationType, truncationToken, width);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTLineGetDefaultBounds()
{
  return MEMORY[0x1E0CA7EC8]();
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  double result;

  MEMORY[0x1E0CA7EF0](line, flushFactor, flushWidth);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x1E0CA8090](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedString(CFAttributedStringRef string)
{
  return (CTTypesetterRef)MEMORY[0x1E0CA8098](string);
}

CFIndex CTTypesetterSuggestLineBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x1E0CA80C8](typesetter, startIndex, width);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8908](buffer, *(_QWORD *)&attachmentMode);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1E0CA89D0](attachments);
}

CGSize CVImageBufferGetEncodedSize(CVImageBufferRef imageBuffer)
{
  double v1;
  double v2;
  CGSize result;

  MEMORY[0x1E0CA89F0](imageBuffer);
  result.height = v2;
  result.width = v1;
  return result;
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B08](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1E0CA8B48]();
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x1E0D1D238]();
}

uint64_t DRTailspinRequestWithLogs()
{
  return MEMORY[0x1E0D1D240]();
}

uint64_t EDRCreateClientForDisplayWithTimeoutAndCallback()
{
  return MEMORY[0x1E0DDC788]();
}

uint64_t EDREnable()
{
  return MEMORY[0x1E0DDC790]();
}

uint64_t EDRGetAmbientIlluminance()
{
  return MEMORY[0x1E0DDC798]();
}

uint64_t EDRGetDisplayBacklightBrightness()
{
  return MEMORY[0x1E0DDC7A0]();
}

uint64_t EDRGetDisplayHeadroom()
{
  return MEMORY[0x1E0DDC7A8]();
}

uint64_t EDRGetDisplayMaxLuminance()
{
  return MEMORY[0x1E0DDC7B0]();
}

uint64_t EDRRegisterCallbackBlockOnQueue()
{
  return MEMORY[0x1E0DDC7B8]();
}

uint64_t EDRReleaseClient()
{
  return MEMORY[0x1E0DDC7C0]();
}

uint64_t EDRRequestAccessibilityLimit()
{
  return MEMORY[0x1E0DDC7C8]();
}

uint64_t EDRRequestDisplayHeadroomLimit()
{
  return MEMORY[0x1E0DDC7D0]();
}

uint64_t EDRUnregisterCallbackBlock()
{
  return MEMORY[0x1E0DDC7D8]();
}

uint64_t FPCAMetalLayerAllocated()
{
  return MEMORY[0x1E0D22798]();
}

uint64_t FPDrawableLifetimeMarkClientDidPresent()
{
  return MEMORY[0x1E0D227C0]();
}

uint64_t FPDrawableLifetimeMarkFinished()
{
  return MEMORY[0x1E0D227C8]();
}

uint64_t FPDrawableLifetimeMarkStarted()
{
  return MEMORY[0x1E0D227D0]();
}

uint64_t FPMetalLayerMarkDealloc()
{
  return MEMORY[0x1E0D227D8]();
}

uint64_t FPMetalLayerMarkSetName()
{
  return MEMORY[0x1E0D227E0]();
}

uint64_t FPMetalLayerMarkSetPixelFormat()
{
  return MEMORY[0x1E0D227E8]();
}

uint64_t FPMetalLayerMarkSetSize()
{
  return MEMORY[0x1E0D227F0]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1E0CBB128]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1E0CBB1E8](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1E0CBB1F0]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingBlock()
{
  return MEMORY[0x1E0CBB208]();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return MEMORY[0x1E0CBB218]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB250]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x1E0CBB270]();
}

uint64_t IOHIDEventSystemClientUnregisterDeviceMatchingBlock()
{
  return MEMORY[0x1E0CBB280]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB2C0]();
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x1E0CBB490](service, *(_QWORD *)&usagePage, *(_QWORD *)&usage);
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return MEMORY[0x1E0CBB498]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4B0](service, key);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

uint64_t IOMFBGainEncoderCreate()
{
  return MEMORY[0x1E0D39F10]();
}

uint64_t IOMFBGainEncoderDestroy()
{
  return MEMORY[0x1E0D39F18]();
}

uint64_t IOMFBGainEncoderEmitRun()
{
  return MEMORY[0x1E0D39F20]();
}

uint64_t IOMFBGainEncoderFinishEncoding()
{
  return MEMORY[0x1E0D39F28]();
}

uint64_t IOMFBGainEncoderStartRow()
{
  return MEMORY[0x1E0D39F30]();
}

uint64_t IOMFBGainMapRelease()
{
  return MEMORY[0x1E0D39F38]();
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB680](*(_QWORD *)&bootstrapPort, mainPort);
}

uint64_t IOMobileFrameBufferSwapSetContrastEnhancerStrength()
{
  return MEMORY[0x1E0D39F40]();
}

uint64_t IOMobileFrameBufferSwapSetUserLuminanceAdjustment()
{
  return MEMORY[0x1E0D39F48]();
}

uint64_t IOMobileFramebufferChangeFrameInfo()
{
  return MEMORY[0x1E0D39F50]();
}

uint64_t IOMobileFramebufferCopyLayerDisplayedSurface()
{
  return MEMORY[0x1E0D39F58]();
}

uint64_t IOMobileFramebufferCopyProperty()
{
  return MEMORY[0x1E0D39F60]();
}

uint64_t IOMobileFramebufferCreateDisplayList()
{
  return MEMORY[0x1E0D39F68]();
}

uint64_t IOMobileFramebufferDisableHotPlugDetectNotifications()
{
  return MEMORY[0x1E0D39F70]();
}

uint64_t IOMobileFramebufferDisableVSyncNotifications()
{
  return MEMORY[0x1E0D39F80]();
}

uint64_t IOMobileFramebufferEnableDisableVideoPowerSavings()
{
  return MEMORY[0x1E0D39F88]();
}

uint64_t IOMobileFramebufferEnableHotPlugDetectNotifications()
{
  return MEMORY[0x1E0D39F90]();
}

uint64_t IOMobileFramebufferEnableVSyncNotifications()
{
  return MEMORY[0x1E0D39FA0]();
}

uint64_t IOMobileFramebufferFrameInfo()
{
  return MEMORY[0x1E0D39FA8]();
}

uint64_t IOMobileFramebufferGetBandwidth()
{
  return MEMORY[0x1E0D39FB0]();
}

uint64_t IOMobileFramebufferGetBlock()
{
  return MEMORY[0x1E0D39FB8]();
}

uint64_t IOMobileFramebufferGetBrightnessControlCapabilities()
{
  return MEMORY[0x1E0D39FC0]();
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x1E0D39FD0]();
}

uint64_t IOMobileFramebufferGetColorRemapMode()
{
  return MEMORY[0x1E0D39FD8]();
}

uint64_t IOMobileFramebufferGetDigitalOutMode()
{
  return MEMORY[0x1E0D39FE0]();
}

uint64_t IOMobileFramebufferGetDigitalOutState()
{
  return MEMORY[0x1E0D39FE8]();
}

uint64_t IOMobileFramebufferGetDisplayArea()
{
  return MEMORY[0x1E0D39FF0]();
}

uint64_t IOMobileFramebufferGetDisplaySize()
{
  return MEMORY[0x1E0D39FF8]();
}

uint64_t IOMobileFramebufferGetLayerDefaultSurface()
{
  return MEMORY[0x1E0D3A018]();
}

uint64_t IOMobileFramebufferGetMatrix()
{
  return MEMORY[0x1E0D3A028]();
}

uint64_t IOMobileFramebufferGetProtectionOptions()
{
  return MEMORY[0x1E0D3A030]();
}

uint64_t IOMobileFramebufferGetRunLoopSource()
{
  return MEMORY[0x1E0D3A038]();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return MEMORY[0x1E0D3A048]();
}

uint64_t IOMobileFramebufferGetSupportedDigitalOutModes()
{
  return MEMORY[0x1E0D3A050]();
}

uint64_t IOMobileFramebufferGetVSyncRunLoopSource()
{
  return MEMORY[0x1E0D3A058]();
}

uint64_t IOMobileFramebufferGetWirelessSurfaceWithOptions()
{
  return MEMORY[0x1E0D3A060]();
}

uint64_t IOMobileFramebufferOpen()
{
  return MEMORY[0x1E0D3A070]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x1E0D3A078]();
}

uint64_t IOMobileFramebufferRequestPowerChange()
{
  return MEMORY[0x1E0D3A080]();
}

uint64_t IOMobileFramebufferSetBrightnessControlCallback()
{
  return MEMORY[0x1E0D3A088]();
}

uint64_t IOMobileFramebufferSetBrightnessCorrection()
{
  return MEMORY[0x1E0D3A090]();
}

uint64_t IOMobileFramebufferSetColorRemapMode()
{
  return MEMORY[0x1E0D3A098]();
}

uint64_t IOMobileFramebufferSetContrast()
{
  return MEMORY[0x1E0D3A0A0]();
}

uint64_t IOMobileFramebufferSetDebugFlags()
{
  return MEMORY[0x1E0D3A0A8]();
}

uint64_t IOMobileFramebufferSetDigitalOutMode()
{
  return MEMORY[0x1E0D3A0B0]();
}

uint64_t IOMobileFramebufferSetDisplayDevice()
{
  return MEMORY[0x1E0D3A0B8]();
}

uint64_t IOMobileFramebufferSetIdleBuffer()
{
  return MEMORY[0x1E0D3A0C0]();
}

uint64_t IOMobileFramebufferSetIdleBufferEvent()
{
  return MEMORY[0x1E0D3A0C8]();
}

uint64_t IOMobileFramebufferSetMatrix()
{
  return MEMORY[0x1E0D3A0D0]();
}

uint64_t IOMobileFramebufferSetParameter()
{
  return MEMORY[0x1E0D3A0D8]();
}

uint64_t IOMobileFramebufferSetPreset()
{
  return MEMORY[0x1E0D3A0E0]();
}

uint64_t IOMobileFramebufferSetTwilightStrength()
{
  return MEMORY[0x1E0D3A0E8]();
}

uint64_t IOMobileFramebufferSupportedFrameInfo()
{
  return MEMORY[0x1E0D3A0F0]();
}

uint64_t IOMobileFramebufferSwapActiveRegion()
{
  return MEMORY[0x1E0D3A0F8]();
}

uint64_t IOMobileFramebufferSwapBegin()
{
  return MEMORY[0x1E0D3A100]();
}

uint64_t IOMobileFramebufferSwapCancel()
{
  return MEMORY[0x1E0D3A108]();
}

uint64_t IOMobileFramebufferSwapCancelAll()
{
  return MEMORY[0x1E0D3A110]();
}

uint64_t IOMobileFramebufferSwapDebugInfo()
{
  return MEMORY[0x1E0D3A118]();
}

uint64_t IOMobileFramebufferSwapDirtyRegion()
{
  return MEMORY[0x1E0D3A120]();
}

uint64_t IOMobileFramebufferSwapEnd()
{
  return MEMORY[0x1E0D3A128]();
}

uint64_t IOMobileFramebufferSwapSetAmbientLux()
{
  return MEMORY[0x1E0D3A130]();
}

uint64_t IOMobileFramebufferSwapSetBackgroundColor()
{
  return MEMORY[0x1E0D3A138]();
}

uint64_t IOMobileFramebufferSwapSetBlit()
{
  return MEMORY[0x1E0D3A140]();
}

uint64_t IOMobileFramebufferSwapSetBrightness()
{
  return MEMORY[0x1E0D3A148]();
}

uint64_t IOMobileFramebufferSwapSetBrightnessLimit()
{
  return MEMORY[0x1E0D3A150]();
}

uint64_t IOMobileFramebufferSwapSetColorMatrix()
{
  return MEMORY[0x1E0D3A158]();
}

uint64_t IOMobileFramebufferSwapSetColorRemapMode()
{
  return MEMORY[0x1E0D3A160]();
}

uint64_t IOMobileFramebufferSwapSetDisplayEdr()
{
  return MEMORY[0x1E0D3A168]();
}

uint64_t IOMobileFramebufferSwapSetDisplayEdrHeadroom()
{
  return MEMORY[0x1E0D3A170]();
}

uint64_t IOMobileFramebufferSwapSetEventSignal()
{
  return MEMORY[0x1E0D3A178]();
}

uint64_t IOMobileFramebufferSwapSetEventWait()
{
  return MEMORY[0x1E0D3A180]();
}

uint64_t IOMobileFramebufferSwapSetGainMap()
{
  return MEMORY[0x1E0D3A188]();
}

uint64_t IOMobileFramebufferSwapSetICCCurve()
{
  return MEMORY[0x1E0D3A190]();
}

uint64_t IOMobileFramebufferSwapSetICCMatrix()
{
  return MEMORY[0x1E0D3A198]();
}

uint64_t IOMobileFramebufferSwapSetLayer()
{
  return MEMORY[0x1E0D3A1A0]();
}

uint64_t IOMobileFramebufferSwapSetParams()
{
  return MEMORY[0x1E0D3A1A8]();
}

uint64_t IOMobileFramebufferSwapSetTimestamps()
{
  return MEMORY[0x1E0D3A1B0]();
}

uint64_t IOMobileFramebufferSwapWait()
{
  return MEMORY[0x1E0D3A1B8]();
}

uint64_t IOMobileFramebufferSwapWorkaroundSettings()
{
  return MEMORY[0x1E0D3A1C0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1E0CBB6F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBB9B0](*(_QWORD *)&entry, propertyName, property);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

uint64_t IOSurfaceAcceleratorBlitSurface()
{
  return MEMORY[0x1E0D3A1C8]();
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1E0D3A1D0]();
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource()
{
  return MEMORY[0x1E0D3A1E0]();
}

uint64_t IOSurfaceAcceleratorGetTransformEstimation()
{
  return MEMORY[0x1E0D3A1E8]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1E0D3A200]();
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x1E0CBBAC0](property, value);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBAC8](buffer);
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBBAE0](buffer);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB00](buffer);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBB18](buffer);
}

uint64_t IOSurfaceFlushProcessorCaches()
{
  return MEMORY[0x1E0CBBB28]();
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CBBB68](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1E0CBBB70]();
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB80](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB90](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBBA0](buffer, planeIndex);
}

uint64_t IOSurfaceGetCacheMode()
{
  return MEMORY[0x1E0CBBBB8]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1E0CBBBD8]();
}

uint64_t IOSurfaceGetDataProperty()
{
  return MEMORY[0x1E0CBBBE0]();
}

uint64_t IOSurfaceGetDetachModeCode()
{
  return MEMORY[0x1E0CBBBE8]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBC38](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

uint64_t IOSurfaceGetIndexedTimestamp()
{
  return MEMORY[0x1E0CBBC50]();
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x1E0CBBC88](property);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x1E0CBBC90]();
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1E0CBBCC8]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBCF0](buffer, planeIndex);
}

uint64_t IOSurfaceGetYCbCrMatrix()
{
  return MEMORY[0x1E0CBBCF8]();
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBD00](buffer);
}

uint64_t IOSurfaceInitDetachModeCode()
{
  return MEMORY[0x1E0CBBD10]();
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBD18](buffer);
}

uint64_t IOSurfaceIsTiled()
{
  return MEMORY[0x1E0CBBD20]();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD38](*(_QWORD *)&csid);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD40](*(_QWORD *)&port);
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
  MEMORY[0x1E0CBBDE8](buffer, key);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x1E0CBBDF8]();
}

uint64_t IOSurfaceSetDetachModeCode()
{
  return MEMORY[0x1E0CBBE10]();
}

uint64_t IOSurfaceSetIndexedTimestamp()
{
  return MEMORY[0x1E0CBBE18]();
}

uint64_t IOSurfaceSetOwnershipIdentity()
{
  return MEMORY[0x1E0CBBE28]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1E0CBBE30](buffer, *(_QWORD *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

void IOSurfaceSetValues(IOSurfaceRef buffer, CFDictionaryRef keysAndValues)
{
  MEMORY[0x1E0CBBE48](buffer, keysAndValues);
}

uint64_t IOSurfaceSetYCbCrMatrix()
{
  return MEMORY[0x1E0CBBE50]();
}

uint64_t IOSurfaceSignalEvent()
{
  return MEMORY[0x1E0CBBE78]();
}

uint64_t IOSurfaceSupportsProtectionOptions()
{
  return MEMORY[0x1E0CBBE80]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x1E0CBBE98]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1E0DE2B78]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return MEMORY[0x1E0CC69A0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1E0CC69C8]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x1E0CC69D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRecordAllocationEvent()
{
  return MEMORY[0x1E0CB3140]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PLLogTimeSensitiveRegisteredEvent()
{
  return MEMORY[0x1E0D7FE30]();
}

uint64_t SILManagerCreate()
{
  return MEMORY[0x1E0D897A0]();
}

uint64_t SILManagerFrameNumberFromBounds()
{
  return MEMORY[0x1E0D897A8]();
}

uint64_t SILManagerIndicatorExtent()
{
  return MEMORY[0x1E0D897B0]();
}

uint64_t SILManagerIndicatorNameFromType()
{
  return MEMORY[0x1E0D897C0]();
}

uint64_t SILManagerIndicatorTypeIDFromName()
{
  return MEMORY[0x1E0D897C8]();
}

uint64_t SILManagerSetLogLevel()
{
  return MEMORY[0x1E0D897D8]();
}

uint64_t SILManagerSetPower()
{
  return MEMORY[0x1E0D897E0]();
}

uint64_t SILManagerSwap()
{
  return MEMORY[0x1E0D897E8]();
}

uint64_t SILManagerTrySetPower()
{
  return MEMORY[0x1E0D897F0]();
}

uint64_t SILManagerTurnOffRegions()
{
  return MEMORY[0x1E0D897F8]();
}

uint64_t SILStateMachineCreate()
{
  return MEMORY[0x1E0D89800]();
}

uint64_t SILStateMachineForceTransitionToState()
{
  return MEMORY[0x1E0D89808]();
}

uint64_t SILStateMachineRelease()
{
  return MEMORY[0x1E0D89810]();
}

uint64_t SILStateMachineStateList()
{
  return MEMORY[0x1E0D89818]();
}

uint64_t SILStateMachineTick()
{
  return MEMORY[0x1E0D89820]();
}

uint64_t SILStateMachineTransitionSupported()
{
  return MEMORY[0x1E0D89828]();
}

uint64_t SILStateMachineTransitionToState()
{
  return MEMORY[0x1E0D89830]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t VMUGetFlagsForAllVMRegionStatistics()
{
  return MEMORY[0x1E0DAFF10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRunLoop01()
{
  return MEMORY[0x1E0C9A450]();
}

uint64_t _CFRunLoopCurrentIsMain()
{
  return MEMORY[0x1E0C9A458]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void *_MXSignpostMetricsSnapshot(void)
{
  return (void *)MEMORY[0x1E0D97658]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1E0DE42F0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x1E0DE42F8](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x1E0DE4790](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x1E0DE47D0](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
  MEMORY[0x1E0DE47D8](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE4860](this, __lk);
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
  MEMORY[0x1E0DE4870](this);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x1E0DE4890](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x1E0DE48A0](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x1E0DE48B0](this);
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1E0DE4908]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4A78](__str, __idx, *(_QWORD *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1E0DE4B48]();
}

void std::thread::detach(std::thread *this)
{
  MEMORY[0x1E0DE4BC0](this);
}

void std::thread::~thread(std::thread *this)
{
  MEMORY[0x1E0DE4BC8](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x1E0DE4DF8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E1589260();
}

void operator delete(void *__p)
{
  off_1E1589268(__p);
}

uint64_t operator delete()
{
  return off_1E1589270();
}

uint64_t operator new[]()
{
  return off_1E1589278();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E1589280(__sz);
}

uint64_t operator new()
{
  return off_1E1589288();
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x1E0C9A9A0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __invert_d3()
{
  return MEMORY[0x1E0C80B18]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __powidf2()
{
  return MEMORY[0x1E0C80B98]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1E0C810C8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1E0C813B8]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1E0D15478]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1E0C81648](a1);
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x1E0C81658](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C816F8](*(_QWORD *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up_per_user()
{
  return MEMORY[0x1E0C81718]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C81730](*(_QWORD *)&r);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cbrt(long double __x)
{
  long double result;

  MEMORY[0x1E0C81850](__x);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82D18](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1E0C82DB8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1E0C82DC0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1E0C82DC8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C82DE8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x1E0C82F00](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82FA0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return MEMORY[0x1E0C831A8]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double frexp(long double __x, int *__e)
{
  long double result;

  MEMORY[0x1E0C834E8](__e, __x);
  return result;
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t ht_fence_start()
{
  return MEMORY[0x1E0D287C8]();
}

uint64_t ht_fence_timeout()
{
  return MEMORY[0x1E0D287D0]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1E0C83C98](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE8](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1E0C83D08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x1E0C83D18](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1E0C83D20](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_move_member(ipc_space_t task, mach_port_name_t member, mach_port_name_t after)
{
  return MEMORY[0x1E0C83D60](*(_QWORD *)&task, *(_QWORD *)&member, *(_QWORD *)&after);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C83DD8](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x1E0C83E00](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flavor, info, infoCnt, object_name);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E78](start_size, *(_QWORD *)&flags);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1E0C83EB0](size);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  MEMORY[0x1E0C83ED8](zone, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F18](size, type_id);
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F20](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F28](zone, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x1E0C83F70](zone, ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

int mergesort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return MEMORY[0x1E0C840D8](__base, __nel, __width, __compar);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84120](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84128](dest, src, *(_QWORD *)&len);
}

uint64_t mk_timer_arm_leeway()
{
  return MEMORY[0x1E0C84140]();
}

uint64_t mk_timer_cancel()
{
  return MEMORY[0x1E0C84148]();
}

uint64_t mk_timer_create()
{
  return MEMORY[0x1E0C84150]();
}

uint64_t mk_timer_destroy()
{
  return MEMORY[0x1E0C84158]();
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D28](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FC0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x1E0DE8008](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1E0C849E8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1E0C84A18]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

uint64_t pps_create_telemetry_identifier()
{
  return MEMORY[0x1E0D7FE78]();
}

uint64_t pps_send_telemetry()
{
  return MEMORY[0x1E0D7FE80]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_setthread_cpupercent()
{
  return MEMORY[0x1E0C84C88]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8068](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  return MEMORY[0x1E0C84CC0](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CF8](a1, *(_QWORD *)&a2);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x1E0C84D00](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1E0C84D40](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1E0C84DF0]();
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E30](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1E0C85350](a1);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int snprintf_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C85448](a1, a2, a3, a4);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl stpcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C854F0](__dst, __src);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

float strtof(const char *a1, char **a2)
{
  float result;

  MEMORY[0x1E0C85628](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

kern_return_t task_create_identity_token(task_t task, task_id_token_t *token)
{
  return MEMORY[0x1E0C85808](*(_QWORD *)&task, token);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1E0C85848](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

vImage_Error vImageAffineWarp_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_ARGB_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CB68](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CB80](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageAffineWarp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CB88](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CBC0](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageClipToAlpha_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CCF0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageClipToAlpha_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CCF8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CD68](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_XRGB2101010ToARGB16F(const vImage_Buffer *src, Pixel_F alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1E0C8D098](src, dest, *(_QWORD *)&RGB101010RangeMin, *(_QWORD *)&RGB101010RangeMax, permuteMap, *(_QWORD *)&flags, alpha);
}

vImage_Error vImageConvert_XRGB2101010ToARGB8888(const vImage_Buffer *src, Pixel_8 alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1E0C8D0B8](src, alpha, dest, *(_QWORD *)&RGB101010RangeMin, *(_QWORD *)&RGB101010RangeMax, permuteMap, *(_QWORD *)&flags);
}

uint64_t vImageConvert_XRGB2101010_A8ToARGB16F()
{
  return MEMORY[0x1E0C8D0D8]();
}

uint64_t vImageConvert_XRGB2101010_A8ToARGB8888()
{
  return MEMORY[0x1E0C8D0E8]();
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D100](matrix, pixelRange, outInfo, *(_QWORD *)&inYpCbCrType, *(_QWORD *)&outARGBType, *(_QWORD *)&flags);
}

vImage_Error vImageConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D1C8](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1E0C8D518](src, dest, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImagePremultipliedAlphaBlend_BGRA8888(const vImage_Buffer *srcTop, const vImage_Buffer *srcBottom, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D5D8](srcTop, srcBottom, dest, *(_QWORD *)&flags);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1E0C85AE0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&set_maximum, *(_QWORD *)&new_protection);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1E0C85AE8](*(_QWORD *)&target_task, address, *(_QWORD *)&control, state);
}

voucher_mach_msg_state_t voucher_mach_msg_adopt(mach_msg_header_t *msg)
{
  return (voucher_mach_msg_state_t)MEMORY[0x1E0C85B48](msg);
}

void voucher_mach_msg_clear(mach_msg_header_t *msg)
{
  MEMORY[0x1E0C85B50](msg);
}

void voucher_mach_msg_revert(voucher_mach_msg_state_t state)
{
  MEMORY[0x1E0C85B58](state);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

uint64_t work_interval_create()
{
  return MEMORY[0x1E0C85CD8]();
}

uint64_t work_interval_destroy()
{
  return MEMORY[0x1E0C85CE0]();
}

uint64_t work_interval_instance_alloc()
{
  return MEMORY[0x1E0C85CE8]();
}

uint64_t work_interval_instance_clear()
{
  return MEMORY[0x1E0C85CF0]();
}

uint64_t work_interval_instance_finish()
{
  return MEMORY[0x1E0C85CF8]();
}

uint64_t work_interval_instance_free()
{
  return MEMORY[0x1E0C85D00]();
}

uint64_t work_interval_instance_set_complexity()
{
  return MEMORY[0x1E0C85D08]();
}

uint64_t work_interval_instance_set_deadline()
{
  return MEMORY[0x1E0C85D10]();
}

uint64_t work_interval_instance_set_finish()
{
  return MEMORY[0x1E0C85D18]();
}

uint64_t work_interval_instance_set_start()
{
  return MEMORY[0x1E0C85D20]();
}

uint64_t work_interval_instance_start()
{
  return MEMORY[0x1E0C85D28]();
}

uint64_t work_interval_instance_update()
{
  return MEMORY[0x1E0C85D30]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x1E0DE8CC0](sax, user_data, chunk, *(_QWORD *)&size, filename);
}

int xmlCtxtUseOptions(xmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x1E0DE8CE0](ctxt, *(_QWORD *)&options);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x1E0DE8D50](ctxt);
}

xmlEntityPtr xmlGetPredefinedEntity(const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x1E0DE8D98](name);
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x1E0DE8EA0](ctxt, chunk, *(_QWORD *)&size, *(_QWORD *)&terminate);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1E0C86200]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1E0C86378]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

