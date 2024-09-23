@implementation CAWindowServerVirtualDisplay

- (CAWindowServerVirtualDisplay)initWithOptions:(id)a3
{
  int v5;
  int v6;
  double v7;
  double v8;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  CFStringRef v15;
  malloc_zone_t *malloc_zone;
  CA::WindowServer::Display *v17;
  uint64_t v18;
  char *v19;
  CA::WindowServer::Display *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int32x4_t v31;
  unsigned int *v32;
  unsigned int v33;
  const __CFUUID *v39;
  const __CFString *v40;
  CA::WindowServer::Server *v41;
  CA::WindowServer::Server *v42;
  objc_super v43;
  _DWORD v44[2];
  char buffer[16];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayWidth"))
    || !objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayHeight")))
  {
    NSLog(CFSTR("kCAVirtualDisplayWidth and kCAVirtualDisplayHeight are required"));
    return 0;
  }
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayWidth")), "unsignedIntegerValue");
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayHeight")), "unsignedIntegerValue");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayUpdateRate")))
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayUpdateRate")), "doubleValue");
    if (v7 == 0.0)
      v8 = 0.0166666667;
    else
      v8 = 1.0 / v7;
  }
  else
  {
    v8 = 0.0166666667;
  }
  v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayMinimumFrameDuration"));
  if (v10)
    v11 = objc_msgSend(v10, "unsignedIntValue");
  else
    v11 = 1;
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayPixelFormat")))
    v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayPixelFormat")), "unsignedIntegerValue");
  else
    v12 = 1111970369;
  v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCAVirtualDisplayPixelFormatFollowsMode")), "BOOLValue");
  do
    v14 = __ldaxr(CA::WindowServer::VirtualDisplay::open(unsigned int,unsigned int,double,unsigned int,BOOL,unsigned int)::count);
  while (__stlxr(v14 + 1, CA::WindowServer::VirtualDisplay::open(unsigned int,unsigned int,double,unsigned int,BOOL,unsigned int)::count));
  v15 = CFStringCreateWithFormat(0, 0, CFSTR("Virtual-%d"), v14);
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v17 = (CA::WindowServer::Display *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x6480uLL, 0x743898A5uLL);
  if (!v17)
  {
    CFRelease(v15);
    return self;
  }
  v18 = (uint64_t)v17;
  v19 = (char *)v17 + 25560;
  v20 = CA::WindowServer::Display::Display(v17, v15);
  *(_QWORD *)v20 = off_1E158DD68;
  v21 = 25504;
  do
  {
    v22 = v18 + v21;
    *(_DWORD *)v22 = 0;
    *(_QWORD *)(v22 + 8) = 0;
    v21 += 16;
  }
  while ((CA::WindowServer::Display *)(v22 + 16) != (CA::WindowServer::Display *)((char *)v20 + 25552));
  *(_QWORD *)(v18 + 25552) = 0;
  *(_DWORD *)v19 = 0;
  *(double *)(v18 + 25568) = v8;
  if (v11 <= 1)
    v23 = 1;
  else
    v23 = v11;
  *((_DWORD *)v19 + 4) = v23;
  *(double *)(v18 + 25584) = v8 / (double)v23;
  *((_DWORD *)v19 + 9) = v12;
  *(_QWORD *)(v18 + 25600) = 0;
  if (v13)
    v24 = 2;
  else
    v24 = 0;
  v19[48] = v19[48] & 0xFC | v24;
  *(_OWORD *)(v18 + 25616) = 0u;
  *(_OWORD *)(v18 + 25632) = 0u;
  *(_QWORD *)(v18 + 25648) = 0;
  *((_DWORD *)v19 + 24) = 1065353216;
  *((_DWORD *)v19 + 34) = 0;
  *(_OWORD *)(v18 + 25664) = 0u;
  if (CA::Render::fourcc_to_format((CA::Render *)v12) - 33 <= 2)
  {
    v32 = (unsigned int *)(v18 + 624);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 | 8, v32));
  }
  v44[0] = v5;
  v44[1] = v6;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)buffer = _Q0;
  CA::WindowServer::Display::set_size(v18, (uint64_t)v44, (uint64_t)v44, (double *)buffer, *(double *)&_Q0, v25, v26, v27, v28, v29, v30, v31);
  v39 = CFUUIDCreate(0);
  v40 = CFUUIDCreateString(0, v39);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  *(_OWORD *)buffer = 0u;
  if (CFStringGetCString(v40, buffer, 256, 0x8000100u))
    *(_QWORD *)(v18 + 25600) = strdup(buffer);
  *(_WORD *)(v18 + 656) = *(_WORD *)(v18 + 656) & 0xE3FF | 0xC00;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v18 + 2136))(v18, 2);
  CFRelease(v39);
  CFRelease(v40);
  os_unfair_lock_lock((os_unfair_lock_t)(v18 + 716));
  *(_WORD *)(*(_QWORD *)(v18 + 728) + 2) = 257;
  os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 716));
  CFRelease(v15);
  v41 = (CA::WindowServer::Server *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 1616))(v18);
  if (!v41)
    return 0;
  v42 = v41;
  CA::WindowServer::Server::attach_contexts(v41);
  v43.receiver = self;
  v43.super_class = (Class)CAWindowServerVirtualDisplay;
  self = -[CAWindowServerDisplay _initWithCADisplayServer:](&v43, sel__initWithCADisplayServer_, v42);
  if (!self)
  {
    (**(void (***)(CA::WindowServer::Server *))v42)(v42);
    (*(void (**)(CA::WindowServer::Server *))(*(_QWORD *)v42 + 120))(v42);
  }
  return self;
}

@end
