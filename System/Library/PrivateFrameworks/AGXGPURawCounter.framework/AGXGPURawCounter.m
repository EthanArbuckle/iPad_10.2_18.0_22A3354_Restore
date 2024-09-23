AGXGPURawCounterImpl *AGXGPURawCounter::createInstance(AGXGPURawCounter *this)
{
  AGXGPURawCounterImpl *v1;

  os_unfair_lock_lock((os_unfair_lock_t)&sAGXGPURawCounterLock);
  if (sAGXGPURawCounterImpl)
    goto LABEL_5;
  v1 = (AGXGPURawCounterImpl *)operator new();
  *(_QWORD *)v1 = &off_24FD60598;
  *((_DWORD *)v1 + 2) = 0;
  *((_QWORD *)v1 + 16) = 0;
  *((_DWORD *)v1 + 34) = 0;
  *((_WORD *)v1 + 344) = 0;
  *(_QWORD *)((char *)v1 + 692) = 0;
  *((_QWORD *)v1 + 88) = 0;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  *((_OWORD *)v1 + 6) = 0u;
  *(_OWORD *)((char *)v1 + 105) = 0u;
  bzero((char *)v1 + 144, 0x204uLL);
  *((_DWORD *)v1 + 170) = 0;
  *(_OWORD *)((char *)v1 + 664) = 0u;
  if ((AGXGPURawCounterImpl::init(v1) & 1) == 0)
  {
    (*(void (**)(AGXGPURawCounterImpl *))(*(_QWORD *)v1 + 8))(v1);
LABEL_5:
    v1 = 0;
    goto LABEL_6;
  }
  sAGXGPURawCounterImpl = (uint64_t)v1;
  __dmb(0xBu);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&sAGXGPURawCounterLock);
  return v1;
}

uint64_t AGXGPURawCounter::destroyInstance(AGXGPURawCounter *this)
{
  uint64_t result;

  result = sAGXGPURawCounterImpl;
  if (sAGXGPURawCounterImpl)
  {
    AGXGPURawCounterImpl::free((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl);
    result = sAGXGPURawCounterImpl;
    if (sAGXGPURawCounterImpl)
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)sAGXGPURawCounterImpl + 8))(sAGXGPURawCounterImpl);
    sAGXGPURawCounterImpl = 0;
  }
  return result;
}

uint64_t AGXGPURawCounter::instance(AGXGPURawCounter *this)
{
  return sAGXGPURawCounterImpl;
}

uint64_t AGXGPURawCounter::sourceBufferMinSize(AGXGPURawCounter *this)
{
  return 0x8000;
}

uint64_t AGXGPURawCounter::sourceBufferSizeAlignment(AGXGPURawCounter *this)
{
  return 0x4000;
}

void AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::~RingBufferImpl(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this)
{
  *(_QWORD *)this = &off_24FD600B0;
  if (*((_QWORD *)this + 3))
    *((_QWORD *)this + 3) = 0;
}

{
  *(_QWORD *)this = &off_24FD600B0;
  if (*((_QWORD *)this + 3))
    *((_QWORD *)this + 3) = 0;
  JUMPOUT(0x2348A91CCLL);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::base(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this)
{
  return **((_QWORD **)this + 3);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::size(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this)
{
  return *(unsigned int *)(*((_QWORD *)this + 3) + 24);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::state(void **this, unsigned int *a2, unsigned int *a3)
{
  _QWORD *v6;

  sys_dcache_flush(this[3], 0x40uLL);
  v6 = this[3];
  *a2 = v6[4] - *((_DWORD *)v6 + 2);
  *a3 = (v6[6] + (unint64_t)*((unsigned int *)v6 + 6) - v6[4]) % *((unsigned int *)v6 + 6);
  return 1;
}

size_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::drain(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this, int a2)
{
  size_t v2;
  uint64_t v4;
  unsigned int v5;
  size_t v6;
  size_t v7;
  void *v8;
  size_t v9;
  uint64_t v10;
  unsigned int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 7) != 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Amount of data to be drained must be aligned to 64-bits!\n", "AGXGPURawCounterImpl.mm", 341, "drain");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "AGXGPURawCounterImpl.mm";
      v15 = 1024;
      v16 = 341;
      v17 = 2080;
      v18 = "drain";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Amount of data to be drained must be aligned to 64-bits!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "AGXGPURawCounterImpl.mm";
      v15 = 1024;
      v16 = 341;
      v17 = 2080;
      v18 = "drain";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Amount of data to be drained must be aligned to 64-bits!\n", buf, 0x1Cu);
    }
    return 0;
  }
  else
  {
    LODWORD(v2) = a2;
    v12 = 0;
    *(_DWORD *)buf = 0;
    (*(void (**)(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *, uint8_t *, unsigned int *))(*(_QWORD *)this + 32))(this, buf, &v12);
    if (v12 >= v2)
      v2 = v2;
    else
      v2 = v12;
    v4 = *((_QWORD *)this + 3);
    v5 = *(_DWORD *)(v4 + 24);
    if (*(_DWORD *)buf + (int)v2 <= v5)
    {
      v8 = (void *)(*(_QWORD *)v4 + *(unsigned int *)buf);
      v9 = v2;
    }
    else
    {
      v6 = v5 - *(_DWORD *)buf;
      v7 = (v2 - v6);
      sys_dcache_flush((void *)(*(_QWORD *)v4 + *(unsigned int *)buf), v6);
      v8 = (void *)**((_QWORD **)this + 3);
      v9 = v7;
    }
    sys_dcache_flush(v8, v9);
    v10 = *((_QWORD *)this + 3);
    *(_DWORD *)buf = (*(_DWORD *)buf + v2) % *(_DWORD *)(v10 + 24);
    *(_QWORD *)(v10 + 32) = *(_QWORD *)(v10 + 8) + *(unsigned int *)buf;
    sys_dcache_flush((void *)(v10 + 32), 8uLL);
  }
  return v2;
}

void AGXGPURawCounterImpl::SourceImpl::~SourceImpl(void **this)
{
  *this = &off_24FD600F0;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
}

{
  *this = &off_24FD600F0;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
  JUMPOUT(0x2348A91CCLL);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::owner(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((_QWORD *)this + 1);
}

void *AGXGPURawCounterImpl::SourceImpl::copyName(AGXGPURawCounterImpl::SourceImpl *this)
{
  void *v2;

  v2 = malloc_type_malloc((*((_DWORD *)this + 6) + 1), 0xF72E82B2uLL);
  return memcpy(v2, *((const void **)this + 2), (*((_DWORD *)this + 6) + 1));
}

uint64_t AGXGPURawCounterImpl::SourceImpl::copyAvailableCounterList(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  if (!a2)
    return *(unsigned int *)(a1 + 48);
  v4 = malloc_type_malloc(*(unsigned int *)(a1 + 64), 0x6082DC53uLL);
  *a2 = v4;
  memcpy(v4, *(const void **)(a1 + 56), *(unsigned int *)(a1 + 64));
  result = *(unsigned int *)(a1 + 48);
  if ((_DWORD)result)
  {
    v6 = 0;
    v7 = *(_QWORD *)(a1 + 56);
    do
    {
      v8 = (_QWORD *)(*a2 + v6);
      v9 = v8[1];
      *v8 = *a2 + *v8 - v7;
      v8[1] = *a2 + v9 - v7;
      v6 += 24;
    }
    while (24 * result != v6);
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setEnabled(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  uint64_t v2;

  if (!a2)
  {
    *((_DWORD *)this + 1559) &= ~0x80000000;
LABEL_6:
    v2 = 1;
    goto LABEL_7;
  }
  v2 = *((_QWORD *)this + 781);
  if (v2)
  {
    v2 = *((unsigned int *)this + 1559);
    if ((_DWORD)v2)
      goto LABEL_6;
  }
  LOBYTE(a2) = 0;
LABEL_7:
  *((_BYTE *)this + 6228) = a2;
  return v2;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::isEnabled(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned __int8 *)this + 6228);
}

void AGXGPURawCounterImpl::SourceImpl::clearSelectedCounterList(AGXGPURawCounterImpl::SourceImpl *this)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  mach_port_t v6;
  _OWORD v7[2];
  size_t outputStructCnt;

  v2 = sAGXGPURawCounterImpl;
  v3 = *(unsigned __int8 *)(sAGXGPURawCounterImpl + 689);
  *(_BYTE *)(sAGXGPURawCounterImpl + 689) = 0;
  if (v3)
  {
    v4 = *((_QWORD *)this + 1);
    if (*(_DWORD *)(v4 + 656))
    {
      if (*(_DWORD *)(v2 + 88))
      {
        v5 = 0;
        do
        {
          memset(v7, 0, sizeof(v7));
          LODWORD(v7[0]) = 6;
          BYTE4(v7[0]) = v5;
          v6 = *(_DWORD *)(v2 + 88);
          if (v6)
          {
            outputStructCnt = 32;
            IOConnectCallStructMethod(v6, 0x105u, v7, 0x20uLL, v7, &outputStructCnt);
            v2 = sAGXGPURawCounterImpl;
            v4 = *((_QWORD *)this + 1);
          }
          ++v5;
        }
        while (v5 < *(_DWORD *)(v4 + 656));
      }
    }
  }
  bzero((char *)this + 72, 0x180CuLL);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::addCounter(AGXGPURawCounterImpl::SourceImpl *this, const char *a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t result;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint32_t v14;
  const char **v15;
  unsigned int v16;
  const char *v17;
  int v18;
  int v19;
  unint64_t v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  const char *v24;
  const char *v25;
  const char *v26;
  unsigned int v27;
  char *v28;
  int v29;
  int v30;
  unsigned int v32;
  const char **v33;
  unsigned int v34;
  char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  int v40;
  int v41;
  unsigned int v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  _BYTE v50[10];
  _BYTE v51[6];
  uint64_t v52;
  uint8_t v53[32];
  __int128 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(AGXGPURawCounterImpl::SourceImpl *, _QWORD))(*(_QWORD *)this + 40))(this, 0);
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** counterName cannot be NULL!\n", "AGXGPURawCounterImpl.mm", 641, "addCounter");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v53 = 136315650;
      *(_QWORD *)&v53[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = 641;
      *(_WORD *)&v53[18] = 2080;
      *(_QWORD *)&v53[20] = "addCounter";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** counterName cannot be NULL!\n", v53, 0x1Cu);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)v53 = 136315650;
    *(_QWORD *)&v53[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&v53[12] = 1024;
    *(_DWORD *)&v53[14] = 641;
    *(_WORD *)&v53[18] = 2080;
    *(_QWORD *)&v53[20] = "addCounter";
    v11 = MEMORY[0x24BDACB70];
    v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** counterName cannot be NULL!\n";
    v13 = v53;
    goto LABEL_13;
  }
  v55 = 0;
  v54 = 0u;
  memset(v53, 0, sizeof(v53));
  if (a4 != -1)
  {
    if (a5 == -1)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s)! Both partition (0x%x) and select (0x%llx) must be specified!\n", "AGXGPURawCounterImpl.mm", 653, "addCounter", a2, a4, -1);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v44 = "AGXGPURawCounterImpl.mm";
        v45 = 1024;
        v46 = 653;
        v47 = 2080;
        v48 = "addCounter";
        v49 = 2080;
        *(_QWORD *)v50 = a2;
        *(_WORD *)&v50[8] = 1024;
        *(_DWORD *)v51 = a4;
        *(_WORD *)&v51[4] = 2048;
        v52 = -1;
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s)! Both partition (0x%x) and select (0x%llx) must be specified!\n", buf, 0x36u);
      }
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136316418;
      v44 = "AGXGPURawCounterImpl.mm";
      v45 = 1024;
      v46 = 653;
      v47 = 2080;
      v48 = "addCounter";
      v49 = 2080;
      *(_QWORD *)v50 = a2;
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)v51 = a4;
      *(_WORD *)&v51[4] = 2048;
      v52 = -1;
      v11 = MEMORY[0x24BDACB70];
      v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s)! Both partition (0x%x) and select (0x%llx) "
            "must be specified!\n";
      v13 = buf;
      v14 = 54;
      goto LABEL_55;
    }
    if (a4 == -2)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s) using GPURawCounter internal partition!\n", "AGXGPURawCounterImpl.mm", 659, "addCounter", a2);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v44 = "AGXGPURawCounterImpl.mm";
        v45 = 1024;
        v46 = 659;
        v47 = 2080;
        v48 = "addCounter";
        v49 = 2080;
        *(_QWORD *)v50 = a2;
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s) using GPURawCounter internal partition!\n", buf, 0x26u);
      }
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315906;
      v44 = "AGXGPURawCounterImpl.mm";
      v45 = 1024;
      v46 = 659;
      v47 = 2080;
      v48 = "addCounter";
      v49 = 2080;
      *(_QWORD *)v50 = a2;
      v11 = MEMORY[0x24BDACB70];
      v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s) using GPURawCounter internal partition!\n";
LABEL_54:
      v13 = buf;
      v14 = 38;
      goto LABEL_55;
    }
    *(_QWORD *)v53 = a2;
    *(_DWORD *)&v53[28] = a4;
    v15 = (const char **)v53;
    *(_QWORD *)&v54 = a5;
LABEL_16:
    if (a4 == -1)
    {
      v16 = *((_DWORD *)this + 1554);
      if (v16 == *((_DWORD *)this + 1555))
      {
        if (v16 != 16)
        {
          v27 = v16 + 1;
          *((_DWORD *)this + 1555) = v16 + 1;
          v28 = (char *)this + 24 * v16;
          *((_QWORD *)v28 + 9) = v15;
          *((_DWORD *)v28 + 20) = -1;
          *(int32x2_t *)(v28 + 84) = vdup_n_s32(a3);
          *((_DWORD *)this + 1554) = v27;
          return 1;
        }
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Insufficient space to add metadata counter (%s)!\n", "AGXGPURawCounterImpl.mm", 705, "addCounter", *v15);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v38 = *v15;
          *(_DWORD *)buf = 136315906;
          v44 = "AGXGPURawCounterImpl.mm";
          v45 = 1024;
          v46 = 705;
          v47 = 2080;
          v48 = "addCounter";
          v49 = 2080;
          *(_QWORD *)v50 = v38;
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add metadata counter (%s)!\n", buf, 0x26u);
        }
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
        if (!(_DWORD)result)
          return result;
        v17 = *v15;
        *(_DWORD *)buf = 136315906;
        v44 = "AGXGPURawCounterImpl.mm";
        v45 = 1024;
        v46 = 705;
        v47 = 2080;
        v48 = "addCounter";
        v49 = 2080;
        *(_QWORD *)v50 = v17;
        v11 = MEMORY[0x24BDACB70];
        v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add metadata counter (%s)!\n";
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Metadata (%s) counter must be added before any other counters!\n", "AGXGPURawCounterImpl.mm", 699, "addCounter", *v15);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v37 = *v15;
          *(_DWORD *)buf = 136315906;
          v44 = "AGXGPURawCounterImpl.mm";
          v45 = 1024;
          v46 = 699;
          v47 = 2080;
          v48 = "addCounter";
          v49 = 2080;
          *(_QWORD *)v50 = v37;
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Metadata (%s) counter must be added before any other counters!\n", buf, 0x26u);
        }
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
        if (!(_DWORD)result)
          return result;
        v25 = *v15;
        *(_DWORD *)buf = 136315906;
        v44 = "AGXGPURawCounterImpl.mm";
        v45 = 1024;
        v46 = 699;
        v47 = 2080;
        v48 = "addCounter";
        v49 = 2080;
        *(_QWORD *)v50 = v25;
        v11 = MEMORY[0x24BDACB70];
        v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Metadata (%s) counter must be added before any other counters!\n";
      }
      goto LABEL_54;
    }
    if (*((_DWORD *)this + 1556))
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** HW counter (%s) must be added before any shader profiler counters!\n", "AGXGPURawCounterImpl.mm", 790, "addCounter", *v15);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v36 = *v15;
        *(_DWORD *)buf = 136315906;
        v44 = "AGXGPURawCounterImpl.mm";
        v45 = 1024;
        v46 = 790;
        v47 = 2080;
        v48 = "addCounter";
        v49 = 2080;
        *(_QWORD *)v50 = v36;
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** HW counter (%s) must be added before any shader profiler counters!\n", buf, 0x26u);
      }
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (!(_DWORD)result)
        return result;
      v24 = *v15;
      *(_DWORD *)buf = 136315906;
      v44 = "AGXGPURawCounterImpl.mm";
      v45 = 1024;
      v46 = 790;
      v47 = 2080;
      v48 = "addCounter";
      v49 = 2080;
      *(_QWORD *)v50 = v24;
      v11 = MEMORY[0x24BDACB70];
      v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** HW counter (%s) must be added before any shader profiler counters!\n";
      goto LABEL_54;
    }
    if (*((_DWORD *)this + 1554) >= 0x100u)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Insufficient space to add HW counter (%s)!\n", "AGXGPURawCounterImpl.mm", 796, "addCounter", *v15);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v39 = *v15;
        *(_DWORD *)buf = 136315906;
        v44 = "AGXGPURawCounterImpl.mm";
        v45 = 1024;
        v46 = 796;
        v47 = 2080;
        v48 = "addCounter";
        v49 = 2080;
        *(_QWORD *)v50 = v39;
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add HW counter (%s)!\n", buf, 0x26u);
      }
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (!(_DWORD)result)
        return result;
      v26 = *v15;
      *(_DWORD *)buf = 136315906;
      v44 = "AGXGPURawCounterImpl.mm";
      v45 = 1024;
      v46 = 796;
      v47 = 2080;
      v48 = "addCounter";
      v49 = 2080;
      *(_QWORD *)v50 = v26;
      v11 = MEMORY[0x24BDACB70];
      v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add HW counter (%s)!\n";
      goto LABEL_54;
    }
    if (a4)
    {
      if ((a3 & 0xF) != 0 || a3 - 65 <= 0xFFFFFFBF)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** counterWidth must be 16, 32, 48, or 64!\n", "AGXGPURawCounterImpl.mm", 808, "addCounter");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v44 = "AGXGPURawCounterImpl.mm";
          v45 = 1024;
          v46 = 808;
          v47 = 2080;
          v48 = "addCounter";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** counterWidth must be 16, 32, 48, or 64!\n", buf, 0x1Cu);
        }
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
        if (!(_DWORD)result)
          return result;
        *(_DWORD *)buf = 136315650;
        v44 = "AGXGPURawCounterImpl.mm";
        v45 = 1024;
        v46 = 808;
        v47 = 2080;
        v48 = "addCounter";
        v11 = MEMORY[0x24BDACB70];
        v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** counterWidth must be 16, 32, 48, or 64!\n";
        v13 = buf;
LABEL_13:
        v14 = 28;
LABEL_55:
        _os_log_impl(&dword_22FAF3000, v11, OS_LOG_TYPE_INFO, v12, v13, v14);
        return 0;
      }
    }
    else
    {
      a3 = 64;
    }
    if (a4 < *(_DWORD *)(*((_QWORD *)this + 1) + 676) || a3 == 64)
      v32 = a3;
    else
      v32 = a3 + 16;
    if (!perfCtrSamplerAddSourceCounter(*((_DWORD *)this + 7), (uint64_t)v15, a3, v32))
    {
      if (v15 == (const char **)v53)
        v33 = 0;
      else
        v33 = v15;
      v34 = *((_DWORD *)this + 1554);
      v35 = (char *)this + 24 * v34;
      *((_QWORD *)v35 + 9) = v33;
      *((_DWORD *)v35 + 20) = a4;
      *((_DWORD *)v35 + 21) = a3;
      *((_DWORD *)v35 + 22) = v32;
      *((_DWORD *)this + 1554) = v34 + 1;
      return 1;
    }
    return 0;
  }
  result = (uint64_t)bsearch_b(a2, *((const void **)this + 7), *((unsigned int *)this + 12), 0x18uLL, &__block_literal_global);
  if (!result)
    return result;
  v15 = (const char **)(*(_QWORD *)(*((_QWORD *)this + 1) + 128)
                      + 56
                      * *(unsigned int *)(*((_QWORD *)this + 5)
                                        - 0x5555555555555554 * ((result - *((_QWORD *)this + 7)) >> 3)));
  a4 = *((_DWORD *)v15 + 7);
  if (a4 != -2)
    goto LABEL_16;
  v42 = *((_DWORD *)this + 1554);
  v18 = *((_DWORD *)this + 1556);
  *((_DWORD *)this + 1556) = 0;
  v40 = *((_DWORD *)this + 9);
  v41 = v18;
  if ((v40 & 1) != 0)
    v19 = 2;
  else
    v19 = 1;
  if (!*(_BYTE *)(*((_QWORD *)this + 1) + 120))
  {
    v20 = (unint64_t)v15[4];
    AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[28] = v20 / 0xA + 48;
    AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[29] = (v20 % 0xA) | 0x30;
  }
  v21 = 0;
  v22 = 0;
  while (1)
  {
    if (!*(_BYTE *)(*((_QWORD *)this + 1) + 120))
    {
      AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[21] = 48;
      AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[22] = v22 | 0x30;
      if ((AGXGPURawCounterImpl::SourceImpl::addCounter(this, AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName, 0x20u, 0xFFFFFFFF, 0xFFFFFFFFFFFFFFFFLL) & 1) == 0)goto LABEL_63;
      goto LABEL_35;
    }
    v23 = *((_DWORD *)v15 + 8);
    if (v23 >= 0xA)
      break;
    if (!AGXGPURawCounterImpl::SourceImpl::addCounter(this, (&obfuscatedUSCProfileName(unsigned int,unsigned int)::obfuscatedUSCProfileNameList[v21])[v23], 0x20u, 0xFFFFFFFF, 0xFFFFFFFFFFFFFFFFLL))goto LABEL_63;
LABEL_35:
    v22 += v19;
    v21 += 10 * v19;
    if (v22 >= 8)
      goto LABEL_63;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Error, invalid uscIndex (%u >= %u) and/or invalid regIndex (%u >= %u)!\n", "AGXGPURawCounterImpl.mm", 4593, "obfuscatedUSCProfileName", v23, 10, v22, 8);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    v44 = "AGXGPURawCounterImpl.mm";
    v45 = 1024;
    v46 = 4593;
    v47 = 2080;
    v48 = "obfuscatedUSCProfileName";
    v49 = 1024;
    *(_DWORD *)v50 = v23;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = 10;
    *(_WORD *)v51 = 1024;
    *(_DWORD *)&v51[2] = v22;
    LOWORD(v52) = 1024;
    *(_DWORD *)((char *)&v52 + 2) = 8;
    _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, invalid uscIndex (%u >= %u) and/or invalid regIndex (%u >= %u)!\n", buf, 0x34u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    v44 = "AGXGPURawCounterImpl.mm";
    v45 = 1024;
    v46 = 4593;
    v47 = 2080;
    v48 = "obfuscatedUSCProfileName";
    v49 = 1024;
    *(_DWORD *)v50 = v23;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = 10;
    *(_WORD *)v51 = 1024;
    *(_DWORD *)&v51[2] = v22;
    LOWORD(v52) = 1024;
    *(_DWORD *)((char *)&v52 + 2) = 8;
    _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, invalid uscIndex (%u >= %u) and/or invalid regIndex (%u >= %u)!\n", buf, 0x34u);
  }
LABEL_63:
  *((_DWORD *)this + 1556) = v41;
  if ((v40 & 1) != 0)
    v29 = 4;
  else
    v29 = 8;
  v30 = *((_DWORD *)this + 1554);
  if (v29 + v42 == v30)
  {
    *((_DWORD *)this + 1556) = v29 + v41;
    return 1;
  }
  bzero((char *)this + 24 * v42 + 72, 24 * (v30 - v42));
  result = 0;
  *((_DWORD *)this + 1554) = v42;
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::availableTriggers(AGXGPURawCounterImpl::SourceImpl *this)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;

  v1 = *((_DWORD *)this + 9);
  v2 = 7;
  if ((v1 & 0x1E) != 0)
  {
    if (*(_DWORD *)(*((_QWORD *)this + 1) + 92) <= 0xCu)
      v2 = 7;
    else
      v2 = 15;
  }
  if ((v1 & 1) != 0)
  {
    v3 = *((_QWORD *)this + 1);
    v4 = *(_DWORD *)(v3 + 92);
    if (v4 == 16)
    {
      if (*(_DWORD *)(v3 + 96) <= 1u)
        goto LABEL_11;
    }
    else if (v4 < 0x11)
    {
      goto LABEL_11;
    }
    v2 &= ~4u;
  }
LABEL_11:
  if ((v1 & 0x18) != 0)
    return v2 & 0xFFFFFFFD;
  else
    return v2;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::clearTriggers(AGXGPURawCounterImpl::SourceImpl *this)
{
  uint64_t result;

  result = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, _QWORD))(*(_QWORD *)this + 40))(this, 0);
  *((_DWORD *)this + 1559) = 0;
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::addTrigger(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if ((a2 - 1) < 2)
  {
    *(_DWORD *)(a1 + 6236) |= a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Period"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a1 + 6232) = objc_msgSend(v8, "unsignedLongValue");

    v9 = 1;
  }
  else
  {
    if (a2 == 4)
    {
      v7 = *(_DWORD *)(a1 + 6236) | 4;
      goto LABEL_7;
    }
    if (a2 == 8)
    {
      v7 = *(_DWORD *)(a1 + 6236) | 8;
LABEL_7:
      *(_DWORD *)(a1 + 6236) = v7;
      v9 = 1;
      goto LABEL_13;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", "AGXGPURawCounterImpl.mm", 911, "addTrigger", a2);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v12 = "AGXGPURawCounterImpl.mm";
      v13 = 1024;
      v14 = 911;
      v15 = 2080;
      v16 = "addTrigger";
      v17 = 1024;
      v18 = a2;
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v12 = "AGXGPURawCounterImpl.mm";
      v13 = 1024;
      v14 = 911;
      v15 = 2080;
      v16 = "addTrigger";
      v17 = 1024;
      v18 = a2;
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
    }
    v9 = 0;
  }
LABEL_13:

  return v9;
}

void sub_22FAF9A24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::triggers(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned int *)this + 1559);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setOptions(AGXGPURawCounterImpl::SourceImpl *this, NSDictionary *a2)
{
  NSDictionary *v3;
  char v4;
  void *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;

  v3 = a2;
  v4 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 112))(this);
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("RingBufferSizeInKB"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend(v5, "unsignedLongValue");
    v7 = (_DWORD)v6 << 10;
    if ((unint64_t)(v6 << 10) >= 0x800000000)
      v7 = 0;
    v8 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, _QWORD))(*(_QWORD *)this + 160))(this, v7 & 0xFFFFFC00);
  }
  else
  {
    v8 = -1;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("SourceBufferSizeInKB"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
LABEL_12:
      v11 = objc_msgSend(v10, "unsignedLongValue") << 10;
      if (v11 >= v8)
        v11 = v8;
      if (v11 >= 0x800000000)
        v8 = 0x800000000;
      else
        v8 = v11;
      goto LABEL_18;
    }
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("BufferSizeInKB"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_12;
  }
  if (v8 == -1)
    goto LABEL_19;
LABEL_18:
  if ((*(unsigned int (**)(AGXGPURawCounterImpl::SourceImpl *, unint64_t))(*(_QWORD *)this + 136))(this, v8))
  {
LABEL_19:
    if ((v4 & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("ShaderProfiler"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "BOOLValue");

      if ((v4 & 2) == 0)
      {
LABEL_21:
        if ((v4 & 4) == 0)
        {
LABEL_32:
          v13 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, uint64_t))(*(_QWORD *)this + 120))(this, v12);
          goto LABEL_33;
        }
LABEL_29:
        -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("SWResetOnRead"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        if (v18)
          v12 = v12 | 4;
        else
          v12 = v12;
        goto LABEL_32;
      }
    }
    else
    {
      v12 = 0;
      if ((v4 & 2) == 0)
        goto LABEL_21;
    }
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("KickTimestamp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
      v12 = v12 | 2;
    else
      v12 = v12;
    if ((v4 & 4) == 0)
      goto LABEL_32;
    goto LABEL_29;
  }
  v13 = 0;
LABEL_33:

  return v13;
}

void sub_22FAF9CA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::availableFlags(AGXGPURawCounterImpl::SourceImpl *this)
{
  if (*(_DWORD *)(*((_QWORD *)this + 787) + 56))
    return 7;
  else
    return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setFlags(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  (*(void (**)(AGXGPURawCounterImpl::SourceImpl *, _QWORD))(*(_QWORD *)this + 40))(this, 0);
  *((_DWORD *)this + 1560) = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 112))(this) & a2;
  return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::flags(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned int *)this + 1560);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setBufferSize(AGXGPURawCounterImpl::SourceImpl *this, uint64_t a2)
{
  size_t v4;
  void *memptr;

  if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 1) + 96))(*((_QWORD *)this + 1)))
    (*(void (**)(_QWORD))(**((_QWORD **)this + 1) + 88))(*((_QWORD *)this + 1));
  (*(void (**)(AGXGPURawCounterImpl::SourceImpl *, _QWORD))(*(_QWORD *)this + 40))(this, 0);
  if (*((_QWORD *)this + 781))
  {
    (*(void (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 240))(this);
    free(*((void **)this + 781));
    *((_QWORD *)this + 781) = 0;
    *((_QWORD *)this + 782) = 0;
  }
  if (a2)
  {
    memptr = 0;
    v4 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, uint64_t, uint64_t))(*(_QWORD *)this + 152))(this, a2, 1);
    if (malloc_type_posix_memalign(&memptr, 0x4000uLL, v4, 0x1C021F86uLL))
      return 0;
    bzero(memptr, v4);
    *((_QWORD *)this + 781) = memptr;
    *((_QWORD *)this + 782) = v4;
  }
  return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::bufferSize(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((_QWORD *)this + 782);
}

unint64_t AGXGPURawCounterImpl::SourceImpl::alignBufferSize(AGXGPURawCounterImpl::SourceImpl *this, unint64_t a2, int a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *((unsigned int *)this + 1572);
    v4 = 0x800000000uLL / ((_DWORD)v3 << 14) * ((_DWORD)v3 << 14);
    if (v4 >= a2)
      v4 = a2;
    v5 = v4 / v3 + 0x3FFF;
    v6 = v5 & 0x1FFFFFC000;
    if ((v5 & 0x1FFFFFC000uLL) >= 0x40000000)
      v6 = 0x40000000;
    v7 = (v5 & 0x1FFFFFC000) == 0;
    v8 = 0x4000;
    if (v7)
      v6 = 0x4000;
    if (!a3)
      v8 = 0;
    return v8 + v6 * v3;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterImpl.mm", 1089, "alignBufferSize");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "AGXGPURawCounterImpl.mm";
      v12 = 1024;
      v13 = 1089;
      v14 = 2080;
      v15 = "alignBufferSize";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "AGXGPURawCounterImpl.mm";
      v12 = 1024;
      v13 = 1089;
      v14 = 2080;
      v15 = "alignBufferSize";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::calcBufferSizeWithRingBufferSize(AGXGPURawCounterImpl::SourceImpl *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = 0x40000000;
    if (a2 < 0x40000000)
      v2 = a2;
    v3 = v2 * *((unsigned int *)this + 1572);
    if (v3 >= 0x800000000)
      v4 = 0x800000000;
    else
      v4 = v3;
    return (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, uint64_t, _QWORD))(*(_QWORD *)this + 152))(this, v4, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterImpl.mm", 1120, "calcBufferSizeWithRingBufferSize");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v7 = "AGXGPURawCounterImpl.mm";
      v8 = 1024;
      v9 = 1120;
      v10 = 2080;
      v11 = "calcBufferSizeWithRingBufferSize";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v7 = "AGXGPURawCounterImpl.mm";
      v8 = 1024;
      v9 = 1120;
      v10 = 2080;
      v11 = "calcBufferSizeWithRingBufferSize";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::ringBuffer(AGXGPURawCounterImpl::SourceImpl *this, unsigned int a2)
{
  uint64_t v4;
  FILE *v6;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  _WORD v22[9];

  *(_QWORD *)&v22[5] = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 176))(this) <= a2)
  {
    v6 = (FILE *)*MEMORY[0x24BDAC8D8];
    v7 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 176))(this);
    fprintf(v6, "AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)\n", "AGXGPURawCounterImpl.mm", 1141, "ringBuffer", a2, v7);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v13 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 176))(this);
      *(_DWORD *)buf = 136316162;
      v16 = "AGXGPURawCounterImpl.mm";
      v17 = 1024;
      v18 = 1141;
      v19 = 2080;
      v20 = "ringBuffer";
      v21 = 1024;
      *(_DWORD *)v22 = a2;
      v22[2] = 1024;
      *(_DWORD *)&v22[3] = v13;
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)\n", buf, 0x28u);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      return 0;
    v8 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 176))(this);
    *(_DWORD *)buf = 136316162;
    v16 = "AGXGPURawCounterImpl.mm";
    v17 = 1024;
    v18 = 1141;
    v19 = 2080;
    v20 = "ringBuffer";
    v21 = 1024;
    *(_DWORD *)v22 = a2;
    v22[2] = 1024;
    *(_DWORD *)&v22[3] = v8;
    v9 = MEMORY[0x24BDACB70];
    v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)\n";
    v11 = 40;
    goto LABEL_12;
  }
  v4 = *((_QWORD *)this + 785);
  if (v4)
    return *(_QWORD *)(v4 + 8 * a2);
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Ring buffers have not been allocated. Was sampling ever started on source %s?\n", "AGXGPURawCounterImpl.mm", 1147, "ringBuffer", *((const char **)this + 2));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v14 = *((_QWORD *)this + 2);
    *(_DWORD *)buf = 136315906;
    v16 = "AGXGPURawCounterImpl.mm";
    v17 = 1024;
    v18 = 1147;
    v19 = 2080;
    v20 = "ringBuffer";
    v21 = 2080;
    *(_QWORD *)v22 = v14;
    _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Ring buffers have not been allocated. Was sampling ever started on source %s?\n", buf, 0x26u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v12 = *((_QWORD *)this + 2);
    *(_DWORD *)buf = 136315906;
    v16 = "AGXGPURawCounterImpl.mm";
    v17 = 1024;
    v18 = 1147;
    v19 = 2080;
    v20 = "ringBuffer";
    v21 = 2080;
    *(_QWORD *)v22 = v12;
    v9 = MEMORY[0x24BDACB70];
    v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Ring buffers have not been allocated. Was sampling ever started on source %s?\n";
    v11 = 38;
LABEL_12:
    _os_log_impl(&dword_22FAF3000, v9, OS_LOG_TYPE_INFO, v10, buf, v11);
  }
  return 0;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::ringBufferNum(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned int *)this + 1572);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::postProcessData(AGXGPURawCounterImpl::SourceImpl *this, unsigned int a2, const unsigned __int8 *a3, uint64_t a4, unint64_t *a5, unsigned __int8 *a6, uint64_t a7, unint64_t *a8, BOOL a9)
{
  uint64_t result;

  result = 0;
  if (a3 && a5 && a6 && a7 && a8)
  {
    if (a4)
    {
      result = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 200))(this);
      *a5 = 0;
      *a8 = 0;
    }
    else
    {
      *a5 = 0;
      *a8 = 0;
      return 1;
    }
  }
  return result;
}

BOOL AGXGPURawCounterImpl::SourceImpl::postProcessData(AGXGPURawCounterImpl::SourceImpl *this, unsigned int a2, const unsigned __int8 *a3, unint64_t a4, unint64_t *a5, unint64_t a6, unsigned __int8 *a7, unint64_t a8, unint64_t a9, unint64_t *a10, BOOL a11)
{
  uint64_t v11;
  _BOOL8 v15;
  _BOOL4 v21;
  char v23;
  uint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  size_t v27;
  unsigned int v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  int v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  size_t v37;
  unint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const void *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  unsigned int v47;
  unsigned int SampleType;
  int v49;
  char v50;
  _BYTE *v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  const unsigned __int8 *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  const unsigned __int8 *v63;
  int v64;
  _BYTE *v65;
  unsigned int v66;
  unsigned int v67;
  char v68;
  unint64_t v69;
  void *v70;
  char *v72;
  char *v73;
  char *v74;
  unsigned __int8 *v75;
  uint64_t v76;
  uint8_t *v77;
  uint64_t v78;
  unint64_t v79;
  NSObject *v80;
  const char *v81;
  uint32_t v82;
  int v83;
  int v84;
  int v85;
  const void *v86;
  unint64_t v87;
  size_t __n;
  char *v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  int v95;
  size_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  unint64_t v100;
  int v101;
  char v102;
  char v103;
  int v104;
  const unsigned __int8 *v105;
  const unsigned __int8 *v106;
  int __src;
  const unsigned __int8 *__srca;
  unsigned int __srcb;
  char *__srcc;
  _BOOL4 v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  unint64_t v115;
  char *__dst;
  unint64_t v117;
  uint64_t v118;
  const void *v119[4];
  unsigned int v120;
  _BYTE v121[32];
  unint64_t v122;
  unint64_t v123;
  int v124;
  int v125;
  char v126;
  uint8_t v127[4];
  const char *v128;
  __int16 v129;
  int v130;
  __int16 v131;
  const char *v132;
  __int16 v133;
  const void *v134;
  __int16 v135;
  const void *v136;
  uint8_t v137[768];
  uint8_t buf[4];
  const char *v139;
  __int16 v140;
  int v141;
  __int16 v142;
  const char *v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v11 = *((_QWORD *)this + 787);
  if (!v11 || !*(_QWORD *)(v11 + 16))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** parseSampleHeader() is not set!\n", "AGXGPURawCounterImpl.mm", 1330, "postProcessData");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v139 = "AGXGPURawCounterImpl.mm";
      v140 = 1024;
      v141 = 1330;
      v142 = 2080;
      v143 = "postProcessData";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** parseSampleHeader() is not set!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v139 = "AGXGPURawCounterImpl.mm";
      v140 = 1024;
      v141 = 1330;
      v142 = 2080;
      v143 = "postProcessData";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** parseSampleHeader() is not set!\n", buf, 0x1Cu);
    }
    return 0;
  }
  if (*((_DWORD *)this + 1572) <= a2)
    return 0;
  v15 = 0;
  if (!a3)
    return v15;
  if (!a4)
    return v15;
  if (!a5)
    return v15;
  v15 = 0;
  if (a6 >= a4)
    return v15;
  if (!a7)
    return v15;
  if (!a8)
    return v15;
  v15 = 0;
  if (a9 >= a8 || !a10)
    return v15;
  if (*a5 >= a4
    || *a10 >= a8
    || (((a6 | a4) | *a5) & 7) != 0
    || (((a9 | a8) | *a10) & 7) != 0
    || (*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 1) + 104))(*((_QWORD *)this + 1)) > a8)
  {
    return 0;
  }
  v21 = ((*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 128))(this) & 1) != 0
     || *((_DWORD *)this + 1556) != 0;
  v111 = v21;
  v23 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 128))(this);
  v103 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 128))(this);
  v101 = *((_DWORD *)this + 1576);
  v24 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 16))(this);
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v24 + 56))(v24) & 2) != 0)
    v113 = ((*(unsigned int (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 96))(this) >> 2) & 1;
  else
    v113 = 0;
  v102 = v23;
  if ((v23 & 2) != 0)
    v112 = *(_DWORD *)(*((_QWORD *)this + 787) + 56);
  else
    v112 = 0;
  v114 = *((_DWORD *)this + 1554);
  __src = *((_DWORD *)this + 1555);
  v104 = *((_DWORD *)this + 1556);
  v120 = 0;
  if ((v25 & 1) == 0
  {
    if ((*((_DWORD *)this + 9) & 1) != 0)
      v83 = 4096;
    else
      v83 = 2048;
    AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize = v83;
  }
  if ((v26 & 1) == 0
  {
    if ((*((_DWORD *)this + 9) & 1) != 0)
      v84 = 1;
    else
      v84 = 4;
    AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcPayloadScale = v84;
  }
  v27 = AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize;
  if (AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize)
  {
    __dst = (char *)operator new(AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize);
    bzero(__dst, v27);
  }
  else
  {
    __dst = 0;
  }
  LOBYTE(v119[0]) = 0;
  memset((char *)v119 + 4, 0, 28);
  v28 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 104))(*((_QWORD *)this + 1));
  StackAllocator::init((StackAllocator *)v119, v28);
  v29 = a10;
  v30 = *a10;
  if (*a5 == a6)
  {
    v15 = 1;
    v31 = a6;
    goto LABEL_128;
  }
  v117 = *a5;
  v115 = *a10;
  v32 = v104 + __src;
  v97 = 8 * v112;
  v95 = v104 + __src;
  v33 = !v111;
  if (v114 != v104 + __src)
    v33 = 1;
  v90 = v33;
  __n = (8 * (v114 - (v104 + __src)));
  v89 = (char *)this + 72;
  v34 = v113;
  if (v114 == v32)
    v34 = 0;
  v93 = v34;
  v99 = (v114 - v32);
  v94 = a2 << 8;
  v91 = 8 * v94;
  v92 = 8 * (v114 - (v104 + __src));
  while (1)
  {
    v31 = v117;
    while (!(*(unsigned int (**)(_QWORD))(*((_QWORD *)this + 787) + 32))(*(_QWORD *)&a3[v31]))
    {
      v31 = (v31 + 8) % a4;
      if (v31 == a6)
      {
        v15 = 1;
        goto LABEL_126;
      }
    }
    __srca = &a3[v31];
    v35 = v31;
    while (1)
    {
      v35 = (v35 + 8) % a4;
      if (v35 == a6)
        break;
      if (((*(uint64_t (**)(_QWORD))(*((_QWORD *)this + 787) + 32))(*(_QWORD *)&a3[v35]) & 1) != 0)
        goto LABEL_53;
    }
    v35 = a6;
    if (!a11)
    {
      v15 = 1;
      goto LABEL_127;
    }
LABEL_53:
    v36 = v35;
    v37 = a4 - v31;
    v117 = v36;
    v38 = (a4 - v31 + v36) % a4;
    if (v38 < *((unsigned int *)this + 1577))
    {
      v15 = 0;
      goto LABEL_127;
    }
    if (v38 > AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize)
    {
      v79 = (a4 - v31 + v36) % a4;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Source sample size is unexpectedly larger than the maximum! (%llu > %u)\n", "AGXGPURawCounterImpl.mm", 1481, "postProcessData", v38, AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v127 = 136316162;
        v128 = "AGXGPURawCounterImpl.mm";
        v129 = 1024;
        v130 = 1481;
        v131 = 2080;
        v132 = "postProcessData";
        v133 = 2048;
        v134 = (const void *)v79;
        v135 = 1024;
        LODWORD(v136) = AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize;
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Source sample size is unexpectedly larger than the maximum! (%llu > %u)\n", v127, 0x2Cu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v127 = 136316162;
        v128 = "AGXGPURawCounterImpl.mm";
        v129 = 1024;
        v130 = 1481;
        v131 = 2080;
        v132 = "postProcessData";
        v133 = 2048;
        v134 = (const void *)v79;
        v135 = 1024;
        LODWORD(v136) = AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize;
        _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Source sample size is unexpectedly larger than the maximum! (%llu > %u)\n", v127, 0x2Cu);
      }
      v15 = 0;
      v29 = a10;
      v30 = v115;
      goto LABEL_128;
    }
    v100 = (a4 - v31 + v36) % a4;
    v87 = v31;
    if (v31 >= v36)
    {
      memcpy(__dst, __srca, v37);
      memcpy(&__dst[v37], a3, v100 - v37);
      __srca = (const unsigned __int8 *)__dst;
    }
    v118 = 0;
    v118 = *(_QWORD *)(*((_QWORD *)this + 793) + 8 * a2);
    v39 = (*(uint64_t (**)(const unsigned __int8 *, unint64_t *, uint64_t *))(*((_QWORD *)this + 787)
                                                                                            + 16))(__srca, &v122, &v118);
    v40 = v122 & 0xF;
    if (v40 != 5)
      break;
    v41 = 8 * a2;
    *(_QWORD *)(*((_QWORD *)this + 792) + v41) = v123;
    *(_QWORD *)(*((_QWORD *)this + 793) + v41) = v118;
    if ((v103 & 4) != 0)
    {
      if (v114 == v95)
        goto LABEL_79;
LABEL_78:
      bzero((void *)(*((_QWORD *)this + 794) + 8 * v94), v92);
      goto LABEL_79;
    }
    if ((v93 & 1) != 0)
      goto LABEL_78;
LABEL_79:
    if ((v102 & 2) != 0)
    {
      v52 = *(unsigned int *)(*((_QWORD *)this + 787) + 40);
      bzero((void *)(*((_QWORD *)this + 795) + 24 * v52 * a2), 24 * v52);
    }
LABEL_125:
    v15 = 1;
    if (v117 == a6)
    {
LABEL_126:
      v31 = a6;
LABEL_127:
      v29 = a10;
      v30 = v115;
      goto LABEL_128;
    }
  }
  v42 = v100 - v39;
  v43 = (const void *)(*((unsigned int *)this + 1579)
                     + (v42 - v97)
                     * AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcPayloadScale);
  v86 = (const void *)((a8 - a9 + 8 + v115) / a8 * a8 - (8 - a9 + v115));
  v15 = v86 < v43;
  if (v86 < v43)
    goto LABEL_149;
  if (v119[2] >= v43)
  {
    v44 = *((_QWORD *)this + 792);
    if (v123 < *(_QWORD *)(v44 + 8 * a2))
      goto LABEL_148;
    v119[3] = 0;
    if (v42 < *((_DWORD *)this + 1578))
      goto LABEL_148;
    v45 = v39;
    if ((v102 & 2) != 0)
    {
      if (!AGXGPURawCounterImpl::SourceImpl::generateKickTimestampSamples(this, a2, *(_QWORD *)(v44 + 8 * a2), v123, (uint64_t)__srca, v39, (uint64_t)v137, &v120))goto LABEL_148;
      if (v119[1])
        v46 = (unint64_t *)((char *)v119[1] + (unint64_t)v119[3]);
      else
        v46 = 0;
      v47 = AGXGPURawCounterImpl::SourceImpl::emitKickTimestampSamples((uint64_t)this, a2, (uint64_t)v137, v120, v123, v46);
      StackAllocator::reserve((StackAllocator *)v119, v47);
      v45 += v97;
      v40 = v122 & 0xF;
    }
    if (v40 != 5)
    {
      v105 = &__srca[v45];
      v127[0] = 0;
      SampleType = generateSampleType((uint64_t *)&v122, (BOOL *)v127);
      v49 = v90;
      if (SampleType < 6)
        v49 = 1;
      if (v49 != 1)
        goto LABEL_98;
      v50 = SampleType;
      *(_QWORD *)StackAllocator::reserve((StackAllocator *)v119, 8u) = 0x52544E4357525047;
      v51 = (v101 & 1) != 0 ? (_BYTE *)StackAllocator::reserve((StackAllocator *)v119, 0x20u) : v121;
      v53 = *((_DWORD *)this + 7);
      *(_DWORD *)v51 = v124;
      v51[4] = 4;
      *((_WORD *)v51 + 3) = -1519;
      v54 = v122;
      *((_QWORD *)v51 + 1) = v123;
      *((_DWORD *)v51 + 4) = v125;
      *((_DWORD *)v51 + 5) = v54 >> 16;
      v51[24] = v53;
      v51[25] = a2;
      v51[26] = v126 & 0x3F;
      v51[5] = v50;
      v51[27] = *((_BYTE *)this + 6216) - *((_DWORD *)this + 1556);
      copyMetaCounterList((StackAllocator *)v119, (unsigned int *)v51, (uint64_t)v89, *((_DWORD *)this + 1555));
      if (v114 == v95)
      {
LABEL_98:
        v59 = &__srca[v45];
LABEL_99:
        if (v111)
        {
LABEL_100:
          v63 = v59;
          v64 = (_DWORD)__srca + v100;
          if (v59 + 32 <= &__srca[v100])
          {
            *(_QWORD *)StackAllocator::reserve((StackAllocator *)v119, 8u) = 0x52544E4357525047;
            v65 = (v101 & 1) != 0 ? (_BYTE *)StackAllocator::reserve((StackAllocator *)v119, 0x20u) : v121;
            v66 = v64 - (_DWORD)v63;
            v67 = (v64 - (_DWORD)v63) & 0xFFFFFFE0;
            v68 = *((_DWORD *)this + 7);
            *(_DWORD *)v65 = v124;
            v65[4] = 4;
            *((_WORD *)v65 + 3) = -1519;
            v69 = v122;
            *((_QWORD *)v65 + 1) = v123;
            *((_DWORD *)v65 + 4) = v125;
            *((_DWORD *)v65 + 5) = v69 >> 16;
            v65[24] = v68;
            v65[25] = a2;
            v65[26] = v126 & 0x3F;
            v65[5] = 7;
            __srcb = v66;
            v65[27] = (v66 >> 3) & 0xFC;
            copyMetaCounterList((StackAllocator *)v119, (unsigned int *)v65, (uint64_t)v89, *((_DWORD *)this + 1555));
            v70 = (void *)StackAllocator::reserve((StackAllocator *)v119, v67);
            if (v67 && v70 != 0)
              memcpy(v70, v63, __srcb & 0xFFFFFFE0);
          }
        }
      }
      else
      {
        v55 = (_QWORD *)StackAllocator::reserve((StackAllocator *)v119, __n);
        if ((*((_BYTE *)this + 36) & 1) == 0)
        {
          v56 = v55;
          bzero(v55, __n);
          v57 = v56;
          v58 = 0;
          v85 = v127[0];
          v59 = v105;
          while (1)
          {
            v61 = (char *)this + 24 * (v58 + *((_DWORD *)this + 1555));
            v98 = v57;
            v106 = v59;
            v96 = (unint64_t)*((unsigned int *)v61 + 22) >> 3;
            memcpy(v57, v59, v96);
            if (*((_DWORD *)v61 + 20) >= *(_DWORD *)(*((_QWORD *)this + 1) + 676))
            {
              v62 = *((_QWORD *)this + 794);
              if (v113 && (*(_BYTE *)(*((_QWORD *)v61 + 9) + 48) & 1) != 0)
              {
                if ((v103 & 4) == 0)
                {
                  if (v85)
                  {
                    *(_QWORD *)&buf[8 * v58] = *v98;
                    *v98 = 0;
                  }
                  else
                  {
                    *v98 += *(_QWORD *)(v62 + v91 + 8 * v58);
                    *(_QWORD *)&buf[8 * v58] = 0;
                  }
                  goto LABEL_86;
                }
                if (v85)
                {
                  *(_QWORD *)&buf[8 * v58] = *(_QWORD *)(v62 + v91 + 8 * v58);
                  *v98 = 0;
                  goto LABEL_86;
                }
              }
              else if ((v103 & 4) == 0)
              {
                goto LABEL_86;
              }
              v60 = *v98;
              *(_QWORD *)&buf[8 * v58] = *v98;
              *v98 = v60 - *(_QWORD *)(v62 + v91 + 8 * v58);
            }
LABEL_86:
            v59 = &v106[v96 & 0x1FFFFFFE];
            v57 = v98 + 1;
            if (v99 == ++v58)
              goto LABEL_99;
          }
        }
        memcpy(v55, v105, __n);
        v59 = &v105[2 * (__n >> 1)];
        if (v111)
          goto LABEL_100;
      }
    }
    v72 = (char *)v119[3];
    if (v119[3] > v86)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Insufficient free space in the final destination buffer!\n", "AGXGPURawCounterImpl.mm", 1767, "postProcessData");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v127 = 136315650;
        v128 = "AGXGPURawCounterImpl.mm";
        v129 = 1024;
        v130 = 1767;
        v131 = 2080;
        v132 = "postProcessData";
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient free space in the final destination buffer!\n", v127, 0x1Cu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v127 = 136315650;
        v128 = "AGXGPURawCounterImpl.mm";
        v129 = 1024;
        v130 = 1767;
        v131 = 2080;
        v132 = "postProcessData";
        v80 = MEMORY[0x24BDACB70];
        v81 = "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient free space in the final destination buffer!\n";
        v82 = 28;
LABEL_147:
        _os_log_impl(&dword_22FAF3000, v80, OS_LOG_TYPE_INFO, v81, v127, v82);
      }
      goto LABEL_148;
    }
    if ((char *)v119[3] + v115 <= (const void *)a8)
    {
      v75 = &a7[v115];
      v73 = (char *)v119[1];
      v74 = (char *)v119[3];
    }
    else
    {
      __srcc = (char *)v119[1];
      memcpy(&a7[v115], v119[1], a8 - v115);
      v73 = &__srcc[a8 - v115];
      v74 = &v72[-(a8 - v115)];
      v75 = a7;
    }
    memcpy(v75, v73, (size_t)v74);
    *(_QWORD *)(*((_QWORD *)this + 792) + 8 * a2) = v123;
    if ((v122 & 0xF) == 5)
      goto LABEL_121;
    *(_QWORD *)(*((_QWORD *)this + 793) + 8 * a2) = v118;
    if ((v103 & 4) != 0)
    {
      if (v114 == v95)
      {
LABEL_121:
        v76 = v120;
        if (v120)
        {
          v77 = v137;
          do
          {
            v78 = *((_QWORD *)this + 795) + 24 * (v77[17] + *(_DWORD *)(*((_QWORD *)this + 787) + 40) * a2);
            *(_OWORD *)v78 = *(_OWORD *)v77;
            *(_QWORD *)(v78 + 16) = *((_QWORD *)v77 + 2);
            v77 += 24;
            --v76;
          }
          while (v76);
        }
        v115 = ((unint64_t)v119[3] + v115) % a8;
        goto LABEL_125;
      }
    }
    else if ((v93 & 1) == 0)
    {
      goto LABEL_121;
    }
    memcpy((void *)(*((_QWORD *)this + 794) + 8 * v94), buf, v92);
    goto LABEL_121;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Potential intermediate buffer overflow! (bufferSize=%llu processedPayloadSizeMax=%llu)\n", "AGXGPURawCounterImpl.mm", 1561, "postProcessData", v119[2], v43);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v127 = 136316162;
    v128 = "AGXGPURawCounterImpl.mm";
    v129 = 1024;
    v130 = 1561;
    v131 = 2080;
    v132 = "postProcessData";
    v133 = 2048;
    v134 = v119[2];
    v135 = 2048;
    v136 = v43;
    _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Potential intermediate buffer overflow! (bufferSize=%llu processedPayloadSizeMax=%llu)\n", v127, 0x30u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v127 = 136316162;
    v128 = "AGXGPURawCounterImpl.mm";
    v129 = 1024;
    v130 = 1561;
    v131 = 2080;
    v132 = "postProcessData";
    v133 = 2048;
    v134 = v119[2];
    v135 = 2048;
    v136 = v43;
    v80 = MEMORY[0x24BDACB70];
    v81 = "AGXGRC:AGXGRC:%s:%d:%s: *** Potential intermediate buffer overflow! (bufferSize=%llu processedPayloadSizeMax=%llu)\n";
    v82 = 48;
    goto LABEL_147;
  }
LABEL_148:
  v15 = 0;
LABEL_149:
  v29 = a10;
  v30 = v115;
  v31 = v87;
LABEL_128:
  *a5 = v31;
  *v29 = v30;
  if (LOBYTE(v119[0]))
    free((void *)v119[1]);
  if (__dst)
    operator delete(__dst);
  return v15;
}

void sub_22FAFB5EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,uint64_t a44,uint64_t a45,char a46,void *a47)
{
  if (a46)
  {
    free(a47);
    if (!__p)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if (!__p)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void AGXGPURawCounterImpl::SourceImpl::postProcessReset(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  uint64_t v2;
  void (*v3)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int32 *v14;
  int32x4_t v15;
  int32x4_t v16;
  uint32x4_t v17;
  uint32x4_t v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  int v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 787);
  if (v2 && (v3 = *(void (**)(_QWORD))(v2 + 8)) != 0 && *(_QWORD *)(v2 + 24))
  {
    v3(*(_QWORD *)(*((_QWORD *)this + 1) + 704));
    *((_DWORD *)this + 1576) = a2;
    bzero(*((void **)this + 790), *((unsigned int *)this + 1582));
    *((_DWORD *)this + 1577) = (*(uint64_t (**)(void))(*((_QWORD *)this + 787) + 24))();
    if ((*((_BYTE *)this + 36) & 1) != 0)
    {
      LODWORD(v7) = *((_DWORD *)this + 1554);
      LODWORD(v6) = *((_DWORD *)this + 1555);
      *((_DWORD *)this + 1578) = 8 * (v7 - v6);
    }
    else
    {
      *((_DWORD *)this + 1578) = 0;
      v6 = *((unsigned int *)this + 1555);
      v7 = *((unsigned int *)this + 1554);
      if (v6 < v7)
      {
        v8 = v7 - v6;
        if ((unint64_t)(v7 - v6) >= 9)
        {
          v11 = v8 & 7;
          if ((v8 & 7) == 0)
            v11 = 8;
          v12 = v8 - v11;
          v13 = v11 + v6 - v7;
          v14 = (__int32 *)((char *)this + 24 * v6 + 136);
          v15 = 0uLL;
          v16 = 0uLL;
          do
          {
            v17.i32[0] = *(v14 - 12);
            v17.i32[1] = *(v14 - 6);
            v17.i32[2] = *v14;
            v17.i32[3] = v14[6];
            v18.i32[0] = v14[12];
            v18.i32[1] = v14[18];
            v18.i32[2] = v14[24];
            v18.i32[3] = v14[30];
            v15 = (int32x4_t)vsraq_n_u32((uint32x4_t)v15, v17, 3uLL);
            v16 = (int32x4_t)vsraq_n_u32((uint32x4_t)v16, v18, 3uLL);
            v14 += 48;
            v13 += 8;
          }
          while (v13);
          v10 = v12 + v6;
          v9 = vaddvq_s32(vaddq_s32(v16, v15));
        }
        else
        {
          v9 = 0;
          v10 = *((unsigned int *)this + 1555);
        }
        v19 = v7 - v10;
        v20 = (unsigned int *)((char *)this + 24 * v10 + 88);
        do
        {
          v21 = *v20;
          v20 += 6;
          v9 += v21 >> 3;
          --v19;
        }
        while (v19);
        *((_DWORD *)this + 1578) = v9;
        LODWORD(v7) = 1;
      }
    }
    v22 = 8 * v6;
    v23 = v22 + 8;
    *((_DWORD *)this + 1579) = v22 + 8;
    if ((*((_BYTE *)this + 6304) & 1) != 0)
      *((_DWORD *)this + 1579) = v22 + 40;
    if ((_DWORD)v7
      && (((*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 128))(this) & 1) != 0
       || *((_DWORD *)this + 1556)))
    {
      *((_DWORD *)this + 1579) += v23;
    }
    if (((*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 128))(this) & 2) != 0)
      *((_DWORD *)this + 1579) += 3 * v23 * *(_DWORD *)(*((_QWORD *)this + 787) + 40);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** chip dispatch table is not propertly set!\n", "AGXGPURawCounterImpl.mm", 1831, "postProcessReset");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "AGXGPURawCounterImpl.mm";
      v26 = 1024;
      v27 = 1831;
      v28 = 2080;
      v29 = "postProcessReset";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** chip dispatch table is not propertly set!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "AGXGPURawCounterImpl.mm";
      v26 = 1024;
      v27 = 1831;
      v28 = 2080;
      v29 = "postProcessReset";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** chip dispatch table is not propertly set!\n", buf, 0x1Cu);
    }
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::fillKernelConfigData(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(result + 6232);
  return result;
}

BOOL AGXGPURawCounterImpl::SourceImpl::ringBufferAlloc(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  int v4;
  void *v5;
  _BOOL8 result;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)this + 1572);
  if (v4 == a2)
  {
    (*(void (**)(AGXGPURawCounterImpl::SourceImpl *))(*(_QWORD *)this + 240))(this);
    if (a2)
    {
      v5 = malloc_type_malloc(8 * *((unsigned int *)this + 1572), 0x2004093837F09uLL);
      *((_QWORD *)this + 785) = v5;
      if (v5)
      {
        bzero(v5, 8 * *((unsigned int *)this + 1572));
        return 1;
      }
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Fail to allocate ring buffer for source[%u]!\n", "AGXGPURawCounterImpl.mm", 2115, "ringBufferAlloc", *((_DWORD *)this + 7));
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v15 = *((_DWORD *)this + 7);
        *(_DWORD *)buf = 136315906;
        v17 = "AGXGPURawCounterImpl.mm";
        v18 = 1024;
        v19 = 2115;
        v20 = 2080;
        v21 = "ringBufferAlloc";
        v22 = 1024;
        v23 = v15;
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to allocate ring buffer for source[%u]!\n", buf, 0x22u);
      }
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (result)
      {
        v12 = *((_DWORD *)this + 7);
        *(_DWORD *)buf = 136315906;
        v17 = "AGXGPURawCounterImpl.mm";
        v18 = 1024;
        v19 = 2115;
        v20 = 2080;
        v21 = "ringBufferAlloc";
        v22 = 1024;
        v23 = v12;
        v9 = MEMORY[0x24BDACB70];
        v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to allocate ring buffer for source[%u]!\n";
        goto LABEL_17;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Invalid ring buffer count (%u)!\n", "AGXGPURawCounterImpl.mm", 2108, "ringBufferAlloc", 0);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v17 = "AGXGPURawCounterImpl.mm";
        v18 = 1024;
        v19 = 2108;
        v20 = 2080;
        v21 = "ringBufferAlloc";
        v22 = 1024;
        v23 = 0;
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer count (%u)!\n", buf, 0x22u);
      }
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_DWORD *)buf = 136315906;
        v17 = "AGXGPURawCounterImpl.mm";
        v18 = 1024;
        v19 = 2108;
        v20 = 2080;
        v21 = "ringBufferAlloc";
        v22 = 1024;
        v23 = 0;
        v9 = MEMORY[0x24BDACB70];
        v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer count (%u)!\n";
LABEL_17:
        v11 = 34;
        goto LABEL_18;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Inconsistent ring buffer count for source[%u]. (%u != %u)\n", "AGXGPURawCounterImpl.mm", 2099, "ringBufferAlloc", *((_DWORD *)this + 7), v4, a2);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v13 = *((_DWORD *)this + 7);
      v14 = *((_DWORD *)this + 1572);
      *(_DWORD *)buf = 136316418;
      v17 = "AGXGPURawCounterImpl.mm";
      v18 = 1024;
      v19 = 2099;
      v20 = 2080;
      v21 = "ringBufferAlloc";
      v22 = 1024;
      v23 = v13;
      v24 = 1024;
      v25 = v14;
      v26 = 1024;
      v27 = a2;
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent ring buffer count for source[%u]. (%u != %u)\n", buf, 0x2Eu);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (result)
    {
      v7 = *((_DWORD *)this + 7);
      v8 = *((_DWORD *)this + 1572);
      *(_DWORD *)buf = 136316418;
      v17 = "AGXGPURawCounterImpl.mm";
      v18 = 1024;
      v19 = 2099;
      v20 = 2080;
      v21 = "ringBufferAlloc";
      v22 = 1024;
      v23 = v7;
      v24 = 1024;
      v25 = v8;
      v26 = 1024;
      v27 = a2;
      v9 = MEMORY[0x24BDACB70];
      v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent ring buffer count for source[%u]. (%u != %u)\n";
      v11 = 46;
LABEL_18:
      _os_log_impl(&dword_22FAF3000, v9, OS_LOG_TYPE_INFO, v10, buf, v11);
      return 0;
    }
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::ringBufferInit(AGXGPURawCounterImpl::SourceImpl *this, unint64_t a2, char *a3, uint64_t a4)
{
  int v4;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a4;
  v7 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, uint64_t))(*(_QWORD *)this + 224))(this, a4);
  if ((_DWORD)v7)
    v8 = v4 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = 0;
    do
    {
      v10 = operator new();
      *(_QWORD *)(*((_QWORD *)this + 785) + 8 * v9) = v10;
      *(_QWORD *)v10 = &off_24FD600B0;
      *(_QWORD *)(v10 + 8) = this;
      *(_DWORD *)(v10 + 16) = v9;
      *(_QWORD *)(v10 + 24) = a3;
      ++v9;
      a3 += 64;
    }
    while (v4 != v9);
  }
  return v7;
}

void AGXGPURawCounterImpl::SourceImpl::ringBufferFree(AGXGPURawCounterImpl::SourceImpl *this)
{
  void *v2;
  unint64_t v3;
  unint64_t i;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)*((_QWORD *)this + 785);
  if (v2)
  {
    v3 = *((unsigned int *)this + 1572);
    if ((_DWORD)v3)
    {
      for (i = 0; i < v3; ++i)
      {
        v5 = *((_QWORD *)this + 785);
        v6 = *(_QWORD *)(v5 + 8 * i);
        if (v6)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
          v5 = *((_QWORD *)this + 785);
          v3 = *((unsigned int *)this + 1572);
        }
        *(_QWORD *)(v5 + 8 * i) = 0;
      }
      v2 = (void *)*((_QWORD *)this + 785);
    }
    free(v2);
    *((_QWORD *)this + 785) = 0;
  }
}

void StackAllocator::init(StackAllocator *this, uint64_t a2)
{
  size_t v3;

  *(_BYTE *)this = 1;
  *((_DWORD *)this + 1) = 8;
  v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  *((_QWORD *)this + 2) = v3;
  *((_QWORD *)this + 3) = 0;
  malloc_type_posix_memalign((void **)this + 1, 8uLL, v3, 0x852F15E8uLL);
  bzero(*((void **)this + 1), *((_QWORD *)this + 2));
}

BOOL AGXGPURawCounterImpl::SourceImpl::generateKickTimestampSamples(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int *a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __int128 *v23;
  _BYTE *v24;
  uint64_t v25;
  __int128 v26;
  _BYTE *v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  _BYTE *v32;
  unint64_t v33;
  _OWORD *v34;
  int v35;
  int v36;
  _BOOL8 result;
  uint64_t v38;
  _BYTE *v39;
  __int128 v40;
  uint64_t v41;
  _BYTE *v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  unsigned int v46;
  int v47;
  int v48;
  unsigned int v49;
  int v51;
  int v52;
  int v54;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  unsigned int v59;
  int64x2_t v60;
  int64x2_t v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  int64x2_t v69;
  int64x2_t v70;
  int64x2_t v71;
  int64x2_t *v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  unint64_t **v76;
  uint64_t v77;
  unint64_t **v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t *v81;
  unint64_t v82;
  int v83;
  unsigned int v84;
  int v85;
  int v87;
  unsigned int v88;
  int v89;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD buf[4];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[640];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v15 = a1[795];
  v16 = a1[787];
  v17 = *(unsigned int *)(v16 + 40);
  bzero(v106, 0x280uLL);
  if (a3)
  {
    v18 = a3 - *(_QWORD *)(a1[1] + 704);
    if (a4)
      goto LABEL_3;
LABEL_6:
    v19 = 0;
    v20 = *(unsigned int *)(v16 + 56);
    if (!(_DWORD)v20)
    {
LABEL_34:
      *a8 = 0;
      return 1;
    }
    goto LABEL_7;
  }
  v18 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v19 = a4 - *(_QWORD *)(a1[1] + 704);
  v20 = *(unsigned int *)(v16 + 56);
  if (!(_DWORD)v20)
    goto LABEL_34;
LABEL_7:
  v21 = 0;
  v22 = 0;
  v23 = (__int128 *)(v15 + 24 * (v17 * a2));
  v24 = (_BYTE *)(*(_QWORD *)(v16 + 48) + 2);
  do
  {
    v27 = &v106[80 * (v21 >> 1)];
    v28 = *((_DWORD *)v27 + 18);
    if (v28 >= 2)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Unexpected number of kickslot data to be added to the queue!\n", "AGXGPURawCounterImpl.mm", 2252, "generateKickTimestampSamples");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 136315650;
        *(_QWORD *)((char *)buf + 4) = "AGXGPURawCounterImpl.mm";
        WORD2(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 6) = 2252;
        WORD1(buf[2]) = 2080;
        *(_QWORD *)((char *)&buf[2] + 4) = "generateKickTimestampSamples";
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Unexpected number of kickslot data to be added to the queue!\n", (uint8_t *)buf, 0x1Cu);
      }
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (result)
      {
        LODWORD(buf[0]) = 136315650;
        *(_QWORD *)((char *)buf + 4) = "AGXGPURawCounterImpl.mm";
        WORD2(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 6) = 2252;
        WORD1(buf[2]) = 2080;
        *(_QWORD *)((char *)&buf[2] + 4) = "generateKickTimestampSamples";
        _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Unexpected number of kickslot data to be added to the queue!\n", (uint8_t *)buf, 0x1Cu);
        return 0;
      }
      return result;
    }
    v29 = *(_QWORD *)(a5 + 8 * *(v24 - 2));
    if (v29)
    {
      v30 = *(_QWORD *)(a5 + a6 + 8 * v21);
      v31 = v18 > v30 || v30 > v19;
      if (!v31 && *((_QWORD *)v23 + 3 * (v21 >> 1)) < v30)
      {
        *(_QWORD *)&v27[24 * v28] = v30;
        v32 = &v27[24 * v28];
        *((_QWORD *)v32 + 1) = v29;
        v32[16] = *(v24 - 1);
        v32[17] = v21 >> 1;
        v32[18] = *v24;
        *((_DWORD *)v27 + 18) = v28 + 1;
        if (v28 != 1)
          goto LABEL_9;
        v34 = v27 + 24;
        v33 = *((_QWORD *)v27 + 3);
        if (v33 < *(_QWORD *)v27)
          goto LABEL_9;
        if (v33 > *(_QWORD *)v27)
          goto LABEL_8;
        if (v27[40] != v27[16])
          goto LABEL_9;
        v35 = v27[42];
        v22 = 1;
        if ((v35 - 8) <= 5 && (v35 & 1) == 0)
        {
          v36 = v27[18];
          if ((v36 - 8) <= 5 && (v36 & 1) != 0)
          {
LABEL_8:
            v25 = *((_QWORD *)v27 + 2);
            v26 = *(_OWORD *)v27;
            *(_OWORD *)v27 = *v34;
            *((_QWORD *)v27 + 2) = *((_QWORD *)v27 + 5);
            *v34 = v26;
            *((_QWORD *)v27 + 5) = v25;
LABEL_9:
            v22 = 1;
          }
        }
      }
    }
    ++v21;
    v24 += 3;
  }
  while (v20 != v21);
  if ((v22 & 1) == 0)
    goto LABEL_34;
  if (!(_DWORD)v17)
  {
    v59 = 0;
    goto LABEL_94;
  }
  v38 = 0;
  while (2)
  {
    v42 = &v106[v38];
    v43 = *(_DWORD *)&v106[v38 + 72];
    if (v43)
    {
      v44 = v43 - 1;
      if (!*(_QWORD *)v23)
      {
        v52 = v106[24 * v44 + 18 + v38];
        v49 = v52 - 8;
        v51 = v52 & 1;
        goto LABEL_45;
      }
      v45 = *((unsigned __int8 *)v23 + 18);
      v46 = v45 - 8;
      v47 = v45 & 1;
      v48 = v106[24 * v44 + 18 + v38];
      v49 = v48 - 8;
      if (v46 <= 5 && v47 == 0)
      {
        v54 = v48 & 1;
        if (v49 <= 5 && v54 == 0)
        {
          v39 = &v106[24 * v43 + v38];
          *((_DWORD *)v42 + 18) = v43 + 1;
          v40 = *v23;
          v41 = *((_QWORD *)v23 + 2);
          *((_QWORD *)v39 + 2) = v41;
          *(_OWORD *)v39 = v40;
          v39[18] = BYTE2(v41) + 1;
          *(_QWORD *)v39 = *(_QWORD *)&v106[24 * v44 + v38] - 1;
        }
        else
        {
          v56 = *((_QWORD *)v23 + 1);
          v57 = &v106[24 * v44 + v38];
          if (v56 != *((_QWORD *)v57 + 1))
            *((_QWORD *)v57 + 1) = v56;
        }
      }
      else
      {
        v51 = v48 & 1;
LABEL_45:
        if (v49 <= 5 && v51 != 0)
          *((_DWORD *)v42 + 18) = v44;
      }
    }
    v38 += 80;
    v23 = (__int128 *)((char *)v23 + 24);
    if (80 * v17 != v38)
      continue;
    break;
  }
  v58 = 0;
  v59 = 0;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  memset(buf, 0, sizeof(buf));
  v60 = vdupq_n_s64(0x30uLL);
  v61 = vdupq_n_s64(4uLL);
  v62 = v106;
  while (2)
  {
    v63 = *(unsigned int *)&v106[80 * v58 + 72];
    if ((_DWORD)v63)
    {
      if (v63 <= 9 || __CFADD__(v59, v63 - 1))
      {
        v66 = 0;
        goto LABEL_63;
      }
      v66 = v63 & 0xFFFFFFFC;
      v67 = v59;
      v68 = v66;
      v69 = (int64x2_t)xmmword_22FB058E0;
      do
      {
        v70.i64[0] = 24 * v69.i64[0];
        v70.i64[1] = 24 * v69.i64[1];
        v71 = vaddq_s64(vdupq_n_s64((unint64_t)&v106[80 * v58]), v70);
        v72 = (int64x2_t *)&buf[v67];
        *v72 = v71;
        v72[1] = vaddq_s64(v71, v60);
        v69 = vaddq_s64(v69, v61);
        v67 += 4;
        v68 -= 4;
      }
      while (v68);
      v59 += v66;
      if (v66 != v63)
      {
LABEL_63:
        v64 = v63 - v66;
        v65 = &v62[24 * v66];
        do
        {
          buf[v59++] = v65;
          v65 += 24;
          --v64;
        }
        while (v64);
      }
    }
    ++v58;
    v62 += 80;
    if (v58 != v17)
      continue;
    break;
  }
  if (v59)
  {
    v73 = 0;
    v74 = v59;
    v75 = v59 - 1;
    v76 = (unint64_t **)&buf[1];
    do
    {
      v77 = v73 + 1;
      if (v73 + 1 < (unint64_t)v59)
      {
        v78 = v76;
        v79 = v75;
        do
        {
          v80 = buf[v73];
          v81 = *v78;
          v82 = **v78;
          if (*(_QWORD *)v80 >= v82)
          {
            if (*(_QWORD *)v80 > v82)
              goto LABEL_74;
            if (*(unsigned __int8 *)(v80 + 16) == *((unsigned __int8 *)v81 + 16))
            {
              v83 = *(unsigned __int8 *)(v80 + 18);
              v84 = v83 - 8;
              v85 = v83 & 1;
              if (v84 <= 5 && v85 == 0)
              {
                v87 = *((unsigned __int8 *)v81 + 18);
                v88 = v87 - 8;
                v89 = v87 & 1;
                if (v88 <= 5 && v89 != 0)
                {
LABEL_74:
                  buf[v73] = v81;
                  *v78 = (unint64_t *)v80;
                }
              }
            }
          }
          ++v78;
          --v79;
        }
        while (v79);
      }
      --v75;
      ++v76;
      ++v73;
    }
    while (v77 != v59);
    v91 = buf;
    do
    {
      v92 = *v91++;
      v93 = *(_QWORD *)(v92 + 16);
      *(_OWORD *)a7 = *(_OWORD *)v92;
      *(_QWORD *)(a7 + 16) = v93;
      a7 += 24;
      --v74;
    }
    while (v74);
  }
LABEL_94:
  *a8 = v59;
  return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::emitKickTimestampSamples(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unint64_t a5, unint64_t *a6)
{
  unint64_t v6;
  uint64_t v8;
  NSObject *v9;
  unint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v35;
  uint64_t v36;
  unint64_t v37;
  unsigned __int8 *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return 0;
  v6 = a5;
  v8 = 0;
  v37 = a2;
  v40 = a4;
  v36 = a1 + 72;
  v9 = MEMORY[0x24BDACB70];
  v35 = (int)a6;
  v10 = a6;
  v39 = a3;
  do
  {
    v11 = a3 + 24 * v8;
    v14 = *(_QWORD *)(v11 + 8);
    v13 = (unsigned int *)(v11 + 8);
    v12 = v14;
    if (v14)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 704) + *(_QWORD *)(a3 + 24 * v8);
      if (v15 <= v6)
      {
        *v10++ = 0x52544E4357525047;
        v24 = *(unsigned int *)(a1 + 6220);
        if ((_DWORD)v24)
        {
          v25 = 0;
          v26 = a3 + 24 * v8;
          v38 = (unsigned __int8 *)(v26 + 16);
          v27 = (unsigned __int8 *)(v26 + 18);
          v28 = v36;
          do
          {
            switch(*(_QWORD *)(*(_QWORD *)v28 + 32))
            {
              case 0:
                *v10 = 0;
                break;
              case 1:
                *v10 = v15;
                break;
              case 2:
                *v10 = *v27;
                break;
              case 3:
                *v10 = v13[1];
                break;
              case 4:
                *v10 = *v13;
                break;
              case 5:
                *v10 = *v38;
                break;
              case 6:
                *v10 = *(unsigned int *)(a1 + 28);
                break;
              case 7:
                *v10 = v37;
                break;
              default:
                fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", "AGXGPURawCounterImpl.mm", 2537, "emitKickTimestampSamples");
                v29 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v43 = "AGXGPURawCounterImpl.mm";
                  v44 = 1024;
                  v45 = 2537;
                  v46 = 2080;
                  v47 = "emitKickTimestampSamples";
                  _os_log_error_impl(&dword_22FAF3000, v29, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
                }
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v43 = "AGXGPURawCounterImpl.mm";
                  v44 = 1024;
                  v45 = 2537;
                  v46 = 2080;
                  v47 = "emitKickTimestampSamples";
                  _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
                }
                *v10 = 0;
                v24 = *(unsigned int *)(a1 + 6220);
                break;
            }
            ++v25;
            ++v10;
            v28 += 24;
          }
          while (v25 < v24);
        }
      }
      else
      {
        v16 = a3 + 24 * v8;
        v18 = *(unsigned __int8 *)(v16 + 18);
        v17 = (unsigned __int8 *)(v16 + 18);
        v19 = v17 - 2;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** kick_timestamp > rde_sample_timestamp, [%u] timestampMax=%16llx timestamp=%16llx type=%2u encoderId=%8x traceId=%8x slotIdx=%2u\n\n", "AGXGPURawCounterImpl.mm", 2494, "emitKickTimestampSamples", v8, v6, v15, v18, HIDWORD(v12), v12, *(v17 - 2));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v30 = *v17;
          v31 = *(_QWORD *)v13;
          v32 = HIDWORD(*(_QWORD *)v13);
          v33 = *v19;
          *(_DWORD *)buf = 136317442;
          v43 = "AGXGPURawCounterImpl.mm";
          v44 = 1024;
          v45 = 2494;
          v46 = 2080;
          v47 = "emitKickTimestampSamples";
          v48 = 1024;
          v49 = v8;
          v50 = 2048;
          v51 = v6;
          v52 = 2048;
          v53 = v15;
          v54 = 1024;
          v55 = v30;
          v56 = 1024;
          v57 = v32;
          v58 = 1024;
          v59 = v31;
          v60 = 1024;
          v61 = v33;
          _os_log_error_impl(&dword_22FAF3000, v9, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** kick_timestamp > rde_sample_timestamp, [%u] timestampMax=%16llx timestamp=%16llx type=%2u encoderId=%8x traceId=%8x slotIdx=%2u\n\n", buf, 0x4Eu);
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v20 = *v17;
          v21 = *(_QWORD *)v13;
          v22 = HIDWORD(*(_QWORD *)v13);
          v23 = *v19;
          *(_DWORD *)buf = 136317442;
          v43 = "AGXGPURawCounterImpl.mm";
          v44 = 1024;
          v45 = 2494;
          v46 = 2080;
          v47 = "emitKickTimestampSamples";
          v48 = 1024;
          v49 = v8;
          v50 = 2048;
          v51 = v6;
          v52 = 2048;
          v53 = v15;
          v54 = 1024;
          v55 = v20;
          v56 = 1024;
          v57 = v22;
          v58 = 1024;
          v59 = v21;
          v60 = 1024;
          v61 = v23;
          _os_log_impl(&dword_22FAF3000, v9, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** kick_timestamp > rde_sample_timestamp, [%u] timestampMax=%16llx timestamp=%16llx type=%2u encoderId=%8x traceId=%8x slotIdx=%2u\n\n", buf, 0x4Eu);
        }
      }
    }
    ++v8;
    v6 = a5;
    v9 = MEMORY[0x24BDACB70];
    a3 = v39;
  }
  while (v8 != v40);
  return ((_DWORD)v10 - v35);
}

uint64_t StackAllocator::reserve(StackAllocator *this, unsigned int a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = *((_QWORD *)this + 2);
  v3 = *((_QWORD *)this + 3);
  if (v3 + (unint64_t)a2 <= v4)
  {
    result = *((_QWORD *)this + 1) + v3;
    *((_QWORD *)this + 3) = ((a2 + (unint64_t)*((unsigned int *)this + 1) - 1) & -(uint64_t)*((unsigned int *)this
                                                                                                  + 1))
                          + v3;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Error, reserving more than available memory! (%u > %llu)\n", "AGXGPURawCounterImpl.mm", 223, "reserve", a2, v4);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v8 = *((_QWORD *)this + 2);
      *(_DWORD *)buf = 136316162;
      v10 = "AGXGPURawCounterImpl.mm";
      v11 = 1024;
      v12 = 223;
      v13 = 2080;
      v14 = "reserve";
      v15 = 1024;
      v16 = a2;
      v17 = 2048;
      v18 = v8;
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, reserving more than available memory! (%u > %llu)\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v6 = *((_QWORD *)this + 2);
      *(_DWORD *)buf = 136316162;
      v10 = "AGXGPURawCounterImpl.mm";
      v11 = 1024;
      v12 = 223;
      v13 = 2080;
      v14 = "reserve";
      v15 = 1024;
      v16 = a2;
      v17 = 2048;
      v18 = v6;
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, reserving more than available memory! (%u > %llu)\n", buf, 0x2Cu);
    }
    return 0;
  }
  return result;
}

uint64_t generateSampleType(uint64_t *a1, BOOL *a2)
{
  uint64_t v2;

  v2 = *a1;
  if ((~*(_DWORD *)a1 & 0xC000) != 0)
  {
    if ((v2 & 0xF) - 1 > 1)
    {
      return 14;
    }
    else
    {
      *a2 = (*a1 & 0xF) == 1;
      return (((*(_DWORD *)a1 >> 13) & 6) + (*(_BYTE *)a1 & 0xF) - 1);
    }
  }
  else if ((v2 & 0xF) != 0)
  {
    return 14;
  }
  else
  {
    return 6;
  }
}

void copyMetaCounterList(StackAllocator *a1, unsigned int *a2, uint64_t a3, unsigned int a4)
{
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v7 = (_QWORD *)StackAllocator::reserve(a1, 8 * a4);
    v8 = a4;
    v9 = MEMORY[0x24BDACB70];
    do
    {
      switch(*(_QWORD *)(*(_QWORD *)a3 + 32))
      {
        case 0:
          v10 = *a2;
          break;
        case 1:
          v10 = *((_QWORD *)a2 + 1);
          break;
        case 2:
          v10 = *((unsigned __int8 *)a2 + 5);
          break;
        case 3:
          v10 = a2[4];
          break;
        case 4:
          v10 = a2[5];
          break;
        case 5:
          v10 = *((unsigned __int8 *)a2 + 26);
          break;
        case 6:
          v10 = *((unsigned __int8 *)a2 + 24);
          break;
        case 7:
          v10 = *((unsigned __int8 *)a2 + 25);
          break;
        default:
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", "AGXGPURawCounterImpl.mm", 1247, "copyMetaCounterList");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v12 = "AGXGPURawCounterImpl.mm";
            v13 = 1024;
            v14 = 1247;
            v15 = 2080;
            v16 = "copyMetaCounterList";
            _os_log_error_impl(&dword_22FAF3000, v9, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v12 = "AGXGPURawCounterImpl.mm";
            v13 = 1024;
            v14 = 1247;
            v15 = 2080;
            v16 = "copyMetaCounterList";
            _os_log_impl(&dword_22FAF3000, v9, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
          }
          v10 = 0;
          break;
      }
      *v7++ = v10;
      a3 += 24;
      --v8;
    }
    while (v8);
  }
}

uint64_t perfCtrSamplerAddSourceCounter(char a1, uint64_t a2, char a3, char a4)
{
  mach_port_t v4;
  __int128 v6;
  __int128 v7;
  size_t outputStructCnt;

  v6 = 0u;
  v7 = 0u;
  LODWORD(v6) = 7;
  BYTE4(v6) = a1;
  BYTE8(v6) = *(_DWORD *)(a2 + 28);
  BYTE9(v6) = a3;
  BYTE10(v6) = a4;
  HIDWORD(v6) = *(_DWORD *)(a2 + 48);
  *(_QWORD *)&v7 = *(_QWORD *)(a2 + 32);
  v4 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
  if (!v4)
    return 5;
  outputStructCnt = 32;
  return IOConnectCallStructMethod(v4, 0x105u, &v6, 0x20uLL, &v6, &outputStructCnt);
}

uint64_t ___ZN20AGXGPURawCounterImpl10SourceImpl10addCounterEPKcjjy_block_invoke(int a1, char *__s1, const char **a3)
{
  return strcmp(__s1, *a3);
}

void AGXGPURawCounterImpl::~AGXGPURawCounterImpl(id *this)
{

}

{

  JUMPOUT(0x2348A91CCLL);
}

void *AGXGPURawCounterImpl::copyDeviceName(AGXGPURawCounterImpl *this)
{
  char *v1;
  size_t v2;
  void *v3;
  void *v4;

  v1 = (char *)this + 24;
  v2 = strlen((const char *)this + 24) + 1;
  v3 = malloc_type_malloc(v2, 0x8D25DB0DuLL);
  v4 = v3;
  if (v3)
    memcpy(v3, v1, v2);
  return v4;
}

uint64_t AGXGPURawCounterImpl::sourceList(int64x2_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t result;
  int64x2_t *v6;
  uint64_t v7;
  int64x2_t *v8;
  int32x4_t v9;
  uint64_t v10;
  int32x4_t v11;
  int64x2_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((int64x2_t *)sAGXGPURawCounterImpl != a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3683, "virtual uint32_t AGXGPURawCounterImpl::sourceList(Source **, uint32_t)");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "AGXGPURawCounterImpl.mm";
      v21 = 1024;
      v22 = 3683;
      v23 = 2080;
      v24 = "virtual uint32_t AGXGPURawCounterImpl::sourceList(Source **, uint32_t)";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "AGXGPURawCounterImpl.mm";
      v21 = 1024;
      v22 = 3683;
      v23 = 2080;
      v24 = "virtual uint32_t AGXGPURawCounterImpl::sourceList(Source **, uint32_t)";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  v4 = a1[41].u32[0];
  if (!(_DWORD)v4)
    return 0;
  if (a2)
  {
    result = 0;
    v6 = a1 + 9;
    do
    {
      if (v6->i64[0])
      {
        if (result < a3)
          *(_QWORD *)(a2 + 8 * result) = v6->i64[0];
        result = (result + 1);
      }
      v6 = (int64x2_t *)((char *)v6 + 8);
      --v4;
    }
    while (v4);
  }
  else
  {
    if (v4 >= 8)
    {
      v7 = v4 & 0xFFFFFFF8;
      v8 = a1 + 11;
      v9 = 0uLL;
      v10 = v7;
      v11 = 0uLL;
      do
      {
        v12 = v8[-2];
        v13 = v8[-1];
        v14 = *v8;
        v15 = v8[1];
        v8 += 4;
        v9 = vsubq_s32(v9, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v12), (int32x4_t)vceqzq_s64(v13))));
        v11 = vsubq_s32(v11, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v14), (int32x4_t)vceqzq_s64(v15))));
        v10 -= 8;
      }
      while (v10);
      result = vaddvq_s32(vaddq_s32(v11, v9));
      if (v7 == v4)
        return result;
    }
    else
    {
      v7 = 0;
      LODWORD(result) = 0;
    }
    v16 = v4 - v7;
    v17 = &a1[9].i64[v7];
    do
    {
      if (*v17++)
        result = (result + 1);
      else
        result = result;
      --v16;
    }
    while (v16);
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::setOptions(AGXGPURawCounterImpl *this, NSDictionary *a2)
{
  NSDictionary *v3;
  char v4;
  char v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3705, "virtual BOOL AGXGPURawCounterImpl::setOptions(NSDictionary *__strong)");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "AGXGPURawCounterImpl.mm";
      v23 = 1024;
      v24 = 3705;
      v25 = 2080;
      v26 = "virtual BOOL AGXGPURawCounterImpl::setOptions(NSDictionary *__strong)";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "AGXGPURawCounterImpl.mm";
      v23 = 1024;
      v24 = 3705;
      v25 = 2080;
      v26 = "virtual BOOL AGXGPURawCounterImpl::setOptions(NSDictionary *__strong)";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  v4 = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(_QWORD *)this + 40))(this);
  v5 = v4;
  if ((v4 & 2) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("DisableOverlap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
      v6 = 2;
    else
      v6 = 0;
    if ((v5 & 4) == 0)
      goto LABEL_11;
  }
  else
  {
    v6 = 0;
    if ((v4 & 4) == 0)
      goto LABEL_11;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("LockGPUPerfState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedShortValue");

  if (v10)
  {
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("LockGPUPerfState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shortValue");

    (*(void (**)(AGXGPURawCounterImpl *, _QWORD))(*(_QWORD *)this + 64))(this, v12 & ~(v12 >> 31));
    v6 = v6 | 4;
  }
LABEL_11:
  if ((v5 & 8) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("DisableMCH"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
      v6 = v6 | 8;
    else
      v6 = v6;
  }
  if ((v5 & 0x10) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("ReduceCDMCluster"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
      v6 = v6 | 0x10;
    else
      v6 = v6;
  }
  if ((v5 & 0x20) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("SingleVDMChannel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      v6 = v6 | 0x20;
    else
      v6 = v6;
  }
  v19 = (*(uint64_t (**)(AGXGPURawCounterImpl *, uint64_t))(*(_QWORD *)this + 48))(this, v6);

  return v19;
}

void sub_22FAFD510(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::availableFlags(AGXGPURawCounterImpl *this)
{
  unsigned int v1;
  int v2;
  _BOOL4 v3;
  int v4;

  v1 = *((_DWORD *)this + 23);
  if (v1 < 0xE)
    v2 = 0;
  else
    v2 = 32 * (*((_DWORD *)this + 24) > 1u);
  v3 = v1 > 0xA;
  if (v1 <= 0xC)
    v4 = 6;
  else
    v4 = 14;
  return v4 | (16 * v3) | v2;
}

uint64_t AGXGPURawCounterImpl::setFlags(AGXGPURawCounterImpl *this, int a2)
{
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3768, "virtual BOOL AGXGPURawCounterImpl::setFlags(uint32_t)");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v4 = "AGXGPURawCounterImpl.mm";
      v5 = 1024;
      v6 = 3768;
      v7 = 2080;
      v8 = "virtual BOOL AGXGPURawCounterImpl::setFlags(uint32_t)";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v4 = "AGXGPURawCounterImpl.mm";
      v5 = 1024;
      v6 = 3768;
      v7 = 2080;
      v8 = "virtual BOOL AGXGPURawCounterImpl::setFlags(uint32_t)";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  *((_DWORD *)this + 173) = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(_QWORD *)this + 40))(this) & a2;
  return 1;
}

uint64_t AGXGPURawCounterImpl::flags(AGXGPURawCounterImpl *this)
{
  uint8_t buf[4];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3781, "virtual uint32_t AGXGPURawCounterImpl::flags() const");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v3 = "AGXGPURawCounterImpl.mm";
      v4 = 1024;
      v5 = 3781;
      v6 = 2080;
      v7 = "virtual uint32_t AGXGPURawCounterImpl::flags() const";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v3 = "AGXGPURawCounterImpl.mm";
      v4 = 1024;
      v5 = 3781;
      v6 = 2080;
      v7 = "virtual uint32_t AGXGPURawCounterImpl::flags() const";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  return *((unsigned int *)this + 173);
}

uint64_t AGXGPURawCounterImpl::setGPUPerfState(AGXGPURawCounterImpl *this, int a2)
{
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3787, "virtual BOOL AGXGPURawCounterImpl::setGPUPerfState(uint32_t)");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v4 = "AGXGPURawCounterImpl.mm";
      v5 = 1024;
      v6 = 3787;
      v7 = 2080;
      v8 = "virtual BOOL AGXGPURawCounterImpl::setGPUPerfState(uint32_t)";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v4 = "AGXGPURawCounterImpl.mm";
      v5 = 1024;
      v6 = 3787;
      v7 = 2080;
      v8 = "virtual BOOL AGXGPURawCounterImpl::setGPUPerfState(uint32_t)";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  *((_DWORD *)this + 174) = a2;
  return 1;
}

uint64_t AGXGPURawCounterImpl::gpuPerfState(AGXGPURawCounterImpl *this)
{
  uint8_t buf[4];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3795, "virtual uint32_t AGXGPURawCounterImpl::gpuPerfState() const");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v3 = "AGXGPURawCounterImpl.mm";
      v4 = 1024;
      v5 = 3795;
      v6 = 2080;
      v7 = "virtual uint32_t AGXGPURawCounterImpl::gpuPerfState() const";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v3 = "AGXGPURawCounterImpl.mm";
      v4 = 1024;
      v5 = 3795;
      v6 = 2080;
      v7 = "virtual uint32_t AGXGPURawCounterImpl::gpuPerfState() const";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  return *((unsigned int *)this + 174);
}

uint64_t AGXGPURawCounterImpl::startSampling(AGXGPURawCounterImpl *this)
{
  unint64_t v2;
  uint64_t result;
  unint64_t v4;
  char v5;
  NSObject *v6;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  kern_return_t v12;
  int v13;
  FILE *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  __int16 v28;
  int v29;
  mach_port_t v30;
  unint64_t v31;
  unint64_t i;
  uint64_t v33;
  mach_port_t v34;
  mach_port_t v35;
  kern_return_t v36;
  mach_port_t v37;
  size_t outputStructCnt;
  _BYTE buf[34];
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3802, "virtual BOOL AGXGPURawCounterImpl::startSampling()");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3802;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "virtual BOOL AGXGPURawCounterImpl::startSampling()";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3802;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "virtual BOOL AGXGPURawCounterImpl::startSampling()";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  v2 = *((unsigned int *)this + 164);
  if (!(_DWORD)v2)
    return 0;
  if (*((_BYTE *)this + 688))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Sampling has been started! Stop sampling before starting again.\n", "AGXGPURawCounterImpl.mm", 3819, "startSampling");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3819;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "startSampling";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Sampling has been started! Stop sampling before starting again.\n", buf, 0x1Cu);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3819;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "startSampling";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Sampling has been started! Stop sampling before starting again.\n", buf, 0x1Cu);
      return 0;
    }
    return result;
  }
  v4 = 0;
  v5 = 0;
  *((_BYTE *)this + 689) = 1;
  v6 = MEMORY[0x24BDACB70];
  do
  {
    while (1)
    {
      v7 = (char *)this + 8 * v4;
      v8 = *((_QWORD *)v7 + 18);
      if (!v8)
        break;
      if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)v8 + 48))(*((_QWORD *)v7 + 18)) & 1) == 0)
      {
        v2 = *((unsigned int *)this + 164);
        break;
      }
      *(_DWORD *)(v8 + 6236) |= (*(unsigned int (**)(uint64_t))(*(_QWORD *)v8 + 128))(v8) >> 1 << 31;
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 128))(v8) & 4) != 0)
        v9 = (*(_DWORD *)(*(_QWORD *)(v8 + 8) + 96) > 1u) << 31;
      else
        v9 = 0;
      *(_DWORD *)(v8 + 6236) |= v9;
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 144))(v8);
      if (!result)
        goto LABEL_58;
      v10 = *(_QWORD *)(v8 + 6248);
      v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 144))(v8);
      *(_DWORD *)buf = 3;
      *(_DWORD *)&buf[4] = v4;
      *(_QWORD *)&buf[8] = v10;
      *(_OWORD *)&buf[16] = (unint64_t)v11;
      result = *(unsigned int *)(sAGXGPURawCounterImpl + 88);
      if (!(_DWORD)result)
        goto LABEL_58;
      outputStructCnt = 32;
      v12 = IOConnectCallStructMethod(result, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
      if (!v10 || v12)
      {
        v13 = 0;
        if (v12)
          goto LABEL_57;
      }
      else
      {
        *(_QWORD *)(v8 + 6264) = *(_QWORD *)&buf[24];
        *(_QWORD *)(v8 + 6272) = v10 + *(_QWORD *)&buf[8];
        v13 = *(_DWORD *)&buf[16];
      }
      if (v13 != (*(unsigned int (**)(uint64_t))(*(_QWORD *)v8 + 176))(v8))
      {
        v14 = (FILE *)*MEMORY[0x24BDAC8D8];
        v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 176))(v8);
        fprintf(v14, "AGXGRC:%s:%d:%s: *** Inconsistent sub-buffer count! (%u != %u)\n", "AGXGPURawCounterImpl.mm", 3876, "startSampling", v13, v15);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 176))(v8);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3876;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "startSampling";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v13;
          v40 = 1024;
          v41 = v26;
          _os_log_error_impl(&dword_22FAF3000, v6, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent sub-buffer count! (%u != %u)\n", buf, 0x28u);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 176))(v8);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3876;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "startSampling";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v13;
          v40 = 1024;
          v41 = v16;
          _os_log_impl(&dword_22FAF3000, v6, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent sub-buffer count! (%u != %u)\n", buf, 0x28u);
        }
      }
      v17 = *(_QWORD *)(v8 + 6264);
      v18 = *(_QWORD *)(v8 + 6272);
      v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 176))(v8);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v8 + 232))(v8, v17, v18, v19);
      if (!(_DWORD)result)
        goto LABEL_58;
      v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 96))(v8);
      v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 128))(v8);
      v22 = v20 & (v20 & 2 ^ 0xFFFFFFFE);
      if ((v20 & 4) != 0)
        v22 &= ~4u;
      v23 = v22 & 8;
      if ((v22 & 8) != 0)
        v22 &= ~8u;
      v24 = v22 & 0x10;
      if ((v22 & 0x10) != 0)
        v22 &= ~0x10u;
      v25 = (2 * v22) & 0x40 | v20 & 1 | (8 * (((v20 & 2) >> 1) & 1)) | ((v20 & 4 | v23) >> 1) | (2 * v24);
      if ((v22 & 0x80000000) != 0)
      {
        v25 |= 0x10u;
      }
      else if (!v25)
      {
        goto LABEL_57;
      }
      *(_OWORD *)&buf[16] = 0u;
      *(_DWORD *)buf = 5;
      *(_DWORD *)&buf[4] = v4;
      *(_DWORD *)&buf[8] = v25;
      *(_DWORD *)&buf[12] = v21 & 1 | (((v21 >> 1) & 3) << 7) | 0x40;
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 216))(v8, buf);
      result = *(unsigned int *)(sAGXGPURawCounterImpl + 88);
      if (!(_DWORD)result)
        goto LABEL_58;
      outputStructCnt = 32;
      if (IOConnectCallStructMethod(result, 0x105u, buf, 0x20uLL, buf, &outputStructCnt))
        goto LABEL_57;
      ++v4;
      v2 = *((unsigned int *)this + 164);
      v5 = 1;
      if (v4 >= v2)
        goto LABEL_45;
    }
    ++v4;
  }
  while (v4 < v2);
  if ((v5 & 1) == 0)
  {
LABEL_57:
    result = 0;
LABEL_58:
    *((_BYTE *)this + 688) = 1;
    return result;
  }
LABEL_45:
  v27 = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(_QWORD *)this + 56))(this);
  v28 = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(_QWORD *)this + 72))(this);
  if ((v27 & 2) != 0)
    v29 = 80;
  else
    v29 = 64;
  *(_DWORD *)buf = 4;
  *(_DWORD *)&buf[4] = (v27 >> 1) & 8 | (((v27 >> 5) & 1) << 9) | v29 & 0xFFFFFFDF | (v27 >> 1) & 4 | (32 * (((v27 & 4) >> 2) & 1));
  *(_WORD *)&buf[8] = v28 & ((__int16)((_WORD)v27 << 13) >> 15);
  v30 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
  if (v30)
  {
    outputStructCnt = 32;
    if (!IOConnectCallStructMethod(v30, 0x105u, buf, 0x20uLL, buf, &outputStructCnt))
    {
      *(_DWORD *)buf = 8;
      v35 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
      if (v35)
      {
        outputStructCnt = 32;
        v36 = IOConnectCallStructMethod(v35, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
        v37 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
        *(_DWORD *)buf = 11;
        memset(&buf[4], 0, 28);
        if (v37)
        {
          outputStructCnt = 32;
          IOConnectCallStructMethod(v37, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
        }
        if (!v36)
        {
          result = 1;
          goto LABEL_58;
        }
      }
    }
  }
  v31 = *((unsigned int *)this + 164);
  if ((_DWORD)v31)
  {
    for (i = 0; i < v31; ++i)
    {
      v33 = *((_QWORD *)this + i + 18);
      if (v33)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v33 + 240))(v33);
        *(_QWORD *)buf = 3;
        *(_OWORD *)&buf[16] = 0u;
        buf[4] = i;
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)&buf[16] = 0;
        v34 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
        if (v34)
        {
          outputStructCnt = 32;
          IOConnectCallStructMethod(v34, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
        }
        v31 = *((unsigned int *)this + 164);
      }
    }
  }
  return 0;
}

BOOL AGXGPURawCounterImpl::stopSampling(AGXGPURawCounterImpl *this)
{
  unint64_t v2;
  mach_port_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  mach_port_t v9;
  size_t outputStructCnt;
  _BYTE outputStruct[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3940, "virtual BOOL AGXGPURawCounterImpl::stopSampling()");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStruct = 136315650;
      *(_QWORD *)&outputStruct[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&outputStruct[12] = 1024;
      *(_DWORD *)&outputStruct[14] = 3940;
      *(_WORD *)&outputStruct[18] = 2080;
      *(_QWORD *)&outputStruct[20] = "virtual BOOL AGXGPURawCounterImpl::stopSampling()";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", outputStruct, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)outputStruct = 136315650;
      *(_QWORD *)&outputStruct[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&outputStruct[12] = 1024;
      *(_DWORD *)&outputStruct[14] = 3940;
      *(_WORD *)&outputStruct[18] = 2080;
      *(_QWORD *)&outputStruct[20] = "virtual BOOL AGXGPURawCounterImpl::stopSampling()";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", outputStruct, 0x1Cu);
    }
    abort();
  }
  v2 = *((unsigned int *)this + 164);
  if ((_DWORD)v2)
  {
    *(_OWORD *)outputStruct = xmmword_22FB05A48;
    *(_OWORD *)&outputStruct[16] = unk_22FB05A58;
    v3 = *((_DWORD *)this + 22);
    if (v3)
    {
      outputStructCnt = 32;
      IOConnectCallStructMethod(v3, 0x105u, outputStruct, 0x20uLL, outputStruct, &outputStructCnt);
      v4 = *((unsigned int *)this + 164);
      if (!(_DWORD)v4)
      {
LABEL_5:
        *((_WORD *)this + 344) = 256;
        return v2 != 0;
      }
    }
    else
    {
      v4 = v2;
    }
    v6 = 0;
    v7 = (char *)this + 144;
    do
    {
      v8 = *(_QWORD *)&v7[8 * v6];
      if (v8)
      {
        if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 144))(v8))
        {
          *(_QWORD *)outputStruct = 3;
          *(_OWORD *)&outputStruct[16] = 0u;
          outputStruct[4] = v6;
          *(_QWORD *)&outputStruct[8] = 0;
          *(_QWORD *)&outputStruct[16] = 0;
          v9 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
          if (v9)
          {
            outputStructCnt = 32;
            IOConnectCallStructMethod(v9, 0x105u, outputStruct, 0x20uLL, outputStruct, &outputStructCnt);
          }
          (*(void (**)(_QWORD))(**(_QWORD **)&v7[8 * v6] + 48))(*(_QWORD *)&v7[8 * v6]);
        }
        (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)&v7[8 * v6] + 40))(*(_QWORD *)&v7[8 * v6], 0);
        v4 = *((unsigned int *)this + 164);
      }
      ++v6;
    }
    while (v6 < v4);
    goto LABEL_5;
  }
  return v2 != 0;
}

uint64_t AGXGPURawCounterImpl::isSampling(AGXGPURawCounterImpl *this)
{
  return *((unsigned __int8 *)this + 688);
}

uint64_t AGXGPURawCounterImpl::postProcessBufferMinSize(AGXGPURawCounterImpl *this)
{
  return *((unsigned int *)this + 170);
}

uint64_t AGXGPURawCounterImpl::populateFeaturesDict(AGXGPURawCounterImpl *this, NSMutableDictionary *a2)
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = a2;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", *((_QWORD *)this + 14), CFSTR("ConstantAGX_CoreConfig"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(_QWORD *)this + 104))(this));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("ConstantAGX_PostProcessBufferSizeMin"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &unk_24FD61378, CFSTR("ConstantAGX_PostProcessBufferSizeAlignment"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &unk_24FD61378, CFSTR("ConstantAGX_PostProcessBufferAddrAlignment"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &unk_24FD61400, CFSTR("ConstantAGX_SampleTypeList"));

  return 1;
}

void sub_22FAFE724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::SourceImpl(uint64_t a1, uint64_t a2, int a3, char *__s, uint64_t a5, unsigned int a6, uint64_t a7)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  uint64x2_t v22;
  int8x16_t v23;
  unsigned int v24;
  int8x16_t v25;
  int v26;
  size_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  const void *v37;
  size_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  const void *v43;
  size_t v44;
  void *v45;
  void *v46;
  BOOL v47;
  int v48;
  int v49;
  size_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  void *v55[4];

  *(_QWORD *)a1 = &off_24FD600F0;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 28) = a3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(__s + 36);
  *(_QWORD *)(a1 + 40) = a5;
  *(_DWORD *)(a1 + 48) = a6;
  *(_QWORD *)(a1 + 6232) = 0;
  *(_DWORD *)(a1 + 6240) = 0;
  *(_QWORD *)(a1 + 6280) = 0;
  *(_QWORD *)(a1 + 6221) = 0;
  *(_QWORD *)(a1 + 6216) = 0;
  *(_QWORD *)(a1 + 6256) = 0;
  *(_QWORD *)(a1 + 6264) = 0;
  *(_QWORD *)(a1 + 6248) = 0;
  *(_DWORD *)(a1 + 6288) = *((_DWORD *)__s + 8);
  *(_QWORD *)(a1 + 6296) = a7;
  *(_DWORD *)(a1 + 6328) = 0;
  *(_QWORD *)(a1 + 6312) = 0;
  *(_QWORD *)(a1 + 6320) = 0;
  *(_QWORD *)(a1 + 6304) = 0;
  *(_OWORD *)(a1 + 6352) = 0u;
  *(_OWORD *)(a1 + 6336) = 0u;
  v55[1] = 0;
  v12 = strlen(__s);
  *(_DWORD *)(a1 + 24) = v12;
  v13 = (((v12 + 1) + 7) & 0x1FFFFFFF8) + 24 * a6;
  v14 = *(_QWORD *)(a2 + 128);
  if (a6)
  {
    if (a6 == 1)
    {
      v15 = 0;
LABEL_7:
      v20 = a6 - v15;
      v21 = (unsigned int *)(a5 + 4 * v15);
      v22 = (uint64x2_t)vdupq_n_s64(7uLL);
      v23 = (int8x16_t)vdupq_n_s64(0x1FFFFFFF8uLL);
      do
      {
        v24 = *v21++;
        v25 = vandq_s8((int8x16_t)vaddw_u32(v22, (uint32x2_t)vadd_s32(*(int32x2_t *)(v14 + 56 * v24 + 16), (int32x2_t)0x100000001)), v23);
        v13 += v25.i64[1] + v25.i64[0];
        --v20;
      }
      while (v20);
      goto LABEL_9;
    }
    v16 = 0;
    v15 = a6 & 0xFFFFFFFE;
    v17 = (unsigned int *)(a5 + 4);
    v18 = v15;
    do
    {
      v19 = v14 + 56 * *(v17 - 1);
      v13 += (((*(_DWORD *)(v19 + 20) + 1) + 7) & 0x1FFFFFFF8)
           + (((*(_DWORD *)(v19 + 16) + 1) + 7) & 0x1FFFFFFF8);
      v16 += (((*(_DWORD *)(v14 + 56 * *v17 + 20) + 1) + 7) & 0x1FFFFFFF8)
           + (((*(_DWORD *)(v14 + 56 * *v17 + 16) + 1) + 7) & 0x1FFFFFFF8);
      v17 += 2;
      v18 -= 2;
    }
    while (v18);
    v13 += v16;
    if (v15 != a6)
      goto LABEL_7;
  }
LABEL_9:
  LOBYTE(v55[0]) = 1;
  HIDWORD(v55[0]) = 8;
  v55[2] = (void *)((v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  v55[3] = 0;
  malloc_type_posix_memalign(&v55[1], 8uLL, (size_t)v55[2], 0x852F15E8uLL);
  bzero(v55[1], (size_t)v55[2]);
  v26 = *(_DWORD *)(a1 + 24);
  v27 = (v26 + 1);
  v28 = (void *)StackAllocator::reserve((StackAllocator *)v55, v26 + 1);
  v29 = v28;
  if ((_DWORD)v27 && v28)
    memcpy(v28, __s, v27);
  *(_QWORD *)(a1 + 16) = v29;
  v30 = StackAllocator::reserve((StackAllocator *)v55, 24 * *(_DWORD *)(a1 + 48));
  *(_QWORD *)(a1 + 56) = v30;
  if (*(_DWORD *)(a1 + 48))
  {
    v31 = 0;
    v32 = 0;
    do
    {
      v34 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v32);
      v35 = v14 + 56 * v34;
      v36 = *(_QWORD *)(a1 + 56);
      v37 = *(const void **)v35;
      LODWORD(v35) = *(_DWORD *)(v35 + 16);
      v38 = (v35 + 1);
      v39 = (void *)StackAllocator::reserve((StackAllocator *)v55, (int)v35 + 1);
      v40 = v39;
      if ((_DWORD)v38)
        v41 = v39 == 0;
      else
        v41 = 1;
      if (!v41)
        memcpy(v39, v37, v38);
      *(_QWORD *)(v36 + v31) = v40;
      v42 = v14 + 56 * v34;
      v43 = *(const void **)(v42 + 8);
      LODWORD(v42) = *(_DWORD *)(v42 + 20);
      v44 = (v42 + 1);
      v45 = (void *)StackAllocator::reserve((StackAllocator *)v55, (int)v42 + 1);
      v46 = v45;
      if ((_DWORD)v44)
        v47 = v45 == 0;
      else
        v47 = 1;
      if (!v47)
        memcpy(v45, v43, v44);
      v33 = v36 + v31;
      *(_QWORD *)(v33 + 8) = v46;
      *(_DWORD *)(v33 + 16) = *(_DWORD *)(v14 + 56 * v34 + 24);
      ++v32;
      v31 += 24;
    }
    while (v32 < *(unsigned int *)(a1 + 48));
    v30 = *(_QWORD *)(a1 + 56);
  }
  if (v55[1])
    v48 = LODWORD(v55[1]) + LODWORD(v55[3]);
  else
    v48 = 0;
  *(_DWORD *)(a1 + 64) = v48 - v30;
  bzero((void *)(a1 + 72), 0x1800uLL);
  LOBYTE(v55[0]) = 0;
  memset((char *)v55 + 4, 0, 28);
  v49 = *(_DWORD *)(a1 + 6288);
  v50 = ((24 * *(_DWORD *)(*(_QWORD *)(a1 + 6296) + 40) + 2064) * v49);
  *(_DWORD *)(a1 + 6328) = v50;
  v51 = (char *)malloc_type_malloc(v50, 0xFFCC36E0uLL);
  v52 = (8 * v49);
  *(_QWORD *)(a1 + 6320) = v51;
  *(_QWORD *)(a1 + 6336) = v51;
  *(_QWORD *)(a1 + 6344) = &v51[v52];
  v53 = &v51[v52 + v52];
  *(_QWORD *)(a1 + 6352) = v53;
  *(_QWORD *)(a1 + 6360) = &v53[v49 << 11];
  if (LOBYTE(v55[0]))
    free(v55[1]);
  return a1;
}

void sub_22FAFEB1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, void *a12)
{
  if (a11)
    free(a12);
  _Unwind_Resume(exception_object);
}

uint64_t AGXGPURawCounterImpl::init(AGXGPURawCounterImpl *this)
{
  uint64_t v1;
  int v2;
  int v3;
  _DWORD *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  char v8;
  mach_port_t Connect;
  mach_port_t v11;
  const __CFNumber *CFProperty;
  void *v13;
  mach_port_t v14;
  const __CFAllocator *v15;
  __CFData *Mutable;
  char v17;
  const __CFNumber *Value;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFArray *v21;
  const __CFArray *v22;
  unsigned int Count;
  uint64_t v24;
  CFIndex v25;
  const __CFNumber *ValueAtIndex;
  uint8x8_t v27;
  _DWORD *v28;
  const __CFArray *v29;
  const __CFArray *v30;
  unsigned int v31;
  void *v32;
  int v33;
  CFIndex v34;
  const __CFDictionary *v35;
  const __CFDictionary *v36;
  const __CFNumber *v37;
  const __CFString *v38;
  const __CFNumber *v39;
  const __CFNumber *v40;
  const __CFNumber *v41;
  unsigned int v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  _DWORD *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int8x8_t v54;
  NSObject *v55;
  const char *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const char *v65;
  __int32 *v66;
  int8x16_t v67;
  uint64_t v68;
  int8x16_t v69;
  __int32 *v70;
  int8x8_t v71;
  __int32 v72;
  int8x8_t v73;
  int8x8_t v74;
  int8x8_t v75;
  int8x16_t v76;
  int8x16_t v77;
  int8x16_t v78;
  uint64_t v79;
  int *v80;
  uint64_t v81;
  int v82;
  char v83;
  CFIndex v84;
  BOOL v85;
  const __CFString *v86;
  const __CFDictionary *v87;
  const __CFDictionary *v88;
  const __CFNumber *v89;
  const __CFNumber *v90;
  int v91;
  const __CFString *v92;
  unsigned int v93;
  int Length;
  int v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  _DWORD *v99;
  char *v100;
  int v101;
  uint64_t v102;
  _DWORD *v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  int64x2_t v107;
  int8x16_t v108;
  int64x2_t v109;
  int64x2_t v110;
  uint64_t v111;
  unsigned int v112;
  int v113;
  uint64_t v114;
  int *v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  int v120;
  size_t v121;
  void *v122;
  void *v123;
  BOOL v124;
  const char *v125;
  int v126;
  size_t v127;
  void *v128;
  void *v129;
  BOOL v130;
  int v132;
  int8x8_t *v133;
  CFStringRef v134;
  unsigned int v135;
  uint64_t v136;
  unsigned int v137;
  unsigned int v138;
  uint64_t v139;
  char **v140;
  _DWORD *v141;
  char *v142;
  uint64_t v143;
  _DWORD *v144;
  char *v145;
  uint64_t v146;
  _QWORD *v147;
  char *v148;
  uint64_t v149;
  int v150;
  NSObject *v151;
  const char *v152;
  NSObject *v153;
  const char *v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _DWORD *v160;
  int *v161;
  unint64_t v162;
  int v163;
  unint64_t i;
  uint64_t v165;
  void *v166;
  unint64_t v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  int *v173;
  int v174;
  uint64_t v175;
  unint64_t v176;
  char *v177;
  void **j;
  void **v179;
  uint64_t (**v180)(_DWORD *, unint64_t, char *, void *, _QWORD, _QWORD);
  _DWORD *v181;
  uint64_t v182;
  NSObject *v183;
  id v184;
  NSObject *v185;
  NSObject *v186;
  id v187;
  NSObject *v188;
  NSObject *v189;
  id v190;
  NSObject *v191;
  NSObject *v192;
  id v193;
  NSObject *v194;
  NSObject *v196;
  id v197;
  NSObject *v198;
  uint64_t v199;
  uint64_t v200;
  BOOL v201;
  char v202;
  uint64_t v203;
  uint64_t v204;
  unsigned int v205;
  const __CFArray *theArray;
  const __CFNumber *number;
  const __CFString *theString2;
  const __CFString *theString;
  CFStringRef theStringa;
  const __CFDictionary *theDict;
  uint64_t valuePtr;
  _BYTE outputStructCnt[12];
  __int16 v214;
  int v215;
  __int16 v216;
  const char *v217;
  uint8_t buf[256];
  _DWORD v219[64];
  void *v220[2];
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  _DWORD __s1[10];
  _BYTE v253[88];
  _QWORD v254[339];

  v1 = MEMORY[0x24BDAC7A8](this);
  v3 = v2;
  v4 = (_DWORD *)v1;
  v254[336] = *MEMORY[0x24BDAC8D0];
  bzero(__s1, 0xB00uLL);
  v250 = 0u;
  v251 = 0u;
  v248 = 0u;
  v249 = 0u;
  v246 = 0u;
  v247 = 0u;
  v244 = 0u;
  v245 = 0u;
  v242 = 0u;
  v243 = 0u;
  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  v236 = 0u;
  v237 = 0u;
  v234 = 0u;
  v235 = 0u;
  v232 = 0u;
  v233 = 0u;
  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v222 = 0u;
  v223 = 0u;
  *(_OWORD *)v220 = 0u;
  v221 = 0u;
  memset(v219, 0, sizeof(v219));
  v4[2] = v3;
  v5 = IOGPUDeviceCreate();
  *((_QWORD *)v4 + 2) = v5;
  if (!v5)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(_deviceRef = IOGPUDeviceCreate(_acceleratorPort)) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2699, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2699;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_deviceRef = IOGPUDeviceCreate(_acceleratorPort)) != NULL\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2699;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    v6 = MEMORY[0x24BDACB70];
    v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_deviceRef = IOGPUDeviceCreate(_acceleratorPort)) != NULL\"\n";
LABEL_11:
    _os_log_impl(&dword_22FAF3000, v6, OS_LOG_TYPE_INFO, v7, buf, 0x1Cu);
    goto LABEL_12;
  }
  if (IOGPUDeviceGetName())
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"IOGPUDeviceGetName(_deviceRef, _deviceName, sizeof(_deviceName)) == kIOReturnSuccess\"\n", "AGXGPURawCounterImpl.mm", 2702, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2702;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"IOGPUDeviceGetName(_deviceRef, _deviceName, sizeof(_deviceName)) == kIOReturnSuccess\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2702;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    v6 = MEMORY[0x24BDACB70];
    v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"IOGPUDeviceGetName(_deviceRef, _deviceName, sizeof(_deviceName)) == kIOReturnSuccess\"\n";
    goto LABEL_11;
  }
  Connect = IOGPUDeviceGetConnect();
  v4[22] = Connect;
  if (!Connect)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(_sharedConnection = IOGPUDeviceGetConnect(_deviceRef)) != 0\"\n", "AGXGPURawCounterImpl.mm", 2705, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2705;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sharedConnection = IOGPUDeviceGetConnect(_deviceRef)) != 0\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2705;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    v6 = MEMORY[0x24BDACB70];
    v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sharedConnection = IOGPUDeviceGetConnect(_deviceRef)) != 0\"\n";
    goto LABEL_11;
  }
  v11 = Connect;
  *(_QWORD *)outputStructCnt = 32;
  memset(buf, 0, 32);
  buf[4] = 1;
  if (IOConnectCallStructMethod(Connect, 0x105u, buf, 0x20uLL, buf, (size_t *)outputStructCnt))
  {
    memset(&buf[4], 0, 28);
    *(_DWORD *)buf = 11;
    IOConnectCallStructMethod(v11, 0x105u, buf, *(size_t *)outputStructCnt, buf, (size_t *)outputStructCnt);
    goto LABEL_12;
  }
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4[2], CFSTR("AbsTimeOffset"), 0, 0);
  v13 = CFProperty;
  if (!CFProperty || !CFNumberGetValue(CFProperty, kCFNumberSInt64Type, v4 + 176))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"((cfAbsTimeOffset = (CFNumberRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"AbsTimeOffset\"), NULL, 0)) != NULL) && CFNumberGetValue(cfAbsTimeOffset, kCFNumberSInt64Type, (void*)(&_samplingState.absTimeOffset))\"\n", "AGXGPURawCounterImpl.mm", 2717, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2717;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfAbsTimeOffset = (CFNumberRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"AbsTimeOffset\"), NULL, 0)) != NULL) && CFNumberGetValue(cfAbsTimeOffset, kCFNumberSInt64Type, (void*)(&_samplingState.absTimeOffset))\"\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2717;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfAbsTimeOffset = (CFNumberRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"AbsTimeOffset\"), NULL, 0)) != NULL) && CFNumberGetValue(cfAbsTimeOffset, kCFNumberSInt64Type, (void*)(&_samplingState.absTimeOffset))\"\n", buf, 0x1Cu);
    }
    if (!v13)
      goto LABEL_12;
    goto LABEL_39;
  }
  CFRelease(v13);
  v14 = v4[22];
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 4096);
  memset(buf, 0, 32);
  *(_DWORD *)buf = 12;
  *(_QWORD *)&buf[8] = CFDataGetMutableBytePtr(Mutable);
  *(_DWORD *)&buf[16] = 4096;
  if (!v14 && (v14 = *(_DWORD *)(sAGXGPURawCounterImpl + 88)) == 0
    || (*(_QWORD *)outputStructCnt = 32,
        IOConnectCallStructMethod(v14, 0x105u, buf, 0x20uLL, buf, (size_t *)outputStructCnt)))
  {
    v13 = 0;
LABEL_27:
    v17 = 1;
    goto LABEL_28;
  }
  CFDataSetLength(Mutable, *(unsigned int *)&buf[16]);
  v13 = (void *)CFPropertyListCreateWithData(v15, Mutable, 0, 0, 0);
  CFRelease(Mutable);
  if (!v13)
    goto LABEL_27;
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("num_cores"));
  if (!Value
    || !CFNumberGetValue(Value, kCFNumberSInt32Type, v4 + 25)
    || (v19 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("num_mgpus"))) == 0
    || !CFNumberGetValue(v19, kCFNumberSInt32Type, v4 + 24)
    || (v20 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("gpu_gen"))) == 0
    || !CFNumberGetValue(v20, kCFNumberSInt32Type, v4 + 23))
  {
    v17 = 0;
LABEL_28:
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"((cfCoreConfig = createInternalCoreConfigDict(_sharedConnection)) != NULL) && ((cfCoreNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"num_cores\"))) != NULL) && CFNumberGetValue(cfCoreNum, kCFNumberSInt32Type, (void*)(&_coreNum)) && ((cfMGPUNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"num_mgpus\"))) != NULL) && CFNumberGetValue(cfMGPUNum, kCFNumberSInt32Type, (void*)(&_mgpuNum)) && ((cfGPUGen = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"gpu_gen\"))) != NULL) && CFNumberGetValue(cfGPUGen, kCFNumberSInt32Type, (void*)(&_gpuGeneration))\"\n", "AGXGPURawCounterImpl.mm", 2731, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2731;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreConfig = createInternalCoreConfigDict(_sharedConnection)) != NULL) && ((cfCoreNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"num_cores\"))) != NULL) && CFNumberGetValue(cfCoreNum, kCFNumberSInt32Type, (void*)(&_coreNum)) && ((cfMGPUNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"num_mgpus\"))) != NULL) && CFNumberGetValue(cfMGPUNum, kCFNumberSInt32Type, (void*)(&_mgpuNum)) && ((cfGPUGen = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"gpu_gen\"))) != NULL) && CFNumberGetValue(cfGPUGen, kCFNumberSInt32Type, (void*)(&_gpuGeneration))\"\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2731;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreConfig = createInternalCoreConfigDict(_sharedConnection)) != NULL) && ((cfCoreNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"num_cores\"))) != NULL) && CFNumberGetValue(cfCoreNum, kCFNumberSInt32Type, (void*)(&_coreNum)) && ((cfMGPUNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"num_mgpus\"))) != NULL) && CFNumberGetValue(cfMGPUNum, kCFNumberSInt32Type, (void*)(&_mgpuNum)) && ((cfGPUGen = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, CFSTR(\"gpu_gen\"))) != NULL) && CFNumberGetValue(cfGPUGen, kCFNumberSInt32Type, (void*)(&_gpuGeneration))\"\n", buf, 0x1Cu);
    }
    if ((v17 & 1) != 0)
      goto LABEL_12;
    goto LABEL_39;
  }
  v4[26] = v4[25] / v4[24];
  v21 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("core_mask_list"));
  v22 = v21;
  if (v21)
  {
    Count = CFArrayGetCount(v21);
    *(_DWORD *)outputStructCnt = 0;
    v4[27] = 0;
    v24 = Count;
    if (Count)
    {
      v25 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v22, v25);
        if (!ValueAtIndex || !CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, outputStructCnt))
          break;
        v27 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)outputStructCnt);
        v27.i16[0] = vaddlv_u8(v27);
        v4[27] += v27.i32[0];
        if (v24 == ++v25)
          goto LABEL_56;
      }
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"((cfCoreMask = (CFNumberRef)CFArrayGetValueAtIndex(cfCoreMaskList, i)) != NULL) && CFNumberGetValue(cfCoreMask, kCFNumberSInt32Type, (void*)(&coreMask))\"\n", "AGXGPURawCounterImpl.mm", 2757, "init");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2757;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "init";
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreMask = (CFNumberRef)CFArrayGetValueAtIndex(cfCoreMaskList, i)) != NULL) && CFNumberGetValue(cfCoreMask, kCFNumberSInt32Type, (void*)(&coreMask))\"\n", buf, 0x1Cu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2757;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "init";
        _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreMask = (CFNumberRef)CFArrayGetValueAtIndex(cfCoreMaskList, i)) != NULL) && CFNumberGetValue(cfCoreMask, kCFNumberSInt32Type, (void*)(&coreMask))\"\n", buf, 0x1Cu);
      }
LABEL_39:
      CFRelease(v13);
      goto LABEL_12;
    }
  }
  else
  {
    v4[27] = v4[25];
  }
LABEL_56:
  objc_storeStrong((id *)v4 + 14, v13);
  CFRelease(v13);
  v28 = v4 + 164;
  if (perfCtrSamplerGetSourceNum(v4 + 164, v4[22]))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceNum(&_sourceNum, _sharedConnection) == KERN_SUCCESS\"\n", "AGXGPURawCounterImpl.mm", 2775, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2775;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceNum(&_sourceNum, _sharedConnection) == KERN_SUCCESS\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2775;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    v6 = MEMORY[0x24BDACB70];
    v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceNum(&_sourceNum, _sharedConnection) == KERN_SUCCESS\"\n";
    goto LABEL_11;
  }
  if (*v28 >= 0x41u)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"_sourceNum <= AGXGPURawCounterImpl::kSourceNumMax\"\n", "AGXGPURawCounterImpl.mm", 2777, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2777;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceNum <= AGXGPURawCounterImpl::kSourceNumMax\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2777;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    v6 = MEMORY[0x24BDACB70];
    v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceNum <= AGXGPURawCounterImpl::kSourceNumMax\"\n";
    goto LABEL_11;
  }
  if (!*v28)
  {
LABEL_309:
    v8 = 1;
    return v8 & 1;
  }
  v29 = (const __CFArray *)IORegistryEntryCreateCFProperty(v4[2], CFSTR("PerfCtrPartitionInfoList"), 0, 0);
  v30 = v29;
  if (!v29
    || (v31 = CFArrayGetCount(v29), (v4[168] = v31) == 0)
    || (v32 = malloc_type_malloc(44 * v31, 0x1000040D4159EFEuLL), (*((_QWORD *)v4 + 83) = v32) == 0))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"((cfPartitionInfoList = (CFArrayRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"PerfCtrPartitionInfoList\"), NULL, 0)) != NULL) && ((_partitionInfoNum = (uint32_t)CFArrayGetCount(cfPartitionInfoList)) != 0) && ((_partitionInfoList = (PartitionInfo*)malloc(sizeof(PartitionInfo) * _partitionInfoNum)) != NULL)\"\n", "AGXGPURawCounterImpl.mm", 2791, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2791;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfPartitionInfoList = (CFArrayRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"PerfCtrPartitionInfoList\"), NULL, 0)) != NULL) && ((_partitionInfoNum = (uint32_t)CFArrayGetCount(cfPartitionInfoList)) != 0) && ((_partitionInfoList = (PartitionInfo*)malloc(sizeof(PartitionInfo) * _partitionInfoNum)) != NULL)\"\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2791;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      v55 = MEMORY[0x24BDACB70];
      v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfPartitionInfoList = (CFArrayRef)IORegistryEntryCreateCFProperty(_accelerat"
            "orPort, CFSTR(\"PerfCtrPartitionInfoList\"), NULL, 0)) != NULL) && ((_partitionInfoNum = (uint32_t)CFArrayGe"
            "tCount(cfPartitionInfoList)) != 0) && ((_partitionInfoList = (PartitionInfo*)malloc(sizeof(PartitionInfo) * "
            "_partitionInfoNum)) != NULL)\"\n";
      goto LABEL_114;
    }
    goto LABEL_115;
  }
  bzero(v32, 44 * v4[168]);
  v33 = 2;
  if (v4[23] >= 0xEu)
  {
    if (v4[24] < 2u)
      v33 = 2;
    else
      v33 = 3;
  }
  v4[169] = v33;
  if (v4[168])
  {
    v34 = 0;
    while (1)
    {
      v35 = (const __CFDictionary *)CFArrayGetValueAtIndex(v30, v34);
      v36 = v35;
      if (!v35)
        break;
      v37 = (const __CFNumber *)CFDictionaryGetValue(v35, CFSTR("index"));
      v38 = (const __CFString *)CFDictionaryGetValue(v36, CFSTR("name"));
      v39 = (const __CFNumber *)CFDictionaryGetValue(v36, CFSTR("free_num"));
      v40 = (const __CFNumber *)CFDictionaryGetValue(v36, CFSTR("source_mask"));
      v41 = v40;
      *(_DWORD *)outputStructCnt = 0;
      if (!v37 && !v39 && !v40)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(cfIndex != NULL) || (cfFreeNum != NULL) || (cfSourceMask != NULL)\"\n", "AGXGPURawCounterImpl.mm", 2809, "init");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2809;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "init";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfIndex != NULL) || (cfFreeNum != NULL) || (cfSourceMask != NULL)\"\n", buf, 0x1Cu);
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          goto LABEL_115;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2809;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "init";
        v55 = MEMORY[0x24BDACB70];
        v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfIndex != NULL) || (cfFreeNum != NULL) || (cfSourceMask != NULL)\"\n";
        goto LABEL_114;
      }
      if (!CFNumberGetValue(v37, kCFNumberSInt32Type, outputStructCnt))
        goto LABEL_117;
      v42 = *(_DWORD *)outputStructCnt;
      if (*(unsigned int *)outputStructCnt >= (unint64_t)v4[168])
        goto LABEL_117;
      if (v38)
      {
        if (!CFStringGetCString(v38, (char *)(*((_QWORD *)v4 + 83) + 44 * *(unsigned int *)outputStructCnt + 4), 32, 0x8000100u))goto LABEL_117;
        v42 = *(_DWORD *)outputStructCnt;
      }
      if (!CFNumberGetValue(v39, kCFNumberSInt32Type, (void *)(*((_QWORD *)v4 + 83) + 44 * v42 + 36))
        || !CFNumberGetValue(v41, kCFNumberSInt32Type, (void *)(*((_QWORD *)v4 + 83) + 44 * *(unsigned int *)outputStructCnt + 40)))
      {
LABEL_117:
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"CFNumberGetValue (cfIndex, kCFNumberSInt32Type, &index) && (index < _partitionInfoNum) && ((cfName == NULL) || CFStringGetCString(cfName, _partitionInfoList[index].name, sizeof(_partitionInfoList[index].name), kCFStringEncodingUTF8)) && CFNumberGetValue (cfFreeNum, kCFNumberSInt32Type, &_partitionInfoList[index].availableCounterNum) && CFNumberGetValue (cfSourceMask, kCFNumberSInt32Type, &_partitionInfoList[index].sourceMask)\"\n", "AGXGPURawCounterImpl.mm", 2815, "init");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2815;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "init";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue (cfIndex, kCFNumberSInt32Type, &index) && (index < _partitionInfoNum) && ((cfName == NULL) || CFStringGetCString(cfName, _partitionInfoList[index].name, sizeof(_partitionInfoList[index].name), kCFStringEncodingUTF8)) && CFNumberGetValue (cfFreeNum, kCFNumberSInt32Type, &_partitionInfoList[index].availableCounterNum) && CFNumberGetValue (cfSourceMask, kCFNumberSInt32Type, &_partitionInfoList[index].sourceMask)\"\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2815;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "init";
          v55 = MEMORY[0x24BDACB70];
          v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue (cfIndex, kCFNumberSInt32Type, &index) && (index < _parti"
                "tionInfoNum) && ((cfName == NULL) || CFStringGetCString(cfName, _partitionInfoList[index].name, sizeof(_"
                "partitionInfoList[index].name), kCFStringEncodingUTF8)) && CFNumberGetValue (cfFreeNum, kCFNumberSInt32T"
                "ype, &_partitionInfoList[index].availableCounterNum) && CFNumberGetValue (cfSourceMask, kCFNumberSInt32T"
                "ype, &_partitionInfoList[index].sourceMask)\"\n";
          goto LABEL_114;
        }
LABEL_115:
        if (!v30)
          goto LABEL_12;
LABEL_116:
        CFRelease(v30);
        goto LABEL_12;
      }
      if (++v34 >= (unint64_t)v4[168])
        goto LABEL_84;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"info != NULL\"\n", "AGXGPURawCounterImpl.mm", 2801, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2801;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"info != NULL\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_115;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2801;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    v55 = MEMORY[0x24BDACB70];
    v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"info != NULL\"\n";
LABEL_114:
    _os_log_impl(&dword_22FAF3000, v55, OS_LOG_TYPE_INFO, v56, buf, 0x1Cu);
    goto LABEL_115;
  }
LABEL_84:
  CFRelease(v30);
  v43 = (void *)MEMORY[0x2348A92D4]();
  v44 = (const __CFString *)IORegistryEntryCreateCFProperty(v4[2], CFSTR("MetalPluginName"), 0, 0);
  v30 = (const __CFArray *)v44;
  if (!v44 || !CFStringGetCString(v44, (char *)buf, 256, 0x8000100u))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"((cfMmetalPluginName = (CFStringRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"MetalPluginName\"), NULL, 0)) != NULL) && CFStringGetCString(cfMmetalPluginName, metalPluginName, sizeof(metalPluginName), kCFStringEncodingUTF8)\"\n", "AGXGPURawCounterImpl.mm", 2835, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2835;
      v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfMmetalPluginName = (CFStringRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"MetalPluginName\"), NULL, 0)) != NULL) && CFStringGetCString(cfMmetalPluginName, metalPluginName, sizeof(metalPluginName), kCFStringEncodingUTF8)\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2835;
      v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfMmetalPluginName = (CFStringRef)IORegistryEntryCreateCFProperty(_acceleratorPort, CFSTR(\"MetalPluginName\"), NULL, 0)) != NULL) && CFStringGetCString(cfMmetalPluginName, metalPluginName, sizeof(metalPluginName), kCFStringEncodingUTF8)\"\n", outputStructCnt, 0x1Cu);
    }
    objc_autoreleasePoolPop(v43);
    if (!v30)
      goto LABEL_12;
    goto LABEL_116;
  }
  CFRelease(v30);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/AppleInternal/Library/AGX/Performance/%s/AGXMetalPerfCounters.plist"), buf);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"plistPath != nil\"\n", "AGXGPURawCounterImpl.mm", 2841, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2841;
      v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"plistPath != nil\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2841;
      v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"plistPath != nil\"\n", outputStructCnt, 0x1Cu);
    }
    goto LABEL_260;
  }
  v46 = objc_retainAutorelease(v45);
  theDict = (const __CFDictionary *)cfDictionaryCreateFromPlist((const char *)objc_msgSend(v46, "UTF8String"));
  if (theDict)
    goto LABEL_88;
  v57 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/System/Library/Extensions/%s.bundle"), buf, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bundleWithPath:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", "AGXGPURawCounterImpl.mm", 2852, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2852;
      v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2852;
      v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", outputStructCnt, 0x1Cu);
    }

    goto LABEL_260;
  }
  objc_msgSend(v59, "pathForResource:ofType:", CFSTR("AGXMetalPerfCounters"), CFSTR("plist"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_retainAutorelease(v60);
  theDict = (const __CFDictionary *)cfDictionaryCreateFromPlist((const char *)objc_msgSend(v46, "UTF8String"));

  if (theDict)
    goto LABEL_88;
  v61 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/System/Library/Extensions/%s.bundle"), buf, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bundleWithPath:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", "AGXGPURawCounterImpl.mm", 2866, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2866;
      v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", outputStructCnt, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_259;
    *(_DWORD *)outputStructCnt = 136315650;
    *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
    v214 = 1024;
    v215 = 2866;
    v216 = 2080;
    v217 = "init";
    v153 = MEMORY[0x24BDACB70];
    v154 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n";
    goto LABEL_258;
  }
  objc_msgSend(v63, "pathForResource:ofType:", CFSTR("AGXMetalPerfCountersExternal"), CFSTR("plist"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_retainAutorelease(v64);
  theDict = (const __CFDictionary *)cfDictionaryCreateFromPlist((const char *)objc_msgSend(v46, "UTF8String"));
  if (!theDict)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(cfDict = cfDictionaryCreateFromPlist([plistPath UTF8String])) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2872, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2872;
      v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfDict = cfDictionaryCreateFromPlist([plistPath UTF8String])) != NULL\"\n", outputStructCnt, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_259;
    *(_DWORD *)outputStructCnt = 136315650;
    *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
    v214 = 1024;
    v215 = 2872;
    v216 = 2080;
    v217 = "init";
    v153 = MEMORY[0x24BDACB70];
    v154 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfDict = cfDictionaryCreateFromPlist([plistPath UTF8String])) != NULL\"\n";
LABEL_258:
    _os_log_impl(&dword_22FAF3000, v153, OS_LOG_TYPE_INFO, v154, outputStructCnt, 0x1Cu);
LABEL_259:

LABEL_260:
    objc_autoreleasePoolPop(v43);
    goto LABEL_12;
  }
  *((_BYTE *)v4 + 120) = 1;

LABEL_88:
  objc_autoreleasePoolPop(v43);
  LODWORD(v47) = *v28;
  if (*v28)
  {
    v48 = 0;
    v49 = __s1;
    do
    {
      if (perfCtrSamplerGetSourceInfo(v48, (uint64_t)v49, v4[22]))
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceInfo(sourceIdx, &sourceInfo, _sharedConnection) == KERN_SUCCESS\"\n", "AGXGPURawCounterImpl.mm", 2890, "init");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2890;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "init";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceInfo(sourceIdx, &sourceInfo, _sharedConnection) == KERN_SUCCESS\"\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2890;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "init";
          _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceInfo(sourceIdx, &sourceInfo, _sharedConnection) == KERN_SUCCESS\"\n", buf, 0x1Cu);
        }
        theString2 = 0;
        goto LABEL_336;
      }
      ++v48;
      v47 = *v28;
      v49 += 11;
    }
    while (v48 < v47);
  }
  buf[0] = 0;
  memset(&buf[4], 0, 28);
  if ((_DWORD)v47 == 1)
    v50 = 1;
  else
    v50 = ~(-1 << v47) & 6;
  v199 = v50;
  if (*((_BYTE *)v4 + 120))
    v51 = "_423ccc54aeb6a01f9abb7b533d6542a7d502c505be6e14c69056cc6886c4d1b5";
  else
    v51 = "GBL_USC_PROFILE_DATA_00_USC_00";
  theString2 = CFStringCreateWithCString(v15, v51, 0x8000100u);
  if (!theString2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(cfShaderProfilerCounterName = CFStringCreateWithCString(kCFAllocatorDefault, shaderProfilerCounterName, kCFStringEncodingUTF8)) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2913, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2913;
      v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfShaderProfilerCounterName = CFStringCreateWithCString(kCFAllocatorDefault, shaderProfilerCounterName, kCFStringEncodingUTF8)) != NULL\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2913;
      v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfShaderProfilerCounterName = CFStringCreateWithCString(kCFAllocatorDefault, shaderProfilerCounterName, kCFStringEncodingUTF8)) != NULL\"\n", outputStructCnt, 0x1Cu);
    }
    theString2 = 0;
    goto LABEL_278;
  }
  v52 = *v28;
  if (!(_DWORD)v52)
  {
    v54 = 0;
    goto LABEL_168;
  }
  if (v52 > 3)
  {
    v53 = v52 & 0xFFFFFFFC;
    v66 = (__int32 *)v254;
    v67 = 0uLL;
    v68 = v53;
    v69 = 0uLL;
    do
    {
      v70 = v66 + 11;
      v71.i32[0] = *(v66 - 22);
      v71.i32[1] = *(v66 - 11);
      v72 = *v66;
      v66 += 44;
      v73.i32[0] = v72;
      v73.i32[1] = *v70;
      v74 = vbic_s8(v71, (int8x8_t)vceqz_s32((int32x2_t)vand_s8(v71, (int8x8_t)0x1F0000001FLL)));
      v75 = vbic_s8(v73, (int8x8_t)vceqz_s32((int32x2_t)vand_s8(v73, (int8x8_t)0x1F0000001FLL)));
      v76.i64[0] = v74.u32[0];
      v76.i64[1] = v74.u32[1];
      v77 = v76;
      v76.i64[0] = v75.u32[0];
      v76.i64[1] = v75.u32[1];
      v67 = vorrq_s8(v67, v77);
      v69 = vorrq_s8(v69, v76);
      v68 -= 4;
    }
    while (v68);
    v78 = vorrq_s8(v69, v67);
    v54 = vorr_s8(*(int8x8_t *)v78.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v78, v78, 8uLL));
    if (v53 == v52)
      goto LABEL_168;
  }
  else
  {
    v53 = 0;
    v54 = 0;
  }
  v79 = v52 - v53;
  v80 = &__s1[11 * v53 + 10];
  do
  {
    v82 = *v80;
    v80 += 11;
    LODWORD(v81) = v82;
    if ((v82 & 0x1F) != 0)
      v81 = v81;
    else
      v81 = 0;
    *(_QWORD *)&v54 |= v81;
    --v79;
  }
  while (v79);
LABEL_168:
  *(_DWORD *)&buf[4] = 8;
  *(_QWORD *)&buf[16] = 0;
  theArray = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("DeviceCounters"));
  if (theArray && (v203 = CFArrayGetCount(theArray)) != 0)
  {
    v200 = 0;
    v201 = 0;
    v83 = 1;
    while (2)
    {
      v84 = 0;
      v205 = 0;
      v202 = v83;
      do
      {
        v86 = (const __CFString *)CFArrayGetValueAtIndex(theArray, v84);
        if (v86 && (v87 = (const __CFDictionary *)CFDictionaryGetValue(theDict, v86), (v88 = v87) != 0))
        {
          v89 = (const __CFNumber *)CFDictionaryGetValue(v87, CFSTR("Partition"));
          number = (const __CFNumber *)CFDictionaryGetValue(v88, CFSTR("Select"));
          theString = &stru_24FD60E18;
          if (!*((_BYTE *)v4 + 120))
            theString = (const __CFString *)CFDictionaryGetValue(v88, CFSTR("Description"));
          v90 = (const __CFNumber *)CFDictionaryGetValue(v88, CFSTR("Flag"));
          v91 = 1;
        }
        else
        {
          v89 = 0;
          v91 = 0;
          number = 0;
          v90 = 0;
          v92 = &stru_24FD60E18;
          if (!*((_BYTE *)v4 + 120))
            v92 = 0;
          theString = v92;
        }
        valuePtr = 0;
        if (!v91 || !v89 || !number || !theString)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(cfPerfCtrInfo != NULL) && (cfPerfCtrPartition != NULL) && (cfPerfCtrSelect != NULL) && (cfPerfCtrDesc != NULL)\"\n", "AGXGPURawCounterImpl.mm", 2957, "init");
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)outputStructCnt = 136315650;
            *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            v214 = 1024;
            v215 = 2957;
            v216 = 2080;
            v217 = "init";
            _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrInfo != NULL) && (cfPerfCtrPartition != NULL) && (cfPerfCtrSelect != NULL) && (cfPerfCtrDesc != NULL)\"\n", outputStructCnt, 0x1Cu);
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)outputStructCnt = 136315650;
            *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            v214 = 1024;
            v215 = 2957;
            v216 = 2080;
            v217 = "init";
            v151 = MEMORY[0x24BDACB70];
            v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrInfo != NULL) && (cfPerfCtrPartition != NULL) && (cfPerfCtrSe"
                   "lect != NULL) && (cfPerfCtrDesc != NULL)\"\n";
            goto LABEL_277;
          }
          goto LABEL_278;
        }
        if (!CFNumberGetValue(v89, kCFNumberSInt32Type, (char *)&valuePtr + 4)
          || (v93 = HIDWORD(valuePtr), HIDWORD(valuePtr) >= (unint64_t)v4[168]))
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"CFNumberGetValue(cfPerfCtrPartition, kCFNumberSInt32Type, &perfCtrPartition) && (perfCtrPartition < _partitionInfoNum)\"\n", "AGXGPURawCounterImpl.mm", 2958, "init");
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)outputStructCnt = 136315650;
            *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            v214 = 1024;
            v215 = 2958;
            v216 = 2080;
            v217 = "init";
            _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue(cfPerfCtrPartition, kCFNumberSInt32Type, &perfCtrPartition) && (perfCtrPartition < _partitionInfoNum)\"\n", outputStructCnt, 0x1Cu);
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)outputStructCnt = 136315650;
            *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            v214 = 1024;
            v215 = 2958;
            v216 = 2080;
            v217 = "init";
            v151 = MEMORY[0x24BDACB70];
            v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue(cfPerfCtrPartition, kCFNumberSInt32Type, &perfCtrParti"
                   "tion) && (perfCtrPartition < _partitionInfoNum)\"\n";
            goto LABEL_277;
          }
          goto LABEL_278;
        }
        if (v90)
        {
          if (!CFNumberGetValue(v90, kCFNumberSInt32Type, &valuePtr))
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(cfPerfCtrFlag == NULL) || CFNumberGetValue(cfPerfCtrFlag, kCFNumberSInt32Type, &perfCtrFlag)\"\n", "AGXGPURawCounterImpl.mm", 2959, "init");
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)outputStructCnt = 136315650;
              *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
              v214 = 1024;
              v215 = 2959;
              v216 = 2080;
              v217 = "init";
              _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrFlag == NULL) || CFNumberGetValue(cfPerfCtrFlag, kCFNumberSInt32Type, &perfCtrFlag)\"\n", outputStructCnt, 0x1Cu);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)outputStructCnt = 136315650;
              *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
              v214 = 1024;
              v215 = 2959;
              v216 = 2080;
              v217 = "init";
              v151 = MEMORY[0x24BDACB70];
              v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrFlag == NULL) || CFNumberGetValue(cfPerfCtrFlag, kCFNumberS"
                     "Int32Type, &perfCtrFlag)\"\n";
              goto LABEL_277;
            }
            goto LABEL_278;
          }
          v93 = HIDWORD(valuePtr);
        }
        v204 = *(unsigned int *)(*((_QWORD *)v4 + 83) + 44 * v93 + 40);
        if ((_DWORD)v204)
        {
          if ((v202 & 1) != 0)
          {
            Length = CFStringGetLength(v86);
            *(_QWORD *)&buf[16] += ((Length + 1) + (unint64_t)*(unsigned int *)&buf[4] - 1) & -(uint64_t)*(unsigned int *)&buf[4];
            v95 = CFStringGetLength(theString);
            *(_QWORD *)&buf[16] += ((v95 + 1) + (unint64_t)*(unsigned int *)&buf[4] - 1) & -(uint64_t)*(unsigned int *)&buf[4];
            v200 |= v204;
            v85 = v201 || CFStringCompare(v86, theString2, 0) == kCFCompareEqualTo;
            v201 = v85;
          }
          else
          {
            v96 = *((_QWORD *)v4 + 16);
            v97 = CFStringGetLength(v86);
            v98 = v96 + 56 * v205;
            *(_DWORD *)(v98 + 16) = v97;
            v99 = (_DWORD *)(v98 + 16);
            v100 = (char *)StackAllocator::reserve((StackAllocator *)buf, v97 + 1);
            *(_QWORD *)(v96 + 56 * v205) = v100;
            if (!v100)
            {
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(counterDesc.name = (char*)(allocator.reserve(counterDesc.nameLen + 1))) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2994, "init");
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 2994;
                v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name = (char*)(allocator.reserve(counterDesc.nameLen + 1))) != NULL\"\n", outputStructCnt, 0x1Cu);
              }
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 2994;
                v216 = 2080;
                v217 = "init";
                v151 = MEMORY[0x24BDACB70];
                v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name = (char*)(allocator.reserve(counterDesc.nameLen +"
                       " 1))) != NULL\"\n";
                goto LABEL_277;
              }
              goto LABEL_278;
            }
            CFStringGetCString(v86, v100, (*v99 + 1), 0x8000100u);
            v101 = CFStringGetLength(theString);
            v102 = v96 + 56 * v205;
            *(_DWORD *)(v102 + 20) = v101;
            v103 = (_DWORD *)(v102 + 20);
            v104 = (char *)StackAllocator::reserve((StackAllocator *)buf, v101 + 1);
            *(_QWORD *)(v103 - 3) = v104;
            if (!v104)
            {
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(counterDesc.description = (char*)(allocator.reserve(counterDesc.descriptionLen + 1))) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2999, "init");
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 2999;
                v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.description = (char*)(allocator.reserve(counterDesc.descriptionLen + 1))) != NULL\"\n", outputStructCnt, 0x1Cu);
              }
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 2999;
                v216 = 2080;
                v217 = "init";
                v151 = MEMORY[0x24BDACB70];
                v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.description = (char*)(allocator.reserve(counterDesc.de"
                       "scriptionLen + 1))) != NULL\"\n";
                goto LABEL_277;
              }
              goto LABEL_278;
            }
            CFStringGetCString(theString, v104, (*v103 + 1), 0x8000100u);
            CFNumberGetValue(v89, kCFNumberSInt64Type, (void *)(v96 + 56 * v205 + 28));
            CFNumberGetValue(number, kCFNumberSInt64Type, (void *)(v96 + 56 * v205 + 32));
            v105 = v96 + 56 * v205;
            *(_QWORD *)(v105 + 40) = v204;
            *(_DWORD *)(v105 + 24) = *(_DWORD *)(v105 + 28) >= v4[169];
            *(_DWORD *)(v105 + 48) = valuePtr;
          }
          ++v205;
        }
        ++v84;
      }
      while (v203 != v84);
      if ((v202 & 1) == 0)
      {
        theStringa = 0;
        v115 = &dword_24FD60238;
        while (1)
        {
          v116 = v205 + (_DWORD)theStringa;
          v117 = *((_QWORD *)v4 + 16);
          v118 = v117 + 56 * (v205 + theStringa);
          v119 = (const char *)*((_QWORD *)v115 - 2);
          v120 = strlen(v119);
          *(_DWORD *)(v118 + 16) = v120;
          v121 = (v120 + 1);
          v122 = (void *)StackAllocator::reserve((StackAllocator *)buf, v121);
          v123 = v122;
          if ((_DWORD)v121)
            v124 = v122 == 0;
          else
            v124 = 1;
          if (!v124)
            memcpy(v122, v119, v121);
          *(_QWORD *)v118 = v123;
          v125 = (const char *)*((_QWORD *)v115 - 1);
          v126 = strlen(v125);
          *(_DWORD *)(v117 + 56 * v116 + 20) = v126;
          v127 = (v126 + 1);
          v128 = (void *)StackAllocator::reserve((StackAllocator *)buf, v127);
          v129 = v128;
          if ((_DWORD)v127)
            v130 = v128 == 0;
          else
            v130 = 1;
          if (!v130)
            memcpy(v128, v125, v127);
          *(_QWORD *)(v117 + 56 * v116 + 8) = v129;
          if (!*(_QWORD *)v118 || v129 == 0)
            break;
          v132 = *v115;
          v115 += 6;
          v133 = (int8x8_t *)(v117 + 56 * v116);
          v133[3].i32[0] = v132;
          v133[3].i32[1] = -1;
          v134 = theStringa;
          v133[4] = (int8x8_t)theStringa;
          v133[5] = v54;
          theStringa = (CFStringRef)((char *)theStringa + 1);
          if (v134 == (CFStringRef)7)
          {
            v135 = v205 + 8;
            if (v201 && v4[26])
            {
              v136 = 0;
              v137 = v205 + 8;
              while (1)
              {
                v138 = v137 + v136;
                v139 = *((_QWORD *)v4 + 16);
                v140 = (char **)(v139 + 56 * (v137 + v136));
                *((_DWORD *)v140 + 4) = 27;
                v141 = v140 + 2;
                v142 = (char *)StackAllocator::reserve((StackAllocator *)buf, 0x1Cu);
                if (v142)
                  strcpy(v142, "GRC_SHADER_PROFILER_DATA_00");
                *v140 = v142;
                v143 = v139 + 56 * v138;
                *(_DWORD *)(v143 + 20) = 64;
                v144 = (_DWORD *)(v143 + 20);
                v145 = (char *)StackAllocator::reserve((StackAllocator *)buf, 0x41u);
                if (!v145)
                  break;
                strcpy(v145, "Virtual counter to read shader profiler trace buffer from USC 00");
                v146 = v139 + 56 * v138;
                *(_QWORD *)(v146 + 8) = v145;
                v147 = (_QWORD *)(v146 + 8);
                v148 = *v140;
                if (!*v140)
                  goto LABEL_341;
                v149 = v139 + 56 * v138;
                *(_DWORD *)(v149 + 24) = 1;
                v148[*v141 - 2] = v136 / 0xA + 48;
                (*v140)[*v141 - 1] = (v136 % 0xA) | 0x30;
                *(_BYTE *)(*v147 + (*v144 - 2)) = v136 / 0xA + 48;
                *(_BYTE *)(*v147 + (*v144 - 1)) = (v136 % 0xA) | 0x30;
                *(_DWORD *)(v149 + 28) = -2;
                *(_QWORD *)(v149 + 32) = v136;
                *(_QWORD *)(v149 + 40) = v199;
                if (++v136 >= (unint64_t)v4[26])
                {
                  v135 = v205 + 8 + v136;
                  goto LABEL_233;
                }
              }
              *(_QWORD *)(v139 + 56 * v138 + 8) = 0;
LABEL_341:
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", "AGXGPURawCounterImpl.mm", 3089, "init");
              v192 = MEMORY[0x24BDACB70];
              v193 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 3089;
                v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", outputStructCnt, 0x1Cu);
              }

              v194 = v192;
              if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 3089;
                v216 = 2080;
                v217 = "init";
                _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", outputStructCnt, 0x1Cu);
              }
            }
            else
            {
LABEL_233:
              if (*(_QWORD *)&buf[16] == *(_QWORD *)&buf[24] && v135 == v4[34])
              {
                buf[0] = 0;
                memset(&buf[4], 0, 28);
                goto LABEL_236;
              }
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(allocator.free() == 0) && (perfCtrIdx == _masterCounterNum)\"\n", "AGXGPURawCounterImpl.mm", 3106, "init");
              v196 = MEMORY[0x24BDACB70];
              v197 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 3106;
                v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(allocator.free() == 0) && (perfCtrIdx == _masterCounterNum)\"\n", outputStructCnt, 0x1Cu);
              }

              v198 = v196;
              if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)outputStructCnt = 136315650;
                *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                v214 = 1024;
                v215 = 3106;
                v216 = 2080;
                v217 = "init";
                _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(allocator.free() == 0) && (perfCtrIdx == _masterCounterNum)\"\n", outputStructCnt, 0x1Cu);
              }
            }

            goto LABEL_278;
          }
        }
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", "AGXGPURawCounterImpl.mm", 3068, "init");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)outputStructCnt = 136315650;
          *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          v214 = 1024;
          v215 = 3068;
          v216 = 2080;
          v217 = "init";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", outputStructCnt, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)outputStructCnt = 136315650;
          *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          v214 = 1024;
          v215 = 3068;
          v216 = 2080;
          v217 = "init";
          v151 = MEMORY[0x24BDACB70];
          v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n";
          goto LABEL_277;
        }
        break;
      }
      if (v205 && v200)
      {
        v106 = -(uint64_t)*(unsigned int *)&buf[4];
        v107 = vdupq_n_s64(*(unsigned int *)&buf[4]);
        v108 = (int8x16_t)vdupq_n_s64(v106);
        v109 = (int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_22FB05900), v108);
        v110 = (int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_22FB058F0), v108);
        v110.i64[0] *= 3;
        v110.i64[1] *= 2;
        v111 = vaddvq_s64(vaddq_s64(v110, vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_22FB05920), v108), vaddq_s64(vaddq_s64(v109, v109), (int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_22FB05910), v108)))))+ ((*(unsigned int *)&buf[4] + 95) & v106)+ ((*(unsigned int *)&buf[4] + 52) & v106)+ ((*(unsigned int *)&buf[4] + 56) & v106)+ *(_QWORD *)&buf[16];
        v112 = v205 + 8;
        if (v201)
        {
          v113 = v4[26];
          if (v113)
          {
            v114 = ((*(unsigned int *)&buf[4] + 27) & v106) + ((*(unsigned int *)&buf[4] + 64) & v106);
            v111 += v114 + v114 * (v113 - 1);
            v112 = v113 + v205 + 8;
          }
        }
        *(_QWORD *)&buf[16] = ((*(unsigned int *)&buf[4] + 56 * v112 - 1) & v106) + v111;
        StackAllocator::init((StackAllocator *)buf, *(uint64_t *)&buf[16]);
        *((_QWORD *)v4 + 16) = *(_QWORD *)&buf[8];
        v4[34] = v112;
        if (StackAllocator::reserve((StackAllocator *)buf, 56 * v112))
        {
LABEL_236:
          v83 = 0;
          if ((v202 & 1) != 0)
            continue;
          CFRelease(theDict);
          CFRelease(theString2);
          qsort_b(*((void **)v4 + 16), v4[34], 0x38uLL, &__block_literal_global_118);
          v150 = 0;
          theString2 = 0;
          theDict = 0;
          goto LABEL_279;
        }
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"allocator.reserve(sizeof(CounterDescImpl) * _masterCounterNum) != NULL\"\n", "AGXGPURawCounterImpl.mm", 3052, "init");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)outputStructCnt = 136315650;
          *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          v214 = 1024;
          v215 = 3052;
          v216 = 2080;
          v217 = "init";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"allocator.reserve(sizeof(CounterDescImpl) * _masterCounterNum) != NULL\"\n", outputStructCnt, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)outputStructCnt = 136315650;
          *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          v214 = 1024;
          v215 = 3052;
          v216 = 2080;
          v217 = "init";
          v151 = MEMORY[0x24BDACB70];
          v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"allocator.reserve(sizeof(CounterDescImpl) * _masterCounterNum) != NULL\"\n";
          goto LABEL_277;
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(perfCtrIdx != 0) && (sourceMaskAll != 0)\"\n", "AGXGPURawCounterImpl.mm", 3022, "init");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)outputStructCnt = 136315650;
          *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          v214 = 1024;
          v215 = 3022;
          v216 = 2080;
          v217 = "init";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(perfCtrIdx != 0) && (sourceMaskAll != 0)\"\n", outputStructCnt, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)outputStructCnt = 136315650;
          *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          v214 = 1024;
          v215 = 3022;
          v216 = 2080;
          v217 = "init";
          v151 = MEMORY[0x24BDACB70];
          v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(perfCtrIdx != 0) && (sourceMaskAll != 0)\"\n";
          goto LABEL_277;
        }
      }
      break;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"((perfCtrList = (CFArrayRef)CFDictionaryGetValue(cfDict, CFSTR(\"DeviceCounters\"))) != NULL) && ((perfCtrNum = (uint32_t)CFArrayGetCount(perfCtrList)) != 0)\"\n", "AGXGPURawCounterImpl.mm", 2935, "init");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2935;
      v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((perfCtrList = (CFArrayRef)CFDictionaryGetValue(cfDict, CFSTR(\"DeviceCounters\"))) != NULL) && ((perfCtrNum = (uint32_t)CFArrayGetCount(perfCtrList)) != 0)\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)outputStructCnt = 136315650;
      *(_QWORD *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      v214 = 1024;
      v215 = 2935;
      v216 = 2080;
      v217 = "init";
      v151 = MEMORY[0x24BDACB70];
      v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"((perfCtrList = (CFArrayRef)CFDictionaryGetValue(cfDict, CFSTR(\"DeviceCounte"
             "rs\"))) != NULL) && ((perfCtrNum = (uint32_t)CFArrayGetCount(perfCtrList)) != 0)\"\n";
LABEL_277:
      _os_log_impl(&dword_22FAF3000, v151, OS_LOG_TYPE_INFO, v152, outputStructCnt, 0x1Cu);
    }
  }
LABEL_278:
  v150 = 6;
LABEL_279:
  if (buf[0])
    free(*(void **)&buf[8]);
  if (v150 == 6)
    goto LABEL_336;
  v155 = v4[34];
  if ((_DWORD)v155)
  {
    v156 = v4[164];
    if (!(_DWORD)v156)
      goto LABEL_306;
    v157 = 0;
    v158 = *((_QWORD *)v4 + 16);
    do
    {
      v159 = *(_QWORD *)(v158 + 56 * v157 + 40);
      v160 = v219;
      v161 = (int *)v253;
      v162 = v156;
      do
      {
        v163 = *v161;
        v161 += 11;
        if ((v159 & v163) != 0)
          ++*v160;
        ++v160;
        --v162;
      }
      while (v162);
      ++v157;
    }
    while (v157 != v155);
  }
  else
  {
    v156 = *v28;
    if (!(_DWORD)v156)
      goto LABEL_306;
  }
  for (i = 0; i < v156; ++i)
  {
    v165 = v219[i];
    if ((_DWORD)v165)
    {
      v166 = malloc_type_malloc(4 * v165, 0x100004052888210uLL);
      v220[i] = v166;
      if (!v166)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"sourceCounterIdxList[i] != NULL\"\n", "AGXGPURawCounterImpl.mm", 3164, "init");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3164;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "init";
          _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"sourceCounterIdxList[i] != NULL\"\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3164;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "init";
          _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"sourceCounterIdxList[i] != NULL\"\n", buf, 0x1Cu);
        }
        goto LABEL_336;
      }
      v219[i] = 0;
      v156 = *v28;
    }
  }
  v167 = v4[34];
  if ((_DWORD)v167)
  {
    if (v156)
    {
      v168 = 0;
      v169 = *((_QWORD *)v4 + 16);
      v170 = 1;
      do
      {
        if (v170)
        {
          v171 = 0;
          v172 = *(_QWORD *)(v169 + 56 * v168 + 40);
          v173 = (int *)v253;
          do
          {
            v174 = *v173;
            v173 += 11;
            if ((v172 & v174) != 0)
            {
              v175 = v219[v171];
              *((_DWORD *)v220[v171] + v175) = v168;
              v219[v171] = v175 + 1;
              v156 = *v28;
            }
            ++v171;
          }
          while (v171 < v156);
          v167 = v4[34];
          v170 = v156;
        }
        ++v168;
      }
      while (v168 < v167);
      goto LABEL_307;
    }
LABEL_306:
    v4[170] = 0x4000;
    v8 = 1;
    return v8 & 1;
  }
LABEL_307:
  v4[170] = 0x4000;
  if (!v156)
    goto LABEL_309;
  v176 = 0;
  v177 = (char *)__s1;
  for (j = v220; ; ++j)
  {
    if (!*((_DWORD *)v177 + 8))
    {
      free(*j);
      v179 = j;
      goto LABEL_311;
    }
    v180 = (uint64_t (**)(_DWORD *, unint64_t, char *, void *, _QWORD, _QWORD))AGXGPURawCounterImpl::chipDispatchTableForSource((AGXGPURawCounterImpl *)v4[23], v4[24], v4[26], v177, v65);
    if (!v180)
      break;
    v181 = &v4[2 * v176];
    if (*((_QWORD *)v181 + 18))
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"_sourceList[sourceIdx] == nullptr\"\n", "AGXGPURawCounterImpl.mm", 3206, "init");
      v186 = MEMORY[0x24BDACB70];
      v187 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3206;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "init";
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceList[sourceIdx] == nullptr\"\n", buf, 0x1Cu);
      }

      v188 = v186;
      if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3206;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "init";
        _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceList[sourceIdx] == nullptr\"\n", buf, 0x1Cu);
      }
      goto LABEL_335;
    }
    v182 = (*v180)(v4, v176, v177, *j, v219[v176], v180);
    *((_QWORD *)v181 + 18) = v182;
    if (!v182)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"(_sourceList[sourceIdx] = chipDispatchTable->createSource( this, sourceIdx, &sourceInfo, sourceCounterIdxList[sourceIdx], sourceCounterIdxNum [sourceIdx], chipDispatchTable)) != nullptr\"\n", "AGXGPURawCounterImpl.mm", 3213, "init");
      v189 = MEMORY[0x24BDACB70];
      v190 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3213;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "init";
        _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sourceList[sourceIdx] = chipDispatchTable->createSource( this, sourceIdx, &sourceInfo, sourceCounterIdxList[sourceIdx], sourceCounterIdxNum [sourceIdx], chipDispatchTable)) != nullptr\"\n", buf, 0x1Cu);
      }

      v191 = v189;
      if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3213;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "init";
        _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sourceList[sourceIdx] = chipDispatchTable->createSource( this, sourceIdx, &sourceInfo, sourceCounterIdxList[sourceIdx], sourceCounterIdxNum [sourceIdx], chipDispatchTable)) != nullptr\"\n", buf, 0x1Cu);
      }
      goto LABEL_335;
    }
    v179 = &v220[v176];
LABEL_311:
    v177 += 44;
    *v179 = 0;
    ++v176;
    v8 = 1;
    if (v176 >= *v28)
      return v8 & 1;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** \"chipDispatchTable != nullptr\"\n", "AGXGPURawCounterImpl.mm", 3205, "init");
  v183 = MEMORY[0x24BDACB70];
  v184 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3205;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"chipDispatchTable != nullptr\"\n", buf, 0x1Cu);
  }

  v185 = v183;
  if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3205;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "init";
    _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"chipDispatchTable != nullptr\"\n", buf, 0x1Cu);
  }
LABEL_335:

LABEL_336:
  if (theDict)
    CFRelease(theDict);
  if (theString2)
    CFRelease(theString2);
LABEL_12:
  free(v220[0]);
  free(v220[1]);
  free((void *)v221);
  free(*((void **)&v221 + 1));
  free((void *)v222);
  free(*((void **)&v222 + 1));
  free((void *)v223);
  free(*((void **)&v223 + 1));
  free((void *)v224);
  free(*((void **)&v224 + 1));
  free((void *)v225);
  free(*((void **)&v225 + 1));
  free((void *)v226);
  free(*((void **)&v226 + 1));
  free((void *)v227);
  free(*((void **)&v227 + 1));
  free((void *)v228);
  free(*((void **)&v228 + 1));
  free((void *)v229);
  free(*((void **)&v229 + 1));
  free((void *)v230);
  free(*((void **)&v230 + 1));
  free((void *)v231);
  free(*((void **)&v231 + 1));
  free((void *)v232);
  free(*((void **)&v232 + 1));
  free((void *)v233);
  free(*((void **)&v233 + 1));
  free((void *)v234);
  free(*((void **)&v234 + 1));
  free((void *)v235);
  free(*((void **)&v235 + 1));
  free((void *)v236);
  free(*((void **)&v236 + 1));
  free((void *)v237);
  free(*((void **)&v237 + 1));
  free((void *)v238);
  free(*((void **)&v238 + 1));
  free((void *)v239);
  free(*((void **)&v239 + 1));
  free((void *)v240);
  free(*((void **)&v240 + 1));
  free((void *)v241);
  free(*((void **)&v241 + 1));
  free((void *)v242);
  free(*((void **)&v242 + 1));
  free((void *)v243);
  free(*((void **)&v243 + 1));
  free((void *)v244);
  free(*((void **)&v244 + 1));
  free((void *)v245);
  free(*((void **)&v245 + 1));
  free((void *)v246);
  free(*((void **)&v246 + 1));
  free((void *)v247);
  free(*((void **)&v247 + 1));
  free((void *)v248);
  free(*((void **)&v248 + 1));
  free((void *)v249);
  free(*((void **)&v249 + 1));
  free((void *)v250);
  free(*((void **)&v250 + 1));
  free((void *)v251);
  free(*((void **)&v251 + 1));
  AGXGPURawCounterImpl::free((AGXGPURawCounterImpl *)v4);
  v8 = 0;
  return v8 & 1;
}

void sub_22FB02318(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,void *a38)
{
  if (a37)
  {
    free(a38);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t perfCtrSamplerGetSourceNum(unsigned int *a1, mach_port_t connection)
{
  uint64_t result;
  _OWORD v4[2];
  size_t outputStructCnt;

  v4[0] = xmmword_22FB05A68;
  v4[1] = unk_22FB05A78;
  if (!connection)
  {
    connection = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
    if (!connection)
      return 5;
  }
  outputStructCnt = 32;
  result = IOConnectCallStructMethod(connection, 0x105u, v4, 0x20uLL, v4, &outputStructCnt);
  if (!(_DWORD)result)
    *a1 = DWORD1(v4[0]);
  return result;
}

CFPropertyListRef cfDictionaryCreateFromPlist(const char *a1)
{
  FILE *v1;
  FILE *v2;
  unsigned int v3;
  const __CFAllocator *v4;
  size_t v5;
  __CFData *Mutable;
  __CFData *v7;
  UInt8 *MutableBytePtr;
  CFPropertyListRef v9;

  v1 = fopen(a1, "rb");
  if (!v1)
    return 0;
  v2 = v1;
  fseek(v1, 0, 2);
  v3 = MEMORY[0x2348A9298](v2);
  fseek(v2, 0, 0);
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = v3;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v3);
  if (Mutable)
  {
    v7 = Mutable;
    CFDataSetLength(Mutable, v5);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    if (fread(MutableBytePtr, v5, 1uLL, v2) == 1)
      v9 = CFPropertyListCreateWithData(v4, v7, 0, 0, 0);
    else
      v9 = 0;
    CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  fclose(v2);
  return v9;
}

uint64_t perfCtrSamplerGetSourceInfo(char a1, uint64_t a2, mach_port_t connection)
{
  mach_port_t v3;
  uint64_t result;
  _QWORD outputStruct[2];
  __int128 v7;
  size_t outputStructCnt;

  v3 = connection;
  outputStruct[0] = 2;
  outputStruct[1] = a2;
  BYTE4(outputStruct[0]) = a1;
  v7 = xmmword_22FB05930;
  if (!connection)
  {
    v3 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
    if (!v3)
      return 5;
  }
  outputStructCnt = 32;
  result = IOConnectCallStructMethod(v3, 0x105u, outputStruct, 0x20uLL, outputStruct, &outputStructCnt);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 32) = *(_QWORD *)((char *)&v7 + 4);
    *(_DWORD *)(a2 + 40) = HIDWORD(v7);
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::chipDispatchTableForSource(AGXGPURawCounterImpl *this, unsigned int a2, unsigned int a3, char *__s1, const char *a5)
{
  int v8;
  unsigned __int8 v9;
  uint64_t v10;
  int *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v8 = (int)this;
  v23 = *MEMORY[0x24BDAC8D0];
  if ((v9 & 1) == 0
  {
    AGXGPURawCounterImpl::chipDispatchTableForSource(unsigned int,unsigned int,unsigned int,char const*)const::sourceToDispatchMapList[0] = xmmword_22FB05940;
    dword_255E39DA0 = 999;
    qword_255E39DA8 = (uint64_t)"Firmware";
    dword_255E39DB0 = 8;
    qword_255E39DB8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E39DC0 = xmmword_22FB05950;
    dword_255E39DD0 = 999;
    qword_255E39DD8 = (uint64_t)"Firmware";
    dword_255E39DE0 = 8;
    qword_255E39DE8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E39DF0 = xmmword_22FB05960;
    dword_255E39E00 = 999;
    qword_255E39E08 = (uint64_t)"Firmware";
    dword_255E39E10 = 8;
    qword_255E39E18 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E39E20 = xmmword_22FB05960;
    dword_255E39E30 = 999;
    qword_255E39E38 = (uint64_t)"RDE";
    dword_255E39E40 = 3;
    qword_255E39E48 = (uint64_t)&AGXGRC_G11::sChipDispatchTable;
    xmmword_255E39E50 = xmmword_22FB05970;
    dword_255E39E60 = 999;
    qword_255E39E68 = (uint64_t)"Firmware";
    dword_255E39E70 = 8;
    qword_255E39E78 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E39E80 = xmmword_22FB05970;
    dword_255E39E90 = 999;
    qword_255E39E98 = (uint64_t)"RDE";
    dword_255E39EA0 = 3;
    qword_255E39EA8 = (uint64_t)&AGXGRC_G12::sChipDispatchTable;
    xmmword_255E39EB0 = xmmword_22FB05980;
    dword_255E39EC0 = 999;
    qword_255E39EC8 = (uint64_t)"Firmware";
    dword_255E39ED0 = 8;
    qword_255E39ED8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E39EE0 = xmmword_22FB05980;
    dword_255E39EF0 = 999;
    qword_255E39EF8 = (uint64_t)"RDE";
    dword_255E39F00 = 3;
    qword_255E39F08 = (uint64_t)&AGXGRC_G13::sChipDispatchTableTMB;
    xmmword_255E39F10 = xmmword_22FB05980;
    dword_255E39F20 = 999;
    qword_255E39F28 = (uint64_t)"BMPR_RDE";
    dword_255E39F30 = 8;
    qword_255E39F38 = (uint64_t)&AGXGRC_G13::sChipDispatchTableBMPR;
    xmmword_255E39F40 = xmmword_22FB05990;
    dword_255E39F50 = 999;
    qword_255E39F58 = (uint64_t)"Firmware";
    dword_255E39F60 = 8;
    qword_255E39F68 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E39F70 = xmmword_22FB05990;
    dword_255E39F80 = 999;
    qword_255E39F88 = (uint64_t)"RDE";
    dword_255E39F90 = 3;
    qword_255E39F98 = (uint64_t)&AGXGRC_G14::sChipDispatchTable;
    xmmword_255E39FA0 = xmmword_22FB05990;
    dword_255E39FB0 = 999;
    qword_255E39FB8 = (uint64_t)"BMPR_RDE";
    dword_255E39FC0 = 8;
    qword_255E39FC8 = (uint64_t)&AGXGRC_G14::sChipDispatchTable;
    xmmword_255E39FD0 = xmmword_22FB059A0;
    dword_255E39FE0 = 999;
    qword_255E39FE8 = (uint64_t)"Firmware";
    dword_255E39FF0 = 8;
    qword_255E39FF8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E3A000 = xmmword_22FB059A0;
    dword_255E3A010 = 999;
    qword_255E3A018 = (uint64_t)"RDE";
    dword_255E3A020 = 3;
    qword_255E3A028 = (uint64_t)&AGXGRC_G14X::sChipDispatchTableTMB;
    xmmword_255E3A030 = xmmword_22FB059A0;
    dword_255E3A040 = 999;
    qword_255E3A048 = (uint64_t)"BMPR_RDE";
    dword_255E3A050 = 8;
    qword_255E3A058 = (uint64_t)&AGXGRC_G14X::sChipDispatchTableBMPR;
    xmmword_255E3A060 = xmmword_22FB059B0;
    dword_255E3A070 = 999;
    qword_255E3A078 = (uint64_t)"Firmware";
    dword_255E3A080 = 8;
    qword_255E3A088 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E3A090 = xmmword_22FB059B0;
    dword_255E3A0A0 = 5;
    qword_255E3A0A8 = (uint64_t)"RDE";
    dword_255E3A0B0 = 3;
    qword_255E3A0B8 = (uint64_t)&AGXGRC_G14::sChipDispatchTable;
    xmmword_255E3A0C0 = xmmword_22FB059C0;
    dword_255E3A0D0 = 999;
    qword_255E3A0D8 = (uint64_t)"RDE";
    dword_255E3A0E0 = 3;
    qword_255E3A0E8 = (uint64_t)&AGXGRC_G15::sChipDispatchTable;
    xmmword_255E3A0F0 = xmmword_22FB059B0;
    dword_255E3A100 = 999;
    qword_255E3A108 = (uint64_t)"APS_USC";
    dword_255E3A110 = 7;
    qword_255E3A118 = (uint64_t)&AGXGRC_G15::sChipDispatchTableAPS;
    xmmword_255E3A120 = xmmword_22FB059D0;
    dword_255E3A130 = 6;
    qword_255E3A138 = (uint64_t)"Firmware";
    dword_255E3A140 = 8;
    qword_255E3A148 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E3A150 = xmmword_22FB059D0;
    dword_255E3A160 = 6;
    qword_255E3A168 = (uint64_t)"RDE";
    dword_255E3A170 = 3;
    qword_255E3A178 = (uint64_t)&AGXGRC_G16::sChipDispatchTable;
    xmmword_255E3A180 = xmmword_22FB059D0;
    dword_255E3A190 = 6;
    qword_255E3A198 = (uint64_t)"APS_USC";
    dword_255E3A1A0 = 7;
    qword_255E3A1A8 = (uint64_t)&AGXGRC_G16::sChipDispatchTableAPS;
    xmmword_255E3A1B0 = xmmword_22FB059E0;
    dword_255E3A1C0 = 999;
    qword_255E3A1C8 = (uint64_t)"Firmware";
    dword_255E3A1D0 = 8;
    qword_255E3A1D8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E3A1E0 = xmmword_22FB059E0;
    dword_255E3A1F0 = 999;
    qword_255E3A1F8 = (uint64_t)"RDE";
    dword_255E3A200 = 3;
    qword_255E3A208 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTable;
    xmmword_255E3A210 = xmmword_22FB059E0;
    dword_255E3A220 = 999;
    qword_255E3A228 = (uint64_t)"APS_USC";
    dword_255E3A230 = 7;
    qword_255E3A238 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTableAPS;
    xmmword_255E3A240 = xmmword_22FB059F0;
    dword_255E3A250 = 6;
    qword_255E3A258 = (uint64_t)"Firmware";
    dword_255E3A260 = 8;
    qword_255E3A268 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_255E3A270 = xmmword_22FB059F0;
    dword_255E3A280 = 6;
    qword_255E3A288 = (uint64_t)"RDE";
    dword_255E3A290 = 3;
    qword_255E3A298 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTable;
    xmmword_255E3A2A0 = xmmword_22FB059F0;
    dword_255E3A2B0 = 6;
    qword_255E3A2B8 = (uint64_t)"APS_USC";
    dword_255E3A2C0 = 7;
    qword_255E3A2C8 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTableAPS;
  }
  v10 = 0;
  v11 = &dword_255E39DA0;
  do
  {
    if (*(v11 - 4) == v8
      && *(v11 - 3) <= a2
      && *(v11 - 2) >= a2
      && *(v11 - 1) <= a3
      && *v11 >= a3
      && !strncmp(__s1, *((const char **)v11 + 1), v11[4]))
    {
      return *((_QWORD *)&AGXGPURawCounterImpl::chipDispatchTableForSource(unsigned int,unsigned int,unsigned int,char const*)const::sourceToDispatchMapList[3 * v10 + 2]
             + 1);
    }
    ++v10;
    v11 += 12;
  }
  while (v10 != 28);
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Fail to find dispatch table for gpuGen=%u sourceName=%s\n", "AGXGPURawCounterImpl.mm", 3422, "chipDispatchTableForSource", v8, __s1);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "AGXGPURawCounterImpl.mm";
    v15 = 1024;
    v16 = 3422;
    v17 = 2080;
    v18 = "chipDispatchTableForSource";
    v19 = 1024;
    v20 = v8;
    v21 = 2080;
    v22 = __s1;
    _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to find dispatch table for gpuGen=%u sourceName=%s\n", buf, 0x2Cu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "AGXGPURawCounterImpl.mm";
    v15 = 1024;
    v16 = 3422;
    v17 = 2080;
    v18 = "chipDispatchTableForSource";
    v19 = 1024;
    v20 = v8;
    v21 = 2080;
    v22 = __s1;
    _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to find dispatch table for gpuGen=%u sourceName=%s\n", buf, 0x2Cu);
  }
  return 0;
}

void AGXGPURawCounterImpl::free(AGXGPURawCounterImpl *this)
{
  mach_port_t v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[2];
  size_t outputStructCnt;

  v2 = *((_DWORD *)this + 22);
  if (v2)
  {
    outputStructCnt = 32;
    memset(v8, 0, sizeof(v8));
    if (IOConnectCallStructMethod(v2, 0x105u, v8, 0x20uLL, v8, &outputStructCnt))
    {
      memset((char *)v8 + 4, 0, 28);
      LODWORD(v8[0]) = 11;
      IOConnectCallStructMethod(v2, 0x105u, v8, outputStructCnt, v8, &outputStructCnt);
    }
  }
  free(*((void **)this + 83));
  *((_QWORD *)this + 83) = 0;
  free(*((void **)this + 16));
  *((_QWORD *)this + 16) = 0;
  v3 = *((unsigned int *)this + 164);
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = (char *)this + 144;
    do
    {
      v6 = *(_QWORD *)&v5[8 * v4];
      if (v6)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
        *(_QWORD *)&v5[8 * v4] = 0;
        v3 = *((unsigned int *)this + 164);
      }
      ++v4;
    }
    while (v4 < v3);
  }
  if (*((_QWORD *)this + 2))
  {
    IOGPUDeviceRelease();
    *((_QWORD *)this + 2) = 0;
  }
  v7 = (void *)*((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = 0;

  *((_DWORD *)this + 22) = 0;
  *((_DWORD *)this + 2) = 0;
}

uint64_t ___ZN20AGXGPURawCounterImpl4initEj_block_invoke(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

void AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::~RingBufferAPSImpl(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this)
{
  *(_QWORD *)this = &off_24FD60620;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
}

{
  *(_QWORD *)this = &off_24FD60620;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  JUMPOUT(0x2348A91CCLL);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::base(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this)
{
  return *((_QWORD *)this + 3);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::size(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this)
{
  return *((unsigned int *)this + 8);
}

BOOL AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::state(void **this, unsigned int *a2, unsigned int *a3)
{
  _WORD *v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  _BOOL8 result;

  sys_dcache_flush(this[5], 0x10uLL);
  v6 = this[5];
  v7 = *((unsigned int *)this + 8);
  v8 = *((unsigned __int8 *)v6 + 15);
  if (*((_BYTE *)v6 + 15))
  {
    v6[4] = ((v7 >> 12) + (unsigned __int16)v6[6] - 1) % (v7 >> 12);
    *((_BYTE *)v6 + 15) = 0;
    sys_dcache_flush(v6, 0x10uLL);
    v9 = 0;
    *a2 = ((*((unsigned __int16 *)this[5] + 4) << 12) + 4096) % *((_DWORD *)this + 8);
  }
  else
  {
    v10 = ((unsigned __int16)v6[6] << 12) % v7;
    v11 = (((unsigned __int16)v6[4] << 12) + 4096) % v7;
    *a2 = v11;
    v9 = (v10 - v11 + *((_DWORD *)this + 8)) % *((_DWORD *)this + 8);
  }
  result = v8 == 0;
  *a3 = v9;
  return result;
}

size_t AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::drain(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this, int a2)
{
  size_t v2;
  unsigned int v4;
  size_t v5;
  size_t v6;
  void *v7;
  size_t v8;
  _WORD *v9;
  uint64_t v11;

  v2 = a2 & 0xFFFFF000;
  if ((a2 & 0xFFFFF000) != 0)
  {
    v11 = 0;
    if (((*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *, char *, uint64_t *))(*(_QWORD *)this + 32))(this, (char *)&v11 + 4, &v11) & 1) != 0)
    {
      if (v2 >= v11)
        v2 = v11;
      else
        v2 = v2;
      v4 = *((_DWORD *)this + 8);
      if (HIDWORD(v11) + (int)v2 <= v4)
      {
        v7 = (void *)(*((_QWORD *)this + 3) + HIDWORD(v11));
        v8 = v2;
      }
      else
      {
        v5 = v4 - HIDWORD(v11);
        v6 = (v2 - v5);
        sys_dcache_flush((void *)(*((_QWORD *)this + 3) + HIDWORD(v11)), v5);
        v7 = (void *)*((_QWORD *)this + 3);
        v8 = v6;
      }
      sys_dcache_flush(v7, v8);
      HIDWORD(v11) = (v2 + HIDWORD(v11) + *((_DWORD *)this + 8) - 4096) % *((_DWORD *)this + 8);
      v9 = (_WORD *)*((_QWORD *)this + 5);
      v9[4] = HIDWORD(v11) >> 12;
      sys_dcache_flush(v9, 0x10uLL);
    }
    else
    {
      sys_dcache_flush(*((void **)this + 3), *((unsigned int *)this + 8));
      return 0;
    }
  }
  return v2;
}

void AGXGPURawCounterImpl::SourceAPSImpl::~SourceAPSImpl(void **this)
{
  *this = &off_24FD600F0;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
}

{
  *this = &off_24FD600F0;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
  JUMPOUT(0x2348A91CCLL);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::availableTriggers(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  return 48;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::clearTriggers(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  uint64_t result;

  result = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *, _QWORD))(*(_QWORD *)this + 40))(this, 0);
  *((_DWORD *)this + 1559) = 0;
  *(_WORD *)((char *)this + 6369) = 0;
  *(_QWORD *)((char *)this + 6372) = 0;
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::addTrigger(_DWORD *a1, int a2, void *a3)
{
  _BYTE *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a1 + 6369;
  v6 = a3;
  v7 = v6;
  if (a2 == 16)
    goto LABEL_4;
  if (a2 == 32)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ESLInstTracing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[1] = objc_msgSend(v8, "BOOLValue");

LABEL_4:
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TileTracing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *v5 = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CountPeriod"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a1[1593] = objc_msgSend(v10, "unsignedLongValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PulsePeriod"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a1[1594] = objc_msgSend(v11, "unsignedLongValue");

    a1[1559] |= a2;
    v12 = 1;
    goto LABEL_10;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", "AGXGPURawCounterSourceAPSImpl.mm", 279, "addTrigger", a2);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v15 = "AGXGPURawCounterSourceAPSImpl.mm";
    v16 = 1024;
    v17 = 279;
    v18 = 2080;
    v19 = "addTrigger";
    v20 = 1024;
    v21 = a2;
    _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v15 = "AGXGPURawCounterSourceAPSImpl.mm";
    v16 = 1024;
    v17 = 279;
    v18 = 2080;
    v19 = "addTrigger";
    v20 = 1024;
    v21 = a2;
    _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
  }
  v12 = 0;
LABEL_10:

  return v12;
}

void sub_22FB03230(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::setOptions(AGXGPURawCounterImpl::SourceAPSImpl *this, NSDictionary *a2)
{
  NSDictionary *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = AGXGPURawCounterImpl::SourceImpl::setOptions(this, v3);
  if ((_DWORD)v4
    && ((*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *))(*(_QWORD *)this + 112))(this) & 8) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("SyncDrainMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (char *)this + 6368;
    *((_BYTE *)this + 6368) = objc_msgSend(v5, "BOOLValue");

    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("SystemTimePeriod"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)this + 1595) = objc_msgSend(v7, "unsignedLongValue");

    if (((*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *))(*(_QWORD *)this + 112))(this) & 0x10) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("CliqueAdvanceReason"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)this + 6371) = objc_msgSend(v8, "BOOLValue");

    }
    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("CliqueSubSampling"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MinTraced"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)this + 1596) = objc_msgSend(v10, "unsignedLongValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TargetThreshold"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)this + 1597) = objc_msgSend(v11, "unsignedLongValue");

    -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("ProfileControl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CliqueTraceLevel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)this + 1598) = objc_msgSend(v13, "unsignedLongValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EmitPos"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6[28] = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EmitThreadControlFlow"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6[29] = objc_msgSend(v15, "BOOLValue");

  }
  return v4;
}

void sub_22FB0342C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::availableFlags(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *((_QWORD *)this + 1);
  v2 = *(_DWORD *)(v1 + 92);
  if (v2 == 17 && *(_DWORD *)(v1 + 104) > 7u)
    return 24;
  if (v2 <= 0x11)
    return 8;
  return 24;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::setBufferSize(AGXGPURawCounterImpl::SourceAPSImpl *this, unint64_t a2)
{
  unsigned __int8 v2;
  __int128 *v3;
  int v5;
  int v6;
  unint64_t v7;
  AGXGPURawCounterImpl::SourceAPSImpl *v8;

  v3 = &xmmword_255E3A000;
  if ((v2 & 1) == 0)
  {
    v7 = a2;
    v8 = this;
    v3 = &xmmword_255E3A000;
    v6 = v5;
    a2 = v7;
    this = v8;
    if (v6)
    {
      AGXGPURawCounterImpl::SourceAPSImpl::setBufferSize(unsigned long long)::kRingBufferSizeMax = 0;
      v3 = &xmmword_255E3A000;
      a2 = v7;
      this = v8;
    }
  }
  if (*((_QWORD *)v3 + 91) * (unint64_t)*(unsigned int *)(*((_QWORD *)this + 1) + 108) < a2)
    a2 = *((_QWORD *)v3 + 91) * *(unsigned int *)(*((_QWORD *)this + 1) + 108);
  return AGXGPURawCounterImpl::SourceImpl::setBufferSize(this, a2);
}

unint64_t AGXGPURawCounterImpl::SourceAPSImpl::alignBufferSize(AGXGPURawCounterImpl::SourceAPSImpl *this, unint64_t a2, int a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *((_QWORD *)this + 1);
    v4 = *(unsigned int *)(v3 + 108);
    v5 = 0x800000000uLL / ((_DWORD)v4 << 14) * ((_DWORD)v4 << 14);
    if (v5 >= a2)
      v5 = a2;
    v6 = v5 / v4 + 0x3FFF;
    v7 = v6 & 0x1FFFFFC000;
    if ((v6 & 0x1FFFFFC000uLL) >= 0xFFFC000)
      v7 = 268419072;
    v8 = *(_DWORD *)(v3 + 100);
    if ((v6 & 0x1FFFFFC000) == 0)
      v7 = 0x4000;
    v9 = (_DWORD)v4 == v8;
    v10 = 0x8000;
    if (v9)
      v10 = 0x4000;
    if (!a3)
      v10 = 0;
    return v10 + v7 * v4;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterSourceAPSImpl.mm", 365, "alignBufferSize");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "AGXGPURawCounterSourceAPSImpl.mm";
      v14 = 1024;
      v15 = 365;
      v16 = 2080;
      v17 = "alignBufferSize";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "AGXGPURawCounterSourceAPSImpl.mm";
      v14 = 1024;
      v15 = 365;
      v16 = 2080;
      v17 = "alignBufferSize";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::calcBufferSizeWithRingBufferSize(AGXGPURawCounterImpl::SourceAPSImpl *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = 268419072;
    if (a2 < 0xFFFC000)
      v2 = a2;
    v3 = v2 * *(unsigned int *)(*((_QWORD *)this + 1) + 108);
    if (v3 >= 0x800000000)
      v4 = 0x800000000;
    else
      v4 = v3;
    return (*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *, uint64_t, _QWORD))(*(_QWORD *)this + 152))(this, v4, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterSourceAPSImpl.mm", 399, "calcBufferSizeWithRingBufferSize");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v7 = "AGXGPURawCounterSourceAPSImpl.mm";
      v8 = 1024;
      v9 = 399;
      v10 = 2080;
      v11 = "calcBufferSizeWithRingBufferSize";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v7 = "AGXGPURawCounterSourceAPSImpl.mm";
      v8 = 1024;
      v9 = 399;
      v10 = 2080;
      v11 = "calcBufferSizeWithRingBufferSize";
      _os_log_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::flushRingBuffers(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  uint64_t result;
  _OWORD v2[2];
  size_t outputStructCnt;

  v2[0] = xmmword_22FB05A88;
  v2[1] = unk_22FB05A98;
  result = *(unsigned int *)(sAGXGPURawCounterImpl + 88);
  if ((_DWORD)result)
  {
    outputStructCnt = 32;
    return IOConnectCallStructMethod(result, 0x105u, v2, 0x20uLL, v2, &outputStructCnt);
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::postProcessData(AGXGPURawCounterImpl::SourceAPSImpl *this, unsigned int a2, const unsigned __int8 *__src, size_t a4, unint64_t *a5, unsigned __int8 *__dst, size_t a7, unint64_t *a8, BOOL a9)
{
  uint64_t result;
  size_t v12;

  result = 0;
  if (__src && a5 && __dst && a7 && a8)
  {
    if (((a7 | a4) & 7) != 0)
    {
      return 0;
    }
    else
    {
      if (a4 >= a7)
        v12 = a7;
      else
        v12 = a4;
      memcpy(__dst, __src, v12);
      *a5 = v12;
      *a8 = v12;
      return 1;
    }
  }
  return result;
}

BOOL AGXGPURawCounterImpl::SourceAPSImpl::postProcessData(AGXGPURawCounterImpl::SourceAPSImpl *this, unsigned int a2, const unsigned __int8 *a3, unint64_t a4, unint64_t *a5, unint64_t a6, unsigned __int8 *a7, unint64_t a8, unint64_t a9, unint64_t *a10, BOOL a11)
{
  unsigned int v11;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BOOL8 result;
  NSObject *v22;
  const char *v23;
  int v26;
  uint32_t v27;
  unint64_t v30;
  unint64_t *v31;
  int v32;
  unint64_t v33;
  const unsigned __int8 *v34;
  unint64_t v35;
  unsigned __int8 *v36;
  const unsigned __int8 *v37;
  size_t v38;
  const unsigned __int8 *v39;
  const unsigned __int8 *v40;
  size_t v41;
  unsigned __int8 *v42;
  unint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  size_t v46;
  unint64_t v47;
  const unsigned __int8 *v48;
  size_t v49;
  unsigned __int8 *v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  _BYTE v58[10];
  unint64_t v59;
  __int16 v60;
  unint64_t *v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  unsigned __int8 *v65;
  __int16 v66;
  unint64_t v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  unint64_t *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v11 = *((_DWORD *)this + 1572);
  if (v11 <= a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)!\n", "AGXGPURawCounterSourceAPSImpl.mm", 467, "postProcessData", a2, v11);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v32 = *((_DWORD *)this + 1572);
      *(_DWORD *)buf = 136316162;
      v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      v53 = 1024;
      v54 = 467;
      v55 = 2080;
      v56 = "postProcessData";
      v57 = 1024;
      *(_DWORD *)v58 = a2;
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = v32;
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)!\n", buf, 0x28u);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    v26 = *((_DWORD *)this + 1572);
    *(_DWORD *)buf = 136316162;
    v52 = "AGXGPURawCounterSourceAPSImpl.mm";
    v53 = 1024;
    v54 = 467;
    v55 = 2080;
    v56 = "postProcessData";
    v57 = 1024;
    *(_DWORD *)v58 = a2;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v26;
    v22 = MEMORY[0x24BDACB70];
    v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)!\n";
    v27 = 40;
LABEL_25:
    _os_log_impl(&dword_22FAF3000, v22, OS_LOG_TYPE_INFO, v23, buf, v27);
    return 0;
  }
  if (!a3 || !a4 || !a5 || a6 >= a4 || !a7 || !a8 || a8 <= a9 || !a10)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** All parameters must be non-zero! (src=%p size=%llu read=0x%p write=%llu dst=0x%p size=%llu read=%llu write=%p\n", "AGXGPURawCounterSourceAPSImpl.mm", 474, "postProcessData", a3, a4, a5, a6, a7, a8, a9, a10);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136317698;
      v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      v53 = 1024;
      v54 = 474;
      v55 = 2080;
      v56 = "postProcessData";
      v57 = 2048;
      *(_QWORD *)v58 = a3;
      *(_WORD *)&v58[8] = 2048;
      v59 = a4;
      v60 = 2048;
      v61 = a5;
      v62 = 2048;
      v63 = a6;
      v64 = 2048;
      v65 = a7;
      v66 = 2048;
      v67 = a8;
      v68 = 2048;
      v69 = a9;
      v70 = 2048;
      v71 = a10;
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** All parameters must be non-zero! (src=%p size=%llu read=0x%p write=%llu dst=0x%p size=%llu read=%llu write=%p\n", buf, 0x6Cu);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    *(_DWORD *)buf = 136317698;
    v52 = "AGXGPURawCounterSourceAPSImpl.mm";
    v53 = 1024;
    v54 = 474;
    v55 = 2080;
    v56 = "postProcessData";
    v57 = 2048;
    *(_QWORD *)v58 = a3;
    *(_WORD *)&v58[8] = 2048;
    v59 = a4;
    v60 = 2048;
    v61 = a5;
    v62 = 2048;
    v63 = a6;
    v64 = 2048;
    v65 = a7;
    v66 = 2048;
    v67 = a8;
    v68 = 2048;
    v69 = a9;
    v70 = 2048;
    v71 = a10;
    v22 = MEMORY[0x24BDACB70];
    v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** All parameters must be non-zero! (src=%p size=%llu read=0x%p write=%llu dst=0x%p s"
          "ize=%llu read=%llu write=%p\n";
    v27 = 108;
    goto LABEL_25;
  }
  v17 = *a5;
  v18 = *a10;
  v19 = a4 - *a5;
  if (a4 <= *a5 || (v20 = a8 - v18, a8 <= v18))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** srcRead and/or dstWrite is out of bound! (*srcRead=%llu size=%llu *dstWrite=%llu size=%llu\n", "AGXGPURawCounterSourceAPSImpl.mm", 480, "postProcessData", v17, a4, *a10, a8);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v43 = *a5;
      v44 = (unint64_t *)*a10;
      *(_DWORD *)buf = 136316674;
      v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      v53 = 1024;
      v54 = 480;
      v55 = 2080;
      v56 = "postProcessData";
      v57 = 2048;
      *(_QWORD *)v58 = v43;
      *(_WORD *)&v58[8] = 2048;
      v59 = a4;
      v60 = 2048;
      v61 = v44;
      v62 = 2048;
      v63 = a8;
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** srcRead and/or dstWrite is out of bound! (*srcRead=%llu size=%llu *dstWrite=%llu size=%llu\n", buf, 0x44u);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    v30 = *a5;
    v31 = (unint64_t *)*a10;
    *(_DWORD *)buf = 136316674;
    v52 = "AGXGPURawCounterSourceAPSImpl.mm";
    v53 = 1024;
    v54 = 480;
    v55 = 2080;
    v56 = "postProcessData";
    v57 = 2048;
    *(_QWORD *)v58 = v30;
    *(_WORD *)&v58[8] = 2048;
    v59 = a4;
    v60 = 2048;
    v61 = v31;
    v62 = 2048;
    v63 = a8;
    v22 = MEMORY[0x24BDACB70];
    v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** srcRead and/or dstWrite is out of bound! (*srcRead=%llu size=%llu *dstWrite=%llu size=%llu\n";
    v27 = 68;
    goto LABEL_25;
  }
  if ((((a6 | a4) | v17) & 7) != 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** srcSize/Read/Write is not aligned to 64-bits!\n", "AGXGPURawCounterSourceAPSImpl.mm", 486, "postProcessData");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      v53 = 1024;
      v54 = 486;
      v55 = 2080;
      v56 = "postProcessData";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** srcSize/Read/Write is not aligned to 64-bits!\n", buf, 0x1Cu);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      v53 = 1024;
      v54 = 486;
      v55 = 2080;
      v56 = "postProcessData";
      v22 = MEMORY[0x24BDACB70];
      v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** srcSize/Read/Write is not aligned to 64-bits!\n";
LABEL_36:
      v27 = 28;
      goto LABEL_25;
    }
  }
  else if ((((a9 | a8) | v18) & 7) != 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** dstSize/Read/Write is not aligned to 64-bits!\n", "AGXGPURawCounterSourceAPSImpl.mm", 492, "postProcessData");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      v53 = 1024;
      v54 = 492;
      v55 = 2080;
      v56 = "postProcessData";
      _os_log_error_impl(&dword_22FAF3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** dstSize/Read/Write is not aligned to 64-bits!\n", buf, 0x1Cu);
    }
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      v53 = 1024;
      v54 = 492;
      v55 = 2080;
      v56 = "postProcessData";
      v22 = MEMORY[0x24BDACB70];
      v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** dstSize/Read/Write is not aligned to 64-bits!\n";
      goto LABEL_36;
    }
  }
  else
  {
    if ((a6 + a4 - v17) % a4 >= (a8 - a9 + v18) / a8 * a8 - (v18 - a9) - 8)
      v33 = (a8 - a9 + v18) / a8 * a8 - (v18 - a9) - 8;
    else
      v33 = (a6 + a4 - v17) % a4;
    if (v33 + v17 <= a4)
    {
      v39 = &a3[v17];
      v35 = a8;
      if (v33 + v18 <= a8)
      {
        v42 = &a7[v18];
        v40 = &a3[v17];
        v41 = v33;
      }
      else
      {
        memcpy(&a7[v18], v39, a8 - v18);
        v40 = &v39[v20];
        v41 = v33 - v20;
        v42 = a7;
      }
      memcpy(v42, v40, v41);
      v46 = v33;
    }
    else
    {
      v34 = &a3[v17];
      v35 = a8;
      v36 = &a7[v18];
      if (v18 + v19 <= a8)
      {
        v37 = &a3[v17];
        v38 = a4 - *a5;
      }
      else
      {
        memcpy(v36, v34, a8 - v18);
        v37 = &v34[v20];
        v38 = v19 - v20;
        v36 = a7;
      }
      memcpy(v36, v37, v38);
      v45 = (*a10 + v19) % v35;
      *a10 = v45;
      v46 = v33 - v19;
      if (v45 + v46 <= v35)
      {
        v50 = &a7[v45];
        v48 = a3;
        v49 = v46;
      }
      else
      {
        v47 = v35 - v45;
        memcpy(&a7[v45], a3, v35 - v45);
        v48 = &a3[v47];
        v49 = v46 - v47;
        v50 = a7;
      }
      memcpy(v50, v48, v49);
    }
    *a10 = (*a10 + v46) % v35;
    *a5 = (*a5 + v33) % a4;
    return 1;
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::fillKernelConfigData(uint64_t result, uint64_t a2)
{
  char v2;
  char v3;
  char v4;
  unsigned int v5;
  unsigned int v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  char v13;

  v2 = *(_BYTE *)(a2 + 16) & 0xFE | *(_BYTE *)(result + 6368);
  *(_BYTE *)(a2 + 16) = v2;
  v3 = v2 & 0xFD | (2 * *(_BYTE *)(result + 6369));
  *(_BYTE *)(a2 + 16) = v3;
  v4 = v3 & 0xFB | (4 * *(_BYTE *)(result + 6370));
  *(_BYTE *)(a2 + 16) = v4;
  *(_BYTE *)(a2 + 16) = v4 & 0xF7 | (8 * *(_BYTE *)(result + 6371));
  v5 = *(_DWORD *)(result + 6372);
  v6 = 32 - __clz(~(-1 << -(char)__clz(v5 - 1)));
  if (v5 >= 2)
    v7 = v6;
  else
    v7 = 0;
  *(_BYTE *)(a2 + 18) = v7;
  v8 = *(_DWORD *)(result + 6376);
  v9 = 32 - __clz(~(-1 << -(char)__clz(v8 - 1)));
  if (v8 >= 2)
    v10 = v9;
  else
    v10 = 0;
  *(_BYTE *)(a2 + 17) = v10;
  v11 = *(_DWORD *)(result + 6380);
  v12 = 32 - __clz(~(-1 << -(char)__clz(v11 - 1)));
  if (v11 >= 2)
    v13 = v12;
  else
    v13 = 0;
  *(_BYTE *)(a2 + 19) = v13;
  *(_WORD *)(a2 + 20) = *(unsigned __int8 *)(result + 6384);
  *(_WORD *)(a2 + 22) = *(unsigned __int8 *)(result + 6388);
  *(_BYTE *)(a2 + 24) = *(_DWORD *)(result + 6392);
  *(_BYTE *)(a2 + 25) = *(_BYTE *)(result + 6396);
  *(_BYTE *)(a2 + 26) = *(_BYTE *)(result + 6397);
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::ringBufferInit(AGXGPURawCounterImpl::SourceAPSImpl *this, uint64_t a2, char *a3, uint64_t a4)
{
  unsigned int v4;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  v8 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *, uint64_t))(*(_QWORD *)this + 224))(this, a4);
  if ((_DWORD)v8)
    v9 = v4 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = 8 * v4;
    do
    {
      v13 = 16
          * (v11 % *(_DWORD *)(*((_QWORD *)this + 1) + 104) + 16 * (v11 / *(_DWORD *)(*((_QWORD *)this + 1) + 104)));
      v14 = operator new();
      *(_QWORD *)(*((_QWORD *)this + 785) + v10) = v14;
      v15 = *((_QWORD *)this + 781);
      *(_QWORD *)v14 = &off_24FD60620;
      *(_QWORD *)(v14 + 8) = this;
      *(_DWORD *)(v14 + 16) = v11;
      *(_QWORD *)(v14 + 40) = &a3[v13];
      v16 = *(_QWORD *)&a3[v13];
      *(_QWORD *)(v14 + 24) = v15 + (v16 & 0xFFFFFFFFC000) - a2;
      *(_DWORD *)(v14 + 32) = (v16 & 0x3FFF) << 14;
      ++v11;
      v10 += 8;
    }
    while (v12 != v10);
  }
  return v8;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::create(uint64_t a1, int a2, char *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v12;

  v12 = operator new();
  AGXGPURawCounterImpl::SourceImpl::SourceImpl(v12, a1, a2, a3, a4, a5, a6);
  return v12;
}

void sub_22FB044D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348A91CC](v1, 0x10F1C40199935B9);
  _Unwind_Resume(a1);
}

uint64_t AGXGRC_G10::ParseSampleHeader(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return 32;
}

uint64_t AGXGRC_G10::SampleHeaderSize(AGXGRC_G10 *this)
{
  return 32;
}

BOOL AGXGRC_G10::HasMagicToken(unint64_t this)
{
  return HIWORD(this) == 65261;
}

uint64_t AGXGRC_G11::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_G11::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  v3 = 0xFFFFFFFFC004;
  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v4 = a1[3];
  v5 = *a3;
  if (v4 < *a3)
    LODWORD(v5) = 0;
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  v6 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v7 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v6 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v7 & 0x7E00000000) != 0)
  {
    v8 = v7 & 0x600000000;
    if ((v7 & 0x5400000000) != 0)
    {
      if (v8)
      {
        v9 = v6 | 0xFFFFFFFF0001;
        *(_QWORD *)a2 = v9;
        v10 = (v7 >> 4) & 1;
        v11 = v10 | 4;
LABEL_24:
        v15 = a1[v11];
        *(_DWORD *)(a2 + 20) = HIDWORD(v15);
        *(_QWORD *)a2 = v9 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(_QWORD *)(a2 + 24) = v10;
        return 80;
      }
      if ((v7 & 0x1800000000) != 0)
      {
        v9 = v6 | 0xFFFFFFFF4001;
        *(_QWORD *)a2 = v9;
        v10 = (v7 >> 9) & 2;
        v13 = (v7 & 0x100) == 0;
LABEL_18:
        if (!v13)
          v10 = 1;
        v11 = v10 + 6;
        goto LABEL_24;
      }
      v10 = 0;
      v14 = 0xFFFFFFFF8001;
    }
    else
    {
      if (v8)
      {
        v9 = v6 | 0xFFFFFFFF0002;
        *(_QWORD *)a2 = v9;
        v10 = (v7 >> 5) & 1;
        v11 = v10 | 4;
        goto LABEL_24;
      }
      if ((v7 & 0x1800000000) != 0)
      {
        v9 = v6 | 0xFFFFFFFF4002;
        *(_QWORD *)a2 = v9;
        v10 = (v7 >> 10) & 2;
        v13 = (v7 & 0x200) == 0;
        goto LABEL_18;
      }
      v10 = 0;
      v14 = 0xFFFFFFFF8002;
    }
    v9 = v6 | v14;
    *(_QWORD *)a2 = v9;
    v11 = 9;
    goto LABEL_24;
  }
  if ((v7 & 0x100000000) != 0)
  {
    if ((v7 & 1) != 0)
      v3 = 0xFFFFFFFFC005;
    *(_QWORD *)a2 = v6 | v3;
  }
  return 80;
}

uint64_t AGXGRC_G11::SampleHeaderSize(AGXGRC_G11 *this)
{
  return 80;
}

BOOL AGXGRC_G11::HasMagicToken(AGXGRC_G11 *this)
{
  return this == (AGXGRC_G11 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G12::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_G12::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  BOOL v14;
  uint64_t v15;

  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v3 = a1[3];
  v4 = *a3;
  if (v3 < *a3)
    LODWORD(v4) = 0;
  *(_DWORD *)(a2 + 16) = v3 - v4;
  *a3 = v3;
  v5 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v6 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v5 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v6 & 0x7E00000000) != 0)
  {
    v7 = v6 & 0x600000000;
    if ((v6 & 0x5400000000) != 0)
    {
      if (v7)
      {
        v8 = v5 | 0xFFFFFFFF0001;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 4) & 1;
        v10 = v9 | 4;
LABEL_27:
        v15 = a1[v10];
        *(_DWORD *)(a2 + 20) = HIDWORD(v15);
        *(_QWORD *)a2 = v8 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(_QWORD *)(a2 + 24) = v9;
        return 96;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        v8 = v5 | 0xFFFFFFFF4001;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 9) & 2;
        v12 = (v6 & 0x100) == 0;
LABEL_19:
        if (!v12)
          v9 = 1;
        v10 = v9 + 6;
        goto LABEL_27;
      }
      v8 = v5 | 0xFFFFFFFF8001;
      *(_QWORD *)a2 = v8;
      v9 = (v6 >> 18) & 2;
      v14 = (v6 & 0x20000) == 0;
    }
    else
    {
      if (v7)
      {
        v8 = v5 | 0xFFFFFFFF0002;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 5) & 1;
        v10 = v9 | 4;
        goto LABEL_27;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        v8 = v5 | 0xFFFFFFFF4002;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 10) & 2;
        v12 = (v6 & 0x200) == 0;
        goto LABEL_19;
      }
      v8 = v5 | 0xFFFFFFFF8002;
      *(_QWORD *)a2 = v8;
      v9 = (v6 >> 19) & 2;
      v14 = (v6 & 0x40000) == 0;
    }
    if (!v14)
      v9 = 1;
    v10 = v9 + 9;
    goto LABEL_27;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if ((v6 & 1) != 0)
      v11 = v5 | 0xFFFFFFFFC005;
    else
      v11 = v5 | 0xFFFFFFFFC004;
    *(_QWORD *)a2 = v11;
  }
  return 96;
}

uint64_t AGXGRC_G12::SampleHeaderSize(AGXGRC_G12 *this)
{
  return 96;
}

BOOL AGXGRC_G12::HasMagicToken(AGXGRC_G12 *this)
{
  return this == (AGXGRC_G12 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G13::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_G13::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  BOOL v14;
  uint64_t v15;

  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v3 = a1[3];
  v4 = *a3;
  if (v3 < *a3)
    LODWORD(v4) = 0;
  *(_DWORD *)(a2 + 16) = v3 - v4;
  *a3 = v3;
  v5 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v6 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v5 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v6 & 0x7E00000000) != 0)
  {
    v7 = v6 & 0x600000000;
    if ((v6 & 0x5400000000) != 0)
    {
      if (v7)
      {
        v8 = v5 | 0xFFFFFFFF0001;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 4) & 1;
        v10 = v9 | 4;
LABEL_27:
        v15 = a1[v10];
        *(_DWORD *)(a2 + 20) = HIDWORD(v15);
        *(_QWORD *)a2 = v8 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(_QWORD *)(a2 + 24) = v9;
        return 96;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        v8 = v5 | 0xFFFFFFFF4001;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 9) & 2;
        v12 = (v6 & 0x100) == 0;
LABEL_19:
        if (!v12)
          v9 = 1;
        v10 = v9 + 6;
        goto LABEL_27;
      }
      v8 = v5 | 0xFFFFFFFF8001;
      *(_QWORD *)a2 = v8;
      v9 = (v6 >> 18) & 2;
      v14 = (v6 & 0x20000) == 0;
    }
    else
    {
      if (v7)
      {
        v8 = v5 | 0xFFFFFFFF0002;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 5) & 1;
        v10 = v9 | 4;
        goto LABEL_27;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        v8 = v5 | 0xFFFFFFFF4002;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 10) & 2;
        v12 = (v6 & 0x200) == 0;
        goto LABEL_19;
      }
      v8 = v5 | 0xFFFFFFFF8002;
      *(_QWORD *)a2 = v8;
      v9 = (v6 >> 19) & 2;
      v14 = (v6 & 0x40000) == 0;
    }
    if (!v14)
      v9 = 1;
    v10 = v9 + 9;
    goto LABEL_27;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if ((v6 & 1) != 0)
      v11 = v5 | 0xFFFFFFFFC005;
    else
      v11 = v5 | 0xFFFFFFFFC004;
    *(_QWORD *)a2 = v11;
  }
  return 96;
}

uint64_t AGXGRC_G13::SampleHeaderSize(AGXGRC_G13 *this)
{
  return 96;
}

BOOL AGXGRC_G13::HasMagicToken(AGXGRC_G13 *this)
{
  return this == (AGXGRC_G13 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G14::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_G14::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  BOOL v14;
  uint64_t v15;

  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v3 = a1[3];
  v4 = *a3;
  if (v3 < *a3)
    LODWORD(v4) = 0;
  *(_DWORD *)(a2 + 16) = v3 - v4;
  *a3 = v3;
  v5 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v6 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v5 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v6 & 0x7E00000000) != 0)
  {
    v7 = v6 & 0x600000000;
    if ((v6 & 0x5400000000) != 0)
    {
      if (v7)
      {
        v8 = v5 | 0xFFFFFFFF0001;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 4) & 1;
        v10 = v9 | 4;
LABEL_27:
        v15 = a1[v10];
        *(_DWORD *)(a2 + 20) = HIDWORD(v15);
        *(_QWORD *)a2 = v8 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(_QWORD *)(a2 + 24) = v9;
        return 96;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        v8 = v5 | 0xFFFFFFFF4001;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 9) & 2;
        v12 = (v6 & 0x100) == 0;
LABEL_19:
        if (!v12)
          v9 = 1;
        v10 = v9 + 6;
        goto LABEL_27;
      }
      v8 = v5 | 0xFFFFFFFF8001;
      *(_QWORD *)a2 = v8;
      v9 = (v6 >> 18) & 2;
      v14 = (v6 & 0x20000) == 0;
    }
    else
    {
      if (v7)
      {
        v8 = v5 | 0xFFFFFFFF0002;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 5) & 1;
        v10 = v9 | 4;
        goto LABEL_27;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        v8 = v5 | 0xFFFFFFFF4002;
        *(_QWORD *)a2 = v8;
        v9 = (v6 >> 10) & 2;
        v12 = (v6 & 0x200) == 0;
        goto LABEL_19;
      }
      v8 = v5 | 0xFFFFFFFF8002;
      *(_QWORD *)a2 = v8;
      v9 = (v6 >> 19) & 2;
      v14 = (v6 & 0x40000) == 0;
    }
    if (!v14)
      v9 = 1;
    v10 = v9 + 9;
    goto LABEL_27;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if ((v6 & 1) != 0)
      v11 = v5 | 0xFFFFFFFFC005;
    else
      v11 = v5 | 0xFFFFFFFFC004;
    *(_QWORD *)a2 = v11;
  }
  return 96;
}

uint64_t AGXGRC_G14::SampleHeaderSize(AGXGRC_G14 *this)
{
  return 96;
}

BOOL AGXGRC_G14::HasMagicToken(AGXGRC_G14 *this)
{
  return this == (AGXGRC_G14 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G14X::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_G14X::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  BOOL v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v3 = 0xFFFFFFFFC004;
  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v4 = a1[3];
  v5 = *a3;
  if (v4 < *a3)
    LODWORD(v5) = 0;
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  v6 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v7 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v6 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    v8 = WORD1(v7) & 0x3F;
    v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      v12 = (v7 & 0x3000000000) == 0;
      v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        v11 = 9;
      }
      else
      {
        v10 = 0xFFFFFFFF4001;
        v11 = 6;
      }
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0001;
    }
    else
    {
      v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0)
        v10 = 0xFFFFFFFF4002;
      else
        v10 = 0xFFFFFFFF8002;
      if (v14)
        v11 = 9;
      else
        v11 = 6;
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0002;
    }
    if (v12)
      v15 = v11;
    else
      v15 = 4;
    v16 = v6 | v10;
    *(_QWORD *)a2 = v16;
    v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 20) = HIDWORD(v17);
    *(_QWORD *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(_QWORD *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if ((v7 & 1) != 0)
        v3 = 0xFFFFFFFFC005;
      *(_QWORD *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_G14X::SampleHeaderSize(AGXGRC_G14X *this)
{
  return 96;
}

BOOL AGXGRC_G14X::HasMagicTokenTMB(AGXGRC_G14X *this)
{
  return this == (AGXGRC_G14X *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G14X::ParseSampleHeaderInherited(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = 0xFFFFFFFFC004;
  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v4 = a1[3];
  v5 = *a3;
  if (v4 < *a3)
    LODWORD(v5) = 0;
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  v6 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v7 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v6 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    v8 = (v7 >> 16) & 0x3F;
    v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      v10 = (v7 & 0x3000000000) == 0;
      v11 = 0xFFFFFFFF8001;
      if (!v10)
        v11 = 0xFFFFFFFF4001;
      if (v9)
        v11 = 0xFFFFFFFF0001;
    }
    else
    {
      if ((v7 & 0x3000000000) != 0)
        v11 = 0xFFFFFFFF4002;
      else
        v11 = 0xFFFFFFFF8002;
      if (v9)
        v11 = 0xFFFFFFFF0002;
    }
    v13 = v11 | v6;
    *(_QWORD *)a2 = v13;
    v14 = (unsigned __int16)v11 >> 14;
    v15 = 4;
    if (v14)
      v15 = 5;
    v10 = v14 == 2;
    v16 = 6;
    if (!v10)
      v16 = v15;
    v17 = a1[v16];
    *(_DWORD *)(a2 + 20) = HIDWORD(v17);
    *(_QWORD *)a2 = v13 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(_QWORD *)(a2 + 24) = v8;
    return 56;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if ((v7 & 1) != 0)
        v3 = 0xFFFFFFFFC005;
      *(_QWORD *)a2 = v6 | v3;
    }
    return 56;
  }
}

uint64_t AGXGRC_G14X::SampleHeaderSizeInherited(AGXGRC_G14X *this)
{
  return 56;
}

BOOL AGXGRC_G14X::HasMagicTokenBMPR(unint64_t this)
{
  return (this & 0x36F0FFFFF3FFFLL) == 0x14B0987650321;
}

uint64_t AGXGRC_G15::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_G15::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  BOOL v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v3 = 0xFFFFFFFFC004;
  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v4 = a1[3];
  v5 = *a3;
  if (v4 < *a3)
    LODWORD(v5) = 0;
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  v6 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v7 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v6 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    v8 = WORD1(v7) & 0x3F;
    v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      v12 = (v7 & 0x3000000000) == 0;
      v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        v11 = 9;
      }
      else
      {
        v10 = 0xFFFFFFFF4001;
        v11 = 6;
      }
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0001;
    }
    else
    {
      v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0)
        v10 = 0xFFFFFFFF4002;
      else
        v10 = 0xFFFFFFFF8002;
      if (v14)
        v11 = 9;
      else
        v11 = 6;
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0002;
    }
    if (v12)
      v15 = v11;
    else
      v15 = 4;
    v16 = v6 | v10;
    *(_QWORD *)a2 = v16;
    v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 20) = HIDWORD(v17);
    *(_QWORD *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(_QWORD *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if ((v7 & 1) != 0)
        v3 = 0xFFFFFFFFC005;
      *(_QWORD *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_G15::SampleHeaderSize(AGXGRC_G15 *this)
{
  return 96;
}

BOOL AGXGRC_G15::HasMagicToken(AGXGRC_G15 *this)
{
  return this == (AGXGRC_G15 *)0xFEEDCBA987654321;
}

_QWORD *AGXGPURawCounterImpl::SourceAPSImpl::create(uint64_t a1, int a2, char *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  _QWORD *v12;

  v12 = (_QWORD *)operator new();
  AGXGPURawCounterImpl::SourceImpl::SourceImpl((uint64_t)v12, a1, a2, a3, a4, a5, a6);
  *v12 = &off_24FD60660;
  v12[796] = 0;
  v12[798] = 0;
  v12[797] = 0;
  *(_QWORD *)((char *)v12 + 6390) = 0;
  return v12;
}

void sub_22FB05228(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348A91CC](v1, 0x10F1C408E495BD6);
  _Unwind_Resume(a1);
}

uint64_t AGXGRC_G16::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_G16::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  BOOL v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v3 = 0xFFFFFFFFC004;
  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v4 = a1[3];
  v5 = *a3;
  if (v4 < *a3)
    LODWORD(v5) = 0;
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  v6 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v7 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v6 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    v8 = WORD1(v7) & 0x3F;
    v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      v12 = (v7 & 0x3000000000) == 0;
      v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        v11 = 9;
      }
      else
      {
        v10 = 0xFFFFFFFF4001;
        v11 = 6;
      }
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0001;
    }
    else
    {
      v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0)
        v10 = 0xFFFFFFFF4002;
      else
        v10 = 0xFFFFFFFF8002;
      if (v14)
        v11 = 9;
      else
        v11 = 6;
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0002;
    }
    if (v12)
      v15 = v11;
    else
      v15 = 4;
    v16 = v6 | v10;
    *(_QWORD *)a2 = v16;
    v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 20) = HIDWORD(v17);
    *(_QWORD *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(_QWORD *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if ((v7 & 1) != 0)
        v3 = 0xFFFFFFFFC005;
      *(_QWORD *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_G16::SampleHeaderSize(AGXGRC_G16 *this)
{
  return 96;
}

BOOL AGXGRC_G16::HasMagicToken(AGXGRC_G16 *this)
{
  return this == (AGXGRC_G16 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_HAL200::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

uint64_t AGXGRC_HAL200::ParseSampleHeader(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  BOOL v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v3 = 0xFFFFFFFFC004;
  *(_QWORD *)a2 = *(_QWORD *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(_QWORD *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  v4 = a1[3];
  v5 = *a3;
  if (v4 < *a3)
    LODWORD(v5) = 0;
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  v6 = *(_QWORD *)a2 & 0xFFFFFFFFFFFF3FF0;
  v7 = a1[1];
  *(_DWORD *)(a2 + 20) = -1;
  *(_QWORD *)a2 = v6 | 0xFFFFFFFFC000;
  *(_QWORD *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    v8 = WORD1(v7) & 0x3F;
    v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      v12 = (v7 & 0x3000000000) == 0;
      v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        v11 = 9;
      }
      else
      {
        v10 = 0xFFFFFFFF4001;
        v11 = 6;
      }
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0001;
    }
    else
    {
      v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0)
        v10 = 0xFFFFFFFF4002;
      else
        v10 = 0xFFFFFFFF8002;
      if (v14)
        v11 = 9;
      else
        v11 = 6;
      v12 = v9 == 0;
      if (v9)
        v10 = 0xFFFFFFFF0002;
    }
    if (v12)
      v15 = v11;
    else
      v15 = 4;
    v16 = v6 | v10;
    *(_QWORD *)a2 = v16;
    v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 20) = HIDWORD(v17);
    *(_QWORD *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(_QWORD *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if ((v7 & 1) != 0)
        v3 = 0xFFFFFFFFC005;
      *(_QWORD *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_HAL200::SampleHeaderSize(AGXGRC_HAL200 *this)
{
  return 96;
}

BOOL AGXGRC_HAL200::HasMagicToken(AGXGRC_HAL200 *this)
{
  return this == (AGXGRC_HAL200 *)0xFEEDCBA987654321;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOGPUDeviceCreate()
{
  return MEMORY[0x24BE51528]();
}

uint64_t IOGPUDeviceGetConnect()
{
  return MEMORY[0x24BE51538]();
}

uint64_t IOGPUDeviceGetName()
{
  return MEMORY[0x24BE51540]();
}

uint64_t IOGPUDeviceRelease()
{
  return MEMORY[0x24BE51550]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void operator delete(void *__p)
{
  off_24FD5FEE0(__p);
}

uint64_t operator delete()
{
  return off_24FD5FEE8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24FD5FEF0(__sz);
}

uint64_t operator new()
{
  return off_24FD5FEF8();
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x24BDAD318](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

void sys_dcache_flush(void *start, size_t len)
{
  MEMORY[0x24BDB00C8](start, len);
}

