@implementation NSHost

- (id)_thingToResolve
{
  uint64_t v2;

  if (self)
  {
    v2 = *((_QWORD *)self + 3);
    if (v2)
      return *(id *)(v2 + 8);
    else
      return 0;
  }
  return self;
}

- (BOOL)isEqualToHost:(NSHost *)aHost
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!aHost)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  if (aHost == self)
    goto LABEL_12;
  v4 = -[NSHost addresses](aHost, "addresses");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSHost addresses](self, "addresses", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      if (-[NSArray containsObject:](v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)))
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        LOBYTE(v6) = 0;
        if (v7)
          goto LABEL_5;
        return v6;
      }
    }
LABEL_12:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (NSString)name
{
  id reserved;
  NSObject *v4;
  NSString *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  -[NSHost blockingResolveUntil:]((uint64_t)self, 0);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7431;
  v12 = __Block_byref_object_dispose__7432;
  v13 = 0;
  if (self && (reserved = self->reserved) != 0)
    v4 = *((_QWORD *)reserved + 4);
  else
    v4 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __14__NSHost_name__block_invoke;
  v7[3] = &unk_1E14F9F58;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);
  v5 = (NSString *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSArray)names
{
  -[NSHost blockingResolveUntil:]((uint64_t)self, 2);
  return self->names;
}

- (NSString)address
{
  id reserved;
  NSObject *v4;
  NSString *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  -[NSHost blockingResolveUntil:]((uint64_t)self, 1);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7431;
  v12 = __Block_byref_object_dispose__7432;
  v13 = 0;
  if (self && (reserved = self->reserved) != 0)
    v4 = *((_QWORD *)reserved + 4);
  else
    v4 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __17__NSHost_address__block_invoke;
  v7[3] = &unk_1E14F9F58;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);
  v5 = (NSString *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSArray)addresses
{
  -[NSHost blockingResolveUntil:]((uint64_t)self, 2);
  return self->addresses;
}

- (NSString)localizedName
{
  return (NSString *)0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@ (%@ %@)"), objc_opt_class(), self, -[NSHost name](self, "name"), -[NSHost names](self, "names"), -[NSHost addresses](self, "addresses"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHost;
  -[NSHost dealloc](&v3, sel_dealloc);
}

- (void)blockingResolveUntil:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  int v8;
  _QWORD v9[3];
  char v10;
  _QWORD block[6];

  if (a1)
  {
    v4 = dispatch_semaphore_create(0);
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__NSHost_blockingResolveUntil___block_invoke;
    v7[3] = &unk_1E14F9E90;
    v8 = a2;
    v7[4] = v4;
    v7[5] = v9;
    v5 = *(_QWORD *)(a1 + 24);
    if (v5)
      v6 = *(NSObject **)(v5 + 24);
    else
      v6 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __18__NSHost_resolve___block_invoke;
    block[3] = &unk_1E14FDF00;
    block[4] = a1;
    block[5] = v7;
    dispatch_async(v6, block);
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v4);
    _Block_object_dispose(v9, 8);
  }
}

intptr_t __31__NSHost_blockingResolveUntil___block_invoke(intptr_t result, int a2)
{
  intptr_t v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v2 = result;
    if (a2 == 2 || *(_DWORD *)(result + 48) == a2)
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

void __18__NSHost_resolve___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  ifaddrs *i;
  sockaddr *ifa_addr;
  int sa_family;
  int sa_len;
  NSObject *global_queue;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD block[6];
  _QWORD v30[10];
  int v31;
  _QWORD v32[4];
  _QWORD v33[4];
  ifaddrs *v34;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v4 = *(_QWORD *)(v2 + 24);
    if (v4)
    {
      if ((*(_BYTE *)(v4 + 48) & 1) != 0)
        goto LABEL_26;
      *(_BYTE *)(v4 + 48) = 1;
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    v6 = v5[3];
    if (v6 && (v7 = *(_DWORD *)(v6 + 16)) != 0)
    {
      if (v7 == 2)
      {
        v8 = v5[2];
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 7;
        goto LABEL_25;
      }
      if (v7 == 1)
      {
        v8 = v5[1];
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 3;
LABEL_25:
        -[NSHost __resolveWithFlags:resultArray:handler:](v10, v11, v8, v9);
      }
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 40);
      v33[3] = 0;
      v34 = 0;
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x2020000000;
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2020000000;
      v32[3] = 0;
      if (!getifaddrs(&v34))
      {
        v13 = dispatch_group_create();
        for (i = v34; i; i = i->ifa_next)
        {
          ifa_addr = i->ifa_addr;
          sa_family = ifa_addr->sa_family;
          if (sa_family == 30 || sa_family == 2)
          {
            sa_len = ifa_addr->sa_len;
            global_queue = dispatch_get_global_queue(0, 2uLL);
            v30[0] = v3;
            v30[1] = 3221225472;
            v30[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke;
            v30[3] = &unk_1E14F9F30;
            v31 = sa_len;
            v30[4] = v13;
            v30[5] = v5;
            v30[8] = v33;
            v30[9] = i;
            v30[6] = v12;
            v30[7] = v32;
            block[0] = v3;
            block[1] = 3221225472;
            block[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_4;
            block[3] = &unk_1E14FDF00;
            block[4] = v5;
            block[5] = v30;
            dispatch_group_async(v13, global_queue, block);
            v28[0] = v3;
            v28[1] = 3221225472;
            v28[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_5;
            v28[3] = &unk_1E14FDF00;
            v28[4] = v5;
            v28[5] = v30;
            dispatch_group_async(v13, global_queue, v28);
            v27[0] = v3;
            v27[1] = 3221225472;
            v27[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_6;
            v27[3] = &unk_1E14FDF00;
            v27[4] = v5;
            v27[5] = v30;
            dispatch_group_async(v13, global_queue, v27);
          }
        }
        dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v13);
        MEMORY[0x186DB7A08](v34);
        v20 = v5[3];
        if (v20)
          v21 = *(NSObject **)(v20 + 32);
        else
          v21 = 0;
        v26[0] = v3;
        v26[1] = 3221225472;
        v26[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_7;
        v26[3] = &unk_1E14F9F58;
        v26[4] = v5;
        v26[5] = v32;
        dispatch_sync(v21, v26);
      }
      _Block_object_dispose(v32, 8);
      _Block_object_dispose(v33, 8);
    }
  }
LABEL_26:
  v22 = *(_QWORD *)(a1 + 32);
  if (v22 && (v23 = *(_QWORD *)(v22 + 24)) != 0)
    v24 = *(NSObject **)(v23 + 40);
  else
    v24 = 0;
  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __18__NSHost_resolve___block_invoke_2;
  v25[3] = &unk_1E14FDEB0;
  v25[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v24, v25);
}

- (void)__resolveWithFlags:(uint64_t)a3 resultArray:(uint64_t)a4 handler:
{
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  addrinfo *v13;
  uint64_t i;
  sockaddr *ai_addr;
  int sa_family;
  int sa_len;
  NSObject *global_queue;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD block[6];
  _QWORD v29[8];
  int v30;
  addrinfo *v31;
  addrinfo v32;
  _BYTE v33[256];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 24);
  if (v8)
    v9 = *(void **)(v8 + 8);
  else
    v9 = 0;
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  if (v10)
  {
    v11 = v10;
    if ((a2 & 4) == 0 || inet_pton(30, v10, v33) == 1 || inet_pton(2, v11, v33) == 1)
    {
      v31 = 0;
      memset(&v32, 0, sizeof(v32));
      v32.ai_socktype = 1;
      v32.ai_flags = a2;
      if (!getaddrinfo(v11, 0, &v32, &v31))
      {
        v12 = dispatch_group_create();
        v13 = v31;
        for (i = MEMORY[0x1E0C809B0]; v13; v13 = v13->ai_next)
        {
          ai_addr = v13->ai_addr;
          sa_family = ai_addr->sa_family;
          if (sa_family == 30 || sa_family == 2)
          {
            sa_len = ai_addr->sa_len;
            global_queue = dispatch_get_global_queue(0, 2uLL);
            block[5] = v29;
            v29[0] = i;
            v29[1] = 3221225472;
            v29[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke;
            v29[3] = &unk_1E14F9EE0;
            v30 = sa_len;
            v29[4] = v12;
            v29[5] = a1;
            v29[6] = a4;
            v29[7] = v13;
            block[0] = i;
            block[1] = 3221225472;
            block[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_4;
            block[3] = &unk_1E14FDF00;
            block[4] = a1;
            dispatch_group_async(v12, global_queue, block);
            v27[0] = i;
            v27[1] = 3221225472;
            v27[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_5;
            v27[3] = &unk_1E14FDF00;
            v27[4] = a1;
            v27[5] = v29;
            dispatch_group_async(v12, global_queue, v27);
            v26[0] = i;
            v26[1] = 3221225472;
            v26[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_6;
            v26[3] = &unk_1E14FDF00;
            v26[4] = a1;
            v26[5] = v29;
            dispatch_group_async(v12, global_queue, v26);
            if (v13->ai_canonname)
            {
              v20 = *(_QWORD *)(a1 + 24);
              if (v20)
                v21 = *(NSObject **)(v20 + 32);
              else
                v21 = 0;
              v25[0] = i;
              v25[1] = 3221225472;
              v25[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_7;
              v25[3] = &unk_1E14FE140;
              v25[4] = a1;
              v25[5] = v13;
              dispatch_group_async(v12, v21, v25);
            }
          }
        }
        dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v12);
        freeaddrinfo(v31);
        v22 = *(_QWORD *)(a1 + 24);
        if (v22)
          v23 = *(NSObject **)(v22 + 32);
        else
          v23 = 0;
        v24[0] = i;
        v24[1] = 3221225472;
        v24[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_8;
        v24[3] = &unk_1E14FDE88;
        v24[4] = a3;
        v24[5] = v9;
        dispatch_sync(v23, v24);
      }
    }
  }
}

uint64_t __18__NSHost_resolve___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__NSHost_resolveCurrentHostWithHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  _QWORD v15[7];
  __int128 v16;
  __int128 v17;
  int v18;
  int v19;
  char v20[4];
  __int16 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  bzero(v20, 0x401uLL);
  if (!getnameinfo(*(const sockaddr **)(*(_QWORD *)(a1 + 72) + 24), *(_DWORD *)(a1 + 80), v20, 0x401u, 0, 0, a3))
  {
    if ((a3 & 4) == 0 || (*(_DWORD *)v20 == 809002342 ? (v8 = v21 == 14906) : (v8 = 0), !v8))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("localhost")) & 1) == 0)
      {
        if (v9)
        {
          v10 = *(NSObject **)(a1 + 32);
          v11 = *(_QWORD *)(a1 + 40);
          if (v11 && (v12 = *(_QWORD *)(v11 + 24)) != 0)
            v13 = *(NSObject **)(v12 + 32);
          else
            v13 = 0;
          v15[1] = 3221225472;
          v14 = *(_OWORD *)(a1 + 48);
          v17 = *(_OWORD *)(a1 + 64);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_2;
          v15[3] = &unk_1E14F9F08;
          v15[4] = a2;
          v15[5] = v9;
          v15[6] = v11;
          v16 = v14;
          v18 = a3;
          v19 = a4;
          dispatch_group_async(v10, v13, v15);
        }
      }
    }
  }
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 2, 1);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 4, 0);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 5, 0);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_7(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6[1025];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(v6, 0x401uLL);
  if (!gethostname(v6, 0x401uLL))
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    if (v3)
    {
      v4 = v3;
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", v3) & 1) == 0)
      {
        v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        objc_msgSend(v5, "insertObject:atIndex:", v4);
      }
    }
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", CFSTR("localhost"));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", CFSTR("localhost"));
  return result;
}

void __40__NSHost_resolveCurrentHostWithHandler___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[6];
  int v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = *(_BYTE **)(*(_QWORD *)(a1 + 80) + 8);
    if (*v2 == 108 && v2[1] == 111)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 64;
      if ((*(_DWORD *)(a1 + 88) & 4) == 0)
        v5 = 72;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + v5) + 8) + 24);
      objc_msgSend(v3, "insertObject:atIndex:", v4);
    }
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 && (v7 = *(_QWORD *)(v6 + 24)) != 0)
    v8 = *(NSObject **)(v7 + 40);
  else
    v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NSHost_resolveCurrentHostWithHandler___block_invoke_3;
  block[3] = &unk_1E14FA210;
  v11 = *(_DWORD *)(a1 + 92);
  v9 = *(_QWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 40);
  block[5] = v9;
  dispatch_async(v8, block);
}

uint64_t __40__NSHost_resolveCurrentHostWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[8];
  int v16;
  char v17[1025];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  bzero(v17, 0x401uLL);
  if (!getnameinfo(*(const sockaddr **)(*(_QWORD *)(a1 + 56) + 32), *(_DWORD *)(a1 + 64), v17, 0x401u, 0, 0, a3))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    if (v8)
    {
      v9 = v8;
      v10 = *(NSObject **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      if (v11 && (v12 = *(_QWORD *)(v11 + 24)) != 0)
        v13 = *(NSObject **)(v12 + 32);
      else
        v13 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_2;
      v15[3] = &unk_1E14F9EB8;
      v15[4] = a2;
      v15[5] = v9;
      v14 = *(_QWORD *)(a1 + 48);
      v15[6] = v11;
      v15[7] = v14;
      v16 = a4;
      dispatch_group_async(v10, v13, v15);
    }
  }
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 2, 1);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 4, 0);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 5, 0);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_7(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", result);
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v3);
  }
  return result;
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    result = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
    if (result)
      return objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  }
  return result;
}

void __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[6];
  int v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 && (v3 = *(_QWORD *)(v2 + 24)) != 0)
    v4 = *(NSObject **)(v3 + 40);
  else
    v4 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_3;
  block[3] = &unk_1E14FA210;
  v7 = *(_DWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 40);
  block[5] = v5;
  dispatch_async(v4, block);
}

uint64_t __49__NSHost___resolveWithFlags_resultArray_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __17__NSHost_address__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:", 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

uint64_t __14__NSHost_name__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

+ (NSHost)currentHost
{
  return (NSHost *)-[NSHost initToResolve:as:](objc_allocWithZone((Class)a1), 0, 0);
}

+ (NSHost)hostWithName:(NSString *)name
{
  return (NSHost *)-[NSHost initToResolve:as:](objc_allocWithZone((Class)a1), name, 1);
}

+ (NSHost)hostWithAddress:(NSString *)address
{
  return (NSHost *)-[NSHost initToResolve:as:](objc_allocWithZone((Class)a1), address, 2);
}

+ (BOOL)isHostCacheEnabled
{
  return 0;
}

- (_QWORD)initToResolve:(int)a3 as:
{
  _QWORD *v5;
  __NSHostExtraIvars *v6;
  SEL v7;
  const char *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)NSHost;
  v5 = objc_msgSendSuper2(&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(__NSHostExtraIvars);
    objc_setProperty_nonatomic(v5, v7, v6, 24);
    v9 = objc_msgSend(a2, "isEqualToString:", &stru_1E1500C68);
    v10 = (void *)v5[3];
    if (v10)
    {
      if (v9)
        v11 = 0;
      else
        v11 = a2;
      objc_setProperty_nonatomic(v10, v8, v11, 8);
      v12 = v5[3];
      if (v12)
        *(_DWORD *)(v12 + 16) = a3;
    }
  }
  return v5;
}

@end
